@implementation CAMOverlayServiceConnection

- (CAMOverlayServiceConnection)initWithClient:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CAMOverlayServiceConnection *v8;
  CAMOverlayServiceConnection *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *connectionQueue;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v19[16];
  _QWORD v20[4];
  id v21;
  CAMOverlayServiceConnection *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CAMOverlayServiceConnection;
  v8 = -[CAMOverlayServiceConnection init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_client, v6);
    objc_storeStrong((id *)&v9->_clientQueue, a4);
    v9->_status = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.camera.overlay-connection", v10);
    connectionQueue = v9->__connectionQueue;
    v9->__connectionQueue = (OS_dispatch_queue *)v11;

    +[CAMOverlayServiceSpecification machName](CAMOverlayServiceSpecification, "machName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMOverlayServiceSpecification identifier](CAMOverlayServiceSpecification, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0FA08], "endpointForMachName:service:instance:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:clientContextBuilder:", v15, &__block_literal_global_1);
      v16 = objc_claimAutoreleasedReturnValue();
      -[CAMOverlayServiceConnection _setServerConnection:](v9, "_setServerConnection:", v16);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_2;
      v20[3] = &unk_2508F8EB8;
      v21 = v13;
      v22 = v9;
      -[NSObject configureConnection:](v16, "configureConnection:", v20);
      v17 = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_237707000, v17, OS_LOG_TYPE_DEFAULT, "Activating new overlay service connection", v19, 2u);
      }

      -[NSObject activate](v16, "activate");
    }
    else
    {
      v16 = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CAMOverlayServiceConnection initWithClient:queue:].cold.1((uint64_t)v13, (uint64_t)v14, v16);
    }

  }
  return v9;
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = a2;
  objc_msgSend(v2, "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMOverlayServiceSpecification identifierKey](CAMOverlayServiceSpecification, "identifierKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, v5);

}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = a2;
  objc_msgSend(v3, "setName:", *(_QWORD *)(a1 + 32));
  +[CAMOverlayServiceSpecification interface](CAMOverlayServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[CAMOverlayServiceSpecification serviceQuality](CAMOverlayServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_3;
  v11[3] = &unk_2508F8E90;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_4;
  v9[3] = &unk_2508F8E90;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_5;
  v7[3] = &unk_2508F8E90;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleActivatedConnection:", v3);

}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleInterruptedConnection:", v3);

}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleInvalidatedConnection:", v3);

}

- (void)dealloc
{
  BSServiceConnection *serverConnection;
  objc_super v4;

  -[BSServiceConnection invalidate](self->__serverConnection, "invalidate");
  serverConnection = self->__serverConnection;
  self->__serverConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServiceConnection;
  -[CAMOverlayServiceConnection dealloc](&v4, sel_dealloc);
}

- (void)_updateStatusWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CAMOverlayServiceConnection _serverConnection](self, "_serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAMOverlayServiceConnection _serverProxy](self, "_serverProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
    v8 = v6 != 0;
  }
  else
  {
    v7 = 0;
    v8 = 2;
  }
  if (v8 != -[CAMOverlayServiceConnection status](self, "status"))
  {
    v9 = os_log_create("com.apple.camera.overlay", "Client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = off_2508F8F50[v8];
      if (a3 > 2)
        v11 = 0;
      else
        v11 = off_2508F8F68[a3];
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_237707000, v9, OS_LOG_TYPE_DEFAULT, "Overlay service connection became %{public}@ for reason %{public}@", (uint8_t *)&v15, 0x16u);
    }

    -[CAMOverlayServiceConnection _setStatus:](self, "_setStatus:", v8);
    if (!v7)
    {
      if (-[CAMOverlayServiceConnection _lastKnownOverlayVisibility](self, "_lastKnownOverlayVisibility"))
      {
        -[CAMOverlayServiceConnection client](self, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cameraOverlayConnection:didChangeOverlayVisible:", self, 0);

      }
      if (-[CAMOverlayServiceConnection _lastKnownOverlayInterfaceReduced](self, "_lastKnownOverlayInterfaceReduced"))
      {
        -[CAMOverlayServiceConnection client](self, "client");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cameraOverlayConnection:didChangeInterfaceReduced:", self, 0);

      }
    }
    if (a3 != 1)
    {
      -[CAMOverlayServiceConnection client](self, "client");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cameraOverlayConnection:didChangeStatus:", self, v8);

    }
  }
}

- (void)invalidate
{
  -[CAMOverlayServiceConnection invalidateWithReason:](self, "invalidateWithReason:", 1);
}

- (void)invalidateWithReason:(unint64_t)a3
{
  void *v5;

  -[CAMOverlayServiceConnection _serverConnection](self, "_serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[CAMOverlayServiceConnection _setServerConnection:](self, "_setServerConnection:", 0);
  -[CAMOverlayServiceConnection _setServerProxy:](self, "_setServerProxy:", 0);
  -[CAMOverlayServiceConnection _updateStatusWithReason:](self, "_updateStatusWithReason:", a3);
}

- (void)configureWithControls:(id)a3 initialUpdates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  CAMOverlayErrorForStatus(-[CAMOverlayServiceConnection status](self, "status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.camera.overlay", "Client");
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CAMOverlayServiceConnection configureWithControls:initialUpdates:completion:].cold.1((uint64_t)v11, v13);

    v10[2](v10, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_237707000, v13, OS_LOG_TYPE_DEFAULT, "Sending overlay %lu control(s)", (uint8_t *)&v15, 0xCu);
    }

    -[CAMOverlayServiceConnection _serverProxy](self, "_serverProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientDidConfigureControls:initialUpdates:reply:", v8, v9, v10);

    v10 = (void (**)(id, void *))v14;
  }

}

- (void)applyControlUpdate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  CAMOverlayErrorForStatus(-[CAMOverlayServiceConnection status](self, "status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.camera.overlay", "Client");
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMOverlayServiceConnection applyControlUpdate:completion:].cold.2(v6, (uint64_t)v8, v10);

    v7[2](v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CAMOverlayServiceConnection applyControlUpdate:completion:].cold.1(v6, v10);

    -[CAMOverlayServiceConnection _serverProxy](self, "_serverProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientDidUpdateControl:reply:", v6, v7);

    v7 = (void (**)(id, void *))v11;
  }

}

- (void)_handleActivatedConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CAMOverlayServiceConnection__handleActivatedConnection___block_invoke;
  v7[3] = &unk_2508F8EE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__CAMOverlayServiceConnection__handleActivatedConnection___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setServerProxy:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

- (void)_handleInterruptedConnection:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CAMOverlayServiceConnection__handleInterruptedConnection___block_invoke;
  block[3] = &unk_2508F8E40;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __60__CAMOverlayServiceConnection__handleInterruptedConnection___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_setServerProxy:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

- (void)_handleInvalidatedConnection:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CAMOverlayServiceConnection__handleInvalidatedConnection___block_invoke;
  block[3] = &unk_2508F8E40;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __60__CAMOverlayServiceConnection__handleInvalidatedConnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setServerProxy:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setServerConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

- (void)serverDidChangeOverlayVisible:(id)a3 activeControlIdentifier:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  v8 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v7)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_237707000, v8, OS_LOG_TYPE_DEFAULT, "Received overlay visibility %{public}@ for control ID %{public}@", buf, 0x16u);
  }

  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CAMOverlayServiceConnection_serverDidChangeOverlayVisible_activeControlIdentifier___block_invoke;
  block[3] = &unk_2508F8F08;
  v14 = v7;
  block[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(v10, block);

}

void __85__CAMOverlayServiceConnection_serverDidChangeOverlayVisible_activeControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_setLastKnownOverlayVisibility:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "cameraOverlayConnection:didChangeOverlayVisible:activeControlIdentifier:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "client");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraOverlayConnection:didChangeOverlayVisible:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  }

}

- (void)serverDidChangeActiveControlIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_237707000, v5, OS_LOG_TYPE_DEFAULT, "Received active control ID %{public}@", buf, 0xCu);
  }

  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CAMOverlayServiceConnection_serverDidChangeActiveControlIdentifier___block_invoke;
  v8[3] = &unk_2508F8EE0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __70__CAMOverlayServiceConnection_serverDidChangeActiveControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cameraOverlayConnection:didChangeActiveControlIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)didChangeInterfaceReduced:(id)a3
{
  int v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  _QWORD v8[5];
  char v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "BOOLValue");
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_237707000, v5, OS_LOG_TYPE_DEFAULT, "Received overlay interfaceReduced %{public}@", buf, 0xCu);
  }

  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__CAMOverlayServiceConnection_didChangeInterfaceReduced___block_invoke;
  v8[3] = &unk_2508F8F30;
  v8[4] = self;
  v9 = v4;
  dispatch_async(v7, v8);

}

void __57__CAMOverlayServiceConnection_didChangeInterfaceReduced___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setLastKnownOverlayInterfaceReduced:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraOverlayConnection:didChangeInterfaceReduced:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)serverDidUpdateControl:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controlIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_237707000, v5, OS_LOG_TYPE_DEFAULT, "Received overlay update %{public}@ for ID %{public}@", buf, 0x16u);

  }
  -[CAMOverlayServiceConnection clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__CAMOverlayServiceConnection_serverDidUpdateControl___block_invoke;
  v10[3] = &unk_2508F8EE0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

void __54__CAMOverlayServiceConnection_serverDidUpdateControl___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraOverlayConnection:didApplyControlUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (CAMOverlayServiceConnectionClient)client
{
  return (CAMOverlayServiceConnectionClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)_setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BSServiceConnection)_serverConnection
{
  return self->__serverConnection;
}

- (void)_setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->__serverConnection, a3);
}

- (CAMOverlayServerInterface)_serverProxy
{
  return self->__serverProxy;
}

- (void)_setServerProxy:(id)a3
{
  objc_storeStrong((id *)&self->__serverProxy, a3);
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (BOOL)_lastKnownOverlayVisibility
{
  return self->__lastKnownOverlayVisibility;
}

- (void)_setLastKnownOverlayVisibility:(BOOL)a3
{
  self->__lastKnownOverlayVisibility = a3;
}

- (BOOL)_lastKnownOverlayInterfaceReduced
{
  return self->__lastKnownOverlayInterfaceReduced;
}

- (void)_setLastKnownOverlayInterfaceReduced:(BOOL)a3
{
  self->__lastKnownOverlayInterfaceReduced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connectionQueue, 0);
  objc_storeStrong((id *)&self->__serverProxy, 0);
  objc_storeStrong((id *)&self->__serverConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_client);
}

- (void)initWithClient:(os_log_t)log queue:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_237707000, log, OS_LOG_TYPE_ERROR, "Lookup failed for machName/service %{public}@/%{public}@.", (uint8_t *)&v3, 0x16u);
}

- (void)configureWithControls:(uint64_t)a1 initialUpdates:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_237707000, a2, OS_LOG_TYPE_ERROR, "Not sending overlay controls: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)applyControlUpdate:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "controlIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_237707000, a2, OS_LOG_TYPE_DEBUG, "Sending overlay value %{public}@ for ID %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)applyControlUpdate:(NSObject *)a3 completion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "controlIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl(&dword_237707000, a3, OS_LOG_TYPE_ERROR, "Not sending overlay value %{public}@ for ID %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
