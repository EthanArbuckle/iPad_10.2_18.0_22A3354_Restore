@implementation CXVoicemailControllerHost

- (CXVoicemailControllerHost)init
{

  return 0;
}

- (CXVoicemailControllerHost)initWithVoicemails:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  CXVoicemailControllerHost *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  _QWORD block[4];
  CXVoicemailControllerHost *v15;
  id v16;
  id v17;
  objc_super v18;

  v7 = a4;
  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CXVoicemailControllerHost;
  v9 = -[CXVoicemailControllerHost init](&v18, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.callkit.voicemailcontrollerhost"), "UTF8String"), 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = v9->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__CXVoicemailControllerHost_initWithVoicemails_delegate_queue___block_invoke;
    block[3] = &unk_1E4B88AC0;
    v15 = v9;
    v16 = v7;
    v17 = v8;
    dispatch_async(v12, block);

  }
  return v9;
}

uint64_t __63__CXVoicemailControllerHost_initWithVoicemails_delegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int out_token;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.callkit.voicemailcontrollerhost"));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
  out_token = 0;
  notify_register_check("com.apple.callkit.voicemailcontrollerhost.started", &out_token);
  notify_set_state(out_token, 1uLL);
  return notify_post("com.apple.callkit.voicemailcontrollerhost.started");
}

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXVoicemailControllerHost *v9;

  v4 = a3;
  -[CXVoicemailControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CXVoicemailControllerHost_addOrUpdateVoicemails___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__CXVoicemailControllerHost_addOrUpdateVoicemails___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "voicemailUUIDToVoicemailMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "connections", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "addOrUpdateVoicemails:", *(_QWORD *)(a1 + 32));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)removeVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CXVoicemailControllerHost *v9;

  v4 = a3;
  -[CXVoicemailControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CXVoicemailControllerHost_removeVoicemails___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__CXVoicemailControllerHost_removeVoicemails___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "voicemailUUIDToVoicemailMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "connections", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "removeVoicemails:", *(_QWORD *)(a1 + 32));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_performDelegateCallback:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_block_t block;

  block = a3;
  -[CXVoicemailControllerHost queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CXVoicemailControllerHost delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CXVoicemailControllerHost delegateQueue](self, "delegateQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CXVoicemailControllerHost delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, block);

    }
  }

}

- (id)_voicemailsForVoicemailControllerHostConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXVoicemailControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[CXVoicemailControllerHost voicemailUUIDToVoicemailMap](self, "voicemailUUIDToVoicemailMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CXVoicemailControllerHost voicemailUUIDToVoicemailMap](self, "voicemailUUIDToVoicemailMap", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if (objc_msgSend(v4, "isPermittedToUsePrivateAPI"))
        {
          v16 = v15;
        }
        else
        {
          objc_msgSend(v15, "sanitizedCopy");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;
        objc_msgSend(v8, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  return v18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CXVoicemailControllerHostConnection *v9;
  void *v10;
  CXVoicemailControllerHostConnection *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[5];
  CXVoicemailControllerHostConnection *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "listener: %@ newConnection: %@", buf, 0x16u);
  }

  v9 = [CXVoicemailControllerHostConnection alloc];
  -[CXVoicemailControllerHost queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CXVoicemailControllerHostConnection initWithConnection:serialQueue:](v9, "initWithConnection:serialQueue:", v7, v10);

  if (v11)
  {
    -[CXVoicemailControllerHostConnection setDelegate:](v11, "setDelegate:", self);
    -[CXVoicemailControllerHost queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__CXVoicemailControllerHost_listener_shouldAcceptNewConnection___block_invoke;
    v15[3] = &unk_1E4B88A20;
    v15[4] = self;
    v16 = v11;
    dispatch_async(v12, v15);

  }
  else
  {
    CXDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1A402D000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not accepting connection %@ because a CXXPCVoicemailSource couldn't be created", buf, 0xCu);
    }

  }
  return v11 != 0;
}

void __64__CXVoicemailControllerHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)voicemailControllerHostConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXVoicemailControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CXVoicemailControllerHost connections](self, "connections");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)voicemailControllerHostConnection:(id)a3 requestVoicemails:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[CXVoicemailControllerHost queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  CXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "voicemailControllerHostConnection: %@", (uint8_t *)&v11, 0xCu);
  }

  -[CXVoicemailControllerHost _voicemailsForVoicemailControllerHostConnection:](self, "_voicemailsForVoicemailControllerHostConnection:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

- (void)voicemailControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CXVoicemailControllerHost queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  CXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1A402D000, v12, OS_LOG_TYPE_DEFAULT, "voicemailControllerHostConnection: %@ transaction: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__CXVoicemailControllerHost_voicemailControllerHostConnection_requestTransaction_completion___block_invoke;
  v16[3] = &unk_1E4B88C18;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[CXVoicemailControllerHost _performDelegateCallback:](self, "_performDelegateCallback:", v16);

}

void __93__CXVoicemailControllerHost_voicemailControllerHostConnection_requestTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voicemailControllerHost:clientWithIdentifier:requestedTransaction:completion:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CXVoicemailControllerHostDelegate)delegate
{
  return (CXVoicemailControllerHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (NSMutableDictionary)voicemailUUIDToVoicemailMap
{
  return self->_voicemailUUIDToVoicemailMap;
}

- (void)setVoicemailUUIDToVoicemailMap:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailUUIDToVoicemailMap, a3);
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_voicemailUUIDToVoicemailMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
