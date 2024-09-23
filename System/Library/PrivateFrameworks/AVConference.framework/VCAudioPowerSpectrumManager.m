@implementation VCAudioPowerSpectrumManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_16);
  return (id)sharedInstance__vcAudioPowerSpectrumManager;
}

void __45__VCAudioPowerSpectrumManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcAudioPowerSpectrumManager)
    sharedInstance__vcAudioPowerSpectrumManager = objc_alloc_init(VCAudioPowerSpectrumManager);
}

- (VCAudioPowerSpectrumManager)init
{
  VCAudioPowerSpectrumManager *v2;
  NSObject *CustomRootQueue;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioPowerSpectrumManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumManager;
  v2 = -[VCAudioPowerSpectrumManager init](&v13, sel_init);
  if (v2)
  {
    v2->_meters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_sources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_connection = objc_alloc_init(AVConferenceXPCClient);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConferenceVCAudioPowerSpectrumManager.XPCCommandQueue", 0, CustomRootQueue);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_cellularTapTypeToStreamTokenMap = v4;
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_powerSpectrumMetersForCellularTapType = v5;
      if (v5)
        return v2;
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioPowerSpectrumManager init].cold.2();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v12 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCAudioPowerSpectrumManager init]";
      v18 = 1024;
      v19 = 78;
      v20 = 2112;
      v21 = v8;
      v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate the power spectrum meter dictionary";
    }
    else
    {
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioPowerSpectrumManager init].cold.1();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_24;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136316162;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCAudioPowerSpectrumManager init]";
      v18 = 1024;
      v19 = 75;
      v20 = 2112;
      v21 = v7;
      v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate the cellular tap type to stream token map";
    }
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    goto LABEL_24;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  -[VCAudioPowerSpectrumManager deregisterBlocksForService](self, "deregisterBlocksForService");

  v3.receiver = self;
  v3.super_class = (Class)VCAudioPowerSpectrumManager;
  -[VCAudioPowerSpectrumManager dealloc](&v3, sel_dealloc);
}

- (void)registerAudioPowerMeterSource:(id)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 40), "streamToken");
        *(_DWORD *)v21 = 136315906;
        *(_QWORD *)&v21[4] = v3;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 103;
        WORD2(v22) = 2048;
        *(_QWORD *)((char *)&v22 + 6) = v5;
        v6 = " [%s] %s:%d source.streamToken=%ld";
        v7 = v4;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v21, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = objc_msgSend(*(id *)(a1 + 40), "streamToken");
        *(_DWORD *)v21 = 136316418;
        *(_QWORD *)&v21[4] = v9;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 103;
        WORD2(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 6) = v2;
        HIWORD(v22) = 2048;
        v23 = v11;
        LOWORD(v24) = 2048;
        *(_QWORD *)((char *)&v24 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) source.streamToken=%ld";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = (id *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24))))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke_cold_1(v15, v13, v16);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 32);
          v20 = objc_msgSend(*(id *)(a1 + 40), "streamToken");
          *(_DWORD *)v21 = 136316418;
          *(_QWORD *)&v21[4] = v17;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 108;
          WORD2(v22) = 2112;
          *(_QWORD *)((char *)&v22 + 6) = v14;
          HIWORD(v22) = 2048;
          v23 = v19;
          LOWORD(v24) = 2048;
          *(_QWORD *)((char *)&v24 + 2) = v20;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) source[streamToken=%ld] already existed", v21, 0x3Au);
        }
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
  }
}

- (void)unregisterAudioPowerSpectrumSourceForStreamToken:(id)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__VCAudioPowerSpectrumManager_unregisterAudioPowerSpectrumSourceForStreamToken___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __80__VCAudioPowerSpectrumManager_unregisterAudioPowerSpectrumSourceForStreamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)newPowerSpectrumMeterWithBinCount:(unsigned __int16)a3 refreshRate:(double)a4 delegate:(id)a5 error:(id *)a6
{
  VCAudioPowerSpectrumMeter *v8;
  VCAudioPowerSpectrumManager *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  _BYTE v22[24];
  __int128 v23;
  VCAudioPowerSpectrumManager *v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = -[VCAudioPowerSpectrumMeter initWithBinCount:refreshRate:delegate:]([VCAudioPowerSpectrumMeter alloc], "initWithBinCount:refreshRate:delegate:", a3, a5, a4);
  v9 = (VCAudioPowerSpectrumManager *)objc_opt_class();
  if (!v8)
  {
    if (v9 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:].cold.1();
          if (!a6)
            return v8;
          goto LABEL_26;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v22 = 136316162;
          *(_QWORD *)&v22[4] = v20;
          *(_WORD *)&v22[12] = 2080;
          *(_QWORD *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 122;
          WORD2(v23) = 2112;
          *(_QWORD *)((char *)&v23 + 6) = v19;
          HIWORD(v23) = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) VCPowerSpectrumMeter failed to allocate", v22, 0x30u);
          if (!a6)
            return v8;
          goto LABEL_26;
        }
      }
    }
    if (!a6)
      return v8;
LABEL_26:
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), -4, 0);
    return v8;
  }
  if (v9 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_DWORD *)v22 = 136315906;
    *(_QWORD *)&v22[4] = v11;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 124;
    WORD2(v23) = 2048;
    *(_QWORD *)((char *)&v23 + 6) = v8;
    v13 = " [%s] %s:%d VCPowerSpectrumMeter[%p] created";
    v14 = v12;
    v15 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_DWORD *)v22 = 136316418;
    *(_QWORD *)&v22[4] = v16;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "-[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 124;
    WORD2(v23) = 2112;
    *(_QWORD *)((char *)&v23 + 6) = v10;
    HIWORD(v23) = 2048;
    v24 = self;
    LOWORD(v25) = 2048;
    *(_QWORD *)((char *)&v25 + 2) = v8;
    v13 = " [%s] %s:%d %@(%p) VCPowerSpectrumMeter[%p] created";
    v14 = v17;
    v15 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v22, v15);
LABEL_13:
  -[NSMutableArray addObject:](self->_meters, "addObject:", v8, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24, v25);
  return v8;
}

- (void)terminatePowerSpectrumMeter:(id)a3
{
  objc_msgSend(a3, "unregisterAllStreams");
  -[NSMutableArray removeObject:](self->_meters, "removeObject:", a3);
}

- (BOOL)registerListenerWithStreamToken:(id)a3 powerSpectrumKey:(id)a4 powerSpectrumMeter:(id)a5 error:(id *)a6
{
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sources, "objectForKeyedSubscript:");
  if (!v11)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:].cold.1();
          if (!a6)
            return v11 != 0;
          goto LABEL_25;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v24 = 136316418;
          v25 = v22;
          v26 = 2080;
          v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
          v28 = 1024;
          v29 = 144;
          v30 = 2112;
          v31 = (id)v21;
          v32 = 2048;
          v33 = self;
          v34 = 2112;
          v35 = a3;
          _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audioSpectrumRegisterListener: error no powerSpectrumSource for streamToken=%@", (uint8_t *)&v24, 0x3Au);
          if (!a6)
            return v11 != 0;
          goto LABEL_25;
        }
      }
    }
    if (!a6)
      return v11 != 0;
LABEL_25:
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), -5, 0);
    return v11 != 0;
  }
  objc_msgSend(a5, "registerNewAudioPowerSpectrumForStreamToken:powerSpectrumKey:spectrumSource:", a3, a4, v11);
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316162;
        v25 = v13;
        v26 = 2080;
        v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
        v28 = 1024;
        v29 = 148;
        v30 = 2112;
        v31 = a5;
        v32 = 2112;
        v33 = a3;
        v15 = " [%s] %s:%d powerSpectrumMeter=%@ registered listener for streamToken=%@";
        v16 = v14;
        v17 = 48;
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316674;
        v25 = v18;
        v26 = 2080;
        v27 = "-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:]";
        v28 = 1024;
        v29 = 148;
        v30 = 2112;
        v31 = (id)v12;
        v32 = 2048;
        v33 = self;
        v34 = 2112;
        v35 = a5;
        v36 = 2112;
        v37 = a3;
        v15 = " [%s] %s:%d %@(%p) powerSpectrumMeter=%@ registered listener for streamToken=%@";
        v16 = v19;
        v17 = 68;
        goto LABEL_12;
      }
    }
  }
  return v11 != 0;
}

- (id)registerStreamTokenForCellularTapType:(id)a3 clientProcessId:(int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  VCCellularAudioTap *v12;
  unsigned int ID;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  __int16 v39;
  VCAudioPowerSpectrumManager *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unsigned int v44;
  uint64_t v45;

  v6 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "objectForKeyedSubscript:");
  if (!v9)
  {
    v10 = objc_msgSend(a3, "unsignedIntValue");
    if (v10 >= 2)
    {
      v15 = -2142765055;
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:].cold.1();
            if (!a5)
              return 0;
            goto LABEL_41;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v31 = 136316418;
            v32 = v24;
            v33 = 2080;
            v34 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:]";
            v35 = 1024;
            v36 = 163;
            v37 = 2112;
            v38 = (id)v16;
            v39 = 2048;
            v40 = self;
            v41 = 2112;
            v42 = a3;
            _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid tapType=%@", (uint8_t *)&v31, 0x3Au);
            if (!a5)
              return 0;
            goto LABEL_41;
          }
        }
      }
      goto LABEL_40;
    }
    v11 = v10;
    if (self->_cellularAudioTap
      || (v12 = -[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]([VCCellularAudioTap alloc], "initWithProcessId:delegate:delegateQueue:", v6, self, self->_xpcCommandQueue), (self->_cellularAudioTap = v12) != 0))
    {
      ID = VCUniqueIDGenerator_GenerateID();
      if (-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:](self->_cellularAudioTap, "addAudioTapForStreamToken:tapType:error:", ID, v11, a5))
      {
        v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ID);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "setObject:forKeyedSubscript:", v9, a3);
        return v9;
      }
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return 0;
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return 0;
        v31 = 136316162;
        v32 = v19;
        v33 = 2080;
        v34 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:]";
        v35 = 1024;
        v36 = 173;
        v37 = 2112;
        v38 = a3;
        v39 = 1024;
        LODWORD(v40) = ID;
        v21 = " [%s] %s:%d Failed to create an app tap for tapType=%@ with streamToken=%u";
        v22 = v20;
        v23 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v17 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v17 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return 0;
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return 0;
        v31 = 136316674;
        v32 = v26;
        v33 = 2080;
        v34 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:]";
        v35 = 1024;
        v36 = 173;
        v37 = 2112;
        v38 = (id)v17;
        v39 = 2048;
        v40 = self;
        v41 = 2112;
        v42 = a3;
        v43 = 1024;
        v44 = ID;
        v21 = " [%s] %s:%d %@(%p) Failed to create an app tap for tapType=%@ with streamToken=%u";
        v22 = v27;
        v23 = 64;
      }
      _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v31, v23);
      return 0;
    }
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v15 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_40;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:].cold.2();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      v15 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v28 = VRTraceErrorLogLevelToCSTR(),
            v29 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_40:
        if (!a5)
          return 0;
LABEL_41:
        v30 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v15, 0);
        v9 = 0;
        *a5 = v30;
        return v9;
      }
      v31 = 136316418;
      v32 = v28;
      v33 = 2080;
      v34 = "-[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:]";
      v35 = 1024;
      v36 = 168;
      v37 = 2112;
      v38 = (id)v18;
      v39 = 2048;
      v40 = self;
      v41 = 2112;
      v42 = a3;
      _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the audio tap for tapType=%@", (uint8_t *)&v31, 0x3Au);
    }
    v15 = -2142765054;
    if (!a5)
      return 0;
    goto LABEL_41;
  }
  return v9;
}

- (id)powerSpectrumMetersForCellularTapType:(id)a3
{
  void *v5;
  uint64_t v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCAudioPowerSpectrumManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "objectForKeyedSubscript:");
  if (!v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
    if (v6)
    {
      v5 = (void *)v6;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "setObject:forKeyedSubscript:", v6, a3);
    }
    else
    {
      if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioPowerSpectrumManager powerSpectrumMetersForCellularTapType:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v11 = 136316418;
            v12 = v9;
            v13 = 2080;
            v14 = "-[VCAudioPowerSpectrumManager powerSpectrumMetersForCellularTapType:]";
            v15 = 1024;
            v16 = 189;
            v17 = 2112;
            v18 = v8;
            v19 = 2048;
            v20 = self;
            v21 = 2112;
            v22 = a3;
            _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed allocate the client set for tapType=%@", (uint8_t *)&v11, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return v5;
}

- (void)dispatchedCleanUpCellularAudioTap
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  -[VCCellularAudioTap invalidate](self->_cellularAudioTap, "invalidate");

  self->_cellularAudioTap = 0;
}

- (void)dispatchedCleanUpPowerSpectrumSetForCellularTapType:(id)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCAudioPowerSpectrumManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "objectForKeyedSubscript:", a3);
  if (v5 && !objc_msgSend(v5, "count"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "setObject:forKeyedSubscript:", 0, a3);
    v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "objectForKeyedSubscript:", a3);
    if (v6)
    {
      -[VCCellularAudioTap removeAudioTapForStreamToken:error:](self->_cellularAudioTap, "removeAudioTapForStreamToken:error:", objc_msgSend(v6, "unsignedIntValue"), 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "setObject:forKeyedSubscript:", 0, a3);
      if (!-[NSMutableDictionary count](self->_cellularTapTypeToStreamTokenMap, "count"))
        -[VCAudioPowerSpectrumManager dispatchedCleanUpCellularAudioTap](self, "dispatchedCleanUpCellularAudioTap");
    }
    else if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v10 = 136316418;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:]";
          v14 = 1024;
          v15 = 215;
          v16 = 2112;
          v17 = v7;
          v18 = 2048;
          v19 = self;
          v20 = 2112;
          v21 = a3;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream token not found for tapType=%@", (uint8_t *)&v10, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)registerListenerWithCellularTapType:(id)a3 clientProcessId:(id)a4 powerSpectrumMeter:(id)a5 powerSpectrumMeterKey:(id)a6 resultDictionary:(id *)a7 error:(id *)a8
{
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *xpcCommandQueue;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  _QWORD block[11];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  VCAudioPowerSpectrumManager *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (!a3)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v26 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.1();
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    v26 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v50 = v32;
        v51 = 2080;
        v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:power"
              "SpectrumMeterKey:resultDictionary:error:]";
        v53 = 1024;
        v54 = 252;
        v55 = 2112;
        v56 = v23;
        v57 = 2048;
        v58 = self;
        v34 = " [%s] %s:%d %@(%p) Missing tapType";
        v35 = v33;
        v36 = 48;
        goto LABEL_87;
      }
    }
    goto LABEL_97;
  }
  if (!a4)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v26 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.2();
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    v26 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_97;
    v37 = VRTraceErrorLogLevelToCSTR();
    v38 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_97;
    *(_DWORD *)buf = 136316418;
    v50 = v37;
    v51 = 2080;
    v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpec"
          "trumMeterKey:resultDictionary:error:]";
    v53 = 1024;
    v54 = 253;
    v55 = 2112;
    v56 = v24;
    v57 = 2048;
    v58 = self;
    v59 = 2112;
    v60 = a3;
    v34 = " [%s] %s:%d %@(%p) Process id is missing tapType=%@";
LABEL_86:
    v35 = v38;
    v36 = 58;
LABEL_87:
    _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
    if (!a8)
      goto LABEL_99;
    goto LABEL_98;
  }
  if (!a5)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v26 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.3();
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    v26 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_97;
    v39 = VRTraceErrorLogLevelToCSTR();
    v38 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_97;
    *(_DWORD *)buf = 136316418;
    v50 = v39;
    v51 = 2080;
    v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpec"
          "trumMeterKey:resultDictionary:error:]";
    v53 = 1024;
    v54 = 254;
    v55 = 2112;
    v56 = v25;
    v57 = 2048;
    v58 = self;
    v59 = 2112;
    v60 = a3;
    v34 = " [%s] %s:%d %@(%p) Missing power spectrum meter for tapType=%@";
    goto LABEL_86;
  }
  if (!a6)
  {
    v26 = -2142765055;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.4();
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_97;
    v40 = VRTraceErrorLogLevelToCSTR();
    v38 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_97;
    *(_DWORD *)buf = 136316418;
    v50 = v40;
    v51 = 2080;
    v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpec"
          "trumMeterKey:resultDictionary:error:]";
    v53 = 1024;
    v54 = 255;
    v55 = 2112;
    v56 = v27;
    v57 = 2048;
    v58 = self;
    v59 = 2112;
    v60 = a3;
    v34 = " [%s] %s:%d %@(%p) Missing power spectrum meter key for tapType=%@";
    goto LABEL_86;
  }
  v16 = (void *)v15;
  if (objc_msgSend(a3, "unsignedIntValue") >= 2)
  {
    v26 = -2142765055;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.5();
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
      goto LABEL_97;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v50 = v41;
        v51 = 2080;
        v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:power"
              "SpectrumMeterKey:resultDictionary:error:]";
        v53 = 1024;
        v54 = 257;
        v55 = 2112;
        v56 = v28;
        v57 = 2048;
        v58 = self;
        v59 = 2112;
        v60 = a3;
        v34 = " [%s] %s:%d %@(%p) Invalid tapType=%@";
        goto LABEL_86;
      }
    }
LABEL_97:
    if (!a8)
    {
LABEL_99:
      -[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:](self, "dispatchedCleanUpPowerSpectrumSetForCellularTapType:", a3);
      return 0;
    }
LABEL_98:
    *a8 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v26, 0);
    goto LABEL_99;
  }
  v17 = -[VCAudioPowerSpectrumManager powerSpectrumMetersForCellularTapType:](self, "powerSpectrumMetersForCellularTapType:", a3);
  if (!v17)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v26 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.6();
          v26 = -2142765054;
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v29 = &stru_1E9E58EE0;
      v26 = -2142765054;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v50 = v42;
          v51 = 2080;
          v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:pow"
                "erSpectrumMeterKey:resultDictionary:error:]";
          v53 = 1024;
          v54 = 259;
          v55 = 2112;
          v56 = v29;
          v57 = 2048;
          v58 = self;
          v59 = 2112;
          v60 = a3;
          _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) power spectrum meter set not found for tapType=%@", buf, 0x3Au);
          v26 = -2142765054;
          if (!a8)
            goto LABEL_99;
          goto LABEL_98;
        }
      }
    }
    goto LABEL_97;
  }
  v18 = v17;
  if (objc_msgSend(v17, "containsObject:", a5))
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v26 = -2142765015;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_97;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_97;
      -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.7();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      v26 = -2142765015;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_97;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_97;
      *(_DWORD *)buf = 136316418;
      v50 = v44;
      v51 = 2080;
      v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSp"
            "ectrumMeterKey:resultDictionary:error:]";
      v53 = 1024;
      v54 = 260;
      v55 = 2112;
      v56 = v30;
      v57 = 2048;
      v58 = self;
      v59 = 2112;
      v60 = a3;
      _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) power spectrum meter is already registered for tapType=%@", buf, 0x3Au);
    }
    v26 = -2142765015;
    if (!a8)
      goto LABEL_99;
    goto LABEL_98;
  }
  v19 = -[VCAudioPowerSpectrumManager registerStreamTokenForCellularTapType:clientProcessId:error:](self, "registerStreamTokenForCellularTapType:clientProcessId:error:", a3, objc_msgSend(a4, "unsignedIntegerValue"), a8);
  if (!v19)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:].cold.8();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v46 = VRTraceErrorLogLevelToCSTR();
        v47 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v50 = v46;
          v51 = 2080;
          v52 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:pow"
                "erSpectrumMeterKey:resultDictionary:error:]";
          v53 = 1024;
          v54 = 264;
          v55 = 2112;
          v56 = v31;
          v57 = 2048;
          v58 = self;
          v59 = 2112;
          v60 = a3;
          _os_log_error_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve the stream token for tapType=%@", buf, 0x3Au);
        }
      }
    }
    goto LABEL_99;
  }
  v20 = v19;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCCellularAudioTap tapToken](self->_cellularAudioTap, "tapToken")), CFSTR("vcBasebandAudioTapTapToken"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("vcBasebandAudioTapDirectionToken"));
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke;
  block[3] = &unk_1E9E53B50;
  block[4] = self;
  block[5] = v20;
  block[6] = a6;
  block[7] = a5;
  block[9] = a3;
  block[10] = a8;
  block[8] = v18;
  dispatch_async(xpcCommandQueue, block);
  if (a7)
    *a7 = v16;
  return 1;
}

void __147__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80)))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(const __CFString **)(a1 + 56);
          v7 = *(_QWORD *)(a1 + 72);
          v8 = *(_QWORD *)(a1 + 40);
          v22 = 136316418;
          v23 = v4;
          v24 = 2080;
          v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:pow"
                "erSpectrumMeterKey:resultDictionary:error:]_block_invoke";
          v26 = 1024;
          v27 = 276;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v7;
          v32 = 2112;
          v33 = v8;
          v9 = " [%s] %s:%d powerSpectrumMeter=%@ registered listener for tapType=%@ with streamToken=%@";
          v10 = v5;
          v11 = 58;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v22, v11);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 56);
          v15 = *(_QWORD *)(a1 + 72);
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *(_QWORD *)(a1 + 40);
          v22 = 136316930;
          v23 = v12;
          v24 = 2080;
          v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:pow"
                "erSpectrumMeterKey:resultDictionary:error:]_block_invoke";
          v26 = 1024;
          v27 = 276;
          v28 = 2112;
          v29 = v2;
          v30 = 2048;
          v31 = v16;
          v32 = 2112;
          v33 = v14;
          v34 = 2112;
          v35 = v15;
          v36 = 2112;
          v37 = v17;
          v9 = " [%s] %s:%d %@(%p) powerSpectrumMeter=%@ registered listener for tapType=%@ with streamToken=%@";
          v10 = v13;
          v11 = 78;
          goto LABEL_18;
        }
      }
    }
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __147__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 72);
        v22 = 136316418;
        v23 = v18;
        v24 = 2080;
        v25 = "-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:power"
              "SpectrumMeterKey:resultDictionary:error:]_block_invoke";
        v26 = 1024;
        v27 = 278;
        v28 = 2112;
        v29 = v3;
        v30 = 2048;
        v31 = v20;
        v32 = 2112;
        v33 = v21;
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) client set not found for tapType=%@", (uint8_t *)&v22, 0x3Au);
      }
    }
  }
}

- (BOOL)dispatchedUnregisterListenerWithCellularTapType:(id)a3 powerSpectrumMeter:(id)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL result;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BYTE v30[24];
  __int128 v31;
  VCAudioPowerSpectrumManager *v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (!a3)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v16 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_61;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_61;
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.1();
      if (!a5)
        return 0;
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    v16 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 136316162;
        *(_QWORD *)&v30[4] = v19;
        *(_WORD *)&v30[12] = 2080;
        *(_QWORD *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 308;
        WORD2(v31) = 2112;
        *(_QWORD *)((char *)&v31 + 6) = v13;
        HIWORD(v31) = 2048;
        v32 = self;
        v21 = " [%s] %s:%d %@(%p) Missing tapType";
        v22 = v20;
        v23 = 48;
        goto LABEL_65;
      }
    }
    goto LABEL_61;
  }
  if (!a4)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v16 = -2142765055;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_61;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_61;
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.2();
      if (!a5)
        return 0;
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    v16 = -2142765055;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    *(_DWORD *)v30 = 136316418;
    *(_QWORD *)&v30[4] = v24;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 309;
    WORD2(v31) = 2112;
    *(_QWORD *)((char *)&v31 + 6) = v14;
    HIWORD(v31) = 2048;
    v32 = self;
    LOWORD(v33) = 2112;
    *(_QWORD *)((char *)&v33 + 2) = a3;
    v21 = " [%s] %s:%d %@(%p) Missing power spectrum meter for tapType=%@";
LABEL_64:
    v22 = v25;
    v23 = 58;
LABEL_65:
    _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v21, v30, v23);
    if (a5)
      goto LABEL_62;
    return 0;
  }
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "objectForKeyedSubscript:", a3);
  if (!v9)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      v16 = -2142765034;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_61;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_61;
      -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.3();
      if (!a5)
        return 0;
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    v16 = -2142765034;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    v26 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    *(_DWORD *)v30 = 136316418;
    *(_QWORD *)&v30[4] = v26;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 311;
    WORD2(v31) = 2112;
    *(_QWORD *)((char *)&v31 + 6) = v15;
    HIWORD(v31) = 2048;
    v32 = self;
    LOWORD(v33) = 2112;
    *(_QWORD *)((char *)&v33 + 2) = a3;
    v21 = " [%s] %s:%d %@(%p) No registered power spectrum meters found for tapType=%@";
    goto LABEL_64;
  }
  v10 = v9;
  if ((objc_msgSend(v9, "containsObject:", a4) & 1) != 0)
  {
    v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "objectForKeyedSubscript:", a3);
    if (v11)
    {
      objc_msgSend(a4, "releaseAudioPowerSpectrumForStreamToken:", v11);
      objc_msgSend(v10, "removeObject:", a4);
      -[VCAudioPowerSpectrumManager dispatchedCleanUpPowerSpectrumSetForCellularTapType:](self, "dispatchedCleanUpPowerSpectrumSetForCellularTapType:", a3);
      objc_msgSend(a4, "cleanUpEventQueue");
      return 1;
    }
    v16 = -2142765034;
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_61;
      v28 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_61;
      *(_DWORD *)v30 = 136316418;
      *(_QWORD *)&v30[4] = v28;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 314;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = v18;
      HIWORD(v31) = 2048;
      v32 = self;
      LOWORD(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 2) = a3;
      v21 = " [%s] %s:%d %@(%p) Stream token not found for tapType=%@";
      goto LABEL_64;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.4();
    if (!a5)
      return 0;
LABEL_62:
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v16, 0, *(_OWORD *)v30, *(_QWORD *)&v30[16], v31, v32, v33);
    result = 0;
    *a5 = v29;
    return result;
  }
  v16 = -2142765034;
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    -[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:].cold.5();
    if (!a5)
      return 0;
    goto LABEL_62;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v17 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 136316418;
      *(_QWORD *)&v30[4] = v27;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 312;
      WORD2(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 6) = v17;
      HIWORD(v31) = 2048;
      v32 = self;
      LOWORD(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 2) = a3;
      v21 = " [%s] %s:%d %@(%p) Power spectrum not registered for tapType=%@";
      goto LABEL_64;
    }
  }
LABEL_61:
  if (a5)
    goto LABEL_62;
  return 0;
}

- (id)serviceHandlerPowerMeterInitializeWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCAudioPowerSpectrumManager *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumBinCount"));
  if (!v7)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = v18;
          v28 = 2080;
          v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          v30 = 1024;
          v31 = 342;
          v32 = 2112;
          v33 = v15;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Bin count is invalid", buf, 0x30u);
        }
      }
    }
    v20 = -2;
    goto LABEL_35;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumRefreshRate"));
  if (!v9)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = v21;
          v28 = 2080;
          v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          v30 = 1024;
          v31 = 345;
          v32 = 2112;
          v33 = v16;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Refresh rate is invalid", buf, 0x30u);
        }
      }
    }
    v20 = -3;
LABEL_35:
    if (a4)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v20, 0);
      v13 = 0;
      *a4 = v23;
    }
    else
    {
      v13 = 0;
    }
    return v13;
  }
  v10 = (void *)v9;
  v11 = objc_msgSend(v8, "unsignedShortValue");
  objc_msgSend(v10, "doubleValue");
  v12 = -[VCAudioPowerSpectrumManager newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:](self, "newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:", v11, self, a4);
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("CONTEXT"), 0);
  }
  else
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = v24;
          v28 = 2080;
          v29 = "-[VCAudioPowerSpectrumManager serviceHandlerPowerMeterInitializeWithArguments:error:]";
          v30 = 1024;
          v31 = 348;
          v32 = 2112;
          v33 = v17;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Refresh rate is invalid", buf, 0x30u);
        }
      }
    }
    v13 = 0;
  }

  return v13;
}

- (id)serviceHandlerRegisterListenerWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  VCAudioPowerSpectrumManager *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults forceDisableAudioPowerSpectrumRegister](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableAudioPowerSpectrumRegister"))
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumStreamToken"));
      if (v9)
      {
        if (-[VCAudioPowerSpectrumManager registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:](self, "registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:", v9, v9, v8, a4))
        {
          return 0;
        }
        if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:].cold.2();
          }
          goto LABEL_48;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3
          || (v33 = VRTraceErrorLogLevelToCSTR(),
              v31 = *MEMORY[0x1E0CF2758],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
        {
LABEL_48:
          v29 = -7;
LABEL_49:
          if (a4)
            *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v29, 0);
          return 0;
        }
        v34 = 136316162;
        v35 = v33;
        v36 = 2080;
        v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
        v38 = 1024;
        v39 = 370;
        v40 = 2112;
        v41 = v14;
        v42 = 2048;
        v43 = self;
        v32 = " [%s] %s:%d %@(%p) Failed to register the listener";
      }
      else
      {
        if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:].cold.1();
          }
          goto LABEL_48;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v13 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_48;
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        v34 = 136316162;
        v35 = v30;
        v36 = 2080;
        v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
        v38 = 1024;
        v39 = 367;
        v40 = 2112;
        v41 = v13;
        v42 = 2048;
        v43 = self;
        v32 = " [%s] %s:%d %@(%p) audioSpectrumRegisterListener: error no stream token specified";
      }
      _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0x30u);
      goto LABEL_48;
    }
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_40;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v34 = 136315650;
      v35 = v20;
      v36 = 2080;
      v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      v38 = 1024;
      v39 = 364;
      v22 = " [%s] %s:%d Invalid context. Power spectrum meter is nil";
      v23 = v21;
      v24 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_40;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v34 = 136316162;
      v35 = v27;
      v36 = 2080;
      v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      v38 = 1024;
      v39 = 364;
      v40 = 2112;
      v41 = v12;
      v42 = 2048;
      v43 = self;
      v22 = " [%s] %s:%d %@(%p) Invalid context. Power spectrum meter is nil";
      v23 = v28;
      v24 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v34, v24);
LABEL_40:
    v29 = -6;
    goto LABEL_49;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v34 = 136315650;
    v35 = v15;
    v36 = 2080;
    v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
    v38 = 1024;
    v39 = 361;
    v17 = " [%s] %s:%d Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTURM_REGISTER_LISTENER_KEY";
    v18 = v16;
    v19 = 28;
LABEL_34:
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v34, v19);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v11 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136316162;
      v35 = v25;
      v36 = 2080;
      v37 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterListenerWithArguments:error:]";
      v38 = 1024;
      v39 = 361;
      v40 = 2112;
      v41 = v11;
      v42 = 2048;
      v43 = self;
      v17 = " [%s] %s:%d %@(%p) Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTU"
            "RM_REGISTER_LISTENER_KEY";
      v18 = v26;
      v19 = 48;
      goto LABEL_34;
    }
  }
  return 0;
}

- (id)serviceHandlerUnregisterListenerWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCAudioPowerSpectrumManager *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!v7)
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_22;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v23 = 136315650;
      v24 = v13;
      v25 = 2080;
      v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
      v27 = 1024;
      v28 = 381;
      v15 = " [%s] %s:%d Invalid context. Power spectrum meter is nil";
      v16 = v14;
      v17 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_22;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v23 = 136316162;
      v24 = v18;
      v25 = 2080;
      v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
      v27 = 1024;
      v28 = 381;
      v29 = 2112;
      v30 = v11;
      v31 = 2048;
      v32 = self;
      v15 = " [%s] %s:%d %@(%p) Invalid context. Power spectrum meter is nil";
      v16 = v19;
      v17 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
LABEL_22:
    v20 = -6;
    goto LABEL_28;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumStreamToken"));
  if (v9)
  {
    objc_msgSend(v8, "releaseAudioPowerSpectrumForStreamToken:", v9);
    return 0;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = v21;
        v25 = 2080;
        v26 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterListenerWithArguments:error:]";
        v27 = 1024;
        v28 = 384;
        v29 = 2112;
        v30 = v12;
        v31 = 2048;
        v32 = self;
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audioSpectrumUnregisterListener: error no stream token specified", (uint8_t *)&v23, 0x30u);
      }
    }
  }
  v20 = -7;
LABEL_28:
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v20, 0);
  return 0;
}

- (id)serviceHandlerRegisterCellularTapWithArguments:(id)a3 error:(id *)a4
{
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCAudioPowerSpectrumManager *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = 0;
  if (-[VCDefaults forceDisableAudioPowerSpectrumRegister](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableAudioPowerSpectrumRegister"))
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v26 = v14;
          v27 = 2080;
          v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
          v29 = 1024;
          v30 = 398;
          v16 = " [%s] %s:%d Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSPECTURM_"
                "REGISTER_LISTENER_KEY";
          v17 = v15;
          v18 = 28;
LABEL_26:
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = v19;
          v27 = 2080;
          v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
          v29 = 1024;
          v30 = 398;
          v31 = 2112;
          v32 = v12;
          v33 = 2048;
          v34 = self;
          v16 = " [%s] %s:%d %@(%p) Force disableAudioPowerSpectrumRegister is YES: inhibiting call to API_VCAUDIOPOWERSP"
                "ECTURM_REGISTER_LISTENER_KEY";
          v17 = v20;
          v18 = 48;
          goto LABEL_26;
        }
      }
    }
LABEL_3:
    v7 = 0;
    v8 = 0;
    if (!a4)
      return v23;
    goto LABEL_4;
  }
  if (-[VCAudioPowerSpectrumManager registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:](self, "registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumCellularTapType")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumMeterKeyType")), &v23, &v24))
  {
    goto LABEL_3;
  }
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v26 = v21;
        v27 = 2080;
        v28 = "-[VCAudioPowerSpectrumManager serviceHandlerRegisterCellularTapWithArguments:error:]";
        v29 = 1024;
        v30 = 406;
        v31 = 2112;
        v32 = v13;
        v33 = 2048;
        v34 = self;
        v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to register the listener. error=%@", buf, 0x3Au);
      }
    }
  }
  v8 = -7;
  v7 = 1;
  if (a4)
  {
LABEL_4:
    v9 = v24;
    v10 = v7 ^ 1;
    if (v24)
      v10 = 1;
    if ((v10 & 1) == 0)
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AVConference"), v8, 0);
    *a4 = v9;
  }
  return v23;
}

- (id)serviceHandlerUnregisterCellularTagWithArguments:(id)a3 error:(id *)a4
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCAudioPowerSpectrumManager *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  if (!-[VCAudioPowerSpectrumManager dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:](self, "dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPowerSpectrumCellularTapType")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT")), &v10))
  {
    if ((VCAudioPowerSpectrumManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCAudioPowerSpectrumManager serviceHandlerUnregisterCellularTagWithArguments:error:].cold.1();
          if (!a4)
            return 0;
          goto LABEL_13;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v12 = v7;
          v13 = 2080;
          v14 = "-[VCAudioPowerSpectrumManager serviceHandlerUnregisterCellularTagWithArguments:error:]";
          v15 = 1024;
          v16 = 423;
          v17 = 2112;
          v18 = v6;
          v19 = 2048;
          v20 = self;
          v21 = 2112;
          v22 = v10;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unregister the listener. error=%@", buf, 0x3Au);
          if (!a4)
            return 0;
          goto LABEL_13;
        }
      }
    }
  }
  if (a4)
LABEL_13:
    *a4 = v10;
  return 0;
}

- (id)serviceHandlerPowerMeterTerminateWithArguments:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v9;

  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"), a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v7 = 0;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    v7 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  -[VCAudioPowerSpectrumManager terminatePowerSpectrumMeter:](self, "terminatePowerSpectrumMeter:", v6);
  return v7;
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke;
  v10[3] = &unk_1E9E53848;
  v10[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken", v10, self->_xpcCommandQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_2;
  v9[3] = &unk_1E9E53848;
  v9[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumRegisterListener", v9, self->_xpcCommandQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_3;
  v8[3] = &unk_1E9E53848;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumUnregisterListener", v8, self->_xpcCommandQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_4;
  v7[3] = &unk_1E9E53848;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumRegisterCellularTap", v7, self->_xpcCommandQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_5;
  v6[3] = &unk_1E9E53848;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumUnregisterCellularTap", v6, self->_xpcCommandQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_6;
  v5[3] = &unk_1E9E53848;
  v5[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcAudioPowerSpectrumTerminateMeter", v5, self->_xpcCommandQueue);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend(v5, "serviceHandlerPowerMeterInitializeWithArguments:error:", a2, a3);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend(v5, "serviceHandlerRegisterListenerWithArguments:error:", a2, a3);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend(v5, "serviceHandlerUnregisterListenerWithArguments:error:", a2, a3);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend(v5, "serviceHandlerRegisterCellularTapWithArguments:error:", a2, a3);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend(v5, "serviceHandlerUnregisterCellularTagWithArguments:error:", a2, a3);
}

id __55__VCAudioPowerSpectrumManager_registerBlocksForService__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "serviceHandlerPowerMeterTerminateWithArguments:error:", a2, a3);
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumInitializeRemoteVideoForStreamToken");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumTerminateMeter");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumRegisterListener");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumUnregisterListener");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumRegisterCellularTap");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcAudioPowerSpectrumUnregisterCellularTap");
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((VCAudioPowerSpectrumManager *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioPowerSpectrumManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_17;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    v16 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v23 = v14;
        v24 = 2080;
        v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
        v26 = 1024;
        v27 = 514;
        v28 = 2112;
        v29 = (id)v7;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = a3;
        v34 = 2112;
        v35 = a4;
        v11 = " [%s] %s:%d %@(%p) meter[%p] spectrums[%@]";
        v12 = v15;
        v13 = 68;
        goto LABEL_13;
      }
      goto LABEL_17;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    *(_DWORD *)buf = 136316674;
    v23 = v14;
    v24 = 2080;
    v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    v26 = 1024;
    v27 = 514;
    v28 = 2112;
    v29 = (id)v7;
    v30 = 2048;
    v31 = self;
    v32 = 2048;
    v33 = a3;
    v34 = 2112;
    v35 = a4;
    v17 = " [%s] %s:%d %@(%p) meter[%p] spectrums[%@]";
    v18 = v15;
    v19 = 68;
LABEL_19:
    _os_log_debug_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_17;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  v10 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    *(_DWORD *)buf = 136316162;
    v23 = v8;
    v24 = 2080;
    v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    v26 = 1024;
    v27 = 514;
    v28 = 2048;
    v29 = a3;
    v30 = 2112;
    v31 = a4;
    v17 = " [%s] %s:%d meter[%p] spectrums[%@]";
    v18 = v9;
    v19 = 48;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = v8;
    v24 = 2080;
    v25 = "-[VCAudioPowerSpectrumManager audioPowerSpectrumMeter:didUpdateAudioPowerSpectrums:]";
    v26 = 1024;
    v27 = 514;
    v28 = 2048;
    v29 = a3;
    v30 = 2112;
    v31 = a4;
    v11 = " [%s] %s:%d meter[%p] spectrums[%@]";
    v12 = v9;
    v13 = 48;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }
LABEL_17:
  v20 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "newSecureArchivedDataWithRootObject:", a4);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v20, CFSTR("vcAudioPowerSpectrumRemoteSpectrum"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAudioPowerSpectrumServerDidReceiveSpectrum", v21, a3);

}

- (void)serverDidDie
{
  uint64_t i;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  NSMutableDictionary *obj;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_powerSpectrumMetersForCellularTapType;
  v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v14)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_powerSpectrumMetersForCellularTapType, "objectForKeyedSubscript:", v4);
        v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cellularTapTypeToStreamTokenMap, "objectForKeyedSubscript:", v4);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(v5);
              v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAudioPowerSpectrumServerSpectrumInterrupted", 0, v11);
              objc_msgSend(v11, "releaseAudioPowerSpectrumForStreamToken:", v6);
              -[VCAudioPowerSpectrumManager terminatePowerSpectrumMeter:](self, "terminatePowerSpectrumMeter:", v11);
            }
            v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
          }
          while (v8);
        }
      }
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v14);
  }
}

- (NSMutableArray)meters
{
  return self->_meters;
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the power spectrum meter dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __61__VCAudioPowerSpectrumManager_registerAudioPowerMeterSource___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "streamToken");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  OUTLINED_FUNCTION_4_0();
  v9 = 108;
  v10 = 2048;
  v11 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d source[streamToken=%ld] already existed", (uint8_t *)&v6, 0x26u);
}

- (void)newPowerSpectrumMeterWithBinCount:refreshRate:delegate:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCPowerSpectrumMeter failed to allocate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithStreamToken:powerSpectrumKey:powerSpectrumMeter:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audioSpectrumRegisterListener: error no powerSpectrumSource for streamToken=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerStreamTokenForCellularTapType:clientProcessId:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerStreamTokenForCellularTapType:clientProcessId:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)powerSpectrumMetersForCellularTapType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed allocate the client set for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedCleanUpPowerSpectrumSetForCellularTapType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream token not found for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing tapType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Process id is missing tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing power spectrum meter for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing power spectrum meter key for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d power spectrum meter set not found for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d power spectrum meter is already registered for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)registerListenerWithCellularTapType:clientProcessId:powerSpectrumMeter:powerSpectrumMeterKey:resultDictionary:error:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the stream token for tapType=%@");
  OUTLINED_FUNCTION_3();
}

void __147__VCAudioPowerSpectrumManager_registerListenerWithCellularTapType_clientProcessId_powerSpectrumMeter_powerSpectrumMeterKey_resultDictionary_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d client set not found for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing tapType", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing power spectrum meter for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No registered power spectrum meters found for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream token not found for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUnregisterListenerWithCellularTapType:powerSpectrumMeter:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Power spectrum not registered for tapType=%@");
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Bin count is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Refresh rate is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerPowerMeterInitializeWithArguments:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Refresh rate is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerRegisterListenerWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audioSpectrumRegisterListener: error no stream token specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerRegisterListenerWithArguments:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register the listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerUnregisterListenerWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audioSpectrumUnregisterListener: error no stream token specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerRegisterCellularTapWithArguments:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register the listener. error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerUnregisterCellularTagWithArguments:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unregister the listener. error=%@");
  OUTLINED_FUNCTION_3();
}

@end
