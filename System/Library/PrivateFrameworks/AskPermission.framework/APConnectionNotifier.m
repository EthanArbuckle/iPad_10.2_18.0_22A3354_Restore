@implementation APConnectionNotifier

- (APConnectionNotifier)init
{
  APConnectionNotifier *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APConnectionNotifier;
  v2 = -[APConnectionNotifier init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AskPermission.APConnectionNotifier", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (ConnectionProtocol)remoteObjectProxy
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[APConnectionNotifier _remoteConnection](self, "_remoteConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__APConnectionNotifier_remoteObjectProxy__block_invoke;
  v6[3] = &unk_24DB1AE40;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (ConnectionProtocol *)v4;
}

void __41__APConnectionNotifier_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v3;
    v7 = v9;
    _os_log_impl(&dword_2195F6000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Remote object proxy error. Error:%{public}@", (uint8_t *)&v8, 0x16u);

  }
}

+ (APConnectionNotifier)sharedNotifier
{
  if (sharedNotifier_ap_once_token___COUNTER__ != -1)
    dispatch_once(&sharedNotifier_ap_once_token___COUNTER__, &__block_literal_global);
  return (APConnectionNotifier *)(id)sharedNotifier_ap_once_object___COUNTER__;
}

void __38__APConnectionNotifier_sharedNotifier__block_invoke()
{
  APConnectionNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(APConnectionNotifier);
  v1 = (void *)sharedNotifier_ap_once_object___COUNTER__;
  sharedNotifier_ap_once_object___COUNTER__ = (uint64_t)v0;

}

- (id)_remoteConnection
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[APConnectionNotifier underlyingRemoteConnection](self, "underlyingRemoteConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[APConnectionNotifier connectionQueue](self, "connectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__APConnectionNotifier__remoteConnection__block_invoke;
    block[3] = &unk_24DB1AE88;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  return -[APConnectionNotifier underlyingRemoteConnection](self, "underlyingRemoteConnection");
}

void __41__APConnectionNotifier__remoteConnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingRemoteConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_newRemoteConnection");
    objc_msgSend(*(id *)(a1 + 32), "setUnderlyingRemoteConnection:", v3);

  }
}

- (id)_newRemoteConnection
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[APConnectionNotifier connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v6 = v21;
    _os_log_impl(&dword_2195F6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating a remote connection", buf, 0xCu);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.askpermissiond"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550928A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44__APConnectionNotifier__newRemoteConnection__block_invoke;
  v17[3] = &unk_24DB1AEB0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v17);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __44__APConnectionNotifier__newRemoteConnection__block_invoke_78;
  v15[3] = &unk_24DB1AEB0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v15);
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    v13 = v12;
    _os_log_impl(&dword_2195F6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Resuming remote connection", buf, 0xCu);

  }
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v7;
}

void __44__APConnectionNotifier__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Remote connection invalidated", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "setUnderlyingRemoteConnection:", 0);

}

void __44__APConnectionNotifier__newRemoteConnection__block_invoke_78(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Remote connection interrupted", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "setUnderlyingRemoteConnection:", 0);

}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSXPCConnection)underlyingRemoteConnection
{
  return self->_underlyingRemoteConnection;
}

- (void)setUnderlyingRemoteConnection:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRemoteConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end
