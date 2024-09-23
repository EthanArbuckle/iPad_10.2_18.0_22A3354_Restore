@implementation AMSHTTPArchiveService

void __37__AMSHTTPArchiveService__sharedProxy__block_invoke_2(uint64_t a1)
{
  void *v2;
  AMSHTTPArchiveService *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = (void *)_sharedProxy_sharedService;
  if (!_sharedProxy_sharedService)
  {
    v3 = objc_alloc_init(AMSHTTPArchiveService);
    v4 = (void *)_sharedProxy_sharedService;
    _sharedProxy_sharedService = (uint64_t)v3;

    v2 = (void *)_sharedProxy_sharedService;
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__37;
  v16[4] = __Block_byref_object_dispose__37;
  v17 = v2;
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__AMSHTTPArchiveService__sharedProxy__block_invoke_3;
  v15[3] = &unk_1E253DDB8;
  v15[4] = v16;
  v7 = v15;
  v8 = v6;
  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3000000000);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_1;
  block[3] = &unk_1E253DC28;
  v19 = v9;
  v20 = v7;
  v11 = v9;
  dispatch_after(v10, v8, block);

  objc_msgSend((id)_sharedProxy_sharedService, "_createProxy");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  _Block_object_dispose(v16, 8);
}

- (id)_createProxy
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
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  v12 = 0;
  -[AMSHTTPArchiveService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__createProxy__block_invoke;
  v6[3] = &unk_1E2542338;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (AMSHTTPArchiveService)init
{
  AMSHTTPArchiveService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSHTTPArchiveService;
  v2 = -[AMSHTTPArchiveService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AppleMediaServices.harservice", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_createRemoteConnection
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

  -[AMSHTTPArchiveService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.xpc.amstoold"), 0);
  -[AMSHTTPArchiveService queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE068);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_recordTrafficWithTaskInfo_, 0, 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", v6);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke;
  v11[3] = &unk_1E253E9A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v11);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke_54;
  v9[3] = &unk_1E253E9A0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  objc_msgSend(v4, "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __37__AMSHTTPArchiveService__createProxy__block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "_createRemoteConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", v2);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__createProxy__block_invoke_2;
  v6[3] = &unk_1E253E120;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

+ (void)recordTrafficWithTaskInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_sharedProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordTrafficWithTaskInfo:", v4);

}

+ (id)_sharedProxy
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__37;
  v13 = __Block_byref_object_dispose__37;
  v14 = 0;
  if (_MergedGlobals_113 != -1)
    dispatch_once(&_MergedGlobals_113, &__block_literal_global_65);
  v2 = (id)qword_1ECEAD298;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__AMSHTTPArchiveService__sharedProxy__block_invoke_2;
  v6[3] = &unk_1E2542338;
  v7 = v2;
  v8 = &v9;
  v3 = v2;
  dispatch_sync(v3, v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __37__AMSHTTPArchiveService__sharedProxy__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.harconnection", 0);
  v1 = (void *)qword_1ECEAD298;
  qword_1ECEAD298 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[AMSHTTPArchiveService _removeRemoteConnection](self, "_removeRemoteConnection");
  v3.receiver = self;
  v3.super_class = (Class)AMSHTTPArchiveService;
  -[AMSHTTPArchiveService dealloc](&v3, sel_dealloc);
}

void __37__AMSHTTPArchiveService__createProxy__block_invoke_2(uint64_t a1, void *a2)
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

void __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invalidation Handler Reached", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(WeakRetained, "_removeRemoteConnection");
  objc_msgSend(WeakRetained, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "errorHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

void __48__AMSHTTPArchiveService__createRemoteConnection__block_invoke_54(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Interruption Handler Reached", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(WeakRetained, "_removeRemoteConnection");
  objc_msgSend(WeakRetained, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "errorHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

- (void)_removeRemoteConnection
{
  void *v3;

  -[AMSHTTPArchiveService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AMSHTTPArchiveService setConnection:](self, "setConnection:", 0);
}

void __37__AMSHTTPArchiveService__sharedProxy__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
