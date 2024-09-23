@implementation AVAudioClient

+ (id)sharedInstance
{
  id result;
  void *v3;

  result = (id)sharedInstance__sharedAudioClient;
  if (!sharedInstance__sharedAudioClient)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!sharedInstance__sharedAudioClient)
      sharedInstance__sharedAudioClient = -[AVAudioClient initSharedInstance]([AVAudioClient alloc], "initSharedInstance");
    objc_sync_exit(v3);
    return (id)sharedInstance__sharedAudioClient;
  }
  return result;
}

- (id)initSharedInstance
{
  AVAudioClient *v2;
  NSObject *CustomRootQueue;
  dispatch_queue_t v4;
  uint64_t v5;
  NSObject *v6;
  NSCondition *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AVAudioClient *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVAudioClient;
  v2 = -[AVAudioClient init](&v11, sel_init);
  if (v2)
  {
    VRTraceReset();
    v2->_processId = getpid();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVAudioClient.AudioSessionQueue", 0, CustomRootQueue);
    v2->_clientAudioSessionQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-initializeAudioSessionQ");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v13 = v5;
          v14 = 2080;
          v15 = "-[AVAudioClient initSharedInstance]";
          v16 = 1024;
          v17 = 88;
          v18 = 2048;
          v19 = v2;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-initializeAudioSessionQ (%p)", buf, 0x26u);
        }
      }
      v7 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
      v2->_audioSessionRefCondVar = v7;
      if (v7)
      {
        if (-[AVAudioClient setupXPCConnection](v2, "setupXPCConnection"))
          goto LABEL_8;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVAudioClient initSharedInstance].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVAudioClient initSharedInstance].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVAudioClient initSharedInstance].cold.1();
    }

    v2 = 0;
  }
LABEL_8:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-initSharedInstance");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v8;
      v14 = 2080;
      v15 = "-[AVAudioClient initSharedInstance]";
      v16 = 1024;
      v17 = 106;
      v18 = 2048;
      v19 = v2;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-initSharedInstance (%p)", buf, 0x26u);
    }
  }
  return v2;
}

- (AVAudioClient)init
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVAudioClient;
  v2 = -[AVAudioClient init](&v6, sel_init);
  if (v2)
  {
    VRTraceReset();
    v2->deviceList = objc_alloc_init(AVAudioDeviceList);
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVAudioClient init]";
      v11 = 1024;
      v12 = 115;
      v13 = 2048;
      v14 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-init (%p)", buf, 0x26u);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *clientAudioSessionQueue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVAudioClient dealloc]";
      v11 = 1024;
      v12 = 120;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-dealloc (%p)", buf, 0x26u);
    }
  }
  -[AVAudioClient cleanupXPCConnection](self, "cleanupXPCConnection");

  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  if (clientAudioSessionQueue)
    dispatch_release(clientAudioSessionQueue);
  -[AVAudioClient cleanupSecureMicrophoneEngagedHandler](self, "cleanupSecureMicrophoneEngagedHandler");
  -[AVAudioClient cleanupMutedTalkerNotificationHandler](self, "cleanupMutedTalkerNotificationHandler");
  -[AVAudioClient cleanUpMuteStateChangedHandler](self, "cleanUpMuteStateChangedHandler");
  -[AVAudioDeviceList setChangeListener:](self->deviceList, "setChangeListener:", 0);

  v6.receiver = self;
  v6.super_class = (Class)AVAudioClient;
  -[AVAudioClient dealloc](&v6, sel_dealloc);
}

- (BOOL)shouldSetUpXPCConnection
{
  return self->_mutedTalkerNotificationHandler || self->_muteStateChangedHandler != 0;
}

- (BOOL)reregisterMutedTalkerNotificationOverXPC
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int processId;
  unsigned int connectionAttempts;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_mutedTalkerNotificationHandler
    || (v3 = objc_msgSend(-[AVAudioClient sendMessageSync:arguments:](self, "sendMessageSync:arguments:", "mutedTalkerRegister", 0), "objectForKeyedSubscript:", CFSTR("ERROR"))) == 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_6;
  v5 = VRTraceErrorLogLevelToCSTR();
  v6 = *MEMORY[0x1E0CF2758];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    processId = self->_processId;
    connectionAttempts = self->_connectionAttempts;
    v11 = 136316418;
    v12 = v5;
    v13 = 2080;
    v14 = "-[AVAudioClient reregisterMutedTalkerNotificationOverXPC]";
    v15 = 1024;
    v16 = 160;
    v17 = 1024;
    v18 = processId;
    v19 = 2112;
    v20 = v4;
    v21 = 1024;
    v22 = connectionAttempts;
    _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to reregister the muted talker notification block. processId=%d error=%@ connectionAttempts=%u", (uint8_t *)&v11, 0x32u);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)reregisterMuteStateChangedHandlerOverXPC
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int processId;
  unsigned int connectionAttempts;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_muteStateChangedHandler
    || (v3 = objc_msgSend(-[AVAudioClient sendMessageSync:arguments:](self, "sendMessageSync:arguments:", "muteStateChangedHandler", &unk_1E9EFB510), "objectForKeyedSubscript:", CFSTR("ERROR"))) == 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_6;
  v5 = VRTraceErrorLogLevelToCSTR();
  v6 = *MEMORY[0x1E0CF2758];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    processId = self->_processId;
    connectionAttempts = self->_connectionAttempts;
    v11 = 136316418;
    v12 = v5;
    v13 = 2080;
    v14 = "-[AVAudioClient reregisterMuteStateChangedHandlerOverXPC]";
    v15 = 1024;
    v16 = 184;
    v17 = 1024;
    v18 = processId;
    v19 = 2112;
    v20 = v4;
    v21 = 1024;
    v22 = connectionAttempts;
    _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to reregister the mute state changed handler block. processId=%d error=%@ connectionAttempts=%u", (uint8_t *)&v11, 0x32u);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)reregisterClientSideHandlersOverXPC
{
  _BOOL4 v3;

  v3 = -[AVAudioClient reregisterMutedTalkerNotificationOverXPC](self, "reregisterMutedTalkerNotificationOverXPC");
  if (v3)
    LOBYTE(v3) = -[AVAudioClient reregisterMuteStateChangedHandlerOverXPC](self, "reregisterMuteStateChangedHandlerOverXPC");
  return v3;
}

- (BOOL)setupXPCConnection
{
  AVConferenceXPCClient *v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  int processId;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_xpcConnection = v3;
  if (v3)
  {
    -[AVConferenceXPCClient setConnectionPersists:](v3, "setConnectionPersists:", 1);
    v4 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_xpcConnection, "sendMessageSync:arguments:", "newClient", 0);
    v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ERROR"));
    self->_mixingVoiceWithMediaEnabled = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioClientAudioSessionMixingVoiceWithMedia")), "BOOLValue");
    if (!v5)
    {
      -[AVAudioClient registerBlocksForDelegateNotifications](self, "registerBlocksForDelegateNotifications");
      return -[AVAudioClient reregisterClientSideHandlersOverXPC](self, "reregisterClientSideHandlersOverXPC");
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        processId = self->_processId;
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[AVAudioClient setupXPCConnection]";
        v14 = 1024;
        v15 = 222;
        v16 = 1024;
        v17 = processId;
        v18 = 2112;
        v19 = v5;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to initialize the server side object. processId=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVAudioClient setupXPCConnection].cold.1();
  }
  return 0;
}

- (void)cleanupMutedTalkerNotificationHandler
{
  id mutedTalkerNotificationHandler;

  mutedTalkerNotificationHandler = self->_mutedTalkerNotificationHandler;
  if (mutedTalkerNotificationHandler)
  {
    _Block_release(mutedTalkerNotificationHandler);
    self->_mutedTalkerNotificationHandler = 0;
  }
}

- (void)cleanUpMuteStateChangedHandler
{
  _Block_release(self->_muteStateChangedHandler);
  self->_muteStateChangedHandler = 0;
}

- (void)cleanupXPCConnection
{
  if (self->_xpcConnection)
  {
    -[AVAudioClient unregisterBlocksForDelegateNotifications](self, "unregisterBlocksForDelegateNotifications");

    self->_xpcConnection = 0;
    *(_WORD *)&self->_followSystemInputEnabled = 0;
  }
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4
{
  AVConferenceXPCClient *xpcConnection;
  uint64_t v9;
  NSObject *v10;
  int processId;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    return -[AVConferenceXPCClient sendMessageSync:arguments:](xpcConnection, "sendMessageSync:arguments:", a3, a4);
  if (-[AVAudioClient setupXPCConnection](self, "setupXPCConnection"))
  {
    xpcConnection = self->_xpcConnection;
    return -[AVConferenceXPCClient sendMessageSync:arguments:](xpcConnection, "sendMessageSync:arguments:", a3, a4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      processId = self->_processId;
      *(_DWORD *)buf = 136315906;
      v15 = v9;
      v16 = 2080;
      v17 = "-[AVAudioClient sendMessageSync:arguments:]";
      v18 = 1024;
      v19 = 265;
      v20 = 1024;
      v21 = processId;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Failed to setup the connection. processId=%d", buf, 0x22u);
    }
  }
  v13 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32002, 0, CFSTR("Failed to setup connection"), CFSTR("ERROR"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5
{
  AVConferenceXPCClient *xpcConnection;
  uint64_t v10;
  NSObject *v11;
  int processId;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    goto LABEL_4;
  if (-[AVAudioClient setupXPCConnection](self, "setupXPCConnection"))
  {
    xpcConnection = self->_xpcConnection;
LABEL_4:
    -[AVConferenceXPCClient sendMessageAsync:arguments:reply:](xpcConnection, "sendMessageAsync:arguments:reply:", a3, a4, a5);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      processId = self->_processId;
      v13 = 136315906;
      v14 = v10;
      v15 = 2080;
      v16 = "-[AVAudioClient sendMessageAsync:arguments:reply:]";
      v17 = 1024;
      v18 = 273;
      v19 = 1024;
      v20 = processId;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Failed to setup the connection. processId=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  if (a5)
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32002, 0, CFSTR("Failed to setup connection")));
}

- (void)startAudioSessionWithCompletionHandler:(id)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E9E53548;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

uint64_t __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  int v6;
  uint64_t v7;
  _QWORD v9[4];
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v4 + 57))
        v5 = "Redundant";
      else
        v5 = "New";
      v6 = *(_DWORD *)(v4 + 84);
      *(_DWORD *)buf = 136316162;
      v13 = v2;
      v14 = 2080;
      v15 = "-[AVAudioClient startAudioSessionWithCompletionHandler:]_block_invoke";
      v16 = 1024;
      v17 = 288;
      v18 = 2080;
      v19 = v5;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s startAudioSession call from client. processId=%d", buf, 0x2Cu);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  v10 = CFSTR("startAudioSession");
  v11 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke_28;
  v9[3] = &unk_1E9E565C0;
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", v7, v9);
}

uint64_t __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (!a3 || objc_msgSend(a3, "code") == 32025 || objc_msgSend(a3, "code") == 32005)
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "lock"),
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1,
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "signal"),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "unlock"),
        !a3)
    && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) != 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_DWORD *)(v8 + 84);
      v12 = 136316930;
      v13 = v6;
      v14 = 2080;
      v15 = "-[AVAudioClient startAudioSessionWithCompletionHandler:]_block_invoke";
      v16 = 1024;
      v17 = 309;
      v18 = 2048;
      v19 = v8;
      v20 = 1024;
      v21 = v10;
      v22 = 2048;
      v23 = v9;
      v24 = 1024;
      v25 = v5;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-didStart (%p), processId=%d, completionHandler=%p, didSucceed=%d, error=%@", (uint8_t *)&v12, 0x46u);
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8, void *))(result + 16))(result, v5, a3);
  return result;
}

- (void)setAudioSessionProperties:(id)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AVAudioClient_setAudioSessionProperties___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = a3;
    block[5] = self;
    dispatch_async(clientAudioSessionQueue, block);
  }
}

uint64_t __43__AVAudioClient_setAudioSessionProperties___block_invoke(uint64_t a1)
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("setAudioSessionProperties");
  v3[1] = CFSTR("audioClientAudioSessionParams");
  v4[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4[1] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2), &__block_literal_global_109);
}

void __43__AVAudioClient_setAudioSessionProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
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
  if (a3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[AVAudioClient setAudioSessionProperties:]_block_invoke_2";
      v10 = 1024;
      v11 = 330;
      v12 = 2112;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d setAudioSessionProperties failed with error=%@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)stopAudioSession
{
  NSObject *clientAudioSessionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__AVAudioClient_stopAudioSession__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(clientAudioSessionQueue, v3);
}

void __33__AVAudioClient_stopAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 57))
    goto LABEL_5;
  objc_msgSend(*(id *)(v2 + 64), "lock");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 56)
    || (v4 = objc_msgSend(*(id *)(v3 + 64), "waitUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0)), v3 = *(_QWORD *)(a1 + 32), (v4 & 1) != 0))
  {
    *(_BYTE *)(v3 + 56) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "unlock");
LABEL_5:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v7 + 57))
          v8 = "New";
        else
          v8 = "Redundant";
        v9 = *(_DWORD *)(v7 + 84);
        *(_DWORD *)buf = 136316162;
        v13 = v5;
        v14 = 2080;
        v15 = "-[AVAudioClient stopAudioSession]_block_invoke";
        v16 = 1024;
        v17 = 355;
        v18 = 2080;
        v19 = v8;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s stopAudioSession call from client. processId=%d", buf, 0x2Cu);
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 0;
    v11 = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("stopAudioSession"));
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1), 0);
    return;
  }
  objc_msgSend(*(id *)(v3 + 64), "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __33__AVAudioClient_stopAudioSession__block_invoke_cold_1();
  }
}

- (void)resetAudioSessionOutputPortOverride
{
  NSObject *clientAudioSessionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__AVAudioClient_resetAudioSessionOutputPortOverride__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(clientAudioSessionQueue, v3);
}

uint64_t __52__AVAudioClient_resetAudioSessionOutputPortOverride__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      v9 = v2;
      v10 = 2080;
      v11 = "-[AVAudioClient resetAudioSessionOutputPortOverride]_block_invoke";
      v12 = 1024;
      v13 = 370;
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v7 = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("resetAudioSessionOutputPortOverride"));
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1), 0);
}

- (BOOL)hasActiveAudioSession
{
  BOOL audioSessionIsActive;

  -[NSCondition lock](self->_audioSessionRefCondVar, "lock");
  audioSessionIsActive = self->_audioSessionIsActive;
  -[NSCondition unlock](self->_audioSessionRefCondVar, "unlock");
  return audioSessionIsActive;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVAudioClient_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

uint64_t __36__AVAudioClient_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  _QWORD v6[2];
  _QWORD v7[2];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      v9 = v2;
      v10 = 2080;
      v11 = "-[AVAudioClient setMicrophoneMuted:]_block_invoke";
      v12 = 1024;
      v13 = 392;
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v6[1] = CFSTR("audioClientAudioSessionMute");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("setMute"));
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2), 0);
}

- (BOOL)isMicrophoneMuted
{
  NSObject *clientAudioSessionQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVAudioClient_isMicrophoneMuted__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVAudioClient_isMicrophoneMuted__block_invoke(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("getMute");
  v4[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1)), "objectForKeyedSubscript:", CFSTR("audioClientAudioSessionMute")), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  int processId;
  NSObject *clientAudioSessionQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
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
      processId = self->_processId;
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVAudioClient setMixingVoiceWithMediaEnabled:]";
      v15 = 1024;
      v16 = 418;
      v17 = 1024;
      v18 = processId;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__AVAudioClient_setMixingVoiceWithMediaEnabled___block_invoke;
  v9[3] = &unk_1E9E521E8;
  v9[4] = self;
  v10 = a3;
  dispatch_async(clientAudioSessionQueue, v9);
}

void __48__AVAudioClient_setMixingVoiceWithMediaEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80) == v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[AVAudioClient setMixingVoiceWithMediaEnabled:]_block_invoke";
        v10 = 1024;
        v11 = 426;
        v12 = 1024;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, isMixingVoiceWithMediaEnabled already set to %d", (uint8_t *)&v6, 0x22u);
      }
    }
  }
  else
  {
    v14 = CFSTR("audioClientAudioSessionMixingVoiceWithMedia");
    v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0);
    objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSessionVoiceMixing", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = *(_BYTE *)(a1 + 40);
  }
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  NSObject *clientAudioSessionQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVAudioClient_isMixingVoiceWithMediaEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__AVAudioClient_isMixingVoiceWithMediaEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (AVAudioDevice)currentInputDevice
{
  NSObject *clientAudioSessionQueue;
  id v3;
  AVAudioDevice *v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__41;
  v11 = __Block_byref_object_dispose__41;
  v12 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVAudioClient_currentInputDevice__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(clientAudioSessionQueue, block);
  v3 = (id)v8[5];
  v4 = (AVAudioDevice *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__AVAudioClient_currentInputDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("getCurrentAudioInputDevice");
  v6[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice"));
  result = objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  if ((result & 1) == 0)
  {
    result = (uint64_t)+[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice")));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (AVAudioDevice)currentOutputDevice
{
  NSObject *clientAudioSessionQueue;
  id v3;
  AVAudioDevice *v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__41;
  v11 = __Block_byref_object_dispose__41;
  v12 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVAudioClient_currentOutputDevice__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(clientAudioSessionQueue, block);
  v3 = (id)v8[5];
  v4 = (AVAudioDevice *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__AVAudioClient_currentOutputDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("getCurrentAudioOutputDevice");
  v6[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice"));
  result = objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  if ((result & 1) == 0)
  {
    result = (uint64_t)+[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice")));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)setInputDevice:(id)a3
{
  NSObject *clientAudioSessionQueue;
  BOOL v6;
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "UID"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__AVAudioClient_setInputDevice___block_invoke;
    v9[3] = &unk_1E9E550C8;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = &v10;
    dispatch_async(clientAudioSessionQueue, v9);
    v6 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVAudioClient setInputDevice:].cold.1(v7, a3);
    }
    return 0;
  }
  return v6;
}

void *__32__AVAudioClient_setInputDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  void *result;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVAudioClient setInputDevice:]_block_invoke";
      v13 = 1024;
      v14 = 496;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v7[1] = CFSTR("audioClientAudioDevice");
  v8[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("setCurrentAudioInputDevice"));
  v8[1] = objc_msgSend(*(id *)(a1 + 40), "UID");
  result = (void *)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  if (result)
  {
    v6 = result;
    result = (void *)objc_msgSend(result, "objectForKeyedSubscript:", CFSTR("ERROR"));
    if (!result)
    {
      result = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
      if (!result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)setOutputDevice:(id)a3
{
  NSObject *clientAudioSessionQueue;
  BOOL v6;
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "UID"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__AVAudioClient_setOutputDevice___block_invoke;
    v9[3] = &unk_1E9E550C8;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = &v10;
    dispatch_async(clientAudioSessionQueue, v9);
    v6 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVAudioClient setOutputDevice:].cold.1(v7, a3);
    }
    return 0;
  }
  return v6;
}

void *__33__AVAudioClient_setOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  void *result;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVAudioClient setOutputDevice:]_block_invoke";
      v13 = 1024;
      v14 = 522;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v7[1] = CFSTR("audioClientAudioDevice");
  v8[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("setCurrentAudioOutputDevice"));
  v8[1] = objc_msgSend(*(id *)(a1 + 40), "UID");
  result = (void *)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  if (result)
  {
    v6 = result;
    result = (void *)objc_msgSend(result, "objectForKeyedSubscript:", CFSTR("ERROR"));
    if (!result)
    {
      result = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
      if (!result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)setFollowSystemInputEnabled:(BOOL)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AVAudioClient_setFollowSystemInputEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

void __45__AVAudioClient_setFollowSystemInputEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 81);
  v3 = *(unsigned __int8 *)(a1 + 40);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 81);
        *(_DWORD *)buf = 136315906;
        v14 = v5;
        v15 = 2080;
        v16 = "-[AVAudioClient setFollowSystemInputEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 549;
        v19 = 1024;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, _followSystemInputEnabled=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
        *(_DWORD *)buf = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "-[AVAudioClient setFollowSystemInputEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 544;
        v19 = 1024;
        v20 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
      }
    }
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40), CFSTR("audioClientFollowSystemInput"));
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSessionFollowSystemInput", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = *(_BYTE *)(a1 + 40);
  }
}

- (void)setFollowSystemOutputEnabled:(BOOL)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVAudioClient_setFollowSystemOutputEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

void __46__AVAudioClient_setFollowSystemOutputEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 82);
  v3 = *(unsigned __int8 *)(a1 + 40);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 82);
        *(_DWORD *)buf = 136315906;
        v14 = v5;
        v15 = 2080;
        v16 = "-[AVAudioClient setFollowSystemOutputEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 572;
        v19 = 1024;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, _followSystemOutputEnabled=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
        *(_DWORD *)buf = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "-[AVAudioClient setFollowSystemOutputEnabled:]_block_invoke";
        v17 = 1024;
        v18 = 567;
        v19 = 1024;
        v20 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
      }
    }
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40), CFSTR("audioClientFollowSystemOutput"));
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSessionFollowSystemOutput", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 82) = *(_BYTE *)(a1 + 40);
  }
}

- (int)registerForMutedTalkerNotifications:(id)a3
{
  NSObject *clientAudioSessionQueue;
  int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke;
    v6[3] = &unk_1E9E52288;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    dispatch_sync(clientAudioSessionQueue, v6);
    v4 = *((_DWORD *)v8 + 6);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v4 = 1768846960;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVAudioClient registerForMutedTalkerNotifications:].cold.1();
    }
  }
  return v4;
}

void __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1634887015;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke_cold_1();
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = _Block_copy(*(const void **)(a1 + 40));
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "mutedTalkerRegister", 0), "objectForKeyedSubscript:", CFSTR("ERROR"));
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "cleanupMutedTalkerNotificationHandler");
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "code");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = *(_DWORD *)(*(_QWORD *)v2 + 84);
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[AVAudioClient registerForMutedTalkerNotifications:]_block_invoke";
          v12 = 1024;
          v13 = 622;
          v14 = 1024;
          v15 = v7;
          v16 = 2112;
          v17 = v4;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to register the muted talker notification block. processId=%d error=%@", (uint8_t *)&v8, 0x2Cu);
        }
      }
    }
  }
}

- (int)unregisterFromMutedTalkerNotifications
{
  NSObject *clientAudioSessionQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(v2, "sendMessageSync:arguments:", "mutedTalkerUnregister", 0), "objectForKeyedSubscript:", CFSTR("ERROR"));
    objc_msgSend(*v3, "cleanupMutedTalkerNotificationHandler");
    if (v4)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "code");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = *((_DWORD *)*v3 + 21);
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[AVAudioClient unregisterFromMutedTalkerNotifications]_block_invoke";
          v12 = 1024;
          v13 = 657;
          v14 = 1024;
          v15 = v7;
          v16 = 2112;
          v17 = v4;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to unregister the muted talker notification block. processId=%d error=%@", (uint8_t *)&v8, 0x2Cu);
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1752066412;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke_cold_1();
    }
  }
}

- (void)handleMutedTalkerNotificationWithXPCArguments:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  int processId;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mutedTalkerNotificationType"));
  v5 = v4;
  if (!self->_mutedTalkerNotificationHandler)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    processId = self->_processId;
    v17 = 136316162;
    v18 = v10;
    v19 = 2080;
    v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
    v21 = 1024;
    v22 = 668;
    v23 = 1024;
    v24 = processId;
    v25 = 2112;
    v26 = v5;
    v13 = "AVCAudioClient [%s] %s:%d Notification received but handler is not registered processId=%d notificationType=%@";
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "unsignedIntValue");
  if (v6 != 1)
  {
    if (!v6)
    {
      (*((void (**)(void))self->_mutedTalkerNotificationHandler + 2))();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315650;
          v18 = v7;
          v19 = 2080;
          v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
          v21 = 1024;
          v22 = 674;
          v9 = "AVCAudioClient [%s] %s:%d MutedTalkerNotificationHandler Begin";
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 0x1Cu);
          return;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v15 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v16 = self->_processId;
    v17 = 136316162;
    v18 = v15;
    v19 = 2080;
    v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
    v21 = 1024;
    v22 = 681;
    v23 = 1024;
    v24 = v16;
    v25 = 2112;
    v26 = v5;
    v13 = "AVCAudioClient [%s] %s:%d Unknown notification type. processId=%d notificationType=%@";
LABEL_18:
    _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x2Cu);
    return;
  }
  (*((void (**)(void))self->_mutedTalkerNotificationHandler + 2))();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v14;
      v19 = 2080;
      v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
      v21 = 1024;
      v22 = 678;
      v9 = "AVCAudioClient [%s] %s:%d MutedTalkerNotificationHandler End";
      goto LABEL_13;
    }
  }
}

- (int)setMuteStateChangedEventHandler:(id)a3
{
  NSObject *clientAudioSessionQueue;
  int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AVAudioClient_setMuteStateChangedEventHandler___block_invoke;
  v6[3] = &unk_1E9E58E60;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(clientAudioSessionQueue, v6);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__AVAudioClient_setMuteStateChangedEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 32);
  if (v3 != v2)
  {
    _Block_release(*(const void **)(v1 + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = _Block_copy(*(const void **)(a1 + 40));
    if (v3)
      v5 = v2 == 0;
    else
      v5 = 1;
    if (v5)
    {
      v24 = CFSTR("muteStateChangedEnableHandler");
      v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) != 0);
      v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "muteStateChangedHandler", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1)), "objectForKeyedSubscript:", CFSTR("ERROR"));
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(*(id *)(a1 + 32), "cleanUpMuteStateChangedHandler");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "code");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v10 = *(_QWORD *)(a1 + 40);
            v11 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
            v12 = 136316418;
            v13 = v8;
            v14 = 2080;
            v15 = "-[AVAudioClient setMuteStateChangedEventHandler:]_block_invoke";
            v16 = 1024;
            v17 = 718;
            v18 = 1024;
            v19 = v11;
            v20 = 2112;
            v21 = v10;
            v22 = 2112;
            v23 = v7;
            _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to set the muted state changed handler block. processId=%d handler=%@ error=%@", (uint8_t *)&v12, 0x36u);
          }
        }
      }
    }
  }
}

- (void)dispatchedHandleMuteStateChangedEventWithXPCArguments:(id)a3
{
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  int processId;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientAudioSessionQueue);
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("muteStateChangedMuteState")), "BOOLValue");
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("muteStateChangedReason"));
  v7 = v6;
  if (!self->_muteStateChangedHandler)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    processId = self->_processId;
    v22 = 136316418;
    v23 = v12;
    v24 = 2080;
    v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
    v26 = 1024;
    v27 = 737;
    v28 = 1024;
    v29 = processId;
    v30 = 1024;
    v31[0] = v5;
    LOWORD(v31[1]) = 2112;
    *(_QWORD *)((char *)&v31[1] + 2) = v7;
    v15 = "AVCAudioClient [%s] %s:%d Notification received but handler is not registered processId=%d isMuted=%{BOOL}d reason=%@";
    v16 = v13;
    v17 = 50;
    goto LABEL_18;
  }
  v8 = objc_msgSend(v6, "unsignedCharValue");
  if (v8 != 1)
  {
    if (!v8)
    {
      (*((void (**)(void))self->_muteStateChangedHandler + 2))();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136315906;
          v23 = v9;
          v24 = 2080;
          v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
          v26 = 1024;
          v27 = 743;
          v28 = 1024;
          v29 = v5;
          v11 = "AVCAudioClient [%s] %s:%d Mute State Changed - Client Initiated, isMuted=%{BOOL}d";
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, 0x22u);
          return;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v21 = self->_processId;
    v22 = 136316162;
    v23 = v19;
    v24 = 2080;
    v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
    v26 = 1024;
    v27 = 750;
    v28 = 1024;
    v29 = v21;
    v30 = 2112;
    *(_QWORD *)v31 = v7;
    v15 = "AVCAudioClient [%s] %s:%d Unknown mute reason type, dropping notification. processId=%d reason=%@";
    v16 = v20;
    v17 = 44;
LABEL_18:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, v17);
    return;
  }
  (*((void (**)(void))self->_muteStateChangedHandler + 2))();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315906;
      v23 = v18;
      v24 = 2080;
      v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
      v26 = 1024;
      v27 = 747;
      v28 = 1024;
      v29 = v5;
      v11 = "AVCAudioClient [%s] %s:%d Mute State Changed - Hardware Initiated, isMuted=%{BOOL}d";
      goto LABEL_13;
    }
  }
}

- (void)cleanupSecureMicrophoneEngagedHandler
{
  id secureMicrophoneEngagedHandler;

  secureMicrophoneEngagedHandler = self->_secureMicrophoneEngagedHandler;
  if (secureMicrophoneEngagedHandler)
  {
    _Block_release(secureMicrophoneEngagedHandler);
    self->_secureMicrophoneEngagedHandler = 0;
  }
}

- (void)registerSecureMicrophoneEngagedHandler:(id)a3
{
  NSObject *clientAudioSessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVAudioClient_registerSecureMicrophoneEngagedHandler___block_invoke;
  block[3] = &unk_1E9E53548;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(clientAudioSessionQueue, block);
}

void *__56__AVAudioClient_registerSecureMicrophoneEngagedHandler___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "cleanupSecureMicrophoneEngagedHandler");
  result = *(void **)(a1 + 40);
  if (result)
  {
    result = _Block_copy(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = result;
  }
  return result;
}

- (void)resetXPCConnection
{
  unsigned int v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int connectionAttempts;
  dispatch_time_t v8;
  NSObject *current_queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientAudioSessionQueue);
  -[AVAudioClient cleanupXPCConnection](self, "cleanupXPCConnection");
  if (-[AVAudioClient shouldSetUpXPCConnection](self, "shouldSetUpXPCConnection"))
  {
    v3 = self->_connectionAttempts + 1;
    self->_connectionAttempts = v3;
    if ((double)v3 + (double)v3 > 10.0)
      v4 = 10.0;
    else
      v4 = 2.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        connectionAttempts = self->_connectionAttempts;
        *(_DWORD *)buf = 136316162;
        v12 = v5;
        v13 = 2080;
        v14 = "-[AVAudioClient resetXPCConnection]";
        v15 = 1024;
        v16 = 793;
        v17 = 2048;
        v18 = v4;
        v19 = 1024;
        v20 = connectionAttempts;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Retrying connection to server with delayInSeconds=%g connectionAttempts=%u", buf, 0x2Cu);
      }
    }
    v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    current_queue = dispatch_get_current_queue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__AVAudioClient_resetXPCConnection__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_after(v8, current_queue, block);
  }
}

uint64_t __35__AVAudioClient_resetXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setupXPCConnection");
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return result;
}

- (void)registerBlocksForDelegateNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_xpcConnection, "registerBlockForService:block:queue:", "mutedTalkerNotification", v8, self->_clientAudioSessionQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_2;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_xpcConnection, "registerBlockForService:block:queue:", "muteStateChangedEvent", v7, self->_clientAudioSessionQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_3;
  v6[3] = &unk_1E9E52730;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton"), "registerBlockForService:block:queue:", "vcSecureMicNotification", v6, self->_clientAudioSessionQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_78;
  v5[3] = &unk_1E9E56AA8;
  v5[4] = self;
  v5[5] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_xpcConnection, "registerBlockForService:block:queue:", "audioSessionServerDied", v5, self->_clientAudioSessionQueue);
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleMutedTalkerNotificationWithXPCArguments:", a2);
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "dispatchedHandleMuteStateChangedEventWithXPCArguments:", a2);
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v4;
        v8 = 2080;
        v9 = "-[AVAudioClient registerBlocksForDelegateNotifications]_block_invoke_3";
        v10 = 1024;
        v11 = 827;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d AVAudioClient-Secure-Mic-Notification!!", (uint8_t *)&v6, 0x1Cu);
      }
    }
    result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[AVAudioClient registerBlocksForDelegateNotifications]_block_invoke";
        v11 = 1024;
        v12 = 838;
        v13 = 1024;
        v14 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Server died. Attempt reconnect. processId=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "strong"), "resetXPCConnection");
  }
  return result;
}

- (void)unregisterBlocksForDelegateNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "audioSessionServerDied");
  objc_msgSend(+[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton"), "deregisterFromService:", "vcSecureMicNotification");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "muteStateChangedEvent");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "mutedTalkerNotification");
}

+ (void)startAudioSessionWithCompletionHandler:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient startAudioSessionWithCompletionHandler:]";
      v11 = 1024;
      v12 = 858;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-start (%p)", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVAudioClient startAudioSessionWithCompletionHandler:](v4, "startAudioSessionWithCompletionHandler:", a3);
}

+ (void)startAudioSession
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVAudioClient *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-startAudioSession");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "+[AVAudioClient startAudioSession]";
      v9 = 1024;
      v10 = 864;
      v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-startAudioSession (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "+[AVAudioClient startAudioSession]");
  -[AVAudioClient startAudioSessionWithCompletionHandler:](v2, "startAudioSessionWithCompletionHandler:", 0);
}

+ (void)setAudioSessionProperties:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setAudioSessionProperties");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient setAudioSessionProperties:]";
      v11 = 1024;
      v12 = 871;
      v13 = 2048;
      v14 = v4;
      v15 = 2112;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setAudioSessionProperties (%p) audioParams=%@", (uint8_t *)&v7, 0x30u);
    }
  }
  -[AVAudioClient setAudioSessionProperties:](v4, "setAudioSessionProperties:", a3);
}

+ (void)stopAudioSession
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVAudioClient *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "+[AVAudioClient stopAudioSession]";
      v9 = 1024;
      v10 = 877;
      v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  -[AVAudioClient stopAudioSession](v2, "stopAudioSession");
}

+ (void)resetAudioSessionOutputPortOverride
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVAudioClient *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-resetAudioSessionOutputPortOverride");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "+[AVAudioClient resetAudioSessionOutputPortOverride]";
      v9 = 1024;
      v10 = 883;
      v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-resetAudioSessionOutputPortOverride (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  -[AVAudioClient resetAudioSessionOutputPortOverride](v2, "resetAudioSessionOutputPortOverride");
}

+ (BOOL)hasActiveAudioSession
{
  return -[AVAudioClient hasActiveAudioSession](+[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance"), "hasActiveAudioSession");
}

+ (void)setMicrophoneMuted:(BOOL)a3
{
  _BOOL8 v3;
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setMicrophoneMuted");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient setMicrophoneMuted:]";
      v11 = 1024;
      v12 = 894;
      v13 = 2048;
      v14 = v4;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMicrophoneMuted (%p) isMuted=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVAudioClient setMicrophoneMuted:](v4, "setMicrophoneMuted:", v3);
}

+ (BOOL)isMicrophoneMuted
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-isMicrophoneMuted");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVAudioClient isMicrophoneMuted]";
      v10 = 1024;
      v11 = 900;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-isMicrophoneMuted (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return -[AVAudioClient isMicrophoneMuted](v2, "isMicrophoneMuted");
}

+ (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setMixingVoiceWithMediaEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient setMixingVoiceWithMediaEnabled:]";
      v11 = 1024;
      v12 = 906;
      v13 = 2048;
      v14 = v4;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMixingVoiceWithMediaEnabled (%p) isMixingVoiceWithMediaEnabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVAudioClient setMixingVoiceWithMediaEnabled:](v4, "setMixingVoiceWithMediaEnabled:", v3);
}

+ (BOOL)isMixingVoiceWithMediaEnabled
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-isMixingVoiceWithMediaEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVAudioClient isMixingVoiceWithMediaEnabled]";
      v10 = 1024;
      v11 = 912;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-isMixingVoiceWithMediaEnabled (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return -[AVAudioClient isMixingVoiceWithMediaEnabled](v2, "isMixingVoiceWithMediaEnabled");
}

+ (id)defaultInputDevice
{
  return +[AVAudioDeviceList defaultInputDevice](AVAudioDeviceList, "defaultInputDevice");
}

+ (id)defaultOutputDevice
{
  return +[AVAudioDeviceList defaultOutputDevice](AVAudioDeviceList, "defaultOutputDevice");
}

+ (id)currentInputDevice
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-currentInputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVAudioClient currentInputDevice]";
      v10 = 1024;
      v11 = 926;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-currentInputDevice (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return -[AVAudioClient currentInputDevice](v2, "currentInputDevice");
}

+ (id)currentOutputDevice
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-currentOutputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVAudioClient currentOutputDevice]";
      v10 = 1024;
      v11 = 932;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-currentOutputDevice (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return -[AVAudioClient currentOutputDevice](v2, "currentOutputDevice");
}

+ (BOOL)setInputDevice:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVAudioClient *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setInputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "+[AVAudioClient setInputDevice:]";
      v12 = 1024;
      v13 = 938;
      v14 = 2048;
      v15 = v4;
      v16 = 2112;
      v17 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setInputDevice (%p) inputDevice=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  return -[AVAudioClient setInputDevice:](v4, "setInputDevice:", a3);
}

+ (BOOL)setOutputDevice:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVAudioClient *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setOutputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "+[AVAudioClient setOutputDevice:]";
      v12 = 1024;
      v13 = 944;
      v14 = 2048;
      v15 = v4;
      v16 = 2112;
      v17 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setOutputDevice (%p) outputDevice=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  return -[AVAudioClient setOutputDevice:](v4, "setOutputDevice:", a3);
}

+ (void)setFollowSystemInputEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setFollowSystemInputEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient setFollowSystemInputEnabled:]";
      v11 = 1024;
      v12 = 950;
      v13 = 2048;
      v14 = v4;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setFollowSystemInputEnabled (%p) enabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVAudioClient setFollowSystemInputEnabled:](v4, "setFollowSystemInputEnabled:", v3);
}

+ (void)setFollowSystemOutputEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setFollowSystemOutputEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient setFollowSystemOutputEnabled:]";
      v11 = 1024;
      v12 = 956;
      v13 = 2048;
      v14 = v4;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setFollowSystemOutputEnabled (%p) enabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVAudioClient setFollowSystemOutputEnabled:](v4, "setFollowSystemOutputEnabled:", v3);
}

+ (int)registerForMutedTalkerNotifications:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVAudioClient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-registerForMutedTalkerNotifications");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "+[AVAudioClient registerForMutedTalkerNotifications:]";
      v12 = 1024;
      v13 = 965;
      v14 = 2048;
      v15 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-registerForMutedTalkerNotifications (%p)", (uint8_t *)&v8, 0x26u);
    }
  }
  return -[AVAudioClient registerForMutedTalkerNotifications:](v4, "registerForMutedTalkerNotifications:", a3);
}

+ (int)unregisterFromMutedTalkerNotifications
{
  AVAudioClient *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-unregisterFromMutedTalkerNotifications");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVAudioClient unregisterFromMutedTalkerNotifications]";
      v10 = 1024;
      v11 = 975;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-unregisterFromMutedTalkerNotifications (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return -[AVAudioClient unregisterFromMutedTalkerNotifications](v2, "unregisterFromMutedTalkerNotifications");
}

+ (int)setMuteStateChangedHandler:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVAudioClient *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setMuteStateChangedHandler");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "+[AVAudioClient setMuteStateChangedHandler:]";
      v12 = 1024;
      v13 = 985;
      v14 = 2048;
      v15 = v4;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMuteStateChangedHandler (%p) handler=%p", (uint8_t *)&v8, 0x30u);
    }
  }
  return -[AVAudioClient setMuteStateChangedEventHandler:](v4, "setMuteStateChangedEventHandler:", a3);
}

+ (void)registerSecureMicrophoneEngagedHandler:(id)a3
{
  AVAudioClient *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVAudioClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = +[AVAudioClient sharedInstance](AVAudioClient, "sharedInstance");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-registerSecureMicrophoneEngagedHandler");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "+[AVAudioClient registerSecureMicrophoneEngagedHandler:]";
      v11 = 1024;
      v12 = 992;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-registerSecureMicrophoneEngagedHandler (%p)", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVAudioClient registerSecureMicrophoneEngagedHandler:](v4, "registerSecureMicrophoneEngagedHandler:", a3);
}

- (void)setChangeListener:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVAudioClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AVAudioDeviceList setChangeListener:](-[AVAudioClient deviceList](self, "deviceList"), "setChangeListener:", a3);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioClient-setChangeListener");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[AVAudioClient setChangeListener:]";
      v10 = 1024;
      v11 = 998;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setChangeListener (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (id)changeListener
{
  return -[AVAudioDeviceList changeListener](-[AVAudioClient deviceList](self, "deviceList"), "changeListener");
}

- (id)devices
{
  id v3;
  const char *v4;
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAudioDeviceList devices](-[AVAudioClient deviceList](self, "deviceList"), "devices");
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return v3;
  __str = 0;
  if (self)
  {
    v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v4 = "<nil>";
    if (v3)
      goto LABEL_4;
  }
  v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s devices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    v6 = strtok_r(__str, "\n", &__lasts);
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v14 = v8;
          v15 = 2080;
          v16 = "-[AVAudioClient devices]";
          v17 = 1024;
          v18 = 1007;
          v19 = 2080;
          v20 = "AVAudioClient-devices";
          v21 = 2080;
          v22 = v6;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (id)inputDevices
{
  id v3;
  const char *v4;
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAudioDeviceList inputDevices](-[AVAudioClient deviceList](self, "deviceList"), "inputDevices");
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return v3;
  __str = 0;
  if (self)
  {
    v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v4 = "<nil>";
    if (v3)
      goto LABEL_4;
  }
  v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s inputDevices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    v6 = strtok_r(__str, "\n", &__lasts);
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v14 = v8;
          v15 = 2080;
          v16 = "-[AVAudioClient inputDevices]";
          v17 = 1024;
          v18 = 1013;
          v19 = 2080;
          v20 = "AVAudioClient-inputDevices";
          v21 = 2080;
          v22 = v6;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (id)outputDevices
{
  id v3;
  const char *v4;
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAudioDeviceList outputDevices](-[AVAudioClient deviceList](self, "deviceList"), "outputDevices");
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return v3;
  __str = 0;
  if (self)
  {
    v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v4 = "<nil>";
    if (v3)
      goto LABEL_4;
  }
  v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s outputDevices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    v6 = strtok_r(__str, "\n", &__lasts);
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v14 = v8;
          v15 = 2080;
          v16 = "-[AVAudioClient outputDevices]";
          v17 = 1024;
          v18 = 1019;
          v19 = 2080;
          v20 = "AVAudioClient-outputDevices";
          v21 = 2080;
          v22 = v6;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (AVAudioDeviceList)deviceList
{
  return self->deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)initSharedInstance
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Failed to initialize the XPC connection. processId=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupXPCConnection
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Failed to initialize the XPC connect. processId=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __33__AVAudioClient_stopAudioSession__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Timed out after waiting for audioSessionRef for 5 secs", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setInputDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_18(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_18();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v2, v3, "AVCAudioClient [%s] %s:%d Invalid input device. inputDevice=%@ UID=%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_9_1();
}

- (void)setOutputDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_18(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_18();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v2, v3, "AVCAudioClient [%s] %s:%d Invalid output device. outputDevice=%@ UID=%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_9_1();
}

- (void)registerForMutedTalkerNotifications:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Invalid handler", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Muted talker handler is already registered. processId=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCAudioClient [%s] %s:%d Muted talker handler is not registered. processId=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
