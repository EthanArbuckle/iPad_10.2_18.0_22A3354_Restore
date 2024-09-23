@implementation VideoScaler

- (VideoScaler)init
{
  VideoScaler *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VideoScaler;
  v2 = -[VideoScaler init](&v4, sel_init);
  if (v2)
    v2->_pixelTransferSession = objc_alloc_init(VCPixelTransferSession);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VideoScaler;
  -[VideoScaler dealloc](&v3, sel_dealloc);
}

- (int)convertAndScalePixelBuffer:(__CVBuffer *)a3 toWidth:(int)a4 toHeight:(int)a5 withPixelFormat:(unsigned int)a6 usingPixelBufferPool:(__CVPixelBufferPool *)a7 andStoreTo:(__CVBuffer *)a8
{
  uint64_t v13;
  NSObject *v14;
  int v15;
  size_t Width;
  size_t Height;
  uint64_t v19;
  NSObject *v20;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  size_t v31;
  __int16 v32;
  size_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a7, &pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:].cold.1(v13, v14);
    }
    return 51;
  }
  else
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D88], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F18], kCVAttachmentMode_ShouldPropagate);
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v15 = VCPixelTransferSession_TransferPixelBuffer((uint64_t)self->_pixelTransferSession, a3, pixelBufferOut);
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316930;
          v23 = v19;
          v24 = 2080;
          v25 = "-[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:]";
          v26 = 1024;
          v27 = 81;
          v28 = 1024;
          v29 = v15;
          v30 = 2048;
          v31 = Width;
          v32 = 2048;
          v33 = Height;
          v34 = 1024;
          v35 = a4;
          v36 = 1024;
          v37 = a5;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTPixelTransferSessionTransferImage failed %d input widthxheight(%zux%zu) new widthxheight(%dx%d)", buf, 0x42u);
        }
      }
    }
    else
    {
      *a8 = pixelBufferOut;
    }
  }
  return v15;
}

- (void)convertAndScalePixelBuffer:(uint64_t)a1 toWidth:(NSObject *)a2 toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:]";
  v6 = 1024;
  v7 = 54;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d CVPixelBufferPoolCreatePixelBuffer failed", (uint8_t *)&v2, 0x1Cu);
}

@end
