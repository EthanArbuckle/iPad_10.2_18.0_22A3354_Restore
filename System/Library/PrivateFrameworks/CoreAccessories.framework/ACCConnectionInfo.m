@implementation ACCConnectionInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance___sharedInstance;
}

void __35__ACCConnectionInfo_sharedInstance__block_invoke()
{
  ACCConnectionInfo *v0;
  void *v1;

  v0 = objc_alloc_init(ACCConnectionInfo);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

+ (id)copyLocalizedAccessoryName:(id)a3
{
  ACCConnectionInfoCopyLocalizedAccessoryNamePrivate(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACCConnectionInfo)init
{
  ACCConnectionInfo *v3;
  void *v4;
  uint64_t v5;
  NSString *providerUID;
  NSDictionary *accessoryFilterDictionary;
  NSString *identifier;
  NSLock *v9;
  NSLock *listLock;
  NSLock *v11;
  NSLock *serverConnectionLock;
  NSMutableDictionary *v13;
  NSMutableDictionary *connectionList;
  NSMutableDictionary *v15;
  NSMutableDictionary *endpointList;
  NSObject *v17;
  id v18;
  NSString *v19;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  _BYTE buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  init_logging();
  v23.receiver = self;
  v23.super_class = (Class)ACCConnectionInfo;
  v3 = -[ACCConnectionInfo init](&v23, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    providerUID = v3->_providerUID;
    v3->_providerUID = (NSString *)v5;

    objc_storeWeak((id *)&v3->_delegate, 0);
    objc_storeWeak((id *)&v3->_delegateForIdentifier, 0);
    objc_storeWeak((id *)&v3->_configStreamDelegate, 0);
    accessoryFilterDictionary = v3->_accessoryFilterDictionary;
    v3->_accessoryFilterDictionary = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    listLock = v3->_listLock;
    v3->_listLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    serverConnectionLock = v3->_serverConnectionLock;
    v3->_serverConnectionLock = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectionList = v3->_connectionList;
    v3->_connectionList = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointList = v3->_endpointList;
    v3->_endpointList = v15;

    if (gLogObjects && gNumLogObjects >= 8)
    {
      v17 = *(id *)(gLogObjects + 56);
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
      v19 = v3->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1AF649000, v17, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo init, _providerUID=%@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v3);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __25__ACCConnectionInfo_init__block_invoke;
    v21[3] = &unk_1E5FB2C30;
    objc_copyWeak(&v22, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandlerForServiceEntry("com.apple.accessories.connection-info-server.availability-changed", v21, 1u);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __25__ACCConnectionInfo_init__block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 8;
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
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v20, 8u);
  }

  if (a2)
  {
    v7 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "serverConnectionLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lock");

    v10 = objc_loadWeakRetained(v7);
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogObjects)
      v12 = gNumLogObjects <= 7;
    else
      v12 = 1;
    v13 = !v12;
    if (v11)
    {
      if (v13)
      {
        v14 = *(id *)(gLogObjects + 56);
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
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v20, 2u);
      }

      v15 = objc_loadWeakRetained(v7);
      -[NSObject connectToServer](v15, "connectToServer");
    }
    else
    {
      if (v13)
      {
        v15 = *(id *)(gLogObjects + 56);
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
        LOWORD(v20[0]) = 0;
        _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "No delegate, will not connect to server...", (uint8_t *)v20, 2u);
      }
    }

    v18 = objc_loadWeakRetained(v7);
    objc_msgSend(v18, "serverConnectionLock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unlock");

  }
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *connectionList;
  NSMutableDictionary *endpointList;
  NSLock *listLock;
  NSDictionary *accessoryFilterDictionary;
  objc_super v11;
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v5, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo dealloc", buf, 2u);
  }

  accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(1);
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  connectionList = self->_connectionList;
  self->_connectionList = 0;

  endpointList = self->_endpointList;
  self->_endpointList = 0;

  objc_storeWeak((id *)&self->_delegateForIdentifier, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_configStreamDelegate, 0);
  listLock = self->_listLock;
  self->_listLock = 0;

  accessoryFilterDictionary = self->_accessoryFilterDictionary;
  self->_accessoryFilterDictionary = 0;

  v11.receiver = self;
  v11.super_class = (Class)ACCConnectionInfo;
  -[ACCConnectionInfo dealloc](&v11, sel_dealloc);
}

- (id)copyLocalizedAccessoryNameFromDaemon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  -[ACCConnectionInfo connectToServer](self, "connectToServer");
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[ACCConnectionInfo remoteObject](self, "remoteObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = v6 == 0,
        v6,
        v5,
        v7))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACCConnectionInfo copyLocalizedAccessoryNameFromDaemon:].cold.2();
  }
  else
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_17;
    v17[3] = &unk_1E5FB2C78;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v9, "copyLocalizedAccessoryName:withReply:", v18, v17);

    v10 = v18;
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v12 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v21[5];
    *(_DWORD *)buf = 138412546;
    v27 = v4;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "from daemon, localize: name: %@ -> %@", buf, 0x16u);
  }

  v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_17(uint64_t a1, void *a2)
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
    v4 = gNumLogObjects < 8;
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
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "copyLocalizedAccessoryName got response: %@ -> %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

- (BOOL)registerDelegate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 8;
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
    v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = 138412546;
    v24 = WeakRetained;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@", (uint8_t *)&v23, 0x16u);

  }
  -[NSLock lock](self->_serverConnectionLock, "lock");
  objc_storeWeak((id *)&self->_delegate, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_storeWeak((id *)&self->_configStreamDelegate, v4);
  v9 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v9)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v10 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "Delegate set, trying to connect to server...", (uint8_t *)&v23, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (v15 = (void *)v14,
          -[ACCConnectionInfo remoteObject](self, "remoteObject"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACCConnectionInfo serverConnection](self, "serverConnection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "notifyOfClient:bundleID:withFilter:", self->_providerUID, v18, self->_accessoryFilterDictionary);

    }
    else
    {
      -[ACCConnectionInfo connectToServer](self, "connectToServer");
    }
  }
  else
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v12 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v12 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v23, 2u);
      }

    }
  }
  -[NSLock unlock](self->_serverConnectionLock, "unlock");

  return 1;
}

void __38__ACCConnectionInfo_registerDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (BOOL)registerDelegate:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
    v26 = 138412802;
    v27 = WeakRetained;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@ withIdentifier %@", (uint8_t *)&v26, 0x20u);

  }
  if (v7)
  {
    -[NSLock lock](self->_serverConnectionLock, "lock");
    objc_storeWeak((id *)&self->_delegateForIdentifier, v6);
    objc_storeStrong((id *)&self->_identifier, a4);
    v12 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);

    if (v12)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v13 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v13 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "Delegate set, trying to connect to server...", (uint8_t *)&v26, 2u);
      }

      -[ACCConnectionInfo serverConnection](self, "serverConnection");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17
        && (v18 = (void *)v17,
            -[ACCConnectionInfo remoteObject](self, "remoteObject"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v18,
            v19))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[ACCConnectionInfo serverConnection](self, "serverConnection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "notifyOfClient:bundleID:withFilter:forIdentifier:", self->_providerUID, v21, 0, v7);

      }
      else
      {
        -[ACCConnectionInfo connectToServer](self, "connectToServer");
      }
    }
    else
    {
      -[ACCConnectionInfo serverConnection](self, "serverConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          v15 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[ACCTransportPlugin initWithDelegate:].cold.2();
          v15 = MEMORY[0x1E0C81028];
          v24 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v26, 2u);
        }

      }
    }
    -[NSLock unlock](self->_serverConnectionLock, "unlock");
  }

  return v7 != 0;
}

void __53__ACCConnectionInfo_registerDelegate_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (BOOL)registerDelegate:(id)a3 withFilter:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  NSDictionary *accessoryFilterDictionary;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSDictionary *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    accessoryFilterDictionary = self->_accessoryFilterDictionary;
    v27 = 138413058;
    v28 = WeakRetained;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = accessoryFilterDictionary;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo registerDelegate %@ -> %@, withFilter %@ -> %@", (uint8_t *)&v27, 0x2Au);

  }
  -[NSLock lock](self->_serverConnectionLock, "lock");
  objc_storeWeak((id *)&self->_delegate, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_storeWeak((id *)&self->_configStreamDelegate, v6);
  objc_storeStrong((id *)&self->_accessoryFilterDictionary, a4);
  v13 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v13)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "Delegate and Filter set, trying to connect to server...", (uint8_t *)&v27, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18
      && (v19 = (void *)v18,
          -[ACCConnectionInfo remoteObject](self, "remoteObject"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v20,
          v19,
          v20))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACCConnectionInfo serverConnection](self, "serverConnection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "notifyOfClient:bundleID:withFilter:", self->_providerUID, v22, self->_accessoryFilterDictionary);

    }
    else
    {
      -[ACCConnectionInfo connectToServer](self, "connectToServer");
    }
  }
  else
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v16 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v16 = MEMORY[0x1E0C81028];
        v25 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1AF649000, v16, OS_LOG_TYPE_DEFAULT, "Delegate unset...", (uint8_t *)&v27, 2u);
      }

    }
  }
  -[NSLock unlock](self->_serverConnectionLock, "unlock");

  return 1;
}

void __49__ACCConnectionInfo_registerDelegate_withFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)notifyDelegateOfServerDisconnectAndCleanup
{
  id WeakRetained;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  OUTLINED_FUNCTION_8();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1AF649000, a3, OS_LOG_TYPE_DEBUG, "notifyDelegateOfServerDisconnectAndCleanup _delegate=%@ tmpConnectionList=%@", v6, 0x16u);

}

- (void)connectToServer
{
  ACCConnectionInfo *v2;
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
  NSObject *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  NSObject *v34;
  id WeakRetained;
  void *v36;
  void *v37;
  id v38;
  BOOL v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  id v44;
  uint8_t v45[16];
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _BYTE buf[24];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (accessoryServer_isServerAvailableForServiceEntry(1u))
  {
    -[ACCConnectionInfo serverConnection](v2, "serverConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v4 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v4 = MEMORY[0x1E0C81028];
        v5 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to ConnectionInfo XPC server...", buf, 2u);
      }

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.connection-info-server"), 4096);
      -[ACCConnectionInfo setServerConnection:](v2, "setServerConnection:", v6);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4BF70);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v7);

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4BFD0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExportedInterface:", v9);

      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setExportedObject:", v2);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v2);
      v12 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __36__ACCConnectionInfo_connectToServer__block_invoke;
      v48[3] = &unk_1E5FB2CE0;
      objc_copyWeak(&v49, (id *)buf);
      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setInvalidationHandler:", v48);

      v46[0] = v12;
      v46[1] = 3221225472;
      v46[2] = __36__ACCConnectionInfo_connectToServer__block_invoke_165;
      v46[3] = &unk_1E5FB2CE0;
      objc_copyWeak(&v47, (id *)buf);
      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInterruptionHandler:", v46);

      if (gLogObjects && gNumLogObjects >= 8)
      {
        v15 = *(id *)(gLogObjects + 56);
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
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "resuming ConnectionInfo XPC connection", v45, 2u);
      }

      -[ACCConnectionInfo serverConnection](v2, "serverConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resume");

      objc_destroyWeak(&v47);
      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
    }
  }
  if (gLogObjects)
    v18 = gNumLogObjects < 8;
  else
    v18 = 1;
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v20 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  else
  {
    v20 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCConnectionInfo remoteObject](v2, "remoteObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_1AF649000, v20, OS_LOG_TYPE_DEFAULT, "self.remoteObject = %@", buf, 0xCu);

  }
  -[ACCConnectionInfo remoteObject](v2, "remoteObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v24 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v24 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v24, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
    }

    -[ACCConnectionInfo serverConnection](v2, "serverConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_167);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCConnectionInfo setRemoteObject:](v2, "setRemoteObject:", v27);

    if (gLogObjects && gNumLogObjects >= 8)
    {
      v28 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v28 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF649000, v28, OS_LOG_TYPE_DEFAULT, "Registering with remote service...", buf, 2u);
    }

    -[ACCConnectionInfo serverConnection](v2, "serverConnection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30
      || (-[ACCConnectionInfo remoteObject](v2, "remoteObject"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = v31 == 0,
          v31,
          v30,
          v32))
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v34 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v34 = MEMORY[0x1E0C81028];
        v43 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF649000, v34, OS_LOG_TYPE_DEFAULT, "Skip registering with remote service... No serverConnection or remoteObject!", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bundleIdentifier");
      v34 = objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
      if (WeakRetained)
      {
        -[ACCConnectionInfo serverConnection](v2, "serverConnection");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_169);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "notifyOfClient:bundleID:withFilter:", v2->_providerUID, v34, v2->_accessoryFilterDictionary);

      }
      v38 = objc_loadWeakRetained((id *)&v2->_delegateForIdentifier);
      if (v38)
      {
        v39 = v2->_identifier == 0;

        if (!v39)
        {
          -[ACCConnectionInfo serverConnection](v2, "serverConnection");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_171);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "notifyOfClient:bundleID:withFilter:forIdentifier:", v2->_providerUID, v34, 0, v2->_identifier);

        }
      }
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v42 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v42 = MEMORY[0x1E0C81028];
        v44 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF649000, v42, OS_LOG_TYPE_DEFAULT, "Registering with remote service... done!", buf, 2u);
      }

    }
  }
  objc_sync_exit(v2);

}

void __36__ACCConnectionInfo_connectToServer__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 8;
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
    v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC begin invalidation handler!", buf, 2u);
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

  accessoryServer_serverIsUnreachableForServiceEntry(1);
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v10 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC connection invalidated!", v13, 2u);
  }

  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "notifyDelegateOfServerDisconnectAndCleanup");

}

void __36__ACCConnectionInfo_connectToServer__block_invoke_165(uint64_t a1)
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
    v2 = gNumLogObjects < 8;
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
    v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_DEFAULT, "ConnectionInfo XPC connection interrupted!", v11, 2u);
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
  objc_msgSend(v10, "notifyDelegateOfServerDisconnectAndCleanup");

}

void __36__ACCConnectionInfo_connectToServer__block_invoke_166(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __36__ACCConnectionInfo_connectToServer__block_invoke_168(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __36__ACCConnectionInfo_connectToServer__block_invoke_170(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (BOOL)accessoryConnectionFiltered:(id)a3 withFilter:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  char v10;
  BOOL v11;

  v6 = ACCConnectionInfoFilterAllowConnectionType;
  v7 = a3;
  objc_msgSend(a4, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");
  v10 = -[ACCConnectionInfo accessoryConnectionType:](self, "accessoryConnectionType:", v7);

  v11 = v8 && ((v9 >> v10) & 1) == 0;
  return v11;
}

- (BOOL)accessoryEndpointFiltered:(id)a3 withFilter:(id)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  char v16;
  char v17;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  v10 = ACCConnectionInfoFilterAllowEndpointTransport;
  v11 = a4;
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", ACCConnectionInfoFilterAllowEndpointProtocol);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v12 | v13)
  {
    v14 = objc_msgSend((id)v12, "unsignedIntValue");
    v15 = objc_msgSend((id)v13, "unsignedIntValue");
    v16 = -[ACCConnectionInfo accessoryEndpointTransportType:connection:](self, "accessoryEndpointTransportType:connection:", v8, v9);
    v17 = -[ACCConnectionInfo accessoryEndpointProtocolType:connection:](self, "accessoryEndpointProtocolType:connection:", v8, v9);
    v19 = v12 && ((v14 >> v16) & 1) == 0 || ((1 << v17) & v15) == 0 && v13 != 0;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  char v21;
  id v22;
  NSDictionary *accessoryFilterDictionary;
  int v24;
  NSDictionary *v25;
  BOOL v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  unsigned int v31;
  id v32;

  v8 = *(_QWORD *)&a4;
  v32 = a3;
  v30 = a5;
  v29 = a6;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v32);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_connectionList, "setObject:forKey:", v10, v32);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("connectionType"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v13 = WeakRetained,
        objc_msgSend(v10, "objectForKey:", CFSTR("Legacy")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Legacy"));
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
  v31 = v8;
  v27 = v10;
  if (v16
    && (v17 = v16,
        objc_msgSend(v10, "objectForKey:", self->_identifier, v10),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], self->_identifier);
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  -[NSLock unlock](self->_listLock, "unlock", v27);
  v20 = 1;
  do
  {
    v21 = v20;
    if ((v20 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
      v24 = v15;
    }
    else
    {
      v22 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
      v24 = v19;
    }
    v25 = accessoryFilterDictionary;
    if (v22)
    {
      v26 = -[ACCConnectionInfo accessoryConnectionFiltered:withFilter:](self, "accessoryConnectionFiltered:withFilter:", v32, v25);
      if (v24)
      {
        if (!v26)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "accessoryConnectionAttached:type:", v32, v31);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "accessoryConnectionAttached:type:info:properties:", v32, v31, v30, v29);
        }
      }
    }

    v20 = 0;
  }
  while ((v21 & 1) != 0);

}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  uint64_t v14;
  id WeakRetained;
  _BOOL8 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_accessoryFilterDictionary)
    v5 = -[ACCConnectionInfo accessoryConnectionFiltered:withFilter:](self, "accessoryConnectionFiltered:withFilter:", v4);
  else
    v5 = 0;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("endpointList"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary removeObjectForKey:](self->_endpointList, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_connectionList, "removeObjectForKey:", v4);
  -[NSLock unlock](self->_listLock, "unlock");
  v12 = 1;
  do
  {
    v13 = v12;
    if ((v12 & 1) != 0)
      v14 = 24;
    else
      v14 = 32;
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v14));
    if (WeakRetained && !(v13 & v5))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = v5;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v17 = v7;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v24 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(WeakRetained, "accessoryEndpointDetached:forConnection:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v4);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v19);
        }

        v5 = v16;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryConnectionDetached:", v4);
    }

    v12 = 0;
  }
  while ((v13 & 1) != 0);

}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  char v25;
  id v26;
  NSDictionary *accessoryFilterDictionary;
  int v28;
  NSDictionary *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v38;

  v38 = a3;
  v35 = a6;
  v10 = a7;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_connectionList, "setObject:forKey:", v11, v10);
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("endpointList"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("endpointList"));
  }
  objc_msgSend(v12, "addObject:", v38);
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v38);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_endpointList, "setObject:forKey:", v13, v38);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("transportType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("protocolType"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v33 = v12;
  if (WeakRetained
    && (v17 = WeakRetained,
        objc_msgSend(v13, "objectForKey:", CFSTR("Legacy")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Legacy"));
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
  v34 = v11;
  v31 = v13;
  if (v20
    && (v21 = v20,
        objc_msgSend(v13, "objectForKey:", self->_identifier, v13, v33, v11),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        !v22))
  {
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], self->_identifier);
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
  -[NSLock unlock](self->_listLock, "unlock", v31);
  v24 = 1;
  do
  {
    v25 = v24;
    if ((v24 & 1) != 0)
    {
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
      v28 = v19;
    }
    else
    {
      v26 = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
      v28 = v23;
    }
    v29 = accessoryFilterDictionary;
    if (v26)
    {
      v30 = -[ACCConnectionInfo accessoryEndpointFiltered:withFilter:forConnection:](self, "accessoryEndpointFiltered:withFilter:forConnection:", v38, v29, v10);
      if (v28)
      {
        if (!v30)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "accessoryEndpointAttached:transportType:protocol:forConnection:", v38, a4, a5, v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "accessoryEndpointAttached:transportType:protocol:properties:forConnection:", v38, a4, a5, v35, v10);
        }
      }
    }

    v24 = 0;
  }
  while ((v25 & 1) != 0);

}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *accessoryFilterDictionary;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  id WeakRetained;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = v6;
  accessoryFilterDictionary = self->_accessoryFilterDictionary;
  if (accessoryFilterDictionary)
    v9 = -[ACCConnectionInfo accessoryEndpointFiltered:withFilter:forConnection:](self, "accessoryEndpointFiltered:withFilter:forConnection:", v18, accessoryFilterDictionary, v6);
  else
    v9 = 0;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v18;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("endpointList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v18);

    v12 = v18;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_endpointList, "removeObjectForKey:", v12);
  -[NSLock unlock](self->_listLock, "unlock");
  v14 = 1;
  do
  {
    v15 = v14;
    if ((v14 & 1) != 0)
      v16 = 24;
    else
      v16 = 32;
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v16));
    if (WeakRetained && (v15 ^ 1) & 1 | !v9 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "accessoryEndpointDetached:forConnection:", v18, v7);

    v14 = 0;
  }
  while ((v15 & 1) != 0);

}

- (void)accessoryEndpointUpdate:(id)a3 protocol:(int)a4 properties:(id)a5 forConnection:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id WeakRetained;
  NSDictionary *accessoryFilterDictionary;
  NSDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v8 = *(_QWORD *)&a4;
  v25 = a3;
  v24 = a5;
  v10 = a6;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if (v11
    && (objc_msgSend(v11, "objectForKey:", CFSTR("endpointList")),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = v12;
    if (objc_msgSend(v12, "containsObject:", v25))
    {
      -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v25);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("protocolType"));

      }
    }
  }
  else
  {
    v21 = 0;
  }
  -[NSLock unlock](self->_listLock, "unlock", v21);
  v16 = 1;
  do
  {
    v17 = v16;
    if ((v16 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    v20 = accessoryFilterDictionary;
    if (WeakRetained
      && !-[ACCConnectionInfo accessoryEndpointFiltered:withFilter:forConnection:](self, "accessoryEndpointFiltered:withFilter:forConnection:", v25, v20, v10))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryEndpointUpdate:protocol:forConnection:", v25, v8, v10);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryEndpointUpdate:protocol:properties:forConnection:", v25, v8, v24, v10);
    }

    v16 = 0;
  }
  while ((v17 & 1) != 0);

}

- (void)accessoryConnectionInfoPropertyChanged:(id)a3 properties:(id)a4
{
  id v6;
  char v7;
  char v8;
  id WeakRetained;
  NSDictionary *accessoryFilterDictionary;
  NSDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = 1;
  do
  {
    v8 = v7;
    if ((v7 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    v11 = accessoryFilterDictionary;
    if (WeakRetained
      && !-[ACCConnectionInfo accessoryConnectionFiltered:withFilter:](self, "accessoryConnectionFiltered:withFilter:", v12, v11))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryConnectionInfoPropertyChanged:", v12);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryConnectionInfoPropertyChanged:properties:", v12, v6);
    }

    v7 = 0;
  }
  while ((v8 & 1) != 0);

}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  char v10;
  char v11;
  id WeakRetained;
  NSDictionary *accessoryFilterDictionary;
  NSDictionary *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 1;
  do
  {
    v11 = v10;
    if ((v10 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      accessoryFilterDictionary = self->_accessoryFilterDictionary;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
      accessoryFilterDictionary = 0;
    }
    v14 = accessoryFilterDictionary;
    if (WeakRetained
      && !-[ACCConnectionInfo accessoryEndpointFiltered:withFilter:forConnection:](self, "accessoryEndpointFiltered:withFilter:forConnection:", v15, v14, v9))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryEndpointInfoPropertyChanged:forConnection:", v15, v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "accessoryEndpointInfoPropertyChanged:properties:forConnection:", v15, v8, v9);
    }

    v10 = 0;
  }
  while ((v11 & 1) != 0);

}

- (void)handleInterceptData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  char v10;
  char v11;
  uint64_t v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 1;
  do
  {
    v11 = v10;
    if ((v10 & 1) != 0)
      v12 = 24;
    else
      v12 = 32;
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v12));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "handleInterceptData:forEndpoint:connection:", v14, v8, v9);

    v10 = 0;
  }
  while ((v11 & 1) != 0);

}

- (void)configStreamCategoryListReady:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  ACCConnectionInfoConfigStreamDelegateProtocol **p_configStreamDelegate;
  id v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_configStreamDelegate);
    v18 = 138412802;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = WeakRetained;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoryListReady: %@ - %@, _configStreamDelegate %@", (uint8_t *)&v18, 0x20u);

  }
  p_configStreamDelegate = &self->_configStreamDelegate;
  v13 = objc_loadWeakRetained((id *)p_configStreamDelegate);
  if (v13)
  {
    v14 = v13;
    v15 = objc_loadWeakRetained((id *)p_configStreamDelegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)p_configStreamDelegate);
      objc_msgSend(v17, "configStreamCategoryListReady:connection:", v6, v7);

    }
  }

}

- (void)configStreamCategoriesResponse:(id)a3 forEndpoint:(id)a4 connection:(id)a5 success:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  id configStreamGetResponseHandler;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (gLogObjects)
    v13 = gNumLogObjects < 8;
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
    v15 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = 138413058;
    v19 = v12;
    v20 = 2112;
    v21 = v11;
    v22 = 1024;
    v23 = v6;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoriesResponse: %@ - %@, success %d, categories %@", (uint8_t *)&v18, 0x26u);
  }

  v16 = _Block_copy(self->_configStreamGetResponseHandler);
  configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
  self->_configStreamGetResponseHandler = 0;

  if (v16)
    (*((void (**)(void *, id, id, _QWORD, _QWORD, _QWORD, id, _BOOL8))v16 + 2))(v16, v11, v12, 0, 0, 0, v10, v6);

}

- (void)configStreamPropertyResponse:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 value:(id)a7 success:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  void (**v20)(void *, id, id, uint64_t, uint64_t, id, _QWORD, _BOOL8);
  id configStreamGetResponseHandler;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v8 = a8;
  v11 = a4;
  v12 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 8;
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
    v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v22 = 138413570;
    v23 = v15;
    v24 = 2112;
    v25 = v14;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = v8;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertyResponse: %@ - %@, cat 0x%x, prop %d, success %d, val %@", (uint8_t *)&v22, 0x32u);
  }

  v20 = (void (**)(void *, id, id, uint64_t, uint64_t, id, _QWORD, _BOOL8))_Block_copy(self->_configStreamGetResponseHandler);
  configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
  self->_configStreamGetResponseHandler = 0;

  if (v20)
    v20[2](v20, v14, v15, v11, v12, v16, 0, v8);

}

- (void)accessoryEndpointsForConnection:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_192);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryEndpointsForConnection:withReply:", v6, v7);

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 8;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryEndpointsForConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __63__ACCConnectionInfo_accessoryEndpointsForConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)accessoryInfoForConnection:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_193);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryInfoForConnection:withReply:", v6, v7);

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 8;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryInfoForConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __58__ACCConnectionInfo_accessoryInfoForConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_194);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryInfoForEndpoint:connection:withReply:", v8, v9, v10);

  }
  else
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 8;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v11 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    else
    {
      v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryInfoForEndpoint: %@ connection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v15, 0x16u);
    }
  }

}

void __67__ACCConnectionInfo_accessoryInfoForEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (id)accessoryInfoForConnectionSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_195);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke_196;
  v9[3] = &unk_1E5FB2D28;
  v9[4] = &v10;
  objc_msgSend(v6, "accessoryInfoForConnection:withReply:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __52__ACCConnectionInfo_accessoryInfoForConnectionSync___block_invoke_196(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)accessoryInfoForEndpointSync:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_198);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke_199;
  v12[3] = &unk_1E5FB2D50;
  v12[4] = &v13;
  objc_msgSend(v9, "accessoryInfoForEndpoint:connection:withReply:", v6, v7, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __61__ACCConnectionInfo_accessoryInfoForEndpointSync_connection___block_invoke_199(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (void)accessoryProperty:(id)a3 forConnection:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_201);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryProperty:forConnection:withReply:", v8, v9, v10);

  }
  else
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 8;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v11 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    else
    {
      v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryProperty: %@ forConnection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v15, 0x16u);
    }
  }

}

void __63__ACCConnectionInfo_accessoryProperty_forConnection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)accessoryProperty:(id)a3 forEndpoint:(id)a4 connection:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_202);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessoryProperty:forEndpoint:connection:withReply:", v10, v11, v12, v13);

  }
  else
  {
    if (gLogObjects)
      v16 = gNumLogObjects < 8;
    else
      v16 = 1;
    if (v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    else
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412802;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo accessoryPropery: %@ forEndpoint: %@ connection: %@, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0x20u);
    }
  }

}

void __72__ACCConnectionInfo_accessoryProperty_forEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (BOOL)configStreamCategoriesRequest:(id)a3 connection:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  _BOOL4 v19;
  int v20;
  int v21;
  BOOL v22;
  id v23;
  BOOL v24;
  void *v26;
  id configStreamGetResponseHandler;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _BYTE v42[10];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 8;
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
    v13 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v30 = _Block_copy(v10);
    v31 = _Block_copy(self->_configStreamGetResponseHandler);
    *(_DWORD *)buf = 138413058;
    v38 = v9;
    v39 = 2112;
    v40 = v8;
    v41 = 2048;
    *(_QWORD *)v42 = v30;
    *(_WORD *)&v42[8] = 2048;
    v43 = v31;
    _os_log_debug_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEBUG, "ACCConnectionInfo configStreamCategoriesRequest: [%@ : %@], responseHandler %p, _configStreamGetResponseHandler %p", buf, 0x2Au);

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  if (v8 && v9 && v10 && !self->_configStreamGetResponseHandler)
  {
    v26 = _Block_copy(v10);
    configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
    self->_configStreamGetResponseHandler = v26;

    *((_BYTE *)v34 + 24) = 1;
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __72__ACCConnectionInfo_configStreamCategoriesRequest_connection_withReply___block_invoke;
    v32[3] = &unk_1E5FB2D98;
    v32[4] = self;
    v32[5] = &v33;
    objc_msgSend(v28, "remoteObjectProxyWithErrorHandler:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "configStreamCategoriesRequest:connection:", v8, v9);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_configStreamGetResponseHandler != 0;
      *(_DWORD *)buf = 138413058;
      v38 = v8;
      v39 = 2112;
      v40 = v9;
      v41 = 1024;
      *(_DWORD *)v42 = v10 != 0;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v16;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo configStreamCategoriesRequest: %@ connection: %@, ERROR: called with no endpoint/connectionUUID/responseHandler(%d) or pending requestReply(%d)!!!", buf, 0x22u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v17 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = self->_configStreamGetResponseHandler != 0;
    v20 = *((unsigned __int8 *)v34 + 24);
    *(_DWORD *)buf = 138413314;
    v38 = v9;
    v39 = 2112;
    v40 = v8;
    v41 = 1024;
    *(_DWORD *)v42 = v10 != 0;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v19;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v20;
    _os_log_impl(&dword_1AF649000, v17, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamCategoriesRequest: [%@ : %@], responseHandler(%d), _configStreamGetResponseHandler(%d), sendSuccess %d", buf, 0x28u);
  }

  v21 = *((unsigned __int8 *)v34 + 24);
  v22 = v10 == 0;
  if (*((_BYTE *)v34 + 24))
    v22 = 1;
  if (!v22)
  {
    v23 = self->_configStreamGetResponseHandler;
    self->_configStreamGetResponseHandler = 0;

    (*((void (**)(id, id, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, v8, v9, 0, 0, 0, 0, 0);
    v21 = *((unsigned __int8 *)v34 + 24);
  }
  v24 = v21 != 0;
  _Block_object_dispose(&v33, 8);

  return v24;
}

void __72__ACCConnectionInfo_configStreamCategoriesRequest_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 8;
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
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 104);
  *(_QWORD *)(v7 + 104) = 0;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)configStreamPropertyRequest:(unsigned __int8)a3 forCategory:(unsigned __int16)a4 forEndpoint:(id)a5 connection:(id)a6 withReply:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  _BOOL4 v23;
  int v24;
  int v25;
  BOOL v26;
  id v27;
  BOOL v28;
  void *v30;
  id configStreamGetResponseHandler;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  _BYTE v42[10];
  _BYTE v43[10];
  _BYTE v44[10];
  __int16 v45;
  _BYTE v46[10];
  void *v47;
  uint64_t v48;

  v9 = a4;
  v10 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (gLogObjects)
    v15 = gNumLogObjects < 8;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v17 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  else
  {
    v17 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v35 = _Block_copy(v14);
    v34 = _Block_copy(self->_configStreamGetResponseHandler);
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)v42 = v13;
    *(_WORD *)&v42[8] = 2112;
    *(_QWORD *)v43 = v12;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)v44 = v9;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v10;
    v45 = 2048;
    *(_QWORD *)v46 = v35;
    *(_WORD *)&v46[8] = 2048;
    v47 = v34;
    _os_log_debug_impl(&dword_1AF649000, v17, OS_LOG_TYPE_DEBUG, "ACCConnectionInfo configStreamPropertyRequest: [%@ : %@], categoryID 0x%x, propertyID %u, responseHandler %p, _configStreamGetResponseHandler %p", buf, 0x36u);

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v12 && v13 && v14 && !self->_configStreamGetResponseHandler)
  {
    v30 = _Block_copy(v14);
    configStreamGetResponseHandler = self->_configStreamGetResponseHandler;
    self->_configStreamGetResponseHandler = v30;

    *((_BYTE *)v38 + 24) = 1;
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __94__ACCConnectionInfo_configStreamPropertyRequest_forCategory_forEndpoint_connection_withReply___block_invoke;
    v36[3] = &unk_1E5FB2D98;
    v36[4] = self;
    v36[5] = &v37;
    objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "configStreamPropertyRequest:forCategory:forEndpoint:connection:", v10, v9, v12, v13);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v18 = *(id *)(gLogObjects + 56);
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
      v20 = self->_configStreamGetResponseHandler != 0;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v42 = v10;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v9;
      *(_WORD *)v43 = 2112;
      *(_QWORD *)&v43[2] = v12;
      *(_WORD *)v44 = 2112;
      *(_QWORD *)&v44[2] = v13;
      v45 = 1024;
      *(_DWORD *)v46 = v14 != 0;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v20;
      _os_log_impl(&dword_1AF649000, v18, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo requestConfigStreamProperty: %u forCateogry: %u forEndpoint: %@ connection: %@, ERROR: called with no endpoint/connectionUUID/responseHandler(%d) or pending requestReply(%d)!!!", buf, 0x2Eu);
    }

  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v21 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v23 = self->_configStreamGetResponseHandler != 0;
    v24 = *((unsigned __int8 *)v38 + 24);
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)v42 = v13;
    *(_WORD *)&v42[8] = 2112;
    *(_QWORD *)v43 = v12;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)v44 = v9;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v10;
    v45 = 1024;
    *(_DWORD *)v46 = v14 != 0;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v23;
    LOWORD(v47) = 1024;
    *(_DWORD *)((char *)&v47 + 2) = v24;
    _os_log_impl(&dword_1AF649000, v21, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertyRequest: [%@ : %@], categoryID 0x%x, propertyID %u, responseHandler(%d), _configStreamGetResponseHandler(%d), sendSuccess %d", buf, 0x34u);
  }

  v25 = *((unsigned __int8 *)v38 + 24);
  v26 = v14 == 0;
  if (*((_BYTE *)v38 + 24))
    v26 = 1;
  if (!v26)
  {
    v27 = self->_configStreamGetResponseHandler;
    self->_configStreamGetResponseHandler = 0;

    (*((void (**)(id, id, id, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, v12, v13, v9, v10, 0, 0, 0);
    v25 = *((unsigned __int8 *)v38 + 24);
  }
  v28 = v25 != 0;
  _Block_object_dispose(&v37, 8);

  return v28;
}

void __94__ACCConnectionInfo_configStreamPropertyRequest_forCategory_forEndpoint_connection_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 8;
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
    v6 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 104);
  *(_QWORD *)(v7 + 104) = 0;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

- (void)configStreamPropertySetValue:(id)a3 forProperty:(unsigned __int8)a4 forCategory:(unsigned __int16)a5 forEndpoint:(id)a6 connection:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  _BYTE v24[10];
  _BYTE v25[10];
  _BYTE v26[10];
  __int16 v27;
  id v28;
  uint64_t v29;

  v9 = a5;
  v10 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (gLogObjects)
    v16 = gNumLogObjects <= 7;
  else
    v16 = 1;
  v17 = !v16;
  if (v13 && v14)
  {
    if (v17)
    {
      v18 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v18 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v23 = 138413314;
      *(_QWORD *)v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(_QWORD *)v25 = v13;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)v26 = v9;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v10;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_1AF649000, v18, OS_LOG_TYPE_INFO, "ACCConnectionInfo configStreamPropertySetValue: [%@ : %@], categoryID 0x%x, propertyID %u, value %@", (uint8_t *)&v23, 0x2Cu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v19, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_203);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "configStreamPropertySetValue:forProperty:forCategory:forEndpoint:connection:", v12, v10, v9, v13, v15);

  }
  else
  {
    if (v17)
    {
      v19 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v19 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 67109890;
      *(_DWORD *)v24 = v10;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v9;
      *(_WORD *)v25 = 2112;
      *(_QWORD *)&v25[2] = v13;
      *(_WORD *)v26 = 2112;
      *(_QWORD *)&v26[2] = v15;
      _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo requestConfigStreamProperty: %u forCateogry: %u forEndpoint: %@ connection: %@, ERROR: called with no endpoint/connectionUUID!!!", (uint8_t *)&v23, 0x22u);
    }
  }

}

void __97__ACCConnectionInfo_configStreamPropertySetValue_forProperty_forCategory_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (id)accessoryPropertySync:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_204);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke_205;
  v12[3] = &unk_1E5FB2DC0;
  v12[4] = &v13;
  objc_msgSend(v9, "accessoryProperty:forConnection:withReply:", v6, v7, v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __57__ACCConnectionInfo_accessoryPropertySync_forConnection___block_invoke_205(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)accessoryPropertySync:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[ACCConnectionInfo serverConnection](self, "serverConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_207);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke_208;
  v15[3] = &unk_1E5FB2DE8;
  v15[4] = &v16;
  objc_msgSend(v12, "accessoryProperty:forEndpoint:connection:withReply:", v8, v9, v10, v15);

  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __66__ACCConnectionInfo_accessoryPropertySync_forEndpoint_connection___block_invoke_208(uint64_t a1, int a2, int a3, int a4, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (int)accessoryConnectionType:(id)a3
{
  NSLock *listLock;
  id v5;
  void *v6;
  void *v7;
  int v8;

  listLock = self->_listLock;
  v5 = a3;
  -[NSLock lock](listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_connectionList, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("connectionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

  }
  else
  {
    v8 = 11;
  }
  -[NSLock unlock](self->_listLock, "unlock");

  return v8;
}

- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4
{
  NSLock *listLock;
  id v6;
  void *v7;
  void *v8;
  int v9;

  listLock = self->_listLock;
  v6 = a3;
  -[NSLock lock](listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("transportType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

  }
  else
  {
    v9 = 17;
  }
  -[NSLock unlock](self->_listLock, "unlock");

  return v9;
}

- (int)accessoryEndpointProtocolType:(id)a3 connection:(id)a4
{
  NSLock *listLock;
  id v6;
  void *v7;
  void *v8;
  int v9;

  listLock = self->_listLock;
  v6 = a3;
  -[NSLock lock](listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("protocolType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

  }
  else
  {
    v9 = 0;
  }
  -[NSLock unlock](self->_listLock, "unlock");

  return v9;
}

- (void)interceptIncomingNTimes:(int)a3 forEndpoint:(id)a4 connection:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a4;
  v8 = a5;
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_210);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interceptIncomingNTimes:forEndpoint:connection:", v6, v12, v8);

  }
}

void __68__ACCConnectionInfo_interceptIncomingNTimes_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (int)getInterceptCountForEndpoint:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_211);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke_212;
    v13[3] = &unk_1E5FB2E10;
    v13[4] = &v14;
    objc_msgSend(v10, "getInterceptCountForEndpoint:connection:withReply:", v6, v7, v13);

  }
  v11 = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

uint64_t __61__ACCConnectionInfo_getInterceptCountForEndpoint_connection___block_invoke_212(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4;
  return result;
}

- (void)sendData:(id)a3 forEndpoint:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_endpointList, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendData:forEndpoint:connection:", v13, v8, v9);

  }
  -[NSLock unlock](self->_listLock, "unlock");

}

void __53__ACCConnectionInfo_sendData_forEndpoint_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

+ (id)accessoryDictionaryForLogging:(id)a3
{
  return +[ACCExternalAccessoryProvider accessoryDictionaryForLogging:](ACCExternalAccessoryProvider, "accessoryDictionaryForLogging:", a3);
}

- (void)getAccessoryUserName:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_216);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAccessoryUserName:withReply:", v6, v7);

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 8;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v8 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getAccessoryUserName: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __52__ACCConnectionInfo_getAccessoryUserName_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)setAccessoryUserName:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 7;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)(gLogObjects + 56);
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
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setAccessoryUserName:%@", (uint8_t *)&v19, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v15, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_217);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessoryUserName:forEndpoint:withReply:", v8, v9, v11);

  }
  else
  {
    if (v13)
    {
      v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setAccessoryUserName:%@ %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0x16u);
    }
  }

}

void __64__ACCConnectionInfo_setAccessoryUserName_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)provisionAccessoryForFindMy:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 7;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 56);
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
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo provisionAccessoryForFindMy:withReply:", (uint8_t *)&v21, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ACCConnectionInfo serverConnection](self, "serverConnection");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject remoteObjectProxyWithErrorHandler:](v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_218);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "provisionAccessoryForFindMy:withReply:", v6, v8);

      goto LABEL_33;
    }
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v17 = "ACCConnectionInfo provisionAccessoryForFindMy:withReply: !self.serverConnection";
      v18 = v12;
      v19 = 2;
      goto LABEL_32;
    }
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v6;
      v17 = "ACCConnectionInfo provisionAccessoryForFindMy: %@ endpoint, ERROR: called with no reply block!!!";
      v18 = v12;
      v19 = 12;
LABEL_32:
      _os_log_impl(&dword_1AF649000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
    }
  }
LABEL_33:

}

void __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke_cold_1();

}

- (void)getPairingStatus:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 7;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 56);
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
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: %@ endpoint", buf, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_219);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke_220;
    v17[3] = &unk_1E5FB2E58;
    v18 = v8;
    objc_msgSend(v15, "getPairingStatus:withReply:", v6, v17);

    v12 = v18;
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }

}

void __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __48__ACCConnectionInfo_getPairingStatus_withReply___block_invoke_220(uint64_t a1, int a2, void *a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (gLogObjects)
    v6 = gNumLogObjects < 8;
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
    v8 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1AF649000, v8, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPairingStatus: reply %d", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetPairingInformation:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 7;
  else
    v9 = 1;
  v10 = !v9;
  if (v7)
  {
    if (v10)
    {
      v11 = *(id *)(gLogObjects + 56);
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
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo resetPairingInformation: %@ endpoint", (uint8_t *)&v16, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_222);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetPairingInformation:withReply:", v6, v8);

  }
  else
  {
    if (v10)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo resetPairingInformation: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v16, 0xCu);
    }
  }

}

void __55__ACCConnectionInfo_resetPairingInformation_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)getPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 7;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)(gLogObjects + 56);
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
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPrivateNVMKeyValues: %@", (uint8_t *)&v19, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v15, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_223);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getPrivateNVMKeyValues:forEndpoint:withReply:", v8, v9, v11);

  }
  else
  {
    if (v13)
    {
      v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPrivateNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0xCu);
    }
  }

}

void __66__ACCConnectionInfo_getPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)setPrivateNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 7;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)(gLogObjects + 56);
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
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPrivateNVMKeyValues: %@", (uint8_t *)&v19, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v15, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_224);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrivateNVMKeyValues:forEndpoint:withReply:", v8, v9, v11);

  }
  else
  {
    if (v13)
    {
      v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPrivateNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v19, 0xCu);
    }
  }

}

void __66__ACCConnectionInfo_setPrivateNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)getPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (gLogObjects)
    v12 = gNumLogObjects <= 7;
  else
    v12 = 1;
  v13 = !v12;
  if (v10)
  {
    if (v13)
    {
      v14 = *(id *)(gLogObjects + 56);
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
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: %@", buf, 0xCu);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_225);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_226;
    v20[3] = &unk_1E5FB2E80;
    v21 = v11;
    objc_msgSend(v18, "getPublicNVMKeyValues:forEndpoint:withReply:", v8, v9, v20);

    v15 = v21;
  }
  else
  {
    if (v13)
    {
      v15 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v15 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1AF649000, v15, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo getPublicNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }

}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 8;
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
    v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109120;
    LODWORD(v16) = v5 != 0;
    _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: hasDict:%d", (uint8_t *)&v15, 8u);
  }

  if (gLogObjects)
    v10 = gNumLogObjects <= 7;
  else
    v10 = 1;
  v11 = !v10;
  if (v5)
  {
    if (v11)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1AF649000, v12, OS_LOG_TYPE_DEFAULT, "AccConnectionInfo: getPublicNVMKeyValues: dict:%@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      v12 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v12 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_226_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPublicNVMKeyValues:(id)a3 forEndpoint:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 8;
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
    v13 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: %@", (uint8_t *)&v21, 0xCu);
  }

  if (gLogObjects)
    v14 = gNumLogObjects <= 7;
  else
    v14 = 1;
  v15 = !v14;
  if (v10)
  {
    if (v15)
    {
      v16 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1AF649000, v16, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: reply", (uint8_t *)&v21, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v17, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_228);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPublicNVMKeyValues:forEndpoint:withReply:", v8, v9, v10);

  }
  else
  {
    if (v15)
    {
      v17 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v17 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1AF649000, v17, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo setPublicNVMKeyValues: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v21, 0xCu);
    }
  }

}

void __65__ACCConnectionInfo_setPublicNVMKeyValues_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)beginVendorKeyErase:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects)
    v11 = gNumLogObjects <= 7;
  else
    v11 = 1;
  v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_229);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginVendorKeyErase:withReply:", v6, v7);

  }
  else
  {
    if (v12)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }

}

void __51__ACCConnectionInfo_beginVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)continueVendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 8;
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
    v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase", (uint8_t *)&v27, 2u);
  }

  if (gLogObjects)
    v20 = gNumLogObjects <= 7;
  else
    v20 = 1;
  v21 = !v20;
  if (v16)
  {
    if (v21)
    {
      v22 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v22 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1AF649000, v22, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase: reply", (uint8_t *)&v27, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v23, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_230);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "continueVendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:", v12, v13, v14, v15, v16);

  }
  else
  {
    if (v21)
    {
      v23 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v23 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1AF649000, v23, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v27, 0xCu);
    }
  }

}

void __98__ACCConnectionInfo_continueVendorKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)cancelVendorKeyErase:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects)
    v11 = gNumLogObjects <= 7;
  else
    v11 = 1;
  v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_231);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelVendorKeyErase:withReply:", v6, v7);

  }
  else
  {
    if (v12)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelVendorKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }

}

void __52__ACCConnectionInfo_cancelVendorKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)beginUserKeyErase:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects)
    v11 = gNumLogObjects <= 7;
  else
    v11 = 1;
  v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_232);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginUserKeyErase:withReply:", v6, v7);

  }
  else
  {
    if (v12)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo beginUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }

}

void __49__ACCConnectionInfo_beginUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 withReply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 8;
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
    v19 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_1AF649000, v19, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase", (uint8_t *)&v27, 2u);
  }

  if (gLogObjects)
    v20 = gNumLogObjects <= 7;
  else
    v20 = 1;
  v21 = !v20;
  if (v16)
  {
    if (v21)
    {
      v22 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v22 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1AF649000, v22, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase: reply", (uint8_t *)&v27, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v23, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_233);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:", v12, v13, v14, v15, v16);

  }
  else
  {
    if (v21)
    {
      v23 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v23 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1AF649000, v23, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo continueUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v27, 0xCu);
    }
  }

}

void __96__ACCConnectionInfo_continueUserKeyErase_withSignature_andAccessoryNonce_forEndpoint_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)cancelUserKeyErase:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase", (uint8_t *)&v18, 2u);
  }

  if (gLogObjects)
    v11 = gNumLogObjects <= 7;
  else
    v11 = 1;
  v12 = !v11;
  if (v7)
  {
    if (v12)
    {
      v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase: reply", (uint8_t *)&v18, 2u);
    }

    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_234);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelUserKeyErase:withReply:", v6, v7);

  }
  else
  {
    if (v12)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v14 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1AF649000, v14, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo cancelUserKeyErase: %@ endpoint, ERROR: called with no reply block!!!", (uint8_t *)&v18, 0xCu);
    }
  }

}

void __50__ACCConnectionInfo_cancelUserKeyErase_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

- (void)copyUserPrivateKey:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
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
    v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF649000, v10, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey", buf, 2u);
  }

  if (v7)
  {
    -[ACCConnectionInfo serverConnection](self, "serverConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_235);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke_236;
    v15[3] = &unk_1E5FB2EA8;
    v16 = v7;
    objc_msgSend(v12, "copyUserPrivateKey:withReply:", v6, v15);

    v13 = v16;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v13 = *(id *)(gLogObjects + 56);
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
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1AF649000, v13, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey: %@ endpoint, ERROR: called with no reply block!!!", buf, 0xCu);
    }
  }

}

void __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 8;
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
    v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1();

}

void __50__ACCConnectionInfo_copyUserPrivateKey_withReply___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 8;
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
    v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_DEFAULT, "ACCConnectionInfo copyUserPrivateKey: reply", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSDictionary)accessoryFilterDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
  objc_storeStrong((id *)&self->_providerUID, a3);
}

- (ACCConnectionInfoPrivateDelegateProtocol)delegate
{
  return (ACCConnectionInfoPrivateDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACCConnectionInfoPrivateDelegateProtocol)delegateForIdentifier
{
  return (ACCConnectionInfoPrivateDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegateForIdentifier);
}

- (void)setDelegateForIdentifier:(id)a3
{
  objc_storeWeak((id *)&self->_delegateForIdentifier, a3);
}

- (ACCConnectionInfoConfigStreamDelegateProtocol)configStreamDelegate
{
  return (ACCConnectionInfoConfigStreamDelegateProtocol *)objc_loadWeakRetained((id *)&self->_configStreamDelegate);
}

- (void)setConfigStreamDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configStreamDelegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (NSLock)serverConnectionLock
{
  return self->_serverConnectionLock;
}

- (void)setServerConnectionLock:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnectionLock, a3);
}

- (ACCConnectionInfoXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSLock)listLock
{
  return self->_listLock;
}

- (void)setListLock:(id)a3
{
  objc_storeStrong((id *)&self->_listLock, a3);
}

- (NSMutableDictionary)connectionList
{
  return self->_connectionList;
}

- (void)setConnectionList:(id)a3
{
  objc_storeStrong((id *)&self->_connectionList, a3);
}

- (NSMutableDictionary)endpointList
{
  return self->_endpointList;
}

- (void)setEndpointList:(id)a3
{
  objc_storeStrong((id *)&self->_endpointList, a3);
}

- (id)configStreamGetResponseHandler
{
  return self->_configStreamGetResponseHandler;
}

- (void)setConfigStreamGetResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configStreamGetResponseHandler, 0);
  objc_storeStrong((id *)&self->_endpointList, 0);
  objc_storeStrong((id *)&self->_connectionList, 0);
  objc_storeStrong((id *)&self->_listLock, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnectionLock, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_configStreamDelegate);
  objc_destroyWeak((id *)&self->_delegateForIdentifier);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_accessoryFilterDictionary, 0);
}

- (void)copyLocalizedAccessoryNameFromDaemon:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1AF649000, v1, OS_LOG_TYPE_ERROR, "No serverConnection, cannot localize: name: %@ -> %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __58__ACCConnectionInfo_copyLocalizedAccessoryNameFromDaemon___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "XPC connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__ACCConnectionInfo_provisionAccessoryForFindMy_withReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "ACCConnectionInfo provisionAccessoryForFindMy: XPC connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__ACCConnectionInfo_getPublicNVMKeyValues_forEndpoint_withReply___block_invoke_226_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "AccConnectionInfo: getPublicNVMKeyValues: error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
