@implementation ACCVoiceOverProvider

- (ACCVoiceOverProvider)initWithDelegate:(id)a3
{
  id v4;
  ACCVoiceOverProvider *v5;
  void *v6;
  uint64_t v7;
  NSString *providerUID;
  NSObject *v9;
  id v10;
  NSString *v11;
  NSXPCConnection *serverConnection;
  ACCVoiceOverXPCServerProtocol *remoteObject;
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
  v19.super_class = (Class)ACCVoiceOverProvider;
  v5 = -[ACCVoiceOverProvider init](&v19, sel_init);
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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_21C516000, v9, OS_LOG_TYPE_DEFAULT, "ACCVoiceOverProvider init, _providerUID=%@", buf, 0xCu);
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
    v17[2] = __41__ACCVoiceOverProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_24E050D10;
    objc_copyWeak(&v18, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.voiceover.availability-changed", v17);
    -[ACCVoiceOverProvider connectToServer](v5, "connectToServer");
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __41__ACCVoiceOverProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
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
    _os_log_impl(&dword_21C516000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  ACCVoiceOverXPCServerProtocol *remoteObject;
  NSMutableDictionary *accessories;
  objc_super v6;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCVoiceOverProvider serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ACCVoiceOverProvider setServerConnection:](self, "setServerConnection:", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACCVoiceOverProvider;
  -[ACCVoiceOverProvider dealloc](&v6, sel_dealloc);
}

- (void)connectToServer
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_21C516000, a3, (uint64_t)a3, "Call initConnection to remoteObject=%@", (uint8_t *)a2);

}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke(uint64_t a1)
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
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21C516000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "accessoryVoiceOverDetachAll");

}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_96(uint64_t a1)
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
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21C516000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_97(uint64_t a1, void *a2)
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
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
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
    _os_log_impl(&dword_21C516000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_21C516000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

}

void __39__ACCVoiceOverProvider_connectToServer__block_invoke_99(uint64_t a1, int a2)
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
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
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
    _os_log_impl(&dword_21C516000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)accessoryVoiceOverAttached:(id)a3
{
  id v4;
  uint64_t v5;
  ACCVoiceOverAccessory *v6;
  BOOL v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  ACCVoiceOverAccessory *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (ACCVoiceOverAccessory *)v5;
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      v11 = "accessoryVoiceOverAttached: accessory %@ (%@) already exists!";
LABEL_20:
      _os_log_impl(&dword_21C516000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v6 = -[ACCVoiceOverAccessory initWithAccessoryUID:]([ACCVoiceOverAccessory alloc], "initWithAccessoryUID:", v4);
    -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:", v6, v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceOver:accessoryAttached:", self, v4);

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      v11 = "accessoryVoiceOverAttached: accessory %@, accessory=%@";
      goto LABEL_20;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACCVoiceOverProvider accessoryVoiceOverAttached:].cold.1();

}

- (void)accessoryVoiceOverDetached:(id)a3
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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_21C516000, v9, OS_LOG_TYPE_INFO, "accessoryVoiceOverDetached: accessory %@, accessory=%@", (uint8_t *)&v16, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceOver:accessoryDetached:", self, v4);

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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_21C516000, v10, OS_LOG_TYPE_INFO, "accessoryVoiceOverDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v16, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCVoiceOverProvider accessoryVoiceOverDetached:].cold.1();

}

- (void)accessoryVoiceOverDetachAll
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_6(&dword_21C516000, a2, v3, "accessoryVoiceOverDetachAll: notify detach of %lu accessories!", (uint8_t *)&v4);
}

- (void)accessoryVoiceOver:(id)a3 setEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSMutableDictionary *v8;
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
  NSMutableDictionary *v21;
  id v22;
  id v23;
  NSMutableDictionary *accessories;
  int v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  NSMutableDictionary *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableDictionary *)v7;
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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v25 = 138412802;
      v26 = v6;
      v27 = 1024;
      v28 = v4;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_21C516000, v11, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, accessory=%@", (uint8_t *)&v25, 0x1Cu);
    }

    -[NSMutableDictionary setDesiredVoiceOverState:](v8, "setDesiredVoiceOverState:", v4);
    v14 = -[ACCVoiceOverProvider calculateDesiredState:](self, "calculateDesiredState:", v6);
    -[ACCVoiceOverProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOver:setEnabled:accessory:](v19, "voiceOver:setEnabled:accessory:", self, v14, v6);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v6;
        v27 = 1024;
        v28 = v4;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_21C516000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, delegate does not respond to selector %@", (uint8_t *)&v25, 0x1Cu);

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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v25 = 138412546;
      v26 = v6;
      v27 = 1024;
      v28 = v4;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setEnabled: %d, accessory does not exist!", (uint8_t *)&v25, 0x12u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      v25 = 138412802;
      v26 = v6;
      v27 = 1024;
      v28 = v4;
      v29 = 2112;
      v30 = accessories;
      _os_log_debug_impl(&dword_21C516000, v19, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ setEnabled: %d, accessory does not exist! _accessories=%@", (uint8_t *)&v25, 0x1Cu);
    }
  }

}

- (void)accessoryVoiceOver:(id)a3 setContext:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  NSMutableDictionary *v20;
  id v21;
  id v22;
  NSMutableDictionary *accessories;
  int v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  NSMutableDictionary *v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableDictionary *)v7;
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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v24 = 138412802;
      v25 = v6;
      v26 = 1024;
      v27 = v4;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_21C516000, v11, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext %d, accessory=%@", (uint8_t *)&v24, 0x1Cu);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOver:setContext:accessory:](v18, "voiceOver:setContext:accessory:", self, v4, v6);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v18 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v24 = 138412802;
        v25 = v6;
        v26 = 1024;
        v27 = v4;
        v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_21C516000, v18, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext: %d, delegate does not respond to selector %@", (uint8_t *)&v24, 0x1Cu);

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
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v6;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ setContext: %d, accessory does not exist!", (uint8_t *)&v24, 0x12u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      v24 = 138412802;
      v25 = v6;
      v26 = 1024;
      v27 = v4;
      v28 = 2112;
      v29 = accessories;
      _os_log_debug_impl(&dword_21C516000, v18, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ setContext: %d, accessory does not exist! _accessories=%@", (uint8_t *)&v24, 0x1Cu);
    }
  }

}

- (void)accessoryVoiceOver:(id)a3 performAction:(int)a4 parameters:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  NSMutableDictionary *v23;
  id v24;
  id v25;
  NSMutableDictionary *accessories;
  int v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSMutableDictionary *v34;
  uint64_t v35;

  v6 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableDictionary *)v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 0;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v27 = 138413058;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_21C516000, v14, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory=%@", (uint8_t *)&v27, 0x26u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = (void *)v17,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_opt_respondsToSelector(),
          v19,
          v18,
          (v20 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOver:performAction:parameters:accessory:](v21, "voiceOver:performAction:parameters:accessory:", self, v6, v9, v8);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v27 = 138413058;
        v28 = v8;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_21C516000, v21, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, delegate does not respond to selector %@", (uint8_t *)&v27, 0x26u);

      }
    }
  }
  else
  {
    if (v13)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v27 = 138412802;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_21C516000, v15, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory does not exist!", (uint8_t *)&v27, 0x1Cu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v21 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      v27 = 138413058;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = accessories;
      _os_log_debug_impl(&dword_21C516000, v21, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ performAction: %d parameters: %@, accessory does not exist! _accessories=%@", (uint8_t *)&v27, 0x26u);
    }
  }

}

- (void)accessoryVoiceOver:(id)a3 requestConfiguration:(int)a4 param:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  NSMutableDictionary *v23;
  id v24;
  id v25;
  NSMutableDictionary *accessories;
  int v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSMutableDictionary *v34;
  uint64_t v35;

  v6 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableDictionary *)v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 0;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v27 = 138413058;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_21C516000, v14, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory=%@", (uint8_t *)&v27, 0x26u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = (void *)v17,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_opt_respondsToSelector(),
          v19,
          v18,
          (v20 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOver:requestConfigure:value:accessory:](v21, "voiceOver:requestConfigure:value:accessory:", self, v6, v9, v8);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v27 = 138413058;
        v28 = v8;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_21C516000, v21, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, delegate does not respond to selector %@", (uint8_t *)&v27, 0x26u);

      }
    }
  }
  else
  {
    if (v13)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v27 = 138412802;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_21C516000, v15, OS_LOG_TYPE_INFO, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory does not exist!", (uint8_t *)&v27, 0x1Cu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v21 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      accessories = self->_accessories;
      v27 = 138413058;
      v28 = v8;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = accessories;
      _os_log_debug_impl(&dword_21C516000, v21, OS_LOG_TYPE_DEBUG, "accessoryVoiceOver: %@ requestConfiguration: %d param: %@, accessory does not exist! _accessories=%@", (uint8_t *)&v27, 0x26u);
    }
  }

}

- (void)accessoryVoiceOverStartInformationUpdate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = v4;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOverStartInformationUpdate:accessory:](v19, "voiceOverStartInformationUpdate:accessory:", self, v4);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v4;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_21C516000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);

      }
    }
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_21C516000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCVoiceOverProvider accessoryVoiceOverStartInformationUpdate:].cold.1();
  }

}

- (void)accessoryVoiceOverStopInformationUpdate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = v4;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOverStopInformationUpdate:accessory:](v19, "voiceOverStopInformationUpdate:accessory:", self, v4);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v4;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_21C516000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);

      }
    }
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_21C516000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCVoiceOverProvider accessoryVoiceOverStopInformationUpdate:].cold.1();
  }

}

- (void)accessoryVoiceOverStartCursorInformationUpdate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = v4;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOverStartCursorInformationUpdate:accessory:](v19, "voiceOverStartCursorInformationUpdate:accessory:", self, v4);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v4;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_21C516000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);

      }
    }
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_21C516000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCVoiceOverProvider accessoryVoiceOverStartCursorInformationUpdate:].cold.1();
  }

}

- (void)accessoryVoiceOverStopCursorInformationUpdate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = v4;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate %@", (uint8_t *)&v24, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21C516000, v12, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory=%@", (uint8_t *)&v24, 0x16u);
    }

    -[ACCVoiceOverProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[ACCVoiceOverProvider delegate](self, "delegate"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_opt_respondsToSelector(),
          v17,
          v16,
          (v18 & 1) != 0))
    {
      -[ACCVoiceOverProvider delegate](self, "delegate");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject voiceOverStopCursorInformationUpdate:accessory:](v19, "voiceOverStopCursorInformationUpdate:accessory:", self, v4);
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
          -[ACCVoiceOverProvider initWithDelegate:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[ACCVoiceOverProvider delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v4;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_21C516000, v19, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, delegate does not respond to selector %@", (uint8_t *)&v24, 0x16u);

      }
    }
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_21C516000, v13, OS_LOG_TYPE_INFO, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory does not exist!", (uint8_t *)&v24, 0xCu);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v19 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ACCVoiceOverProvider accessoryVoiceOverStopCursorInformationUpdate:].cold.1();
  }

}

- (void)updateVoiceOverInfo:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *providerUID;
  ACCVoiceOverXPCServerProtocol *remoteObject;
  ACCVoiceOverXPCServerProtocol *v10;
  NSObject *v11;
  id v12;
  NSString *v13;
  int v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  ACCVoiceOverXPCServerProtocol *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    remoteObject = self->_remoteObject;
    v14 = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = providerUID;
    v18 = 2112;
    v19 = remoteObject;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "updateVoiceOverInfo: %@, _providerUID=%@ _remoteObject=%@", (uint8_t *)&v14, 0x20u);
  }

  v10 = self->_remoteObject;
  if (v10)
  {
    -[ACCVoiceOverXPCServerProtocol update:info:](v10, "update:info:", self->_providerUID, v4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_providerUID;
      v14 = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_21C516000, v11, OS_LOG_TYPE_DEFAULT, "updateVoiceOverInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (void)updateVoiceOverCursorInfo:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSString *providerUID;
  ACCVoiceOverXPCServerProtocol *remoteObject;
  ACCVoiceOverXPCServerProtocol *v10;
  NSObject *v11;
  id v12;
  NSString *v13;
  int v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  ACCVoiceOverXPCServerProtocol *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCVoiceOverProvider initWithDelegate:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    providerUID = self->_providerUID;
    remoteObject = self->_remoteObject;
    v14 = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = providerUID;
    v18 = 2112;
    v19 = remoteObject;
    _os_log_impl(&dword_21C516000, v7, OS_LOG_TYPE_INFO, "updateVoiceOverCursorInfo: %@, _providerUID=%@ _remoteObject=%@", (uint8_t *)&v14, 0x20u);
  }

  v10 = self->_remoteObject;
  if (v10)
  {
    -[ACCVoiceOverXPCServerProtocol update:cursorInfo:](v10, "update:cursorInfo:", self->_providerUID, v4);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCVoiceOverProvider initWithDelegate:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_providerUID;
      v14 = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_21C516000, v11, OS_LOG_TYPE_DEFAULT, "updateVoiceOverCursorInfo: %@, _remoteObject nil _providerUID=%@", (uint8_t *)&v14, 0x16u);
    }

  }
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
    v5 = objc_msgSend(v3, "desiredVoiceOverState");
  else
    v5 = 0;

  return v5;
}

- (ACCVoiceOverProviderProtocol)delegate
{
  return (ACCVoiceOverProviderProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (ACCVoiceOverXPCServerProtocol)remoteObject
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
  OUTLINED_FUNCTION_1(&dword_21C516000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverAttached:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverAttached: accessory %@ _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverDetached:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverDetached: accessory %@ _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverStartInformationUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverStartInformationUpdate: %@, accessory does not exist! _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverStopInformationUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverStopInformationUpdate: %@, accessory does not exist! _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverStartCursorInformationUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverStartCursorInformationUpdate: %@, accessory does not exist! _accessories=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryVoiceOverStopCursorInformationUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21C516000, v0, v1, "accessoryVoiceOverStopCursorInformationUpdate: %@, accessory does not exist! _accessories=%@");
  OUTLINED_FUNCTION_2();
}

@end
