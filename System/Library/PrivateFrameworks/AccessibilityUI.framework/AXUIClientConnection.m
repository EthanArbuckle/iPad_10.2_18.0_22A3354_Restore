@implementation AXUIClientConnection

+ (id)sharedClientConnection
{
  if (sharedClientConnection__AXUIClientSharedConnectionOnceToken != -1)
    dispatch_once(&sharedClientConnection__AXUIClientSharedConnectionOnceToken, &__block_literal_global);
  return (id)sharedClientConnection__AXUIClientSharedConnection;
}

void __46__AXUIClientConnection_sharedClientConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedClientConnection__AXUIClientSharedConnection;
  sharedClientConnection__AXUIClientSharedConnection = v0;

}

- (AXUIClientConnection)init
{
  AXUIClientConnection *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serviceConnectionQueue;
  uint64_t v9;
  NSMutableArray *serviceRequests;
  void *v11;
  dispatch_queue_t p_super;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXUIClientConnection;
  v2 = -[AXUIClientConnection init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", v3, CFSTR("ConnectionAccessQueue"), 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", v3, CFSTR("RegisteredClientsAccessQueue"), 0);
    v2->_serverConnectionLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("accessibilityUIServer.handler", v6);
    serviceConnectionQueue = v2->_serviceConnectionQueue;
    v2->_serviceConnectionQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    serviceRequests = v2->_serviceRequests;
    v2->_serviceRequests = (NSMutableArray *)v9;

    if (v4 && v5)
    {
      -[AXUIClientConnection setConnectionAccessQueue:](v2, "setConnectionAccessQueue:", v4);
      -[AXUIClientConnection setRegisteredClientsAccessQueue:](v2, "setRegisteredClientsAccessQueue:", v5);
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIClientConnection setStateObservers:](v2, "setStateObservers:", v11);

      p_super = dispatch_queue_create("com.apple.AXUIClientConnection.stateObservers", 0);
      -[AXUIClientConnection setStateObserverQueue:](v2, "setStateObserverQueue:", p_super);
    }
    else
    {
      p_super = &v2->super;
      v2 = 0;
    }

  }
  return v2;
}

- (BOOL)isConnected
{
  return self->_connectionState == 2;
}

- (BSServiceConnectionClient)serviceConnection
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (BSServiceConnectionClient *)v2;
}

void __41__AXUIClientConnection_serviceConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[8];
  if (!v3)
  {
    objc_msgSend(v2, "_initializeServiceConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setServiceConnection:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

void __45__AXUIClientConnection_setServiceConnection___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1 != *(void **)(v2 + 64))
  {
    AXLogIPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21416F000, v4, OS_LOG_TYPE_INFO, "Invalidating old connection: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "invalidate");
    v1 = *(void **)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
  }
  objc_storeStrong((id *)(v2 + 64), v1);
}

- (void)_initializeServiceConnection
{
  OUTLINED_FUNCTION_3(&dword_21416F000, a2, a3, "Could not register end point %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  AXLogIPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(MEMORY[0x24BE0FA38], "userInitiated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v11);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_190;
  v17[3] = &unk_24D167420;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  objc_msgSend(v3, "setActivationHandler:", v17);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_193;
  v15[3] = &unk_24D167420;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  objc_msgSend(v3, "setInterruptionHandler:", v15);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_195;
  v13[3] = &unk_24D167420;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "connectionAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2;
  v7[3] = &unk_24D1673F8;
  v7[4] = v4;
  v6 = v3;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v7);

  if (*((_BYTE *)v11 + 24))
    objc_msgSend(v4, "performLaunchAngelQueuedTasks");

  _Block_object_dispose(&v10, 8);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(v2 + 64));
    AXLogIPC();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_21416F000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated to %@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (v5)
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_21416F000, v4, OS_LOG_TYPE_DEFAULT, "Got activation for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  AXLogIPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_cold_1();

}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "connectionAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_194;
  v7[3] = &unk_24D1673F8;
  v7[4] = v4;
  v6 = v3;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v7);

  objc_msgSend(v6, "activate");
  if (*((_BYTE *)v11 + 24))
    objc_msgSend(v4, "performLaunchAngelQueuedTasks");

  _Block_object_dispose(&v10, 8);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_194(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(v2 + 64)))
    {
      objc_msgSend(*v3, "setConnectionState:", 0);
      AXLogIPC();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_21416F000, v4, OS_LOG_TYPE_DEFAULT, "Connection interrupted to %@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_broadcastConnectedStateChange");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      AXLogIPC();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_21416F000, v6, OS_LOG_TYPE_DEFAULT, "Got interruption for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  AXLogIPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_194_cold_1();

}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_195(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXLogIPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_195_cold_1((uint64_t)v3, (uint64_t)WeakRetained, v5);
  }
  else
  {

    if (!WeakRetained)
      goto LABEL_10;
  }
  v6 = objc_msgSend(v3, "isEqual:", WeakRetained[8]);
  AXLogIPC();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_21416F000, v7, OS_LOG_TYPE_DEFAULT, "Connection Invalidated to %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(WeakRetained, "tearDownConnection");
    objc_msgSend(WeakRetained, "performLaunchAngelQueuedTasks");
  }
  else
  {
    if (v8)
    {
      v9 = WeakRetained[8];
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21416F000, v7, OS_LOG_TYPE_DEFAULT, "Got invalidation for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
    }

  }
LABEL_10:

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionClient invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXUIClientConnection;
  -[AXUIClientConnection dealloc](&v3, sel_dealloc);
}

- (void)performLaunchAngelTask:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[AXUIClientConnection connectionAccessQueue](self, "connectionAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__AXUIClientConnection_performLaunchAngelTask___block_invoke;
  v8[3] = &unk_24D167470;
  v8[4] = self;
  v10 = &v11;
  v6 = (void (**)(_QWORD))v4;
  v9 = v6;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v8);

  if (v12[5])
  {
    v6[2](v6);
    AXLogIPC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXUIClientConnection performLaunchAngelTask:].cold.1();

  }
  _Block_object_dispose(&v11, 8);

}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  AXLogIPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_4(a1);

  v3 = (id *)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 32), "connectionState");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = objc_msgSend(v5, "connectionState");
    v7 = *v3;
    if (v6 == 2)
    {
      objc_msgSend(v7, "serviceConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteTarget");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      AXLogIPC();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_2();
    }
    else
    {
      objc_msgSend(v7, "serviceRequests");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v20 = (_QWORD *)(a1 + 40);
      v22 = (void *)MEMORY[0x2199C9F8C](v21);
      objc_msgSend(v19, "axSafelyAddObject:", v22);

      AXLogIPC();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_3(v20, v3, v12);
    }
  }
  else
  {
    objc_msgSend(v5, "serviceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteTargetWithLaunchingAssertionAttributes:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 1);
    AXLogIPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_1();
  }

}

- (void)performLaunchAngelQueuedTasks
{
  OUTLINED_FUNCTION_9(&dword_21416F000, a2, a3, "performLaunchAngelQueuedTasks: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __53__AXUIClientConnection_performLaunchAngelQueuedTasks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "serviceRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "serviceRequests");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setXpc_handler:", v6);

  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProcessHandle:", v9);

  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceConnection:", v10);

  -[AXUIClientConnection _processXPCReply:context:](self, "_processXPCReply:context:", v7, v11);
}

- (void)tearDownConnection
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  AXLogAssertions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21416F000, v3, OS_LOG_TYPE_DEFAULT, "ClientConnection teared down xpc connection", buf, 2u);
  }

  -[AXUIClientConnection connectionAccessQueue](self, "connectionAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__AXUIClientConnection_tearDownConnection__block_invoke;
  v5[3] = &unk_24D167388;
  v5[4] = self;
  objc_msgSend(v4, "performSynchronousWritingBlock:", v5);

}

uint64_t __42__AXUIClientConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogIPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__AXUIClientConnection_tearDownConnection__block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "setServiceConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_broadcastConnectedStateChange");
}

- (void)_processXPCReply:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  const char *string;
  void *v15;
  void *v16;
  void *v17;
  uint64_t uint64;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id *v45;
  void *v46;
  int v47;
  void (**v48)(void);
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[10];
  _QWORD v53[9];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x2199CA0AC](v6);
  if (v8 != MEMORY[0x24BDACFA0])
  {
    if (v8 == MEMORY[0x24BDACFB8])
    {
      if (v6 == (id)MEMORY[0x24BDACF38])
      {
        AXLogUI();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[AXUIClientConnection _processXPCReply:context:].cold.1(v22, v30, v31, v32, v33, v34, v35, v36);
      }
      else
      {
        v20 = v6 == (id)MEMORY[0x24BDACF30];
        AXLogUI();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v39 = *MEMORY[0x24BDFF968];
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v39;
            _os_log_impl(&dword_21416F000, v22, OS_LOG_TYPE_INFO, "Connection to %{public}@ was interrupted.", (uint8_t *)&buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[AXUIClientConnection _processXPCReply:context:].cold.2(v6, v22);
        }
      }

      objc_initWeak((id *)&buf, self);
      -[AXUIClientConnection connectionAccessQueue](self, "connectionAccessQueue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_230;
      v50[3] = &unk_24D167510;
      objc_copyWeak(&v51, (id *)&buf);
      objc_msgSend(v40, "performSynchronousWritingBlock:", v50);

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      if (v6)
        v9 = (void *)MEMORY[0x2199CA058](v6);
      else
        v9 = 0;
      AXLogUI();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AXUIClientConnection _processXPCReply:context:].cold.3((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);

      if (v9)
        free(v9);
    }
    goto LABEL_58;
  }
  v10 = v6;
  v11 = MEMORY[0x24BDAC760];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke;
  v55[3] = &unk_24D167498;
  v56 = v7;
  v12 = v10;
  v57 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C9F8C](v55);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  string = xpc_dictionary_get_string(v12, (const char *)*MEMORY[0x24BDFF970]);
  if (!string || (v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string)) == 0)
  {
    if (v12)
      v15 = (void *)MEMORY[0x2199CA058](v12);
    else
      v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF910], CFSTR("Couldn't find client identifier in incoming message: %s."), v15);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v37;

    if (v15)
    {
      free(v15);
      v15 = 0;
    }
    goto LABEL_55;
  }
  v16 = (void *)MEMORY[0x2199C9E48]();
  -[AXUIClientConnection _clientWithIdentifier:](self, "_clientWithIdentifier:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v16);
  if (v17)
  {
    uint64 = xpc_dictionary_get_uint64(v12, (const char *)*MEMORY[0x24BDFF980]);
    if (uint64)
    {
      objc_msgSend(v17, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v19, "userInterfaceClient:messageFromServerForWithIdentifierShouldBeProcessedAsynchronously:", v17, uint64) & 1) != 0)
      {
        v47 = 1;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF910], CFSTR("Delegate of client %@ cannot process any messages: %@"), v17, v19);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v42;
LABEL_53:

          goto LABEL_54;
        }
        v47 = 0;
      }
      if (xpc_dictionary_get_BOOL(v12, (const char *)*MEMORY[0x24BDFF988]))
      {
        v49 = 0;
      }
      else
      {
        v44 = *((_QWORD *)&buf + 1);
        v54 = *(id *)(*((_QWORD *)&buf + 1) + 40);
        objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v12, &v54);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v44 + 40), v54);
      }
      if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        if (v47)
        {
          v53[0] = v11;
          v53[1] = 3221225472;
          v53[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_2;
          v53[3] = &unk_24D1674C0;
          v53[4] = v19;
          v53[5] = v17;
          v53[6] = v49;
          v53[8] = uint64;
          v45 = (id *)v53;
        }
        else
        {
          v52[0] = v11;
          v52[1] = 3221225472;
          v52[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_3;
          v52[3] = &unk_24D1674E8;
          v52[4] = v19;
          v52[5] = v17;
          v52[6] = v49;
          v52[8] = &buf;
          v52[9] = uint64;
          v45 = (id *)v52;
        }
        v45[7] = v13;
        v48 = (void (**)(void))MEMORY[0x2199C9F8C](v45);

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v19, "userInterfaceClient:accessQueueForProcessingMessageWithIdentifier:", v17, uint64),
              (v46 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend(v19, "userInterfaceClient:messageWithIdentifierRequiresWritingBlock:", v17, uint64))
          {
            objc_msgSend(v46, "performAsynchronousReadingBlock:", v48);
          }
          else
          {
            objc_msgSend(v46, "performAsynchronousWritingBlock:", v48);
          }
        }
        else
        {
          v48[2]();
          v46 = 0;
        }

      }
      v43 = v49;
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF910], CFSTR("AXUIClientConnection: Got invalid value for message identifier in client connection event handler: 0."));
    v41 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF910], CFSTR("Couldn't find client for identifier: %@."), v15);
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v41;
LABEL_54:

LABEL_55:
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    v13[2](v13, 0);

  _Block_object_dispose(&buf, 8);
LABEL_58:

}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDFF948], "sendReply:withError:andOriginalXPCMessage:usingConnection:customDataAddingBlock:", v11, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (v11)
    {
      v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();

    }
    objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v10)[2](v10, v7, v5);

    }
  }

}

uint64_t __49__AXUIClientConnection__processXPCReply_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userInterfaceClient:processMessageFromServerAsynchronously:withIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "userInterfaceClient:processMessageFromServer:withIdentifier:error:", v3, v4, v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke_230(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionState:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_broadcastConnectedStateChange");

}

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogAssertions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_21416F000, v8, OS_LOG_TYPE_DEFAULT, "ClientConnection registered client %@", buf, 0xCu);
  }

  -[AXUIClientConnection registeredClientsAccessQueue](self, "registeredClientsAccessQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__AXUIClientConnection_registerClient_withIdentifier___block_invoke;
  v12[3] = &unk_24D167538;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performSynchronousWritingBlock:", v12);

}

void __54__AXUIClientConnection_registerClient_withIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "registeredClients");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredClients:");
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));

}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AXLogAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21416F000, v6, OS_LOG_TYPE_DEFAULT, "ClientConnection unregistered client %@", buf, 0xCu);
  }

  -[AXUIClientConnection registeredClientsAccessQueue](self, "registeredClientsAccessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__AXUIClientConnection_unregisterClient_withIdentifier___block_invoke;
  v9[3] = &unk_24D167338;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "performSynchronousWritingBlock:", v9);

}

void __56__AXUIClientConnection_unregisterClient_withIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredClients:", 0);

}

- (id)_clientWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[AXUIClientConnection registeredClientsAccessQueue](self, "registeredClientsAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__AXUIClientConnection__clientWithIdentifier___block_invoke;
  v9[3] = &unk_24D167560;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__AXUIClientConnection__clientWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "registeredClients");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonretainedObjectValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_broadcastConnectedStateChange
{
  NSObject *v3;
  _QWORD block[5];

  -[AXUIClientConnection stateObserverQueue](self, "stateObserverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__AXUIClientConnection__broadcastConnectedStateChange__block_invoke;
  block[3] = &unk_24D167388;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __54__AXUIClientConnection__broadcastConnectedStateChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stateObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "clientConnection:didChangeConnectedState:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isConnected"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)registerConnectionStateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AXUIClientConnection stateObserverQueue](self, "stateObserverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__AXUIClientConnection_registerConnectionStateObserver___block_invoke;
  block[3] = &unk_24D167338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __56__AXUIClientConnection_registerConnectionStateObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unregisterConnectionStateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AXUIClientConnection stateObserverQueue](self, "stateObserverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AXUIClientConnection_unregisterConnectionStateObserver___block_invoke;
  block[3] = &unk_24D167338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __58__AXUIClientConnection_unregisterConnectionStateObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)cleanUp
{
  void *v3;
  NSObject *v4;
  int v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[AXUIClientConnection registeredClientsAccessQueue](self, "registeredClientsAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__AXUIClientConnection_cleanUp__block_invoke;
  v6[3] = &unk_24D167360;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSynchronousReadingBlock:", v6);

  AXLogAssertions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((unsigned __int8 *)v8 + 24);
    *(_DWORD *)buf = 67109120;
    v12 = v5;
    _os_log_impl(&dword_21416F000, v4, OS_LOG_TYPE_DEFAULT, "ClientConnection cleanup, no clients: %d", buf, 8u);
  }

  if (*((_BYTE *)v8 + 24))
    -[AXUIClientConnection tearDownConnection](self, "tearDownConnection");
  _Block_object_dispose(&v7, 8);
}

void __31__AXUIClientConnection_cleanUp__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registeredClients");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") == 0;

}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (AXAccessQueue)connectionAccessQueue
{
  return self->_connectionAccessQueue;
}

- (void)setConnectionAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAccessQueue, a3);
}

- (NSMutableDictionary)registeredClients
{
  return self->_registeredClients;
}

- (void)setRegisteredClients:(id)a3
{
  objc_storeStrong((id *)&self->_registeredClients, a3);
}

- (AXAccessQueue)registeredClientsAccessQueue
{
  return self->_registeredClientsAccessQueue;
}

- (void)setRegisteredClientsAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_registeredClientsAccessQueue, a3);
}

- (NSHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_stateObservers, a3);
}

- (OS_dispatch_queue)stateObserverQueue
{
  return self->_stateObserverQueue;
}

- (void)setStateObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateObserverQueue, a3);
}

- (OS_dispatch_queue)serviceConnectionQueue
{
  return self->_serviceConnectionQueue;
}

- (void)setServiceConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnectionQueue, a3);
}

- (NSMutableArray)serviceRequests
{
  return self->_serviceRequests;
}

- (void)setServiceRequests:(id)a3
{
  objc_storeStrong((id *)&self->_serviceRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRequests, 0);
  objc_storeStrong((id *)&self->_serviceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_stateObserverQueue, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_registeredClientsAccessQueue, 0);
  objc_storeStrong((id *)&self->_registeredClients, 0);
  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_21416F000, a2, a3, "Configure connection %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_cold_1()
{
  void *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7();
  v0 = (void *)MEMORY[0x24BDD16E0];
  OUTLINED_FUNCTION_12(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_15(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21416F000, v2, v3, "Connection Activated connectionState: %@\nconnection: %@\nself.connection: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_194_cold_1()
{
  void *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7();
  v0 = (void *)MEMORY[0x24BDD16E0];
  OUTLINED_FUNCTION_12(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_15(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_21416F000, v2, v3, "Connection Interrupted connectionState: %@\nconnection: %@\nself.connection: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_195_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_21416F000, v4, OS_LOG_TYPE_DEBUG, "Connection Invalidated\nconnection: %@\nself.connection: %@", v5, 0x16u);

  OUTLINED_FUNCTION_14();
}

- (void)performLaunchAngelTask:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)MEMORY[0x2199C9F8C]();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_21416F000, v1, v2, "Executed block: %@ on target: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_1()
{
  id *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_15(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "serviceConnection");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21416F000, v3, v4, "Requested remote target with assertion, connectionState: %@ connection: %@, target: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_2()
{
  id *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_15(), "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "serviceConnection");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21416F000, v3, v4, "Requested remote target, connectionState: %@ connection: %@, target: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_3(_QWORD *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x2199C9F8C](*a1);
  objc_msgSend(*a2, "serviceRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*a2, "connectionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  _os_log_debug_impl(&dword_21416F000, a3, OS_LOG_TYPE_DEBUG, "Added block: %@ to queue: %@, connectionState: %@ connection: %@", (uint8_t *)&v9, 0x2Au);

}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_21416F000, v4, v5, "performLaunchAngelTask connectionState: %@ connection: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __42__AXUIClientConnection_tearDownConnection__block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_21416F000, v4, v5, "tearDownConnection, connectionState: %@ connection: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_processXPCReply:(uint64_t)a3 context:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21416F000, a1, a3, "Connection to %{public}@ went invalid.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_processXPCReply:(void *)a1 context:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  const char *string;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDFF968];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v5 = 138543618;
  v6 = v3;
  v7 = 2082;
  v8 = string;
  _os_log_error_impl(&dword_21416F000, a2, OS_LOG_TYPE_ERROR, "Unexpected error connecting to %{public}@: %{public}s", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_14();
}

- (void)_processXPCReply:(uint64_t)a3 context:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21416F000, a2, a3, "Got object of unexpected type in client connection event handler: %{public}s.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
