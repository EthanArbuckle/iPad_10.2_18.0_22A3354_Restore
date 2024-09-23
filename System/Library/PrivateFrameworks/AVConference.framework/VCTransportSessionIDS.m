@implementation VCTransportSessionIDS

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  return -[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:](self, "initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:", *(_QWORD *)&a3, 0, a4, 0);
}

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6
{
  return -[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:dataPath:](self, "initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:dataPath:", *(_QWORD *)&a3, a4, a5, a6, 0);
}

- (VCTransportSessionIDS)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 dataPath:(int)a7
{
  VCTransportSessionIDS *v9;
  VCTransportSessionIDS *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 useIDSLinkSuggestionFeatureFlag;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCTransportSessionIDS;
  v9 = -[VCTransportSession initWithNotificationQueue:reportingAgent:](&v15, sel_initWithNotificationQueue_reportingAgent_, a6, a5);
  v10 = v9;
  if (v9)
  {
    v9->_socket = -1;
    v9->_requireEncryptionInfo = a4;
    v9->_dataPath = a7;
    v9->_useIDSLinkSuggestionFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-ids-link-suggestion-enabled"), CFSTR("idsLinkSuggestionEnabled"), "AVConference", "UseIDSLinkSuggestion");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        useIDSLinkSuggestionFeatureFlag = v10->_useIDSLinkSuggestionFeatureFlag;
        *(_DWORD *)buf = 136315906;
        v17 = v11;
        v18 = 2080;
        v19 = "-[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:dataPath:]";
        v20 = 1024;
        v21 = 80;
        v22 = 1024;
        v23 = useIDSLinkSuggestionFeatureFlag;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useIDSLinkSuggestionFeatureFlag=%d", buf, 0x22u);
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  int socket;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  socket = self->_socket;
  if (socket != -1)
    close(socket);

  v4.receiver = self;
  v4.super_class = (Class)VCTransportSessionIDS;
  -[VCTransportSession dealloc](&v4, sel_dealloc);
}

- (id)datagramChannel
{
  return self->_datagramChannel;
}

- (BOOL)isIPv6
{
  id v2;
  BOOL v3;

  v2 = -[VCTransportSessionIDS copyActiveConnection](self, "copyActiveConnection");
  v3 = VCConnection_ReportingIPVersion((uint64_t)v2) == 3;

  return v3;
}

- (unsigned)networkMTU
{
  id v2;
  unsigned int v3;

  v2 = -[VCTransportSessionIDS copyActiveConnection](self, "copyActiveConnection");
  v3 = objc_msgSend(v2, "connectionMTU");

  return v3;
}

- (int)networkInterfaceType
{
  id v2;
  int v3;

  v2 = -[VCTransportSessionIDS copyActiveConnection](self, "copyActiveConnection");
  v3 = +[VCTransportSessionIDS transportTypeForConnectionType:](VCTransportSessionIDS, "transportTypeForConnectionType:", objc_msgSend(v2, "localConnectionType"));

  return v3;
}

- (id)copyActiveConnection
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSessionIDS copyActiveConnection]"), 0));
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  -[TimingCollection startTimingForKey:](self->super._perfTimings, "startTimingForKey:", 25, a4, a5);
  return 1;
}

- (void)processDatagramChannelEventInfo:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCTransportSessionIDS_processDatagramChannelEventInfo___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __57__VCTransportSessionIDS_processDatagramChannelEventInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedProcessDatagramChannelEventInfo:", *(_QWORD *)(a1 + 40));
}

- (void)datagramChannelEventLogForInfo:(id)a3 eventInfo:(id)a4
{
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  const char *v12;
  int v13;
  const char *v14;
  char *v15;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "unsignedIntValue");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6 == 10)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(a3, "intValue");
        v11 = *MEMORY[0x1E0D340C0];
        if (objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340C0]))
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v11), "description"), "UTF8String");
        else
          v12 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v22 = v8;
        v23 = 2080;
        v24 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
        v25 = 1024;
        v26 = 146;
        v27 = 1024;
        *(_DWORD *)v28 = v10;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = v12;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received IDS data channel event=%d with keyIndex=%s", buf, 0x2Cu);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    __str = 0;
    v13 = objc_msgSend(a3, "intValue");
    v14 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Received IDS data channel event=%d with payload=%s", v13, v14);
    if (__str)
    {
      __lasts = 0;
      v15 = strtok_r(__str, "\n", &__lasts);
      v16 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v22 = v17;
            v23 = 2080;
            v24 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
            v25 = 1024;
            v26 = 149;
            v27 = 2080;
            *(_QWORD *)v28 = "-[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:]";
            *(_WORD *)&v28[8] = 2080;
            *(_QWORD *)&v28[10] = v15;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v15 = strtok_r(0, "\n", &__lasts);
      }
      while (v15);
      free(__str);
    }
  }
}

- (void)dispatchedProcessDatagramChannelEventInfo:(id)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int linkPreferSuggestionFromDefaults;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EB8]);
  if (v5)
  {
    v6 = (void *)v5;
    -[VCTransportSessionIDS datagramChannelEventLogForInfo:eventInfo:](self, "datagramChannelEventLogForInfo:eventInfo:", v5, a3);
    v7 = objc_msgSend(v6, "unsignedIntValue");
    switch(v7)
    {
      case 1:
        v8 = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("idsLinkSuggestionKey"), 0);
        v9 = v8;
        if (self->_linkPreferSuggestionFromDefaults != v8)
        {
          self->_linkPreferSuggestionFromDefaults = v8;
          v10 = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("idsLinkIPPreferenceKey"), 0);
          v35[0] = *MEMORY[0x1E0D34088];
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
          v12 = *MEMORY[0x1E0D34080];
          v36[0] = v11;
          v36[1] = &unk_1E9EF4EF8;
          v35[1] = v12;
          v35[2] = CFSTR("lipp");
          v36[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
          v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              linkPreferSuggestionFromDefaults = self->_linkPreferSuggestionFromDefaults;
              *(_DWORD *)buf = 136316418;
              v24 = v14;
              v25 = 2080;
              v26 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
              v27 = 1024;
              v28 = 171;
              v29 = 1024;
              v30 = linkPreferSuggestionFromDefaults;
              v31 = 1024;
              v32 = 100;
              v33 = 1024;
              v34 = v10;
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing link suggestion using defaults. IDSLinkSuggestionKey=%d IDSLinkScoreKey=%d IDSLinkIPPreferenceKey=%d", buf, 0x2Eu);
            }
          }
          -[VCTransportSessionIDS handleLinkPreferSuggestion:](self, "handleLinkPreferSuggestion:", v13);
        }
        -[VCTransportSessionIDS handleLinkConnectedWithInfo:](self, "handleLinkConnectedWithInfo:", a3);
        if (!self->_sessionBasedServerExperimentsProcessed)
        {
          -[VCTransportSessionIDS processSessionBasedServerExperiments:](self, "processSessionBasedServerExperiments:", a3);
          self->_sessionBasedServerExperimentsProcessed = 1;
        }
        -[TimingCollection stopTimingForKey:](self->super._perfTimings, "stopTimingForKey:", 13);
        break;
      case 2:
        -[VCTransportSessionIDS handleLinkDisconnectedWithInfo:](self, "handleLinkDisconnectedWithInfo:", a3);
        break;
      case 3:
        v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FB8]);
        if (VCConnectionIDSIsCellularRATType(objc_msgSend(v19, "intValue")))
          -[VCConnectionManager setRealRATType:](self->super._connectionManager, "setRealRATType:", objc_msgSend(v19, "intValue"));
        v20 = -[VCDefaults localRATTypeOverride](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "localRATTypeOverride");
        if ((_DWORD)v20 != -1)
        {
          v21 = v20;
          if (VCConnectionIDSIsCellularRATType(v20))
            v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
        }
        -[VCTransportSessionIDS handleRATChanged:](self, "handleRATChanged:", v19);
        break;
      case 4:
        -[VCTransportSessionIDS handleDefaultLinkUpdatedWithInfo:](self, "handleDefaultLinkUpdatedWithInfo:", a3);
        break;
      case 5:
        -[VCTransportSessionIDS handlePreConnectionDataReceived:](self, "handlePreConnectionDataReceived:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33F18]));
        break;
      case 6:
      case 9:
      case 12:
        goto LABEL_19;
      case 7:
        -[VCTransportSessionIDS handleCellularMTUChanged:](self, "handleCellularMTUChanged:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E50]));
        break;
      case 8:
        -[VCTransportSessionIDS handleChannelInfoReport:](self, "handleChannelInfoReport:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EC8]));
        break;
      case 10:
        -[VCTransportSessionIDS handleIDSEncryptionInfoEvent:](self, "handleIDSEncryptionInfoEvent:", a3);
        break;
      case 11:
        -[VCTransportSessionIDS handleIDSMembershipChangeInfoEvent:](self, "handleIDSMembershipChangeInfoEvent:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E90]));
        break;
      case 13:
        -[VCTransportSessionIDS handleStatResponse:](self, "handleStatResponse:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EB0]));
        break;
      case 14:
        -[VCTransportSessionIDS handleSessionInfoResponse:](self, "handleSessionInfoResponse:", a3);
        break;
      case 15:
        -[VCTransportSessionIDS handleProbingResponse:](self, "handleProbingResponse:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E98]));
        break;
      case 16:
        -[VCTransportSessionIDS handleCellularSoMaskChanged:](self, "handleCellularSoMaskChanged:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E58]));
        break;
      case 17:
        -[VCTransportSessionIDS handleLinkConstrainsChanged:](self, "handleLinkConstrainsChanged:", a3);
        break;
      case 18:
        v22 = (id)objc_msgSend(a3, "mutableCopy");
        objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("transportSessionEventPayloadKey_IsCellular"));
        -[VCTransportSessionIDS handleLinkConstrainsChanged:](self, "handleLinkConstrainsChanged:", v22);

        break;
      case 19:
        -[VCTransportSessionIDS handleLinkPreferSuggestion:](self, "handleLinkPreferSuggestion:", a3);
        break;
      case 20:
        -[VCTransportSessionIDS handleReportingBlob:](self, "handleReportingBlob:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EA0]));
        break;
      case 21:
        -[VCTransportSessionIDS handleEncryptionConfig:](self, "handleEncryptionConfig:", a3);
        break;
      default:
        if (v7 == 1001)
        {
          reportingSymptom();
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:].cold.2();
          }
        }
        else
        {
LABEL_19:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v24 = v17;
              v25 = 2080;
              v26 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
              v27 = 1024;
              v28 = 251;
              v29 = 1024;
              v30 = objc_msgSend(v6, "unsignedIntValue");
              _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received unknown IDSDatagramChannelEvent %d", buf, 0x22u);
            }
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:].cold.1();
  }
}

- (unsigned)remoteDeviceVersionIDS
{
  NSString *remoteFrameworkVersion;
  int v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  remoteFrameworkVersion = self->super._remoteFrameworkVersion;
  if (!remoteFrameworkVersion)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v4 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v4;
      v10 = 136315650;
      v11 = v5;
      v12 = 2080;
      v13 = "-[VCTransportSessionIDS remoteDeviceVersionIDS]";
      v14 = 1024;
      v15 = 273;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote device framework version IDS is unknown", (uint8_t *)&v10, 0x1Cu);
    }
    return 0;
  }
  v3 = -[NSString intValue](remoteFrameworkVersion, "intValue");
  if (v3 >= 1700)
  {
    if (v3 >= 0x71D)
    {
      if (v3 < 0x7AD)
        v4 = 3;
      else
        v4 = 4;
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCTransportSessionIDS remoteDeviceVersionIDS]";
      v14 = 1024;
      v15 = 271;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote device framework version IDS selected '%d'", (uint8_t *)&v10, 0x22u);
    }
  }
  return v4;
}

- (void)start
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__VCTransportSessionIDS_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __30__VCTransportSessionIDS_start__block_invoke(uint64_t a1)
{
  VCDatagramChannelManager *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  int v14;
  _DWORD *v15;
  int v16;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const __CFString *, uint64_t);
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = +[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance");
  v30 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 248) && *(_DWORD *)(v3 + 240) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __30__VCTransportSessionIDS_start__block_invoke_cold_1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        __30__VCTransportSessionIDS_start__block_invoke_cold_2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32002, 1101, 0, CFSTR("Start VCTransportSessionIDS failed"), CFSTR("Destination/socket not set"));
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:");
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __30__VCTransportSessionIDS_start__block_invoke_32;
    v28 = &unk_1E9E55230;
    v29 = v4;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 72);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __30__VCTransportSessionIDS_start__block_invoke_2;
    v23 = &unk_1E9E55258;
    v24 = v6;
    v7 = *(_QWORD *)(v5 + 248);
    if (v7)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:](v2, "addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:", v7, &v25, &v20, *(unsigned int *)(v5 + 260), &v30);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "hasPrefix:", CFSTR("loopback:")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v32 = v8;
            v33 = 2080;
            v34 = "-[VCTransportSessionIDS start]_block_invoke_3";
            v35 = 1024;
            v36 = 327;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Setting mode at init for VCMockIDSDatagramChannel instead of IDSDatagramChannel", buf, 0x1Cu);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setOneToOneModeEnabled:isInitiator:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "connectionManager"), "isOneToOneModeEnabled"), 0);
      }
    }
    else
    {
      v10 = *(unsigned int *)(v5 + 240);
      if ((_DWORD)v10 != -1)
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:](v2, "addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:", v10, &v25, &v20, &v30);
    }
    v11 = *(_QWORD **)(a1 + 32);
    if (!v11[29])
      return objc_msgSend(v11, "callEventHandlerWithEvent:info:", 7, v30);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "remoteDeviceVersionIDS")), CFSTR("preference-remote-device-version-key"));
    v13 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v13 + 256))
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D33F48]);
      v13 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v13 + 232), "setChannelPreferences:", v12);

    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "start");
    if (v14 < 0)
    {
      v18 = v14;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __30__VCTransportSessionIDS_start__block_invoke_cold_3();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          __30__VCTransportSessionIDS_start__block_invoke_cold_4();
        }
      }
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", &v30, 32002, 1102, v18, 0, CFSTR("Could not start transport session"), CFSTR("datagramChannel start failed"), v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopTimingForKey:", 12);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "startTimingForKey:", 13);
      objc_msgSend(*(id *)(a1 + 32), "setPiggybackBlobPreference");
      v15 = *(_DWORD **)(a1 + 32);
      if (v15[60] != -1)
      {
        v15[60] = -1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "readyToRead");
        v15 = *(_DWORD **)(a1 + 32);
      }
      v16 = objc_msgSend(v15, "onStart");
      if ((v16 & 0x80000000) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "addNetworkAssertionWithInterfaceType:", 3);
      v19 = v16;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __30__VCTransportSessionIDS_start__block_invoke_cold_5();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          __30__VCTransportSessionIDS_start__block_invoke_cold_6();
        }
      }
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", &v30, 32002, 1103, v19, 0, CFSTR("Could not start transport session"), CFSTR("onStart failed"), v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }
    objc_msgSend(*(id *)(a1 + 32), "cleanupDatagramChannel");
  }
  v11 = *(_QWORD **)(a1 + 32);
  return objc_msgSend(v11, "callEventHandlerWithEvent:info:", 7, v30);
}

void __30__VCTransportSessionIDS_start__block_invoke_32(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)MEMORY[0x1DF088A10]();
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "processDatagramChannelEventInfo:", a2);
  objc_autoreleasePoolPop(v4);
}

void __30__VCTransportSessionIDS_start__block_invoke_2(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __30__VCTransportSessionIDS_start__block_invoke_2_cold_1();
    }
  }
  else
  {
    VTP_IncrementTotalBytesSent(a3);
  }
  if (v5)
    VCConnectionManager_UpdatePacketSendStatus(v5, a2 == 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("success");
        v11 = 136316162;
        v12 = v6;
        v13 = 2080;
        if (a2)
          v9 = a2;
        v14 = "_VCTransportSessionIDS_writeCompletionHandler";
        v15 = 1024;
        v16 = 289;
        v17 = 2048;
        v18 = a3;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished sending %zd bytes with error=%@", (uint8_t *)&v11, 0x30u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = CFSTR("success");
      v11 = 136316162;
      v12 = v6;
      v13 = 2080;
      if (a2)
        v10 = a2;
      v14 = "_VCTransportSessionIDS_writeCompletionHandler";
      v15 = 1024;
      v16 = 289;
      v17 = 2048;
      v18 = a3;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Finished sending %zd bytes with error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (void)stop
{
  NSObject *stateQueue;
  _QWORD v4[5];
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionIDS;
  -[VCTransportSession stop](&v5, sel_stop);
  stateQueue = self->super._stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__VCTransportSessionIDS_stop__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(stateQueue, v4);
}

uint64_t __29__VCTransportSessionIDS_stop__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onStop");
  objc_msgSend(*(id *)(a1 + 32), "cleanupDatagramChannel");
  return objc_msgSend(*(id *)(a1 + 32), "removeNetworkAssertion");
}

- (void)cleanupDatagramChannel
{
  -[VCDatagramChannelManager removeDatagramChannel:](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "removeDatagramChannel:", self->_datagramChannel);

  self->_datagramChannel = 0;
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
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
      v10 = "-[VCTransportSessionIDS startMKMRecoveryForParticipantIDs:]";
      v11 = 1024;
      v12 = 410;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Start MKM recovery for pariticipantIDs %@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[VCDatagramChannelIDS startMKMRecoveryForParticipantIDs:](self->_datagramChannel, "startMKMRecoveryForParticipantIDs:", a3);
}

- (void)setConnectionSetupPiggybackBlob:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCTransportSessionIDS_setConnectionSetupPiggybackBlob___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __57__VCTransportSessionIDS_setConnectionSetupPiggybackBlob___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(a1 + 40);
  v4 = *(const void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[29])
  {
    objc_msgSend(v5, "setPiggybackBlobPreference");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCTransportSessionIDS setConnectionSetupPiggybackBlob:]_block_invoke";
      v13 = 1024;
      v14 = 421;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Caching piggyback blob %p", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)setPiggybackBlobPreference
{
  NSObject *connectionSetupPiggybackBlob;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  NSObject *v16;
  __int16 v17;
  int v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  connectionSetupPiggybackBlob = self->super._connectionSetupPiggybackBlob;
  if (connectionSetupPiggybackBlob)
  {
    v19 = *MEMORY[0x1E0D33F50];
    v20[0] = connectionSetupPiggybackBlob;
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->super._connectionSetupPiggybackBlob;
        v8 = VCDatagramChannelIDS_Token((uint64_t)self->_datagramChannel);
        v9 = 136316162;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCTransportSessionIDS setPiggybackBlobPreference]";
        v13 = 1024;
        v14 = 430;
        v15 = 2048;
        v16 = v7;
        v17 = 1024;
        v18 = v8;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set piggyback blob %p on datagram channel %d", (uint8_t *)&v9, 0x2Cu);
      }
    }
    -[VCDatagramChannelIDS setChannelPreferences:](self->_datagramChannel, "setChannelPreferences:", v4);
  }
}

- (id)connectionSetupPiggybackBlob
{
  NSObject *stateQueue;
  void *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCTransportSessionIDS_connectionSetupPiggybackBlob__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __53__VCTransportSessionIDS_connectionSetupPiggybackBlob__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int)onStart
{
  return 0;
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSessionIDS handleLinkConnectedWithInfo:]"), 0));
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSessionIDS handleLinkDisconnectedWithInfo:]"), 0));
}

- (void)handleDefaultLinkUpdatedWithInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E68]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCTransportSessionIDS handleDefaultLinkUpdatedWithInfo:]";
      v10 = 1024;
      v11 = 463;
      v12 = 1024;
      v13 = objc_msgSend(v3, "linkID");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: default link updated to %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)handlePreConnectionDataReceived:(id)a3
{
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 5, a3);
}

- (void)handleRATChanged:(id)a3
{
  id v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "intValue") == 8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCTransportSessionIDS handleRATChanged:]";
        v11 = 1024;
        v12 = 474;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got 5G iRAT notification", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
  else
  {
    if (-[VCTransportSessionIDS remoteDeviceVersionIDS](self, "remoteDeviceVersionIDS") == 1
      && (objc_msgSend(v3, "intValue") == 1009 || objc_msgSend(v3, "intValue") == 1010))
    {
      v3 = &unk_1E9EF4F10;
    }
    -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", VCConnectionIDSCellTechForRATType(objc_msgSend(v3, "intValue"))));
  }
}

- (void)handleCellularMTUChanged:(id)a3
{
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 9, a3);
}

- (void)handleIDSEncryptionInfoEvent:(id)a3
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
  VCTransportSessionIDS *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCTransportSessionIDS handleIDSEncryptionInfoEvent:]";
      v11 = 1024;
      v12 = 493;
      v13 = 2048;
      v14 = self;
      v15 = 2080;
      v16 = "-[VCTransportSessionIDS handleIDSEncryptionInfoEvent:]";
      v17 = 1024;
      v18 = 493;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [(VCTransportSession*)%p %s]:%d IDS channel encryption info", (uint8_t *)&v7, 0x36u);
    }
  }
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 11, a3);
}

- (void)handleIDSMembershipChangeInfoEvent:(id)a3
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
  VCTransportSessionIDS *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316418;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCTransportSessionIDS handleIDSMembershipChangeInfoEvent:]";
      v11 = 1024;
      v12 = 499;
      v13 = 2048;
      v14 = self;
      v15 = 2080;
      v16 = "-[VCTransportSessionIDS handleIDSMembershipChangeInfoEvent:]";
      v17 = 1024;
      v18 = 499;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [(VCTransportSession*)%p %s]:%d IDS channel membership change info", (uint8_t *)&v7, 0x36u);
    }
  }
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 12, a3);
}

- (void)handleProbingResponse:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSessionIDS handleProbingResponse:]"), 0));
}

- (void)handleCellularSoMaskChanged:(id)a3
{
  char v4;
  void *v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "unsignedIntValue");
    if ((v4 & 4) != 0)
    {
      v5 = &unk_1E9EF4F28;
    }
    else if ((v4 & 8) != 0)
    {
      v5 = &unk_1E9EF4F40;
    }
    else
    {
      if ((v4 & 1) == 0)
        return;
      v5 = &unk_1E9EF4F10;
    }
    -[VCTransportSessionIDS handleRATChanged:](self, "handleRATChanged:", v5);
  }
}

- (void)handleLinkConstrainsChanged:(id)a3
{
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 17, a3);
}

- (void)setConnectionSetupTime
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCTransportSessionIDS_setConnectionSetupTime__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __47__VCTransportSessionIDS_setConnectionSetupTime__block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;
  double v4;
  double v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isValidTimingForKey:", 25);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "timingForKey:", 25);
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "timingForKey:", 24);
    *(float *)&v5 = v4 - v5;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTiming:forKey:", 14, *(float *)&v5);
  }
  return result;
}

- (void)handleChannelInfoReport:(id)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF4F58))
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF4F58), "integerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCTransportSessionIDS handleChannelInfoReport:]";
        v12 = 1024;
        v13 = 550;
        v14 = 1024;
        v15 = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callee's accept delay %d milliseconds", (uint8_t *)&v8, 0x22u);
      }
    }
    -[TimingCollection setTiming:forKey:](self->super._perfTimings, "setTiming:forKey:", 24, (double)v5 / 1000.0);
    -[VCTransportSessionIDS setConnectionSetupTime](self, "setConnectionSetupTime");
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF4F70))
    -[VCTransportSessionIDS setQuickRelayServerProvider:](self, "setQuickRelayServerProvider:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF4F70), "integerValue"));
}

- (void)handleLinkPreferSuggestion:(id)a3
{
  -[VCConnectionManager updateLinkPreferSuggestion:](self->super._connectionManager, "updateLinkPreferSuggestion:", a3);
}

- (void)processSessionBasedServerExperiments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *stateQueue;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v15 = v8;
    v16 = 2080;
    v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
    v18 = 1024;
    v19 = 571;
    v10 = " [%s] %s:%d Empty connnection info passed";
LABEL_16:
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Cu);
    return;
  }
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E60]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v11 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v15 = v11;
    v16 = 2080;
    v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
    v18 = 1024;
    v19 = 574;
    v10 = " [%s] %s:%d Empty link context list passed";
    goto LABEL_16;
  }
  v5 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "qrExperiments"))
    {
      stateQueue = self->super._stateQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__VCTransportSessionIDS_processSessionBasedServerExperiments___block_invoke;
      v13[3] = &unk_1E9E52238;
      v13[4] = self;
      v13[5] = v6;
      dispatch_async(stateQueue, v13);
    }
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCTransportSessionIDS processSessionBasedServerExperiments:]";
      v18 = 1024;
      v19 = 577;
      v10 = " [%s] %s:%d Empty link context passed";
      goto LABEL_16;
    }
  }
}

uint64_t __62__VCTransportSessionIDS_processSessionBasedServerExperiments___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "qrExperiments"), "copy");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKey:", CFSTR("qrse_und2"));
  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", CFSTR("qrse_und2")), "BOOLValue") ^ 1;
    v4 = CFSTR("transportSessionEventInfoIsUplinkRetransmissionSupported");
    v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 21, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setIsUplinkRetransmissionSupported:", v3);
  }
  return result;
}

- (void)handleReportingBlob:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = CFSTR("IDSCB");
    v16[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    reportingGenericEvent();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315906;
          v8 = v4;
          v9 = 2080;
          v10 = "-[VCTransportSessionIDS handleReportingBlob:]";
          v11 = 1024;
          v12 = 600;
          v13 = 2112;
          v14 = a3;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received IDS reportingBlob=%@", (uint8_t *)&v7, 0x26u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[VCTransportSessionIDS handleReportingBlob:].cold.1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDS handleReportingBlob:].cold.2();
  }
}

- (void)handleStatResponse:(id)a3
{
  if (a3)
  {
    -[VCConnectionManager updateStatResponseResult:](self->super._connectionManager, "updateStatResponseResult:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDS handleStatResponse:].cold.1();
  }
}

- (void)handleEncryptionConfig:(id)a3
{
  if (a3)
  {
    -[VCConnectionManager updateEncryptionConfig:](self->super._connectionManager, "updateEncryptionConfig:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDS handleEncryptionConfig:].cold.1();
  }
}

+ (int)transportTypeForConnectionType:(int)a3
{
  if (a3 > 7)
    return 0;
  else
    return dword_1D910CB5C[a3];
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  if (VCCTServiceMonitor_GetSignalStrength())
    return -2144665596;
  else
    return 0;
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  int result;
  const char *v21;
  VCTransportSessionIDS *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!VCConnection_IsLocalOnCellular((uint64_t)a3))
    return -2144665542;
  v22 = self;
  v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v7)
  {
    v8 = v7;
    v26 = *(_QWORD *)v42;
    v25 = *MEMORY[0x1E0D33FA0];
    v24 = *MEMORY[0x1E0D33F98];
    v9 = *MEMORY[0x1E0D33FB0];
    v10 = *MEMORY[0x1E0D33FA8];
    v11 = *MEMORY[0x1E0D33F90];
    obj = a4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushPayloadType")), v25);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushPayloadTypeFieldOffset")), v24);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushTransactionID")), v9);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushTimestamp")), v10);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("transportSessionBasebandQueueFlushCriterion")), v11);
        objc_msgSend(v27, "addObject:", v14);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    }
    while (v8);
  }
  v38 = *MEMORY[0x1E0D33F20];
  v36[0] = *MEMORY[0x1E0D33ED0];
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)a3));
  v36[1] = *MEMORY[0x1E0D33F28];
  v37[0] = v15;
  v37[1] = v27;
  v39 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  -[VCDatagramChannelIDS setChannelPreferences:](v22->_datagramChannel, "setChannelPreferences:", v16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v19)
      return result;
    if (v16)
      v21 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
    else
      v21 = "<nil>";
    *(_DWORD *)buf = 136315906;
    v29 = v17;
    v30 = 2080;
    v31 = "-[VCTransportSessionIDS flushBasebandQueueForConnection:payloadInfoList:]";
    v32 = 1024;
    v33 = 675;
    v34 = 2080;
    v35 = v21;
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Baseband flush preference %s", buf, 0x26u);
  }
  return 0;
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  return 0;
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD v9[3];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0D33F30];
  v5 = *MEMORY[0x1E0D33E40];
  v9[0] = &unk_1E9EF4F88;
  v6 = *MEMORY[0x1E0D33E48];
  v8[0] = v5;
  v8[1] = v6;
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->super._basebandNotificationRegistrationToken);
  v8[2] = *MEMORY[0x1E0D33ED0];
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)a3));
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  -[VCDatagramChannelIDS setChannelPreferences:](self->_datagramChannel, "setChannelPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
  return 0;
}

- (void)deregisterBasebandNotifications
{
  VCConnectionProtocol *registeredConnection;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[3];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  registeredConnection = self->super._registeredConnection;
  v8 = *MEMORY[0x1E0D33F30];
  v4 = *MEMORY[0x1E0D33E40];
  v7[0] = &unk_1E9EF4FA0;
  v5 = *MEMORY[0x1E0D33E48];
  v6[0] = v4;
  v6[1] = v5;
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->super._basebandNotificationRegistrationToken);
  v6[2] = *MEMORY[0x1E0D33ED0];
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)registeredConnection));
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  -[VCDatagramChannelIDS setChannelPreferences:](self->_datagramChannel, "setChannelPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (void)dispatchedProcessDatagramChannelEventInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d IDS eventHandler called without event type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedProcessDatagramChannelEventInfo:.cold.2()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
  v5 = 1024;
  v6 = 210;
  v7 = v0;
  v8 = "-[VCTransportSessionIDS dispatchedProcessDatagramChannelEventInfo:]";
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s, IDSDataChannelEventUsageError", v3);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d IDS destination not set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_8();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d IDS destination not set", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionIDS start]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d DatagramChannel start failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionIDS start]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionIDS start]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d DatagramChannel start failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionIDS start]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionIDS start]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d onStart failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionIDS start]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionIDS start]_block_invoke";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d onStart failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionIDS start]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __30__VCTransportSessionIDS_start__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "_VCTransportSessionIDS_writeCompletionHandler";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d VCTransportSessionIDS: failed to send data with error=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)handleReportingBlob:.cold.1()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCTransportSessionIDS handleReportingBlob:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Received IDS reportingBlob=%@", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)handleReportingBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d IDS reporting blob must be a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleStatResponse:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stat response received is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleEncryptionConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d eventInfo must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
