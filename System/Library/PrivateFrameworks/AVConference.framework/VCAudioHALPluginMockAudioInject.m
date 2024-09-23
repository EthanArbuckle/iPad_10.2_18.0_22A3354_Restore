@implementation VCAudioHALPluginMockAudioInject

- (VCAudioHALPluginMockAudioInject)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  char *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  const __CFString *v9;
  VCCannedAudioInjectorConfig *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  VCCannedAudioInjector *v19;
  unsigned int samplesPerFrame;
  __int128 v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  VCDispatchTimer *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _OWORD v45[2];
  uint64_t v46;
  objc_super v47;
  _BYTE buf[40];
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)VCAudioHALPluginMockAudioInject;
  v4 = -[VCAudioHALPluginMockAudioInject init](&v47, sel_init);
  if (!v4)
  {
LABEL_39:
    v10 = 0;
    goto LABEL_40;
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginMockAudioInject-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 36;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-init (%p)", buf, 0x26u);
    }
  }
  if (!a3)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginMockAudioInject initWithConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 37;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v30;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) invalid config", buf, 0x30u);
        }
      }
    }
    goto LABEL_39;
  }
  v7 = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
  v8 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
  *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->sinkFormat.format.mBitsPerChannel;
  *(_OWORD *)(v4 + 24) = v8;
  *(_OWORD *)(v4 + 8) = v7;
  *((_QWORD *)v4 + 7) = a3->sinkContext;
  *((_QWORD *)v4 + 8) = a3->sinkProc;
  *((_DWORD *)v4 + 32) = 3;
  if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceEnableAudioHALPluginMockInput"), 0))
  {
    v10 = 0;
    goto LABEL_41;
  }
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 44;
    v13 = " [%s] %s:%d Using AudioHALPlugin mock input for testing";
    v14 = v12;
    v15 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 44;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v9;
    *(_WORD *)&buf[38] = 2048;
    v49 = v4;
    v13 = " [%s] %s:%d %@(%p) Using AudioHALPlugin mock input for testing";
    v14 = v17;
    v15 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_19:
  v10 = objc_alloc_init(VCCannedAudioInjectorConfig);
  v18 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
  v45[0] = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
  v45[1] = v18;
  v46 = *(_QWORD *)&a3->sinkFormat.format.mBitsPerChannel;
  -[VCCannedAudioInjectorConfig setAudioFormat:](v10, "setAudioFormat:", v45);
  -[VCCannedAudioInjectorConfig setSineWaveFrequencyHz:](v10, "setSineWaveFrequencyHz:", 440);
  if (-[VCCannedAudioInjectorConfig isValid](v10, "isValid"))
  {
    v19 = -[VCCannedAudioInjector initWithConfig:]([VCCannedAudioInjector alloc], "initWithConfig:", v10);
    *((_QWORD *)v4 + 19) = v19;
    if (!v19)
    {
      if ((char *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioHALPluginMockAudioInject initWithConfig:].cold.2();
        }
        goto LABEL_40;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
      else
        v34 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v39;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 50;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v34;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          v38 = " [%s] %s:%d %@(%p) could not allocate canned audio injector";
          goto LABEL_69;
        }
      }
LABEL_40:

      v10 = (VCCannedAudioInjectorConfig *)v4;
      v4 = 0;
      goto LABEL_41;
    }
    samplesPerFrame = a3->sinkFormat.samplesPerFrame;
    v21 = *(_OWORD *)&a3->sinkFormat.format.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&a3->sinkFormat.format.mSampleRate;
    *(_OWORD *)&buf[16] = v21;
    *(_QWORD *)&buf[32] = *(_QWORD *)&a3->sinkFormat.format.mBitsPerChannel;
    VCAudioBufferList_Allocate((__int128 *)buf, samplesPerFrame, (_QWORD *)v4 + 20);
    if (!*((_QWORD *)v4 + 20))
    {
      if ((char *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioHALPluginMockAudioInject initWithConfig:].cold.3();
        }
        goto LABEL_40;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v40 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 52;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v35;
          *(_WORD *)&buf[38] = 2048;
          v49 = v4;
          v38 = " [%s] %s:%d %@(%p) could not allocate audio buffer list";
          goto LABEL_69;
        }
      }
      goto LABEL_40;
    }
  }
  v22 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v4);
  LODWORD(v23) = a3->sinkFormat.samplesPerFrame;
  v24 = (double)v23;
  if (v10)
  {
    -[VCCannedAudioInjectorConfig audioFormat](v10, "audioFormat");
    v25 = *(double *)&v42;
  }
  else
  {
    v44 = 0;
    v42 = 0u;
    v43 = 0u;
    v25 = 0.0;
  }
  v26 = (v24 / v25 * 1000.0);
  v27 = [VCDispatchTimer alloc];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __50__VCAudioHALPluginMockAudioInject_initWithConfig___block_invoke;
  v41[3] = &unk_1E9E521C0;
  v41[4] = v22;
  v28 = -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:](v27, "initWithIntervalMilliseconds:callbackBlock:", v26, v41);
  *((_QWORD *)v4 + 21) = v28;
  if (!v28)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginMockAudioInject initWithConfig:].cold.4();
      }
      goto LABEL_40;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioHALPluginMockAudioInject initWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 59;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v29;
        *(_WORD *)&buf[38] = 2048;
        v49 = v4;
        v38 = " [%s] %s:%d %@(%p) could not allocate dispatch timer";
LABEL_69:
        _os_log_error_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x30u);
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
LABEL_41:

  return (VCAudioHALPluginMockAudioInject *)v4;
}

uint64_t __50__VCAudioHALPluginMockAudioInject_initWithConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "injectAudioCallbacks");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCAudioHALPluginMockAudioInject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginMockAudioInject-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginMockAudioInject dealloc]";
      v10 = 1024;
      v11 = 73;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-dealloc (%p)", buf, 0x26u);
    }
  }

  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferList);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginMockAudioInject;
  -[VCAudioHALPluginMockAudioInject dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  VCAudioHALPluginMockAudioInject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginMockAudioInject-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCAudioHALPluginMockAudioInject invalidate]";
      v9 = 1024;
      v10 = 81;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (BOOL)start
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCAudioHALPluginMockAudioInject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginMockAudioInject-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginMockAudioInject start]";
      v10 = 1024;
      v11 = 85;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-start (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  -[VCDispatchTimer start](self->_audioInjectTimer, "start");
  return 1;
}

- (BOOL)stop
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCAudioHALPluginMockAudioInject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginMockAudioInject-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginMockAudioInject stop]";
      v10 = 1024;
      v11 = 91;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginMockAudioInject-stop (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  -[VCDispatchTimer stop](self->_audioInjectTimer, "stop");
  return 1;
}

- (void)injectAudioCallbacks
{
  uint64_t AudioBufferList;
  unint64_t v4;
  unsigned int v5;
  UInt64 v6;
  void (*sinkProc)(id);

  VCCannedAudioInjector_InjectSamples((uint64_t)self->_audioInjector, (uint64_t)self->_audioBufferList, 0, 0);
  AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)self->_audioBufferList);
  LODWORD(v4) = self->_sinkFormat.samplesPerFrame;
  v5 = (self->_sinkFormat.format.mSampleRate * ((double)v4 / self->_sinkFormat.format.mSampleRate));
  self->_audioTimestamp.mSampleTime = self->_audioTimestamp.mSampleTime + (double)v5;
  v6 = mach_absolute_time();
  self->_audioSourceBuffer.data = *(void **)(AudioBufferList + 16);
  self->_audioTimestamp.mHostTime = v6;
  self->_audioSourceBuffer.dataByteSize = self->_sinkFormat.format.mBytesPerFrame
                                        * v5
                                        * self->_sinkFormat.format.mChannelsPerFrame;
  sinkProc = (void (*)(id))self->_sinkProc;
  if (sinkProc)
    sinkProc(self->_sinkContext);
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate canned audio injector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate dispatch timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
