@implementation CMContinuityCaptureXPCClientCCD

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_21);
  return (id)_sharedClient;
}

void __49__CMContinuityCaptureXPCClientCCD_sharedInstance__block_invoke()
{
  CMContinuityCaptureXPCClientCCD *v0;
  void *v1;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v0 = objc_alloc_init(CMContinuityCaptureXPCClientCCD);
  v1 = (void *)_sharedClient;
  _sharedClient = (uint64_t)v0;

}

- (CMContinuityCaptureXPCClientCCD)init
{
  CMContinuityCaptureXPCClientCCD *v2;
  NSObject *v3;
  __int128 v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *connectionQueue;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureXPCClientCCD;
  v2 = -[CMContinuityCaptureXPCClientCCD init](&v8, sel_init);
  if (v2)
  {
    if (dword_255924770)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v3 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v15 = v4;
      v16 = v4;
      v14 = v4;
      v12 = v4;
      v13 = v4;
      v10 = v4;
      v11 = v4;
      v9 = v4;
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    v5 = dispatch_queue_create("com.apple.continuitycapture.remoteuiclient.connection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)sessionDidUpdateWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;

  v4 = a3;
  if (dword_255924770)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "sessionDidUpdateWithConfiguration:", v4);

}

- (void)tearDownShield
{
  NSObject *v3;
  id WeakRetained;
  void *v5;

  if (dword_255924770)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "tearDownShield");

}

- (void)serverXPCConnectionInterrupted
{
  NSObject *v3;
  id WeakRetained;
  void *v5;

  if (dword_255924770)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "serverXPCConnectionInterrupted");

}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestContinuityCaptureUIConfiguration:", v4);

}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  id v4;

  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeStreamingForEvent:", a3);

}

- (void)pauseSessionForEvent:(int64_t)a3
{
  id v4;

  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseSessionForEvent:", a3);

}

- (void)disconnectSession
{
  id v2;

  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectSession");

}

- (void)skipPlacementStep
{
  id v2;

  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skipPlacementStep");

}

- (void)prepareForPullConversation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CMContinuityCaptureXPCClientCCD _service](self, "_service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForPullConversation:", v4);

}

- (void)connectToContinuityCaptureServerWithDelegate:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *connectionQueue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  id v11;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = dispatch_semaphore_create(0);
  objc_storeWeak((id *)&self->_delegate, v4);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_connectionQueue);
  connectionQueue = self->_connectionQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke;
  v9[3] = &unk_24F06AF00;
  objc_copyWeak(&v11, &location);
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(connectionQueue, v9);
  v8 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.continuitycaptured"), 4096);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25592F578);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25592DDB0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    objc_msgSend(v4, "setExportedObject:", *(_QWORD *)(a1 + 32));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v4);
    objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_69_0);
    v7 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_3;
    v14[3] = &unk_24F06AE60;
    objc_copyWeak(&v15, v2);
    objc_msgSend(v4, "setInterruptionHandler:", v14);
    objc_msgSend(WeakRetained[1], "invalidate");
    objc_storeStrong(WeakRetained + 1, v4);
    objc_msgSend(WeakRetained[1], "resume");
    objc_msgSend(WeakRetained, "_service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_5;
    v11[3] = &unk_24F06D160;
    objc_copyWeak(&v13, v2);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "requestContinuityCaptureUIConfiguration:", v11);

    if (dword_255924770)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v9 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v23 = v10;
      v24 = v10;
      v21 = v10;
      v22 = v10;
      v19 = v10;
      v20 = v10;
      v17 = v10;
      v18 = v10;
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "serverXPCConnectionInterrupted");
    v4 = dispatch_time(0, 3000000000);
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_4;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
  }

}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 3);
    objc_msgSend(v3, "connectToContinuityCaptureServerWithDelegate:", v2);

    WeakRetained = v3;
  }

}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (dword_255924770)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v5 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v15 = v6;
      v16 = v6;
      v13 = v6;
      v14 = v6;
      v11 = v6;
      v12 = v6;
      v9 = v6;
      v10 = v6;
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    objc_msgSend(WeakRetained, "sessionDidUpdateWithConfiguration:", v3, v7, v8);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (id)_service
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__CMContinuityCaptureXPCClientCCD__service__block_invoke;
  v4[3] = &unk_24F06CF88;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__CMContinuityCaptureXPCClientCCD__service__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (dword_255924770)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
