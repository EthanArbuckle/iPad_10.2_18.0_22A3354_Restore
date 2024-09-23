@implementation AVCAudioPowerSpectrumMeter

- (AVCAudioPowerSpectrumMeter)initWithConfig:(_AVCAudioPowerSpectrumMeterConfig *)a3 delegate:(id)a4 queue:(id)a5
{
  AVCAudioPowerSpectrumMeter *v8;
  NSMutableDictionary *v9;
  NSObject *CustomRootQueue;
  dispatch_queue_t v11;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  AVCAudioPowerSpectrumMeter *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)AVCAudioPowerSpectrumMeter;
  v8 = -[AVCAudioPowerSpectrumMeter init](&v25, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_basebandAudioTapTypeToStreamTokenMap = v9;
    if (v9)
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v11 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAudioPowerSpectrumMeter.stateQueue", 0, CustomRootQueue);
      v8->_stateQueue = (OS_dispatch_queue *)v11;
      if (v11)
      {
        if (-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:](v8, "storeDelegate:delegateQueue:", a4, a5))
        {
          if (-[AVCAudioPowerSpectrumMeter setupXPCConnection](v8, "setupXPCConnection"))
          {
            v8->_sessionToken = 0;
            v8->_audioSpectrumBinCount = a3->var2;
            v8->_audioSpectrumRefreshRate = a3->var3;
            if (-[AVCAudioPowerSpectrumMeter setupPowerSpectrumMeter](v8, "setupPowerSpectrumMeter"))
              return v8;
            if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v8)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.3();
              }
              goto LABEL_59;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v17 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](v8, "performSelector:", sel_logPrefix);
            else
              v17 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v24 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v27 = v24;
                v28 = 2080;
                v29 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
                v30 = 1024;
                v31 = 68;
                v32 = 2112;
                v33 = v17;
                v34 = 2048;
                v35 = v8;
                v20 = " [%s] %s:%d %@(%p) Failed to initialize the power spectrum meter";
                goto LABEL_58;
              }
            }
LABEL_59:

            return 0;
          }
          if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.4();
            }
            goto LABEL_59;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v16 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](v8, "performSelector:", sel_logPrefix);
          else
            v16 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_59;
          v23 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_59;
          *(_DWORD *)buf = 136316162;
          v27 = v23;
          v28 = 2080;
          v29 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
          v30 = 1024;
          v31 = 61;
          v32 = 2112;
          v33 = v16;
          v34 = 2048;
          v35 = v8;
          v20 = " [%s] %s:%d %@(%p) Failed to setup XPC";
        }
        else
        {
          if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.5();
            }
            goto LABEL_59;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v15 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](v8, "performSelector:", sel_logPrefix);
          else
            v15 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_59;
          v22 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_59;
          *(_DWORD *)buf = 136316162;
          v27 = v22;
          v28 = 2080;
          v29 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
          v30 = 1024;
          v31 = 58;
          v32 = 2112;
          v33 = v15;
          v34 = 2048;
          v35 = v8;
          v20 = " [%s] %s:%d %@(%p) Failed to setup delegate queue";
        }
      }
      else
      {
        if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.2();
          }
          goto LABEL_59;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](v8, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_59;
        v21 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_DWORD *)buf = 136316162;
        v27 = v21;
        v28 = 2080;
        v29 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
        v30 = 1024;
        v31 = 56;
        v32 = 2112;
        v33 = v14;
        v34 = 2048;
        v35 = v8;
        v20 = " [%s] %s:%d %@(%p) Failed to allocate stateQueue";
      }
    }
    else
    {
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:].cold.1();
        }
        goto LABEL_59;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_59;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_59;
      *(_DWORD *)buf = 136316162;
      v27 = v18;
      v28 = 2080;
      v29 = "-[AVCAudioPowerSpectrumMeter initWithConfig:delegate:queue:]";
      v30 = 1024;
      v31 = 54;
      v32 = 2112;
      v33 = v13;
      v34 = 2048;
      v35 = v8;
      v20 = " [%s] %s:%d %@(%p) Failed to allocate basebandAudioTapTypeToStreamTokenMap";
    }
LABEL_58:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x30u);
    goto LABEL_59;
  }
  return v8;
}

- (AVCAudioPowerSpectrumMeterDelegate)delegate
{
  return (AVCAudioPowerSpectrumMeterDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *stateQueue;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  AVCAudioPowerSpectrumMeter *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[AVCAudioPowerSpectrumMeter dealloc]";
    v17 = 1024;
    v18 = 83;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) deallocating AVCAudioPowerSpectrumMeter";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[AVCAudioPowerSpectrumMeter dealloc]";
      v17 = 1024;
      v18 = 83;
      v6 = " [%s] %s:%d deallocating AVCAudioPowerSpectrumMeter";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }

  -[AVCAudioPowerSpectrumMeter cleanupPowerSpectrumMeter](self, "cleanupPowerSpectrumMeter");
  -[AVCAudioPowerSpectrumMeter cleanupXPCConnection](self, "cleanupXPCConnection");
  -[AVCAudioPowerSpectrumMeter cleanupDelegate](self, "cleanupDelegate");
  v12.receiver = self;
  v12.super_class = (Class)AVCAudioPowerSpectrumMeter;
  -[AVCAudioPowerSpectrumMeter dealloc](&v12, sel_dealloc);
}

- (void)registerPowerSpectrumForStreamToken:(int64_t)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  AVCAudioPowerSpectrumMeter *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter registerPowerSpectrumForStreamToken:]";
        v19 = 1024;
        v20 = 94;
        v21 = 2048;
        v22 = a3;
        v8 = " [%s] %s:%d streamToken=%ld";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v11;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter registerPowerSpectrumForStreamToken:]";
        v19 = 1024;
        v20 = 94;
        v21 = 2112;
        v22 = (int64_t)v5;
        v23 = 2048;
        v24 = self;
        v25 = 2048;
        v26 = a3;
        v8 = " [%s] %s:%d %@(%p) streamToken=%ld";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("vcAudioPowerSpectrumStreamToken"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcAudioPowerSpectrumRegisterListener", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
}

- (void)unregisterPowerSpectrumForStreamToken:(int64_t)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  AVCAudioPowerSpectrumMeter *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter unregisterPowerSpectrumForStreamToken:]";
        v19 = 1024;
        v20 = 101;
        v21 = 2048;
        v22 = a3;
        v8 = " [%s] %s:%d streamToken=%ld";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v11;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter unregisterPowerSpectrumForStreamToken:]";
        v19 = 1024;
        v20 = 101;
        v21 = 2112;
        v22 = (int64_t)v5;
        v23 = 2048;
        v24 = self;
        v25 = 2048;
        v26 = a3;
        v8 = " [%s] %s:%d %@(%p) streamToken=%ld";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("vcAudioPowerSpectrumStreamToken"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcAudioPowerSpectrumUnregisterListener", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
}

+ (unsigned)cellularTapTypeWithClientCellularTapType:(unsigned int)a3
{
  return a3;
}

- (BOOL)dispatchedProcessBasebandRegistrationResult:(id)a3 forTapType:(unsigned int)a4 withError:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t sessionToken;
  BOOL result;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  unsigned int v38;
  void *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  _BYTE v49[18];
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v6 = *(_QWORD *)&a4;
  v54 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcBasebandAudioTapDirectionToken"));
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  if (v9)
  {
    v11 = v10;
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "objectForKeyedSubscript:", v10))
    {
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v18 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_51;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        v34 = -[NSMutableDictionary objectForKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "objectForKeyedSubscript:", v11);
        v40 = 136316930;
        v41 = v32;
        v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        v44 = 1024;
        v45 = 126;
        v46 = 2112;
        v47 = (uint64_t)v18;
        v48 = 2048;
        *(_QWORD *)v49 = self;
        *(_WORD *)&v49[8] = 2112;
        *(_QWORD *)&v49[10] = v34;
        v50 = 1024;
        v51 = v6;
        v52 = 2112;
        v53 = v9;
        v24 = " [%s] %s:%d %@(%p) Token=%@ already exists for tapType=%u, cannot register new token=%@";
        v25 = v33;
        v29 = 74;
        goto LABEL_50;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_51;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      v23 = -[NSMutableDictionary objectForKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "objectForKeyedSubscript:", v11);
      v40 = 136316418;
      v41 = v21;
      v42 = 2080;
      v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
      v44 = 1024;
      v45 = 126;
      v46 = 2112;
      v47 = v23;
      v48 = 1024;
      *(_DWORD *)v49 = v6;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v9;
      v24 = " [%s] %s:%d Token=%@ already exists for tapType=%u, cannot register new token=%@";
      v25 = v22;
LABEL_45:
      v29 = 54;
LABEL_50:
      _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v40, v29);
      goto LABEL_51;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "setObject:forKeyedSubscript:", v9, v11);
    v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcBasebandAudioTapTapToken"));
    if (v12)
    {
      v13 = objc_msgSend(v12, "longValue");
      v14 = v13;
      sessionToken = self->_sessionToken;
      if (!(_DWORD)sessionToken || v13 == sessionToken)
      {
        self->_sessionToken = v13;
        return 1;
      }
      if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_51;
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        v28 = self->_sessionToken;
        v40 = 136316418;
        v41 = v26;
        v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        v44 = 1024;
        v45 = 134;
        v46 = 2048;
        v47 = v14;
        v48 = 1024;
        *(_DWORD *)v49 = v6;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v28;
        v24 = " [%s] %s:%d Different sessionToken=%ld passed from server for tapType=%u, originalToken=%u";
        v25 = v27;
        v29 = 50;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v20 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v20 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_51;
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        v38 = self->_sessionToken;
        v40 = 136316930;
        v41 = v36;
        v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        v44 = 1024;
        v45 = 134;
        v46 = 2112;
        v47 = (uint64_t)v20;
        v48 = 2048;
        *(_QWORD *)v49 = self;
        *(_WORD *)&v49[8] = 2048;
        *(_QWORD *)&v49[10] = v14;
        v50 = 1024;
        v51 = v6;
        v52 = 1024;
        LODWORD(v53) = v38;
        v24 = " [%s] %s:%d %@(%p) Different sessionToken=%ld passed from server for tapType=%u, originalToken=%u";
        v25 = v37;
        v29 = 70;
      }
      goto LABEL_50;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:].cold.2();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v40 = 136316418;
        v41 = v35;
        v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        v44 = 1024;
        v45 = 131;
        v46 = 2112;
        v47 = (uint64_t)v19;
        v48 = 2048;
        *(_QWORD *)v49 = self;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v6;
        v24 = " [%s] %s:%d %@(%p) Failed to receive sessionToken from server for tapType=%u";
        goto LABEL_44;
      }
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:].cold.1();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v40 = 136316418;
        v41 = v30;
        v42 = 2080;
        v43 = "-[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:]";
        v44 = 1024;
        v45 = 125;
        v46 = 2112;
        v47 = (uint64_t)v17;
        v48 = 2048;
        *(_QWORD *)v49 = self;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v6;
        v24 = " [%s] %s:%d %@(%p) Failed to receive direction token from server for tapType=%u";
LABEL_44:
        v25 = v31;
        goto LABEL_45;
      }
    }
  }
LABEL_51:
  if (!a5)
    return 0;
  v39 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Invalid baseband stream token state"));
  result = 0;
  *a5 = v39;
  return result;
}

- (BOOL)dispatchedRegisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  AVCAudioPowerSpectrumMeter *v13;
  _BOOL4 v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  AVCAudioPowerSpectrumMeter *v34;
  __int16 v35;
  AVCAudioPowerSpectrumMeter *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  AVCAudioPowerSpectrumMeter *v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v5 = *(_QWORD *)&a3;
  v42[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v7 = +[AVCAudioPowerSpectrumMeter cellularTapTypeWithClientCellularTapType:](AVCAudioPowerSpectrumMeter, "cellularTapTypeWithClientCellularTapType:", v5);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioPowerSpectrumMeter-registerPowerSpectrumForCellularTapType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136316162;
      v28 = v9;
      v29 = 2080;
      v30 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
      v31 = 1024;
      v32 = 158;
      v33 = 2048;
      v34 = self;
      v35 = 1024;
      LODWORD(v36) = v5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAudioPowerSpectrumMeter-registerPowerSpectrumForCellularTapType (%p) type=%u", (uint8_t *)&v27, 0x2Cu);
    }
  }
  if (!+[VCHardwareSettings isCellularTappingSupported](VCHardwareSettings, "isCellularTappingSupported"))
  {
    v13 = (AVCAudioPowerSpectrumMeter *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Platform doesn't support callular tapping"));
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_20;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        goto LABEL_21;
      v27 = 136316674;
      v28 = v21;
      v29 = 2080;
      v30 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
      v31 = 1024;
      v32 = 170;
      v33 = 2112;
      v34 = (AVCAudioPowerSpectrumMeter *)v15;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v13;
      v18 = " [%s] %s:%d %@(%p) Failed to register the power spectrum for tap type=%@. error=%@";
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v14) = 0;
      goto LABEL_21;
    }
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v14)
      goto LABEL_21;
    v27 = 136316162;
    v28 = v16;
    v29 = 2080;
    v30 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    v31 = 1024;
    v32 = 170;
    v33 = 2112;
    v34 = (AVCAudioPowerSpectrumMeter *)v8;
    v35 = 2112;
    v36 = v13;
    v18 = " [%s] %s:%d Failed to register the power spectrum for tap type=%@. error=%@";
    goto LABEL_13;
  }
  v41[0] = CFSTR("vcAudioPowerSpectrumCellularTapType");
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v41[1] = CFSTR("vcAudioPowerSpectrumMeterKeyType");
  v42[0] = v11;
  v42[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v12 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumRegisterCellularTap", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
  v13 = (AVCAudioPowerSpectrumMeter *)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (!v13)
  {
    LOBYTE(v14) = -[AVCAudioPowerSpectrumMeter dispatchedProcessBasebandRegistrationResult:forTapType:withError:](self, "dispatchedProcessBasebandRegistrationResult:forTapType:withError:", v12, v5, a4);
    goto LABEL_21;
  }
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_20;
    v24 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v14)
      goto LABEL_21;
    v27 = 136316162;
    v28 = v24;
    v29 = 2080;
    v30 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    v31 = 1024;
    v32 = 166;
    v33 = 2112;
    v34 = (AVCAudioPowerSpectrumMeter *)v8;
    v35 = 2112;
    v36 = v13;
    v18 = " [%s] %s:%d Failed to register the power spectrum for tap type=%@. error=%@";
LABEL_13:
    v19 = v17;
    v20 = 48;
LABEL_19:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, v20);
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v23 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v23 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_20;
  v25 = VRTraceErrorLogLevelToCSTR();
  v22 = *MEMORY[0x1E0CF2758];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v14)
  {
    v27 = 136316674;
    v28 = v25;
    v29 = 2080;
    v30 = "-[AVCAudioPowerSpectrumMeter dispatchedRegisterPowerSpectrumForCellularTapType:error:]";
    v31 = 1024;
    v32 = 166;
    v33 = 2112;
    v34 = (AVCAudioPowerSpectrumMeter *)v23;
    v35 = 2048;
    v36 = self;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v13;
    v18 = " [%s] %s:%d %@(%p) Failed to register the power spectrum for tap type=%@. error=%@";
LABEL_18:
    v19 = v22;
    v20 = 68;
    goto LABEL_19;
  }
LABEL_21:
  if (a4)
    *a4 = v13;
  return v14;
}

- (BOOL)registerPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[7];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVCAudioPowerSpectrumMeter_registerPowerSpectrumForCellularTapType_error___block_invoke;
  block[3] = &unk_1E9E579F0;
  block[4] = self;
  block[5] = &v9;
  v8 = a3;
  block[6] = a4;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __76__AVCAudioPowerSpectrumMeter_registerPowerSpectrumForCellularTapType_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedRegisterPowerSpectrumForCellularTapType:error:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)streamTokenForCellularTapType:(unsigned int)a3
{
  NSObject *stateQueue;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[6];
  unsigned int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__35;
  v25 = __Block_byref_object_dispose__35;
  v26 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVCAudioPowerSpectrumMeter_streamTokenForCellularTapType___block_invoke;
  block[3] = &unk_1E9E54AC8;
  block[4] = self;
  block[5] = &v21;
  v20 = a3;
  dispatch_sync(stateQueue, block);
  v6 = (void *)v22[5];
  if (v6)
    v7 = objc_msgSend(v6, "longValue");
  else
    v7 = 0;
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v22[5];
        *(_DWORD *)buf = 136316418;
        v28 = v9;
        v29 = 2080;
        v30 = "-[AVCAudioPowerSpectrumMeter streamTokenForCellularTapType:]";
        v31 = 1024;
        v32 = 193;
        v33 = 2048;
        v34 = v7;
        v35 = 1024;
        *(_DWORD *)v36 = a3;
        *(_WORD *)&v36[4] = 2112;
        *(_QWORD *)&v36[6] = v11;
        v12 = " [%s] %s:%d Querying token=%ld for tapType=%u, mappedNumber=%@";
        v13 = v10;
        v14 = 54;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = v22[5];
        *(_DWORD *)buf = 136316930;
        v28 = v15;
        v29 = 2080;
        v30 = "-[AVCAudioPowerSpectrumMeter streamTokenForCellularTapType:]";
        v31 = 1024;
        v32 = 193;
        v33 = 2112;
        v34 = (int64_t)v8;
        v35 = 2048;
        *(_QWORD *)v36 = self;
        *(_WORD *)&v36[8] = 2048;
        *(_QWORD *)&v36[10] = v7;
        v37 = 1024;
        v38 = a3;
        v39 = 2112;
        v40 = v17;
        v12 = " [%s] %s:%d %@(%p) Querying token=%ld for tapType=%u, mappedNumber=%@";
        v13 = v16;
        v14 = 74;
        goto LABEL_14;
      }
    }
  }
  _Block_object_dispose(&v21, 8);
  return v7;
}

id __60__AVCAudioPowerSpectrumMeter_streamTokenForCellularTapType___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dispatchedUnregisterBasebandTokensForAudioTapType:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_basebandAudioTapTypeToStreamTokenMap, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (!-[NSMutableDictionary count](self->_basebandAudioTapTypeToStreamTokenMap, "count"))
    self->_sessionToken = 0;
}

- (BOOL)dispatchedUnregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  AVCAudioPowerSpectrumMeter *v11;
  _BOOL4 v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  AVCAudioPowerSpectrumMeter *v32;
  __int16 v33;
  AVCAudioPowerSpectrumMeter *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  AVCAudioPowerSpectrumMeter *v38;
  const __CFString *v39;
  _QWORD v40[2];

  v5 = *(_QWORD *)&a3;
  v40[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioPowerSpectrumMeter-unregisterPowerSpectrumForCellularTapType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136316162;
      v26 = v7;
      v27 = 2080;
      v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
      v29 = 1024;
      v30 = 218;
      v31 = 2048;
      v32 = self;
      v33 = 1024;
      LODWORD(v34) = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAudioPowerSpectrumMeter-unregisterPowerSpectrumForCellularTapType (%p) type=%u", (uint8_t *)&v25, 0x2Cu);
    }
  }
  v9 = +[AVCAudioPowerSpectrumMeter cellularTapTypeWithClientCellularTapType:](AVCAudioPowerSpectrumMeter, "cellularTapTypeWithClientCellularTapType:", v5);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  if (!+[VCHardwareSettings isCellularTappingSupported](VCHardwareSettings, "isCellularTappingSupported"))
  {
    v11 = (AVCAudioPowerSpectrumMeter *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Platform doesn't support callular tapping"));
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_20;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        goto LABEL_21;
      v25 = 136316674;
      v26 = v19;
      v27 = 2080;
      v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
      v29 = 1024;
      v30 = 232;
      v31 = 2112;
      v32 = (AVCAudioPowerSpectrumMeter *)v13;
      v33 = 2048;
      v34 = self;
      v35 = 2112;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      v16 = " [%s] %s:%d %@(%p) Failed to unregister the power spectrum for tap type=%@. error=%@";
      goto LABEL_18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v12) = 0;
      goto LABEL_21;
    }
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v12)
      goto LABEL_21;
    v25 = 136316162;
    v26 = v14;
    v27 = 2080;
    v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    v29 = 1024;
    v30 = 232;
    v31 = 2112;
    v32 = (AVCAudioPowerSpectrumMeter *)v10;
    v33 = 2112;
    v34 = v11;
    v16 = " [%s] %s:%d Failed to unregister the power spectrum for tap type=%@. error=%@";
    goto LABEL_13;
  }
  v39 = CFSTR("vcAudioPowerSpectrumCellularTapType");
  v40[0] = v10;
  v11 = (AVCAudioPowerSpectrumMeter *)objc_msgSend(-[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumUnregisterCellularTap", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1)), "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (!v11)
  {
    -[AVCAudioPowerSpectrumMeter dispatchedUnregisterBasebandTokensForAudioTapType:](self, "dispatchedUnregisterBasebandTokensForAudioTapType:", v5);
    LOBYTE(v12) = 1;
    goto LABEL_21;
  }
  if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_20;
    v22 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v12)
      goto LABEL_21;
    v25 = 136316162;
    v26 = v22;
    v27 = 2080;
    v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    v29 = 1024;
    v30 = 227;
    v31 = 2112;
    v32 = (AVCAudioPowerSpectrumMeter *)v10;
    v33 = 2112;
    v34 = v11;
    v16 = " [%s] %s:%d Failed to unregister the power spectrum for tap type=%@. error=%@";
LABEL_13:
    v17 = v15;
    v18 = 48;
LABEL_19:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v25, v18);
    goto LABEL_20;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v21 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_20;
  v23 = VRTraceErrorLogLevelToCSTR();
  v20 = *MEMORY[0x1E0CF2758];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    v25 = 136316674;
    v26 = v23;
    v27 = 2080;
    v28 = "-[AVCAudioPowerSpectrumMeter dispatchedUnregisterPowerSpectrumForCellularTapType:error:]";
    v29 = 1024;
    v30 = 227;
    v31 = 2112;
    v32 = (AVCAudioPowerSpectrumMeter *)v21;
    v33 = 2048;
    v34 = self;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v16 = " [%s] %s:%d %@(%p) Failed to unregister the power spectrum for tap type=%@. error=%@";
LABEL_18:
    v17 = v20;
    v18 = 68;
    goto LABEL_19;
  }
LABEL_21:
  if (a4)
    *a4 = v11;
  return v12;
}

- (BOOL)unregisterPowerSpectrumForCellularTapType:(unsigned int)a3 error:(id *)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[7];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVCAudioPowerSpectrumMeter_unregisterPowerSpectrumForCellularTapType_error___block_invoke;
  block[3] = &unk_1E9E579F0;
  block[4] = self;
  block[5] = &v9;
  v8 = a3;
  block[6] = a4;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __78__AVCAudioPowerSpectrumMeter_unregisterPowerSpectrumForCellularTapType_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedUnregisterPowerSpectrumForCellularTapType:error:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)setupXPCConnection
{
  AVConferenceXPCClient *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  AVCAudioPowerSpectrumMeter *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (NSSet *)(id)objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
    self->_allowListedXPCObjects = v10;
    if (v10)
    {
      -[AVCAudioPowerSpectrumMeter registerBlocksForNotifications](self, "registerBlocksForNotifications");
      LOBYTE(v11) = 1;
      return v11;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        -[AVCAudioPowerSpectrumMeter setupXPCConnection].cold.2();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      *(_DWORD *)buf = 136316162;
      v20 = v17;
      v21 = 2080;
      v22 = "-[AVCAudioPowerSpectrumMeter setupXPCConnection]";
      v23 = 1024;
      v24 = 257;
      v25 = 2112;
      v26 = v13;
      v27 = 2048;
      v28 = self;
      v16 = " [%s] %s:%d %@(%p) Failed to allocate XPC object allow list";
LABEL_25:
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x30u);
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        -[AVCAudioPowerSpectrumMeter setupXPCConnection].cold.1();
      }
      goto LABEL_26;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      *(_DWORD *)buf = 136316162;
      v20 = v14;
      v21 = 2080;
      v22 = "-[AVCAudioPowerSpectrumMeter setupXPCConnection]";
      v23 = 1024;
      v24 = 255;
      v25 = 2112;
      v26 = v12;
      v27 = 2048;
      v28 = self;
      v16 = " [%s] %s:%d %@(%p) Failed to allocate XPC connection";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v11) = 0;
  return v11;
}

- (void)cleanupXPCConnection
{
  -[AVCAudioPowerSpectrumMeter deregisterBlocksForService](self, "deregisterBlocksForService");

}

- (BOOL)storeDelegate:(id)a3 delegateQueue:(id)a4
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  objc_class *v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v15;
  SEL *p_name;
  NSString *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  objc_method_description *v29;
  unsigned int outCount;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[28];
  __int16 v39;
  NSString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      self->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
      goto LABEL_5;
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v7 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAudioPowerSpectrumMeter.notificationQueue", 0, CustomRootQueue);
    self->_delegateQueue = v7;
    if (v7)
    {
LABEL_5:
      objc_storeWeak(&self->_delegate, a3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          v12 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136316674;
          v32 = v8;
          v33 = 2080;
          v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
          v35 = 1024;
          v36 = 280;
          v37 = 2048;
          *(_QWORD *)v38 = self;
          *(_WORD *)&v38[8] = 2112;
          *(_QWORD *)&v38[10] = v11;
          *(_WORD *)&v38[18] = 2048;
          *(_QWORD *)&v38[20] = a3;
          v39 = 2112;
          v40 = NSStringFromClass(v12);
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d self=%p (%@), delegate=%p (%@)", buf, 0x44u);
        }
      }
      outCount = 0;
      v29 = protocol_copyMethodDescriptionList((Protocol *)&unk_1F01EDD80, 0, 1, &outCount);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v32 = v13;
          v33 = 2080;
          v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
          v35 = 1024;
          v36 = 280;
          v37 = 1024;
          *(_DWORD *)v38 = outCount;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Protocol AVCAudioPowerSpectrumMeterDelegate contains %u optional methods.", buf, 0x22u);
        }
      }
      if (outCount)
      {
        v15 = 0;
        p_name = &v29->name;
        do
        {
          v17 = NSStringFromSelector(*p_name);
          NSSelectorFromString(v17);
          v18 = objc_opt_respondsToSelector();
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v19 = VRTraceErrorLogLevelToCSTR();
            v20 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              v21 = "does NOT respond";
              if ((v18 & 1) != 0)
                v21 = "responds";
              v32 = v19;
              v33 = 2080;
              v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
              v35 = 1024;
              v36 = 280;
              v37 = 1024;
              *(_DWORD *)v38 = v15;
              *(_WORD *)&v38[4] = 2080;
              *(_QWORD *)&v38[6] = v21;
              *(_WORD *)&v38[14] = 2112;
              *(_QWORD *)&v38[16] = v17;
              _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %u: Delegate %s to \"%@\", buf, 0x36u);
            }
          }
          ++v15;
          p_name += 2;
        }
        while (v15 < outCount);
      }
      free(v29);
      return self->_delegate && self->_delegateQueue != 0;
    }
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return self->_delegate && self->_delegateQueue != 0;
      v28 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return self->_delegate && self->_delegateQueue != 0;
      *(_DWORD *)buf = 136316162;
      v32 = v28;
      v33 = 2080;
      v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
      v35 = 1024;
      v36 = 277;
      v37 = 2112;
      *(_QWORD *)v38 = v24;
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = self;
      v27 = " [%s] %s:%d %@(%p) Failed to create the delegate queue";
      goto LABEL_44;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:].cold.2();
    }
  }
  else
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return self->_delegate && self->_delegateQueue != 0;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return self->_delegate && self->_delegateQueue != 0;
      *(_DWORD *)buf = 136316162;
      v32 = v25;
      v33 = 2080;
      v34 = "-[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:]";
      v35 = 1024;
      v36 = 271;
      v37 = 2112;
      *(_QWORD *)v38 = v23;
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = self;
      v27 = " [%s] %s:%d %@(%p) The delegate is nil";
LABEL_44:
      _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
      return self->_delegate && self->_delegateQueue != 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCAudioPowerSpectrumMeter storeDelegate:delegateQueue:].cold.1();
    }
  }
  return self->_delegate && self->_delegateQueue != 0;
}

- (void)cleanupDelegate
{
  NSObject *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  objc_storeWeak(&self->_delegate, 0);
}

- (BOOL)setupPowerSpectrumMeter
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  AVCAudioPowerSpectrumMeter *v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("vcAudioPowerSpectrumBinCount");
  v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_audioSpectrumBinCount);
  v20[1] = CFSTR("vcAudioPowerSpectrumRefreshRate");
  v21[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_audioSpectrumRefreshRate);
  v3 = objc_msgSend(-[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2)), "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (v3)
  {
    if ((AVCAudioPowerSpectrumMeter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioPowerSpectrumMeter setupPowerSpectrumMeter].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[AVCAudioPowerSpectrumMeter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316418;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCAudioPowerSpectrumMeter setupPowerSpectrumMeter]";
          v12 = 1024;
          v13 = 302;
          v14 = 2112;
          v15 = v5;
          v16 = 2048;
          v17 = self;
          v18 = 2112;
          v19 = v3;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate power spectrum error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
  }
  return v3 == 0;
}

- (void)cleanupPowerSpectrumMeter
{
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcAudioPowerSpectrumTerminateMeter");
}

- (void)invalidateBasebandTokens
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__AVCAudioPowerSpectrumMeter_invalidateBasebandTokens__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

uint64_t __54__AVCAudioPowerSpectrumMeter_invalidateBasebandTokens__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  return result;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcAudioPowerSpectrumServerDidDisconnect", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:](self->_connection, "registerBlockForService:block:queue:eventLogLevel:", "vcAudioPowerSpectrumServerDidReceiveSpectrum", v6, 0, 8);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_114;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcAudioPowerSpectrumServerSpectrumInterrupted", v5);
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v3)
    {
      v4 = (void *)v3;
      if (objc_opt_class() == v3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v17 = v6;
        v18 = 2080;
        v19 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        v20 = 1024;
        v21 = 331;
        v8 = " [%s] %s:%d received callback for serverDidDisconnect";
        v9 = v7;
        v10 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v17 = v11;
        v18 = 2080;
        v19 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        v20 = 1024;
        v21 = 331;
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = v4;
        v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
        v9 = v12;
        v10 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      objc_msgSend(v4, "invalidateBasebandTokens");
      v13 = objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v14 = objc_msgSend(v4, "delegateQueue");
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_105;
        v15[3] = &unk_1E9E52238;
        v15[4] = v13;
        v15[5] = v4;
        dispatch_async(v14, v15);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_105(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "meterServerDidDisconnect:", *(_QWORD *)(a1 + 40));
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v3)
  {
    v4 = (_QWORD *)v3;
    if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    {
      v12[0] = 0;
      v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumRemoteSpectrum"));
      v6 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v4[6], v5, v12);
      if (v6)
        v7 = v12[0] == 0;
      else
        v7 = 0;
      if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_cold_1(v8, v12, v9);
      }
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = objc_msgSend(v4, "delegateQueue");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_112;
        v11[3] = &unk_1E9E52238;
        v11[4] = v4;
        v11[5] = v6;
        dispatch_async(v10, v11);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_112(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_114(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v3)
  {
    v4 = (void *)v3;
    if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    {
      if ((void *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v16 = v6;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke_2";
        v19 = 1024;
        v20 = 369;
        v8 = " [%s] %s:%d received callback for serverSpectrumInterrupted";
        v9 = v7;
        v10 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v16 = v11;
        v17 = 2080;
        v18 = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke";
        v19 = 1024;
        v20 = 369;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = v4;
        v8 = " [%s] %s:%d %@(%p) received callback for serverSpectrumInterrupted";
        v9 = v12;
        v10 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = objc_msgSend(v4, "delegateQueue");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_116;
        block[3] = &unk_1E9E521C0;
        block[4] = v4;
        dispatch_async(v13, block);
      }
    }
  }
}

uint64_t __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_116(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "meterSpectrumCaptureWasInterrupted:", *(_QWORD *)(a1 + 32));
}

- (void)deregisterBlocksForService
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAudioPowerSpectrumServerDidDisconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAudioPowerSpectrumServerDidReceiveSpectrum");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAudioPowerSpectrumServerSpectrumInterrupted");
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__AVCAudioPowerSpectrumMeter_audioPowerSpectrumMeter_didUpdateAudioPowerSpectrums___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateQueue, block);
}

uint64_t __83__AVCAudioPowerSpectrumMeter_audioPowerSpectrumMeter_didUpdateAudioPowerSpectrums___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (unsigned)sessionToken
{
  return self->_sessionToken;
}

- (void)initWithConfig:delegate:queue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate basebandAudioTapTypeToStreamTokenMap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:queue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:queue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the power spectrum meter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:queue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:queue:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup delegate queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedProcessBasebandRegistrationResult:forTapType:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to receive direction token from server for tapType=%u", v2, v3, v4, 125);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedProcessBasebandRegistrationResult:forTapType:withError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to receive sessionToken from server for tapType=%u", v2, v3, v4, 131);
  OUTLINED_FUNCTION_3();
}

- (void)setupXPCConnection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate XPC object allow list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)storeDelegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The delegate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)storeDelegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the delegate queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupPowerSpectrumMeter
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum error=%@");
  OUTLINED_FUNCTION_3();
}

void __60__AVCAudioPowerSpectrumMeter_registerBlocksForNotifications__block_invoke_2_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[AVCAudioPowerSpectrumMeter registerBlocksForNotifications]_block_invoke_2";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 354;
  WORD2(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d Decoding: error %@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4);
  OUTLINED_FUNCTION_3();
}

@end
