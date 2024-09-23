@implementation VCAudioStreamReceiveGroupConfig

- (VCAudioStreamReceiveGroupConfig)init
{
  VCAudioStreamReceiveGroupConfig *v2;
  VCAudioStreamGroupCommonConfig *v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStreamReceiveGroupConfig;
  v2 = -[VCMediaStreamGroupConfig init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VCAudioStreamGroupCommonConfig);
    v2->_audioStreamGroupConfig = v3;
    if (!v3)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamReceiveGroupConfig init].cold.1(v5, v6);
      }
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamReceiveGroupConfig;
  -[VCMediaStreamGroupConfig dealloc](&v3, sel_dealloc);
}

- (VCAudioStreamGroupCommonConfig)audioStreamGroupConfig
{
  return (VCAudioStreamGroupCommonConfig *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAudioStreamGroupConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void)init
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
  v5 = "-[VCAudioStreamReceiveGroupConfig init]";
  v6 = 1024;
  v7 = 23;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate _audioStreamGroupConfig", (uint8_t *)&v2, 0x1Cu);
}

@end
