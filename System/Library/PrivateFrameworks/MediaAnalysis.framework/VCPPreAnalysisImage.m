@implementation VCPPreAnalysisImage

- (VCPPreAnalysisImage)initWithPixelBuffer:(__CVBuffer *)a3
{
  VCPPreAnalysisImage *v4;
  uint64_t v5;
  NSMutableDictionary *scaledPixelBuffers;
  void *v7;
  size_t Width;
  void *v9;
  VCPPreAnalysisImageEntry *v10;
  CFTypeRef v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPPreAnalysisImage;
  v4 = -[VCPPreAnalysisImage init](&v13, sel_init);
  if (v4)
  {
    v12 = CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&v4->_sourcePixelBuffer.value_, &v12);
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    scaledPixelBuffers = v4->_scaledPixelBuffers;
    v4->_scaledPixelBuffers = (NSMutableDictionary *)v5;

    v7 = (void *)MEMORY[0x1E0CB3B18];
    Width = CVPixelBufferGetWidth(a3);
    objc_msgSend(v7, "valueWithSize:", (double)Width, (double)CVPixelBufferGetHeight(a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VCPPreAnalysisImageEntry initWithPixelBuffer:]([VCPPreAnalysisImageEntry alloc], "initWithPixelBuffer:", v4->_sourcePixelBuffer.value_);
    -[VCPPreAnalysisImageEntry setCount:](v10, "setCount:", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_scaledPixelBuffers, "setObject:forKeyedSubscript:", v10, v9);

  }
  return v4;
}

- (__CVBuffer)sourcePixelBuffer
{
  return self->_sourcePixelBuffer.value_;
}

- (int)preWarmWidth:(unint64_t)a3 andHeight:(unint64_t)a4
{
  VCPPreAnalysisImage *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  VCPPreAnalysisImageEntry *v12;
  VCPPreAnalysisImageEntry *v13;
  CFTypeRef cf;

  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", (double)a3, (double)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v6->_scaledPixelBuffers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    cf = 0;
    +[VCPSceneProcessingImageManager imageManager](VCPSceneProcessingImageManager, "imageManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "scalePixelBuffer:toPixelBuffer:width:height:", v6->_sourcePixelBuffer.value_, &cf, a3, a4);

    if (v9)
    {
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      goto LABEL_5;
    }
    v12 = [VCPPreAnalysisImageEntry alloc];
    v13 = -[VCPPreAnalysisImageEntry initWithPixelBuffer:](v12, "initWithPixelBuffer:", cf);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_scaledPixelBuffers, "setObject:forKeyedSubscript:", v13, v7);

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  v9 = 0;
LABEL_5:

  objc_sync_exit(v6);
  return v9;
}

- (int)pixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  VCPPreAnalysisImage *v8;
  void *v9;
  VCPPreAnalysisImageEntry *v10;
  int v11;
  void *v12;
  __CVBuffer *value;
  NSMutableDictionary *scaledPixelBuffers;
  VCPPreAnalysisImageEntry *v16;
  CFTypeRef cf;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", (double)a4, (double)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_scaledPixelBuffers, "objectForKeyedSubscript:", v9);
  v10 = (VCPPreAnalysisImageEntry *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LODWORD(cf) = 67109376;
      HIDWORD(cf) = a4;
      v18 = 1024;
      v19 = a5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PreAnalysis] Image not pre-warmed; creating on-demand (%dx%d)",
        (uint8_t *)&cf,
        0xEu);
    }
    +[VCPSceneProcessingImageManager imageManager](VCPSceneProcessingImageManager, "imageManager", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    value = v8->_sourcePixelBuffer.value_;
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    v11 = objc_msgSend(v12, "scalePixelBuffer:toPixelBuffer:width:height:", value, &cf, a4, a5);

    if (v11)
    {
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      goto LABEL_10;
    }
    scaledPixelBuffers = v8->_scaledPixelBuffers;
    v16 = [VCPPreAnalysisImageEntry alloc];
    v10 = -[VCPPreAnalysisImageEntry initWithPixelBuffer:](v16, "initWithPixelBuffer:", cf);
    -[NSMutableDictionary setObject:forKeyedSubscript:](scaledPixelBuffers, "setObject:forKeyedSubscript:", v10, v9);
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  -[VCPPreAnalysisImageEntry setCount:](v10, "setCount:", -[VCPPreAnalysisImageEntry count](v10, "count", cf) + 1);
  *a3 = (__CVBuffer *)CFRetain(-[VCPPreAnalysisImageEntry pixelBuffer](v10, "pixelBuffer"));

  v11 = 0;
LABEL_10:

  objc_sync_exit(v8);
  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sourcePixelBuffer.value_);
  objc_storeStrong((id *)&self->_scaledPixelBuffers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
