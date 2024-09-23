@implementation VCPPoolBasedPixelBufferCreator

- (VCPPoolBasedPixelBufferCreator)initWithBufferWidth:(int64_t)a3 bufferHeight:(int64_t)a4 andPixelFormat:(unsigned int)a5
{
  VCPPoolBasedPixelBufferCreator *v8;
  VCPPoolBasedPixelBufferCreator *v9;
  VCPPoolBasedPixelBufferCreator *v10;
  int64_t bufferWidth;
  int64_t bufferHeight;
  unsigned int pixelFormat;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCPPoolBasedPixelBufferCreator;
  v8 = -[VCPPoolBasedPixelBufferCreator init](&v15, sel_init);
  v9 = v8;
  if (!v8 || (v8->_bufferWidth = a3, v8->_bufferHeight = a4, v8->_pixelFormat = a5, a3) && a4 && a5)
  {
    v10 = v8;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      bufferWidth = v9->_bufferWidth;
      bufferHeight = v9->_bufferHeight;
      pixelFormat = v9->_pixelFormat;
      *(_DWORD *)buf = 67109632;
      v17 = bufferWidth;
      v18 = 1024;
      v19 = bufferHeight;
      v20 = 1024;
      v21 = pixelFormat;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "invalid buffer size %dx%d or pixel format %u", buf, 0x14u);
    }
    v10 = 0;
  }

  return v10;
}

- (int)_createPixelBufferPool:(__CVPixelBufferPool *)a3 withBufferWidth:(int64_t)a4 bufferHeight:(int64_t)a5 andPixelFormat:(unsigned int)a6
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v6 = *(_QWORD *)&a6;
  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0CA90E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E0CA9040];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = *MEMORY[0x1E0CA8FF0];
  v15[2] = v11;
  v15[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = CVPixelBufferPoolCreate(0, 0, v12, a3);
  return (int)v9;
}

- (int)createPixelBuffer:(__CVBuffer *)a3
{
  VCPPoolBasedPixelBufferCreator *v4;
  __CVPixelBufferPool *value;
  CVReturn PixelBuffer;

  v4 = self;
  objc_sync_enter(v4);
  value = v4->_pool.value_;
  if (!value)
  {
    PixelBuffer = -[VCPPoolBasedPixelBufferCreator _createPixelBufferPool:withBufferWidth:bufferHeight:andPixelFormat:](v4, "_createPixelBufferPool:withBufferWidth:bufferHeight:andPixelFormat:", &v4->_pool, v4->_bufferWidth, v4->_bufferHeight, v4->_pixelFormat);
    if (PixelBuffer)
      goto LABEL_4;
    value = v4->_pool.value_;
  }
  PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, value, a3);
LABEL_4:
  objc_sync_exit(v4);

  return PixelBuffer;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pool.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
