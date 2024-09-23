@implementation VCQoSMonitorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_35);
  return (id)sharedInstance__vcQosMonitorManager;
}

void __37__VCQoSMonitorManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcQosMonitorManager)
    sharedInstance__vcQosMonitorManager = objc_alloc_init(VCQoSMonitorManager);
}

- (VCQoSMonitorManager)init
{
  VCQoSMonitorManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCQoSMonitorManager;
  v2 = -[VCObject init](&v5, sel_init);
  if (v2)
  {
    v2->_monitors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_sources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_reportingInterval = reportingDefaultRealtimePeriod();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCQoSMonitorManager.xpcCommandQueue", 0, CustomRootQueue);
    -[VCQoSMonitorManager registerBlocksForService](v2, "registerBlocksForService");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  -[VCQoSMonitorManager deregisterBlocksForService](self, "deregisterBlocksForService");
  v3.receiver = self;
  v3.super_class = (Class)VCQoSMonitorManager;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)registerQoSReportingSourceForToken:(int64_t)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCQoSMonitorManager registerQoSReportingSourceForToken:]_block_invoke";
      v10 = 1024;
      v11 = 83;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d registered source[streamToken=%ld]", (uint8_t *)&v6, 0x26u);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40))))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke_cold_1();
    }
  }
  else
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setSourceToken:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  }
}

- (void)unregisterQoSReportingSourceForToken:(int64_t)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(xpcCommandQueue, block);
}

void __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCQoSMonitorManager unregisterQoSReportingSourceForToken:]_block_invoke";
      v9 = 1024;
      v10 = 96;
      v11 = 2048;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d unregistered source[streamToken=%ld]", (uint8_t *)&v5, 0x26u);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40))))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke_cold_1();
  }
}

- (void)updateQoSReport:(id)a3 toClientsWithToken:(int64_t)a4
{
  uint64_t v7;
  NSObject *xpcCommandQueue;
  _QWORD block[8];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v10[0] = CFSTR("vcQoSReportDictionary");
  v10[1] = CFSTR("vcQoSReportToken");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke;
  block[3] = &unk_1E9E54B40;
  block[4] = a3;
  block[5] = self;
  block[6] = v7;
  block[7] = a4;
  dispatch_async(xpcCommandQueue, block);
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = a1[4];
        v7 = 136315906;
        v8 = v2;
        v9 = 2080;
        v10 = "-[VCQoSMonitorManager updateQoSReport:toClientsWithToken:]_block_invoke";
        v11 = 1024;
        v12 = 109;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d updateQoSReport qosReport=%@", (uint8_t *)&v7, 0x26u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_2();
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7])))
  {
    v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton");
    objc_msgSend(v6, "sendMessageAsync:arguments:toAllClientsWithContext:", "vcQoSMonitorCallbackDidReceiveReport", a1[6], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_1();
  }
}

- (void)updateEventDrivenQoSReport:(id)a3 toClientsWithToken:(int64_t)a4
{
  uint64_t v7;
  NSObject *xpcCommandQueue;
  _QWORD block[8];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v10[0] = CFSTR("vcQoSReportDictionary");
  v10[1] = CFSTR("vcQoSReportToken");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke;
  block[3] = &unk_1E9E54B40;
  block[4] = a3;
  block[5] = self;
  block[6] = v7;
  block[7] = a4;
  dispatch_async(xpcCommandQueue, block);
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = a1[4];
        v7 = 136315906;
        v8 = v2;
        v9 = 2080;
        v10 = "-[VCQoSMonitorManager updateEventDrivenQoSReport:toClientsWithToken:]_block_invoke";
        v11 = 1024;
        v12 = 122;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d updateQoSReport with non real-time keys qosReport=%@", (uint8_t *)&v7, 0x26u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_2();
    }
  }
  if (objc_msgSend(*(id *)(a1[5] + 176), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7])))
  {
    v6 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton");
    objc_msgSend(v6, "sendMessageAsync:arguments:toAllClientsWithContext:", "vcQoSMonitorCallbackDidReceiveReportEventDrivenKey", a1[6], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_1();
  }
}

- (void)registerBlocksForService
{
  uint64_t v3;

  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E0C809B0], 3221225472, __47__VCQoSMonitorManager_registerBlocksForService__block_invoke, &unk_1E9E53848, self, *MEMORY[0x1E0C80C00]), "registerBlockForService:block:queue:", "vcQosMonitorInitializForStreamToken", &v3, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcQosMonitorTerminate", &__block_literal_global_33, self->_xpcCommandQueue);
}

uint64_t __47__VCQoSMonitorManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  if (!objc_msgSend(*(id *)(a1 + 32), "doesQoSSourceExistForStreamToken:", v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_cold_1(v10, v6, v11);
    }
    return 0;
  }
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, CFSTR("CONTEXT"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192)), CFSTR("vcQoSReportingInterval"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
      v16 = 1024;
      v17 = 146;
      v18 = 1024;
      v19 = objc_msgSend(v6, "unsignedIntValue");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRemoteVideoManager: new client initialized for streamToken=%u", buf, 0x22u);
    }
  }
  return v4;
}

uint64_t __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
      v13 = 1024;
      v14 = 169;
      v15 = 1024;
      v16 = objc_msgSend(v5, "unsignedIntValue");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCQoSMonitorManager: Terminate remoteVideo connection for streamToken=%u", buf, 0x22u);
    }
  }
  return v3;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcQosMonitorInitializForStreamToken");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcQosMonitorRegisterStreamToken");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcQosMonitorTerminate");
}

- (BOOL)doesQoSSourceExistForStreamToken:(id)a3
{
  return a3 && -[NSMutableDictionary objectForKeyedSubscript:](self->_sources, "objectForKeyedSubscript:") != 0;
}

- (NSMutableArray)moitors
{
  return self->_moitors;
}

void __58__VCQoSMonitorManager_registerQoSReportingSourceForToken___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d source[streamToken=%ld] already registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __60__VCQoSMonitorManager_unregisterQoSReportingSourceForToken___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d source[streamToken=%ld] already unregistered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d source for streamToken=%ld not registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __58__VCQoSMonitorManager_updateQoSReport_toClientsWithToken___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d updateQoSReport qosReport=%@");
  OUTLINED_FUNCTION_3();
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d source for streamToken=%ld not registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__VCQoSMonitorManager_updateEventDrivenQoSReport_toClientsWithToken___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d updateQoSReport with non real-time keys qosReport=%@");
  OUTLINED_FUNCTION_3();
}

void __47__VCQoSMonitorManager_registerBlocksForService__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCQoSMonitorManager registerBlocksForService]_block_invoke";
  v8 = 1024;
  v9 = 148;
  v10 = 1024;
  v11 = objc_msgSend(a2, "unsignedIntValue");
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCQoSMonitorManager: ERROR QoS source does not exist for streamToken=%u", (uint8_t *)&v4, 0x22u);
}

@end
