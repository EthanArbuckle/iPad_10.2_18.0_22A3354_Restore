@implementation ACCExternalAccessoryProvider

- (void)connectToServer:(BOOL)a3
{
  _BOOL8 v3;
  ACCExternalAccessoryProvider *v4;
  void *v5;
  NSObject *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t v36[16];
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _BYTE buf[24];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (accessoryServer_isServerAvailable())
  {
    -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (gLogObjects && gNumLogObjects >= 3)
      {
        v6 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v6 = MEMORY[0x1E0C81028];
        v7 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("no");
        if (v3)
          v8 = CFSTR("yes");
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Connecting to EA XPC server...onInstantiation connection = %@", buf, 0xCu);
      }

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.externalaccessory-server"), 4096);
      -[ACCExternalAccessoryProvider setServerConnection:](v4, "setServerConnection:", v9);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4C030);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRemoteObjectInterface:", v10);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE49378);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExportedInterface:", v12);

      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setExportedObject:", v4);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v4);
      v15 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke;
      v39[3] = &unk_1E5FB2CE0;
      objc_copyWeak(&v40, (id *)buf);
      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInvalidationHandler:", v39);

      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_196;
      v37[3] = &unk_1E5FB2CE0;
      objc_copyWeak(&v38, (id *)buf);
      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setInterruptionHandler:", v37);

      if (gLogObjects && gNumLogObjects >= 3)
      {
        v18 = *(id *)(gLogObjects + 16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1AF649000, v18, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] resuming EA XPC connection", v36, 2u);
      }

      -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "resume");

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
    }
  }
  if (gLogObjects)
    v21 = gNumLogObjects < 3;
  else
    v21 = 1;
  if (v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v23 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  else
  {
    v23 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCExternalAccessoryProvider remoteObject](v4, "remoteObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v24;
    _os_log_impl(&dword_1AF649000, v23, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] self.remoteObject = %@", buf, 0xCu);

  }
  -[ACCExternalAccessoryProvider remoteObject](v4, "remoteObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v26)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v27 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v27, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Getting remote object...", buf, 2u);
    }

    -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCExternalAccessoryProvider setRemoteObject:](v4, "setRemoteObject:", v30);

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v4);
    -[ACCExternalAccessoryProvider serverConnection](v4, "serverConnection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_200);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCExternalAccessoryProvider eaClientRegistrationInfo](v4, "eaClientRegistrationInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201;
    v34[3] = &unk_1E5FB2F60;
    objc_copyWeak(&v35, (id *)buf);
    v34[4] = v4;
    objc_msgSend(v32, "registerClientInformation:onInstantiation:withReply:", v33, v3, v34);

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v4);

}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (ACCExternalAccessoryXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (ACCExternalAccessoryProvider)initWithDelegate:(id)a3 capabilities:(int)a4
{
  id v6;
  ACCExternalAccessoryProvider *v7;
  ACCExternalAccessoryProvider *v8;
  NSXPCConnection *serverConnection;
  ACCExternalAccessoryXPCServerProtocol *remoteObject;
  uint64_t v11;
  NSMutableSet *currentlyConnectedAccessories;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, int);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  init_logging();
  v20.receiver = self;
  v20.super_class = (Class)ACCExternalAccessoryProvider;
  v7 = -[ACCExternalAccessoryProvider init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    serverConnection = v8->_serverConnection;
    v8->_serverConnection = 0;

    remoteObject = v8->_remoteObject;
    v8->_remoteObject = 0;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    currentlyConnectedAccessories = v8->_currentlyConnectedAccessories;
    v8->_currentlyConnectedAccessories = (NSMutableSet *)v11;

    v8->_clientCapabilities = a4;
    -[ACCExternalAccessoryProvider _constructClientRegistrationInfo](v8, "_constructClientRegistrationInfo");
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __62__ACCExternalAccessoryProvider_initWithDelegate_capabilities___block_invoke;
    v17 = &unk_1E5FB2C30;
    objc_copyWeak(&v18, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.externalaccessory-server.availability-changed", &v14);
    -[ACCExternalAccessoryProvider connectToServer:](v8, "connectToServer:", 1, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (NSDictionary)eaClientRegistrationInfo
{
  return self->_eaClientRegistrationInfo;
}

- (void)_constructClientRegistrationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *eaClientRegistrationInfo;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if ((self->_clientCapabilities & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", getprogname(), 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("UISupportedExternalAccessoryProtocols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ACCExternalAccessoryProvider clientCapabilities](self, "clientCapabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[0] = CFSTR("ACCExternalAccessoryClientBundleIDKey");
  v11[1] = CFSTR("ACCExternalAccessoryClientEAProtocolsKey");
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = CFSTR("ACCExternalAccessoryClientEACapablitiesKey");
  v12[1] = v8;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  eaClientRegistrationInfo = self->_eaClientRegistrationInfo;
  self->_eaClientRegistrationInfo = v9;

  if (!v6)
}

- (int)clientCapabilities
{
  return self->_clientCapabilities;
}

- (ACCExternalAccessoryProviderProtocol)delegate
{
  return (ACCExternalAccessoryProviderProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __62__ACCExternalAccessoryProvider_initWithDelegate_capabilities___block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v7 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer:", 0);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ACCExternalAccessoryProvider;
  -[ACCExternalAccessoryProvider dealloc](&v4, sel_dealloc);
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 3;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v4 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC begin invalidation handler!", buf, 2u);
  }

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", 0);

  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "setRemoteObject:", 0);

  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "_removeAllAccessories");

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v11 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC connection invalidated!", v13, 2u);
  }

}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_196(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint8_t v11[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 3;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v4 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] EA XPC connection interrupted!", v11, 2u);
  }

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "setServerConnection:", 0);

  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "setRemoteObject:", 0);

  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "_removeAllAccessories");

}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_197(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_197_cold_1();

}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_199(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_197_cold_1();

}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_201(uint64_t a1, int a2, void *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t i;
  _ACCExternalAccessoryInfo *v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (gLogObjects)
    v6 = gNumLogObjects < 3;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v8 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = a2;
    _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] serverResult: %d", buf, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "serverConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "invalidate");
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      WeakRetained = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v28 = v5;
      obj = v5;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        v17 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(obj);
            v19 = -[_ACCExternalAccessoryInfo initWithAccessoryInfoDictionary:]([_ACCExternalAccessoryInfo alloc], "initWithAccessoryInfoDictionary:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v20 = gLogObjects;
            v21 = gNumLogObjects;
            if (gLogObjects)
              v22 = gNumLogObjects < 3;
            else
              v22 = 1;
            if (v22)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v36 = v20;
                v37 = 1024;
                v38 = v21;
                _os_log_error_impl(&dword_1AF649000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v23 = v17;
              v24 = v17;
            }
            else
            {
              v24 = *(id *)(gLogObjects + 16);
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              -[_ACCExternalAccessoryInfo name](v19, "name");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v36 = (uint64_t)v25;
              _os_log_impl(&dword_1AF649000, v24, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] adding accessory %@ to currentlyConnectedAccessories", buf, 0xCu);

            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v19);
            -[_ACCExternalAccessoryInfo fullAccessoryInfo](v19, "fullAccessoryInfo");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "addObject:", v26);

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "initialEAAccessoriesAttachedAfterClientConnection:", WeakRetained);
      v5 = v28;
      goto LABEL_33;
    }
  }
LABEL_34:

}

- (void)requestAccessoryWifiCredentials:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "[#CarPlay] requestAccessoryWiFiCredentials: %@", (uint8_t *)&v10, 0xCu);
  }

  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestAccessoryWiFiCredentials:", v4);

  }
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendDeviceIdentifierNotification:usbIdentifier:forUUID:", v12, v8, v9);

  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 3;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v19 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  else
  {
    v19 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138413314;
    v23 = v16;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_DEFAULT, "[#CarPlay] sendWiredCarPlayAvailable: %@, wiredAvailable %@, usbIdentifier %@, wirelessAvailable %@, bluetoothIdentifier %@", (uint8_t *)&v22, 0x34u);
  }

  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendWiredCarPlayAvailable:usbIdentifier:wirelessAvailable:bluetoothIdentifier:forUUID:", v12, v13, v14, v15, v16);

  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7 forUUID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (gLogObjects)
    v20 = gNumLogObjects < 3;
  else
    v20 = 1;
  if (v20)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v22 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }
  else
  {
    v22 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138413570;
    v26 = v19;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v17;
    v35 = 2112;
    v36 = v18;
    _os_log_impl(&dword_1AF649000, v22, OS_LOG_TYPE_DEFAULT, "[#CarPlay] sendWiredCarPlayAvailable: %@, wiredAvailable %@, usbIdentifier %@, wirelessAvailable %@, bluetoothIdentifier %@ assetsAvailable %@", (uint8_t *)&v25, 0x3Eu);
  }

  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendWiredCarPlayAvailable:usbIdentifier:wirelessAvailable:bluetoothIdentifier:themeAssetsAvailable:forUUID:", v14, v15, v16, v17, v18, v19);

  }
}

- (void)destinationInformation:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 3;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCExternalAccessoryProvider destinationInformation:forUUID:].cold.1();

  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destinationInformation:forUUID:", v6, v7);

  }
}

- (void)startLocationInformationForAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v6 = gNumLogObjects <= 2;
  else
    v6 = 1;
  v7 = !v6;
  if (v5)
  {
    if (v7)
    {
      v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "[#Location] sending activateLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }

    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject activateLocationForUUID:](v9, "activateLocationForUUID:", v4);
  }
  else
  {
    if (v7)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send activateLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)sendNMEAFilterList:(id)a3 forAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v9 = gNumLogObjects <= 2;
  else
    v9 = 1;
  v10 = !v9;
  if (v8)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "[#Location] sending sendNMEAFilterList %@ for UUID: %@", (uint8_t *)&v15, 0x16u);
    }

    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendNMEAFilterList:forUUID:](v12, "sendNMEAFilterList:forUUID:", v6, v7);
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send sendNMEAFilterList %@ for UUID: %@", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forAccessoryUUID:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  int v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v12 = gNumLogObjects <= 2;
  else
    v12 = 1;
  v13 = !v12;
  if (v11)
  {
    if (v13)
    {
      v14 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109890;
      v19 = v8;
      v20 = 1024;
      v21 = v7;
      v22 = 1024;
      v23 = v6;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "[#Location] sending sendGPRMCDataStatus: %d ValueV: %d ValueX: %d forUUID: %@", (uint8_t *)&v18, 0x1Eu);
    }

    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject sendGPRMCDataStatus:ValueV:ValueX:forUUID:](v15, "sendGPRMCDataStatus:ValueV:ValueX:forUUID:", v8, v7, v6, v10);
  }
  else
  {
    if (v13)
    {
      v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109890;
      v19 = v8;
      v20 = 1024;
      v21 = v7;
      v22 = 1024;
      v23 = v6;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send sendGPRMCDataStatus: %d ValueV: %d ValueX: %d forUUID: %@", (uint8_t *)&v18, 0x1Eu);
    }
  }

}

- (void)stopLocationInformationForAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v6 = gNumLogObjects <= 2;
  else
    v6 = 1;
  v7 = !v6;
  if (v5)
  {
    if (v7)
    {
      v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "[#Location] sending stopLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }

    -[ACCExternalAccessoryProvider remoteObject](self, "remoteObject");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject stopLocationForUUID:](v9, "stopLocationForUUID:", v4);
  }
  else
  {
    if (v7)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "[#Location] No remoteObject to send stopLocationForUUID %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (id)_findAccessoryForPrimaryUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ACCExternalAccessoryProvider currentlyConnectedAccessories](self, "currentlyConnectedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__ACCExternalAccessoryProvider__findAccessoryForPrimaryUUID___block_invoke;
  v14[3] = &unk_1E5FB2F88;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "objectsPassingTest:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "count"))
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACCExternalAccessoryProvider _findAccessoryForPrimaryUUID:].cold.2((uint64_t)v7, self, v8);

    objc_msgSend(v7, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "Can't find accessory for primaryUUID %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

uint64_t __61__ACCExternalAccessoryProvider__findAccessoryForPrimaryUUID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "primaryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5);
  if ((_DWORD)v6)
    *a3 = 1;

  return v6;
}

- (void)_removeAccessoryForPrimaryUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ACCExternalAccessoryProvider currentlyConnectedAccessories](self, "currentlyConnectedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__ACCExternalAccessoryProvider__removeAccessoryForPrimaryUUID___block_invoke;
  v13[3] = &unk_1E5FB2F88;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "objectsPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "count"))
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACCExternalAccessoryProvider _findAccessoryForPrimaryUUID:].cold.2((uint64_t)v7, self, v8);

    objc_msgSend(v7, "anyObject");
    v9 = objc_claimAutoreleasedReturnValue();
    -[ACCExternalAccessoryProvider currentlyConnectedAccessories](self, "currentlyConnectedAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v9);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "Can't find primaryUUID %@ to remove", buf, 0xCu);
    }
  }

}

uint64_t __63__ACCExternalAccessoryProvider__removeAccessoryForPrimaryUUID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "primaryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5);
  if ((_DWORD)v6)
    *a3 = 1;

  return v6;
}

- (void)_removeAllAccessories
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[ACCExternalAccessoryProvider currentlyConnectedAccessories](self, "currentlyConnectedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "copyAccessoryInfo", (_QWORD)v12);
        -[ACCExternalAccessoryProvider ExternalAccessoryLeft:](self, "ExternalAccessoryLeft:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)ExternalAccessoryArrived:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ACCExternalAccessoryProvider *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd received EAAccessoryArrived %@, verifyAccessoryConnectionStatus", buf, 0xCu);

  }
  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("IAPAppConnectionIDKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_215;
  v14[3] = &unk_1E5FB2FD8;
  v15 = v4;
  v16 = self;
  v13 = v4;
  objc_msgSend(v10, "verifyAccessoryConnectionStatus:legacyConnectionID:withReply:", v11, v12, v14);

}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_215(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _ACCExternalAccessoryInfo *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _ACCExternalAccessoryInfo *v16;
  _QWORD v17[4];
  _ACCExternalAccessoryInfo *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IAPAppConnectionIDKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 1024;
    v25 = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd with primaryUUID %@, legacyConnectionID %@ connected = %d", buf, 0x1Cu);

  }
  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v9 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IAPAppAccessoryNameKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "adding accessory %@ to currentlyConnectedAccessories", buf, 0xCu);

    }
    v12 = -[_ACCExternalAccessoryInfo initWithAccessoryInfoDictionary:]([_ACCExternalAccessoryInfo alloc], "initWithAccessoryInfoDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", v12);
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v13 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Dispatching async to main thread...", buf, 2u);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_216;
    v17[3] = &unk_1E5FB2FB0;
    v15 = *(_QWORD *)(a1 + 40);
    v18 = v12;
    v19 = v15;
    v16 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
}

void __57__ACCExternalAccessoryProvider_ExternalAccessoryArrived___block_invoke_216(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v2 = gNumLogObjects < 3;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v4 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  else
  {
    v4 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "fullAccessoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] In async to main thread: accessoryd received EAAccessoryArrived: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fullAccessoryInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "EAAccessoryArrived:", v7);

}

- (void)ExternalAccessoryLeft:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  ACCExternalAccessoryProvider *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("IAPAppAccessoryNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] accessoryd received EAAccessoryLeft %@, UUID %@", buf, 0x16u);

  }
  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCExternalAccessoryProvider _findAccessoryForPrimaryUUID:](self, "_findAccessoryForPrimaryUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = (void *)objc_msgSend(v12, "copyAccessoryInfo");
    else
      v13 = 0;
    objc_msgSend(v4, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCExternalAccessoryProvider _removeAccessoryForPrimaryUUID:](self, "_removeAccessoryForPrimaryUUID:", v14);

    if (gLogObjects && gNumLogObjects >= 3)
    {
      v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] Dispatching async to main thread...", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ACCExternalAccessoryProvider_ExternalAccessoryLeft___block_invoke;
    block[3] = &unk_1E5FB3000;
    v19 = v13;
    v20 = self;
    v21 = v4;
    v17 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __54__ACCExternalAccessoryProvider_ExternalAccessoryLeft___block_invoke(uint64_t a1)
{
  BOOL v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v2 = gNumLogObjects <= 2;
  else
    v2 = 1;
  v3 = !v2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      v4 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v4 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory accInfo %@", (uint8_t *)&v16, 0xCu);

    }
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v8 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IAPAppAccessoryNameKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IAPAppConnectionIDKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory %@ with connectionID %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "EAAccessoryLeft:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v3)
    {
      v5 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v5 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", *(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1AF649000, v5, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] removing accessory accessoryInfo %@", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "EAAccessoryLeft:", v15);

  }
}

- (void)handleIncomingNotification:(id)a3 withPayload:(id)a4 aboutAccessory:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 3;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("IAPAppAccessoryNameKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136316162;
    v17 = "-[ACCExternalAccessoryProvider handleIncomingNotification:withPayload:aboutAccessory:]";
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "[#ExternalAccessory] received %s accessory %@, UUID %@ notificationName %@ notificationPayload %@", (uint8_t *)&v16, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", v7, 0, v8);

}

- (void)handleIncomingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACCExternalAccessoryProvider handleIncomingExternalAccessoryData:forEASessionIdentifier:withReply:].cold.1();

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__ACCExternalAccessoryProvider_handleIncomingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke;
  v17[3] = &unk_1E5FB3028;
  v18 = v9;
  v19 = v10;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v14, "handleIncomingExternalAccessoryData:forEASessionIdentifier:withReply:", v8, v16, v17);

}

uint64_t __101__ACCExternalAccessoryProvider_handleIncomingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 3;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v6 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "client DID NOT handle incoming EA data for eaSessionUUID %@", (uint8_t *)&v9, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)accessoryCloseExternalAccessorySession:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "Accessory closed EA session for eaSessionUUID %@", (uint8_t *)&v10, 0xCu);
  }

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryClosedEASession:", v4);

  }
}

- (void)enqueueLocationNMEASentence:(id)a3 forUUID:(id)a4 withTimestamps:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = 138412802;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEBUG, "[#Location] enqueue Location nmea sentence: %@ for UUID %@ timestamps %@", (uint8_t *)&v22, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  v17 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject nmeaSentenceArrived:forAccessoryUUID:withTimestamps:](v20, "nmeaSentenceArrived:forAccessoryUUID:withTimestamps:", v8, v9, v17);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v20 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1AF649000, v20, OS_LOG_TYPE_DEFAULT, "[#Location] No delegate to process nmea sentence: %@ for UUID %@, timestamps %@", (uint8_t *)&v22, 0x20u);
    }
  }

}

- (void)createExternalAccessorySessionForProtocol:(id)a3 accessoryUUID:(id)a4 withEASessionReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "!!!!! createExternalAccessorySessionForProtocol for protocol %@", buf, 0xCu);
  }

  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_219_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke_220;
  v17[3] = &unk_1E5FB3050;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "createExternalAccessorySessionForProtocol:accessoryUUID:withReply:", v8, v9, v17);

}

void __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __107__ACCExternalAccessoryProvider_createExternalAccessorySessionForProtocol_accessoryUUID_withEASessionReply___block_invoke_220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 3;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  else
  {
    v12 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109890;
    v14[1] = a2;
    v15 = 1024;
    v16 = a3;
    v17 = 2048;
    v18 = a4;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "createdExternalAccessorySession result %d, useSocketInterface = %d, sessionID %llu, eaSessionUUID %@", (uint8_t *)v14, 0x22u);
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v13 + 16))(v13, a2, a3, a4, v9);

}

- (void)openSocketForAccessoryToApp:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is openSocketForAccessoryToApp...", v10, 2u);
  }

  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_222_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSocketFromAccessoryToApp:", v4);

}

void __60__ACCExternalAccessoryProvider_openSocketForAccessoryToApp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)openSocketForAppToAccessory:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is openSocketForAppToAccessory...", v10, 2u);
  }

  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_223_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openSocketFromAppToAccessory:", v4);

}

void __60__ACCExternalAccessoryProvider_openSocketForAppToAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)closeExternalAccessorySession:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "!!!!! EA provider app is closeExternalAccessorySession...", v10, 2u);
  }

  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_224_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientCloseExternalAccessorySession:", v4);

}

void __62__ACCExternalAccessoryProvider_closeExternalAccessorySession___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)sendOutgoingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 3;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v13 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "sendOutgoingExternalAccessoryData...", buf, 2u);
  }

  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_225_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke_226;
  v18[3] = &unk_1E5FB3028;
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v15, "processOutgoingExternalAccessoryData:forEASessionIdentifier:withReply:", v8, v17, v18);

}

void __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

uint64_t __99__ACCExternalAccessoryProvider_sendOutgoingExternalAccessoryData_forEASessionIdentifier_withReply___block_invoke_226(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 3;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v6 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 16);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "error sending outgoing EA data for eaSessionUUID %@", (uint8_t *)&v9, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)startDestinationSharingForUUID:(id)a3 options:(unint64_t)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 3;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v9 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  else
  {
    v9 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = v6;
    v26 = 2048;
    v27 = a4;
    _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "from accessoryd: received startDestinationSharingForUUID, UUID %@, options %llxh", (uint8_t *)&v24, 0x16u);
  }

  -[ACCExternalAccessoryProvider _findAccessoryForPrimaryUUID:](self, "_findAccessoryForPrimaryUUID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "destinationSharingOptions");
  objc_msgSend(v10, "setDestinationSharingOptions:", a4);
  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v11 != a4)
    {
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[ACCExternalAccessoryProvider delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[ACCExternalAccessoryProvider delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v10, "copyAccessoryInfo");
          objc_msgSend(v17, "updateAccessoryInfo:", v18);

        }
      }
    }
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v21, "startDestinationSharingForUUID:options:", v6, a4);
LABEL_20:

      goto LABEL_21;
    }
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startDestinationSharingForUUID:", v6);
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (void)stopDestinationSharingForUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "from accessoryd: received stopDestinationSharingForUUID, UUID %@", (uint8_t *)&v13, 0xCu);
  }

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopDestinationSharingForUUID:", v4);

    }
  }

}

- (void)destinationSharingStatus:(BOOL)a3 forDestinationUUID:(id)a4 supportedParams:(id)a5 forUUID:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v8 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (gLogObjects)
    v13 = gNumLogObjects < 3;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v15 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  else
  {
    v15 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("no");
    if (v8)
      v16 = CFSTR("yes");
    v24 = 138412546;
    v25 = v16;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "from accessoryd: received destinationSharingStatus %@ for UUID %@", (uint8_t *)&v24, 0x16u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v17 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ACCExternalAccessoryProvider destinationSharingStatus:forDestinationUUID:supportedParams:forUUID:].cold.1();

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "destinationSharingStatus:forDestinationUUID:supportedParams:forUUID:", v8, v10, v11, v12);

    }
  }

}

- (id)currentVehicleInfo:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 3;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v7 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] a process is asking for currentVehicleInfo for %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  -[ACCExternalAccessoryProvider serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_234_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_235;
  v13[3] = &unk_1E5FB3078;
  v10 = v4;
  v14 = v10;
  p_buf = &buf;
  objc_msgSend(v9, "vehicleInformationForUUID:withReply:", v10, v13);

  v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 3;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_cold_1();

}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_235(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 3;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] currentVehicleInfo for %@ currentVehicleInfoDictionary %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

- (void)vehicleStatusUpdate:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 3;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received vehicleStatusUpdate %@ for UUID %@", (uint8_t *)&v18, 0x16u);
  }

  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        -[ACCExternalAccessoryProvider delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_opt_respondsToSelector(),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject vehicleStatusUpdate:forAccessoryUUID:](v15, "vehicleStatusUpdate:forAccessoryUUID:", v6, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v15 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received vehicleStatusUpdate %@ for UUID %@, but no delegate(%@) or not able to respond to message", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)updateAccessoryInfo:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 3;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  else
  {
    v10 = *(id *)(gLogObjects + 16);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("IAPAppConnectionIDKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v7;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "from accessoryd: received updateAccessoryInfo for UUID %@ (connection ID: %@), %@", (uint8_t *)&v22, 0x20u);

  }
  -[ACCExternalAccessoryProvider delegate](self, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        -[ACCExternalAccessoryProvider delegate](self, "delegate"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_opt_respondsToSelector(),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    -[ACCExternalAccessoryProvider delegate](self, "delegate");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateAccessoryInfo:](v17, "updateAccessoryInfo:", v6);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 3)
    {
      v17 = *(id *)(gLogObjects + 16);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("IAPAppConnectionIDKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCExternalAccessoryProvider delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v7;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_1AF649000, v17, OS_LOG_TYPE_DEFAULT, "[#VehicleInfoStatus] from accessoryd: received updateAccessoryInfo for UUID %@ (connection ID: %@), but no delegate(%@) or not able to respond to message, %@", (uint8_t *)&v22, 0x2Au);

    }
  }

}

+ (id)accessoryDictionaryForLogging:(id)a3
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu bytes"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("IAPAppAccessoryCertDataKey"));

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu bytes"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("IAPAppAccessoryCertSerialNumberKey"));

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setClientCapabilities:(int)a3
{
  self->_clientCapabilities = a3;
}

- (void)setEaClientRegistrationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_eaClientRegistrationInfo, a3);
}

- (NSMutableSet)currentlyConnectedAccessories
{
  return self->_currentlyConnectedAccessories;
}

- (void)setCurrentlyConnectedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyConnectedAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyConnectedAccessories, 0);
  objc_storeStrong((id *)&self->_eaClientRegistrationInfo, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__ACCExternalAccessoryProvider_connectToServer___block_invoke_197_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "[#ExternalAccessory] XPC connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)destinationInformation:forUUID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_1AF649000, v0, (uint64_t)v0, "sending destinationInformation %@ for UUID %@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_findAccessoryForPrimaryUUID:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "currentlyConnectedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_1AF649000, a3, v5, "eaAccessoryToRemove %@, currentlyConnectedAccessories %@", v6);

  OUTLINED_FUNCTION_7();
}

- (void)handleIncomingExternalAccessoryData:forEASessionIdentifier:withReply:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1AF649000, v0, OS_LOG_TYPE_DEBUG, "Got EA data for eaSessionUUID %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)destinationSharingStatus:forDestinationUUID:supportedParams:forUUID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_0(&dword_1AF649000, v0, (uint64_t)v0, "destination sharing UUID %@, supportedParams %@", v1);
  OUTLINED_FUNCTION_3();
}

void __51__ACCExternalAccessoryProvider_currentVehicleInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "[#VehicleInfoStatus] XPC connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
