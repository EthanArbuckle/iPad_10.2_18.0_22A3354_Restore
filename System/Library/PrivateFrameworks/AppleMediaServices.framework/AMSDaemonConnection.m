@implementation AMSDaemonConnection

- (void)attemptResumeIfRequired
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AMSDaemonConnection sharedConnection](self, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reconnecting XPC connection", (uint8_t *)&v8, 0x16u);

    }
    -[AMSDaemonConnection _initializeConnection](self, "_initializeConnection");
  }
}

- (AMSDaemonConnection)init
{
  AMSDaemonConnection *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *interruptionHandlers;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sharedConnectionAccessQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSDaemonConnection;
  v2 = -[AMSDaemonConnection init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.serviceQueue"), CFSTR("com.apple.xpc.amsaccountsd"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    interruptionHandlers = v2->_interruptionHandlers;
    v2->_interruptionHandlers = v4;

    v6 = objc_retainAutorelease(v3);
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4), 0);
    sharedConnectionAccessQueue = v2->_sharedConnectionAccessQueue;
    v2->_sharedConnectionAccessQueue = (OS_dispatch_queue *)v7;

    -[AMSDaemonConnection _initializeConnection](v2, "_initializeConnection");
  }
  return v2;
}

void __44__AMSDaemonConnection__initializeConnection__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = AMSSetLogKey(*(void **)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

- (void)_handleInvalidation
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AMSDaemonConnection sharedConnectionAccessQueue](self, "sharedConnectionAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Connection could not be established (invalidated)", (uint8_t *)&v8, 0x16u);

  }
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  NSXPCConnection *sharedConnection;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: deallocated", buf, 0xCu);

  }
  -[NSXPCConnection setInvalidationHandler:](self->_sharedConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_sharedConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_sharedConnection, "invalidate");
  sharedConnection = self->_sharedConnection;
  self->_sharedConnection = 0;

  v7.receiver = self;
  v7.super_class = (Class)AMSDaemonConnection;
  -[AMSDaemonConnection dealloc](&v7, sel_dealloc);
}

- (void)_initializeConnection
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSXPCConnection *sharedConnection;
  NSXPCConnection *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = objc_opt_class();
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing XPC connection", buf, 0x16u);
  }

  v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.xpc.amsaccountsd"), 0);
  -[AMSDaemonConnection sharedConnectionAccessQueue](self, "sharedConnectionAccessQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection _setQueue:](v6, "_setQueue:", v7);

  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__AMSDaemonConnection__initializeConnection__block_invoke;
  v20[3] = &unk_1E253E8B0;
  objc_copyWeak(&v22, (id *)buf);
  v9 = v3;
  v21 = v9;
  -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v20);
  v14 = v8;
  v15 = 3221225472;
  v16 = __44__AMSDaemonConnection__initializeConnection__block_invoke_2;
  v17 = &unk_1E253E8B0;
  objc_copyWeak(&v19, (id *)buf);
  v10 = v9;
  v18 = v10;
  -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", &v14);
  +[AMSDaemonConnectionInterface interface](AMSDaemonConnectionInterface, "interface", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v11);

  -[NSXPCConnection resume](v6, "resume");
  sharedConnection = self->_sharedConnection;
  self->_sharedConnection = v6;
  v13 = v6;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (OS_dispatch_queue)sharedConnectionAccessQueue
{
  return self->_sharedConnectionAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionHandlers, 0);
  objc_storeStrong((id *)&self->_sharedConnectionAccessQueue, 0);
  objc_storeStrong((id *)&self->_sharedConnection, 0);
}

void __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke_2;
  v11 = &unk_1E253D950;
  v3 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    (*(void (**)(_QWORD, void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 40), v5, v6);
  }
  else
  {
    AMSError(0, CFSTR("Proxy Failure"), CFSTR("Failed to fetch connection proxy. Missing either an error or result."), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7, v8, v9, v10, v11, v12);

  }
}

void __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke_2;
  v7[3] = &unk_1E2540670;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getAccountCachedServerDataServiceProxyWithReplyHandler:", v7);

}

void __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getAccountCachedServerDataServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (void)_errorForwardingProxyForServiceProxy:(id)a3 proxyReplyError:(id)a4 interface:(id)a5 proxyPromise:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a4;
  v9 = a6;
  if (a3)
  {
    v10 = a5;
    v11 = a3;
    a3 = -[AMSDaemonConnectionErrorForwardingProxy initWithProxy:fromInterface:]([AMSDaemonConnectionErrorForwardingProxy alloc], "initWithProxy:fromInterface:", v11, v10);

  }
  objc_msgSend(v9, "finishWithResult:error:", a3, v12);

}

- (id)cookieServiceProxySyncWithError:(id *)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__24;
  v22 = __Block_byref_object_dispose__24;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24;
  v16 = __Block_byref_object_dispose__24;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke;
  v11[3] = &unk_1E2540738;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &v12;
  -[AMSDaemonConnection _connectionSyncProxyWithAccessBlock:](self, "_connectionSyncProxyWithAccessBlock:", v11);
  if (v19[5])
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      AMSLogableError((void *)v19[5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v6;
      v26 = 2114;
      v27 = v7;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting sync proxy. error = %{public}@", buf, 0x20u);

    }
    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v19[5]);
  }
  else
  {
    v9 = (id)v13[5];
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (id)_serviceInterfaceForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AMSDaemonConnection sharedConnection](self, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "interfaceForSelector:argumentIndex:ofReply:", a3, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_connectionSyncProxyWithAccessBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = (void (**)(id, _QWORD, void *))a3;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  if (v7)
  {
    AMSErrorWithFormat(11, CFSTR("Connection Proxy Failed"), CFSTR("Sync proxy unavailable"), v8, v9, v10, v11, v12, v16[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13);

  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__24;
    v21 = __Block_byref_object_dispose__24;
    v22 = 0;
    -[AMSDaemonConnection sharedConnection](self, "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__59__AMSDaemonConnection__connectionSyncProxyWithAccessBlock___block_invoke;
    v16[3] = (uint64_t)&unk_1E25408F0;
    v16[4] = (uint64_t)self;
    v16[5] = (uint64_t)&v17;
    objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v4)[2](v4, v15, (void *)v18[5]);
    _Block_object_dispose(&v17, 8);

  }
}

- (NSXPCConnection)sharedConnection
{
  return self->_sharedConnection;
}

void __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke_39;
    v12[3] = &unk_1E2540710;
    v13 = *(_OWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "getCookieServiceProxyWithReplyHandler:", v12);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to get sync remote object proxy. error = %{public}@", buf, 0x20u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __59__AMSDaemonConnection__connectionSyncProxyWithAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting (sync) to daemon. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (id)accountCachedServerDataService
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AMSDaemonConnection_accountCachedServerDataService__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_connectionProxyWithAccessBlock:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  AMSMutablePromise *v15;
  NSObject *v16;
  uint64_t v17;
  AMSMutablePromise *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  AMSMutablePromise *v22;
  uint64_t v24;
  _QWORD v25[5];
  AMSMutablePromise *v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  if (v8)
  {
    AMSErrorWithFormat(11, CFSTR("Connection Proxy Failed"), CFSTR("Async proxy unavailable"), v9, v10, v11, v12, v13, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithError:](v5, "finishWithError:", v14);
    v15 = v5;

  }
  else
  {
    -[AMSDaemonConnection sharedConnectionAccessQueue](self, "sharedConnectionAccessQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke;
    v25[3] = &unk_1E253F738;
    v25[4] = self;
    v18 = v5;
    v26 = v18;
    v27 = v4;
    v19 = v25;
    AMSLogKey();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_1;
    block[3] = &unk_1E253DC28;
    v29 = v20;
    v30 = v19;
    v21 = v20;
    dispatch_async(v16, block);

    v22 = v18;
  }

  return v5;
}

void __41__AMSDaemonConnection_cookieServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getCookieServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

void __41__AMSDaemonConnection_cookieServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AMSDaemonConnection_cookieServiceProxy__block_invoke_2;
  v7[3] = &unk_1E25406E8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getCookieServiceProxyWithReplyHandler:", v7);

}

- (id)cookieServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AMSDaemonConnection_cookieServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addInterruptionHandler:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[AMSDaemonConnection sharedConnectionAccessQueue](self, "sharedConnectionAccessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AMSDaemonConnection_addInterruptionHandler___block_invoke;
    block[3] = &unk_1E253DC28;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __46__AMSDaemonConnection_addInterruptionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "interruptionHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "addObject:", v2);

}

- (id)callService:(id)a3 then:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AMSDaemonConnection_callService_then___block_invoke;
  v9[3] = &unk_1E2540648;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__AMSDaemonConnection_callService_then___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__24;
  v8[4] = __Block_byref_object_dispose__24;
  v5 = v3;
  v9 = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AMSDaemonConnection_callService_then___block_invoke_26;
  v7[3] = &unk_1E253E520;
  v7[4] = v8;
  objc_msgSend(v4, "addFinishBlock:", v7);
  _Block_object_dispose(v8, 8);

  return v4;
}

void __40__AMSDaemonConnection_callService_then___block_invoke_26(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)accountSignOutServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke_2;
  v7[3] = &unk_1E25406C0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getAccountSignOutServiceProxyWithReplyHandler:", v7);

}

void __49__AMSDaemonConnection_accountSignOutServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getAccountSignOutServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

void __55__AMSDaemonConnection_cookieServiceProxySyncWithError___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  AMSDaemonConnectionErrorForwardingProxy *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_serviceInterfaceForSelector:", sel_getCookieServiceProxyWithReplyHandler_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSDaemonConnectionErrorForwardingProxy initWithProxy:fromInterface:isSync:]([AMSDaemonConnectionErrorForwardingProxy alloc], "initWithProxy:fromInterface:isSync:", v5, v7, 1);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]Failed to get service interface with proxy. error = %{public}@", (uint8_t *)&v16, 0x20u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)deviceMessengerProxyWithDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  AMSDaemonConnection *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke;
  v8[3] = &unk_1E2540788;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  +[AMSConnectionDelegateProxy proxyWithDelegate:](AMSConnectionDelegateProxy, "proxyWithDelegate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke_2;
  v10[3] = &unk_1E2540760;
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "getDeviceMessengerServiceProxyWithDelegate:replyHandler:", v8, v10);

}

void __56__AMSDaemonConnection_deviceMessengerProxyWithDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getDeviceMessengerServiceProxyWithDelegate_replyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)dismissQRDialogServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke_2;
  v7[3] = &unk_1E25407B0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getDismissQRDialogServiceProxyWithReplyHandler:", v7);

}

void __50__AMSDaemonConnection_dismissQRDialogServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getDismissQRDialogServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)fraudReportServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke_2;
  v7[3] = &unk_1E25407D8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFraudReportServiceProxyWithReplyHandler:", v7);

}

void __46__AMSDaemonConnection_fraudReportServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getFraudReportServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)keychainServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__AMSDaemonConnection_keychainServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__AMSDaemonConnection_keychainServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AMSDaemonConnection_keychainServiceProxy__block_invoke_2;
  v7[3] = &unk_1E2540800;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getKeychainServiceProxyWithReplyHandler:", v7);

}

void __43__AMSDaemonConnection_keychainServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getKeychainServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)purchaseServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke_2;
  v7[3] = &unk_1E2540828;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPurchaseServiceProxyWithReplyHandler:", v7);

}

void __43__AMSDaemonConnection_purchaseServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getPurchaseServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)paymentConfirmationProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke_2;
  v7[3] = &unk_1E2540850;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPaymentConfirmationServiceProxyWithReplyHandler:", v7);

}

void __47__AMSDaemonConnection_paymentConfirmationProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getPaymentConfirmationServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)paymentValidationServiceProxy
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke_2;
  v7[3] = &unk_1E2540878;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPaymentValidationServiceProxyWithReplyHandler:", v7);

}

void __52__AMSDaemonConnection_paymentValidationServiceProxy__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getPaymentValidationServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)pushNotificationService
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__AMSDaemonConnection_pushNotificationService__block_invoke;
  v3[3] = &unk_1E2540698;
  v3[4] = self;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46__AMSDaemonConnection_pushNotificationService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AMSDaemonConnection_pushNotificationService__block_invoke_2;
  v7[3] = &unk_1E25408A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPushNotificationServiceProxyWithReplyHandler:", v7);

}

void __46__AMSDaemonConnection_pushNotificationService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getPushNotificationServiceProxyWithReplyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

- (id)securityServiceProxyWithDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  AMSDaemonConnection *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke;
  v8[3] = &unk_1E2540788;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[AMSDaemonConnection _connectionProxyWithAccessBlock:](self, "_connectionProxyWithAccessBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  +[AMSConnectionDelegateProxy proxyWithDelegate:](AMSConnectionDelegateProxy, "proxyWithDelegate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke_2;
  v10[3] = &unk_1E25408C8;
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "getSecurityServiceProxyWithDelegate:replyHandler:", v8, v10);

}

void __56__AMSDaemonConnection_securityServiceProxyWithDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_serviceInterfaceForSelector:", sel_getSecurityServiceProxyWithDelegate_replyHandler_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForwardingProxyForServiceProxy:proxyReplyError:interface:proxyPromise:", v7, v6, v8, *(_QWORD *)(a1 + 40));

}

void __55__AMSDaemonConnection__connectionProxyWithAccessBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    AMSError(0, CFSTR("AMSDaemonConnection Error"), CFSTR("Unknown error occurred while fetching Async remote object proxy"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error connecting (async) to daemon. %{public}@", (uint8_t *)&v8, 0x20u);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isFinished") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);

}

- (void)_handleInterruption
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AMSDaemonConnection sharedConnectionAccessQueue](self, "sharedConnectionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[AMSLogConfig sharedAccountsDaemonConfig](AMSLogConfig, "sharedAccountsDaemonConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Connection interrupted.", buf, 0x16u);

  }
  -[AMSDaemonConnection setSharedConnection:](self, "setSharedConnection:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AMSDaemonConnection interruptionHandlers](self, "interruptionHandlers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

void __44__AMSDaemonConnection__initializeConnection__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = AMSSetLogKey(*(void **)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterruption");

}

- (void)setSharedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_sharedConnection, a3);
}

- (NSMutableArray)interruptionHandlers
{
  return self->_interruptionHandlers;
}

@end
