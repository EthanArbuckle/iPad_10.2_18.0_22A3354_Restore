@implementation ARDaemonControl

+ (NSString)serviceName
{
  return (NSString *)(id)*MEMORY[0x24BDFD8E0];
}

- (ARDaemonControl)initWithConnection:(id)a3
{
  id v5;
  ARDaemonControl *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ARDaemonControl *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)ARDaemonControl;
    v6 = -[ARDaemonControl init](&v17, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "setExportedObject:", v6);
      objc_msgSend(MEMORY[0x24BDFD9A0], "controlInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExportedInterface:", v7);

      objc_msgSend(MEMORY[0x24BDFD9A0], "controlProxyInterface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v8);

      objc_initWeak(&location, v6);
      v9 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __38__ARDaemonControl_initWithConnection___block_invoke;
      v14[3] = &unk_2507025E8;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v5, "setInterruptionHandler:", v14);
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __38__ARDaemonControl_initWithConnection___block_invoke_2;
      v12[3] = &unk_2507025E8;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v5, "setInvalidationHandler:", v12);
      objc_storeStrong((id *)&v6->_connection, a3);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __38__ARDaemonControl_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");

}

void __38__ARDaemonControl_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidationHandler");

}

- (void)getStatusDictionaryWithReply:(id)a3
{
  -[ARDaemonControl getStatusDictionaryWithWaitEndOfTransition:reply:](self, "getStatusDictionaryWithWaitEndOfTransition:reply:", 0, a3);
}

- (void)getStatusWithVerboseOutput:(BOOL)a3 reply:(id)a4
{
  -[ARDaemonControl getStatusWithVerboseOutput:waitForEndOfTransaction:reply:](self, "getStatusWithVerboseOutput:waitForEndOfTransaction:reply:", a3, 0, a4);
}

- (void)getStatusDictionaryWithWaitEndOfTransition:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  ARServer **p_server;
  id WeakRetained;
  id v8;
  void *v9;
  void (**v10)(id, void *);

  v4 = a3;
  v10 = (void (**)(id, void *))a4;
  p_server = &self->_server;
  WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_server);
    objc_msgSend(v8, "statusDictionaryWithWaitEndOfTransition:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &unk_25070A1F8;
  }
  v10[2](v10, v9);

}

- (void)getStatusWithVerboseOutput:(BOOL)a3 waitForEndOfTransaction:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  ARServer **p_server;
  id WeakRetained;
  id v10;
  void *v11;
  __CFString *v12;
  void (**v13)(id, __CFString *);

  v5 = a4;
  v6 = a3;
  v13 = (void (**)(id, __CFString *))a5;
  p_server = &self->_server;
  WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_server);
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "fullDescriptionWithWaitEndOfTransition:", v5);
    else
      objc_msgSend(v10, "statusStringWithWaitEndOfTransition:", v5);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("server initializing");
  }
  v13[2](v13, v12);

}

- (void)interruptionHandler
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARDaemonControl *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control interrupted", (uint8_t *)&v6, 0x16u);

  }
}

- (void)invalidationHandler
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSXPCConnection *connection;
  int v7;
  void *v8;
  __int16 v9;
  ARDaemonControl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _ARLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_235C46000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control invalidated", (uint8_t *)&v7, 0x16u);

  }
  connection = self->_connection;
  self->_connection = 0;

}

- (ARServer)server
{
  return (ARServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
