@implementation VCWifiAssistManager

- (void)refreshBudget
{
  _BOOL4 v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unsigned __int8 v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[VCWifiAssistManager isAvailable](self, "isAvailable");
  -[VCWifiAssistManager queryUserPreference](self, "queryUserPreference");
  -[VCWifiAssistManager queryBudget](self, "queryBudget");
  v4 = -[VCWifiAssistManager isAvailable](self, "isAvailable");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = v5;
      v20 = 2080;
      v21 = "-[VCWifiAssistManager refreshBudget]";
      v22 = 1024;
      v23 = 53;
      v24 = 2112;
      v25 = -[VCWifiAssistManager description](self, "description");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Refresh budget, %@", buf, 0x26u);
    }
  }
  if (v3 != v4)
  {
    v7 = (void *)objc_msgSend((id)-[NSMutableSet allObjects](self->_delegates, "allObjects"), "copy");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          if (v4)
          {
            v12 = 0;
          }
          else if (self->_userPrefered)
          {
            v12 = 2;
          }
          else
          {
            v12 = 1;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "didChangeWifiAssistAvailable:reason:", v4, v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }

  }
}

- (VCWifiAssistManager)init
{
  VCWifiAssistManager *v2;
  VCWifiAssistManager *v3;
  NWNetworkOfInterestManager *v4;
  NSObject *CustomRootQueue;
  dispatch_queue_t v6;
  uint64_t v7;
  VCDispatchTimer *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 respectBudgetStatusEnabled;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCWifiAssistManager;
  v2 = -[VCWifiAssistManager init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_userPrefered = 257;
    -[VCWifiAssistManager queryUserPreference](v2, "queryUserPreference");
    v4 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E0DB0688]);
    v3->_manager = v4;
    if (v4)
    {
      -[VCWifiAssistManager queryBudget](v3, "queryBudget");
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v6 = dispatch_queue_create_with_target_V2("com.apple.AVConference.vcWifiAssist.serialQueue", 0, CustomRootQueue);
      v3->_serialQueue = (OS_dispatch_queue *)v6;
      -[NWNetworkOfInterestManager setQueue:](v3->_manager, "setQueue:", v6);
      -[NWNetworkOfInterestManager setDelegate:](v3->_manager, "setDelegate:", v3);
      -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v3->_manager, "trackNOIAnyForInterfaceType:options:", 1, 0);
      v7 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v3);
      v8 = [VCDispatchTimer alloc];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __27__VCWifiAssistManager_init__block_invoke;
      v16[3] = &unk_1E9E521C0;
      v16[4] = v7;
      v3->_refreshTimer = -[VCDispatchTimer initWithIntervalSeconds:callbackBlock:clientQueue:](v8, "initWithIntervalSeconds:callbackBlock:clientQueue:", 1200, v16, v3->_serialQueue);
      v3->_delegates = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v3->_respectBudgetStatusEnabled = (+[GKSConnectivitySettings getAbTestMasterLocalSwitches](GKSConnectivitySettings, "getAbTestMasterLocalSwitches") & 0x400000) != 0;
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          respectBudgetStatusEnabled = v3->_respectBudgetStatusEnabled;
          *(_DWORD *)buf = 136315906;
          v19 = v9;
          v20 = 2080;
          v21 = "-[VCWifiAssistManager init]";
          v22 = 1024;
          v23 = 91;
          v24 = 1024;
          LODWORD(v25) = respectBudgetStatusEnabled;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch wifiAssistBudgetStatusEnabled %d", buf, 0x22u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCWifiAssistManager init].cold.1();
      }

      v3 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[VCWifiAssistManager description](v3, "description");
        *(_DWORD *)buf = 136315906;
        v19 = v12;
        v20 = 2080;
        v21 = "-[VCWifiAssistManager init]";
        v22 = 1024;
        v23 = 94;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
      }
    }
  }
  return v3;
}

uint64_t __27__VCWifiAssistManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "refreshBudget");
}

- (void)dealloc
{
  NSObject *serialQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCDispatchTimer stop](self->_refreshTimer, "stop");

  -[NWNetworkOfInterestManager setDelegate:](self->_manager, "setDelegate:", 0);
  serialQueue = self->_serialQueue;
  if (serialQueue)
  {
    dispatch_release(serialQueue);
    self->_serialQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCWifiAssistManager;
  -[VCWifiAssistManager dealloc](&v4, sel_dealloc);
}

- (void)queryUserPreference
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not get value of kCTReliableNetworkFallbackToCellularUserPreferenceKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)queryBudget
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NWNetworkOfInterestManager *manager;
  NWNetworkOfInterest *wifiNOI;
  uint64_t v9;
  _QWORD v10[6];
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_respectBudgetStatusEnabled)
  {
    if (-[VCDefaults forceWiFiAssistOutOfBudget](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceWiFiAssistOutOfBudget"))
    {
      self->_inBudget = 0;
      return;
    }
    if (self->_wifiNOI)
    {
      v11 = CFSTR("com.apple.facetime");
      v12 = &unk_1E9EF4AD8;
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      manager = self->_manager;
      wifiNOI = self->_wifiNOI;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __34__VCWifiAssistManager_queryBudget__block_invoke;
      v10[3] = &unk_1E9E54AF0;
      v10[4] = CFSTR("com.apple.facetime");
      v10[5] = self;
      -[NWNetworkOfInterestManager canUseOnAlternateNOI:appStates:reply:](manager, "canUseOnAlternateNOI:appStates:reply:", wifiNOI, v6, v10);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCWifiAssistManager queryBudget]";
        v17 = 1024;
        v18 = 164;
        v5 = " [%s] %s:%d no NOI available, can not query wifi assist budget";
        goto LABEL_12;
      }
    }
  }
  else
  {
    self->_inBudget = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v14 = v3;
        v15 = 2080;
        v16 = "-[VCWifiAssistManager queryBudget]";
        v17 = 1024;
        v18 = 139;
        v5 = " [%s] %s:%d Not respecting the budget restrictions as directed by the storebag settings: isInBudget = YES";
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
}

void __34__VCWifiAssistManager_queryBudget__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __34__VCWifiAssistManager_queryBudget__block_invoke_cold_2();
    }
  }
  else if (objc_msgSend(a2, "count") == 1)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 9))
          v8 = "YES";
        else
          v8 = "NO";
        v11 = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCWifiAssistManager queryBudget]_block_invoke";
        v15 = 1024;
        v16 = 159;
        v17 = 2080;
        v18 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isInBudget = %s", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __34__VCWifiAssistManager_queryBudget__block_invoke_cold_1(v9, a2, v10);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_30);
  return (id)sharedInstance_instance_0;
}

void __37__VCWifiAssistManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance_0)
    sharedInstance_instance_0 = objc_alloc_init(VCWifiAssistManager);
}

- (BOOL)isAvailable
{
  return self->_userPrefered && self->_inBudget;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = "YES";
  if (self->_userPrefered)
    v7 = "YES";
  else
    v7 = "NO";
  if (!self->_inBudget)
    v6 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: userPrefered = %s, inBudget = %s"), v5, v7, v6);
}

- (void)addDelegate:(id)a3
{
  NSObject *serialQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__VCWifiAssistManager_addDelegate___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(serialQueue, block);
  }
}

void __35__VCWifiAssistManager_addDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "start");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCWifiAssistManager addDelegate:]_block_invoke";
      v10 = 1024;
      v11 = 199;
      v12 = 2112;
      v13 = v4;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate %@, _delegates count = %lu after adding", (uint8_t *)&v6, 0x30u);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  NSObject *serialQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__VCWifiAssistManager_removeDelegate___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(serialQueue, block);
  }
}

uint64_t __38__VCWifiAssistManager_removeDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
      v7 = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCWifiAssistManager removeDelegate:]_block_invoke";
      v11 = 1024;
      v12 = 208;
      v13 = 2112;
      v14 = v4;
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate %@, _delegates count = %lu after removing", (uint8_t *)&v7, 0x30u);
    }
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stop");
  return result;
}

- (unsigned)wifiAssistState
{
  if (self->_userPrefered)
    return 2 * !self->_inBudget;
  else
    return 1;
}

- (void)didStartTrackingNOI:(id)a3
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
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCWifiAssistManager didStartTrackingNOI:]";
      v11 = 1024;
      v12 = 227;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d noi = %p", (uint8_t *)&v7, 0x26u);
    }
  }

  self->_wifiNOI = (NWNetworkOfInterest *)a3;
  -[VCWifiAssistManager queryBudget](self, "queryBudget");
}

- (void)didStopTrackingNOI:(id)a3
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
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCWifiAssistManager didStopTrackingNOI:]";
      v11 = 1024;
      v12 = 234;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d noi = %p", (uint8_t *)&v7, 0x26u);
    }
  }

  self->_wifiNOI = 0;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not get NWNetworkOfInterestManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __34__VCWifiAssistManager_queryBudget__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
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
  v5 = 136315906;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCWifiAssistManager queryBudget]_block_invoke";
  v9 = 1024;
  v10 = 155;
  v11 = 2048;
  v12 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, " [%s] %s:%d Unexpected result count(%lu) of Wifi assist budget query", (uint8_t *)&v5);
}

void __34__VCWifiAssistManager_queryBudget__block_invoke_cold_2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCWifiAssistManager queryBudget]_block_invoke";
  v6 = 1024;
  v7 = 152;
  v8 = 2112;
  v9 = v1;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Error in canUseOnAlternateNOI: %@", v3);
  OUTLINED_FUNCTION_3();
}

@end
