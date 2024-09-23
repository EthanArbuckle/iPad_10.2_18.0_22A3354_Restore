@implementation AVCMoments

- (AVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  AVCMoments *v13;
  AVCMoments *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  VRTraceReset();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v18 = v11;
      v19 = 2080;
      v20 = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
      v21 = 1024;
      v22 = 56;
      v23 = 1024;
      v24 = a3;
      v25 = 2112;
      v26 = a4;
      v27 = 2112;
      v28 = a5;
      v29 = 2112;
      v30 = a6;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u, requesterID=%@, delegate=%@, queue=%@", buf, 0x40u);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AVCMoments;
  v13 = -[AVCMoments init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_streamToken = a3;
    v13->_requesterID = (NSString *)objc_msgSend(a4, "copy");
    if (-[AVCMoments setupDelegate:dispatchQueue:](v14, "setupDelegate:dispatchQueue:", a5, a6))
    {
      if (-[AVCMoments connectWithStreamToken:](v14, "connectWithStreamToken:", a3))
      {
        v14->_isLocalRecordingEnabled = +[AVCMoments isLocalRecordingEnabled](AVCMoments, "isLocalRecordingEnabled");
        return v14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:].cold.2();
    }

    return 0;
  }
  return v14;
}

- (AVCMoments)initWithConfiguration:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  AVCMoments *v11;
  AVCMoments *v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  VRTraceReset();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = v9;
      v17 = 2080;
      v18 = "-[AVCMoments initWithConfiguration:delegate:dispatchQueue:]";
      v19 = 1024;
      v20 = 77;
      v21 = 2112;
      v22 = a3;
      v23 = 2112;
      v24 = a4;
      v25 = 2112;
      v26 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d configuration=%@, delegate=%@, queue=%@", buf, 0x3Au);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCMoments;
  v11 = -[AVCMoments init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    if (-[AVCMoments setupDelegate:dispatchQueue:](v11, "setupDelegate:dispatchQueue:", a4, a5))
    {
      if (-[AVCMoments connectWithConfiguration:](v12, "connectWithConfiguration:", a3))
      {
        v12->_isLocalRecordingEnabled = 1;
        return v12;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments initWithConfiguration:delegate:dispatchQueue:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments initWithConfiguration:delegate:dispatchQueue:].cold.2();
    }

    return 0;
  }
  return v12;
}

+ (BOOL)isLocalRecordingEnabled
{
  return VCFeatureFlagManager_LocalRecordingEnabled()
      || VCDefaults_GetManagedBoolValueForKey(CFSTR("enableLocalVideoRecording"), 0);
}

- (BOOL)setupDelegate:(id)a3 dispatchQueue:(id)a4
{
  AVConferenceXPCClient *v6;
  NSMutableDictionary *v7;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v9;
  _BOOL4 v10;

  if (a3)
  {
    objc_storeWeak(&self->_delegate, a3);
    v6 = objc_alloc_init(AVConferenceXPCClient);
    self->_connection = v6;
    if (v6)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_requests = v7;
      if (v7)
      {
        if (a4)
        {
          self->_delegateQueue = (OS_dispatch_queue *)a4;
          dispatch_retain((dispatch_object_t)a4);
LABEL_7:
          -[AVCMoments registerBlocksForNotifications](self, "registerBlocksForNotifications");
          LOBYTE(v10) = 1;
          return v10;
        }
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
        v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCMoments.delegateQueue", 0, CustomRootQueue);
        self->_delegateQueue = v9;
        if (v9)
          goto LABEL_7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v10)
            return v10;
          -[AVCMoments setupDelegate:dispatchQueue:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[AVCMoments setupDelegate:dispatchQueue:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[AVCMoments setupDelegate:dispatchQueue:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    -[AVCMoments setupDelegate:dispatchQueue:].cold.1();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[AVCMoments deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  -[AVCMoments disconnect](self, "disconnect");

  dispatch_release((dispatch_object_t)self->_delegateQueue);
  objc_storeWeak(&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)AVCMoments;
  -[AVCMoments dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: streamToken[%ld] capabilities[%X] requesterID[%@]"), NSStringFromClass(v4), self->_streamToken, self->_capabilities, self->_requesterID);
}

- (BOOL)connectWithConfiguration:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *delegateQueue;
  uint64_t v10;
  NSObject *v11;
  int64_t streamToken;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[AVCMoments connectWithConfiguration:]";
      v19 = 1024;
      v20 = 145;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: connect for local recording", buf, 0x1Cu);
    }
  }
  v23 = CFSTR("vcMomentsConfiguration");
  v24[0] = objc_msgSend(a3, "dictionary");
  v7 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaRecorderInitializeStandalone", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments connectWithConfiguration:].cold.1();
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__AVCMoments_connectWithConfiguration___block_invoke;
    v14[3] = &unk_1E9E52238;
    v14[4] = self;
    v14[5] = v7;
    dispatch_async(delegateQueue, v14);
    self->_streamToken = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcMomentsStreamToken")), "unsignedIntegerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamToken = self->_streamToken;
        *(_DWORD *)buf = 136315906;
        v16 = v10;
        v17 = 2080;
        v18 = "-[AVCMoments connectWithConfiguration:]";
        v19 = 1024;
        v20 = 158;
        v21 = 1024;
        v22 = streamToken;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: streamToken=%u", buf, 0x22u);
      }
    }
  }
  return v8 == 0;
}

void __39__AVCMoments_connectWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("vcMomentsCapabilities")), "intValue"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[AVCMoments connectWithConfiguration:]_block_invoke";
      v9 = 1024;
      v10 = 155;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: capabilities=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (BOOL)connectWithStreamToken:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *delegateQueue;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v5;
      v17 = 2080;
      v18 = "-[AVCMoments connectWithStreamToken:]";
      v19 = 1024;
      v20 = 163;
      v21 = 1024;
      v22 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: connect for streamToken=%u", buf, 0x22u);
    }
  }
  v25 = CFSTR("vcMomentsStreamToken");
  v26[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaRecorderInitialize", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
  v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[AVCMoments connectWithStreamToken:]";
        v19 = 1024;
        v20 = 168;
        v21 = 1024;
        v22 = a3;
        v23 = 2080;
        v24 = v11;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCMomentsClient: Failed connection for streamToken=%u error=%s", buf, 0x2Cu);
      }
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __37__AVCMoments_connectWithStreamToken___block_invoke;
    v14[3] = &unk_1E9E52238;
    v14[4] = self;
    v14[5] = v7;
    dispatch_async(delegateQueue, v14);
  }
  return v8 == 0;
}

void __37__AVCMoments_connectWithStreamToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("vcMomentsCapabilities")), "intValue"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[AVCMoments connectWithStreamToken:]_block_invoke";
      v9 = 1024;
      v10 = 173;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: capabilities=%d", (uint8_t *)&v5, 0x22u);
    }
  }
}

- (void)disconnect
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCMoments disconnect]";
      v10 = 1024;
      v11 = 179;
      v12 = 1024;
      v13 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: disconnect for streamToken=%u", (uint8_t *)&v6, 0x22u);
    }
  }
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcMediaRecorderUninitialize");
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaRecorderDidStartProcessingRequest", v9, self->_delegateQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_30;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaRecorderDidEndProcessingRequest", v8, self->_delegateQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_32;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaRecorderDidFinishRequest", v7, self->_delegateQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_34;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaRecorderCapabilitiesDidChange", v6, self->_delegateQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__AVCMoments_registerBlocksForNotifications__block_invoke_36;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaRecorderServerDidDisconnect", v5, self->_delegateQueue);
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = result;
    result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = objc_msgSend(*(id *)(v4 + 32), "strong");
      if (result)
      {
        v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            if (a2)
              v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            else
              v8 = "<nil>";
            v9 = 136315906;
            v10 = v6;
            v11 = 2080;
            v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            v13 = 1024;
            v14 = 191;
            v15 = 2080;
            v16 = v8;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did start processing request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return objc_msgSend(v5, "didStartProcessingRequestHelperWithResult:", a2);
      }
    }
  }
  return result;
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_30(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = result;
    result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = objc_msgSend(*(id *)(v4 + 32), "strong");
      if (result)
      {
        v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            if (a2)
              v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            else
              v8 = "<nil>";
            v9 = 136315906;
            v10 = v6;
            v11 = 2080;
            v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            v13 = 1024;
            v14 = 203;
            v15 = 2080;
            v16 = v8;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did end processing request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return objc_msgSend(v5, "didEndProcessingRequestHelperWithResult:", a2);
      }
    }
  }
  return result;
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_32(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = result;
    result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = objc_msgSend(*(id *)(v4 + 32), "strong");
      if (result)
      {
        v5 = (void *)result;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            if (a2)
              v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
            else
              v8 = "<nil>";
            v9 = 136315906;
            v10 = v6;
            v11 = 2080;
            v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
            v13 = 1024;
            v14 = 215;
            v15 = 2080;
            v16 = v8;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCMoments: did finish request from AVCMomentsManager %s", (uint8_t *)&v9, 0x26u);
          }
        }
        return objc_msgSend(v5, "didFinishRequestHelperWithResult:", a2);
      }
    }
  }
  return result;
}

void __44__AVCMoments_registerBlocksForNotifications__block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMomentsCapabilities"));
      if (v6)
      {
        objc_msgSend(v5, "updateCapabilities:", objc_msgSend(v6, "intValue"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315650;
          v10 = v7;
          v11 = 2080;
          v12 = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          v13 = 1024;
          v14 = 230;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Attempting to update capabilities with nil argument", (uint8_t *)&v9, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __44__AVCMoments_registerBlocksForNotifications__block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v4 = (void *)result;
      objc_msgSend((id)result, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        if ((void *)objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          *(_DWORD *)v13 = 136315650;
          *(_QWORD *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 246;
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
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCMoments registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 246;
          WORD2(v14) = 2112;
          *(_QWORD *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          v15 = v4;
          v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          v9 = v12;
          v10 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "momentsServerDidDisconnect:", v4);
      }
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaRecorderDidStartProcessingRequest");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaRecorderDidEndProcessingRequest");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaRecorderDidFinishRequest");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaRecorderServerDidDisconnect");
}

- (void)didStartProcessingRequestHelperWithResult:(id)a3
{
  char v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVCMomentsRequest *v10;
  AVCMomentsRequest *v11;
  uint64_t v12;
  AVCMediaRecorderRequestConfiguration *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  char *v20;
  os_log_t *v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  os_log_t *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  char *__lasts;
  char *__str;
  __int128 v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), "intValue");
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID"));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID"));
  if (v5 == 2)
  {
    v12 = v9;
    v13 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
    -[AVCMediaRecorderRequestConfiguration setMediaType:](v13, "setMediaType:", v6);
    -[AVCMediaRecorderRequestConfiguration setRequesteeID:](v13, "setRequesteeID:", v12);
    -[AVCMediaRecorderRequestConfiguration setRequestMode:](v13, "setRequestMode:", 2);
    v31 = *MEMORY[0x1E0CA2E18];
    v32 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    -[AVCMediaRecorderRequestConfiguration setMovieFragmentInterval:](v13, "setMovieFragmentInterval:", &v31);
    v10 = -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:]([AVCMomentsRequest alloc], "initWithConfiguration:requesterID:transactionID:", v13, v8, v7);

    -[AVCMomentsRequest setDelegate:](v10, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", v10, -[AVCMomentsRequest transactionID](v10, "transactionID"));
  }
  else if (v5 == 1)
  {
    v10 = (AVCMomentsRequest *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v7);
    v11 = v10;
  }
  else
  {
    v10 = 0;
  }
  v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsError"));
  if (!v14
    || (v15 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, 0)) == 0)
  {
    v15 = 0;
    ++self->_currentPendingRequestsCount;
  }
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v17 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "result=%s", v17);
      if (__str)
      {
        v28 = v15;
        __lasts = 0;
        v24 = strtok_r(__str, "\n", &__lasts);
        v25 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v27 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v34 = v26;
              v35 = 2080;
              v36 = "-[AVCMoments didStartProcessingRequestHelperWithResult:]";
              v37 = 1024;
              v38 = 298;
              v39 = 2080;
              v40 = "";
              v41 = 2080;
              v42 = v24;
              _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v24 = strtok_r(0, "\n", &__lasts);
        }
        while (v24);
        goto LABEL_34;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (__CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v18 = (const char *)-[__CFString UTF8String](v16, "UTF8String");
      v19 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) result=%s", v18, self, v19);
      if (__str)
      {
        v28 = v15;
        __lasts = 0;
        v20 = strtok_r(__str, "\n", &__lasts);
        v21 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v34 = v22;
              v35 = 2080;
              v36 = "-[AVCMoments didStartProcessingRequestHelperWithResult:]";
              v37 = 1024;
              v38 = 298;
              v39 = 2080;
              v40 = "";
              v41 = 2080;
              v42 = v20;
              _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v20 = strtok_r(0, "\n", &__lasts);
        }
        while (v20);
LABEL_34:
        free(__str);
        v15 = v28;
      }
    }
  }
  objc_msgSend(self->_delegate, "moments:didStartProcessingRequest:error:", self, v10, v15);

}

+ (id)obtainSandboxConsciousURLFromXPCResult:(id)a3
{
  id v3;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (id)objc_msgSend(+[VCSandboxedURL deserialize:](VCSandboxedURL, "deserialize:", v3), "consumeToken");
      return 0;
    }
  }
  return v3;
}

- (void)didEndProcessingRequestHelperWithResult:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableDictionary *requests;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  char *v35;
  os_log_t *v36;
  uint64_t v37;
  NSObject *v38;
  char *v39;
  os_log_t *v40;
  uint64_t v41;
  NSObject *v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  uint64_t v49;
  NSObject *v50;
  const __CFString *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  NSObject *v55;
  uint32_t v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  const char *Name;
  objc_class *v61;
  const char *v62;
  const __CFString *v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  AVCMoments *v76;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  AVCMoments *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  AVCMoments *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        requests = self->_requests;
        *(_DWORD *)buf = 136315906;
        v80 = v6;
        v81 = 2080;
        v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
        v83 = 1024;
        v84 = 321;
        v85 = 2112;
        v86 = (const char *)requests;
        v9 = " [%s] %s:%d AVCMoments current requests %@";
        v10 = v7;
        v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_requests;
        *(_DWORD *)buf = 136316418;
        v80 = v12;
        v81 = 2080;
        v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
        v83 = 1024;
        v84 = 321;
        v85 = 2112;
        v86 = (const char *)v5;
        v87 = 2048;
        v88 = self;
        v89 = 2112;
        v90 = v14;
        v9 = " [%s] %s:%d %@(%p) AVCMoments current requests %@";
        v10 = v13;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  v15 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsStillImageURL"));
  v16 = +[AVCMoments obtainSandboxConsciousURLFromXPCResult:](AVCMoments, "obtainSandboxConsciousURLFromXPCResult:", v15);
  v17 = v16;
  if (v15 && !v16)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments didEndProcessingRequestHelperWithResult:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v59 = (objc_class *)objc_opt_class();
          Name = class_getName(v59);
          *(_DWORD *)buf = 136316418;
          v80 = v19;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 326;
          v85 = 2112;
          v86 = (const char *)v18;
          v87 = 2048;
          v88 = self;
          v89 = 2080;
          v90 = (void *)Name;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected class for stillImageURLResult=%s or failure to decode stillImageURL.", buf, 0x3Au);
        }
      }
    }
  }
  v21 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMovieURL"));
  v22 = +[AVCMoments obtainSandboxConsciousURLFromXPCResult:](AVCMoments, "obtainSandboxConsciousURLFromXPCResult:", v21);
  v23 = (uint64_t)v22;
  if (v21 && !v22)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments didEndProcessingRequestHelperWithResult:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v61 = (objc_class *)objc_opt_class();
          v62 = class_getName(v61);
          *(_DWORD *)buf = 136316418;
          v80 = v25;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 332;
          v85 = 2112;
          v86 = (const char *)v24;
          v87 = 2048;
          v88 = self;
          v89 = 2080;
          v90 = (void *)v62;
          _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected class for movieURLResult=%s or failure to decode movieURL.", buf, 0x3Au);
        }
      }
    }
  }
  v27 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
  v28 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v27);
  v29 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsError"));
  if (v29)
    v30 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, 0);
  else
    v30 = 0;
  --self->_currentPendingRequestsCount;
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_66;
    __str = 0;
    v74 = v23;
    v75 = v17;
    v72 = v30;
    v73 = v28;
    if (a3)
      v32 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    else
      v32 = "<nil>";
    asprintf(&__str, "result=%s", v32);
    if (!__str)
      goto LABEL_65;
    v71 = v27;
    __lasts = 0;
    v39 = strtok_r(__str, "\n", &__lasts);
    v40 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v41 = VRTraceErrorLogLevelToCSTR();
        v42 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v80 = v41;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 340;
          v85 = 2080;
          v86 = "";
          v87 = 2080;
          v88 = (AVCMoments *)v39;
          _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v39 = strtok_r(0, "\n", &__lasts);
    }
    while (v39);
    goto LABEL_64;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = (__CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v31 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v33 = (const char *)-[__CFString UTF8String](v31, "UTF8String");
    v74 = v23;
    v75 = v17;
    v72 = v30;
    v73 = v28;
    if (a3)
      v34 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    else
      v34 = "<nil>";
    asprintf(&__str, "%s(%p) result=%s", v33, self, v34);
    if (!__str)
      goto LABEL_65;
    v71 = v27;
    __lasts = 0;
    v35 = strtok_r(__str, "\n", &__lasts);
    v36 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *v36;
        if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v80 = v37;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 340;
          v85 = 2080;
          v86 = "";
          v87 = 2080;
          v88 = (AVCMoments *)v35;
          _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v35 = strtok_r(0, "\n", &__lasts);
    }
    while (v35);
LABEL_64:
    free(__str);
    v27 = v71;
LABEL_65:
    v23 = v74;
    v17 = v75;
    v30 = v72;
    v28 = v73;
  }
LABEL_66:
  VCMediaRecorderUtil_PrintMediaURL(v23, 6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "moments:didEndProcessingRequest:stillImageURL:movieURL:error:", self, v28, v17, v23, v30);
  if (!objc_msgSend(v28, "hasDirectoryURL"))
  {
    v76 = 0;
    if (!v17
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v17, &v76) & 1) != 0)
    {
      goto LABEL_80;
    }
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_80;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_80;
      *(_DWORD *)buf = 136316162;
      v80 = v44;
      v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      v83 = 1024;
      v84 = 351;
      v85 = 2112;
      v86 = v17;
      v87 = 2112;
      v88 = v76;
      v46 = " [%s] %s:%d Failed to remove stillImage at URL=%@ error=%@";
      v47 = v45;
      v48 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v43 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v43 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v49 = VRTraceErrorLogLevelToCSTR(),
            v50 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_80:
        v76 = 0;
        if (!v23
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v23, &v76) & 1) != 0)
        {
          goto LABEL_91;
        }
        if ((AVCMoments *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_91;
          v52 = VRTraceErrorLogLevelToCSTR();
          v53 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_91;
          *(_DWORD *)buf = 136316162;
          v80 = v52;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 355;
          v85 = 2112;
          v86 = v17;
          v87 = 2112;
          v88 = v76;
          v54 = " [%s] %s:%d Failed to remove movie at URL=%@ error=%@";
          v55 = v53;
          v56 = 48;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v51 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v51 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_91;
          v57 = VRTraceErrorLogLevelToCSTR();
          v58 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_91;
          *(_DWORD *)buf = 136316674;
          v80 = v57;
          v81 = 2080;
          v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
          v83 = 1024;
          v84 = 355;
          v85 = 2112;
          v86 = (const char *)v51;
          v87 = 2048;
          v88 = self;
          v89 = 2112;
          v90 = (void *)v17;
          v91 = 2112;
          v92 = v76;
          v54 = " [%s] %s:%d %@(%p) Failed to remove movie at URL=%@ error=%@";
          v55 = v58;
          v56 = 68;
        }
        _os_log_error_impl(&dword_1D8A54000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
        goto LABEL_91;
      }
      *(_DWORD *)buf = 136316674;
      v80 = v49;
      v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      v83 = 1024;
      v84 = 351;
      v85 = 2112;
      v86 = (const char *)v43;
      v87 = 2048;
      v88 = self;
      v89 = 2112;
      v90 = (void *)v17;
      v91 = 2112;
      v92 = v76;
      v46 = " [%s] %s:%d %@(%p) Failed to remove stillImage at URL=%@ error=%@";
      v47 = v50;
      v48 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    goto LABEL_80;
  }
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_91;
    v64 = VRTraceErrorLogLevelToCSTR();
    v65 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_91;
    *(_DWORD *)buf = 136315650;
    v80 = v64;
    v81 = 2080;
    v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
    v83 = 1024;
    v84 = 348;
    v66 = " [%s] %s:%d Skipping removing files since a client directoryURL is present.";
    v67 = v65;
    v68 = 28;
LABEL_106:
    _os_log_impl(&dword_1D8A54000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v68);
    goto LABEL_91;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v63 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v63 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v69 = VRTraceErrorLogLevelToCSTR();
    v70 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v80 = v69;
      v81 = 2080;
      v82 = "-[AVCMoments didEndProcessingRequestHelperWithResult:]";
      v83 = 1024;
      v84 = 348;
      v85 = 2112;
      v86 = (const char *)v63;
      v87 = 2048;
      v88 = self;
      v66 = " [%s] %s:%d %@(%p) Skipping removing files since a client directoryURL is present.";
      v67 = v70;
      v68 = 48;
      goto LABEL_106;
    }
  }
LABEL_91:
  -[NSMutableDictionary removeObjectForKey:](self->_requests, "removeObjectForKey:", v27);
}

- (void)didFinishRequestHelperWithResult:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableDictionary *requests;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  char *v22;
  os_log_t *v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  os_log_t *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  int currentActiveRequestsCount;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BYTE v54[10];
  AVCMoments *v55;
  __int16 v56;
  _QWORD v57[3];

  *(_QWORD *)((char *)&v57[1] + 6) = *MEMORY[0x1E0C80C00];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    requests = self->_requests;
    *(_DWORD *)buf = 136315906;
    v48 = v6;
    v49 = 2080;
    v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
    v51 = 1024;
    v52 = 363;
    v53 = 2112;
    *(_QWORD *)v54 = requests;
    v9 = " [%s] %s:%d AVCMoments current requests %@";
    v10 = v7;
    v11 = 38;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_requests;
      *(_DWORD *)buf = 136316418;
      v48 = v12;
      v49 = 2080;
      v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
      v51 = 1024;
      v52 = 363;
      v53 = 2112;
      *(_QWORD *)v54 = v5;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      v56 = 2112;
      v57[0] = v14;
      v9 = " [%s] %s:%d %@(%p) AVCMoments current requests %@";
      v10 = v13;
      v11 = 58;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
LABEL_12:
  v15 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
  v16 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v15);
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue") & 1) != 0)
    v17 = 0;
  else
    v17 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCMoments"), -1, 0);
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v44 = v17;
      if (a3)
        v19 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v19 = "<nil>";
      asprintf(&__str, "result=%s", v19);
      if (!__str)
        goto LABEL_41;
      v41 = v16;
      v42 = v15;
      v43 = a3;
      __lasts = 0;
      v26 = strtok_r(__str, "\n", &__lasts);
      v27 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v48 = v28;
            v49 = 2080;
            v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
            v51 = 1024;
            v52 = 371;
            v53 = 2080;
            *(_QWORD *)v54 = "";
            *(_WORD *)&v54[8] = 2080;
            v55 = (AVCMoments *)v26;
            _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
      goto LABEL_40;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (__CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v20 = (const char *)-[__CFString UTF8String](v18, "UTF8String");
      v44 = v17;
      if (a3)
        v21 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v21 = "<nil>";
      asprintf(&__str, "%s(%p) result=%s", v20, self, v21);
      if (!__str)
        goto LABEL_41;
      v41 = v16;
      v42 = v15;
      v43 = a3;
      __lasts = 0;
      v22 = strtok_r(__str, "\n", &__lasts);
      v23 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v48 = v24;
            v49 = 2080;
            v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
            v51 = 1024;
            v52 = 371;
            v53 = 2080;
            *(_QWORD *)v54 = "";
            *(_WORD *)&v54[8] = 2080;
            v55 = (AVCMoments *)v22;
            _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v22 = strtok_r(0, "\n", &__lasts);
      }
      while (v22);
LABEL_40:
      free(__str);
      v15 = v42;
      a3 = v43;
      v16 = v41;
LABEL_41:
      v17 = v44;
    }
  }
  objc_msgSend(self->_delegate, "moments:didFinishRequest:error:", self, v16, v17);
  -[NSMutableDictionary removeObjectForKey:](self->_requests, "removeObjectForKey:", v15);
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue") & 0xFE) == 2)
  {
    v30 = self->_currentActiveRequestsCount - 1;
    self->_currentActiveRequestsCount = v30;
    if (v30 == 99999)
    {
      if ((AVCMoments *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_55;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        currentActiveRequestsCount = self->_currentActiveRequestsCount;
        *(_DWORD *)buf = 136316162;
        v48 = v32;
        v49 = 2080;
        v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
        v51 = 1024;
        v52 = 381;
        v53 = 1024;
        *(_DWORD *)v54 = 7;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = currentActiveRequestsCount;
        v35 = " [%s] %s:%d Notify client with new caps %d, currentActiveRequestsCount %d";
        v36 = v33;
        v37 = 40;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v31 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v31 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_55;
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_55;
        v40 = self->_currentActiveRequestsCount;
        *(_DWORD *)buf = 136316674;
        v48 = v38;
        v49 = 2080;
        v50 = "-[AVCMoments didFinishRequestHelperWithResult:]";
        v51 = 1024;
        v52 = 381;
        v53 = 2112;
        *(_QWORD *)v54 = v31;
        *(_WORD *)&v54[8] = 2048;
        v55 = self;
        v56 = 1024;
        LODWORD(v57[0]) = 7;
        WORD2(v57[0]) = 1024;
        *(_DWORD *)((char *)v57 + 6) = v40;
        v35 = " [%s] %s:%d %@(%p) Notify client with new caps %d, currentActiveRequestsCount %d";
        v36 = v39;
        v37 = 60;
      }
      _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_55:
      -[AVCMoments updateCapabilities:](self, "updateCapabilities:", 7);
    }
  }
}

- (void)updateCapabilities:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegateQueue);
  if (self->_capabilities != a3)
  {
    self->_capabilities = a3;
    -[AVCMomentsDelegate moments:capabilitiesDidChange:](-[AVCMoments delegate](self, "delegate"), "moments:capabilitiesDidChange:", self, self->_capabilities);
  }
}

- (AVCMomentsDelegate)delegate
{
  return (AVCMomentsDelegate *)objc_loadWeak(&self->_delegate);
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 requesteeID:(id)a4
{
  uint64_t v5;
  AVCMediaRecorderRequestConfiguration *v7;
  id v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
  -[AVCMediaRecorderRequestConfiguration setMediaType:](v7, "setMediaType:", v5);
  -[AVCMediaRecorderRequestConfiguration setRequestMode:](v7, "setRequestMode:", 2);
  -[AVCMediaRecorderRequestConfiguration setRequesteeID:](v7, "setRequesteeID:", a4);
  v10 = *MEMORY[0x1E0CA2E18];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVCMediaRecorderRequestConfiguration setMovieFragmentInterval:](v7, "setMovieFragmentInterval:", &v10);
  v8 = -[AVCMoments newRequestWithConfiguration:](self, "newRequestWithConfiguration:", v7);

  return v8;
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  AVCMediaRecorderRequestConfiguration *v9;
  id v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(AVCMediaRecorderRequestConfiguration);
  -[AVCMediaRecorderRequestConfiguration setMediaType:](v9, "setMediaType:", v7);
  -[AVCMediaRecorderRequestConfiguration setRequestMode:](v9, "setRequestMode:", v6);
  -[AVCMediaRecorderRequestConfiguration setRequesteeID:](v9, "setRequesteeID:", a5);
  v12 = *MEMORY[0x1E0CA2E18];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVCMediaRecorderRequestConfiguration setMovieFragmentInterval:](v9, "setMovieFragmentInterval:", &v12);
  v10 = -[AVCMoments newRequestWithConfiguration:](self, "newRequestWithConfiguration:", v9);

  return v10;
}

- (id)newRequestWithConfiguration:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  AVCMomentsRequest *v14;
  AVCMomentsRequest *v15;
  int currentActiveRequestsCount;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *delegateQueue;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  _QWORD v33[5];
  int v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  AVCMoments *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v36 = v6;
        v37 = 2080;
        v38 = "-[AVCMoments newRequestWithConfiguration:]";
        v39 = 1024;
        v40 = 427;
        v41 = 2112;
        v42 = a3;
        v8 = " [%s] %s:%d configuration=%@";
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
      v5 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v36 = v11;
        v37 = 2080;
        v38 = "-[AVCMoments newRequestWithConfiguration:]";
        v39 = 1024;
        v40 = 427;
        v41 = 2112;
        v42 = (id)v5;
        v43 = 2048;
        v44 = self;
        v45 = 2112;
        v46 = a3;
        v8 = " [%s] %s:%d %@(%p) configuration=%@";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  if (objc_msgSend(a3, "requestMode") == 1 && !self->_isLocalRecordingEnabled)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments newRequestWithConfiguration:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v36 = v28;
        v37 = 2080;
        v38 = "-[AVCMoments newRequestWithConfiguration:]";
        v39 = 1024;
        v40 = 430;
        v41 = 2112;
        v42 = (id)v23;
        v43 = 2048;
        v44 = self;
        v45 = 1024;
        LODWORD(v46) = 1;
        v27 = " [%s] %s:%d %@(%p) mode=%d is not supported";
        v30 = v29;
        v31 = 54;
LABEL_63:
        _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v27, buf, v31);
        return 0;
      }
    }
    return 0;
  }
  v13 = objc_msgSend(a3, "mediaType") & 0xFE;
  if (v13 == 2 && self->_currentActiveRequestsCount > 99999)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments newRequestWithConfiguration:].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v32;
        v37 = 2080;
        v38 = "-[AVCMoments newRequestWithConfiguration:]";
        v39 = 1024;
        v40 = 435;
        v41 = 2112;
        v42 = (id)v24;
        v43 = 2048;
        v44 = self;
        v27 = " [%s] %s:%d %@(%p) Current active request count has reached max. Can't process anymore";
        goto LABEL_62;
      }
    }
    return 0;
  }
  v14 = -[AVCMomentsRequest initWithConfiguration:requesterID:]([AVCMomentsRequest alloc], "initWithConfiguration:requesterID:", a3, self->_requesterID);
  if (!v14)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments newRequestWithConfiguration:].cold.3();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v25;
        v37 = 2080;
        v38 = "-[AVCMoments newRequestWithConfiguration:]";
        v39 = 1024;
        v40 = 440;
        v41 = 2112;
        v42 = (id)v22;
        v43 = 2048;
        v44 = self;
        v27 = " [%s] %s:%d %@(%p) Failed to allocate new request";
LABEL_62:
        v30 = v26;
        v31 = 48;
        goto LABEL_63;
      }
    }
    return 0;
  }
  v15 = v14;
  -[AVCMomentsRequest setDelegate:](v14, "setDelegate:", self);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", v15, -[AVCMomentsRequest transactionID](v15, "transactionID"));
  currentActiveRequestsCount = self->_currentActiveRequestsCount;
  if (v13 == 2)
    self->_currentActiveRequestsCount = ++currentActiveRequestsCount;
  if (currentActiveRequestsCount == 100000)
  {
    if ((AVCMoments *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMoments newRequestWithConfiguration:].cold.4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v36 = v18;
          v37 = 2080;
          v38 = "-[AVCMoments newRequestWithConfiguration:]";
          v39 = 1024;
          v40 = 450;
          v41 = 2112;
          v42 = (id)v17;
          v43 = 2048;
          v44 = self;
          v45 = 1024;
          LODWORD(v46) = 1;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Notify client reached max request capabilities %d", buf, 0x36u);
        }
      }
    }
    delegateQueue = self->_delegateQueue;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __42__AVCMoments_newRequestWithConfiguration___block_invoke;
    v33[3] = &unk_1E9E52300;
    v33[4] = self;
    v34 = 1;
    dispatch_async(delegateQueue, v33);
  }
  return v15;
}

uint64_t __42__AVCMoments_newRequestWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:", *(unsigned int *)(a1 + 40));
}

- (BOOL)avcMediaRecorderRequestDidStartRequest:(id)a3 withError:(id *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  char v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v22;
  _BYTE v23[24];
  __int128 v24;
  AVCMoments *v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v10 = "<nil>";
        *(_DWORD *)v23 = 136315906;
        *(_QWORD *)&v23[4] = v8;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 462;
        WORD2(v24) = 2080;
        *(_QWORD *)((char *)&v24 + 6) = v10;
        v14 = " [%s] %s:%d AVCMoments: avcMomentsRequestDidStartRequest %s";
        v15 = v9;
        v16 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v13 = "<nil>";
        *(_DWORD *)v23 = 136316418;
        *(_QWORD *)&v23[4] = v11;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 462;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v7;
        HIWORD(v24) = 2048;
        v25 = self;
        LOWORD(v26) = 2080;
        *(_QWORD *)((char *)&v26 + 2) = v13;
        v14 = " [%s] %s:%d %@(%p) AVCMoments: avcMomentsRequestDidStartRequest %s";
        v15 = v12;
        v16 = 58;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v23, v16);
      }
    }
  }
  v17 = objc_msgSend(a3, "validateWithError:", a4, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26);
  if ((v17 & 1) != 0)
  {
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderStartRequest", objc_msgSend(a3, "serialize"));
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (*a4)
          v22 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        else
          v22 = "<nil>";
        *(_DWORD *)v23 = 136316418;
        *(_QWORD *)&v23[4] = v19;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[AVCMoments avcMediaRecorderRequestDidStartRequest:withError:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 465;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v18;
        HIWORD(v24) = 2048;
        v25 = self;
        LOWORD(v26) = 2080;
        *(_QWORD *)((char *)&v26 + 2) = v22;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation with error %s", v23, 0x3Au);
      }
    }
  }
  return v17;
}

- (BOOL)avcMediaRecorderRequestDidEndRequest:(id)a3 withError:(id *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  char v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE v22[24];
  __int128 v23;
  AVCMoments *v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v10 = "<nil>";
        *(_DWORD *)v22 = 136315906;
        *(_QWORD *)&v22[4] = v8;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 475;
        WORD2(v23) = 2080;
        *(_QWORD *)((char *)&v23 + 6) = v10;
        v14 = " [%s] %s:%d AVCMoments: avcMomentsRequestDidEndRequest %s";
        v15 = v9;
        v16 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v13 = "<nil>";
        *(_DWORD *)v22 = 136316418;
        *(_QWORD *)&v22[4] = v11;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 475;
        WORD2(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 6) = v7;
        HIWORD(v23) = 2048;
        v24 = self;
        LOWORD(v25) = 2080;
        *(_QWORD *)((char *)&v25 + 2) = v13;
        v14 = " [%s] %s:%d %@(%p) AVCMoments: avcMomentsRequestDidEndRequest %s";
        v15 = v12;
        v16 = 58;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v22, v16);
      }
    }
  }
  v17 = objc_msgSend(a3, "validateWithError:", a4, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24, v25);
  if ((v17 & 1) != 0)
  {
    if (objc_msgSend(a3, "mediaType") == 2
      || objc_msgSend(a3, "mediaType") == 4
      || objc_msgSend(a3, "mediaType") == 5)
    {
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderEndRequest", objc_msgSend(a3, "serialize"));
    }
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = v19;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[AVCMoments avcMediaRecorderRequestDidEndRequest:withError:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 477;
        WORD2(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 6) = v18;
        HIWORD(v23) = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation", v22, 0x30u);
      }
    }
  }
  return v17;
}

- (BOOL)avcMediaRecorderRequestDidRejectRequest:(id)a3 withError:(id *)a4
{
  char v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  AVCMoments *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "validateWithError:", a4);
  if ((v6 & 1) != 0)
  {
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaRecorderRejectRequest", objc_msgSend(a3, "serialize"));
  }
  else if ((AVCMoments *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMoments avcMediaRecorderRequestDidRejectRequest:withError:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCMoments performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "-[AVCMoments avcMediaRecorderRequestDidRejectRequest:withError:]";
        v15 = 1024;
        v16 = 490;
        v17 = 2112;
        v18 = v7;
        v19 = 2048;
        v20 = self;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed validation", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  return v6;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (int)activeRequestCount
{
  return self->_currentActiveRequestsCount;
}

- (int)pendingRequestCount
{
  return self->_currentPendingRequestsCount;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (void)initWithStreamToken:requesterID:delegate:dispatchQueue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to connect to moments server with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]" >> 16, 64);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:requesterID:delegate:dispatchQueue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up delegate with streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCMoments initWithStreamToken:requesterID:delegate:dispatchQueue:]" >> 16, 62);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:dispatchQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to connect to moments server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:dispatchQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:dispatchQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate parameter is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:dispatchQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:dispatchQueue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate requests dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:dispatchQueue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate _delegateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectWithConfiguration:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d AVCMomentsClient: Failed connection with error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)didEndProcessingRequestHelperWithResult:.cold.1()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  v0 = (objc_class *)OUTLINED_FUNCTION_13_1(*MEMORY[0x1E0C80C00]);
  class_getName(v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unexpected class for movieURLResult=%s or failure to decode movieURL.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)didEndProcessingRequestHelperWithResult:.cold.2()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  v0 = (objc_class *)OUTLINED_FUNCTION_13_1(*MEMORY[0x1E0C80C00]);
  class_getName(v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unexpected class for stillImageURLResult=%s or failure to decode stillImageURL.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newRequestWithConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCMoments newRequestWithConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d mode=%d is not supported", v2, *(const char **)v3, (unint64_t)"-[AVCMoments newRequestWithConfiguration:]" >> 16, 430);
  OUTLINED_FUNCTION_3();
}

- (void)newRequestWithConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Current active request count has reached max. Can't process anymore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newRequestWithConfiguration:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate new request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newRequestWithConfiguration:.cold.4()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[AVCMoments newRequestWithConfiguration:]";
  OUTLINED_FUNCTION_4();
  v4 = 450;
  v5 = v0;
  v6 = 1;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Notify client reached max request capabilities %d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)avcMediaRecorderRequestDidStartRequest:withError:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  if (*v0)
    objc_msgSend((id)objc_msgSend(*v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d failed validation with error %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)avcMediaRecorderRequestDidEndRequest:withError:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed validation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)avcMediaRecorderRequestDidRejectRequest:withError:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed validation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
