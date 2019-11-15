Pod::Spec.new do |s|
  s.name                = "yhlibwebp"
  s.version             = "1.0.2"
  s.summary             = "Asynchronous image downloader"
  s.homepage            = "https://www.yohen.me"
  s.author              = { "yohen" => "yohenpeng@gmail.com"}
  s.source              = { :git => "https://github.com/yohenpeng/YHLibwebp.git", :tag => "#{s.version}" }
  s.description         = "用于支持SDWebImage加载webp格式图片"
  s.license             = "MIT"
  s.compiler_flags      = "-D_THREAD_SAFE"
  s.requires_arc        = false
  s.pod_target_xcconfig = {  "USER_HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/yhlibwebp/**" }
  s.xcconfig            = {'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1'}

  s.subspec 'webp' do |a|
    a.source_files = 'src/webp/*.h'
    a.header_dir = 'webp'
  end

  s.subspec 'core' do |a|
    a.source_files = "src/utils/*.{h,c}", "src/dsp/*.{h,c}", "src/enc/*.{h,c}", "src/dec/*.{h,c}"
    a.dependency 'yhlibwebp/webp'
  end
  
  s.subspec 'utils' do |a|
    a.dependency 'yhlibwebp/core'
  end

  s.subspec 'enc' do |a|
    a.dependency 'yhlibwebp/core'
  end

  s.subspec 'dec' do |a|
    a.dependency 'yhlibwebp/core'
  end
  
  s.subspec 'demux' do |a|
    a.source_files = 'src/demux/*{h,c}'
    a.dependency 'yhlibwebp/core'
  end

  s.subspec 'mux' do |a|
    a.source_files = 'src/mux/*{h,c}'
    a.dependency 'yhlibwebp/core'
  end
end
