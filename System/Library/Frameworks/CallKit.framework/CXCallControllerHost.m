@implementation CXCallControllerHost

- (CXCallControllerHost)init
{

  return 0;
}

- (CXCallControllerHost)initWithCalls:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v6;
  CXCallControllerHost *v7;

  if (a5)
    v6 = a5;
  else
    v6 = (id)MEMORY[0x1E0C80D38];
  v7 = -[CXCallControllerHost initWithDelegate:delegateQueue:](self, "initWithDelegate:delegateQueue:", a4, v6);

  return v7;
}

- (CXCallControllerHost)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CXCallControllerHost;
  v8 = -[CXCallControllerHost init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v13;

    objc_storeWeak((id *)v8 + 3, v6);
    objc_storeStrong((id *)v8 + 4, a4);
    v15 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.callkit.callcontrollerhost"), "UTF8String"), 0);
    v16 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.callkit.callcontrollerhost"));
    v18 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v17;

    objc_msgSend(*((id *)v8 + 5), "setDelegate:", v8);
    notify_register_dispatch("com.apple.callkit.callcontroller.shouldconnect", (int *)v8 + 2, *((dispatch_queue_t *)v8 + 2), &__block_literal_global_1);
    notify_set_state(*((_DWORD *)v8 + 2), 0);
    objc_msgSend(*((id *)v8 + 5), "resume");
  }

  return (CXCallControllerHost *)v8;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_clientsShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallControllerHost;
  -[CXCallControllerHost dealloc](&v3, sel_dealloc);
}

- (void)addOrUpdateCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CXCallControllerHost_addOrUpdateCall___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__CXCallControllerHost_addOrUpdateCall___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "callUUIDToCallMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 1uLL);
    notify_post("com.apple.callkit.callcontroller.shouldconnect");
  }
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "callUUIDToCallMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "callUUIDToPublicCallUUIDMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callUUIDToPublicCallUUIDMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "connections", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_sanitizedCallFromCall:forCallControllerHostConnection:", *(_QWORD *)(a1 + 40), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v18, "addOrUpdateCall:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)removeCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CXCallControllerHost_removeCall___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__CXCallControllerHost_removeCall___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "callUUIDToCallMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "connections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_sanitizedCallFromCall:forCallControllerHostConnection:", *(_QWORD *)(a1 + 40), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v9, "removeCall:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "callUUIDToCallMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

  objc_msgSend(*(id *)(a1 + 32), "callUUIDToPublicCallUUIDMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v14);

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
  -[CXCallControllerHost queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CXCallControllerHost delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CXCallControllerHost delegateQueue](self, "delegateQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CXCallControllerHost delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, block);

    }
  }

}

- (id)_sanitizedCallFromCall:(id)a3 forCallControllerHostConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CXCall *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  CXCall *v15;
  void *v16;
  void *v17;
  void *v18;
  CXCall *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  -[CXCallControllerHost queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v7, "isPermittedToUsePrivateAPI") & 1) != 0)
  {
    v9 = (CXCall *)v6;
LABEL_6:
    v15 = v9;
    goto LABEL_10;
  }
  objc_msgSend(v6, "providerIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v6, "providerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      objc_msgSend(v6, "sanitizedCopy");
      v9 = (CXCall *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  -[CXCallControllerHost callUUIDToPublicCallUUIDMap](self, "callUUIDToPublicCallUUIDMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [CXCall alloc];
    -[CXCallControllerHost callUUIDToPublicCallUUIDMap](self, "callUUIDToPublicCallUUIDMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CXCall initWithUUID:](v19, "initWithUUID:", v22);

    objc_msgSend(v6, "updateSanitizedCopy:withZone:", v15, 0);
  }
  else
  {
    v15 = 0;
  }
LABEL_10:

  return v15;
}

- (id)_callsForCallControllerHostConnection:(id)a3
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
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXCallControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[CXCallControllerHost callUUIDToCallMap](self, "callUUIDToCallMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CXCallControllerHost callUUIDToCallMap](self, "callUUIDToCallMap", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[CXCallControllerHost _sanitizedCallFromCall:forCallControllerHostConnection:](self, "_sanitizedCallFromCall:forCallControllerHostConnection:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  BOOL v9;
  CXCallControllerHostConnection *v10;
  void *v11;
  CXCallControllerHostConnection *v12;
  NSObject *v13;
  _QWORD v15[5];
  CXCallControllerHostConnection *v16;
  uint8_t v17[4];
  id v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  v20 = 0u;
  if (v5)
    objc_msgSend(v5, "auditToken");
  if (ba_is_process_extension())
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v17 = 138412290;
      v18 = v5;
      v8 = "Process is a background asset extension; rejecting connection %@";
LABEL_11:
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, v8, v17, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend(v5, "cx_isProcessOnDemandInstallCapable"))
    {
      v10 = [CXCallControllerHostConnection alloc];
      -[CXCallControllerHost queue](self, "queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CXCallControllerHostConnection initWithConnection:serialQueue:](v10, "initWithConnection:serialQueue:", v5, v11);

      -[CXCallControllerHostConnection setDelegate:](v12, "setDelegate:", self);
      -[CXCallControllerHost queue](self, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__CXCallControllerHost_listener_shouldAcceptNewConnection___block_invoke;
      v15[3] = &unk_1E4B88A20;
      v15[4] = self;
      v16 = v12;
      v7 = v12;
      dispatch_async(v13, v15);

      v9 = 1;
      goto LABEL_14;
    }
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v17 = 138412290;
      v18 = v5;
      v8 = "Process is an App Clip extension; rejecting connection %@";
      goto LABEL_11;
    }
  }
  v9 = 0;
LABEL_14:

  return v9;
}

void __59__CXCallControllerHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)callControllerHostConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CXCallControllerHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CXCallControllerHost connections](self, "connections");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)callControllerHostConnection:(id)a3 requestCalls:(id)a4
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
  -[CXCallControllerHost queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  CXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "callControllerHostConnection: %@", (uint8_t *)&v11, 0xCu);
  }

  -[CXCallControllerHost _callsForCallControllerHostConnection:](self, "_callsForCallControllerHostConnection:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

- (void)callControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CXCallControllerHost queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  CXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v8;
    v50 = 2112;
    v51 = v9;
    _os_log_impl(&dword_1A402D000, v12, OS_LOG_TYPE_DEFAULT, "callControllerHostConnection: %@ transaction: %@", buf, 0x16u);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v9, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v14)
  {

    goto LABEL_18;
  }
  v15 = v14;
  v38 = v10;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v44 != v18)
        objc_enumerationMutation(v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        objc_opt_class();
        v16 |= objc_opt_isKindOfClass();
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v15);

  if ((v17 & v16 & 1) != 0)
  {
    CXDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v10 = v38;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CXCallControllerHost callControllerHostConnection:requestTransaction:completion:].cold.2((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = 6;
LABEL_21:
    objc_msgSend(v27, "cx_requestTransactionErrorWithCode:", v28);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v36);

    goto LABEL_22;
  }
  v10 = v38;
  if ((v17 & 1) == 0)
  {
    if ((v16 & 1) != 0 && objc_msgSend(v8, "isChannelTransactionRequestPermitted"))
      goto LABEL_28;
LABEL_18:
    CXDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CXCallControllerHost callControllerHostConnection:requestTransaction:completion:].cold.1((uint64_t)v8, v29, v30, v31, v32, v33, v34, v35);

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = 1;
    goto LABEL_21;
  }
  if ((objc_msgSend(v8, "isCallTransactionRequestPermitted") & 1) == 0)
    goto LABEL_18;
LABEL_28:
  if ((objc_msgSend(v8, "isPermittedToUsePrivateAPI") & 1) == 0)
  {
    objc_msgSend(v9, "sanitizedCopy");
    v37 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v37;
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __83__CXCallControllerHost_callControllerHostConnection_requestTransaction_completion___block_invoke;
  v39[3] = &unk_1E4B88C18;
  v39[4] = self;
  v40 = v8;
  v9 = v9;
  v41 = v9;
  v42 = v38;
  -[CXCallControllerHost _performDelegateCallback:](self, "_performDelegateCallback:", v39);

LABEL_22:
}

void __83__CXCallControllerHost_callControllerHostConnection_requestTransaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callControllerHost:clientWithIdentifier:requestedTransaction:completion:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CXCallControllerHostDelegate)delegate
{
  return (CXCallControllerHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NSMutableDictionary)callUUIDToCallMap
{
  return self->_callUUIDToCallMap;
}

- (void)setCallUUIDToCallMap:(id)a3
{
  objc_storeStrong((id *)&self->_callUUIDToCallMap, a3);
}

- (NSMutableDictionary)callUUIDToPublicCallUUIDMap
{
  return self->_callUUIDToPublicCallUUIDMap;
}

- (void)setCallUUIDToPublicCallUUIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_callUUIDToPublicCallUUIDMap, a3);
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_callUUIDToPublicCallUUIDMap, 0);
  objc_storeStrong((id *)&self->_callUUIDToCallMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)callControllerHostConnection:(uint64_t)a3 requestTransaction:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Connection is not permitted to issue transaction requests: %@", a5, a6, a7, a8, 2u);
}

- (void)callControllerHostConnection:(uint64_t)a3 requestTransaction:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Transaction contains call and channel actions; rejecting request by connection %@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
