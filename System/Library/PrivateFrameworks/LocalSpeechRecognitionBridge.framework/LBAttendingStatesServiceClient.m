@implementation LBAttendingStatesServiceClient

- (LBAttendingStatesServiceClient)initWithDelegate:(id)a3
{
  id v4;
  LBAttendingStatesServiceClient *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  LBAttendingStatesServiceClient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBAttendingStatesServiceClient;
  v5 = -[LBAttendingStatesServiceClient init](&v11, sel_init);
  if (v5)
  {
    if (LBLogInitIfNeeded_once != -1)
      dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("LBAttendingStatesServiceClient Queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }
  v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[LBAttendingStatesServiceClient initWithDelegate:]";
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_2141AA000, v9, OS_LOG_TYPE_DEFAULT, "%s created %p", buf, 0x16u);
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[LBAttendingStatesServiceClient dealloc]";
    _os_log_impl(&dword_2141AA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[LBAttendingStatesServiceClient _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)LBAttendingStatesServiceClient;
  -[LBAttendingStatesServiceClient dealloc](&v4, sel_dealloc);
}

- (void)startUpdateStates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__LBAttendingStatesServiceClient_startUpdateStates__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__LBAttendingStatesServiceClient_invalidate__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  id remoteObjectProxy;
  NSString *xpcConnectionUUIDString;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[LBAttendingStatesServiceClient _invalidate]";
    _os_log_impl(&dword_2141AA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = 0;

  xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
  self->_xpcConnectionUUIDString = 0;

}

- (void)siriPromptWillStart
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__LBAttendingStatesServiceClient_siriPromptWillStart__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriDidPrompt
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__LBAttendingStatesServiceClient_siriDidPrompt__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriPromptWillStartWithRootRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  LBAttendingStatesServiceClient *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__LBAttendingStatesServiceClient_siriPromptWillStartWithRootRequestId___block_invoke;
  v7[3] = &unk_24D1707B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)siriDidPromptWithRootRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  LBAttendingStatesServiceClient *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__LBAttendingStatesServiceClient_siriDidPromptWithRootRequestId___block_invoke;
  v7[3] = &unk_24D1707B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)dismissAttending
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__LBAttendingStatesServiceClient_dismissAttending__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestDismissed
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__LBAttendingStatesServiceClient_requestDismissed__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  id v4;
  NSObject *v5;
  LBAttendingStatesServiceDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[LBAttendingStatesServiceClient localAttendingWillStartWithRootRequestId:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2141AA000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "localAttendingWillStartWithRootRequestId:", v4);

  }
}

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  id v4;
  NSObject *v5;
  LBAttendingStatesServiceDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[LBAttendingStatesServiceClient localAttendingStartedWithRootRequestId:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2141AA000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  self->_isAttending = 1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "localAttendingStartedWithRootRequestId:", v4);

  }
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  NSObject *queue;
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[LBAttendingStatesServiceClient localAttendingStoppedUnexpectedlyWithError:]";
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localAttendingStoppedUnexpectedlyWithError:", v5);

}

- (void)localAttendingStopped
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[LBAttendingStatesServiceClient localAttendingStopped]";
    _os_log_impl(&dword_2141AA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_isAttending = 0;
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8;
  NSObject *v9;
  LBAttendingStatesServiceDelegate **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315906;
    v15 = "-[LBAttendingStatesServiceClient speechStartDetectedWithHostTime:audioRecordType:audioRecordDeviceId:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_2141AA000, v9, OS_LOG_TYPE_DEFAULT, "%s hostTime : %llu, audioRecordType : %lld, deviceId : %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v13, "speechStartDetectedWithHostTime:audioRecordType:audioRecordDeviceId:", a3, a4, v8);

  }
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  LBAttendingStatesServiceDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[LBAttendingStatesServiceClient speechStartDetectedWithShouldDuckTTS:]";
    v12 = 1026;
    v13 = v3;
    _os_log_impl(&dword_2141AA000, v5, OS_LOG_TYPE_DEFAULT, "%s shouldDuckTTS: %{public}d", (uint8_t *)&v10, 0x12u);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "speechStartDetectedWithShouldDuckTTS:", v3);

  }
}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  id v8;
  NSObject *v9;
  LBAttendingStatesServiceDelegate **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315906;
    v15 = "-[LBAttendingStatesServiceClient speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:audioRecordT"
          "ype:audioRecordDeviceId:]";
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = a4;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_2141AA000, v9, OS_LOG_TYPE_DEFAULT, "%s hostTime : %llu, audioRecordType : %lld, deviceId : %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v13, "speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:audioRecordType:audioRecordDeviceId:", a3, a4, v8);

  }
}

- (id)_newConnection
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.attendingstates.xpc"), 0);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6A6A8);
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  v5 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6A590);
  objc_msgSend(v3, "setExportedInterface:", v5);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "_setQueue:", self->_queue);
  return v3;
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  void *v4;
  NSString *v5;
  NSString *xpcConnectionUUIDString;
  NSObject *v7;
  NSString *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  NSString *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSString *v14;
  NSXPCConnection *v15;
  NSString *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  NSString *v22;
  id v23;
  _QWORD v24[4];
  NSString *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    v7 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_xpcConnectionUUIDString;
      *(_DWORD *)buf = 136315394;
      v28 = "-[LBAttendingStatesServiceClient _connection]";
      v29 = 2114;
      v30 = v8;
      _os_log_impl(&dword_2141AA000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection %{public}@...", buf, 0x16u);
    }
    v9 = -[LBAttendingStatesServiceClient _newConnection](self, "_newConnection");
    v10 = self->_xpcConnection;
    self->_xpcConnection = v9;

    objc_initWeak((id *)buf, self);
    v11 = self->_xpcConnectionUUIDString;
    v12 = self->_xpcConnection;
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__LBAttendingStatesServiceClient__connection__block_invoke;
    v24[3] = &unk_24D1707E0;
    v14 = v11;
    v25 = v14;
    objc_copyWeak(&v26, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v24);
    v15 = self->_xpcConnection;
    v18 = v13;
    v19 = 3221225472;
    v20 = __45__LBAttendingStatesServiceClient__connection__block_invoke_16;
    v21 = &unk_24D1707E0;
    v16 = v14;
    v22 = v16;
    objc_copyWeak(&v23, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v15, "setInvalidationHandler:", &v18);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v18, v19, v20, v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[LBAttendingStatesServiceClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (LBAttendingStatesServiceDelegate)delegate
{
  return (LBAttendingStatesServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, a3);
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (void)setIsAttending:(BOOL)a3
{
  self->_isAttending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__LBAttendingStatesServiceClient__connection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315906;
    v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
    v19 = 2112;
    v20 = CFSTR("com.apple.siri.attendingstates.xpc");
    v21 = 2114;
    v22 = v3;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@(%{public}@) Interrupted (current connection: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  v7 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "xpcConnectionUUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v8[3], "setInvalidationHandler:", 0);
      objc_msgSend(v8[3], "invalidate");
      v11 = v8[3];
      v8[3] = 0;

      if (*((_BYTE *)v8 + 8))
      {
        *((_BYTE *)v8 + 8) = 0;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 501, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = objc_loadWeakRetained(v8 + 5);
        objc_msgSend(v13, "localAttendingStoppedUnexpectedlyWithError:", v12);
LABEL_9:

        goto LABEL_10;
      }
      v16 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        _os_log_impl(&dword_2141AA000, v16, OS_LOG_TYPE_DEFAULT, "%s Skip reporting unexpected stop due to xpc interruption, since Siri is not in attending state", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v14 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v15 = *(const __CFString **)(a1 + 32);
        v12 = v14;
        objc_msgSend(v8, "xpcConnectionUUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315650;
        v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        v19 = 2112;
        v20 = v15;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_2141AA000, v12, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v17, 0x20u);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

void __45__LBAttendingStatesServiceClient__connection__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315906;
    v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
    v19 = 2112;
    v20 = CFSTR("com.apple.siri.attendingstates.xpc");
    v21 = 2112;
    v22 = v3;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@(%@) Invalidated (current connection: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "xpcConnectionUUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v9 & 1) != 0)
    {
      v11 = (void *)*((_QWORD *)v8 + 3);
      *((_QWORD *)v8 + 3) = 0;

      if (*((_BYTE *)v8 + 8))
      {
        *((_BYTE *)v8 + 8) = 0;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 501, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = objc_loadWeakRetained((id *)v8 + 5);
        objc_msgSend(v13, "localAttendingStoppedUnexpectedlyWithError:", v12);
LABEL_9:

        goto LABEL_10;
      }
      v16 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        _os_log_impl(&dword_2141AA000, v16, OS_LOG_TYPE_DEFAULT, "%s Skip reporting unexpected stop due to xpc invalidation, since Siri is not in attending state", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v14 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v15 = *(const __CFString **)(a1 + 32);
        v12 = v14;
        objc_msgSend(v8, "xpcConnectionUUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315650;
        v18 = "-[LBAttendingStatesServiceClient _connection]_block_invoke";
        v19 = 2112;
        v20 = v15;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_2141AA000, v12, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v17, 0x20u);
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

void __50__LBAttendingStatesServiceClient_requestDismissed__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[LBAttendingStatesServiceClient requestDismissed]_block_invoke";
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestDismissed");

}

void __50__LBAttendingStatesServiceClient_dismissAttending__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[LBAttendingStatesServiceClient dismissAttending]_block_invoke";
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAttending");

}

void __65__LBAttendingStatesServiceClient_siriDidPromptWithRootRequestId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[LBAttendingStatesServiceClient siriDidPromptWithRootRequestId:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDidPromptWithRootRequestId:", *(_QWORD *)(a1 + 32));

}

void __71__LBAttendingStatesServiceClient_siriPromptWillStartWithRootRequestId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[LBAttendingStatesServiceClient siriPromptWillStartWithRootRequestId:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriPromptWillStartWithRootRequestId:", *(_QWORD *)(a1 + 32));

}

void __47__LBAttendingStatesServiceClient_siriDidPrompt__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriDidPrompt");

}

void __53__LBAttendingStatesServiceClient_siriPromptWillStart__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriPromptWillStart");

}

uint64_t __44__LBAttendingStatesServiceClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __51__LBAttendingStatesServiceClient_startUpdateStates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[LBAttendingStatesServiceClient startUpdateStates]_block_invoke";
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startUpdateStates");

}

@end
