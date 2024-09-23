@implementation ACCCommunicationsCenter

- (ACCCommunicationsCenter)init
{

  return 0;
}

- (ACCCommunicationsCenter)initWithCallStateDelegate:(id)a3 andCommunicationsDelegate:(id)a4 andCallControlsDelegate:(id)a5 andListUpdatesDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ACCCommunicationsCenter *v14;
  ACCCommunicationsCenter *v15;
  NSXPCConnection *serverConnection;
  ACCCommunicationsXPCServerProtocol *remoteObject;
  NSSet *subscriberList;
  uint64_t v19;
  NSMutableDictionary *callStateCache;
  uint64_t v21;
  NSMutableDictionary *cachedCommStatus;
  NSObject *v23;
  id v24;
  int isServerAvailable;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, int);
  void *v30;
  id v31;
  id location;
  objc_super v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  init_logging();
  v33.receiver = self;
  v33.super_class = (Class)ACCCommunicationsCenter;
  v14 = -[ACCCommunicationsCenter init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_callStateDelegate, v10);
    objc_storeWeak((id *)&v15->_communicationsDelegate, v11);
    objc_storeWeak((id *)&v15->_callControlsDelegate, v12);
    objc_storeWeak((id *)&v15->_listUpdatesDelegate, v13);
    *(int64x2_t *)&v15->_maxRecentsListEntries = vdupq_n_s64(0x32uLL);
    serverConnection = v15->_serverConnection;
    v15->_serverConnection = 0;

    remoteObject = v15->_remoteObject;
    v15->_remoteObject = 0;

    subscriberList = v15->_subscriberList;
    v15->_subscriberList = 0;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    callStateCache = v15->_callStateCache;
    v15->_callStateCache = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    cachedCommStatus = v15->_cachedCommStatus;
    v15->_cachedCommStatus = (NSMutableDictionary *)v21;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __126__ACCCommunicationsCenter_initWithCallStateDelegate_andCommunicationsDelegate_andCallControlsDelegate_andListUpdatesDelegate___block_invoke;
    v30 = &unk_24DA64D70;
    objc_copyWeak(&v31, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.communications.availability-changed", &v27);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v23 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      isServerAvailable = accessoryServer_isServerAvailable();
      *(_DWORD *)buf = 67109120;
      v35 = isServerAvailable;
      _os_log_impl(&dword_21904D000, v23, OS_LOG_TYPE_DEFAULT, "Server available: %d", buf, 8u);
    }

    -[ACCCommunicationsCenter connectToServer](v15, "connectToServer", v27, v28, v29, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __126__ACCCommunicationsCenter_initWithCallStateDelegate_andCommunicationsDelegate_andCallControlsDelegate_andListUpdatesDelegate___block_invoke(uint64_t a1, int a2)
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
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
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
    _os_log_impl(&dword_21904D000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21904D000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCCommunicationsCenter serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ACCCommunicationsCenter;
  -[ACCCommunicationsCenter dealloc](&v4, sel_dealloc);
}

- (void)connectToServer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21904D000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

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
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21904D000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }

}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_87(uint64_t a1)
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
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21904D000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_88(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __42__ACCCommunicationsCenter_connectToServer__block_invoke_88_cold_1();

}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_90(uint64_t a1, int a2)
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
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
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
    _os_log_impl(&dword_21904D000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)callStateDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  char v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACCCommunicationsCenter subscriberList](self, "subscriberList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("CallStateUpdates"));
  if (v4 && v6)
  {
    v7 = objc_msgSend(v4, "count");

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412290;
        v37 = v10;
        _os_log_impl(&dword_21904D000, v8, OS_LOG_TYPE_INFO, "Received call state update for callUUID: %@!", (uint8_t *)&v36, 0xCu);

      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ACCCommunicationsCenter callStateDidChange:].cold.10();

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_67;
      -[ACCCommunicationsCenter callStateCache](self, "callStateCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!gLogObjects)
        goto LABEL_77;
      if (gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
LABEL_77:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v17 = MEMORY[0x24BDACB70];
        v18 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ACCCommunicationsCenter callStateDidChange:].cold.8();

      v19 = objc_msgSend(v4, "isEqual:", v16);
      if ((v19 & 1) == 0)
      {
        if (gLogObjects)
          v20 = gNumLogObjects <= 0;
        else
          v20 = 1;
        v21 = !v20;
        if (v16)
        {
          if (v21)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            v22 = MEMORY[0x24BDACB70];
            v23 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[ACCCommunicationsCenter callStateDidChange:].cold.6(v4, (uint64_t)CFSTR("CallUUID"));
        }
        else
        {
          if (v21)
          {
            v22 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            v22 = MEMORY[0x24BDACB70];
            v24 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[ACCCommunicationsCenter callStateDidChange:].cold.4(v4, (uint64_t)CFSTR("CallUUID"));
        }

        -[ACCCommunicationsCenter callStateCache](self, "callStateCache");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v4, v26);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Status"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqual:", &unk_24DA65E68);

      if (v28)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v29 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
          v29 = MEMORY[0x24BDACB70];
          v30 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[ACCCommunicationsCenter callStateDidChange:].cold.2(v4, (uint64_t)CFSTR("CallUUID"));

        -[ACCCommunicationsCenter callStateCache](self, "callStateCache");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObjectForKey:", v32);

      }
      if ((v19 & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v33 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
          v33 = MEMORY[0x24BDACB70];
          v34 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CallUUID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138412290;
          v37 = v35;
          _os_log_impl(&dword_21904D000, v33, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate call state update for callUUID: %@!", (uint8_t *)&v36, 0xCu);

        }
      }
      else
      {
LABEL_67:
        -[ACCCommunicationsCenter remoteObject](self, "remoteObject");
        v33 = objc_claimAutoreleasedReturnValue();
        -[NSObject callStateDidChange:](v33, "callStateDidChange:", v4);
      }

    }
  }
  else
  {

  }
}

- (void)commStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  -[ACCCommunicationsCenter subscriberList](self, "subscriberList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("CommunicationsUpdates"));
  if (!v4 || !v6)
  {
LABEL_30:

    goto LABEL_31;
  }
  v7 = objc_msgSend(v4, "count");

  if (v7)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21904D000, v8, OS_LOG_TYPE_INFO, "Received comm status update!", v18, 2u);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACCCommunicationsCenter commStatusDidChange:].cold.3();

    v12 = (void *)MEMORY[0x24BDBCE70];
    -[ACCCommunicationsCenter cachedCommStatus](self, "cachedCommStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryOfChangesBetween:and:", v13, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACCCommunicationsCenter commStatusDidChange:].cold.1();

    -[ACCCommunicationsCenter cachedCommStatus](self, "cachedCommStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v5);

    if (objc_msgSend(v5, "count"))
    {
      -[ACCCommunicationsCenter remoteObject](self, "remoteObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "commStatusDidChange:", v5);

    }
    goto LABEL_30;
  }
LABEL_31:

}

- (void)recentsListDidChange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21904D000, v2, v3, "recentsList.count: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5();
}

- (void)favoritesListDidChange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21904D000, v2, v3, "favoritesList.count: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5();
}

- (void)updateSubscriberList:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACCCommunicationsCenter updateSubscriberList:withReply:].cold.1();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCCommunicationsCenter setSubscriberList:](self, "setSubscriberList:", v11);

  }
  if (v7)
    v7[2](v7, 1);

}

- (void)triggerCallStateUpdatesWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  const __CFString *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21904D000, v7, OS_LOG_TYPE_INFO, "Triggering call state updates for current calls...", buf, 2u);
  }

  -[ACCCommunicationsCenter callStateDelegate](self, "callStateDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[ACCCommunicationsCenter callStateDelegate](self, "callStateDelegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[ACCCommunicationsCenter callStateDelegate](self, "callStateDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentCallStates");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13 && -[NSObject count](v13, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v13;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            -[ACCCommunicationsCenter remoteObject](self, "remoteObject", (_QWORD)v24);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "callStateDidChange:", v18);

          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        }
        while (v15);
      }

      v20 = 1;
    }
    else
    {
      v29 = CFSTR("Status");
      v30 = &unk_24DA65E68;
      v20 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCCommunicationsCenter remoteObject](self, "remoteObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "callStateDidChange:", v22);

    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v13 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21904D000, v13, OS_LOG_TYPE_INFO, "This client doesn't handle call state updates!", buf, 2u);
    }
    v20 = 0;
  }

  if (v4)
    v4[2](v4, v20);

}

- (void)triggerCommunicationsUpdateWithReply:(id)a3
{
  void (**v4)(id, uint64_t);
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21904D000, v7, OS_LOG_TYPE_INFO, "Triggering communications update...", buf, 2u);
  }

  -[ACCCommunicationsCenter communicationsDelegate](self, "communicationsDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[ACCCommunicationsCenter communicationsDelegate](self, "communicationsDelegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[ACCCommunicationsCenter communicationsDelegate](self, "communicationsDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentCommunicationsStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("TTYStatus"));
    v15 = objc_msgSend(v14, "copy");

    if (v15)
    {
      -[ACCCommunicationsCenter cachedCommStatus](self, "cachedCommStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v15);

    }
    -[ACCCommunicationsCenter remoteObject](self, "remoteObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commStatusDidChange:", v15);

    v18 = 1;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v15 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21904D000, v15, OS_LOG_TYPE_INFO, "This client doesn't handle call state updates!", v20, 2u);
    }
    v18 = 0;
  }

  if (v4)
    v4[2](v4, v18);

}

- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void (**v8)(id, uint64_t);
  BOOL v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = "NO";
    if (v5)
      v12 = "YES";
    v30 = 67109378;
    v31 = v6;
    v32 = 2080;
    v33 = v12;
    _os_log_impl(&dword_21904D000, v11, OS_LOG_TYPE_INFO, "Triggering list update... (listType: %{coreacc:ACCCommunications_ListUpdate_Type_t}d, coalesce: %s)", (uint8_t *)&v30, 0x12u);
  }

  if ((_DWORD)v6 == 1)
  {
    -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentFavoritesListWithLimit:", 50);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ACCCommunicationsCenter maxFavoritesListEntries](self, "maxFavoritesListEntries");
        goto LABEL_21;
      }
    }
  }
  else if (!(_DWORD)v6)
  {
    -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[ACCCommunicationsCenter listUpdatesDelegate](self, "listUpdatesDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentRecentsListWithCoalescing:limit:", v5, 50);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ACCCommunicationsCenter maxRecentsListEntries](self, "maxRecentsListEntries");
LABEL_21:
        objc_msgSend(v18, "truncatedArray:", v19);
        v24 = objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v25 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
            v25 = MEMORY[0x24BDACB70];
            v28 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v30 = 67109120;
            v31 = v6;
            _os_log_impl(&dword_21904D000, v25, OS_LOG_TYPE_INFO, "List unavailable! (listType: %{coreacc:ACCCommunications_ListUpdate_Type_t}d)", (uint8_t *)&v30, 8u);
          }

        }
        -[ACCCommunicationsCenter remoteObject](self, "remoteObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "listUpdate:forType:coalesced:", v24, v6, v5);

        v27 = 1;
        goto LABEL_41;
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v24 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v30 = 67109120;
    v31 = v6;
    _os_log_impl(&dword_21904D000, v24, OS_LOG_TYPE_INFO, "This client doesn't handle %{coreacc:ACCCommunications_ListUpdate_Type_t}d list updates!", (uint8_t *)&v30, 8u);
  }
  v27 = 0;
LABEL_41:

  if (v8)
    v8[2](v8, v27);

}

- (void)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = 138478339;
    v19 = v8;
    v20 = 1024;
    v21 = v6;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_21904D000, v12, OS_LOG_TYPE_INFO, "Initiating call to destinationID: %{private}@, withService: %{coreacc:ACCCommunications_CallService_t}d, addressBookID: %@...", (uint8_t *)&v18, 0x1Cu);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "initiateCallToDestination:withService:addressBookID:", v8, v6, v9);

    }
  }

}

- (void)initiateCallToVoicemail
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21904D000, v5, OS_LOG_TYPE_INFO, "Initiating call to voicemail...", v11, 2u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "initiateCallToVoicemail");

    }
  }
}

- (void)initiateRedial
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21904D000, v5, OS_LOG_TYPE_INFO, "Initiating redial...", v11, 2u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "initiateRedial");

    }
  }
}

- (void)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21904D000, v9, OS_LOG_TYPE_INFO, "Accepting call with acceptAction: %{coreacc:ACCCommunications_CallControls_AcceptAction_t}d, callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acceptCallWithAction:callUUID:", v4, v6);

    }
  }

}

- (void)endCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21904D000, v9, OS_LOG_TYPE_INFO, "Ending call with endAction: %{coreacc:ACCCommunications_CallControls_EndAction_t}d, callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endCallWithAction:callUUID:", v4, v6);

    }
  }

}

- (void)endAllCalls
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21904D000, v5, OS_LOG_TYPE_INFO, "Ending all calls...", v11, 2u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endAllCalls");

    }
  }
}

- (void)swapCalls
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21904D000, v5, OS_LOG_TYPE_INFO, "Swapping calls...", v11, 2u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "swapCalls");

    }
  }
}

- (void)mergeCalls
{
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21904D000, v5, OS_LOG_TYPE_INFO, "Merging calls...", v11, 2u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mergeCalls");

    }
  }
}

- (void)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    if (v4)
      v10 = "YES";
    v16 = 136315394;
    v17 = v10;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_21904D000, v9, OS_LOG_TYPE_INFO, "Updating hold status to: %s for callUUID: %@...", (uint8_t *)&v16, 0x16u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateHoldStatus:forCallWithUUID:", v4, v6);

    }
  }

}

- (void)updateMuteStatus:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "NO";
    if (v3)
      v8 = "YES";
    v14 = 136315138;
    v15 = v8;
    _os_log_impl(&dword_21904D000, v7, OS_LOG_TYPE_INFO, "Updating mute status to: %s...", (uint8_t *)&v14, 0xCu);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateMuteStatus:", v3);

    }
  }
}

- (void)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21904D000, v9, OS_LOG_TYPE_INFO, "Sending DTMF tone: %{coreacc:ACCCommunications_CallControls_DTMFTone_t}d for callUUID: %@", (uint8_t *)v15, 0x12u);
  }

  -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[ACCCommunicationsCenter callControlsDelegate](self, "callControlsDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendDTMF:forCallWithUUID:", v4, v6);

    }
  }

}

- (ACCCommunicationsCenterCallStateDelegate)callStateDelegate
{
  return (ACCCommunicationsCenterCallStateDelegate *)objc_loadWeakRetained((id *)&self->_callStateDelegate);
}

- (void)setCallStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callStateDelegate, a3);
}

- (ACCCommunicationsCenterCommunicationsDelegate)communicationsDelegate
{
  return (ACCCommunicationsCenterCommunicationsDelegate *)objc_loadWeakRetained((id *)&self->_communicationsDelegate);
}

- (void)setCommunicationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_communicationsDelegate, a3);
}

- (ACCCommunicationsCenterCallControlsDelegate)callControlsDelegate
{
  return (ACCCommunicationsCenterCallControlsDelegate *)objc_loadWeakRetained((id *)&self->_callControlsDelegate);
}

- (void)setCallControlsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_callControlsDelegate, a3);
}

- (ACCCommunicationsCenterListUpdatesDelegate)listUpdatesDelegate
{
  return (ACCCommunicationsCenterListUpdatesDelegate *)objc_loadWeakRetained((id *)&self->_listUpdatesDelegate);
}

- (void)setListUpdatesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listUpdatesDelegate, a3);
}

- (unint64_t)maxRecentsListEntries
{
  return self->_maxRecentsListEntries;
}

- (unint64_t)maxFavoritesListEntries
{
  return self->_maxFavoritesListEntries;
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (ACCCommunicationsXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSSet)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberList, a3);
}

- (NSMutableDictionary)callStateCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCallStateCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)cachedCommStatus
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedCommStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCommStatus, 0);
  objc_storeStrong((id *)&self->_callStateCache, 0);
  objc_storeStrong((id *)&self->_subscriberList, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_listUpdatesDelegate);
  objc_destroyWeak((id *)&self->_callControlsDelegate);
  objc_destroyWeak((id *)&self->_communicationsDelegate);
  objc_destroyWeak((id *)&self->_callStateDelegate);
}

void __42__ACCCommunicationsCenter_connectToServer__block_invoke_88_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21904D000, v0, OS_LOG_TYPE_ERROR, "XPC connection error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)callStateDidChange:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21904D000, v3, v4, "Removing call state from cache (callUUID: %@)...", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)callStateDidChange:(void *)a1 .cold.4(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21904D000, v3, v4, "Adding call state to cache (callUUID: %@)...", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)callStateDidChange:(void *)a1 .cold.6(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_21904D000, v3, v4, "Updating call state to cache (callUUID: %@)...", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)callStateDidChange:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21904D000, v0, v1, "cachedCallState: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)callStateDidChange:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21904D000, v0, v1, "callState: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)commStatusDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21904D000, v0, v1, "filteredCommStatus: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)commStatusDidChange:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21904D000, v0, v1, "commStatus: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)updateSubscriberList:withReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21904D000, v0, v1, "Received subscriberList update: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
