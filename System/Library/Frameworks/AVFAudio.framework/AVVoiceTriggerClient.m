@implementation AVVoiceTriggerClient

- (void)portStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**portStateChangedBlock)(id, id);
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    goto LABEL_18;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2567;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d port state changed : %@", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_9:
  portStateChangedBlock = (void (**)(id, id))self->_portStateChangedBlock;
  if (portStateChangedBlock)
  {
    portStateChangedBlock[2](portStateChangedBlock, v4);
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_18;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "AVVoiceTriggerClient.mm";
      v12 = 1024;
      v13 = 2572;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d port state changed but no block set", (uint8_t *)&v10, 0x12u);
    }

  }
LABEL_18:

}

- (void)speakerStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**speakerStateChangedBlock)(id, id);
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    goto LABEL_18;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315650;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2530;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d speaker state changed : %@", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_9:
  speakerStateChangedBlock = (void (**)(id, id))self->_speakerStateChangedBlock;
  if (speakerStateChangedBlock)
  {
    speakerStateChangedBlock[2](speakerStateChangedBlock, v4);
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_18;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "AVVoiceTriggerClient.mm";
      v12 = 1024;
      v13 = 2535;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d speaker state changed but no block set", (uint8_t *)&v10, 0x12u);
    }

  }
LABEL_18:

}

+ (BOOL)isAPIAvailable
{
  if (+[AVVoiceTriggerClient isAPIAvailable]::once != -1)
    dispatch_once(&+[AVVoiceTriggerClient isAPIAvailable]::once, &__block_literal_global_7379);
  return gHasBorealisXPC;
}

- (AVVoiceTriggerClient)init
{
  AVVoiceTriggerClient *v3;
  NSObject *v4;
  id v5;
  void *v6;
  SEL v7;
  void *v8;
  void *v9;
  SEL v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  NSObject *v15;
  _QWORD v17[4];
  AVVoiceTriggerClient *v18;
  objc_super v19;
  _BYTE v20[8];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  AVVoiceTriggerClient *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  Initialize_Logging();
  TraceMethod::TraceMethod((TraceMethod *)v20, "AVVoiceTriggerClient init");
  v19.receiver = self;
  v19.super_class = (Class)AVVoiceTriggerClient;
  v3 = -[AVVoiceTriggerClient init](&v19, sel_init);
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "AVVoiceTriggerClient.mm";
    v23 = 1024;
    v24 = 1296;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVoiceTriggerClient init %@", buf, 0x1Cu);
  }

LABEL_8:
  if (v3 && +[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    if (isAudioSessionAvailable(void)::onceToken != -1)
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = NSSelectorFromString(CFSTR("callServerCrashedBlock"));
      objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, v7, *MEMORY[0x1E0CFF060], v8);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = NSSelectorFromString(CFSTR("callServerResetBlock"));
      objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v3, v10, *MEMORY[0x1E0CFF068], v11);

    }
    else
    {
      if (isDarwinOSProduct(void)::onceToken != -1)
        dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_109);
      if (isDarwinOSProduct(void)::isDarwinOS)
        -[AVVoiceTriggerClient setAudioServerUpNotificationHandler](v3, "setAudioServerUpNotificationHandler");
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("AVVTC Work Queue", v12);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v13;

    v15 = v3->_workQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __28__AVVoiceTriggerClient_init__block_invoke;
    v17[3] = &unk_1E3BECBE0;
    v18 = v3;
    dispatch_async(v15, v17);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v20);
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _BYTE v8[8];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVVoiceTriggerClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TraceMethod::TraceMethod((TraceMethod *)v8, "dealloc");
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "AVVoiceTriggerClient.mm";
    v11 = 1024;
    v12 = 1341;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVoiceTriggerClient dealloc %@", buf, 0x1Cu);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    if (isAudioSessionAvailable(void)::onceToken != -1)
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CFF060], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CFF068], 0);

    }
    else
    {
      if (isDarwinOSProduct(void)::onceToken != -1)
        dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_109);
      if (isDarwinOSProduct(void)::isDarwinOS)
        -[AVVoiceTriggerClient removeAudioServerUpNotificationHandler](self, "removeAudioServerUpNotificationHandler");
    }
    -[AVVoiceTriggerClient closeServerConnection](self, "closeServerConnection");
  }
  TraceMethod::~TraceMethod((TraceMethod *)v8);
  v7.receiver = self;
  v7.super_class = (Class)AVVoiceTriggerClient;
  -[AVVoiceTriggerClient dealloc](&v7, sel_dealloc);
}

- (void)closeServerConnection
{
  NSXPCConnection *voiceTriggerServerConnection;

  -[NSXPCConnection invalidate](self->_voiceTriggerServerConnection, "invalidate");
  voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
  self->_voiceTriggerServerConnection = 0;

}

- (void)setAudioServerUpNotificationHandler
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "AVVoiceTriggerClient.mm";
    v10 = 1024;
    v11 = 1393;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d setting up audio server up notification handler", buf, 0x12u);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__AVVoiceTriggerClient_setAudioServerUpNotificationHandler__block_invoke;
  handler[3] = &unk_1E3BECC08;
  objc_copyWeak(&v7, (id *)buf);
  notify_register_dispatch("com.apple.darwinaudiod.up", &self->_audioSeverUpNotificationToken, v5, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)removeAudioServerUpNotificationHandler
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "AVVoiceTriggerClient.mm";
    v7 = 1024;
    v8 = 1402;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d removing bridgeaudiod up notification handler", (uint8_t *)&v5, 0x12u);
  }

LABEL_8:
  if (notify_is_valid_token(self->_audioSeverUpNotificationToken))
  {
    notify_cancel(self->_audioSeverUpNotificationToken);
    self->_audioSeverUpNotificationToken = -1;
  }
}

- (void)callServerCrashedBlock
{
  NSObject *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "AVVoiceTriggerClient.mm";
    v10 = 1024;
    v11 = 1411;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d server crashed", (uint8_t *)&v8, 0x12u);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_avvcServerCrashedBlock, "copy");
    v6 = objc_msgSend(self->_serverCrashedBlock, "copy");
    v7 = (void *)v6;
    if (v5)
    {
      v5[2](v5, v6);
    }
    else if (v6)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

  }
}

- (void)callServerResetBlock
{
  NSObject *v3;
  id v4;
  NSObject *workQueue;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 1436;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d server reset", buf, 0x12u);
  }

LABEL_8:
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVVoiceTriggerClient_callServerResetBlock__block_invoke;
    block[3] = &unk_1E3BECBE0;
    block[4] = self;
    dispatch_async(workQueue, block);
    v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_avvcServerResetBlock, "copy");
    v7 = objc_msgSend(self->_serverResetBlock, "copy");
    v8 = (void *)v7;
    if (v6)
    {
      v6[2](v6, v7);
    }
    else if (v7)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }

  }
}

- (NSXPCConnection)voiceTriggerServerConnection
{
  NSXPCConnection *voiceTriggerServerConnection;
  NSObject *v4;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  void *v10;
  AVVoiceTriggerNotificationForwarder *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    return (NSXPCConnection *)0;
  voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
  if (!voiceTriggerServerConnection)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
      {
LABEL_11:
        v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.audio.voicetrigger.xpc"), 4096);
        v8 = self->_voiceTriggerServerConnection;
        self->_voiceTriggerServerConnection = v7;

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE410570);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setRemoteObjectInterface:](self->_voiceTriggerServerConnection, "setRemoteObjectInterface:", v9);

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40D320);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSXPCConnection setExportedInterface:](self->_voiceTriggerServerConnection, "setExportedInterface:", v10);

        v11 = objc_alloc_init(AVVoiceTriggerNotificationForwarder);
        -[AVVoiceTriggerNotificationForwarder setTarget:](v11, "setTarget:", self);
        -[NSXPCConnection setExportedObject:](self->_voiceTriggerServerConnection, "setExportedObject:", v11);
        objc_initWeak((id *)buf, self);
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke;
        v13[3] = &unk_1E3BECC30;
        objc_copyWeak(&v14, (id *)buf);
        -[NSXPCConnection setInterruptionHandler:](self->_voiceTriggerServerConnection, "setInterruptionHandler:", v13);
        -[NSXPCConnection resume](self->_voiceTriggerServerConnection, "resume");
        -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_voiceTriggerServerConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "initializeWithReply:", &__block_literal_global_141_7331);

        objc_destroyWeak(&v14);
        objc_destroyWeak((id *)buf);

        voiceTriggerServerConnection = self->_voiceTriggerServerConnection;
        return voiceTriggerServerConnection;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "AVVoiceTriggerClient.mm";
      v17 = 1024;
      v18 = 1472;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d VoiceTrigger XPC connection is nil - first time - creating the connection", buf, 0x12u);
    }

    goto LABEL_11;
  }
  return voiceTriggerServerConnection;
}

- (void)voiceTriggerPastDataFramesAvailableCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "voiceTriggerPastDataFramesAvailableCompletion");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (void)getInputChannelInfoCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "getInputChannelInfoCompletion");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (void)setAVVCServerCrashedBlock:(id)a3
{
  void *v4;
  id avvcServerCrashedBlock;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(v6, "copy");
  avvcServerCrashedBlock = self->_avvcServerCrashedBlock;
  self->_avvcServerCrashedBlock = v4;

}

- (void)setAVVCServerResetBlock:(id)a3
{
  void *v4;
  id avvcServerResetBlock;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(v6, "copy");
  avvcServerResetBlock = self->_avvcServerResetBlock;
  self->_avvcServerResetBlock = v4;

}

- (unint64_t)voiceTriggerPastDataFramesAvailable
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];

  TraceMethod::TraceMethod((TraceMethod *)v13, "voiceTriggerPastDataFramesAvailable");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AVVoiceTriggerClient voiceTriggerServerConnection](self, "voiceTriggerServerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_151);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke_152;
    v8[3] = &unk_1E3BECD78;
    v8[4] = &v9;
    objc_msgSend(v5, "voiceTriggerPastDataFramesAvailable:", v8);

  }
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v13);
  return v6;
}

- (void)enableVoiceTriggerListening:(BOOL)a3
{
  _BOOL8 v3;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  _BYTE v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableVoiceTriggerListening:");
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__AVVoiceTriggerClient_enableVoiceTriggerListening___block_invoke;
  v10[3] = &unk_1E3BECDA0;
  v6 = v5;
  v11 = v6;
  -[AVVoiceTriggerClient enableVoiceTriggerListening:completionBlock:](self, "enableVoiceTriggerListening:completionBlock:", v3, v10);
  v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_9;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1672;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }

  }
LABEL_9:

  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

- (void)enableVoiceTriggerListening:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *workQueue;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  _BYTE v15[8];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v15, "enableVoiceTriggerListening:completionBlock:");
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "Disable";
    v17 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v9 = "Enable";
    v18 = 1024;
    v19 = 1679;
    v20 = 2080;
    v21 = v9;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableVoiceTriggerListening: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke;
    v12[3] = &unk_1E3BECDF0;
    v12[4] = self;
    v14 = v4;
    v13 = v6;
    dispatch_async(workQueue, v12);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v15);

}

- (void)setListeningProperty:(BOOL)a3 completionBlock:(id)a4
{
  void (**v4)(id, _QWORD);
  void *v5;
  _BYTE v6[8];

  v4 = (void (**)(id, _QWORD))a4;
  TraceMethod::TraceMethod((TraceMethod *)v6, "setListeningProperty:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    if (v4)
      v4[2](v4, 0);
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v5);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v6);

}

- (void)enableSpeakerStateListening:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *workQueue;
  void *v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _BYTE v12[8];

  v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableSpeakerStateListening:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke;
    v9[3] = &unk_1E3BECDF0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_async(workQueue, v9);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);

}

- (void)enableSpeakerStateListening:(BOOL)a3
{
  _BOOL8 v3;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  _BYTE v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableVoiceTriggerListening:");
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__AVVoiceTriggerClient_enableSpeakerStateListening___block_invoke;
  v10[3] = &unk_1E3BECDA0;
  v6 = v5;
  v11 = v6;
  -[AVVoiceTriggerClient enableSpeakerStateListening:completionBlock:](self, "enableSpeakerStateListening:completionBlock:", v3, v10);
  v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_9;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1862;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }

  }
LABEL_9:

  TraceMethod::~TraceMethod((TraceMethod *)v12);
}

- (void)speakerStateActiveCompletionBlock:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "speakerStateActiveCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (BOOL)speakerStateActive
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _BYTE v17[8];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  TraceMethod::TraceMethod((TraceMethod *)v17, "speakerStateActive");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__AVVoiceTriggerClient_speakerStateActive__block_invoke;
  v10[3] = &unk_1E3BECE40;
  v12 = &v13;
  v4 = v3;
  v11 = v4;
  -[AVVoiceTriggerClient speakerStateActiveCompletionBlock:](self, "speakerStateActiveCompletionBlock:", v10);
  v5 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "AVVoiceTriggerClient.mm";
      v20 = 1024;
      v21 = 1945;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }

  }
LABEL_9:
  v8 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v17);
  return v8;
}

- (void)speakerStateMutedCompletionBlock:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "speakerStateMutedCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (BOOL)speakerStateMuted
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _BYTE v17[8];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  TraceMethod::TraceMethod((TraceMethod *)v17, "speakerStateMuted");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__AVVoiceTriggerClient_speakerStateMuted__block_invoke;
  v10[3] = &unk_1E3BECE40;
  v12 = &v13;
  v4 = v3;
  v11 = v4;
  -[AVVoiceTriggerClient speakerStateMutedCompletionBlock:](self, "speakerStateMutedCompletionBlock:", v10);
  v5 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "AVVoiceTriggerClient.mm";
      v20 = 1024;
      v21 = 2029;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d server timeout", buf, 0x12u);
    }

  }
LABEL_9:
  v8 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  TraceMethod::~TraceMethod((TraceMethod *)v17);
  return v8;
}

- (void)enableListeningOnPorts:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _BYTE v13[8];

  v6 = a3;
  v7 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v13, "enablePortStateListening:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke;
    v10[3] = &unk_1E3BECE90;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(workQueue, v10);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v13);

}

- (void)portStateActiveCompletionBlock:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "portStateActiveCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (void)enableBargeInMode:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *workQueue;
  void *v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _BYTE v12[8];

  v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "enableBargeInMode:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke;
    v9[3] = &unk_1E3BECDF0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_async(workQueue, v9);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);

}

- (void)updateVoiceTriggerConfiguration:(id)a3
{
  -[AVVoiceTriggerClient updateVoiceTriggerConfiguration:completionBlock:](self, "updateVoiceTriggerConfiguration:completionBlock:", a3, 0);
}

- (void)updateVoiceTriggerConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _BYTE v13[8];

  v6 = a3;
  v7 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v13, "updateVoiceTriggerConfiguration:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke;
    v10[3] = &unk_1E3BECE90;
    v10[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(workQueue, v10);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v13);

}

- (void)listeningEnabledCompletionBlock:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "listeningEnabledCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (void)siriClientsRecordingCompletionBlock:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[5];
  id v8;
  _BYTE v9[8];

  v4 = a3;
  TraceMethod::TraceMethod((TraceMethod *)v9, "siriClientRunningCountCompletionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke;
    block[3] = &unk_1E3BECD08;
    block[4] = self;
    v8 = v4;
    dispatch_async(workQueue, block);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);

}

- (void)setAggressiveECMode:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *workQueue;
  void *v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _BYTE v12[8];

  v6 = a4;
  TraceMethod::TraceMethod((TraceMethod *)v12, "setAggressiveECMode:completionBlock:");
  if (+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
  {
    workQueue = self->_workQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke;
    v9[3] = &unk_1E3BECDF0;
    v9[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_async(workQueue, v9);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);

  }
  TraceMethod::~TraceMethod((TraceMethod *)v12);

}

- (id)recordingPIDList
{
  void *v2;
  _BYTE v4[160];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v4, "-[AVVoiceTriggerClient recordingPIDList]", 0, 0);
  GetRecordingAppsList();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ElapsedTime::~ElapsedTime((ElapsedTime *)v4);
  return v2;
}

- (id)activateSecureSession:(BOOL)a3
{
  NSObject *workQueue;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[6];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7222;
  v18 = __Block_byref_object_dispose__7223;
  v19 = 0;
  if (isHACProduct())
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke;
    block[3] = &unk_1E3BECF08;
    v13 = a3;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(workQueue, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11794, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v15[5];
    v15[5] = v6;

    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_10;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "AVVoiceTriggerClient.mm";
      v22 = 1024;
      v23 = 2492;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Operation not supported on this platform", buf, 0x12u);
    }

  }
LABEL_10:
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (void)voiceTriggerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    goto LABEL_25;
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315650;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 2510;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d voice trigger occured : %@", (uint8_t *)&v11, 0x1Cu);
    }

  }
  if (self->_voiceTriggerBlock)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_20:
        (*((void (**)(void))self->_voiceTriggerBlock + 2))();
        goto LABEL_25;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 2512;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d voice trigger occured, calling block", (uint8_t *)&v11, 0x12u);
    }

    goto LABEL_20;
  }
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_25;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 2516;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d voice trigger occured but no block set", (uint8_t *)&v11, 0x12u);
  }

LABEL_25:
}

- (void)speakerMuteStateChangedNotification:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void (**speakerMuteStateChangedBlock)(id, _BOOL8);
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    return;
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315650;
      v11 = "AVVoiceTriggerClient.mm";
      v12 = 1024;
      v13 = 2549;
      v14 = 1024;
      v15 = v3;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d speaker mute changed : %d", (uint8_t *)&v10, 0x18u);
    }

  }
  speakerMuteStateChangedBlock = (void (**)(id, _BOOL8))self->_speakerMuteStateChangedBlock;
  if (speakerMuteStateChangedBlock)
  {
    speakerMuteStateChangedBlock[2](speakerMuteStateChangedBlock, v3);
    return;
  }
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      return;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2554;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d speaker mute changed but no block set", (uint8_t *)&v10, 0x12u);
  }

}

- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4
{
  _BOOL8 v5;
  NSObject *v7;
  id v8;
  void (**siriClientRecordStateChangedBlock)(id, _BOOL8, unint64_t);
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (!+[AVVoiceTriggerClient isAPIAvailable](AVVoiceTriggerClient, "isAPIAvailable"))
    return;
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_6:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315906;
      v13 = "AVVoiceTriggerClient.mm";
      v14 = 1024;
      v15 = 2584;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = a4;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d siri client record state changed. starting(%d), recordingCount(%u)", (uint8_t *)&v12, 0x1Eu);
    }

  }
  siriClientRecordStateChangedBlock = (void (**)(id, _BOOL8, unint64_t))self->_siriClientRecordStateChangedBlock;
  if (siriClientRecordStateChangedBlock)
  {
    siriClientRecordStateChangedBlock[2](siriClientRecordStateChangedBlock, v5, a4);
    return;
  }
  if (kAVVCScope)
  {
    v10 = *(id *)kAVVCScope;
    if (!v10)
      return;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 2589;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d siri client record state changed but no block set", (uint8_t *)&v12, 0x12u);
  }

}

- (id)voiceTriggerBlock
{
  return self->_voiceTriggerBlock;
}

- (void)setVoiceTriggerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)speakerStateChangedBlock
{
  return self->_speakerStateChangedBlock;
}

- (void)setSpeakerStateChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)speakerMuteStateChangedBlock
{
  return self->_speakerMuteStateChangedBlock;
}

- (void)setSpeakerMuteStateChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)portStateChangedBlock
{
  return self->_portStateChangedBlock;
}

- (void)setPortStateChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)siriClientRecordStateChangedBlock
{
  return self->_siriClientRecordStateChangedBlock;
}

- (void)setSiriClientRecordStateChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)serverCrashedBlock
{
  return self->_serverCrashedBlock;
}

- (void)setServerCrashedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)serverResetBlock
{
  return self->_serverResetBlock;
}

- (void)setServerResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setVoiceTriggerServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerServerConnection, a3);
}

- (int)audioSeverUpNotificationToken
{
  return self->_audioSeverUpNotificationToken;
}

- (void)setAudioSeverUpNotificationToken:(int)a3
{
  self->_audioSeverUpNotificationToken = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (id)avvcServerCrashedBlock
{
  return self->_avvcServerCrashedBlock;
}

- (void)setAvvcServerCrashedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)avvcServerResetBlock
{
  return self->_avvcServerResetBlock;
}

- (void)setAvvcServerResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_avvcServerResetBlock, 0);
  objc_storeStrong(&self->_avvcServerCrashedBlock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_voiceTriggerServerConnection, 0);
  objc_storeStrong(&self->_serverResetBlock, 0);
  objc_storeStrong(&self->_serverCrashedBlock, 0);
  objc_storeStrong(&self->_siriClientRecordStateChangedBlock, 0);
  objc_storeStrong(&self->_portStateChangedBlock, 0);
  objc_storeStrong(&self->_speakerMuteStateChangedBlock, 0);
  objc_storeStrong(&self->_speakerStateChangedBlock, 0);
  objc_storeStrong(&self->_voiceTriggerBlock, 0);
}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "activate";
    v6 = *(unsigned __int8 *)(a1 + 48);
    v17 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6)
      v5 = "deactivate";
    v18 = 1024;
    v19 = 2472;
    v20 = 2080;
    v21 = v5;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d activateSecureSession: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (!v2)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_19:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;
        goto LABEL_20;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "AVVoiceTriggerClient.mm";
      v18 = 1024;
      v19 = 2485;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d activateSecureSession: couldn't connect to server", buf, 0x12u);
    }

    goto LABEL_19;
  }
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_195;
  v15[3] = &unk_1E3BECEE0;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(a1 + 48);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_196;
  v14[3] = &unk_1E3BECEE0;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "activateSecureSession:reply:", v9, v14);
LABEL_20:

}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315906;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 2475;
    v15 = 2048;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: activateSecureSession error handler : %ld (%@)", (uint8_t *)&v11, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __46__AVVoiceTriggerClient_activateSecureSession___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 2479;
      v15 = 2048;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d activateSecureSession returned error %ld (%@)", (uint8_t *)&v11, 0x26u);

    }
  }
LABEL_9:
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Enable";
    v6 = *(unsigned __int8 *)(a1 + 48);
    v20 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6)
      v5 = "Disable";
    v21 = 1024;
    v22 = 2400;
    v23 = 2080;
    v24 = v5;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAggressiveECMode: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_191;
    v16[3] = &unk_1E3BECDC8;
    v18 = *(_BYTE *)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_192;
    v13[3] = &unk_1E3BECDC8;
    v15 = v9;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setAggressiveECMode:reply:", v9, v13);

    v10 = v17;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      goto LABEL_19;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "AVVoiceTriggerClient.mm";
    v21 = 1024;
    v22 = 2417;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d setAggressiveECMode: couldn't connect to server", buf, 0x12u);
  }

LABEL_19:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:

}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_191(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 40))
      v7 = "enable";
    else
      v7 = "disable";
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 2403;
    v15 = 2080;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: setAggressiveECMode (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);

  }
LABEL_11:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __60__AVVoiceTriggerClient_setAggressiveECMode_completionBlock___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_21;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 40))
        v7 = "enable";
      else
        v7 = "disable";
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 2408;
      v18 = 2080;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d setAggressiveECMode: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);

    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "Enabled";
      v12 = *(unsigned __int8 *)(a1 + 40);
      v15 = "AVVoiceTriggerClient.mm";
      v14 = 136315650;
      if (!v12)
        v11 = "Disabled";
      v16 = 1024;
      v17 = 2410;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s listening property - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_16;
LABEL_21:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_188;
    v8[3] = &unk_1E3BECEB8;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "siriClientsRecordingReply:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 2370;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2356;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: siriClientRunningCount returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __60__AVVoiceTriggerClient_siriClientsRecordingCompletionBlock___block_invoke_188(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 2361;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d siriClientRunningCount returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 2363;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d siriClientRunningCount - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
    goto LABEL_13;
LABEL_16:
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_186;
    v8[3] = &unk_1E3BECE18;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "listeningEnabledReply:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 2316;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2302;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: listeningEnabled returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __56__AVVoiceTriggerClient_listeningEnabledCompletionBlock___block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 2307;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d listeningEnabled returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 2309;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
    goto LABEL_13;
LABEL_16:
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "AVVoiceTriggerClient.mm";
    v19 = 1024;
    v20 = 2212;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d updateVoiceTriggerConfiguration:", buf, 0x12u);
  }

LABEL_8:
  if (v2)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_19:
        v8 = MEMORY[0x1E0C809B0];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_183;
        v15[3] = &unk_1E3BECCB8;
        v16 = *(id *)(a1 + 48);
        objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_184;
        v13[3] = &unk_1E3BECCB8;
        v10 = *(_QWORD *)(a1 + 40);
        v14 = *(id *)(a1 + 48);
        objc_msgSend(v9, "updateVoiceTriggerConfiguration:reply:", v10, v13);

        v11 = v16;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AVVoiceTriggerClient.mm";
      v19 = 1024;
      v20 = 2214;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d sending config data to updateVoiceTriggerConfiguration", buf, 0x12u);
    }

    goto LABEL_19;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_24;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "AVVoiceTriggerClient.mm";
    v19 = 1024;
    v20 = 2230;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d updateVoiceTriggerConfiguration: couldn't connect to server", buf, 0x12u);
  }

LABEL_24:
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
LABEL_27:

}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_183(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2216;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: updateVoiceTriggerConfiguration: error handler : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

void __72__AVVoiceTriggerClient_updateVoiceTriggerConfiguration_completionBlock___block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_16;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 2221;
      v15 = 2048;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d updateVoiceTriggerConfiguration reply error : %ld (%@)", (uint8_t *)&v11, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 2223;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Update VoiceTrigger configuration successful", (uint8_t *)&v11, 0x12u);
    }
    goto LABEL_15;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_13;
LABEL_16:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Enable";
    v6 = *(unsigned __int8 *)(a1 + 48);
    v20 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6)
      v5 = "Disable";
    v21 = 1024;
    v22 = 2161;
    v23 = 2080;
    v24 = v5;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableBargeInMode: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_180;
    v16[3] = &unk_1E3BECDC8;
    v18 = *(_BYTE *)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_181;
    v13[3] = &unk_1E3BECDC8;
    v15 = v9;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v8, "enableBargeInMode:reply:", v9, v13);

    v10 = v17;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      goto LABEL_19;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "AVVoiceTriggerClient.mm";
    v21 = 1024;
    v22 = 2178;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d enableBargeInMode: couldn't connect to server", buf, 0x12u);
  }

LABEL_19:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:

}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_180(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 40))
      v7 = "enable";
    else
      v7 = "disable";
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 2164;
    v15 = 2080;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableBargeInMode (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);

  }
LABEL_11:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __58__AVVoiceTriggerClient_enableBargeInMode_completionBlock___block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_21;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 40))
        v7 = "enable";
      else
        v7 = "disable";
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 2169;
      v18 = 2080;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableBargeInMode: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);

    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "Enabled";
      v12 = *(unsigned __int8 *)(a1 + 40);
      v15 = "AVVoiceTriggerClient.mm";
      v14 = 136315650;
      if (!v12)
        v11 = "Disabled";
      v16 = 1024;
      v17 = 2171;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s barge-in - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_16;
LABEL_21:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_178;
    v8[3] = &unk_1E3BECD30;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "portsActiveReply:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 2122;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 2108;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: portStateActive returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __55__AVVoiceTriggerClient_portStateActiveCompletionBlock___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_16;
    }
    else
    {
      v7 = (id)MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315906;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 2113;
      v18 = 2048;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d portStateActive returned error : %ld (%@)", (uint8_t *)&v14, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v8 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 2115;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d portStateActive - Success", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_15;
  }
  v8 = *(id *)kAVVCScope;
  if (v8)
    goto LABEL_13;
LABEL_16:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    *(_DWORD *)buf = 136315650;
    v19 = "AVVoiceTriggerClient.mm";
    v20 = 1024;
    v21 = 2049;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enablePortStateListening: %@", buf, 0x1Cu);
  }

LABEL_8:
  if (v2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_175;
    v15[3] = &unk_1E3BECE68;
    v16 = a1[5];
    v17 = a1[6];
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_176;
    v12[3] = &unk_1E3BECE68;
    v13 = v8;
    v14 = a1[6];
    objc_msgSend(v7, "enableListeningOnPorts:reply:", v13, v12);

    v9 = v16;
LABEL_19:

    goto LABEL_20;
  }
  if (kAVVCScope)
  {
    v10 = *(id *)kAVVCScope;
    if (!v10)
      goto LABEL_17;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "AVVoiceTriggerClient.mm";
    v20 = 1024;
    v21 = 2066;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_17:
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_19;
  }
LABEL_20:

}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 2052;
    v15 = 2112;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enablePortStateListening: (%@) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);

  }
LABEL_8:
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __63__AVVoiceTriggerClient_enableListeningOnPorts_completionBlock___block_invoke_176(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_16;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316162;
      v13 = "AVVoiceTriggerClient.mm";
      v14 = 1024;
      v15 = 2057;
      v16 = 2112;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enablePortStateListening (%@) reply error : %ld (%@)", (uint8_t *)&v12, 0x30u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315394;
      v13 = "AVVoiceTriggerClient.mm";
      v14 = 1024;
      v15 = 2059;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Succesfully updated port listening state", (uint8_t *)&v12, 0x12u);
    }
    goto LABEL_15;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_13;
LABEL_16:
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

intptr_t __41__AVVoiceTriggerClient_speakerStateMuted__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_172;
    v8[3] = &unk_1E3BECE18;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "speakerStateMutedReply:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 1981;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 1967;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: speakerStateMuted returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __57__AVVoiceTriggerClient_speakerStateMutedCompletionBlock___block_invoke_172(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1972;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d speakerStateMuted returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1974;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateMuted - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
    goto LABEL_13;
LABEL_16:
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

intptr_t __42__AVVoiceTriggerClient_speakerStateActive__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_168;
    v8[3] = &unk_1E3BECE18;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "speakerStateActiveReply:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 1896;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 1882;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: speakerStateActive returned error : %ld (%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __58__AVVoiceTriggerClient_speakerStateActiveCompletionBlock___block_invoke_168(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315906;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1887;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d speakerStateActive returned error : %ld (%@)", (uint8_t *)&v13, 0x26u);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "AVVoiceTriggerClient.mm";
      v15 = 1024;
      v16 = 1889;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateActive - Success", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_15;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
    goto LABEL_13;
LABEL_16:
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

intptr_t __52__AVVoiceTriggerClient_enableSpeakerStateListening___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  const char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "enable";
    v6 = *(unsigned __int8 *)(a1 + 48);
    v20 = "AVVoiceTriggerClient.mm";
    *(_DWORD *)buf = 136315650;
    if (!v6)
      v5 = "disable";
    v21 = 1024;
    v22 = 1805;
    v23 = 2080;
    v24 = v5;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableSpeakerStateListening: %s", buf, 0x1Cu);
  }

LABEL_10:
  if (v2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_164;
    v16[3] = &unk_1E3BECDC8;
    v18 = *(_BYTE *)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_165;
    v13[3] = &unk_1E3BECDC8;
    v15 = v9;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v8, "enableSpeakerStateListening:reply:", v9, v13);

    v10 = v17;
LABEL_21:

    goto LABEL_22;
  }
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      goto LABEL_19;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "AVVoiceTriggerClient.mm";
    v21 = 1024;
    v22 = 1822;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_19:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
LABEL_22:

}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_164(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 40))
      v7 = "enable";
    else
      v7 = "disable";
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 1808;
    v15 = 2080;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableSpeakerStateListening: (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);

  }
LABEL_11:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __68__AVVoiceTriggerClient_enableSpeakerStateListening_completionBlock___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_21;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 40))
        v7 = "enable";
      else
        v7 = "disable";
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 1813;
      v18 = 2080;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableSpeakerStateListening (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);

    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = "Enabled";
      v12 = *(unsigned __int8 *)(a1 + 40);
      v15 = "AVVoiceTriggerClient.mm";
      v14 = 136315650;
      if (!v12)
        v11 = "disabled";
      v16 = 1024;
      v17 = 1815;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s speaker state listening - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_16;
LABEL_21:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_2;
    v12[3] = &unk_1E3BECDC8;
    v14 = *(_BYTE *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_159;
    v9[3] = &unk_1E3BECDC8;
    v11 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "enableVoiceTriggerListening:reply:", v5, v9);

    v6 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "AVVoiceTriggerClient.mm";
    v17 = 1024;
    v18 = 1708;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d enableVoiceTriggerListening: couldn't connect to server", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 40))
      v7 = "enable";
    else
      v7 = "disable";
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "AVVoiceTriggerClient.mm";
    v13 = 1024;
    v14 = 1694;
    v15 = 2080;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: enableVoiceTriggerListening (%s) error handler : %ld (%@)", (uint8_t *)&v11, 0x30u);

  }
LABEL_11:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __68__AVVoiceTriggerClient_enableVoiceTriggerListening_completionBlock___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_21;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 40))
        v7 = "enable";
      else
        v7 = "disable";
      v8 = objc_msgSend(v3, "code");
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "AVVoiceTriggerClient.mm";
      v16 = 1024;
      v17 = 1699;
      v18 = 2080;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d enableVoiceTriggerListening: (%s) reply error : %ld (%@)", (uint8_t *)&v14, 0x30u);

    }
LABEL_20:

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
LABEL_16:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "Enabled";
      v12 = *(unsigned __int8 *)(a1 + 40);
      v15 = "AVVoiceTriggerClient.mm";
      v14 = 136315650;
      if (!v12)
        v11 = "Disabled";
      v16 = 1024;
      v17 = 1701;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s voice trigger - Success", (uint8_t *)&v14, 0x1Cu);
    }
    goto LABEL_20;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
    goto LABEL_16;
LABEL_21:
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

intptr_t __52__AVVoiceTriggerClient_enableVoiceTriggerListening___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke_152(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_10;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "AVVoiceTriggerClient.mm";
      v13 = 1024;
      v14 = 1637;
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger pastDataFramesAvailable error : %ld(%@)", (uint8_t *)&v11, 0x26u);

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
LABEL_10:

}

void __59__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(v2, "code");
    objc_msgSend(v2, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "AVVoiceTriggerClient.mm";
    v10 = 1024;
    v11 = 1634;
    v12 = 2048;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger pastDataFramesAvailable returned error : %ld(%@)", (uint8_t *)&v8, 0x26u);

  }
LABEL_8:

}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_147;
    v8[3] = &unk_1E3BECD30;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "getInputChannelInfoCompletion:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 1598;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 1581;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger getInputChannelInfoCompletion returned error : %ld(%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __54__AVVoiceTriggerClient_getInputChannelInfoCompletion___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  _anonymous_namespace_ *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = (id)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315906;
      v17 = "AVVoiceTriggerClient.mm";
      v18 = 1024;
      v19 = 1586;
      v20 = 2048;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger getInputChannelInfoCompletion error : %ld(%@)", (uint8_t *)&v16, 0x26u);

    }
  }
LABEL_9:
  if (*(_QWORD *)(a1 + 32))
  {
    v12 = (NSString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_2;
    v10[3] = &unk_1E3BECCB8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_144;
    v8[3] = &unk_1E3BECCE0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "voiceTriggerPastDataFramesAvailable:", v8);

    v5 = v11;
LABEL_12:

    goto LABEL_13;
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVVoiceTriggerClient.mm";
    v14 = 1024;
    v15 = 1537;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d serverConnection is nil - no xpc connection established", buf, 0x12u);
  }

LABEL_10:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11792, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_13:

}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315906;
    v11 = "AVVoiceTriggerClient.mm";
    v12 = 1024;
    v13 = 1525;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger pastDataFramesAvailable returned error : %ld(%@)", (uint8_t *)&v10, 0x26u);

  }
LABEL_8:
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v3);

}

void __70__AVVoiceTriggerClient_voiceTriggerPastDataFramesAvailableCompletion___block_invoke_144(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315906;
      v13 = "AVVoiceTriggerClient.mm";
      v14 = 1024;
      v15 = 1530;
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTrigger pastDataFramesAvailable error : %ld(%@)", (uint8_t *)&v12, 0x26u);

    }
  }
LABEL_9:
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, a2, v5);

}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v2 = *(id *)kAVVCScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "AVVoiceTriggerClient.mm";
    v7 = 1024;
    v8 = 1485;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d VoiceTriggerServerConnection was interrupted", (uint8_t *)&v5, 0x12u);
  }

LABEL_8:
  if (isDarwinOSProduct(void)::onceToken != -1)
    dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_109);
  if (isDarwinOSProduct(void)::isDarwinOS)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "callServerCrashedBlock");

  }
}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke_140(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315650;
    v6 = "AVVoiceTriggerClient.mm";
    v7 = 1024;
    v8 = 1500;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d VoiceTrigger server initializWithReply called (%@)", (uint8_t *)&v5, 0x1Cu);
  }

LABEL_8:
}

void __52__AVVoiceTriggerClient_voiceTriggerServerConnection__block_invoke_137(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
        goto LABEL_9;
    }
    else
    {
      v3 = (id)MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(v2, "code");
      objc_msgSend(v2, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315906;
      v9 = "AVVoiceTriggerClient.mm";
      v10 = 1024;
      v11 = 1497;
      v12 = 2048;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d ProxyErrorHandler: VoiceTrigger Initialize returned error : %ld(%@)", (uint8_t *)&v8, 0x26u);

    }
  }
LABEL_9:

}

id __44__AVVoiceTriggerClient_callServerResetBlock__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeServerConnection");
  return (id)objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
}

void __59__AVVoiceTriggerClient_setAudioServerUpNotificationHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "callServerResetBlock");

}

id __28__AVVoiceTriggerClient_init__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "voiceTriggerServerConnection");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVVoiceTriggerClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVoiceTriggerClient sharedInstance]::onceToken != -1)
    dispatch_once(&+[AVVoiceTriggerClient sharedInstance]::onceToken, block);
  return (id)voiceTriggerClientSharedInstance;
}

+ (BOOL)supportsDuckingOnSpeakerOutput
{
  int v2;
  NSObject *v3;
  id v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
    v2 = MGGetBoolAnswer();
  else
    v2 = 0;
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      return v2;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "AVVCUtils.mm";
    v8 = 1024;
    v9 = 919;
    v10 = 1024;
    v11 = v2;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsSpeakerDuckingProduct(%d)", (uint8_t *)&v6, 0x18u);
  }

  return v2;
}

void __38__AVVoiceTriggerClient_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)voiceTriggerClientSharedInstance;
  voiceTriggerClientSharedInstance = (uint64_t)v1;

  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      return;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "AVVoiceTriggerClient.mm";
    v7 = 1024;
    v8 = 1280;
    v9 = 2048;
    v10 = voiceTriggerClientSharedInstance;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created AVVoiceTriggerClient (%p)", (uint8_t *)&v5, 0x1Cu);
  }

}

void __38__AVVoiceTriggerClient_isAPIAvailable__block_invoke()
{
  gHasBorealisXPC = 1;
}

@end
