@implementation AVCTestMonitor

- (AVCTestMonitor)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  AVCTestMonitor *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = v7;
      v14 = 2080;
      v15 = "-[AVCTestMonitor initWithDelegate:queue:]";
      v16 = 1024;
      v17 = 47;
      v18 = 2112;
      v19 = a3;
      v20 = 2112;
      v21 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@, queue=%@", buf, 0x30u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVCTestMonitor;
  v9 = -[AVCTestMonitor init](&v11, sel_init);
  if (v9)
  {
    v9->_connection = objc_alloc_init(AVConferenceXPCClient);
    objc_storeWeak(&v9->_delegate, a3);
    v9->_reportToken = VCUniqueIDGenerator_GenerateID();
    -[AVCTestMonitor setupNotificationQueue:](v9, "setupNotificationQueue:", a4);
    -[AVCTestMonitor registerBlocksForNotifications](v9, "registerBlocksForNotifications");
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *delegateNotificationQueue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVCTestMonitor dealloc]";
      v11 = 1024;
      v12 = 63;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  -[AVCTestMonitor deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue)
    dispatch_release(delegateNotificationQueue);

  objc_storeWeak(&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)AVCTestMonitor;
  -[AVCTestMonitor dealloc](&v6, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (id)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke;
  v4[3] = &unk_1E9E52730;
  v4[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:](self->_connection, "registerBlockForService:block:queue:eventLogLevel:", "vcTestMonitorDidReportSessionStats", v4, self->_delegateNotificationQueue, 7);
}

void __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  _DWORD *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  AVCTestMonitorReport *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  _DWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (_DWORD *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SessionStatsReportToken")), "unsignedIntValue") == v4[8])
    {
      if ((_DWORD *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v20 = v6;
        v21 = 2080;
        v22 = "-[AVCTestMonitor registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 90;
        v8 = " [%s] %s:%d received callback for stats report";
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
        v20 = v11;
        v21 = 2080;
        v22 = "-[AVCTestMonitor registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 90;
        v25 = 2112;
        v26 = v5;
        v27 = 2048;
        v28 = v4;
        v8 = " [%s] %s:%d %@(%p) received callback for stats report";
        v9 = v12;
        v10 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = objc_alloc_init(AVCTestMonitorReport);
        v14 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("InitialMemoryUsageInfo"));
        v15 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("MemoryUsageInfo"));
        v16 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NetworkAgentRefCount"));
        -[AVCTestMonitorReport setMemoryUsageMB:](v13, "setMemoryUsageMB:", objc_msgSend(v15, "integerValue"));
        -[AVCTestMonitorReport setInitialMemoryUsageMB:](v13, "setInitialMemoryUsageMB:", objc_msgSend(v14, "integerValue"));
        -[AVCTestMonitorReport setNetworkAgentRefCount:](v13, "setNetworkAgentRefCount:", objc_msgSend(v16, "integerValue"));
        v17 = objc_msgSend(v4, "delegateNotificationQueue");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke_71;
        v18[3] = &unk_1E9E52238;
        v18[4] = v4;
        v18[5] = v13;
        dispatch_async(v17, v18);

      }
    }
  }
}

uint64_t __48__AVCTestMonitor_registerBlocksForNotifications__block_invoke_71(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didReceiveReport:", *(_QWORD *)(a1 + 40));
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcTestMonitorDidReportSessionStats");
}

- (void)setupNotificationQueue:(id)a3
{
  NSObject *CustomRootQueue;

  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCTestMonitor.notificationQueue", 0, CustomRootQueue);
  }
}

- (void)requestSessionMediaDaemonStatsReport
{
  AVConferenceXPCClient *connection;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  v3 = CFSTR("SessionStatsReportToken");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_reportToken);
  -[AVConferenceXPCClient sendMessageSync:arguments:](connection, "sendMessageSync:arguments:", "vcTestMonitorRequestSessionStatsReport", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
}

- (void)updateAudioInjectConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[AVCTestMonitor updateAudioInjectConfig:]";
      v12 = 1024;
      v13 = 127;
      v14 = 2112;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d injectAudioConfig=%@", (uint8_t *)&v8, 0x26u);
    }
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "injectAudioConfigType") == 1), CFSTR("vcTestMonitorInjectAudioToneSwitch"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorInjectAudio", v7);

}

- (void)forceNetworkCellular:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCTestMonitor forceNetworkCellular:]";
      v13 = 1024;
      v14 = 136;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceCellular=%d", buf, 0x22u);
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("vcTestMonitorForceNetworkCellSwitch"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorForceNetworkCell", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
}

- (void)setEnableLoopbackInterface:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCTestMonitor setEnableLoopbackInterface:]";
      v13 = 1024;
      v14 = 142;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableLoopbackInterface=%d", buf, 0x22u);
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("vcTestMonitorSetEnableLoopbackValue"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEnableLoopback", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
}

- (void)setEmulatedRxPLR:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCTestMonitor setEmulatedRxPLR:]";
      v13 = 1024;
      v14 = 148;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d emulatedRxPLR=%f", buf, 0x26u);
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3, CFSTR("vcTestMonitorSetEmulatedRxPLR"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEmulatedRxPLR", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
}

- (void)setForcedTargetBitrate:(int)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("vcTestMonitorSetForcedTargetBitrate");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetForcedTargetBitrate", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (void)setForcedCapBitrate:(int)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("vcTestMonitorSetForcedCapBitrate");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetForcedCapBitrate", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (void)setEmulatedNetworkConfigurationPath:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("vcTestMonitorEmulatedNetworkConfigPath");
  v4[0] = a3;
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorEmulatedNetworkConfigPath", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
}

- (void)setEnableAudioPowerSpectrumReport:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCTestMonitor setEnableAudioPowerSpectrumReport:]";
      v13 = 1024;
      v14 = 169;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableAudioPowerSpectrumReport=%d", buf, 0x22u);
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("vcTestMonitorSetEnableAudioPowerSpectrumReport"));
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcTestMonitorSetEnableAudioPowerSpectrumReport", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
}

@end
