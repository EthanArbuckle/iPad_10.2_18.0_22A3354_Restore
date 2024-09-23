@implementation VCCellularAudioTapIO

- (VCCellularAudioTapIO)initWithStreamToken:(int64_t)a3 powerSpectrumSource:(id)a4 tapType:(unsigned int)a5
{
  VCCellularAudioTapIO *v8;
  VCAudioPowerSpectrumSource *v9;
  uint64_t v10;
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
  const __CFString *v26;
  __int16 v27;
  VCCellularAudioTapIO *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCCellularAudioTapIO;
  v8 = -[VCCellularAudioTapIO init](&v18, sel_init);
  if (v8)
  {
    if (a3)
    {
      v9 = (VCAudioPowerSpectrumSource *)a4;
      v8->_powerSpectrumSource = v9;
      if (v9)
      {
        v10 = -[VCAudioPowerSpectrumSource realtimeContext](v9, "realtimeContext");
        v8->_realtimeContext.streamToken = a3;
        v8->_realtimeContext.tapType = a5;
        v8->_realtimeContext.powerSpectrumSourceRealtimeContext = (_VCAudioPowerSpectrumSourceRealtimeContext *)v10;
        v8->_realtimeContext.mediaRecorder = 0;
        v8->_realtimeContext.averageAudioPower = 0.0;
        return v8;
      }
      if ((VCCellularAudioTapIO *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:].cold.2();
        }
        goto LABEL_25;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCCellularAudioTapIO performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v17 = VRTraceErrorLogLevelToCSTR(),
            v15 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_25:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v20 = v17;
      v21 = 2080;
      v22 = "-[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:]";
      v23 = 1024;
      v24 = 30;
      v25 = 2112;
      v26 = v13;
      v27 = 2048;
      v28 = v8;
      v16 = " [%s] %s:%d %@(%p) The power spectrum is nil";
    }
    else
    {
      if ((VCCellularAudioTapIO *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:].cold.1();
        }
        goto LABEL_25;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCCellularAudioTapIO performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_25;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 136316162;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:]";
      v23 = 1024;
      v24 = 27;
      v25 = 2112;
      v26 = v12;
      v27 = 2048;
      v28 = v8;
      v16 = " [%s] %s:%d %@(%p) Invalid stream token";
    }
    _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x30u);
    goto LABEL_25;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCellularAudioTapIO;
  -[VCCellularAudioTapIO dealloc](&v3, sel_dealloc);
}

- (tagVCCellularAudioTapIORealtimeContext)realtimeContext
{
  return &self->_realtimeContext;
}

- (int64_t)streamToken
{
  return self->_realtimeContext.streamToken;
}

- (void)setMediaRecorder:(id)a3
{
  VCMediaRecorder *mediaRecorder;

  mediaRecorder = self->_realtimeContext.mediaRecorder;
  if (mediaRecorder != a3)
  {

    self->_realtimeContext.mediaRecorder = (VCMediaRecorder *)a3;
  }
}

- (VCMediaRecorder)mediaRecorder
{
  return self->_realtimeContext.mediaRecorder;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (void)setAudioIO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (VCAudioPowerSpectrumSource)powerSpectrumSource
{
  return self->_powerSpectrumSource;
}

- (void)initWithStreamToken:powerSpectrumSource:tapType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid stream token", v2, v3, v4, v5, 2u);
}

- (void)initWithStreamToken:powerSpectrumSource:tapType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The power spectrum is nil", v2, v3, v4, v5, 2u);
}

@end
