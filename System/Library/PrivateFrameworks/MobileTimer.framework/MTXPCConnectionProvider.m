@implementation MTXPCConnectionProvider

void __77__MTXPCConnectionProvider_performRemoteBlock_withErrorHandler_isSynchronous___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  NAEmptyResult();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isEqual:", v3);

  if ((v4 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 isSynchronous:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  if (a5)
    -[MTXPCConnectionProvider _syncRemoteObjectProxyWithErrorHandler:](self, "_syncRemoteObjectProxyWithErrorHandler:", a4);
  else
    -[MTXPCConnectionProvider _asyncRemoteObjectProxyWithErrorHandler:](self, "_asyncRemoteObjectProxyWithErrorHandler:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__MTXPCConnectionProvider_performRemoteBlock_withErrorHandler_isSynchronous___block_invoke;
  v12[3] = &unk_1E39CBEA8;
  v13 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v9, "addSuccessBlock:", v12);

}

- (id)_asyncRemoteObjectProxyWithErrorHandler:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke;
  v4[3] = &unk_1E39CBED0;
  v4[4] = self;
  -[MTXPCConnectionProvider _remoteObjectProxyWithXPCConnectionProvider:remoteObjectProxyProvider:errorHandler:](self, "_remoteObjectProxyWithXPCConnectionProvider:remoteObjectProxyProvider:errorHandler:", v4, &__block_literal_global_10, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_remoteObjectProxyWithXPCConnectionProvider:(id)a3 remoteObjectProxyProvider:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  (*((void (**)(id))a3 + 2))(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke;
  v15[3] = &unk_1E39CBF40;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    MTLogForCategory(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_2();

    goto LABEL_11;
  }
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2;
  v16 = &unk_1E39CBF18;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = a1 + 32;
  v17 = v5;
  v18 = *(id *)(v4 + 8);
  v6 = (void *)MEMORY[0x19AED0080](&v13);
  (*(void (**)(_QWORD, id, void *, uint64_t, uint64_t))(*(_QWORD *)(v4 + 16) + 16))(*(_QWORD *)(v4 + 16), v3, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9, v13, v14, v15, v16, v17);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MTLogForCategory(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_1();

  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v13, v14, v15, v16, v17);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  return (id)v4;
}

uint64_t __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:");
}

- (id)connection
{
  os_unfair_lock_s *p_connectionLock;
  void *v4;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  -[MTXPCConnectionProvider _connectionRebuildingIfNecessary](self, "_connectionRebuildingIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_connectionLock);
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTXPCConnectionProvider info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "machServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_connectionRebuildingIfNecessary
{
  NSXPCConnection *connection;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  MTXPCConnectionProvider *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    MTLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_INFO, "%{public}@ rebuilding connection", buf, 0xCu);
    }

    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[MTXPCConnectionProvider info](self, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "machServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTXPCConnectionProvider info](self, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", v7, objc_msgSend(v8, "options"));
    v10 = self->_connection;
    self->_connection = v9;

    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke;
    v22[3] = &unk_1E39CB858;
    v22[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v22);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke_2;
    v21[3] = &unk_1E39CB858;
    v21[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v21);
    -[MTXPCConnectionProvider info](self, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v13);

    -[MTXPCConnectionProvider info](self, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exportedObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[MTXPCConnectionProvider info](self, "info");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "exportedObjectInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v17);

      -[MTXPCConnectionProvider info](self, "info");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "exportedObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v19);

    }
    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }
  return connection;
}

- (MTXPCConnectionInfo)info
{
  return self->_info;
}

- (MTXPCConnectionProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4 reconnectHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  MTXPCConnectionProvider *v13;
  NSObject *v14;
  uint64_t v15;
  NAScheduler *callbackScheduler;
  uint64_t v17;
  id errorHandler;
  uint64_t v19;
  id reconnectHandler;
  void *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v23;
  void *v25;
  NSObject *v26;
  objc_super v27;
  uint8_t buf[4];
  MTXPCConnectionProvider *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTXPCConnectionProvider.m"), 43, CFSTR("Connection info must be non-nil"));

    MTLogForCategory(2);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MTXPCConnectionProvider initWithConnectionInfo:errorHandler:reconnectHandler:].cold.1(v26);

  }
  v27.receiver = self;
  v27.super_class = (Class)MTXPCConnectionProvider;
  v13 = -[MTXPCConnectionProvider init](&v27, sel_init);
  if (v13)
  {
    MTLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_INFO, "Initializing %{public}@ with info %{public}@", buf, 0x16u);
    }

    v13->_connectionLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
    v15 = objc_claimAutoreleasedReturnValue();
    callbackScheduler = v13->_callbackScheduler;
    v13->_callbackScheduler = (NAScheduler *)v15;

    objc_storeStrong((id *)&v13->_info, a3);
    v17 = objc_msgSend(v11, "copy");
    errorHandler = v13->_errorHandler;
    v13->_errorHandler = (id)v17;

    v19 = objc_msgSend(v12, "copy");
    reconnectHandler = v13->_reconnectHandler;
    v13->_reconnectHandler = (id)v19;

    v13->_alive = 1;
    objc_msgSend(v10, "lifecycleNotification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      objc_msgSend(v10, "lifecycleNotification");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)_handleLifeCycleNotification, v23, v13, (CFNotificationSuspensionBehavior)1025);

    }
  }

  return v13;
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4
{
  -[MTXPCConnectionProvider performRemoteBlock:withErrorHandler:isSynchronous:](self, "performRemoteBlock:withErrorHandler:isSynchronous:", a3, a4, 0);
}

+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 reconnectHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnectionInfo:errorHandler:reconnectHandler:", v6, 0, v5);

  return (MTXPCConnectionProvider *)v7;
}

+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnectionInfo:errorHandler:reconnectHandler:", v6, v5, 0);

  return (MTXPCConnectionProvider *)v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MTXPCConnectionProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_connectionLock);
  self->_alive = 0;
  os_unfair_lock_unlock(&self->_connectionLock);
  -[MTXPCConnectionProvider invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MTXPCConnectionProvider;
  -[MTXPCConnectionProvider dealloc](&v4, sel_dealloc);
}

uint64_t __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInterruptConnection");
}

uint64_t __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInvalidateConnection");
}

- (void)_didInterruptConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__MTXPCConnectionProvider__didInterruptConnection__block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "errorHandler");
  v2 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v1);

}

- (void)_didInvalidateConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__MTXPCConnectionProvider__didInvalidateConnection__block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "errorHandler");
  v2 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v1);

}

- (void)didReceiveLifecycleNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ received lifecycle darwin notification but does not have a reconnection handler.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__MTXPCConnectionProvider_didReceiveLifecycleNotification__block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "reconnectHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (id)_retryConnection
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__MTXPCConnectionProvider__retryConnection__block_invoke;
  v11[3] = &unk_1E39CBE08;
  v12 = v3;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __43__MTXPCConnectionProvider__retryConnection__block_invoke_2;
  v9[3] = &unk_1E39CBE30;
  v9[4] = self;
  v5 = v12;
  v10 = v5;
  -[MTXPCConnectionProvider performRemoteBlock:withErrorHandler:](self, "performRemoteBlock:withErrorHandler:", v11, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

uint64_t __43__MTXPCConnectionProvider__retryConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

void __43__MTXPCConnectionProvider__retryConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  MTLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__MTXPCConnectionProvider__retryConnection__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
}

- (void)_retryConnectionWithRecover:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  -[MTXPCConnectionProvider _retryConnection](self, "_retryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke;
    v11[3] = &unk_1E39CBE58;
    v11[4] = self;
    objc_msgSend(v5, "recover:", v11);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_17;
  v10[3] = &unk_1E39CBE80;
  v10[4] = self;
  v9 = (id)objc_msgSend(v6, "addCompletionBlock:", v10);

}

id __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke(uint64_t a1)
{
  NSObject *v2;

  MTLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_retryConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "BOOLValue"))
  {
    MTLogForCategory(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_17_cold_1();

  }
  else
  {
    MTLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to reconnect.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "reconnectHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 48);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_18;
      v13[3] = &unk_1E39CB858;
      v13[4] = v10;
      objc_msgSend(v11, "performBlock:", v13);
    }
  }

}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_18(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "reconnectHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)performRemoteBlock:(id)a3
{
  -[MTXPCConnectionProvider performRemoteBlock:withErrorHandler:](self, "performRemoteBlock:withErrorHandler:", a3, 0);
}

- (id)_syncRemoteObjectProxyWithErrorHandler:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke;
  v4[3] = &unk_1E39CBED0;
  v4[4] = self;
  -[MTXPCConnectionProvider _remoteObjectProxyWithXPCConnectionProvider:remoteObjectProxyProvider:errorHandler:](self, "_remoteObjectProxyWithXPCConnectionProvider:remoteObjectProxyProvider:errorHandler:", v4, &__block_literal_global_22, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "synchronousRemoteObjectProxyWithErrorHandler:");
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  MTLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)invalidate
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  __CFString *v6;
  NSXPCConnection *connection;
  int v8;
  MTXPCConnectionProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", (uint8_t *)&v8, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[MTXPCConnectionProvider info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lifecycleNotification");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, self);

  os_unfair_lock_lock(&self->_connectionLock);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_connectionLock);
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)reconnectHandler
{
  return self->_reconnectHandler;
}

- (void)setReconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (void)setCallbackScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_callbackScheduler, a3);
}

- (NSDate)lastLifecycleNotification
{
  return self->_lastLifecycleNotification;
}

- (void)setLastLifecycleNotification:(id)a3
{
  objc_storeStrong((id *)&self->_lastLifecycleNotification, a3);
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLifecycleNotification, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
  objc_storeStrong(&self->_reconnectHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnectionInfo:(os_log_t)log errorHandler:reconnectHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "Connection info must be non-nil", v1, 2u);
}

void __43__MTXPCConnectionProvider__retryConnection__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "Failed to reconnect for provider %{public}@ with error %{public}@.");
  OUTLINED_FUNCTION_2();
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ retrying failed reconnect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ failed to reconnect too many times", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ expected non-nil proxy@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_19AC4E000, v0, v1, "%{public}@ expected non-nil connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_19AC4E000, v0, v1, "%{public}@ received a remote proxy error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
