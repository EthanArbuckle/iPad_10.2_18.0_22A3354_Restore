@implementation VCTestMonitorManager

- (VCTestMonitorManager)init
{
  VCTestMonitorManager *v2;
  NSObject *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCTestMonitorManager;
  v2 = -[VCTestMonitorManager init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCTestMonitorManager.xpcCommandQueue", v3);
    v2->_xpcCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCTestMonitorManager.xpcNotificationQueue", v3);
    *(_QWORD *)&v2->_forcedTargetBitrate = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);
  dispatch_release((dispatch_object_t)self->_xpcCallbackQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCTestMonitorManager;
  -[VCTestMonitorManager dealloc](&v3, sel_dealloc);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_95);
  return (id)sharedManager__vcTestMonitorManager;
}

void __37__VCTestMonitorManager_sharedManager__block_invoke()
{
  if (!sharedManager__vcTestMonitorManager)
    sharedManager__vcTestMonitorManager = objc_alloc_init(VCTestMonitorManager);
}

- (void)reportSessionMediaDaemonStats:(id)a3
{
  __int128 v5;
  pid_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *initialMemoryUsage;
  uint64_t v14;
  NSObject *xpcCallbackQueue;
  _QWORD block[5];
  _QWORD v17[4];
  _QWORD v18[4];
  _BYTE buffer[48];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v5;
  v45 = v5;
  v42 = v5;
  v43 = v5;
  v40 = v5;
  v41 = v5;
  v38 = v5;
  v39 = v5;
  v36 = v5;
  v37 = v5;
  v34 = v5;
  v35 = v5;
  v32 = v5;
  v33 = v5;
  v30 = v5;
  v31 = v5;
  v28 = v5;
  v29 = v5;
  v26 = v5;
  v27 = v5;
  v24 = v5;
  v25 = v5;
  v22 = v5;
  v23 = v5;
  v20 = v5;
  v21 = v5;
  *(_OWORD *)&buffer[32] = v5;
  *(_OWORD *)buffer = v5;
  *(_OWORD *)&buffer[16] = v5;
  v6 = getpid();
  if (proc_pid_rusage(v6, 6, (rusage_info_t *)buffer))
    v7 = 0;
  else
    v7 = (*((_QWORD *)&v21 + 1) >> 20);
  if (self->_initialMemoryUsage)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 136315906;
        *(_QWORD *)&buffer[4] = v8;
        *(_WORD *)&buffer[12] = 2080;
        *(_QWORD *)&buffer[14] = "-[VCTestMonitorManager reportSessionMediaDaemonStats:]";
        *(_WORD *)&buffer[22] = 1024;
        *(_DWORD *)&buffer[24] = 94;
        *(_WORD *)&buffer[28] = 1024;
        *(_DWORD *)&buffer[30] = v7;
        v10 = " [%s] %s:%d Report memory usage %d";
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, buffer, 0x22u);
      }
    }
  }
  else
  {
    self->_initialMemoryUsage = (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 136315906;
        *(_QWORD *)&buffer[4] = v11;
        *(_WORD *)&buffer[12] = 2080;
        *(_QWORD *)&buffer[14] = "-[VCTestMonitorManager reportSessionMediaDaemonStats:]";
        *(_WORD *)&buffer[22] = 1024;
        *(_DWORD *)&buffer[24] = 92;
        *(_WORD *)&buffer[28] = 1024;
        *(_DWORD *)&buffer[30] = v7;
        v10 = " [%s] %s:%d Report initial memory usage %d";
        goto LABEL_11;
      }
    }
  }
  v12 = -[VCNetworkAgent getNetworkAgentRefCount](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "getNetworkAgentRefCount");
  v17[0] = CFSTR("SessionStatsReportToken");
  v17[1] = CFSTR("InitialMemoryUsageInfo");
  initialMemoryUsage = self->_initialMemoryUsage;
  v18[0] = a3;
  v18[1] = initialMemoryUsage;
  v17[2] = CFSTR("MemoryUsageInfo");
  v18[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v17[3] = CFSTR("NetworkAgentRefCount");
  v18[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCTestMonitorManager_reportSessionMediaDaemonStats___block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = v14;
  dispatch_async(xpcCallbackQueue, block);
}

uint64_t __54__VCTestMonitorManager_reportSessionMediaDaemonStats___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "vcTestMonitorDidReportSessionStats", *(_QWORD *)(a1 + 32));
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke;
  v13[3] = &unk_1E9E53848;
  v13[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorRequestSessionStatsReport", v13, self->_xpcCommandQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_2;
  v12[3] = &unk_1E9E53848;
  v12[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorInjectAudio", v12, self->_xpcCommandQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_31;
  v11[3] = &unk_1E9E53848;
  v11[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorForceNetworkCell", v11, self->_xpcCommandQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_35;
  v10[3] = &unk_1E9E53848;
  v10[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetEnableLoopback", v10, self->_xpcCommandQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_39;
  v9[3] = &unk_1E9E53848;
  v9[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetEmulatedRxPLR", v9, self->_xpcCommandQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_43;
  v8[3] = &unk_1E9E53848;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetForcedTargetBitrate", v8, self->_xpcCommandQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_47;
  v7[3] = &unk_1E9E53848;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorSetForcedCapBitrate", v7, self->_xpcCommandQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __48__VCTestMonitorManager_registerBlocksForService__block_invoke_51;
  v6[3] = &unk_1E9E53848;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcTestMonitorEmulatedNetworkConfigPath", v6, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __48__VCTestMonitorManager_registerBlocksForService__block_invoke_55, &unk_1E9E53848, v3), "registerBlockForService:block:queue:", "vcTestMonitorSetEnableAudioPowerSpectrumReport", &v5, self->_xpcCommandQueue);
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "reportSessionMediaDaemonStats:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SessionStatsReportToken")));
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  objc_msgSend(v5, "setToneInjectionEnabled:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcTestMonitorInjectAudioToneSwitch")), "BOOLValue"));
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return 0;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v14 = 136315906;
    v15 = v7;
    v16 = 2080;
    v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke_2";
    v18 = 1024;
    v19 = 131;
    v20 = 1024;
    LODWORD(v21) = objc_msgSend(v5, "toneInjectionEnabled");
    v9 = " [%s] %s:%d toneInjectionEnabled = %d";
    v10 = v8;
    v11 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v18 = 1024;
      v19 = 131;
      v20 = 2112;
      v21 = v6;
      v22 = 2048;
      v23 = v5;
      v24 = 1024;
      v25 = objc_msgSend(v5, "toneInjectionEnabled");
      v9 = " [%s] %s:%d %@(%p) toneInjectionEnabled = %d";
      v10 = v13;
      v11 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_31(uint64_t a1, void *a2)
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  objc_msgSend(v5, "setForceNetworkCellular:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcTestMonitorForceNetworkCellSwitch")), "BOOLValue"));
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v14 = 136315906;
    v15 = v7;
    v16 = 2080;
    v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v18 = 1024;
    v19 = 141;
    v20 = 1024;
    LODWORD(v21) = objc_msgSend(v5, "forceNetworkCellular");
    v9 = " [%s] %s:%d forceNetworkCellular = %d";
    v10 = v8;
    v11 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v18 = 1024;
      v19 = 141;
      v20 = 2112;
      v21 = v6;
      v22 = 2048;
      v23 = v5;
      v24 = 1024;
      v25 = objc_msgSend(v5, "forceNetworkCellular");
      v9 = " [%s] %s:%d %@(%p) forceNetworkCellular = %d";
      v10 = v13;
      v11 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_35(uint64_t a1, void *a2)
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcTestMonitorSetEnableLoopbackValue")), "BOOLValue");
  objc_msgSend(v5, "setEnableLoopbackInterface:", v6);
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136315906;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v19 = 1024;
    v20 = 152;
    v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d setEnableLoopbackInterfaceBlock=%d";
    v11 = v9;
    v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316418;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v19 = 1024;
      v20 = 152;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v10 = " [%s] %s:%d %@(%p) setEnableLoopbackInterfaceBlock=%d";
      v11 = v14;
      v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_39(uint64_t a1, void *a2)
{
  void *v5;
  double v6;
  double v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  float v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  float v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcTestMonitorSetEmulatedRxPLR")), "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "setEmulatedRxPLR:");
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v11 = v7;
    v18 = 136315906;
    v19 = v9;
    v20 = 2080;
    v21 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v22 = 1024;
    v23 = 163;
    v24 = 2048;
    v25 = v11;
    v12 = " [%s] %s:%d setEmulatedRxPLRBlock=%2.3f";
    v13 = v10;
    v14 = 38;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(double *)&v8 = COERCE_DOUBLE(objc_msgSend(v5, "performSelector:", sel_logPrefix));
  else
    *(double *)&v8 = COERCE_DOUBLE(&stru_1E9E58EE0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v7;
      v18 = 136316418;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v22 = 1024;
      v23 = 163;
      v24 = 2112;
      v25 = *(double *)&v8;
      v26 = 2048;
      v27 = v5;
      v28 = 2048;
      v29 = v17;
      v12 = " [%s] %s:%d %@(%p) setEmulatedRxPLRBlock=%2.3f";
      v13 = v16;
      v14 = 58;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_43(uint64_t a1, void *a2)
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcTestMonitorSetForcedTargetBitrate")), "intValue");
  objc_msgSend(v5, "setForcedTargetBitrate:", v6);
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136315906;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v19 = 1024;
    v20 = 174;
    v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d forcedTargetBitrate=%d";
    v11 = v9;
    v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316418;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v19 = 1024;
      v20 = 174;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v10 = " [%s] %s:%d %@(%p) forcedTargetBitrate=%d";
      v11 = v14;
      v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_47(uint64_t a1, void *a2)
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcTestMonitorSetForcedCapBitrate")), "intValue");
  objc_msgSend(v5, "setForcedCapBitrate:", v6);
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136315906;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v19 = 1024;
    v20 = 185;
    v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d forcedCapBitrate=%d";
    v11 = v9;
    v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316418;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v19 = 1024;
      v20 = 185;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v10 = " [%s] %s:%d %@(%p) forcedCapBitrate=%d";
      v11 = v14;
      v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_51(uint64_t a1, void *a2)
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  objc_msgSend(v5, "setEmulatedNetworkConfigPath:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcTestMonitorEmulatedNetworkConfigPath")));
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v14 = 136315906;
    v15 = v7;
    v16 = 2080;
    v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v18 = 1024;
    v19 = 195;
    v20 = 2080;
    v21 = objc_msgSend((id)objc_msgSend(v5, "emulatedNetworkConfigPath"), "UTF8String");
    v9 = " [%s] %s:%d emulatedNetworkConfigPath=%s";
    v10 = v8;
    v11 = 38;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v18 = 1024;
      v19 = 195;
      v20 = 2112;
      v21 = (uint64_t)v6;
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = objc_msgSend((id)objc_msgSend(v5, "emulatedNetworkConfigPath"), "UTF8String");
      v9 = " [%s] %s:%d %@(%p) emulatedNetworkConfigPath=%s";
      v10 = v13;
      v11 = 58;
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t __48__VCTestMonitorManager_registerBlocksForService__block_invoke_55(uint64_t a1, void *a2)
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcTestMonitorSetEnableAudioPowerSpectrumReport")), "BOOLValue");
  objc_msgSend(v5, "setEnableAudioPowerSpectrumReport:", v6);
  if ((void *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136315906;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
    v19 = 1024;
    v20 = 206;
    v21 = 1024;
    LODWORD(v22) = v6;
    v10 = " [%s] %s:%d setEnableAudioPowerSpectrumReport=%d";
    v11 = v9;
    v12 = 34;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316418;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCTestMonitorManager registerBlocksForService]_block_invoke";
      v19 = 1024;
      v20 = 206;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v5;
      v25 = 1024;
      v26 = v6;
      v10 = " [%s] %s:%d %@(%p) setEnableAudioPowerSpectrumReport=%d";
      v11 = v14;
      v12 = 54;
      goto LABEL_13;
    }
  }
  return 0;
}

- (BOOL)toneInjectionEnabled
{
  return self->_toneInjectionEnabled;
}

- (void)setToneInjectionEnabled:(BOOL)a3
{
  self->_toneInjectionEnabled = a3;
}

- (BOOL)forceNetworkCellular
{
  return self->_forceNetworkCellular;
}

- (void)setForceNetworkCellular:(BOOL)a3
{
  self->_forceNetworkCellular = a3;
}

- (BOOL)enableLoopbackInterface
{
  return self->_enableLoopbackInterface;
}

- (void)setEnableLoopbackInterface:(BOOL)a3
{
  self->_enableLoopbackInterface = a3;
}

- (double)emulatedRxPLR
{
  return self->_emulatedRxPLR;
}

- (void)setEmulatedRxPLR:(double)a3
{
  self->_emulatedRxPLR = a3;
}

- (int)forcedTargetBitrate
{
  return self->_forcedTargetBitrate;
}

- (void)setForcedTargetBitrate:(int)a3
{
  self->_forcedTargetBitrate = a3;
}

- (int)forcedCapBitrate
{
  return self->_forcedCapBitrate;
}

- (void)setForcedCapBitrate:(int)a3
{
  self->_forcedCapBitrate = a3;
}

- (NSString)emulatedNetworkConfigPath
{
  return self->_emulatedNetworkConfigPath;
}

- (void)setEmulatedNetworkConfigPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)enableAudioPowerSpectrumReport
{
  return self->_enableAudioPowerSpectrumReport;
}

- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3
{
  self->_enableAudioPowerSpectrumReport = a3;
}

- (BOOL)enableOneToOneMode
{
  return self->_enableOneToOneMode;
}

- (void)setEnableOneToOneMode:(BOOL)a3
{
  self->_enableOneToOneMode = a3;
}

@end
