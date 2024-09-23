@implementation ACCNavigationProvider

- (ACCNavigationProvider)initWithDelegate:(id)a3
{
  id v4;
  ACCNavigationProvider *v5;
  void *v6;
  uint64_t v7;
  NSString *providerUID;
  NSObject *v9;
  id v10;
  NSString *v11;
  NSMutableArray *v12;
  NSMutableArray *delegates;
  NSXPCConnection *serverConnection;
  ACCNavigationXPCServerProtocol *remoteObject;
  NSMutableDictionary *v16;
  NSMutableDictionary *accessories;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  init_logging();
  v21.receiver = self;
  v21.super_class = (Class)ACCNavigationProvider;
  v5 = -[ACCNavigationProvider init](&v21, sel_init);
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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v5->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_219FB5000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ACCNavigationProvider init, _providerUID=%@", buf, 0xCu);
    }

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    delegates = v5->_delegates;
    v5->_delegates = v12;

    -[NSMutableArray addObject:](v5->_delegates, "addObject:", v4);
    serverConnection = v5->_serverConnection;
    v5->_serverConnection = 0;

    remoteObject = v5->_remoteObject;
    v5->_remoteObject = 0;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessories = v5->_accessories;
    v5->_accessories = v16;

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __42__ACCNavigationProvider_initWithDelegate___block_invoke;
    v19[3] = &unk_24DC30850;
    objc_copyWeak(&v20, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.navigation.availability-changed", v19);
    -[ACCNavigationProvider connectToServer](v5, "connectToServer");
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __42__ACCNavigationProvider_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
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
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_219FB5000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *delegates;
  ACCNavigationXPCServerProtocol *remoteObject;
  NSMutableDictionary *accessories;
  NSString *providerUID;
  objc_super v8;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCNavigationProvider serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ACCNavigationProvider setServerConnection:](self, "setServerConnection:", 0);
  delegates = self->_delegates;
  self->_delegates = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  providerUID = self->_providerUID;
  self->_providerUID = 0;

  v8.receiver = self;
  v8.super_class = (Class)ACCNavigationProvider;
  -[ACCNavigationProvider dealloc](&v8, sel_dealloc);
}

- (void)connectToServer
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_219FB5000, log, OS_LOG_TYPE_DEBUG, "[#Navigation] Call initConnection to remoteObject=%@", buf, 0xCu);

}

void __40__ACCNavigationProvider_connectToServer__block_invoke(uint64_t a1)
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
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "detachAllAccessories");

}

void __40__ACCNavigationProvider_connectToServer__block_invoke_76(uint64_t a1)
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
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection interrupted!", v8, 2u);
  }

}

void __40__ACCNavigationProvider_connectToServer__block_invoke_77(uint64_t a1, void *a2)
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
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
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
    _os_log_impl(&dword_219FB5000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] %@", (uint8_t *)&v8, 0xCu);
  }

}

void __40__ACCNavigationProvider_connectToServer__block_invoke_79(uint64_t a1, int a2)
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
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
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
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] shouldStayConnected: %d", (uint8_t *)v13, 8u);
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

- (void)detachAllAccessories
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allValues](self->_accessories, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_219FB5000, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] detachAllAccessories: allAccessories=%@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "accessoryUID", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCNavigationProvider accessoryNavigationDetached:](self, "accessoryNavigationDetached:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)delegatesImplementing:(SEL)a3
{
  id v5;
  NSMutableArray **p_delegates;
  NSMutableArray *delegates;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  delegates = self->_delegates;
  p_delegates = &self->_delegates;
  v8 = delegates;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "addObject:", v13, (_QWORD)v18);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACCNavigationProvider delegatesImplementing:].cold.1(a3, (uint64_t)p_delegates, v14);

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (void)accessoryNavigationAttached:(id)a3 componentList:(id)a4
{
  id v6;
  ACCNavigationAccessory *v7;
  ACCNavigationAccessory *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  ACCNavigationAccessoryComponent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ACCNavigationAccessoryObjectDetectionComponent *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t j;
  char *v40;
  uint64_t v41;
  int v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t k;
  char *v57;
  uint64_t v58;
  int v59;
  BOOL v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSMutableDictionary *accessories;
  ACCNavigationAccessory *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  ACCNavigationProvider *v72;
  ACCNavigationAccessory *obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  ACCNavigationAccessory *v90;
  __int16 v91;
  ACCNavigationAccessory *v92;
  __int16 v93;
  const char *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (ACCNavigationAccessory *)a4;
  v71 = v6;
  v72 = self;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v8 = (ACCNavigationAccessory *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v88 = (uint64_t)v71;
    v89 = 2112;
    v90 = v7;
    v91 = 2112;
    v92 = v8;
    _os_log_impl(&dword_219FB5000, v11, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationAttached: %@ componentList: %@, accessory=%@", buf, 0x20u);
  }

  if (v8)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v46 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACCNavigationProvider accessoryNavigationAttached:componentList:].cold.4((uint64_t)v71, (uint64_t)v8, v12);
  }
  else
  {
    v8 = -[ACCNavigationAccessory initWithAccessoryUID:provider:]([ACCNavigationAccessory alloc], "initWithAccessoryUID:provider:", v71, v72);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v7;
    v13 = -[ACCNavigationAccessory countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v83 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_ComponentID);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = objc_alloc_init(ACCNavigationAccessoryComponent);
            -[ACCNavigationAccessoryComponent setIdentifier:](v19, "setIdentifier:", objc_msgSend(v18, "unsignedIntegerValue"));
            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_Name);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setName:](v19, "setName:", v20);

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxCurRoadNameLength);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxLength_CurrentRoadName:](v19, "setMaxLength_CurrentRoadName:", objc_msgSend(v21, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxDestinationNameLength);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxLength_DestinationRoadName:](v19, "setMaxLength_DestinationRoadName:", objc_msgSend(v22, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxAfterManeuverRoadNameLength);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxLength_PostManeuverRoadName:](v19, "setMaxLength_PostManeuverRoadName:", objc_msgSend(v23, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxManeuverDescriptionLength);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxLength_ManeuverDescription:](v19, "setMaxLength_ManeuverDescription:", objc_msgSend(v24, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxMGuidanceManeuverCapacity);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxCapacity_GuidanceManeuver:](v19, "setMaxCapacity_GuidanceManeuver:", objc_msgSend(v25, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxLaneGuidanceDescriptionLength);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxLength_LaneGuidanceDescription:](v19, "setMaxLength_LaneGuidanceDescription:", objc_msgSend(v26, "unsignedIntegerValue"));

            objc_msgSend(v17, "objectForKey:", ACCNav_DispComp_MaxLaneGuidanceStorageCapacity);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryComponent setMaxCapacity_LaneGuidance:](v19, "setMaxCapacity_LaneGuidance:", objc_msgSend(v27, "unsignedIntegerValue"));

            -[ACCNavigationAccessoryComponent setRequestSourceName:](v19, "setRequestSourceName:", 0);
            -[ACCNavigationAccessoryComponent setRequestSourceSupportsRouteGuidance:](v19, "setRequestSourceSupportsRouteGuidance:", 0);
            -[ACCNavigationAccessoryComponent setSupportsExitInfo:](v19, "setSupportsExitInfo:", 0);
            -[ACCNavigationAccessory componentListInternal](v8, "componentListInternal");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v19, v18);

          }
          objc_msgSend(v17, "objectForKey:", ACCNav_RODComp_ComponentID);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v30 = objc_alloc_init(ACCNavigationAccessoryObjectDetectionComponent);
            -[ACCNavigationAccessoryObjectDetectionComponent setIdentifier:](v30, "setIdentifier:", objc_msgSend(v29, "unsignedIntegerValue"));
            objc_msgSend(v17, "objectForKey:", ACCNav_RODComp_Name);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryObjectDetectionComponent setName:](v30, "setName:", v31);

            objc_msgSend(v17, "objectForKey:", ACCNav_RODComp_SupportedTypes);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCNavigationAccessoryObjectDetectionComponent setSupportedTypes:](v30, "setSupportedTypes:", v32);

            -[ACCNavigationAccessory objectDetectionComponentListInternal](v8, "objectDetectionComponentListInternal");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKey:", v30, v29);

          }
        }
        v14 = -[ACCNavigationAccessory countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
      }
      while (v14);
    }

    -[NSMutableDictionary setObject:forKey:](v72->_accessories, "setObject:forKey:", v8, v71);
    -[ACCNavigationProvider delegatesImplementing:](v72, "delegatesImplementing:", sel_navigation_accessoryAttached_);
    v12 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v12, "count"))
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v34 = v12;
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
      if (v35)
      {
        v36 = v35;
        v69 = v12;
        v37 = *(_QWORD *)v79;
        v38 = MEMORY[0x24BDACB70];
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v79 != v37)
              objc_enumerationMutation(v34);
            v40 = *(char **)(*((_QWORD *)&v78 + 1) + 8 * j);
            v41 = gLogObjects;
            v42 = gNumLogObjects;
            if (gLogObjects)
              v43 = gNumLogObjects < 1;
            else
              v43 = 1;
            if (v43)
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v88 = v41;
                v89 = 1024;
                LODWORD(v90) = v42;
                _os_log_error_impl(&dword_219FB5000, v38, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v44 = v38;
              v45 = v38;
            }
            else
            {
              v45 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v88 = (uint64_t)v71;
              v89 = 2112;
              v90 = v8;
              v91 = 2112;
              v92 = obj;
              v93 = 2112;
              v94 = v40;
              _os_log_impl(&dword_219FB5000, v45, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, delegate=%@, notify navigation(route guidance) accessory attached", buf, 0x2Au);
            }

            objc_msgSend(v40, "navigation:accessoryAttached:", v72, v8);
          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v78, v95, 16);
        }
        while (v36);
        v12 = v69;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v34 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v34 = MEMORY[0x24BDACB70];
        v47 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v88 = (uint64_t)v71;
        v89 = 2112;
        v90 = v8;
        v91 = 2112;
        v92 = obj;
        _os_log_impl(&dword_219FB5000, v34, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, no delegate found conforming to protocol: ACCNavigationProviderProtocol", buf, 0x20u);
      }
    }

    -[ACCNavigationAccessory objectDetectionComponentList](v8, "objectDetectionComponentList");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

    if (v49)
    {
      -[ACCNavigationProvider delegatesImplementing:](v72, "delegatesImplementing:", sel_navigationObjectDetection_accessoryAttached_);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "count"))
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v51 = v50;
        v52 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        if (v52)
        {
          v53 = v52;
          v68 = v50;
          v70 = v12;
          v54 = *(_QWORD *)v75;
          v55 = MEMORY[0x24BDACB70];
          do
          {
            for (k = 0; k != v53; ++k)
            {
              if (*(_QWORD *)v75 != v54)
                objc_enumerationMutation(v51);
              v57 = *(char **)(*((_QWORD *)&v74 + 1) + 8 * k);
              v58 = gLogObjects;
              v59 = gNumLogObjects;
              if (gLogObjects)
                v60 = gNumLogObjects < 1;
              else
                v60 = 1;
              if (v60)
              {
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v88 = v58;
                  v89 = 1024;
                  LODWORD(v90) = v59;
                  _os_log_error_impl(&dword_219FB5000, v55, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v61 = v55;
                v62 = v55;
              }
              else
              {
                v62 = *(id *)gLogObjects;
              }
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                v88 = (uint64_t)v71;
                v89 = 2112;
                v90 = v8;
                v91 = 2112;
                v92 = obj;
                v93 = 2112;
                v94 = v57;
                _os_log_impl(&dword_219FB5000, v62, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, delegate=%@, notify navigation(object detection) accessory attached", buf, 0x2Au);
              }

              objc_msgSend(v57, "navigationObjectDetection:accessoryAttached:", v72, v8);
            }
            v53 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
          }
          while (v53);
          v12 = v70;
          v50 = v68;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v51 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
          v51 = MEMORY[0x24BDACB70];
          v63 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v88 = (uint64_t)v71;
          v89 = 2112;
          v90 = v8;
          v91 = 2112;
          v92 = obj;
          _os_log_impl(&dword_219FB5000, v51, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationAttached: accessory %@, accessory=%@ componentList=%@, no delegate found conforming to protocol: ACCNavigationProviderObjectDetectionProtocol", buf, 0x20u);
        }
      }

    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v64 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v64 = MEMORY[0x24BDACB70];
    v65 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    accessories = v72->_accessories;
    -[ACCNavigationAccessory componentListInternal](v8, "componentListInternal");
    v67 = (ACCNavigationAccessory *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v88 = (uint64_t)v71;
    v89 = 2112;
    v90 = (ACCNavigationAccessory *)accessories;
    v91 = 2112;
    v92 = v67;
    v93 = 2080;
    v94 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_debug_impl(&dword_219FB5000, v64, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationAttached: accessory %@, _accessories=%@, accessory.componentListInternal=%@, file: %s", buf, 0x2Au);

  }
}

- (void)accessoryNavigationDetached:(id)a3
{
  NSMutableDictionary **p_accessories;
  NSMutableDictionary *accessories;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t m;
  void *v50;
  uint64_t v51;
  int v52;
  BOOL v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  NSMutableDictionary **v60;
  NSMutableDictionary **v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  ACCNavigationProvider *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v65 = self;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  -[NSMutableDictionary objectForKey:](accessories, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v85 = (uint64_t)v64;
    v86 = 2112;
    v87 = v6;
    _os_log_impl(&dword_219FB5000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationDetached: %@, accessory=%@", buf, 0x16u);
  }

  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v6)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v85 = (uint64_t)v64;
      v86 = 2112;
      v87 = v6;
      _os_log_impl(&dword_219FB5000, v12, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@", buf, 0x16u);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v6, "componentList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v79 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "setIsEnabled:", 0);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      }
      while (v18);
    }

    -[ACCNavigationProvider delegatesImplementing:](v65, "delegatesImplementing:", sel_navigation_accessoryAttached_);
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v13, "count"))
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v21 = v13;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      if (v22)
      {
        v23 = v22;
        v60 = p_accessories;
        v62 = v13;
        v24 = *(_QWORD *)v75;
        v25 = MEMORY[0x24BDACB70];
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v75 != v24)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
            v28 = gLogObjects;
            v29 = gNumLogObjects;
            if (gLogObjects)
              v30 = gNumLogObjects < 1;
            else
              v30 = 1;
            if (v30)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v85 = v28;
                v86 = 1024;
                LODWORD(v87) = v29;
                _os_log_error_impl(&dword_219FB5000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v31 = v25;
              v32 = v25;
            }
            else
            {
              v32 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v85 = (uint64_t)v64;
              v86 = 2112;
              v87 = v6;
              v88 = 2112;
              v89 = v27;
              _os_log_impl(&dword_219FB5000, v32, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, delegate=%@, notify navigation accessory detached", buf, 0x20u);
            }

            objc_msgSend(v27, "navigation:accessoryDetached:", v65, v6);
          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
        }
        while (v23);
        p_accessories = v60;
        v13 = v62;
      }
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
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v34 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v85 = (uint64_t)v64;
        v86 = 2112;
        v87 = v6;
        _os_log_impl(&dword_219FB5000, v21, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, no delgate found conforming to protocol", buf, 0x16u);
      }
    }

    objc_msgSend(v6, "objectDetectionComponentList");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v6, "objectDetectionComponentList");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "allValues");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v71 != v41)
              objc_enumerationMutation(v38);
            objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * k), "setIsEnabled:", 0);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        }
        while (v40);
      }

      -[ACCNavigationProvider delegatesImplementing:](v65, "delegatesImplementing:", sel_navigationObjectDetection_accessoryAttached_);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "count"))
      {
        v63 = v13;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v44 = v43;
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        if (v45)
        {
          v46 = v45;
          v59 = v43;
          v61 = p_accessories;
          v47 = *(_QWORD *)v67;
          v48 = MEMORY[0x24BDACB70];
          do
          {
            for (m = 0; m != v46; ++m)
            {
              if (*(_QWORD *)v67 != v47)
                objc_enumerationMutation(v44);
              v50 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * m);
              v51 = gLogObjects;
              v52 = gNumLogObjects;
              if (gLogObjects)
                v53 = gNumLogObjects < 1;
              else
                v53 = 1;
              if (v53)
              {
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v85 = v51;
                  v86 = 1024;
                  LODWORD(v87) = v52;
                  _os_log_error_impl(&dword_219FB5000, v48, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v54 = v48;
                v55 = v48;
              }
              else
              {
                v55 = *(id *)gLogObjects;
              }
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v85 = (uint64_t)v64;
                v86 = 2112;
                v87 = v6;
                v88 = 2112;
                v89 = v50;
                _os_log_impl(&dword_219FB5000, v55, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, delegate=%@, notify navigation(object detection) accessory detached", buf, 0x20u);
              }

              objc_msgSend(v50, "navigationObjectDetection:accessoryDetached:", v65, v6);
            }
            v46 = -[NSObject countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
          }
          while (v46);
          p_accessories = v61;
          v13 = v63;
          v43 = v59;
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v44 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
          v44 = MEMORY[0x24BDACB70];
          v56 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v85 = (uint64_t)v64;
          v86 = 2112;
          v87 = v6;
          _os_log_impl(&dword_219FB5000, v44, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationDetached: accessory %@, accessory=%@, no delgate found conforming to protocol", buf, 0x16u);
        }
      }

    }
    -[NSMutableDictionary removeObjectForKey:](*p_accessories, "removeObjectForKey:", v64);
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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACCNavigationProvider accessoryNavigationDetached:].cold.3((uint64_t)v64, v13);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v57 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v57 = MEMORY[0x24BDACB70];
    v58 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    -[ACCNavigationProvider accessoryNavigationDetached:].cold.1();

}

- (void)accessoryNavigationStartRouteGuidance:(id)a3 componentIdList:(id)a4 options:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t i;
  const char *v46;
  uint64_t v47;
  int v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  char *v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  __int128 v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *obj;
  NSObject *v64;
  ACCNavigationProvider *v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  NSObject *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  unint64_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v61 = a4;
  v65 = self;
  v66 = v7;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v7);
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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v77 = (uint64_t)v7;
      v78 = 2112;
      v79 = v9;
      v80 = 2112;
      v81 = v61;
      _os_log_impl(&dword_219FB5000, v12, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
    }

    objc_msgSend(v9, "componentListForIdList:", v61);
    v15 = objc_claimAutoreleasedReturnValue();
    v60 = v15;
    if (__PAIR128__((unint64_t)v61, (unint64_t)v15) == 0)
    {
      objc_msgSend(v9, "componentList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allValues");
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v15;
    }
    v64 = v17;
    if (v17)
    {
      v58 = v9;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obj = v17;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v73;
        *(_QWORD *)&v19 = 134218240;
        v57 = v19;
        v22 = (a5 >> 4) & 1;
        v23 = (a5 >> 3) & 1;
        v24 = (a5 >> 2) & 1;
        v25 = (a5 >> 1) & 1;
        do
        {
          v26 = 0;
          v62 = v20;
          do
          {
            if (*(_QWORD *)v73 != v21)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v26);
            v28 = gLogObjects;
            v29 = gNumLogObjects;
            if (gLogObjects)
              v30 = gNumLogObjects < 1;
            else
              v30 = 1;
            if (v30)
            {
              v31 = v25;
              v32 = v24;
              v33 = v23;
              v34 = v22;
              v35 = v21;
              v36 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                v77 = v28;
                v78 = 1024;
                LODWORD(v79) = v29;
                _os_log_error_impl(&dword_219FB5000, v36, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v37 = v36;
              v38 = v36;
              v21 = v35;
              v22 = v34;
              v23 = v33;
              v24 = v32;
              v25 = v31;
              v20 = v62;
            }
            else
            {
              v38 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = (uint64_t)v66;
              v78 = 2112;
              v79 = v58;
              v80 = 2112;
              v81 = v61;
              _os_log_impl(&dword_219FB5000, v38, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
            }

            objc_msgSend(v27, "setIsEnabled:", 1);
            objc_msgSend(v27, "setRequestSourceName:", a5 & 1);
            objc_msgSend(v27, "setRequestSourceSupportsRouteGuidance:", v25);
            objc_msgSend(v27, "setSupportsExitInfo:", v24);
            objc_msgSend(v27, "setSupportsLaneGuidance:", v23);
            objc_msgSend(v27, "setSupportsTimeZoneOffset:", v22);
            ++v26;
          }
          while (v20 != v26);
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
        }
        while (v20);
      }

      v9 = v58;
      v17 = v64;
    }
    -[ACCNavigationProvider delegatesImplementing:](v65, "delegatesImplementing:", sel_navigation_accessoryAttached_, v57);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "count"))
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v40 = v39;
      v41 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      if (v41)
      {
        v42 = v41;
        v59 = v39;
        v43 = *(_QWORD *)v69;
        v44 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v69 != v43)
              objc_enumerationMutation(v40);
            v46 = *(const char **)(*((_QWORD *)&v68 + 1) + 8 * i);
            v47 = gLogObjects;
            v48 = gNumLogObjects;
            if (gLogObjects)
              v49 = gNumLogObjects < 1;
            else
              v49 = 1;
            if (v49)
            {
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v77 = v47;
                v78 = 1024;
                LODWORD(v79) = v48;
                _os_log_error_impl(&dword_219FB5000, v44, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v50 = v44;
              v51 = v44;
            }
            else
            {
              v51 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              v77 = (uint64_t)v66;
              v78 = 2112;
              v79 = v9;
              v80 = 2112;
              v81 = v60;
              v82 = 2112;
              v83 = v46;
              v84 = 2048;
              v85 = a5;
              _os_log_impl(&dword_219FB5000, v51, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentList=%@, delegate=%@, options=%llxh", buf, 0x34u);
            }

            v52 = (char *)v46;
            v17 = v64;
            objc_msgSend(v52, "navigation:startRouteGuidance:componentList:", v65, v9, v64);
          }
          v42 = -[NSObject countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
        }
        while (v42);
        v39 = v59;
        v13 = v60;
      }
      else
      {
        v13 = v60;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v40 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v40 = MEMORY[0x24BDACB70];
        v54 = MEMORY[0x24BDACB70];
      }
      v13 = v60;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v77 = (uint64_t)v66;
        v78 = 2112;
        v79 = v9;
        v80 = 2112;
        v81 = v60;
        _os_log_impl(&dword_219FB5000, v40, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentList=%@, no delgate found conforming to protocol", buf, 0x20u);
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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v53 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACCNavigationProvider accessoryNavigationStartRouteGuidance:componentIdList:options:].cold.2();
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v55 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v55 = MEMORY[0x24BDACB70];
    v56 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v77 = (uint64_t)v66;
    v78 = 2112;
    v79 = v9;
    v80 = 2112;
    v81 = v61;
    v82 = 2080;
    v83 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_debug_impl(&dword_219FB5000, v55, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationStartRouteGuidance: accessory %@, accessory=%@ componentIdList=%@, file: %s", buf, 0x2Au);
  }

}

- (void)accessoryNavigationStopRouteGuidance:(id)a3 componentIdList:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t i;
  char *v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  ACCNavigationProvider *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  const char *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (unint64_t)a4;
  v42 = v6;
  v43 = self;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  v44 = (void *)v8;
  if (v8)
  {
    if (v10)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v54 = (uint64_t)v6;
      v55 = 2112;
      v56 = v44;
      v57 = 2112;
      v58 = v7;
      _os_log_impl(&dword_219FB5000, v11, OS_LOG_TYPE_DEFAULT, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentIdList=%@", buf, 0x20u);
    }

    objc_msgSend(v44, "componentListForIdList:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (v7 | v14)
    {
      v16 = (id)v14;
      if (!v16)
      {
LABEL_29:
        -[ACCNavigationProvider delegatesImplementing:](v43, "delegatesImplementing:", sel_navigation_accessoryAttached_);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v23 = v22;
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
          if (v24)
          {
            v25 = v24;
            v39 = v22;
            v40 = v7;
            v41 = v12;
            v26 = *(_QWORD *)v46;
            v27 = MEMORY[0x24BDACB70];
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v46 != v26)
                  objc_enumerationMutation(v23);
                v29 = *(char **)(*((_QWORD *)&v45 + 1) + 8 * i);
                v30 = gLogObjects;
                v31 = gNumLogObjects;
                if (gLogObjects)
                  v32 = gNumLogObjects < 1;
                else
                  v32 = 1;
                if (v32)
                {
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v54 = v30;
                    v55 = 1024;
                    LODWORD(v56) = v31;
                    _os_log_error_impl(&dword_219FB5000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v33 = v27;
                  v34 = v27;
                }
                else
                {
                  v34 = *(id *)gLogObjects;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138413058;
                  v54 = (uint64_t)v42;
                  v55 = 2112;
                  v56 = v44;
                  v57 = 2112;
                  v58 = v41;
                  v59 = 2112;
                  v60 = v29;
                  _os_log_impl(&dword_219FB5000, v34, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentList=%@, delegate=%@", buf, 0x2Au);
                }

                objc_msgSend(v29, "navigation:stopRouteGuidance:componentList:", v43, v44, v16);
              }
              v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
            }
            while (v25);
            v22 = v39;
            v7 = v40;
            v12 = v41;
          }
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
            v23 = MEMORY[0x24BDACB70];
            v36 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v54 = (uint64_t)v42;
            v55 = 2112;
            v56 = v44;
            v57 = 2112;
            v58 = v12;
            _os_log_impl(&dword_219FB5000, v23, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentList=%@, no delgate found conforming to protocol", buf, 0x20u);
          }
        }

        goto LABEL_62;
      }
    }
    else
    {
      objc_msgSend(v44, "componentList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allValues");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_29;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "setIsEnabled:", 0);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v19);
    }

    goto LABEL_29;
  }
  if (v10)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v35 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[ACCNavigationProvider accessoryNavigationStopRouteGuidance:componentIdList:].cold.2();
LABEL_62:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v37 = MEMORY[0x24BDACB70];
    v38 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v54 = (uint64_t)v42;
    v55 = 2112;
    v56 = v44;
    v57 = 2112;
    v58 = v7;
    v59 = 2080;
    v60 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
    _os_log_impl(&dword_219FB5000, v37, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@, accessory=%@ componentIdList=%@, file: %s", buf, 0x2Au);
  }

}

- (void)accessoryNavigationObjectDetection:(id)a3 componentIdList:(id)a4 updateInfo:(id)a5
{
  id *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  int v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  ACCNavigationRoadObjectDetectionInfo *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t i;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  id *v36;
  int v37;
  BOOL v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  ACCNavigationRoadObjectDetectionInfo *v43;
  NSObject *v44;
  id v45;
  id *v46;
  ACCNavigationRoadObjectDetectionInfo *obj;
  ACCNavigationRoadObjectDetectionInfo *v48;
  ACCNavigationProvider *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  NSObject *v60;
  __int16 v61;
  NSObject *v62;
  __int16 v63;
  ACCNavigationRoadObjectDetectionInfo *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = (id *)a3;
  v9 = a4;
  v10 = a5;
  v49 = self;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0x253DBA000uLL;
  if (v11)
  {
    v14 = -[NSObject objectDetectionComponentIdListIsEnabled:](v11, "objectDetectionComponentIdListIsEnabled:", v9);
    if (gLogObjects)
      v15 = gNumLogObjects <= 0;
    else
      v15 = 1;
    v16 = !v15;
    if (v14)
    {
      if (v16)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v8;
        v57 = 2112;
        v58 = v9;
        v59 = 2112;
        v60 = v10;
        _os_log_impl(&dword_219FB5000, v17, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@", buf, 0x20u);
      }

      -[NSObject componentListForIdList:](v12, "componentListForIdList:", v9);
      v20 = objc_claimAutoreleasedReturnValue();
      -[ACCNavigationProvider delegatesImplementing:](v49, "delegatesImplementing:", sel_navigationObjectDetection_accessoryAttached_);
      v23 = (ACCNavigationRoadObjectDetectionInfo *)objc_claimAutoreleasedReturnValue();
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v24 = MEMORY[0x24BDACB70];
        v26 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        v56 = v8;
        v57 = 2112;
        v58 = v9;
        v59 = 2112;
        v60 = v10;
        v61 = 2112;
        v62 = v20;
        v63 = 2112;
        v64 = v23;
        _os_log_debug_impl(&dword_219FB5000, v24, OS_LOG_TYPE_DEBUG, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, componentList %@, delegateList %@", buf, 0x34u);
      }

      if (-[ACCNavigationRoadObjectDetectionInfo count](v23, "count"))
      {
        v45 = v9;
        v46 = v8;
        v48 = objc_alloc_init(ACCNavigationRoadObjectDetectionInfo);
        v44 = v10;
        -[ACCNavigationRoadObjectDetectionInfo setInfoFromDictionary:](v48, "setInfoFromDictionary:", v10);
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v43 = v23;
        obj = v23;
        v27 = -[ACCNavigationRoadObjectDetectionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v51;
          v30 = MEMORY[0x24BDACB70];
          do
          {
            for (i = 0; i != v28; ++i)
            {
              v32 = v20;
              v33 = v12;
              if (*(_QWORD *)v51 != v29)
                objc_enumerationMutation(obj);
              v34 = *(NSObject **)(*((_QWORD *)&v50 + 1) + 8 * i);
              v35 = v13;
              v36 = *(id **)(v13 + 1536);
              v37 = gNumLogObjects;
              if (v36)
                v38 = gNumLogObjects < 1;
              else
                v38 = 1;
              if (v38)
              {
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v56 = v36;
                  v57 = 1024;
                  LODWORD(v58) = v37;
                  _os_log_error_impl(&dword_219FB5000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v39 = v30;
                v40 = v30;
              }
              else
              {
                v40 = *v36;
              }
              v12 = v33;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413314;
                v56 = v46;
                v57 = 2112;
                v58 = v45;
                v59 = 2112;
                v60 = v33;
                v61 = 2112;
                v62 = v34;
                v63 = 2112;
                v64 = v48;
                _os_log_impl(&dword_219FB5000, v40, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList %@, accessory %@, delegate %@, objectDetectionInfo %@", buf, 0x34u);
              }

              v20 = v32;
              -[NSObject navigationObjectDetection:accessory:updateObjectDetectionInfo:componentList:](v34, "navigationObjectDetection:accessory:updateObjectDetectionInfo:componentList:", v49, v12, v48, v32);
              v13 = v35;
            }
            v28 = -[ACCNavigationRoadObjectDetectionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          }
          while (v28);
        }

        v9 = v45;
        v8 = v46;
        v23 = v43;
        v10 = v44;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v41 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
          v41 = MEMORY[0x24BDACB70];
          v42 = MEMORY[0x24BDACB70];
        }
        v48 = (ACCNavigationRoadObjectDetectionInfo *)v41;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v56 = v8;
          v57 = 2112;
          v58 = v9;
          v59 = 2112;
          v60 = v10;
          v61 = 2112;
          v62 = v12;
          _os_log_impl(&dword_219FB5000, v41, OS_LOG_TYPE_INFO, "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, no delgate found conforming to protocol", buf, 0x2Au);
        }
      }

      goto LABEL_70;
    }
    if (v16)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v20 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v56 = v8;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v10;
      v61 = 2112;
      v62 = v12;
      v21 = "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, no co"
            "mponent is enabled!";
      goto LABEL_36;
    }
  }
  else
  {
    if (gLogObjects)
      v18 = gNumLogObjects < 1;
    else
      v18 = 1;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v20 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    else
    {
      v20 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v56 = v8;
      v57 = 2112;
      v58 = v9;
      v59 = 2112;
      v60 = v10;
      v61 = 2112;
      v62 = 0;
      v21 = "[#Navigation] accessoryNavigationObjectDetection: %@ componentIdList: %@ updateInfo: %@, accessory=%@, acces"
            "sory does not exist!";
LABEL_36:
      _os_log_impl(&dword_219FB5000, v20, OS_LOG_TYPE_INFO, v21, buf, 0x2Au);
    }
  }
LABEL_70:

}

- (void)routeGuidance:(id)a3 updateInfo:(id)a4 componentIdList:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationXPCServerProtocol *remoteObject;
  NSObject *v15;
  void *v16;
  id v17;
  NSString *providerUID;
  int v19;
  id v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_219FB5000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ updateInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && objc_msgSend(v8, "componentIdListIsEnabled:", v10))
  {
    remoteObject = self->_remoteObject;
    objc_msgSend(v8, "accessoryUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)-[NSString copyDictionary](v9, "copyDictionary");
    -[ACCNavigationXPCServerProtocol routeGuidance:updateInfo:componentIdList:](remoteObject, "routeGuidance:updateInfo:componentIdList:", v15, v16, v10);

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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = providerUID;
      _os_log_impl(&dword_219FB5000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }

}

- (void)routeGuidance:(id)a3 maneuverUpdateInfo:(id)a4 componentIdList:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationXPCServerProtocol *remoteObject;
  NSObject *v15;
  void *v16;
  id v17;
  NSString *providerUID;
  int v19;
  id v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_219FB5000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ maneuverUpdateInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && objc_msgSend(v8, "componentIdListIsEnabled:", v10))
  {
    remoteObject = self->_remoteObject;
    objc_msgSend(v8, "accessoryUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)-[NSString copyDictionary](v9, "copyDictionary");
    -[ACCNavigationXPCServerProtocol routeGuidance:maneuverUpdateInfo:componentIdList:](remoteObject, "routeGuidance:maneuverUpdateInfo:componentIdList:", v15, v16, v10);

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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = providerUID;
      _os_log_impl(&dword_219FB5000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }

}

- (void)routeGuidance:(id)a3 laneGuidanceInfo:(id)a4 componentIdList:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationXPCServerProtocol *remoteObject;
  NSObject *v15;
  void *v16;
  id v17;
  NSString *providerUID;
  int v19;
  id v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_219FB5000, v13, OS_LOG_TYPE_INFO, "[#Navigation] routeGuidance: %@ laneGuidanceInfo: %@ componentIdList: %@", (uint8_t *)&v19, 0x20u);
  }

  if (self->_remoteObject && objc_msgSend(v8, "componentIdListIsEnabled:", v10))
  {
    remoteObject = self->_remoteObject;
    objc_msgSend(v8, "accessoryUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)-[NSString copyDictionary](v9, "copyDictionary");
    -[ACCNavigationXPCServerProtocol routeGuidance:laneGuidanceInfo:componentIdList:](remoteObject, "routeGuidance:laneGuidanceInfo:componentIdList:", v15, v16, v10);

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
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = providerUID;
      _os_log_impl(&dword_219FB5000, v15, OS_LOG_TYPE_DEFAULT, "[#Navigation] routeGuidance: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v19, 0x16u);
    }
  }

}

- (void)objectDetection:(id)a3 startComponentIdList:(id)a4 objectTypes:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  ACCNavigationXPCServerProtocol *remoteObject;
  void *v29;
  id v30;
  NSString *providerUID;
  ACCNavigationProvider *v32;
  NSString *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v41 = (uint64_t)v8;
    v42 = 2112;
    v43 = v9;
    v44 = 2112;
    v45 = v10;
    _os_log_impl(&dword_219FB5000, v13, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ startComponentIdList: %@ objectTypes: %@", buf, 0x20u);
  }

  if (self->_remoteObject)
  {
    v32 = self;
    v33 = v9;
    v34 = v10;
    v14 = v8;
    objc_msgSend(v8, "objectDetectionComponentListForIdList:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        v20 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v23 = gLogObjects;
            v24 = gNumLogObjects;
            if (gLogObjects)
              v25 = gNumLogObjects < 1;
            else
              v25 = 1;
            if (v25)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v41 = v23;
                v42 = 1024;
                LODWORD(v43) = v24;
                _os_log_error_impl(&dword_219FB5000, v20, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v26 = v20;
              v27 = v20;
            }
            else
            {
              v27 = *(id *)gLogObjects;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v41 = (uint64_t)v14;
              v42 = 2112;
              v43 = v33;
              v44 = 2112;
              v45 = v34;
              _os_log_impl(&dword_219FB5000, v27, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ startComponentIdList: %@ objectTypes: %@", buf, 0x20u);
            }

            objc_msgSend(v22, "setIsEnabled:", 1);
          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v18);
      }
    }
    remoteObject = v32->_remoteObject;
    v8 = v14;
    objc_msgSend(v14, "accessoryUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    v10 = v34;
    -[ACCNavigationXPCServerProtocol objectDetection:startComponentIdList:objectTypes:](remoteObject, "objectDetection:startComponentIdList:objectTypes:", v29, v33, v34);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v30 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      *(_DWORD *)buf = 138412546;
      v41 = (uint64_t)v8;
      v42 = 2112;
      v43 = providerUID;
      _os_log_impl(&dword_219FB5000, v16, OS_LOG_TYPE_DEFAULT, "[#Navigation] objectDetection: %@, _remoteObject nil, _providerUID=%@", buf, 0x16u);
    }
  }

}

- (void)objectDetection:(id)a3 stopComponentIdList:(id)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSString *providerUID;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  ACCNavigationXPCServerProtocol *remoteObject;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (unint64_t)a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2112;
    v32 = (NSString *)v7;
    _os_log_impl(&dword_219FB5000, v10, OS_LOG_TYPE_INFO, "[#Navigation] objectDetection: %@ stopComponentIdList: %@", buf, 0x16u);
  }

  if (self->_remoteObject && objc_msgSend(v6, "objectDetectionComponentIdListIsEnabled:", v7))
  {
    objc_msgSend(v6, "objectDetectionComponentListForIdList:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7 | v11)
    {
      v14 = (id)v11;
      if (!v14)
      {
LABEL_33:
        remoteObject = self->_remoteObject;
        objc_msgSend(v6, "accessoryUID", (_QWORD)v24);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCNavigationXPCServerProtocol objectDetection:stopComponentIdList:](remoteObject, "objectDetection:stopComponentIdList:", v23, v7);

        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend(v6, "objectDetectionComponentList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_33;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setIsEnabled:", 0, (_QWORD)v24);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

    goto LABEL_33;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2112;
    v32 = providerUID;
    _os_log_impl(&dword_219FB5000, v12, OS_LOG_TYPE_DEFAULT, "[#Navigation] objectDetection: %@, _remoteObject nil, _providerUID=%@", buf, 0x16u);
  }
LABEL_34:

}

- (id)accessoryForUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", a3);
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

- (ACCNavigationXPCServerProtocol)remoteObject
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

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
}

- (void)delegatesImplementing:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sel_getName(a1);
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_219FB5000, a3, OS_LOG_TYPE_DEBUG, "[#Navigation] delegatesImplementing: selector=%s, result delegateList=%@", v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryNavigationAttached:(NSObject *)a3 componentList:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2080;
  v8 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  OUTLINED_FUNCTION_5(&dword_219FB5000, a3, (uint64_t)a3, "[#Navigation] accessoryNavigationAttached: accessory %@ (%@) already exists! file: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryNavigationDetached:.cold.1()
{
  os_log_t v0;
  uint8_t v1[22];
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v2 = 2080;
  v3 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  _os_log_debug_impl(&dword_219FB5000, v0, OS_LOG_TYPE_DEBUG, "[#Navigation] exiting accessoryNavigationDetached: accessory %@, _accessories=%@, file:%s", v1, 0x20u);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryNavigationDetached:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_219FB5000, a2, OS_LOG_TYPE_ERROR, "[#Navigation] accessoryNavigationDetached: accessory %@ (%@) does not exist!", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)accessoryNavigationStartRouteGuidance:componentIdList:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  OUTLINED_FUNCTION_5(&dword_219FB5000, v0, v1, "[#Navigation] accessoryNavigationStartRouteGuidance: accessory %@ (%@) does not exist! file: %s", v2);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryNavigationStopRouteGuidance:componentIdList:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/Accessory_Frameworks/AccessoryNavigation/ACCNavigationProvider.m";
  OUTLINED_FUNCTION_5(&dword_219FB5000, v0, v1, "[#Navigation] accessoryNavigationStopRouteGuidance: accessory %@ (%@) does not exist! file: %s", v2);
  OUTLINED_FUNCTION_4();
}

@end
