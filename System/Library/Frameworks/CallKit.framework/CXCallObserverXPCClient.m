@implementation CXCallObserverXPCClient

void __51__CXCallObserverXPCClient_sharedXPCClientSemaphore__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)sharedXPCClientSemaphore_sharedXPCClientSemaphore_0;
  sharedXPCClientSemaphore_sharedXPCClientSemaphore_0 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_mutableCallUUIDToCallMap, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[CXCallObserverXPCClient delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (NSHashTable)delegates
{
  return self->_delegates;
}

void __32__CXCallObserverXPCClient__init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = (int *)(v8 + 12);
  v10 = *(NSObject **)(v8 + 16);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __32__CXCallObserverXPCClient__init__block_invoke_2;
  v14 = &unk_1E4B89100;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.callkit.callcontroller.shouldconnect", v9, v10, &v11);
  objc_msgSend(*(id *)(a1 + 32), "_requestCalls", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_requestCalls
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD v7[5];
  uint8_t buf[16];

  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v3);

  v4 = -[CXCallObserverXPCClient clientsShouldConnect](self, "clientsShouldConnect");
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Requesting calls from host", buf, 2u);
    }

    -[CXCallObserverXPCClient _remoteObjectProxyWithErrorHandler:isSynchronous:](self, "_remoteObjectProxyWithErrorHandler:isSynchronous:", &__block_literal_global_8_0, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__CXCallObserverXPCClient__requestCalls__block_invoke_9;
    v7[3] = &unk_1E4B88F40;
    v7[4] = self;
    -[NSObject requestCalls:](v5, "requestCalls:", v7);
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Call host has no calls", buf, 2u);
  }

}

- (BOOL)clientsShouldConnect
{
  _BOOL4 v2;
  uint32_t state;
  uint32_t v5;
  NSObject *v6;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_clientsShouldConnect)
  {
    return 1;
  }
  else
  {
    state64 = 0;
    state = notify_get_state(-[CXCallObserverXPCClient clientsShouldConnectToken](self, "clientsShouldConnectToken"), &state64);
    if (state)
    {
      v5 = state;
      CXDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v5;
        _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Bad status received attempting to get host call state: %d", buf, 8u);
      }

      return self->_clientsShouldConnect;
    }
    else
    {
      v2 = state64 != 0;
      self->_clientsShouldConnect = v2;
    }
  }
  return v2;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (CXCallObserverXPCClient)init
{
  CXCallObserverXPCClient *v3;

  objc_msgSend((id)objc_opt_class(), "sharedXPCClient");
  v3 = (CXCallObserverXPCClient *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  notify_cancel(self->_clientsShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallObserverXPCClient;
  -[CXCallObserverXPCClient dealloc](&v3, sel_dealloc);
}

+ (id)sharedXPCClient
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!sharedXPCClient_0)
  {
    v4 = objc_msgSend(objc_alloc((Class)a1), "_init");
    v5 = (void *)sharedXPCClient_0;
    sharedXPCClient_0 = v4;

  }
  ++sharedXPCClientRetainCount_0;
  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  return (id)sharedXPCClient_0;
}

+ (id)sharedXPCClientSemaphore
{
  if (sharedXPCClientSemaphore_onceToken_0 != -1)
    dispatch_once(&sharedXPCClientSemaphore_onceToken_0, &__block_literal_global_10);
  return (id)sharedXPCClientSemaphore_sharedXPCClientSemaphore_0;
}

- (id)_init
{
  CXCallObserverXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *concurrentQueue;
  NSObject *v5;
  _QWORD block[4];
  CXCallObserverXPCClient *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXCallObserverXPCClient;
  v2 = -[CXCallObserverXPCClient init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.callobserverxpcclient", MEMORY[0x1E0C80D50]);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_concurrentQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__CXCallObserverXPCClient__init__block_invoke;
    block[3] = &unk_1E4B88AE8;
    v8 = v2;
    dispatch_barrier_async(v5, block);

  }
  return v2;
}

- (NSDictionary)callUUIDToCallMap
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CXCallObserverXPCClient mutableCallUUIDToCallMap](self, "mutableCallUUIDToCallMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v5;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (NSMutableDictionary)mutableCallUUIDToCallMap
{
  return self->_mutableCallUUIDToCallMap;
}

+ (void)releaseSharedXPCClient
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!--sharedXPCClientRetainCount_0)
  {
    objc_msgSend((id)sharedXPCClient_0, "_invalidate");
    v4 = (void *)sharedXPCClient_0;
    sharedXPCClient_0 = 0;

  }
  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

}

void __32__CXCallObserverXPCClient__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "concurrentQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__CXCallObserverXPCClient__init__block_invoke_3;
    block[3] = &unk_1E4B88AE8;
    v5 = v2;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __32__CXCallObserverXPCClient__init__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 40))
  {
    v1 = result;
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "com.apple.callkit.callcontroller.shouldconnect";
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(*(id *)(v1 + 32), "setClientsShouldConnect:", 1);
    return objc_msgSend(*(id *)(v1 + 32), "_requestCalls");
  }
  return result;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[CXCallObserverXPCClient delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v8);

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke;
  v15[3] = &unk_1E4B89080;
  v10 = v6;
  v16 = v10;
  -[CXCallObserverXPCClient _remoteObjectProxyWithErrorHandler:isSynchronous:](self, "_remoteObjectProxyWithErrorHandler:isSynchronous:", v15, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke_7;
  v13[3] = &unk_1E4B89080;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestTransaction:reply:", v7, v13);

}

void __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Received reply from transaction request with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *v2;

  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v2);

  objc_msgSend((id)objc_opt_class(), "releaseSharedXPCClient");
}

- (void)_markAllCallsAsEnded
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v3);

  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[CXCallObserverXPCClient callUUIDToCallMap](self, "callUUIDToCallMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "self.callUUIDToCallMap: %@", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CXCallObserverXPCClient callUUIDToCallMap](self, "callUUIDToCallMap", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setHasEnded:", 1);
        -[CXCallObserverXPCClient _removeCall:](self, "_removeCall:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_addOrUpdateCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[CXCallObserverXPCClient callUUIDToCallMap](self, "callUUIDToCallMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToCall:", v4) & 1) == 0)
  {
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "call: %@", buf, 0xCu);
    }

    -[CXCallObserverXPCClient mutableCallUUIDToCallMap](self, "mutableCallUUIDToCallMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v11);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CXCallObserverXPCClient delegates](self, "delegates", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "dataSource:callChanged:", self, v4);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)_removeCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[CXCallObserverXPCClient callUUIDToCallMap](self, "callUUIDToCallMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    CXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "call: %@", buf, 0xCu);
    }

    -[CXCallObserverXPCClient mutableCallUUIDToCallMap](self, "mutableCallUUIDToCallMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CXCallObserverXPCClient delegates](self, "delegates", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "dataSource:callChanged:", self, v4);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__CXCallObserverXPCClient__requestCalls__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Received requested calls from host: %@", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateCall:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_invalidate
{
  NSObject *v3;

  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v3);

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (NSXPCConnection)connection
{
  NSObject *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v3);

  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.callcontrollerhost"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callControllerVendorInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v7);

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callControllerHostInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__CXCallObserverXPCClient_connection__block_invoke;
    v13[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __37__CXCallObserverXPCClient_connection__block_invoke_2;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __37__CXCallObserverXPCClient_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call observer %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "concurrentQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CXCallObserverXPCClient_connection__block_invoke_13;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __37__CXCallObserverXPCClient_connection__block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setClientsShouldConnect:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_markAllCallsAsEnded");
}

void __37__CXCallObserverXPCClient_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for call observer %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "concurrentQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CXCallObserverXPCClient_connection__block_invoke_14;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __37__CXCallObserverXPCClient_connection__block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setClientsShouldConnect:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_markAllCallsAsEnded");
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 isSynchronous:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[CXCallObserverXPCClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (v4)
      objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
    else
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "remoteObjectProxy");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)addOrUpdateCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CXCallObserverXPCClient_addOrUpdateCall___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

uint64_t __43__CXCallObserverXPCClient_addOrUpdateCall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateCall:", *(_QWORD *)(a1 + 40));
}

- (void)removeCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallObserverXPCClient concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CXCallObserverXPCClient_removeCall___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

uint64_t __38__CXCallObserverXPCClient_removeCall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeCall:", *(_QWORD *)(a1 + 40));
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_clientsShouldConnectToken = a3;
}

- (void)setClientsShouldConnect:(BOOL)a3
{
  self->_clientsShouldConnect = a3;
}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Error requesting calls from host: %@", a5, a6, a7, a8, 2u);
}

@end
