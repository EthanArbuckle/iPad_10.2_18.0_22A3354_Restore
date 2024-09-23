@implementation CXVoicemailObserverXPCClient

+ (id)sharedXPCClientSemaphore
{
  if (sharedXPCClientSemaphore_onceToken != -1)
    dispatch_once(&sharedXPCClientSemaphore_onceToken, &__block_literal_global_8);
  return (id)sharedXPCClientSemaphore_sharedXPCClientSemaphore;
}

void __56__CXVoicemailObserverXPCClient_sharedXPCClientSemaphore__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)sharedXPCClientSemaphore_sharedXPCClientSemaphore;
  sharedXPCClientSemaphore_sharedXPCClientSemaphore = (uint64_t)v0;

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

  if (!sharedXPCClient)
  {
    v4 = objc_msgSend(objc_alloc((Class)a1), "_init");
    v5 = (void *)sharedXPCClient;
    sharedXPCClient = v4;

  }
  ++sharedXPCClientRetainCount;
  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v6);

  return (id)sharedXPCClient;
}

+ (void)releaseSharedXPCClient
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!--sharedXPCClientRetainCount)
  {
    objc_msgSend((id)sharedXPCClient, "_invalidate");
    v4 = (void *)sharedXPCClient;
    sharedXPCClient = 0;

  }
  objc_msgSend(a1, "sharedXPCClientSemaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

}

- (CXVoicemailObserverXPCClient)init
{
  CXVoicemailObserverXPCClient *v3;

  objc_msgSend((id)objc_opt_class(), "sharedXPCClient");
  v3 = (CXVoicemailObserverXPCClient *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_init
{
  CXVoicemailObserverXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  _QWORD block[4];
  CXVoicemailObserverXPCClient *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXVoicemailObserverXPCClient;
  v2 = -[CXVoicemailObserverXPCClient init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.voicemailobserverxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CXVoicemailObserverXPCClient__init__block_invoke;
    block[3] = &unk_1E4B88AE8;
    v8 = v2;
    dispatch_async(v5, block);

  }
  return v2;
}

void __37__CXVoicemailObserverXPCClient__init__block_invoke(uint64_t a1)
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
  v9 = (int *)(v8 + 8);
  v10 = *(NSObject **)(v8 + 16);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __37__CXVoicemailObserverXPCClient__init__block_invoke_2;
  v14 = &unk_1E4B89100;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.callkit.voicemailcontrollerhost.started", v9, v10, &v11);
  objc_msgSend(*(id *)(a1 + 32), "_requestVoicemails", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __37__CXVoicemailObserverXPCClient__init__block_invoke_2(uint64_t a1)
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
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CXVoicemailObserverXPCClient__init__block_invoke_3;
    block[3] = &unk_1E4B88AE8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __37__CXVoicemailObserverXPCClient__init__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "com.apple.callkit.voicemailcontrollerhost.started";
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_requestVoicemails");
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)CXVoicemailObserverXPCClient;
  -[CXVoicemailObserverXPCClient dealloc](&v3, sel_dealloc);
}

- (NSDictionary)voicemailUUIDToVoicemailMap
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CXVoicemailObserverXPCClient mutableVoicemailUUIDToVoicemailMap](self, "mutableVoicemailUUIDToVoicemailMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v5;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CXVoicemailObserverXPCClient delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CXVoicemailObserverXPCClient delegates](self, "delegates");
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
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke;
  v15[3] = &unk_1E4B89080;
  v10 = v6;
  v16 = v10;
  -[CXVoicemailObserverXPCClient _remoteObjectProxyWithErrorHandler:isSynchronous:](self, "_remoteObjectProxyWithErrorHandler:isSynchronous:", v15, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_7;
  v13[3] = &unk_1E4B89080;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "requestTransaction:reply:", v7, v13);

}

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
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

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_7(uint64_t a1, void *a2)
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

  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend((id)objc_opt_class(), "releaseSharedXPCClient");
}

- (void)_addOrUpdateVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    *(_QWORD *)&v8 = 138412290;
    v24 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        -[CXVoicemailObserverXPCClient voicemailUUIDToVoicemailMap](self, "voicemailUUIDToVoicemailMap", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isEqualToVoicemail:", v12) & 1) == 0)
        {
          CXDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v35 = v12;
            _os_log_impl(&dword_1A402D000, v16, OS_LOG_TYPE_DEFAULT, "adding voicemail: %@", buf, 0xCu);
          }

          -[CXVoicemailObserverXPCClient mutableVoicemailUUIDToVoicemailMap](self, "mutableVoicemailUUIDToVoicemailMap");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v18);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CXVoicemailObserverXPCClient delegates](self, "delegates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23++), "dataSourceVoicemailsChanged:", self);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v21);
  }

}

- (void)_removeVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    *(_QWORD *)&v8 = 138412290;
    v24 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        -[CXVoicemailObserverXPCClient voicemailUUIDToVoicemailMap](self, "voicemailUUIDToVoicemailMap", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          CXDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v35 = v12;
            _os_log_impl(&dword_1A402D000, v16, OS_LOG_TYPE_DEFAULT, "removing voicemail: %@", buf, 0xCu);
          }

          -[CXVoicemailObserverXPCClient mutableVoicemailUUIDToVoicemailMap](self, "mutableVoicemailUUIDToVoicemailMap");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v18);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CXVoicemailObserverXPCClient delegates](self, "delegates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v23++), "dataSourceVoicemailsChanged:", self);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v21);
  }

}

- (void)_requestVoicemails
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Requesting voicemails from host", buf, 2u);
  }

  -[CXVoicemailObserverXPCClient _remoteObjectProxyWithErrorHandler:isSynchronous:](self, "_remoteObjectProxyWithErrorHandler:isSynchronous:", &__block_literal_global_8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_9;
  v6[3] = &unk_1E4B88F40;
  v6[4] = self;
  objc_msgSend(v5, "requestVoicemails:", v6);

}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke(uint64_t a1, void *a2)
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
    __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_9(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Received requested voicemails from host: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateVoicemails:", v3);
}

- (void)_invalidate
{
  NSObject *v3;

  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

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
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.voicemailcontrollerhost"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailControllerVendorInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v7);

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailControllerHostInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __42__CXVoicemailObserverXPCClient_connection__block_invoke;
    v13 = &unk_1E4B88CA8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v10);
    -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __42__CXVoicemailObserverXPCClient_connection__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for voicemail observer %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CXVoicemailObserverXPCClient_connection__block_invoke_13;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __42__CXVoicemailObserverXPCClient_connection__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
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
  -[CXVoicemailObserverXPCClient connection](self, "connection");
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

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CXVoicemailObserverXPCClient_addOrUpdateVoicemails___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__CXVoicemailObserverXPCClient_addOrUpdateVoicemails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateVoicemails:", *(_QWORD *)(a1 + 40));
}

- (void)removeVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXVoicemailObserverXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CXVoicemailObserverXPCClient_removeVoicemails___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__CXVoicemailObserverXPCClient_removeVoicemails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVoicemails:", *(_QWORD *)(a1 + 40));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)mutableVoicemailUUIDToVoicemailMap
{
  return self->_mutableVoicemailUUIDToVoicemailMap;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_mutableVoicemailUUIDToVoicemailMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Received error from transaction request: %@", a5, a6, a7, a8, 2u);
}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Error requesting voicemails from host: %@", a5, a6, a7, a8, 2u);
}

@end
