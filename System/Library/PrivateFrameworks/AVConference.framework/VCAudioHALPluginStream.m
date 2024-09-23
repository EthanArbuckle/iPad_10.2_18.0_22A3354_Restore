@implementation VCAudioHALPluginStream

- (VCAudioHALPluginStream)initWithDirection:(unsigned int)a3 plugin:(id)a4 withConfig:(tagVCAudioHALPluginConfiguration *)a5
{
  char *v7;
  uint64_t v8;
  NSObject *v9;
  double mSampleRate;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  _QWORD v31[5];
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)VCAudioHALPluginStream;
  v7 = -[ASDStream initWithDirection:withPlugin:](&v32, sel_initWithDirection_withPlugin_, *(_QWORD *)&a3);
  if (!v7)
    goto LABEL_41;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v34 = v8;
      v35 = 2080;
      v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
      v37 = 1024;
      v38 = 29;
      v39 = 2048;
      v40 = (const __CFString *)v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-init (%p)", buf, 0x26u);
    }
  }
  if (!a4)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:].cold.1();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_41;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_DWORD *)buf = 136316162;
    v34 = v22;
    v35 = 2080;
    v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
    v37 = 1024;
    v38 = 30;
    v39 = 2112;
    v40 = v18;
    v41 = 2048;
    v42 = v7;
    v24 = " [%s] %s:%d %@(%p) invalid plugin";
    goto LABEL_54;
  }
  if (!a5)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:].cold.2();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v23 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_41:
      v13 = 0;
      goto LABEL_42;
    }
    *(_DWORD *)buf = 136316162;
    v34 = v25;
    v35 = 2080;
    v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
    v37 = 1024;
    v38 = 31;
    v39 = 2112;
    v40 = v19;
    v41 = 2048;
    v42 = v7;
    v24 = " [%s] %s:%d %@(%p) invalid config";
LABEL_54:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x30u);
    goto LABEL_41;
  }
  mSampleRate = a5->sinkFormat.format.mSampleRate;
  v12 = *(_OWORD *)&a5->sinkFormat.format.mBytesPerPacket;
  v11 = *(_OWORD *)&a5->sinkFormat.format.mBitsPerChannel;
  *(_OWORD *)(v7 + 280) = *(_OWORD *)&a5->sinkFormat.format.mSampleRate;
  *(_OWORD *)(v7 + 296) = v12;
  *(_OWORD *)(v7 + 312) = v11;
  *((_QWORD *)v7 + 41) = a5->sinkContext;
  *((_QWORD *)v7 + 42) = a5->sinkProc;
  *((_DWORD *)v7 + 100) = 3;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEFA8]), "initWithSampleRate:numChannels:commonPCMFormat:isInterleaved:", *((unsigned int *)v7 + 77), 1, 1, mSampleRate);
  if (!v13)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:].cold.3();
      }
      goto LABEL_42;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v34 = v27;
        v35 = 2080;
        v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
        v37 = 1024;
        v38 = 38;
        v39 = 2112;
        v40 = v20;
        v41 = 2048;
        v42 = v7;
        v29 = " [%s] %s:%d %@(%p) could not allocate stream format";
LABEL_52:
        _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x30u);
      }
    }
LABEL_42:

    return 0;
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_msgSend(v13, "copy");
  if (!v15)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:].cold.4();
      }
      goto LABEL_42;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v34 = v30;
        v35 = 2080;
        v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
        v37 = 1024;
        v38 = 43;
        v39 = 2112;
        v40 = v21;
        v41 = 2048;
        v42 = v7;
        v29 = " [%s] %s:%d %@(%p) could not copy format";
        goto LABEL_52;
      }
    }
    goto LABEL_42;
  }
  v16 = v15;
  objc_msgSend(v15, "setSampleRate:", mSampleRate);
  objc_msgSend(v16, "setMinimumSampleRate:", mSampleRate);
  objc_msgSend(v16, "setMaximumSampleRate:", mSampleRate);
  objc_msgSend(v14, "addObject:", v16);

  objc_msgSend(v13, "setSampleRate:", mSampleRate);
  objc_msgSend(v7, "setPhysicalFormat:", v13);
  objc_msgSend(v7, "setPhysicalFormats:", v14);
  v17 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v7);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __62__VCAudioHALPluginStream_initWithDirection_plugin_withConfig___block_invoke;
  v31[3] = &unk_1E9E579A0;
  v31[4] = v17;
  *((_QWORD *)v7 + 53) = objc_msgSend(v31, "copy");

  return (VCAudioHALPluginStream *)v7;
}

uint64_t __62__VCAudioHALPluginStream_initWithDirection_plugin_withConfig___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(_QWORD);

  v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v7)
    return 561214578;
  *(_QWORD *)(v7 + 344) = *(_QWORD *)(a3 + 144);
  *(_QWORD *)(v7 + 352) = *(_QWORD *)(a3 + 24);
  *(_DWORD *)(v7 + 416) = *(_DWORD *)(v7 + 304) * a2 * *(_DWORD *)(v7 + 308);
  *(_QWORD *)(v7 + 408) = a4;
  v8 = *(void (**)(_QWORD))(v7 + 336);
  if (v8)
    v8(*(_QWORD *)(v7 + 328));
  return 0;
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
  VCAudioHALPluginStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginStream dealloc]";
      v10 = 1024;
      v11 = 72;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-dealloc (%p)", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  -[VCAudioHALPluginStream dealloc](&v5, sel_dealloc);
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
  VCAudioHALPluginStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCAudioHALPluginStream invalidate]";
      v9 = 1024;
      v10 = 78;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  -[VCAudioHALPluginStream stopStream](self, "stopStream");
}

- (id)readInputBlock
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
  VCAudioHALPluginStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-readInputBlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginStream readInputBlock]";
      v10 = 1024;
      v11 = 97;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-readInputBlock (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return 0;
}

- (id)writeMixBlock
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
  VCAudioHALPluginStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-writeMixBlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginStream writeMixBlock]";
      v10 = 1024;
      v11 = 102;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-writeMixBlock (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return self->_writeMixBlockProcess;
}

- (void)startStream
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
  VCAudioHALPluginStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-startStream");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginStream startStream]";
      v10 = 1024;
      v11 = 107;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-startStream (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  -[ASDStream startStream](&v5, sel_startStream);
}

- (void)stopStream
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
  VCAudioHALPluginStream *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginStream-stopStream");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCAudioHALPluginStream stopStream]";
      v10 = 1024;
      v11 = 112;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-stopStream (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  -[ASDStream stopStream](&v5, sel_stopStream);
}

- (void)initWithDirection:plugin:withConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid plugin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDirection:plugin:withConfig:.cold.2()
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

- (void)initWithDirection:plugin:withConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate stream format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDirection:plugin:withConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not copy format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
