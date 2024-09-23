@implementation VCDatagramChannelManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  return (id)sharedInstance_sharedDatagramChannelManager;
}

VCDatagramChannelManager *__42__VCDatagramChannelManager_sharedInstance__block_invoke()
{
  VCDatagramChannelManager *result;

  result = objc_alloc_init(VCDatagramChannelManager);
  sharedInstance_sharedDatagramChannelManager = (uint64_t)result;
  return result;
}

- (VCDatagramChannelManager)init
{
  VCDatagramChannelManager *v2;
  VCDatagramChannelManager *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCDatagramChannelManager;
  v2 = -[VCDatagramChannelManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_stateLock, 0);
    ++v3->_nextToken;
    v3->_datagramChannels = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_destinations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_stateLock);

  v3.receiver = self;
  v3.super_class = (Class)VCDatagramChannelManager;
  -[VCDatagramChannelManager dealloc](&v3, sel_dealloc);
}

- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 error:(id *)a5
{
  return -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:](self, "addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:", *(_QWORD *)&a3, a4, 0, a5);
}

- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t nextToken;
  VCDatagramChannelIDS *v12;
  VCDatagramChannelIDS *v13;
  VCDatagramChannelIDS *v14;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:].cold.1();
    }
    goto LABEL_12;
  }
  v10 = *(_QWORD *)&a3;
  pthread_mutex_lock(&self->_stateLock);
  nextToken = self->_nextToken;
  self->_nextToken = nextToken + 1;
  pthread_mutex_unlock(&self->_stateLock);
  v12 = -[VCDatagramChannelIDS initWithSocketDescriptor:token:error:]([VCDatagramChannelIDS alloc], "initWithSocketDescriptor:token:error:", v10, nextToken, a6);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (a6)
        {
          if (*a6)
            v18 = (const char *)objc_msgSend((id)objc_msgSend(*a6, "description"), "UTF8String");
          else
            v18 = "<nil>";
        }
        else
        {
          v18 = "nil";
        }
        v19 = 136315906;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:]";
        v23 = 1024;
        v24 = 75;
        v25 = 2080;
        v26 = v18;
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d DatagramChannel creation failed with error %s", (uint8_t *)&v19, 0x26u);
      }
    }
LABEL_12:
    v14 = 0;
    goto LABEL_5;
  }
  v13 = v12;
  pthread_mutex_lock(&self->_stateLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datagramChannels, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", nextToken));
  pthread_mutex_unlock(&self->_stateLock);
  if (-[VCDatagramChannelManager setupDatagramChannel:eventHandler:writeCompletionHandler:error:](self, "setupDatagramChannel:eventHandler:writeCompletionHandler:error:", v13, a4, a5, a6))
  {
    v14 = v13;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:].cold.2();
  }
  v14 = 0;
LABEL_6:
  -[VCDatagramChannelManager removeDatagramChannel:](self, "removeDatagramChannel:", v13);
  return v14;
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 error:(id *)a5
{
  return -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:dataPath:error:](self, "addDatagramChannelWithDestination:eventHandler:dataPath:error:", a3, a4, 0, a5);
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 dataPath:(int)a5 error:(id *)a6
{
  return -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:](self, "addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:", a3, a4, 0, *(_QWORD *)&a5, a6);
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 dataPath:(int)a6 error:(id *)a7
{
  uint64_t v10;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t nextToken;
  VCDatagramChannelIDS *v18;
  id v19;
  id v20;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _WORD v32[17];

  *(_QWORD *)&v32[13] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:].cold.1();
    }
    goto LABEL_26;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:].cold.2();
    }
    goto LABEL_26;
  }
  v10 = *(_QWORD *)&a6;
  pthread_mutex_lock(&self->_stateLock);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", a3))
  {
    v13 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13));
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136316162;
        v26 = v15;
        v27 = 2080;
        v28 = "-[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]";
        v29 = 1024;
        v30 = 138;
        v31 = 1024;
        *(_DWORD *)v32 = v13;
        v32[2] = 2080;
        *(_QWORD *)&v32[3] = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: found existing datagram channel with token %d for destination %s", (uint8_t *)&v25, 0x2Cu);
      }
    }
    goto LABEL_11;
  }
  nextToken = self->_nextToken;
  self->_nextToken = nextToken + 1;
  v18 = -[VCDatagramChannelIDS initWithDestination:token:dataPath:error:]([VCDatagramChannelIDS alloc], "initWithDestination:token:dataPath:error:", a3, nextToken, v10, a7);
  if (!v18)
  {
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (a7)
        {
          if (*a7)
            v24 = (const char *)objc_msgSend((id)objc_msgSend(*a7, "description"), "UTF8String");
          else
            v24 = "<nil>";
        }
        else
        {
          v24 = "nil";
        }
        v25 = 136315906;
        v26 = v22;
        v27 = 2080;
        v28 = "-[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]";
        v29 = 1024;
        v30 = 121;
        v31 = 2080;
        *(_QWORD *)v32 = v24;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d DatagramChannel creation failed with error %s", (uint8_t *)&v25, 0x26u);
      }
    }
    goto LABEL_26;
  }
  v19 = -[VCDatagramChannelManager setupEmulatedDatagramChannelWithDestination:datagramChannel:](self, "setupEmulatedDatagramChannelWithDestination:datagramChannel:", a3, v18);
  if (!v19)
  {
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:].cold.3();
    }
LABEL_26:
    v14 = 0;
    goto LABEL_11;
  }
  v20 = v19;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_destinations, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", nextToken), a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datagramChannels, "setObject:forKeyedSubscript:", v20, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", nextToken));
  pthread_mutex_unlock(&self->_stateLock);
  if (-[VCDatagramChannelManager setupDatagramChannel:eventHandler:writeCompletionHandler:error:](self, "setupDatagramChannel:eventHandler:writeCompletionHandler:error:", v20, a4, a5, a7))
  {
    v14 = v20;
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:].cold.4();
  }
  v14 = 0;
LABEL_12:
  -[VCDatagramChannelManager removeDatagramChannel:](self, "removeDatagramChannel:", v20);
  return v14;
}

- (id)setupEmulatedDatagramChannelWithDestination:(id)a3 datagramChannel:(id)a4
{
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath"))
  {
    v7 = objc_msgSend((id)objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath"), "isEqualToString:", &stru_1E9E58EE0);
    if (objc_msgSend(a3, "hasPrefix:", CFSTR("loopback:")) && (v7 & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315906;
          v14 = v8;
          v15 = 2080;
          v16 = "-[VCDatagramChannelManager setupEmulatedDatagramChannelWithDestination:datagramChannel:]";
          v17 = 1024;
          v18 = 159;
          v19 = 2112;
          v20 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled, emulatedNetworkConfigPath=%@", (uint8_t *)&v13, 0x26u);
        }
      }
      return -[VCDatagramChannelIDSEmulated initWithIDSDatagramChannel:mode:]([VCDatagramChannelIDSEmulated alloc], "initWithIDSDatagramChannel:mode:", a4, 0);
    }
  }
  else
  {
    objc_msgSend(a3, "hasPrefix:", CFSTR("loopback:"));
  }
  if (-[VCDatagramChannelManager isEmulatedDatagramChannelEnabledViaDefaults](self, "isEmulatedDatagramChannelEnabledViaDefaults"))
  {
    return -[VCDatagramChannelIDSEmulated initWithIDSDatagramChannel:mode:]([VCDatagramChannelIDSEmulated alloc], "initWithIDSDatagramChannel:mode:", a4, 0);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCDatagramChannelManager setupEmulatedDatagramChannelWithDestination:datagramChannel:]";
      v17 = 1024;
      v18 = 167;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Do not load emulated network", (uint8_t *)&v13, 0x1Cu);
    }
  }
  return a4;
}

- (BOOL)isEmulatedDatagramChannelEnabledViaDefaults
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)VCDefaults_CopyStringValueForKey(CFSTR("emulatedNetworkConfigPath"));
  v3 = (void *)VCDefaults_CopyStringValueForKey(CFSTR("emulatedNetworkConfigJSONString"));
  if (v2 && objc_msgSend(v2, "length"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCDatagramChannelManager isEmulatedDatagramChannelEnabledViaDefaults]";
        v14 = 1024;
        v15 = 178;
        v16 = 2112;
        v17 = v2;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled via defaults, emulatedNetworkConfigPath=%@", (uint8_t *)&v10, 0x26u);
      }
    }
    objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "setEmulatedNetworkConfigPath:", v2);
    v6 = 1;
    goto LABEL_15;
  }
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    v6 = 0;
    if (!v2)
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCDatagramChannelManager isEmulatedDatagramChannelEnabledViaDefaults]";
      v14 = 1024;
      v15 = 182;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled via defaults, emulatedNetworkConfigJSONString=%@", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 1;
  if (v2)
LABEL_15:
    CFRelease(v2);
LABEL_16:
  if (v3)
    CFRelease(v3);
  return v6;
}

- (BOOL)setupDatagramChannel:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6
{
  int v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = VCDatagramChannelIDS_Token((uint64_t)a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCDatagramChannelManager setupDatagramChannel:eventHandler:writeCompletionHandler:error:]";
      v19 = 1024;
      v20 = 198;
      v21 = 1024;
      v22 = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: added datagram channel with token %d", buf, 0x22u);
    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__VCDatagramChannelManager_setupDatagramChannel_eventHandler_writeCompletionHandler_error___block_invoke;
  v14[3] = &unk_1E9E53B98;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend(a3, "setReadHandler:", v14);
  if (a5)
    objc_msgSend(a3, "setWriteCompletionHandler:", a5);
  objc_msgSend(a3, "setEventHandler:", a4);
  return 1;
}

uint64_t __91__VCDatagramChannelManager_setupDatagramChannel_eventHandler_writeCompletionHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 40), a2, a3, a4, a5, a6, a7);
  return result;
}

- (id)datagramChannelWithChannelToken:(unsigned int)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_stateLock;
  void *v6;

  v3 = *(_QWORD *)&a3;
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  pthread_mutex_unlock(p_stateLock);
  return v6;
}

- (void)executeBlockForIDSDestination:(id)a3 blockToExecute:(id)a4
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v8;
  id v9;

  if (a4)
  {
    p_stateLock = &self->_stateLock;
    pthread_mutex_lock(&self->_stateLock);
    v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    pthread_mutex_unlock(p_stateLock);
    objc_msgSend(v9, "lock");
    (*((void (**)(id, id))a4 + 2))(a4, v9);
    objc_msgSend(v9, "unlock");

  }
}

- (void)removeDatagramChannel:(id)a3
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_stateLock = &self->_stateLock;
    pthread_mutex_lock(&self->_stateLock);
    v6 = VCDatagramChannelIDS_Token((uint64_t)a3);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6)))
    {
      v7 = a3;
      -[NSMutableDictionary removeObjectForKey:](self->_datagramChannels, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315906;
          v14 = v8;
          v15 = 2080;
          v16 = "-[VCDatagramChannelManager removeDatagramChannel:]";
          v17 = 1024;
          v18 = 251;
          v19 = 1024;
          LODWORD(v20) = v6;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed datagram channel with token=%d", (uint8_t *)&v13, 0x22u);
        }
      }
      if (objc_msgSend(a3, "destination"))
      {
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", objc_msgSend(a3, "destination")))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_destinations, "removeObjectForKey:", objc_msgSend(a3, "destination"));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (objc_msgSend(a3, "destination"))
                v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "destination"), "description"), "UTF8String");
              else
                v12 = "<nil>";
              v13 = 136315906;
              v14 = v10;
              v15 = 2080;
              v16 = "-[VCDatagramChannelManager removeDatagramChannel:]";
              v17 = 1024;
              v18 = 255;
              v19 = 2080;
              v20 = v12;
              _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed destination=%s", (uint8_t *)&v13, 0x26u);
            }
          }
        }
      }
      pthread_mutex_unlock(p_stateLock);
      objc_msgSend(a3, "invalidate");

    }
    else
    {
      pthread_mutex_unlock(p_stateLock);
    }
  }
}

- (void)removeDatagramChannels
{
  NSMutableDictionary *datagramChannels;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _opaque_pthread_mutex_t *p_stateLock;
  id obj;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  datagramChannels = self->_datagramChannels;
  if (datagramChannels)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)-[NSMutableDictionary allKeys](datagramChannels, "allKeys");
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v33 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8)))
          {
            v9 = (void *)-[NSMutableDictionary objectForKey:](self->_datagramChannels, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
            if (objc_msgSend(v9, "destination"))
            {
              if (-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", objc_msgSend(v9, "destination")))
              {
                -[NSMutableDictionary removeObjectForKey:](self->_destinations, "removeObjectForKey:", objc_msgSend(v9, "destination"));
                if ((int)VRTraceGetErrorLogLevelForModule() > 6)
                {
                  v10 = VRTraceErrorLogLevelToCSTR();
                  v11 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    if (objc_msgSend(v9, "destination"))
                      v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "destination"), "description"), "UTF8String");
                    else
                      v12 = "<nil>";
                    *(_DWORD *)buf = 136315906;
                    v24 = v10;
                    v25 = 2080;
                    v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
                    v27 = 1024;
                    v28 = 282;
                    v29 = 2080;
                    v30 = v12;
                    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed destination=%s", buf, 0x26u);
                  }
                }
              }
            }
            objc_msgSend(v9, "invalidate");
            -[NSMutableDictionary removeObjectForKey:](self->_datagramChannels, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v24 = v17;
                v25 = 2080;
                v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
                v27 = 1024;
                v28 = 286;
                v29 = 1024;
                LODWORD(v30) = v8;
                v15 = v18;
                v16 = " [%s] %s:%d VCDatagramChannelManager: removed datagram channel with token=%d";
                goto LABEL_22;
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v24 = v13;
              v25 = 2080;
              v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
              v27 = 1024;
              v28 = 276;
              v29 = 1024;
              LODWORD(v30) = v8;
              v15 = v14;
              v16 = " [%s] %s:%d VCDatagramChannelManager: _datagramChannels[@(token=%d)] is nil";
LABEL_22:
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x22u);
              continue;
            }
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      }
      while (v5);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = v19;
      v25 = 2080;
      v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
      v27 = 1024;
      v28 = 270;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: _datagramChannels == nil", buf, 0x1Cu);
    }
  }
  pthread_mutex_unlock(p_stateLock);
}

- (id)datagramChannels
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_datagramChannels);
}

- (id)destinations
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_destinations);
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setReadHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d eventHandler must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d DatagramChannel setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d destination must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d eventHandler must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Setup EmulatedDatagramChannel failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d DatagramChannel setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
