@implementation AMSUniversalLinksConnection

- (AMSUniversalLinksConnection)init
{
  AMSUniversalLinksConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUniversalLinksConnection;
  v2 = -[AMSUniversalLinksConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AppleMediaServices.UniversalLinks", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (AMSUniversalLinksServiceProtocol)proxy
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__71;
  v11 = __Block_byref_object_dispose__71;
  v12 = 0;
  -[AMSUniversalLinksConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__AMSUniversalLinksConnection_proxy__block_invoke;
  v6[3] = &unk_1E2542338;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSUniversalLinksServiceProtocol *)v4;
}

void __36__AMSUniversalLinksConnection_proxy__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newRemoteConnection");
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", v2);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__AMSUniversalLinksConnection_proxy__block_invoke_2;
  v6[3] = &unk_1E253E120;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __36__AMSUniversalLinksConnection_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUniversalLinksConnection _removeRemoteConnection](self, "_removeRemoteConnection");
  v3.receiver = self;
  v3.super_class = (Class)AMSUniversalLinksConnection;
  -[AMSUniversalLinksConnection dealloc](&v3, sel_dealloc);
}

- (id)_makeRemoteConnectionInterface
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE1E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUniversalLinksUpdateResult archiveClasses](AMSUniversalLinksUpdateResult, "archiveClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_updateWithCompletion_, 0, 1);

  return v2;
}

- (id)_newRemoteConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[AMSUniversalLinksConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.xpc.amsuniversallinks"), 0);
  -[AMSUniversalLinksConnection queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  -[AMSUniversalLinksConnection _makeRemoteConnectionInterface](self, "_makeRemoteConnectionInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v6);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke;
  v11[3] = &unk_1E253E9A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v11);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke_2;
  v9[3] = &unk_1E253E9A0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  objc_msgSend(v4, "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v4;
}

void __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");

}

void __51__AMSUniversalLinksConnection__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");

}

- (void)_removeRemoteConnection
{
  void *v3;

  -[AMSUniversalLinksConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AMSUniversalLinksConnection setConnection:](self, "setConnection:", 0);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
