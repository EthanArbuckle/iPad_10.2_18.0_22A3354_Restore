@implementation AVCVideoFrame

- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5
{
  char *v8;
  int64_t var3;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVCVideoFrame;
  v8 = -[AVCVideoFrame init](&v11, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = CVPixelBufferRetain(a3);
    var3 = a4->var3;
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v8 + 5) = var3;
    *((_QWORD *)v8 + 6) = a5;
    *((_DWORD *)v8 + 16) = 0;
  }
  return (AVCVideoFrame *)v8;
}

- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5 imageData:(id)a6 delegate:(id)a7
{
  AVCVideoFrame *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = *a5;
  v9 = -[AVCVideoFrame initWithPixelBuffer:time:imageData:](self, "initWithPixelBuffer:time:imageData:", a3, &v11, a6);
  if (v9)
  {
    v9->_depthPixelBuffer = CVPixelBufferRetain(a4);
    objc_storeWeak(&v9->_delegate, a7);
  }
  return v9;
}

- (void)setDepthPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __CVBuffer *depthPixelBuffer;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  __CVBuffer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v5;
        v11 = 2080;
        v12 = "-[AVCVideoFrame setDepthPixelBuffer:]";
        v13 = 1024;
        v14 = 47;
        v15 = 2112;
        v16 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d depthPixelBuffer=%@", (uint8_t *)&v9, 0x26u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVideoFrame setDepthPixelBuffer:].cold.1();
    }
  }
  depthPixelBuffer = self->_depthPixelBuffer;
  if (depthPixelBuffer)
  {
    CVPixelBufferRelease(depthPixelBuffer);
    self->_depthPixelBuffer = 0;
  }
  if (a3)
    self->_depthPixelBuffer = CVPixelBufferRetain(a3);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __CVBuffer *pixelBuffer;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  __CVBuffer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v5;
        v11 = 2080;
        v12 = "-[AVCVideoFrame setPixelBuffer:]";
        v13 = 1024;
        v14 = 59;
        v15 = 2112;
        v16 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d pixelBuffer=%@", (uint8_t *)&v9, 0x26u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVideoFrame setPixelBuffer:].cold.1();
    }
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  if (a3)
    self->_pixelBuffer = CVPixelBufferRetain(a3);
}

- (void)dealloc
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
  v5 = "-[AVCVideoFrame dealloc]";
  v6 = 1024;
  v7 = 71;
  _os_log_debug_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
  objc_copyStruct(&self->_time, a3, 24, 1, 0);
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)effectsMetadata
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEffectsMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (float)renderProcessTime
{
  return self->_renderProcessTime;
}

- (void)setRenderProcessTime:(float)a3
{
  self->_renderProcessTime = a3;
}

- (__CVBuffer)depthPixelBuffer
{
  return self->_depthPixelBuffer;
}

- (void)setDepthPixelBuffer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d depthPixelBuffer=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setPixelBuffer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d pixelBuffer=%@");
  OUTLINED_FUNCTION_3();
}

@end
