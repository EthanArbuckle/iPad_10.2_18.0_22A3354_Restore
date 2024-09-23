@implementation FOAuthorizationCenter

+ (FOAuthorizationCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global);
  return (FOAuthorizationCenter *)(id)sharedCenter_sharedCenter;
}

void __37__FOAuthorizationCenter_sharedCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCenter_sharedCenter;
  sharedCenter_sharedCenter = v0;

}

- (FOAuthorizationCenter)init
{
  FOAuthorizationCenter *v2;
  NSXPCConnection *currentConnection;
  uint64_t v4;
  NSObject *connectionLock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FOAuthorizationCenter;
  v2 = -[FOAuthorizationCenter init](&v7, sel_init);
  currentConnection = v2->_currentConnection;
  v2->_currentConnection = 0;

  v4 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v4;

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FOAuthorizationCenter clearCurrentConnectionAndInvalidate:](self, "clearCurrentConnectionAndInvalidate:", 1);
  v3.receiver = self;
  v3.super_class = (Class)FOAuthorizationCenter;
  -[FOAuthorizationCenter dealloc](&v3, sel_dealloc);
}

- (id)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *currentConnection;
  NSXPCConnection **p_currentConnection;
  id v6;
  uint64_t v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    v6 = +[FOAgentConnectionPrivate newConnection](FOAgentConnectionPrivate, "newConnection");
    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__FOAuthorizationCenter_xpcConnection__block_invoke;
    v12[3] = &unk_24D5281B8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v12);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __38__FOAuthorizationCenter_xpcConnection__block_invoke_2;
    v10[3] = &unk_24D5281B8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    objc_storeStrong((id *)p_currentConnection, v6);
    objc_msgSend(v6, "activate");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  v8 = currentConnection;
  objc_sync_exit(v3);

  return v8;
}

void __38__FOAuthorizationCenter_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 1);

}

void __38__FOAuthorizationCenter_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentConnectionAndInvalidate:", 0);

}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  _BOOL4 v3;
  NSXPCConnection *currentConnection;
  NSObject *obj;

  v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_currentConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_currentConnection, "invalidate");
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (id)authorizationsPlist
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  +[FOLocations familyControlsAuthorization](FOLocations, "familyControlsAuthorization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return MEMORY[0x24BDBD1A8];
  v3 = (void *)MEMORY[0x24BDBCF48];
  +[FOLocations familyControlsAuthorization](FOLocations, "familyControlsAuthorization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfURL:error:", v6, &v11);
  v8 = v11;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[FOAuthorizationCenter authorizationsPlist].cold.1();
    v9 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (NSArray)authorizationRecords
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  FOAuthorizationRecord *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  FOAuthorizationRecord *v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FOAuthorizationCenter authorizationsPlist](self, "authorizationsPlist");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v19 = *(_QWORD *)v22;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v7 = [FOAuthorizationRecord alloc];
        objc_msgSend(v6, "valueForKey:", CFSTR("bundleIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", CFSTR("teamIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v6, "valueForKey:", CFSTR("recordIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
        objc_msgSend(v6, "valueForKey:", CFSTR("status"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");
        objc_msgSend(v6, "valueForKey:", CFSTR("type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FOAuthorizationRecord initWithBundleIdentifier:teamIdentifier:recordIdentifier:status:type:](v7, "initWithBundleIdentifier:teamIdentifier:recordIdentifier:status:type:", v8, v9, v12, v14, objc_msgSend(v15, "integerValue"));

        objc_msgSend(v20, "addObject:", v16);
        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return (NSArray *)v20;
}

- (void)requestAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_24D528208;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v8, 1, v11);

}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_24D5281E0;
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "requestAuthorizationWithRecordIdentifier:replyHandler:", v9, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

- (void)requestInternalAuthorizationForMember:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke;
  v9[3] = &unk_24D528258;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v7, 1, v9);

}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2;
    v8[3] = &unk_24D528230;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "requestInternalAuthorizationForMember:replyHandler:", v7, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();

}

- (void)resetAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_24D528208;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v8, 1, v11);

}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_24D5281E0;
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "resetAuthorizationWithRecordIdentifier:replyHandler:", v9, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

- (void)revokeAuthorizationForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_24D528208;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v8, 1, v11);

}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_24D5281E0;
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "revokeAuthorizationWithRecordIdentifier:replyHandler:", v9, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

- (void)revokeAuthorizationForDeletionForRecordIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_24D528208;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v8, 1, v11);

}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_24D5281E0;
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "revokeAuthorizationForDeletionWithRecordIdentifier:replyHandler:", v9, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

- (void)revokeInternalAuthorizationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FOAuthorizationCenter xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D528280;
  v8 = v4;
  v6 = v4;
  +[FOXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](FOXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v5, 1, v7);

}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_24D528230;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "revokeInternalAuthorizationWithReplyHandler:", v7);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();

}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
  objc_storeStrong((id *)&self->_currentConnection, a3);
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
}

- (void)authorizationsPlist
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to read Authorizations.plist: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to create proxy with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __83__FOAuthorizationCenter_requestAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to request authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __81__FOAuthorizationCenter_requestInternalAuthorizationForMember_completionHandler___block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_216338000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to request internal authorization", v0, 2u);
}

void __81__FOAuthorizationCenter_resetAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to reset authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __82__FOAuthorizationCenter_revokeAuthorizationForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to revoke authorization for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __93__FOAuthorizationCenter_revokeAuthorizationForDeletionForRecordIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_216338000, MEMORY[0x24BDACB70], v0, "Failed to revoke authorization for deletion for record identifier: %{public}@ with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __74__FOAuthorizationCenter_revokeInternalAuthorizationWithCompletionHandler___block_invoke_2_cold_1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_216338000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to revoke internal authorization with error: %{public}@", v0, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
