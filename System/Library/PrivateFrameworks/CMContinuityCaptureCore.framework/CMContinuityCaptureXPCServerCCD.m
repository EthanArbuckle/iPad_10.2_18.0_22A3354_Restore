@implementation CMContinuityCaptureXPCServerCCD

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_13);
  return (id)_sharedListener;
}

void __49__CMContinuityCaptureXPCServerCCD_sharedInstance__block_invoke()
{
  CMContinuityCaptureXPCServerCCD *v0;
  void *v1;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v0 = objc_alloc_init(CMContinuityCaptureXPCServerCCD);
  v1 = (void *)_sharedListener;
  _sharedListener = (uint64_t)v0;

}

- (CMContinuityCaptureXPCServerCCD)init
{
  CMContinuityCaptureXPCServerCCD *v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  OS_dispatch_queue *xpcConnectionQueue;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureXPCServerCCD;
  v2 = -[CMContinuityCaptureXPCServerCCD init](&v10, sel_init);
  if (v2)
  {
    if (dword_255924730)
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v3 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17 = v4;
      v18 = v4;
      v16 = v4;
      v14 = v4;
      v15 = v4;
      v12 = v4;
      v13 = v4;
      v11 = v4;
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    objc_msgSend(CFSTR("com.apple.continuitycapture.listener.xpcconnection"), "UTF8String", v8, v9);
    v5 = FigDispatchQueueCreateWithPriority();
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)startListeningWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  __int128 v6;
  NSMutableArray *v7;
  NSMutableArray *connections;
  NSXPCListener *serviceListener;
  NSXPCListener *v10;
  NSXPCListener *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v6;
    v21 = v6;
    v18 = v6;
    v19 = v6;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  objc_storeWeak((id *)&self->_delegate, v4);
  if (!self->_connections)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connections = self->_connections;
    self->_connections = v7;

    self->_connectionsLock._os_unfair_lock_opaque = 0;
  }
  serviceListener = self->_serviceListener;
  if (!serviceListener)
  {
    v10 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.continuitycaptured"));
    v11 = self->_serviceListener;
    self->_serviceListener = v10;

    -[NSXPCListener setDelegate:](self->_serviceListener, "setDelegate:", self);
    serviceListener = self->_serviceListener;
  }
  -[NSXPCListener resume](serviceListener, "resume", v12, v13);

}

- (void)tearDownShieldUI
{
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13 = v4;
    v14 = v4;
    v11 = v4;
    v12 = v4;
    v9 = v4;
    v10 = v4;
    v7 = v4;
    v8 = v4;
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  -[CMContinuityCaptureXPCServerCCD _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", &__block_literal_global_13, v5, v6);
}

void __51__CMContinuityCaptureXPCServerCCD_tearDownShieldUI__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDownShield");

}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;

  v4 = a3;
  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "requestContinuityCaptureUIConfiguration:", v4);

}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  NSObject *v5;
  id WeakRetained;

  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "resumeStreamingForEvent:", a3);

}

- (void)pauseSessionForEvent:(int64_t)a3
{
  NSObject *v5;
  id WeakRetained;

  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pauseSessionForEvent:", a3);

}

- (void)updateClientsWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  __int128 v6;
  id v7;
  _QWORD v8[4];
  id v9;
  os_log_type_t type;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (dword_255924730)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v18 = v6;
    v19 = v6;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__CMContinuityCaptureXPCServerCCD_updateClientsWithConfiguration___block_invoke;
  v8[3] = &unk_24F06C9B8;
  v9 = v4;
  v7 = v4;
  -[CMContinuityCaptureXPCServerCCD _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", v8);

}

void __66__CMContinuityCaptureXPCServerCCD_updateClientsWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionDidUpdateWithConfiguration:", *(_QWORD *)(a1 + 32));

}

- (void)disconnectSession
{
  NSObject *v3;
  id WeakRetained;

  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "disconnectSession");

}

- (void)skipPlacementStep
{
  NSObject *v3;
  id WeakRetained;

  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "skipPlacementStep");

}

- (void)prepareForPullConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;

  v4 = a3;
  if (dword_255924730)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "prepareForPullConversation:", v4);

}

- (void)_enumerateConnectionsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_log_type_t type;
  int v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  os_unfair_lock_lock(&self->_connectionsLock);
  v5 = (void *)-[NSMutableArray copy](self->_connections, "copy");
  os_unfair_lock_unlock(&self->_connectionsLock);
  if (dword_255924730)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26 = v7;
    v27 = v7;
    v24 = v7;
    v25 = v7;
    v22 = v7;
    v23 = v7;
    v20 = v7;
    v21 = v7;
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v10);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *serviceListener;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *xpcConnectionQueue;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  id location;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  serviceListener = self->_serviceListener;
  if (serviceListener == v6)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25592F578);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25592DDB0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v10);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v7);
    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_24F06C9E0;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(&v25, &from);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_2;
    v21[3] = &unk_24F06CA08;
    v12 = (id)MEMORY[0x22E2A7CB0](v23);
    v22 = v12;
    objc_msgSend(v7, "setInvalidationHandler:", v21);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_3;
    v19[3] = &unk_24F06CA08;
    v13 = v12;
    v20 = v13;
    objc_msgSend(v7, "setInterruptionHandler:", v19);
    xpcConnectionQueue = self->_xpcConnectionQueue;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_4;
    v16[3] = &unk_24F06AE88;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    dispatch_async(xpcConnectionQueue, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return serviceListener == v6;
}

void __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    objc_msgSend(*((id *)WeakRetained + 1), "removeObject:", v2);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }

}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  NSObject *v4;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  os_log_type_t type;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    objc_msgSend(*(id *)&v3[2]._os_unfair_lock_opaque, "addObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3 + 4);
    objc_msgSend(*(id *)(a1 + 32), "_setQueue:", *(_QWORD *)&v3[8]._os_unfair_lock_opaque);
    objc_msgSend(*(id *)(a1 + 32), "resume");
    if (dword_255924730)
    {
      v13 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v4 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v20 = v5;
      v21 = v5;
      v18 = v5;
      v19 = v5;
      v16 = v5;
      v17 = v5;
      v14 = v5;
      v15 = v5;
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    if (CMContinuityCaptureXPCConnectionHasEntitlement(*(void **)(a1 + 32), (uint64_t)CFSTR("com.apple.continuitycapture.shieldUI")))
    {
      if (dword_255924730)
      {
        v13 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v6 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v20 = v7;
        v21 = v7;
        v18 = v7;
        v19 = v7;
        v16 = v7;
        v17 = v7;
        v14 = v7;
        v15 = v7;
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

      }
      v8 = objc_loadWeakRetained((id *)&v3[10]);
      objc_msgSend(v8, "shieldDidConnect");

    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_76;
    v11[3] = &unk_24F06CA30;
    v11[4] = v3;
    -[os_unfair_lock_s requestContinuityCaptureUIConfiguration:](v3, "requestContinuityCaptureUIConfiguration:", v11, v9, v10);
  }

}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_76(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateClientsWithConfiguration:", a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
