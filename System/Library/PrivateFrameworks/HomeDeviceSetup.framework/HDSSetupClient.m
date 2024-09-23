@implementation HDSSetupClient

- (HDSSetupClient)init
{
  HDSSetupClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDSSetupClient;
  v2 = -[HDSSetupClient init](&v6, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HDSSetupClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_24FCD41B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __41__HDSSetupClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = (void (**)(id, _QWORD))a3;
  if (gLogCategory_HDSSetupClient <= 30
    && (gLogCategory_HDSSetupClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.hpsetup.xpc"), 4096);
  objc_msgSend(v5, "_setQueue:", MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E16C00);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E16C60);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  -[HDSSetupClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v8);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__HDSSetupClient__activateWithCompletion___block_invoke;
  v12[3] = &unk_24FCD47C8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __42__HDSSetupClient__activateWithCompletion___block_invoke_2;
  v10[3] = &unk_24FCD47C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_msgSend(v5, "resume");
  objc_storeStrong((id *)&self->_connection, v5);
  if (v4)
    v4[2](v4, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __42__HDSSetupClient__activateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (gLogCategory_HDSSetupClient <= 90)
  {
    v5 = WeakRetained;
    if (gLogCategory_HDSSetupClient != -1 || (v3 = _LogCategory_Initialize(), v2 = v5, v3))
    {
      objc_msgSend(v2, "connection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = v5;
    }
  }

}

void __42__HDSSetupClient__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (gLogCategory_HDSSetupClient <= 90)
  {
    v5 = WeakRetained;
    if (gLogCategory_HDSSetupClient != -1 || (v3 = _LogCategory_Initialize(), v2 = v5, v3))
    {
      objc_msgSend(v2, "connection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = v5;
    }
  }

}

- (void)invalidate
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)startAdvertisingWithCompletion:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (gLogCategory_HDSSetupClient <= 30)
  {
    if (gLogCategory_HDSSetupClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      LogPrintF();
      v4 = v8;
    }
  }
  if (v4)
  {
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAdvertisingWithCompletion:", v8);

LABEL_7:
    v4 = v8;
    goto LABEL_12;
  }
  if (gLogCategory_HDSSetupClient <= 90)
  {
    if (gLogCategory_HDSSetupClient != -1 || (v7 = _LogCategory_Initialize(), v4 = v8, v7))
    {
      LogPrintF();
      goto LABEL_7;
    }
  }
LABEL_12:

}

- (SetupEngineDelegate)delegate
{
  return (SetupEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
