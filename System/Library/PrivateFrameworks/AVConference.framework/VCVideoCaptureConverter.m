@implementation VCVideoCaptureConverter

- (VCVideoCaptureConverter)initWithConvertedFrameHandler:(void *)a3 context:(id)a4
{
  VCVideoCaptureConverter *v6;
  VCVideoCaptureConverter *v7;
  uint64_t v8;
  NSObject *v9;
  VCVideoCaptureConverter *convertedFrameHandlerContext;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  VCVideoCaptureConverter *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCVideoCaptureConverter;
  v6 = -[VCVideoCaptureConverter init](&v18, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  if (!a3)
  {
    if ((VCVideoCaptureConverter *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoCaptureConverter initWithConvertedFrameHandler:context:].cold.1();
      }
      goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCVideoCaptureConverter performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_27;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 136316162;
    v20 = v14;
    v21 = 2080;
    v22 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
    v23 = 1024;
    v24 = 33;
    v25 = 2112;
    v26 = (void *)v12;
    v27 = 2048;
    v28 = v7;
    v16 = " [%s] %s:%d %@(%p) Provided handler is NULL";
    goto LABEL_29;
  }
  if (!a4)
  {
    if ((VCVideoCaptureConverter *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoCaptureConverter initWithConvertedFrameHandler:context:].cold.2();
      }
      goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCVideoCaptureConverter performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v17 = VRTraceErrorLogLevelToCSTR(),
          v15 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_27:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v20 = v17;
    v21 = 2080;
    v22 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
    v23 = 1024;
    v24 = 34;
    v25 = 2112;
    v26 = (void *)v13;
    v27 = 2048;
    v28 = v7;
    v16 = " [%s] %s:%d %@(%p) Provided context is NULL";
LABEL_29:
    _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x30u);
    goto LABEL_27;
  }
  v6->_convertedFrameHandler = a3;
  objc_storeWeak(&v6->_convertedFrameHandlerContext, a4);
  v7->_lastDestinationFrameCount = -1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      convertedFrameHandlerContext = (VCVideoCaptureConverter *)v7->_convertedFrameHandlerContext;
      *(_DWORD *)buf = 136316162;
      v20 = v8;
      v21 = 2080;
      v22 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
      v23 = 1024;
      v24 = 38;
      v25 = 2048;
      v26 = v7;
      v27 = 2048;
      v28 = convertedFrameHandlerContext;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], convertedFrameHandlerContext=%p", buf, 0x30u);
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_convertedFrameHandlerContext, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoCaptureConverter;
  -[VCVideoCaptureConverter dealloc](&v3, sel_dealloc);
}

- (void)setSourceFramerate:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned int sourceFramerate;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  VCVideoCaptureConverter *v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_sourceFramerate == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        sourceFramerate = self->_sourceFramerate;
        v10 = 136316162;
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCVideoCaptureConverter setSourceFramerate:]";
        v14 = 1024;
        v15 = 56;
        v16 = 2048;
        v17 = self;
        v18 = 1024;
        v19 = sourceFramerate;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], Source frame rate is already at %u", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  else
  {
    self->_sourceFramerate = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_sourceFramerate;
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCVideoCaptureConverter setSourceFramerate:]";
        v14 = 1024;
        v15 = 59;
        v16 = 2048;
        v17 = self;
        v18 = 1024;
        v19 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], Source frame rate set to %u", (uint8_t *)&v10, 0x2Cu);
      }
    }
    -[VCVideoCaptureConverter updateThrottleRate](self, "updateThrottleRate");
  }
}

- (void)setDestinationFramerate:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCVideoCaptureConverter *v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCVideoCaptureConverter setDestinationFramerate:]";
      v11 = 1024;
      v12 = 65;
      v13 = 2048;
      v14 = self;
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], setting destination frame rate to %d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  self->_destinationFramerate = a3;
  -[VCVideoCaptureConverter updateThrottleRate](self, "updateThrottleRate");
}

- (BOOL)processFrame:(opaqueCMSampleBuffer *)a3
{
  unsigned int sourceFrameCount;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  if (!self->_isThrottling)
    return 1;
  sourceFrameCount = self->_sourceFrameCount;
  v4 = sourceFrameCount + 1;
  v5 = ((double)sourceFrameCount / self->_throttleRate);
  v6 = self->_lastDestinationFrameCount != v5;
  self->_sourceFrameCount = v4;
  self->_lastDestinationFrameCount = v5;
  return v6;
}

- (void)updateThrottleRate
{
  unsigned int sourceFramerate;
  unsigned int destinationFramerate;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  double throttleRate;
  _BOOL4 isThrottling;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCVideoCaptureConverter *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  destinationFramerate = self->_destinationFramerate;
  sourceFramerate = self->_sourceFramerate;
  if (sourceFramerate <= destinationFramerate)
  {
    v5 = 0;
  }
  else
  {
    self->_throttleRate = (double)sourceFramerate / (double)destinationFramerate;
    v5 = 1;
  }
  self->_isThrottling = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_destinationFramerate;
      v8 = self->_sourceFramerate;
      throttleRate = self->_throttleRate;
      isThrottling = self->_isThrottling;
      v12 = 136316930;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCVideoCaptureConverter updateThrottleRate]";
      v16 = 1024;
      v17 = 87;
      v18 = 2048;
      v19 = self;
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v9;
      v24 = 2048;
      v25 = throttleRate;
      v26 = 1024;
      v27 = isThrottling;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], _sourceFramerate=%u, _destinationFramerate=%u, _throttleRate=%f, _isThrottling=%d", (uint8_t *)&v12, 0x42u);
    }
  }
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  return 0;
}

- (void)avConferencePreviewError:(id)a3
{
  uint64_t v4;
  NSObject *v5;

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoCaptureConverter avConferencePreviewError:].cold.1(v4, a3, v5);
  }
}

- (id)clientCaptureRule
{
  return 0;
}

- (unsigned)sourceFramerate
{
  return self->_sourceFramerate;
}

- (unsigned)destinationFramerate
{
  return self->_destinationFramerate;
}

- (void)initWithConvertedFrameHandler:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Provided handler is NULL", v2, v3, v4, v5, 2u);
}

- (void)initWithConvertedFrameHandler:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Provided context is NULL", v2, v3, v4, v5, 2u);
}

- (void)avConferencePreviewError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCVideoCaptureConverter avConferencePreviewError:]";
  v8 = 1024;
  v9 = 104;
  v10 = 2080;
  v11 = objc_msgSend(a2, "UTF8String");
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d received an error %s", (uint8_t *)&v4, 0x26u);
}

@end
