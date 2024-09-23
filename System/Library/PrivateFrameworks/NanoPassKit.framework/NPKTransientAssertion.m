@implementation NPKTransientAssertion

- (NPKTransientAssertion)initWithQueue:(id)a3
{
  dispatch_queue_t v4;
  NPKTransientAssertion *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NPKTransientAssertion *v10;
  NPKTransientAssertion *v11;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v13;
  _QWORD v15[4];
  NPKTransientAssertion *v16;
  id v17;
  _QWORD v18[4];
  NPKTransientAssertion *v19;
  id v20;
  id location;
  objc_super v22;

  v4 = (dispatch_queue_t)a3;
  v22.receiver = self;
  v22.super_class = (Class)NPKTransientAssertion;
  v5 = -[NPKTransientAssertion init](&v22, sel_init);
  if (v5)
  {
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.NPKTransientPassServer"), 4096);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D60FD8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D22798);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v8);
    -[NSXPCConnection setExportedObject:](v6, "setExportedObject:", v5);
    objc_initWeak(&location, v5);
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __39__NPKTransientAssertion_initWithQueue___block_invoke;
    v18[3] = &unk_24CFE9F58;
    v10 = v5;
    v19 = v10;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v18);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __39__NPKTransientAssertion_initWithQueue___block_invoke_91;
    v15[3] = &unk_24CFE9F58;
    v11 = v10;
    v16 = v11;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v15);
    if (!v4)
      v4 = dispatch_queue_create("NPKTransientAssertionQueue", 0);
    -[NSXPCConnection _setQueue:](v6, "_setQueue:", v4);
    -[NSXPCConnection resume](v6, "resume");
    xpcConnection = v11->_xpcConnection;
    v11->_xpcConnection = v6;
    v13 = v6;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __39__NPKTransientAssertion_initWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient assertion connection interrupted", (uint8_t *)&v7, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resyncState");

}

void __39__NPKTransientAssertion_initWithQueue___block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient assertion connection invalidated", (uint8_t *)&v7, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

- (id)_remoteObjectProxy
{
  NSXPCConnection *xpcConnection;
  _QWORD v4[5];

  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__NPKTransientAssertion__remoteObjectProxy__block_invoke;
  v4[3] = &unk_24CFE79C0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__NPKTransientAssertion__remoteObjectProxy__block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = (id)objc_opt_class();
      v3 = v5;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_ERROR, "Error: %@: Couldn't get remote object proxy", (uint8_t *)&v4, 0xCu);

    }
  }
}

- (void)invalidate
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)handleDelegatedDoublePressEventWithSource:(unint64_t)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[NPKTransientAssertion handleDelegatedDoublePressEventWithSource:]";
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)handleTerminalAuthenticationRequestedForPassWithUniqueID:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[NPKTransientAssertion handleTerminalAuthenticationRequestedForPassWithUniqueID:]";
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)didEnterFieldForPassesWithUniqueIDs:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[NPKTransientAssertion didEnterFieldForPassesWithUniqueIDs:]";
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_resyncState
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[NPKTransientAssertion _resyncState]";
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
