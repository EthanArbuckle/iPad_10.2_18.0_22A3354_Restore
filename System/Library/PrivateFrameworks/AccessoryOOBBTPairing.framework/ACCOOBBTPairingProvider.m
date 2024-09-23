@implementation ACCOOBBTPairingProvider

- (ACCOOBBTPairingProvider)initWithDelegate:(id)a3
{
  id v4;
  ACCOOBBTPairingProvider *v5;
  void *v6;
  uint64_t v7;
  NSString *providerUID;
  NSObject *v9;
  id v10;
  NSString *v11;
  NSXPCConnection *serverConnection;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSMutableDictionary *v14;
  NSMutableDictionary *accessories;
  _QWORD v17[4];
  id v18;
  objc_super v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  init_logging();
  v19.receiver = self;
  v19.super_class = (Class)ACCOOBBTPairingProvider;
  v5 = -[ACCOOBBTPairingProvider init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    providerUID = v5->_providerUID;
    v5->_providerUID = (NSString *)v7;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_21AD3D000, v9, OS_LOG_TYPE_DEFAULT, "ACCOOBBTPairingProvider init, _providerUID=%@", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v5->_serverConnection;
    v5->_serverConnection = 0;

    remoteObject = v5->_remoteObject;
    v5->_remoteObject = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessories = v5->_accessories;
    v5->_accessories = v14;

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __44__ACCOOBBTPairingProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_24DDFEFE0;
    objc_copyWeak(&v18, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.oobbtpairing.availability-changed", v17);
    -[ACCOOBBTPairingProvider connectToServer](v5, "connectToServer");
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __44__ACCOOBBTPairingProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
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
    _os_log_impl(&dword_21AD3D000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21AD3D000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSMutableDictionary *accessories;
  objc_super v6;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCOOBBTPairingProvider serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ACCOOBBTPairingProvider setServerConnection:](self, "setServerConnection:", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCOOBBTPairingProvider;
  -[ACCOOBBTPairingProvider dealloc](&v6, sel_dealloc);
}

- (void)connectToServer
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_21AD3D000, a3, (uint64_t)a3, "Call initConnection to remoteObject=%@", (uint8_t *)a2);

}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke(uint64_t a1)
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
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21AD3D000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "accessoryOOBBTPairingDetachAll");

}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_92(uint64_t a1)
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
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21AD3D000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_93(uint64_t a1, void *a2)
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
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
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
    _os_log_impl(&dword_21AD3D000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_21AD3D000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

}

void __42__ACCOOBBTPairingProvider_connectToServer__block_invoke_95(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_21AD3D000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v13, 8u);
  }

  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "remoteObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v7);
    objc_msgSend(v11, "providerUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifyOfProvider:", v12);

  }
  else
  {
    objc_msgSend(WeakRetained, "serverConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");
  }

}

- (void)accessoryOOBBTPairingAttached:(id)a3 accInfoDict:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  ACCOOBBTPairingAccessory *v9;
  BOOL v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  ACCOOBBTPairingAccessory *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (ACCOOBBTPairingAccessory *)v8;
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v13 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_21AD3D000, v13, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingAttached: accessory %@ (%@) already exists!", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v9 = -[ACCOOBBTPairingAccessory initWithAccessoryUID:]([ACCOOBBTPairingAccessory alloc], "initWithAccessoryUID:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:", v9, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "oobBtPairing:accessoryAttached:accInfoDict:", self, v6, v7);

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[ACCOOBBTPairingProvider accessoryInfoDictionaryForLogging:](self, "accessoryInfoDictionaryForLogging:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_21AD3D000, v13, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingAttached: accessory %@, accessory=%@ accInfoDict=%@", (uint8_t *)&v18, 0x20u);

    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ACCOOBBTPairingProvider accessoryOOBBTPairingAttached:accInfoDict:].cold.1();

}

- (void)accessoryOOBBTPairingDetached:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_21AD3D000, v9, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingDetached: accessory %@, accessory=%@", (uint8_t *)&v16, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "oobBtPairing:accessoryDetached:", self, v4);

    -[NSMutableDictionary removeObjectForKey:](self->_accessories, "removeObjectForKey:", v4);
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
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_21AD3D000, v10, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v16, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCOOBBTPairingProvider accessoryOOBBTPairingDetached:].cold.1();

}

- (void)accessoryOOBBTPairingDetachAll
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5(&dword_21AD3D000, a2, v3, "accessoryOOBBTPairingDetachAll: notify detach of %lu accessories!", (uint8_t *)&v4);
}

- (void)accessoryOOBBTPairingBTAccessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  NSObject *WeakRetained;
  id v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v6 = *(_QWORD *)&a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (gLogObjects)
    v15 = gNumLogObjects <= 0;
  else
    v15 = 1;
  v16 = !v15;
  if (v13)
  {
    if (v16)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 138413314;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 1024;
      v28 = v6;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21AD3D000, v17, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingBTAccessoryInfo: accessory %@, oobBtPairingUID %@ accessoryMacAddr %@ deviceClass=%d, accessory=%@", (uint8_t *)&v21, 0x30u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject oobBtPairing:accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:](WeakRetained, "oobBtPairing:accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:", self, v10, v11, v12, v6);
  }
  else
  {
    if (v16)
    {
      WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      WeakRetained = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      v21 = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = 0;
      _os_log_impl(&dword_21AD3D000, WeakRetained, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingBTAccessoryInfo: accessory %@ (%@) does not exist!", (uint8_t *)&v21, 0x16u);
    }
  }

}

- (void)accessoryOOBBTPairingCompletionStatus:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 result:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  NSObject *WeakRetained;
  id v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (gLogObjects)
    v15 = gNumLogObjects <= 0;
  else
    v15 = 1;
  v16 = !v15;
  if (v13)
  {
    if (v16)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 138413314;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 1024;
      v28 = v6;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_21AD3D000, v17, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingCompletionStatus: accessory %@, oobBtPairingUID %@, accessoryMacAddr %@, result=%d, accessory=%@", (uint8_t *)&v21, 0x30u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject oobBtPairing:completion:oobBtPairingUID:accessoryMacAddr:result:](WeakRetained, "oobBtPairing:completion:oobBtPairingUID:accessoryMacAddr:result:", self, v10, v11, v12, v6);
  }
  else
  {
    if (v16)
    {
      WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      WeakRetained = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      v21 = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = 0;
      _os_log_impl(&dword_21AD3D000, WeakRetained, OS_LOG_TYPE_INFO, "accessoryOOBBTPairingCompletionStatus: accessory %@ (%@) does not exist!", (uint8_t *)&v21, 0x16u);
    }
  }

}

- (void)startOOBBTPairing:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSObject *v9;
  id v10;
  NSString *providerUID;
  int v12;
  id v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21AD3D000, v7, OS_LOG_TYPE_INFO, "startOOBBTPairing: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCOOBBTPairingXPCServerProtocol startOOBBTPairing:](remoteObject, "startOOBBTPairing:", v4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = providerUID;
      _os_log_impl(&dword_21AD3D000, v9, OS_LOG_TYPE_DEFAULT, "startOOBBTPairing: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)stopOOBBTPairing:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSObject *v9;
  id v10;
  NSString *providerUID;
  int v12;
  id v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21AD3D000, v7, OS_LOG_TYPE_INFO, "stopOOBBTPairing: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCOOBBTPairingXPCServerProtocol stopOOBBTPairing:](remoteObject, "stopOOBBTPairing:", v4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = providerUID;
      _os_log_impl(&dword_21AD3D000, v9, OS_LOG_TYPE_DEFAULT, "stopOOBBTPairing: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)linkKeyInfo:(id)a3 oobBtPairingUID:(id)a4 linkKey:(id)a5 deviceMacAddr:(id)a6
{
  id v10;
  NSString *v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSObject *v18;
  id v19;
  NSString *providerUID;
  int v21;
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (NSString *)a4;
  v12 = a5;
  v13 = a6;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v21 = 138413058;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2048;
    v26 = objc_msgSend(v12, "length");
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_21AD3D000, v16, OS_LOG_TYPE_INFO, "linkKeyInfo: %@ oobBtPairingUID: %@ linkKey:len=%lu deviceMacAddr: %@", (uint8_t *)&v21, 0x2Au);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCOOBBTPairingXPCServerProtocol linkKeyInfo:oobBtPairingUID:linkKey:deviceMacAddr:](remoteObject, "linkKeyInfo:oobBtPairingUID:linkKey:deviceMacAddr:", v10, v11, v12, v13);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v21 = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = providerUID;
      _os_log_impl(&dword_21AD3D000, v18, OS_LOG_TYPE_DEFAULT, "linkKeyInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }

  }
}

- (void)requestLegacyConnectionIDForAccessoryUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCOOBBTPairingXPCServerProtocol *remoteObject;
  NSObject *v9;
  id v10;
  NSString *providerUID;
  int v12;
  id v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21AD3D000, v7, OS_LOG_TYPE_INFO, "requestLegacyConnectionIDForAccessoryUID: %@", (uint8_t *)&v12, 0xCu);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCOOBBTPairingXPCServerProtocol requestLegacyConnectionIDForAccessoryUID:](remoteObject, "requestLegacyConnectionIDForAccessoryUID:", v4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = providerUID;
      _os_log_impl(&dword_21AD3D000, v9, OS_LOG_TYPE_DEFAULT, "requestLegacyConnectionIDForAccessoryUID: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)legacyConnectionIDForAccessoryUID:(id)a3 connectionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *WeakRetained;
  id v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  _WORD v18[17];

  v4 = *(_QWORD *)&a4;
  *(_QWORD *)&v18[13] = *MEMORY[0x24BDAC8D0];
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
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = v6;
      v17 = 1024;
      *(_DWORD *)v18 = v4;
      v18[2] = 2112;
      *(_QWORD *)&v18[3] = v8;
      _os_log_impl(&dword_21AD3D000, v11, OS_LOG_TYPE_INFO, "legacyConnectionIDForAccessoryUID: accessory %@, connectionID=%u, accessory=%@", (uint8_t *)&v15, 0x1Cu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject oobBtPairing:legacyConnectionIDForAccessoryUID:connectionID:](WeakRetained, "oobBtPairing:legacyConnectionIDForAccessoryUID:connectionID:", self, v6, v4);
  }
  else
  {
    if (v10)
    {
      WeakRetained = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingProvider initWithDelegate:].cold.1();
      WeakRetained = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      *(_QWORD *)v18 = 0;
      _os_log_impl(&dword_21AD3D000, WeakRetained, OS_LOG_TYPE_INFO, "legacyConnectionIDForAccessoryUID: accessory %@ (%@) does not exist!", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (id)accessoryInfoDictionaryForLogging:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCOOBBTPairingCertData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("ACCOOBBTPairingCertData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu bytes"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ACCOOBBTPairingCertData"));

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("ACCOOBBTPairingCertSerial"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("ACCOOBBTPairingCertSerial"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu bytes"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ACCOOBBTPairingCertSerial"));

  }
  return v3;
}

- (ACCOOBBTPairingProviderProtocol)delegate
{
  return (ACCOOBBTPairingProviderProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
  objc_storeStrong((id *)&self->_providerUID, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (ACCOOBBTPairingXPCServerProtocol)remoteObject
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21AD3D000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)accessoryOOBBTPairingAttached:accInfoDict:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21AD3D000, v0, v1, "accessoryOOBBTPairingAttached: accessory %@, _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryOOBBTPairingDetached:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21AD3D000, v0, v1, "accessoryOOBBTPairingDetached: accessory %@, _accessories=%@");
  OUTLINED_FUNCTION_2();
}

@end
