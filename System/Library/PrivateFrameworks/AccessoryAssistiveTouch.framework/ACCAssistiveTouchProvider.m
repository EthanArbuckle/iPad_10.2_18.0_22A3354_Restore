@implementation ACCAssistiveTouchProvider

- (ACCAssistiveTouchProvider)initWithDelegate:(id)a3 initialState:(BOOL)a4
{
  id v7;
  ACCAssistiveTouchProvider *v8;
  void *v9;
  uint64_t v10;
  NSString *providerUID;
  NSXPCConnection *serverConnection;
  ACCAssistiveTouchXPCServerProtocol *remoteObject;
  NSMutableDictionary *v14;
  NSMutableDictionary *accessories;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, int);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v7 = a3;
  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCAssistiveTouchProvider;
  v8 = -[ACCAssistiveTouchProvider init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    providerUID = v8->_providerUID;
    v8->_providerUID = (NSString *)v10;

    objc_storeStrong((id *)&v8->_delegate, a3);
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    v8->_cachedState = a4;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessories = v8->_accessories;
    v8->_accessories = v14;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke;
    v20 = &unk_24DDBDE38;
    objc_copyWeak(&v21, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.assistivetouch.availability-changed", &v17);
    -[ACCAssistiveTouchProvider connectToServer](v8, "connectToServer", v17, v18, v19, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_21ABD2000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21ABD2000, v7, OS_LOG_TYPE_DEFAULT, "assistiveTouch Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  NSMutableDictionary *accessories;
  objc_super v5;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCAssistiveTouchProvider serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  accessories = self->_accessories;
  self->_accessories = 0;

  v5.receiver = self;
  v5.super_class = (Class)ACCAssistiveTouchProvider;
  -[ACCAssistiveTouchProvider dealloc](&v5, sel_dealloc);
}

- (void)connectToServer
{
  ACCAssistiveTouchProvider *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[8];

  v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailable())
  {
    -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        v4 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ABD2000, v4, OS_LOG_TYPE_DEFAULT, "assistiveTouch Connecting to XPC server...", buf, 2u);
      }

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.assistivetouch"), 4096);
      -[ACCAssistiveTouchProvider setServerConnection:](v2, "setServerConnection:", v6);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255111B78);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v7);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255111BD8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExportedInterface:", v9);

      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setExportedObject:", v2);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v12 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke;
      v26[3] = &unk_24DDBDE60;
      objc_copyWeak(&v27, (id *)buf);
      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInvalidationHandler:", v26);

      v24[0] = v12;
      v24[1] = 3221225472;
      v24[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_85;
      v24[3] = &unk_24DDBDE60;
      objc_copyWeak(&v25, (id *)buf);
      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInterruptionHandler:", v24);

      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resume");

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    -[ACCAssistiveTouchProvider remoteObject](v2, "remoteObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ABD2000, v17, OS_LOG_TYPE_DEFAULT, "assistiveTouch Getting remote object...", buf, 2u);
      }

      -[ACCAssistiveTouchProvider serverConnection](v2, "serverConnection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCAssistiveTouchProvider setRemoteObject:](v2, "setRemoteObject:", v20);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      -[ACCAssistiveTouchProvider remoteObject](v2, "remoteObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_88;
      v22[3] = &unk_24DDBDE38;
      objc_copyWeak(&v23, (id *)buf);
      objc_msgSend(v21, "initConnection:", v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  objc_sync_exit(v2);

}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t v9[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setRemoteObject:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21ABD2000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "accessoryAssistiveTouchDetachAll");

}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_85(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRemoteObject:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21ABD2000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection interrupted!", v8, 2u);
  }

}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_86(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21ABD2000, v5, OS_LOG_TYPE_DEFAULT, "assistiveTouch XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_21ABD2000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

}

void __44__ACCAssistiveTouchProvider_connectToServer__block_invoke_88(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_21ABD2000, v6, OS_LOG_TYPE_DEFAULT, "assistiveTouch shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)accessoryAssistiveTouchAttached:(id)a3
{
  id v4;
  NSMutableDictionary **p_accessories;
  NSMutableDictionary *accessories;
  uint64_t v7;
  ACCAssistiveTouchAccessory *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  ACCAssistiveTouchAccessory *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  -[NSMutableDictionary objectForKey:](accessories, "objectForKey:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (ACCAssistiveTouchAccessory *)v7;
    if (gLogObjects)
      v9 = gNumLogObjects < 1;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      v12 = "accessoryAssistiveTouchAttached: accessory %@ (%@) already exists!";
LABEL_20:
      _os_log_impl(&dword_21ABD2000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    v8 = -[ACCAssistiveTouchAccessory initWithAccessoryUID:]([ACCAssistiveTouchAccessory alloc], "initWithAccessoryUID:", v4);
    -[NSMutableDictionary setObject:forKey:](*p_accessories, "setObject:forKey:", v8, v4);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      v12 = "accessoryAssistiveTouchAttached: accessory %@, accessory=%@";
      goto LABEL_20;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCAssistiveTouchProvider accessoryAssistiveTouchAttached:].cold.1();

}

- (void)accessoryAssistiveTouchDetached:(id)a3
{
  id v4;
  NSMutableDictionary **p_accessories;
  NSMutableDictionary *accessories;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  -[NSMutableDictionary objectForKey:](accessories, "objectForKey:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_21ABD2000, v11, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetached: accessory %@, accessory=%@", (uint8_t *)&v17, 0x16u);
    }

    -[NSMutableDictionary removeObjectForKey:](*p_accessories, "removeObjectForKey:", v4);
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_21ABD2000, v12, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v17, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACCAssistiveTouchProvider accessoryAssistiveTouchDetached:].cold.1();

}

- (void)accessoryAssistiveTouchDetachAll
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *accessories;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[NSMutableDictionary count](self->_accessories, "count");
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_21ABD2000, v5, OS_LOG_TYPE_INFO, "accessoryAssistiveTouchDetachAll: detach %lu accessories!", (uint8_t *)&v9, 0xCu);
  }

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  accessories = self->_accessories;
  self->_accessories = v7;

}

- (void)setEnabled:(id)a3 flag:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v24 = 138412802;
      v25 = v6;
      v26 = 2112;
      v27 = v8;
      v28 = 1024;
      LODWORD(v29) = v4;
      _os_log_impl(&dword_21ABD2000, v11, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@, accessory=%@, flag=%d", (uint8_t *)&v24, 0x1Cu);
    }

    objc_msgSend(v8, "setDesiredAssistiveTouchState:", v4);
    v14 = -[ACCAssistiveTouchProvider calculateDesiredState:](self, "calculateDesiredState:", v6);
    -[ACCAssistiveTouchProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCAssistiveTouchProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCAssistiveTouchProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject assistiveTouch:setEnabled:](v19, "assistiveTouch:setEnabled:", self, v14);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCAssistiveTouchProvider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412802;
        v25 = v6;
        v26 = 2112;
        v27 = v8;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_21ABD2000, v19, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@ (%@) delegate does not respond to selector %@", (uint8_t *)&v24, 0x20u);

      }
    }
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v12 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = 0;
      _os_log_impl(&dword_21ABD2000, v12, OS_LOG_TYPE_INFO, "assistiveTouch setEnabled: accessory %@ (%@) does not exist!", (uint8_t *)&v24, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCAssistiveTouchProvider setEnabled:flag:].cold.1();
  }

}

- (void)requestState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (gLogObjects)
    v7 = gNumLogObjects <= 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v5)
  {
    if (v8)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21ABD2000, v9, OS_LOG_TYPE_INFO, "assistiveTouch requestState: accessory %@, accessory=%@", (uint8_t *)&v15, 0x16u);
    }

    -[ACCAssistiveTouchProvider notifyAssistiveTouchEnabledState:](self, "notifyAssistiveTouchEnabledState:", self->_cachedState);
  }
  else
  {
    if (v8)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = 0;
      _os_log_impl(&dword_21ABD2000, v10, OS_LOG_TYPE_INFO, "assistiveTouch requestState: accessory %@ (%@) does not exist!", (uint8_t *)&v15, 0x16u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ACCAssistiveTouchProvider requestState:].cold.1();

  }
}

- (void)notifyAssistiveTouchEnabledState:(BOOL)a3
{
  self->_cachedState = a3;
  if (self->_remoteObject)
    -[ACCAssistiveTouchXPCServerProtocol notifyEnabledState:provider:](self->_remoteObject, "notifyEnabledState:provider:");
}

- (BOOL)calculateDesiredState:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "desiredAssistiveTouchState");
  else
    v5 = 0;

  return v5;
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
  objc_storeStrong((id *)&self->_providerUID, a3);
}

- (ACCAssistiveTouchProviderProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (ACCAssistiveTouchXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (BOOL)cachedState
{
  return self->_cachedState;
}

- (void)setCachedState:(BOOL)a3
{
  self->_cachedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
}

void __59__ACCAssistiveTouchProvider_initWithDelegate_initialState___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21ABD2000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)accessoryAssistiveTouchAttached:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21ABD2000, v0, v1, "accessoryAssistiveTouchAttached: accessory %@ _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryAssistiveTouchDetached:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21ABD2000, v0, v1, "accessoryAssistiveTouchDetached: accessory %@ _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)setEnabled:flag:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_21ABD2000, v0, v1, "assistiveTouch setEnabled: accessory %@ (%@) does not exist! _accessories=%@");
}

- (void)requestState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_21ABD2000, v0, v1, "assistiveTouch requestState: accessory %@ (%@) does not exist! _accessories=%@");
}

@end
