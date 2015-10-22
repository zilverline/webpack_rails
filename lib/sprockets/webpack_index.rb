require 'sprockets'
require 'sprockets/index'

module Sprockets
  class WebpackIndex < Sprockets::Index
    def find_asset(*args)
      if @environment.webpack_config[:dev_server]
        # ensure webpack-dev-server is running
        WebpackRails::Task.run_webpack(@environment.webpack_config)
      end

      super
    end
  end
end
