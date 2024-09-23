@implementation LAClient

void __18__LAClient__queue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0D443B8];
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "createDefaultQueueWithIdentifier:concurrencyAttribute:", CFSTR("la_client"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_queue_queue;
  _queue_queue = v1;

}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3;
  v9[3] = &unk_1E7079F90;
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v13 = v6;
  v8 = *(unsigned __int8 *)(a1 + 72);
  v9[1] = 3221225472;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "_checkIdResultForTCC:synchronous:error:retryBlock:finally:", a2, v8, a3, v9, *(_QWORD *)(a1 + 56));

}

- (LAClient)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4 context:(id)a5
{
  id v9;
  id v10;
  LAClient *v11;
  LAClient *v12;
  id v13;
  uint64_t v14;
  LACachedExternalizedContext *cachedExternalizedContext;
  uint64_t v16;
  NSMutableArray *invalidations;
  uint64_t v18;
  NSNumber *userSession;
  _QWORD v21[4];
  id v22;
  LAClient *v23;
  objc_super v24;

  v9 = a3;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)LAClient;
  v11 = -[LAClient init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_existingContext, a3);
    objc_storeWeak((id *)&v12->_context, v10);
    v13 = objc_alloc(MEMORY[0x1E0CC1308]);
    if (v9)
      v14 = objc_msgSend(v13, "initWithExternalizedContext:", v9);
    else
      v14 = objc_msgSend(v13, "initWithExternalizationDelegate:", v12);
    cachedExternalizedContext = v12->_cachedExternalizedContext;
    v12->_cachedExternalizedContext = (LACachedExternalizedContext *)v14;

    v16 = objc_opt_new();
    invalidations = v12->_invalidations;
    v12->_invalidations = (NSMutableArray *)v16;

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
      v18 = objc_claimAutoreleasedReturnValue();
      userSession = v12->_userSession;
      v12->_userSession = (NSNumber *)v18;

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke;
    v21[3] = &unk_1E7079C20;
    v22 = v9;
    v23 = v12;
    -[LAClient _synchronousRemoteObjectProxy:performCall:](v23, "_synchronousRemoteObjectProxy:performCall:", a4, v21);

  }
  return v12;
}

- (void)_synchronousRemoteObjectProxy:(const unsigned int *)a3 performCall:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSInteger v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSInteger v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v6 = (void (**)(id, void *))a4;
  -[LAClient setWillRetryOnInterruptedConnection:](self, "setWillRetryOnInterruptedConnection:", 1);
  -[LAClient _connectToServerWithRecovery:userSession:legacyService:](self, "_connectToServerWithRecovery:userSession:legacyService:", 1, a3, 0);
  -[LAClient serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke;
  v29[3] = &unk_1E7079D10;
  v29[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
  -[NSError domain](self->_permanentError, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB28A8];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v12 = -[NSError code](self->_permanentError, "code");

    if (v12 == 4097)
    {
      LALogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[LAClient _synchronousRemoteObjectProxy:performCall:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      -[LAClient _connectToServerWithRecovery:userSession:legacyService:](self, "_connectToServerWithRecovery:userSession:legacyService:", 1, a3, 0);
      -[LAClient serverConnection](self, "serverConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_92;
      v28[3] = &unk_1E7079D10;
      v28[4] = self;
      objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v6[2](v6, v22);
    }
  }
  else
  {

  }
  -[LAClient setWillRetryOnInterruptedConnection:](self, "setWillRetryOnInterruptedConnection:", 0);
  -[NSError domain](self->_permanentError, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isEqualToString:", v11))
  {
    v24 = -[NSError code](self->_permanentError, "code");

    if (v24 == 4099)
    {
      -[LAClient _connectToServerWithRecovery:userSession:legacyService:](self, "_connectToServerWithRecovery:userSession:legacyService:", 1, a3, 1);
      -[LAClient serverConnection](self, "serverConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2;
      v27[3] = &unk_1E7079D10;
      v27[4] = self;
      objc_msgSend(v25, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
      v26 = objc_claimAutoreleasedReturnValue();

      v6[2](v6, (void *)v26);
      v9 = (void *)v26;
    }
  }
  else
  {

  }
}

void __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "instanceId");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2;
  v8[3] = &unk_1E7079BF8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "connectToExistingContext:callback:clientId:reply:", v3, v4, v7, v8);

}

- (void)_handleConnectionResult:(id)a3 uuid:(id)a4 proxyId:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    LALogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LAClient _handleConnectionResult:uuid:proxyId:error:].cold.1(self);

    -[LAClient _invalidateCachedExternalizedContextWithError:](self, "_invalidateCachedExternalizedContextWithError:", v13);
  }
  -[LAClient setRemoteContext:](self, "setRemoteContext:", v10);
  -[LAClient setUuid:](self, "setUuid:", v11);
  -[LAClient setProxyId:](self, "setProxyId:", v12);
  -[LAClient setPermanentError:](self, "setPermanentError:", v13);

}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setRemoteContext:(id)a3
{
  id v5;
  void *v6;
  LAContextXPC *v7;
  LAContextXPC *synchronousRemoteContext;
  LAContextXPC *v9;
  _QWORD v10[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_remoteContext, a3);
  if (v5)
  {
    -[LAClient remoteContext](self, "remoteContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__LAClient_setRemoteContext___block_invoke;
    v10[3] = &unk_1E7079D10;
    v10[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v7 = (LAContextXPC *)objc_claimAutoreleasedReturnValue();
    synchronousRemoteContext = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = v7;

  }
  else
  {
    v9 = self->_synchronousRemoteContext;
    self->_synchronousRemoteContext = 0;

  }
}

- (void)setProxyId:(id)a3
{
  objc_storeStrong((id *)&self->_proxyId, a3);
}

- (void)setPermanentError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (LAContextXPC)remoteContext
{
  return self->_remoteContext;
}

- (void)_connectToServerWithRecovery:(BOOL)a3 userSession:(const unsigned int *)a4 legacyService:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  NSXPCConnection *v10;
  NSXPCConnection *serverConnection;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  LAClient *v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAClient createConnection:legacyService:](LAClient, "createConnection:legacyService:", a4, v5);
  v10 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  serverConnection = self->_serverConnection;
  self->_serverConnection = v10;

  objc_msgSend(MEMORY[0x1E0CC1320], "interfaceWithInternalProtocol:", &unk_1EF237248);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAClient serverConnection](self, "serverConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRemoteObjectInterface:", v12);

  -[LAClient serverConnection](self, "serverConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAClient _queue](LAClient, "_queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setQueue:", v15);

  if (a4 && *a4)
  {
    -[NSXPCConnection _setTargetUserIdentifier:](self->_serverConnection, "_setTargetUserIdentifier:");
    v16 = v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[LAClient context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a4;
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      _os_log_impl(&dword_1B971E000, v16, OS_LOG_TYPE_INFO, "%{public}@ target uid: %u", buf, 0x12u);

    }
  }
  objc_initWeak((id *)buf, self);
  v22 = MEMORY[0x1E0C809B0];
  v19 = v9;
  v23 = v19;
  objc_copyWeak(&v25, (id *)buf);
  v26 = a3;
  v24 = self;
  -[LAClient serverConnection](self, "serverConnection", v22, 3221225472, __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke, &unk_1E7079CE8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInterruptionHandler:", &v22);

  -[LAClient serverConnection](self, "serverConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (LAUIDelegate)uiDelegate
{
  return (LAUIDelegate *)objc_loadWeakRetained((id *)&self->_uiDelegate);
}

- (NSString)proxyId
{
  return self->_proxyId;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 synchronous:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  int64_t v24;
  BOOL v25;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  -[LAClient _updateOptions:](self, "_updateOptions:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CC1310];
  objc_msgSend(MEMORY[0x1E0CC1328], "checkOptions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "raiseExceptionOnError:", v16);

  v17 = (void *)MEMORY[0x1E0CC1310];
  objc_msgSend(MEMORY[0x1E0CC1328], "checkPolicy:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "raiseExceptionOnError:", v18);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke;
  v21[3] = &unk_1E7079FE0;
  v21[4] = self;
  v22 = v14;
  v23 = v12;
  v24 = a3;
  v25 = v8;
  v19 = v12;
  v20 = v14;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v8, v21, v13);

}

- (id)_updateOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E7087F60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, &unk_1E7087F60);

  }
  return v5;
}

- (void)_performSynchronous:(BOOL)a3 callId:(id)a4 finally:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  LAClient *v19;
  id v20;
  id v21;
  BOOL v22;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __47__LAClient__performSynchronous_callId_finally___block_invoke;
  v18 = &unk_1E7079EC8;
  v19 = self;
  v10 = v9;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  v22 = v6;
  v12 = (void *)MEMORY[0x1BCCC41F8](&v15);
  +[LAClient _queue](LAClient, "_queue", v15, v16, v17, v18, v19);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
    dispatch_sync(v13, v12);
  else
    dispatch_async(v13, v12);

}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_5);
  return (id)_queue_queue;
}

- (void)_checkIdResultForTCC:(id)a3 synchronous:(BOOL)a4 error:(id)a5 retryBlock:(id)a6 finally:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(id, id);
  void (**v15)(id, id, id);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  void (**v28)(id, id);
  void (**v29)(id, id, id);
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, id))a6;
  v15 = (void (**)(id, id, id))a7;
  -[LAClient context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    || !objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v13, -1018)
    || (objc_msgSend(v13, "userInfo"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TCCServerPrompt")),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "BOOLValue"),
        v19,
        v18,
        (v20 & 1) != 0))
  {
    v15[2](v15, v12, v13);
  }
  else
  {
    objc_msgSend(v13, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TCCService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v23 = dispatch_semaphore_create(0);
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v30 = v17;
      v31 = v22;
      v24 = v23;
      TCCAccessRequest();
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v33 + 24))
        v14[2](v14, v15);
      else
        v15[2](v15, 0, v13);

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      v25 = v17;
      v26 = v22;
      v28 = v14;
      v29 = v15;
      v27 = v13;
      TCCAccessRequest();

      v24 = v25;
    }

  }
}

- (LAContext)context
{
  return (LAContext *)objc_loadWeakRetained((id *)&self->_context);
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  Invalidation *v7;
  id v8;
  void *v9;
  uint64_t v10;
  Invalidation *v11;
  id v12;
  _QWORD v13[5];
  Invalidation *v14;
  id v15;
  _QWORD *v16;
  char v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldRecoverConnection"))
    objc_msgSend(*(id *)(a1 + 32), "_recoverConnection");
  objc_msgSend(*(id *)(a1 + 32), "permanentError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "permanentError");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v12);

  }
  else
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_2;
    v18[3] = &unk_1E7079E50;
    v20 = v21;
    v5 = *(id *)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v5;
    v6 = (void *)MEMORY[0x1BCCC41F8](v18);
    v7 = -[Invalidation initWithBlock:]([Invalidation alloc], "initWithBlock:", v6);
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 32), "invalidations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);

    objc_sync_exit(v8);
    v10 = *(_QWORD *)(a1 + 48);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_3;
    v13[3] = &unk_1E7079EA0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v14 = v11;
    v16 = v21;
    v17 = *(_BYTE *)(a1 + 56);
    v15 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, _QWORD *))(v10 + 16))(v10, v13);

    _Block_object_dispose(v21, 8);
  }
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "synchronousRemoteContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_2;
  v9[3] = &unk_1E7079FB8;
  v14 = *(_BYTE *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v8 = v3;
  objc_msgSend(v4, "evaluatePolicy:options:uiDelegate:reply:", v5, v10, v6, v9);

}

void __47__LAClient__performSynchronous_callId_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_msgSend(*(id *)(a1 + 32), "invalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_sync_exit(v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 1;
    if (*(_BYTE *)(a1 + 64))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__LAClient__performSynchronous_callId_finally___block_invoke_4;
      block[3] = &unk_1E7079E78;
      v14 = *(id *)(a1 + 48);
      v12 = v5;
      v13 = v6;
      dispatch_async(v10, block);

    }
  }

}

- (NSMutableArray)invalidations
{
  return self->_invalidations;
}

- (LAContextXPC)synchronousRemoteContext
{
  return self->_synchronousRemoteContext;
}

- (BOOL)shouldRecoverConnection
{
  return self->_shouldRecoverConnection;
}

- (NSError)permanentError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

+ (id)createConnection:(const unsigned int *)a3 legacyService:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t foreground_uid;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BYTE v17[12];
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("com.apple.CoreAuthentication.daemon");
  if (v4)
    v7 = CFSTR("com.apple.CoreAuthentication.daemon.libxpc");
  v8 = v7;
  if (xpc_user_sessions_enabled())
    v9 = 0;
  else
    v9 = 4096;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v8, v9);
  if (xpc_user_sessions_enabled())
  {
    *(_DWORD *)v17 = 0;
    foreground_uid = xpc_user_sessions_get_foreground_uid();
    objc_msgSend(v10, "_xpcConnection", *(_QWORD *)v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

    v13 = v6;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[LAClient createConnection:legacyService:].cold.1(foreground_uid, v13);

  }
  v14 = v6;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    *(_DWORD *)v17 = 138543874;
    *(_QWORD *)&v17[4] = v8;
    v18 = 1024;
    v19 = v9;
    v20 = 2114;
    v21 = v15;
    _os_log_impl(&dword_1B971E000, v14, OS_LOG_TYPE_INFO, "Connecting to %{public}@, flags:%x, uid:%{public}@", v17, 0x1Cu);
    if (a3)

  }
  return v10;
}

uint64_t __60__LAClient_initWithExternalizedContext_userSession_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", a2, a3, a4, a5);
}

- (LAClient)initWithUUID:(id)a3 token:(id)a4 senderAuditTokenData:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LAClient *v15;
  uint64_t v16;
  LACachedExternalizedContext *cachedExternalizedContext;
  uint64_t v18;
  NSMutableArray *invalidations;
  _QWORD v21[4];
  id v22;
  LAClient *v23;
  id v24;
  id v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)LAClient;
  v15 = -[LAClient init](&v26, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC1308]), "initWithExternalizationDelegate:", v15);
    cachedExternalizedContext = v15->_cachedExternalizedContext;
    v15->_cachedExternalizedContext = (LACachedExternalizedContext *)v16;

    v18 = objc_opt_new();
    invalidations = v15->_invalidations;
    v15->_invalidations = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeWeak((id *)&v15->_context, v14);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke;
    v21[3] = &unk_1E7079C70;
    v22 = v11;
    v23 = v15;
    v24 = v12;
    v25 = v13;
    -[LAClient _synchronousRemoteObjectProxy:performCall:](v23, "_synchronousRemoteObjectProxy:performCall:", 0, v21);

  }
  return v15;
}

void __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "instanceId");
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2;
  v10[3] = &unk_1E7079C48;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v5, "connectToContextWithUUID:callback:clientId:token:senderAuditTokenData:reply:", v3, v4, v7, v9, v8, v10);

}

uint64_t __60__LAClient_initWithUUID_token_senderAuditTokenData_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", a2, *(_QWORD *)(a1 + 40), a3, a4);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  objc_super v8;
  _QWORD block[4];
  id v10;
  id v11;

  -[LAClient serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAClient invalidations](self, "invalidations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAClient _queue](LAClient, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__LAClient_dealloc__block_invoke;
  block[3] = &unk_1E7079C98;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)LAClient;
  -[LAClient dealloc](&v8, sel_dealloc);
}

uint64_t __19__LAClient_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return +[LAClient _performInvalidationBlocks:](LAClient, "_performInvalidationBlocks:", *(_QWORD *)(a1 + 40));
}

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 56);
    v7 = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = objc_msgSend(v7, "willRetryOnInterruptedConnection");
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_INFO, "%{public}@ connection to server interrupted (recovery: %d, willRetry: %d)", buf, 0x18u);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "willRetryOnInterruptedConnection") & 1) == 0)
    {
      +[LAClient _queue](LAClient, "_queue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_90;
      block[3] = &unk_1E7079CC0;
      objc_copyWeak(&v10, (id *)(a1 + 48));
      dispatch_async(v8, block);

      objc_destroyWeak(&v10);
    }
  }
}

void __67__LAClient__connectToServerWithRecovery_userSession_legacyService___block_invoke_90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleRecovery");

}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", 0, 0, 0, a2);
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_92(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", 0, 0, 0, a2);
}

uint64_t __54__LAClient__synchronousRemoteObjectProxy_performCall___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", 0, 0, 0, a2);
}

- (void)_invalidateCachedExternalizedContextWithError:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v5 = objc_msgSend(v7, "code") == 4099;
  else
    v5 = 0;

  -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateBecauseOfInvalidConnection:", v5);

}

void __29__LAClient_setRemoteContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LALogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __29__LAClient_setRemoteContext___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "_scheduleRecovery");
}

- (void)_scheduleRecovery
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:message:", -10, CFSTR("Lost connection to coreauthd."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAClient _setPermanentError:](self, "_setPermanentError:", v3);

  if (v4)
    -[LAClient setShouldRecoverConnection:](self, "setShouldRecoverConnection:", 1);
}

- (void)_recoverConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint8_t *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[LAClient setShouldRecoverConnection:](self, "setShouldRecoverConnection:", 0);
  LALogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[LAClient context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1B971E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is recovering connection to server", buf, 0xCu);

  }
  -[LAClient userSession](self, "userSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  *(_DWORD *)buf = v6;
  -[LAClient userSession](self, "userSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = buf;
  else
    v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__LAClient__recoverConnection__block_invoke;
  v9[3] = &unk_1E7079D38;
  v9[4] = self;
  -[LAClient _synchronousRemoteObjectProxy:performCall:](self, "_synchronousRemoteObjectProxy:performCall:", v8, v9);

}

void __30__LAClient__recoverConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "existingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "instanceId");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__LAClient__recoverConnection__block_invoke_2;
  v9[3] = &unk_1E7079BF8;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "connectToExistingContext:callback:clientId:reply:", v5, v6, v8, v9);

}

uint64_t __30__LAClient__recoverConnection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionResult:uuid:proxyId:error:", a2, a3, a4, a5);
}

- (void)allowTransferToProcess:(int)a3 receiverAuditTokenData:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke;
  v10[3] = &unk_1E7079D60;
  v12 = a3;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, a5);

}

void __64__LAClient_allowTransferToProcess_receiverAuditTokenData_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowTransferToProcess:receiverAuditTokenData:reply:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), v4);

}

- (void)tokenForTransferToUnknownProcess:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__LAClient_tokenForTransferToUnknownProcess___block_invoke;
  v3[3] = &unk_1E7079D88;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __45__LAClient_tokenForTransferToUnknownProcess___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "synchronousRemoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenForTransferToUnknownProcess:", v3);

}

- (void)invalidatedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  LALogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[LAClient invalidatedWithError:].cold.1(self);

  +[LAClient _queue](LAClient, "_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__LAClient_invalidatedWithError___block_invoke;
  v8[3] = &unk_1E7079C98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __33__LAClient_invalidatedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPermanentError:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateWithMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[LAClient _queue](LAClient, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__LAClient_invalidateWithMessage___block_invoke;
  block[3] = &unk_1E7079DB0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __34__LAClient_invalidateWithMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_serializedInvalidateWithMessage:", *(_QWORD *)(a1 + 32));

}

- (void)_serializedInvalidateWithMessage:(id)a3
{
  NSXPCConnection *serverConnection;
  id v5;
  NSXPCConnection *v6;
  void *v7;
  id v8;

  serverConnection = self->_serverConnection;
  v5 = a3;
  -[NSXPCConnection invalidate](serverConnection, "invalidate");
  v6 = self->_serverConnection;
  self->_serverConnection = 0;

  objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:message:", -9, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[LAClient _setPermanentError:](self, "_setPermanentError:", v7);
  objc_msgSend(MEMORY[0x1E0CC1310], "errorWithCode:message:", -10, CFSTR("Invalid context."));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient setPermanentError:](self, "setPermanentError:", v8);

}

- (void)invalidateWithReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__LAClient_invalidateWithReply___block_invoke;
  v3[3] = &unk_1E7079DD8;
  v3[4] = self;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v3, a3);
}

uint64_t __32__LAClient_invalidateWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateWithReply:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_serializedInvalidateWithMessage:", CFSTR("invalidate called"));
}

+ (void)_performInvalidationBlocks:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invoke");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "removeAllObjects");

}

intptr_t __70__LAClient__checkIdResultForTCC_synchronous_error_retryBlock_finally___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_1B971E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TCC access request for %@ returned %d", (uint8_t *)&v8, 0x1Cu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __70__LAClient__checkIdResultForTCC_synchronous_error_retryBlock_finally___block_invoke_103(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  LALogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_1B971E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TCC access request for %@ returned %d", (uint8_t *)&v8, 0x1Cu);
  }

  if (a2)
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  else
    return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_performCallId:(id)a3 finally:(id)a4
{
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", 1, a3, a4);
}

- (void)_performCallBool:(id)a3 finally:(id)a4
{
  -[LAClient _performSynchronous:callBool:finally:](self, "_performSynchronous:callBool:finally:", 1, a3, a4);
}

void __47__LAClient__performSynchronous_callId_finally___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "permanentError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

uint64_t __47__LAClient__performSynchronous_callId_finally___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_performSynchronous:(BOOL)a3 callBool:(id)a4 finally:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v12 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke;
  v13[3] = &unk_1E7079F18;
  v14 = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_3;
  v11[3] = &unk_1E7079F40;
  v9 = v12;
  v10 = v8;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v6, v13, v11);

}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__LAClient__performSynchronous_callBool_finally___block_invoke_2;
  v7[3] = &unk_1E7079EF0;
  v8 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v7);

}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

void __49__LAClient__performSynchronous_callBool_finally___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (BOOL)_setPermanentError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  LAClient *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CC1310], "error:hasCode:", v4, -9) & 1) == 0)
  {
    LALogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[LAClient _setPermanentError:].cold.1(self);

  }
  -[LAClient permanentError](self, "permanentError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedExternalizedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAClient setExistingContext:](self, "setExistingContext:", v8);

    -[LAClient _invalidateCachedExternalizedContextWithError:](self, "_invalidateCachedExternalizedContextWithError:", v4);
    -[LAClient setRemoteContext:](self, "setRemoteContext:", 0);
    -[LAClient setPermanentError:](self, "setPermanentError:", v4);
    v9 = self;
    objc_sync_enter(v9);
    -[LAClient invalidations](v9, "invalidations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAClient _performInvalidationBlocks:](LAClient, "_performInvalidationBlocks:", v10);

    objc_sync_exit(v9);
  }

  return v6 == 0;
}

- (void)getDomainStateWithOptions:(id)a3 reply:(id)a4
{
  -[LAClient getDomainStateWithOptions:synchronous:reply:](self, "getDomainStateWithOptions:synchronous:reply:", a3, 0, a4);
}

- (void)getDomainStateWithOptions:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke;
  v10[3] = &unk_1E7079F68;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v6, v10, a5);

}

void __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "synchronousRemoteContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2;
  v7[3] = &unk_1E7079298;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "getDomainStateWithOptions:reply:", v5, v7);

}

uint64_t __56__LAClient_getDomainStateWithOptions_synchronous_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[LAClient uiDelegate](self, "uiDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient evaluatePolicy:options:uiDelegate:reply:](self, "evaluatePolicy:options:uiDelegate:reply:", a3, v9, v10, v8);

}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 reply:(id)a6
{
  -[LAClient evaluatePolicy:options:uiDelegate:synchronous:reply:](self, "evaluatePolicy:options:uiDelegate:synchronous:reply:", a3, a4, a5, 0, a6);
}

void __64__LAClient_evaluatePolicy_options_uiDelegate_synchronous_reply___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluatePolicy:options:uiDelegate:reply:", a1[7], a1[5], a1[6], v4);

}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[LAClient uiDelegate](self, "uiDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[LAClient evaluateACL:operation:options:uiDelegate:reply:](self, "evaluateACL:operation:options:uiDelegate:reply:", v13, v12, v11, v14, v10);

}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 reply:(id)a7
{
  -[LAClient evaluateACL:operation:options:uiDelegate:synchronous:reply:](self, "evaluateACL:operation:options:uiDelegate:synchronous:reply:", a3, a4, a5, a6, 0, a7);
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;

  v26 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  -[LAClient _updateOptions:](self, "_updateOptions:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CC1310];
  objc_msgSend(MEMORY[0x1E0CC1328], "checkOptions:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "raiseExceptionOnError:", v19);

  v20 = (void *)MEMORY[0x1E0CC1310];
  objc_msgSend(MEMORY[0x1E0CC1328], "checkACL:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "raiseExceptionOnError:", v21);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke;
  v27[3] = &unk_1E707A058;
  v27[4] = self;
  v28 = v13;
  v29 = v14;
  v30 = v17;
  v31 = v15;
  v32 = v26;
  v22 = v15;
  v23 = v17;
  v24 = v14;
  v25 = v13;
  -[LAClient _performSynchronous:callId:finally:](self, "_performSynchronous:callId:finally:", v26, v27, v16);

}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "synchronousRemoteContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2;
  v10[3] = &unk_1E707A030;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_BYTE *)(a1 + 72);
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = v3;
  v9 = v3;
  objc_msgSend(v4, "evaluateACL:operation:options:uiDelegate:reply:", v11, v5, v6, v7, v10);

}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = *(unsigned __int8 *)(a1 + 80);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3;
  v8[3] = &unk_1E707A008;
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v9, "_checkIdResultForTCC:synchronous:error:retryBlock:finally:", a2, v6, a3, v8, *(_QWORD *)(a1 + 72));

}

void __71__LAClient_evaluateACL_operation_options_uiDelegate_synchronous_reply___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateACL:operation:options:uiDelegate:reply:", a1[5], a1[6], a1[7], a1[8], v4);

}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CC1310];
  v10 = (void *)MEMORY[0x1E0CC1328];
  v11 = a5;
  objc_msgSend(v10, "checkEvent:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "raiseExceptionOnError:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__LAClient_failProcessedEvent_failureError_reply___block_invoke;
  v14[3] = &unk_1E707A080;
  v15 = v8;
  v16 = a3;
  v14[4] = self;
  v13 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, v11);

}

void __50__LAClient_failProcessedEvent_failureError_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "failProcessedEvent:failureError:reply:", a1[6], a1[5], v4);

}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v6 = (void *)MEMORY[0x1E0CC1310];
  v7 = (void *)MEMORY[0x1E0CC1328];
  v8 = a4;
  objc_msgSend(v7, "checkEvent:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raiseExceptionOnError:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__LAClient_retryProcessedEvent_reply___block_invoke;
  v10[3] = &unk_1E707A0A8;
  v10[4] = self;
  v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);

}

void __38__LAClient_retryProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retryProcessedEvent:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v6 = (void *)MEMORY[0x1E0CC1310];
  v7 = (void *)MEMORY[0x1E0CC1328];
  v8 = a4;
  objc_msgSend(v7, "checkEvent:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raiseExceptionOnError:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__LAClient_resetProcessedEvent_reply___block_invoke;
  v10[3] = &unk_1E707A0A8;
  v10[4] = self;
  v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);

}

void __38__LAClient_resetProcessedEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetProcessedEvent:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[6];
  BOOL v13;

  v8 = (void *)MEMORY[0x1E0CC1310];
  v9 = (void *)MEMORY[0x1E0CC1328];
  v10 = a5;
  objc_msgSend(v9, "checkEvent:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raiseExceptionOnError:", v11);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke;
  v12[3] = &unk_1E707A0D0;
  v12[4] = self;
  v12[5] = a3;
  v13 = a4;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v12, v10);

}

void __44__LAClient_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseProcessedEvent:pause:reply:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), v4);

}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  int64_t v20;
  int64_t v21;

  v10 = a3;
  v11 = (void *)MEMORY[0x1E0CC1310];
  v12 = (void *)MEMORY[0x1E0CC1328];
  v13 = a6;
  objc_msgSend(v12, "checkEvent:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "raiseExceptionOnError:", v14);

  v15 = (void *)MEMORY[0x1E0CC1310];
  objc_msgSend(MEMORY[0x1E0CC1328], "checkCredentialType:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "raiseExceptionOnError:", v16);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v18[3] = &unk_1E707A0F8;
  v18[4] = self;
  v19 = v10;
  v20 = a4;
  v21 = a5;
  v17 = v10;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v18, v13);

}

void __65__LAClient_setCredential_forProcessedEvent_credentialType_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredential:forProcessedEvent:credentialType:reply:", a1[5], a1[6], a1[7], v4);

}

- (void)isCredentialSet:(int64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v6 = (void *)MEMORY[0x1E0CC1310];
  v7 = (void *)MEMORY[0x1E0CC1328];
  v8 = a4;
  objc_msgSend(v7, "checkCredentialType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raiseExceptionOnError:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__LAClient_isCredentialSet_reply___block_invoke;
  v10[3] = &unk_1E707A0A8;
  v10[4] = self;
  v10[5] = a3;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, v8);

}

void __34__LAClient_isCredentialSet_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isCredentialSet:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CC1310];
  v10 = (void *)MEMORY[0x1E0CC1328];
  v11 = a5;
  objc_msgSend(v10, "checkCredentialType:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "raiseExceptionOnError:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__LAClient_setCredential_type_reply___block_invoke;
  v14[3] = &unk_1E707A080;
  v14[4] = self;
  v15 = v8;
  v16 = a4;
  v13 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, v11);

}

void __37__LAClient_setCredential_type_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredential:type:reply:", a1[5], a1[6], v4);

}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v6 = (void *)MEMORY[0x1E0CC1310];
  v7 = (void *)MEMORY[0x1E0CC1328];
  v8 = a4;
  objc_msgSend(v7, "checkCredentialType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raiseExceptionOnError:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__LAClient_credentialOfType_reply___block_invoke;
  v10[3] = &unk_1E707A120;
  v10[4] = self;
  v10[5] = a3;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v10, v8);

}

void __35__LAClient_credentialOfType_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialOfType:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)setOptions:(id)a3 forInternalOperation:(int64_t)a4 reply:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CC1310];
  v10 = (void *)MEMORY[0x1E0CC1328];
  v11 = a5;
  objc_msgSend(v10, "checkInternalOperation:options:", a4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "raiseExceptionOnError:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__LAClient_setOptions_forInternalOperation_reply___block_invoke;
  v14[3] = &unk_1E707A080;
  v14[4] = self;
  v15 = v8;
  v16 = a4;
  v13 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, v11);

}

void __50__LAClient_setOptions_forInternalOperation_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOptions:forInternalOperation:reply:", a1[5], a1[6], v4);

}

- (void)optionsForInternalOperation:(int64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v6 = (void *)MEMORY[0x1E0CC1310];
  v7 = (void *)MEMORY[0x1E0CC1328];
  v8 = a4;
  objc_msgSend(v7, "checkInternalOperation:options:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raiseExceptionOnError:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__LAClient_optionsForInternalOperation_reply___block_invoke;
  v10[3] = &unk_1E707A120;
  v10[4] = self;
  v10[5] = a3;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v10, v8);

}

void __46__LAClient_optionsForInternalOperation_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionsForInternalOperation:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke;
  v14[3] = &unk_1E707A148;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v17 = a5;
  v12 = v11;
  v13 = v10;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v14, a6);

}

void __57__LAClient_verifyFileVaultUser_volumeUuid_options_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verifyFileVaultUser:volumeUuid:options:reply:", a1[5], a1[6], a1[7], v4);

}

- (void)serverPropertyForOption:(int64_t)a3 reply:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__LAClient_serverPropertyForOption_reply___block_invoke;
  v4[3] = &unk_1E707A120;
  v4[4] = self;
  v4[5] = a3;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v4, a4);
}

void __42__LAClient_serverPropertyForOption_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverPropertyForOption:reply:", *(_QWORD *)(a1 + 40), v4);

}

- (void)setServerPropertyForOption:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__LAClient_setServerPropertyForOption_value_reply___block_invoke;
  v10[3] = &unk_1E707A080;
  v11 = v8;
  v12 = a3;
  v10[4] = self;
  v9 = v8;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v10, a5);

}

void __51__LAClient_setServerPropertyForOption_value_reply___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServerPropertyForOption:value:reply:", a1[6], a1[5], v4);

}

- (id)serverPropertyForOption:(int64_t)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__LAClient_serverPropertyForOption_error___block_invoke;
  v7[3] = &unk_1E707A170;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAClient serverPropertyForOption:reply:](self, "serverPropertyForOption:reply:", a3, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __42__LAClient_serverPropertyForOption_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)setServerPropertyForOption:(int64_t)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__LAClient_setServerPropertyForOption_value_error___block_invoke;
  v11[3] = &unk_1E707A198;
  v11[4] = &v18;
  v11[5] = &v12;
  -[LAClient setServerPropertyForOption:value:reply:](self, "setServerPropertyForOption:value:reply:", a3, v8, v11);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13[5]);
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __51__LAClient_setServerPropertyForOption_value_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)externalizedContextWithReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__LAClient_externalizedContextWithReply___block_invoke;
  v3[3] = &unk_1E7079D88;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __41__LAClient_externalizedContextWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "synchronousRemoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalizedContextWithReply:", v3);

}

- (id)synchronousExternalizedContextWithError:(id *)a3
{
  id v4;
  _QWORD v6[6];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v6[5] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke;
  v7[3] = &unk_1E7079D88;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2;
  v6[3] = &unk_1E707A1C0;
  v6[4] = &v14;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v7, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v4 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "synchronousRemoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalizedContextWithReply:", v3);

}

void __52__LAClient_synchronousExternalizedContextWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSData)externalizedContext
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalizedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    usleep(0x1388u);
    LALogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[LAClient externalizedContext].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    -[LAClient cachedExternalizedContext](self, "cachedExternalizedContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "externalizedContext");
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }
  return (NSData *)v4;
}

- (void)authMethodWithReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__LAClient_authMethodWithReply___block_invoke;
  v3[3] = &unk_1E7079D88;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __32__LAClient_authMethodWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "synchronousRemoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authMethodWithReply:", v3);

}

- (void)prearmTouchIdWithReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke;
  v3[3] = &unk_1E7079D88;
  v3[4] = self;
  -[LAClient _performCallId:finally:](self, "_performCallId:finally:", v3, a3);
}

void __35__LAClient_prearmTouchIdWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__LAClient_prearmTouchIdWithReply___block_invoke_2;
  v7[3] = &unk_1E7079418;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prearmTouchIdWithReply:", v5);

}

uint64_t __35__LAClient_prearmTouchIdWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetWithReply:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__LAClient_resetWithReply___block_invoke;
  v3[3] = &unk_1E7079DD8;
  v3[4] = self;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v3, a3);
}

void __27__LAClient_resetWithReply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "synchronousRemoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetProcessedEvent:reply:", 0, v3);

}

- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  v8 = a4;
  v9 = a5;
  -[LAClient _connectToServerWithRecovery:userSession:legacyService:](self, "_connectToServerWithRecovery:userSession:legacyService:", 0, 0, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__LAClient_notifyEvent_options_reply___block_invoke;
  v11[3] = &unk_1E707A080;
  v12 = v8;
  v13 = a3;
  v11[4] = self;
  v10 = v8;
  -[LAClient _performSynchronous:callBool:finally:](self, "_performSynchronous:callBool:finally:", 0, v11, v9);

}

void __38__LAClient_notifyEvent_options_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__LAClient_notifyEvent_options_reply___block_invoke_2;
  v7[3] = &unk_1E7079418;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyEvent:options:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v5);

}

uint64_t __38__LAClient_notifyEvent_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__LAClient_setShowingCoachingHint_event_reply___block_invoke;
  v5[3] = &unk_1E707A0D0;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  -[LAClient _performCallBool:finally:](self, "_performCallBool:finally:", v5, a5);
}

void __47__LAClient_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "synchronousRemoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowingCoachingHint:event:reply:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), v4);

}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[LAClient serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__LAClient_bootstrapServiceType_completionHandler___block_invoke;
  v18 = &unk_1E7079418;
  v19 = v6;
  v9 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "processIdentifier");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%d"), v13, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bootstrapSessionServiceType:serviceClientID:completionHandler:", v7, v14, v9);

}

uint64_t __51__LAClient_bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setUiDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_uiDelegate, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (LACachedExternalizedContext)cachedExternalizedContext
{
  return (LACachedExternalizedContext *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedExternalizedContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setShouldRecoverConnection:(BOOL)a3
{
  self->_shouldRecoverConnection = a3;
}

- (BOOL)willRetryOnInterruptedConnection
{
  return self->_willRetryOnInterruptedConnection;
}

- (void)setWillRetryOnInterruptedConnection:(BOOL)a3
{
  self->_willRetryOnInterruptedConnection = a3;
}

- (NSNumber)userSession
{
  return self->_userSession;
}

- (NSData)existingContext
{
  return self->_existingContext;
}

- (void)setExistingContext:(id)a3
{
  objc_storeStrong((id *)&self->_existingContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_existingContext, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_cachedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_synchronousRemoteContext, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_permanentError, 0);
  objc_storeStrong((id *)&self->_proxyId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_uiDelegate);
}

+ (void)createConnection:(uint64_t)a1 legacyService:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1B971E000, a2, OS_LOG_TYPE_DEBUG, "xpc_connection_set_target_user_session_uid() setting uid:%{public}@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_4();
}

+ (void)createConnection:(int *)a1 legacyService:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2080;
  v6 = xpc_strerror();
  _os_log_error_impl(&dword_1B971E000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)_synchronousRemoteObjectProxy:(uint64_t)a3 performCall:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B971E000, a1, a3, "Retrying on an interrupted XPC connection", a5, a6, a7, a8, 0);
}

- (void)_handleConnectionResult:(void *)a1 uuid:proxyId:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B971E000, v2, v3, "%{public}@ failed to initialize: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __29__LAClient_setRemoteContext___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B971E000, v2, v3, "%{public}@ has encountered XPC error on synchronous proxy: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)invalidatedWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B971E000, v2, v3, "%{public}@ invalidated by server: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_setPermanentError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1B971E000, v2, v3, "%{public}@ will keep returning %{public}@ from now on", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)externalizedContext
{
  OUTLINED_FUNCTION_3(&dword_1B971E000, a1, a3, "Retrying on cachedExternalizedContext", a5, a6, a7, a8, 0);
}

@end
