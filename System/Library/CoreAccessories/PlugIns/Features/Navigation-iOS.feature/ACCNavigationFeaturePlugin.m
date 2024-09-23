@implementation ACCNavigationFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCNavigationFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCNavigationFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  ACCiAP2ShimServer *iap2server;
  ACCNavigationProvider *navigationProvider;
  NSMutableDictionary *navigationShimAccessoryList;

  init_logging();
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = 0;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = 0;

  -[ACCNavigationFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  objc_msgSend(MEMORY[0x24BE00DD0], "resetServerState");
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  ACCiAP2ShimServer *v8;
  ACCiAP2ShimServer *iap2server;
  NSObject *v10;
  id v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *navigationQueue;
  ACCNavigationProvider *v14;
  ACCNavigationProvider *navigationProvider;
  NSMutableDictionary *v16;
  NSMutableDictionary *navigationShimAccessoryList;
  ACCNavigationShim *v18;
  ACCNavigationShim *navigationShim;
  NSObject *v20;
  id v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D92000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] Starting Navigation feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_215D92000, v6, OS_LOG_TYPE_INFO, "[#Navigation] Create/Get shared ACCiAP2ShimServer...", v24, 2u);
  }

  objc_msgSend(MEMORY[0x24BE00DD0], "sharedInstance");
  v8 = (ACCiAP2ShimServer *)objc_claimAutoreleasedReturnValue();
  iap2server = self->_iap2server;
  self->_iap2server = v8;

  -[ACCiAP2ShimServer startServer](self->_iap2server, "startServer");
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_INFO, "[#Navigation] Create ACCNavigationProvider...", v23, 2u);
  }

  v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreaccessories.plugin.navigation", 0);
  navigationQueue = self->_navigationQueue;
  self->_navigationQueue = v12;

  v14 = (ACCNavigationProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE00BD0]), "initWithDelegate:", self);
  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = v16;

  v18 = -[ACCNavigationShim initWithDelegate:]([ACCNavigationShim alloc], "initWithDelegate:", self);
  navigationShim = self->_navigationShim;
  self->_navigationShim = v18;

  -[ACCiAP2ShimServer addDelegate:](self->_iap2server, "addDelegate:", self->_navigationShim);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_215D92000, v20, OS_LOG_TYPE_INFO, "[#Navigation] Starting Navigation feature plugin... finished, set isRunning", v22, 2u);
  }

  -[ACCNavigationFeaturePlugin setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  ACCNavigationShim *navigationShim;
  ACCNavigationProvider *navigationProvider;
  OS_dispatch_queue *navigationQueue;
  NSMutableDictionary *navigationShimAccessoryList;
  ACCiAP2ShimServer *iap2server;
  NSObject *v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D92000, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] Stopping Navigation feature plugin...", buf, 2u);
  }

  -[ACCNavigationFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  -[ACCiAP2ShimServer removeDelegate:](self->_iap2server, "removeDelegate:", self->_navigationShim);
  navigationShim = self->_navigationShim;
  self->_navigationShim = 0;

  dispatch_sync((dispatch_queue_t)self->_navigationQueue, &__block_literal_global);
  navigationProvider = self->_navigationProvider;
  self->_navigationProvider = 0;

  navigationQueue = self->_navigationQueue;
  self->_navigationQueue = 0;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  self->_navigationShimAccessoryList = 0;

  -[ACCiAP2ShimServer stopServer](self->_iap2server, "stopServer");
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_215D92000, v11, OS_LOG_TYPE_INFO, "[#Navigation] Stopping Navigation feature plugin... finished", v13, 2u);
  }

}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  ACCNavigationShim *navigationShim;
  ACCNavigationProvider *navigationProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *navigationQueue;
  id v15;
  _QWORD v16[4];
  id v17;
  ACCNavigationFeaturePlugin *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  ACCNavigationProvider *v24;
  __int16 v25;
  ACCNavigationShim *v26;
  __int16 v27;
  ACCiAP2ShimServer *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413314;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = navigationProvider;
    v25 = 2112;
    v26 = navigationShim;
    v27 = 2112;
    v28 = iap2server;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ accessoryAttached: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke;
  v16[3] = &unk_24D4827C0;
  v17 = v7;
  v18 = self;
  v15 = v7;
  dispatch_async(navigationQueue, v16);

}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ACCNavigationShimAccessory *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE00DC8]);
  objc_msgSend(*(id *)(a1 + 32), "accessoryUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUID:keyTag:features:", v3, CFSTR("Navigation"), 0);

  objc_msgSend(v4, "setName:", CFSTR("Shim Navigation Route Guidance Accessory"));
  objc_msgSend(v4, "setModel:", CFSTR("Navigation Route Guidance Accessory"));
  objc_msgSend(v4, "setManufacturer:", CFSTR("Navigation Route Guidance Manufacturer"));
  objc_msgSend(v4, "setSerialNumber:", CFSTR("NAV_RG_1234"));
  objc_msgSend(v4, "setFirmwareVersion:", CFSTR("0.0.0"));
  objc_msgSend(v4, "setHardwareVersion:", CFSTR("0.0.0"));
  objc_msgSend(v4, "setDontPublish:", 1);
  objc_msgSend(v4, "addFeature:", 17);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_4(a1 + 32, v5, v7, v8, v9, v10, v11, v12);

  v13 = objc_alloc_init(ACCNavigationShimAccessory);
  -[ACCNavigationShimAccessory setIap2ShimAccessory:](v13, "setIap2ShimAccessory:", v4);
  -[ACCNavigationShimAccessory setNavigationAccessory:](v13, "setNavigationAccessory:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setContext:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addAccessory:", v4);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_2(a1 + 32, v14, v19, v20, v21, v22, v23, v24);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "accessoryAttached:", v13);
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
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      v27 = 138412290;
      v28 = v17;
      _os_log_impl(&dword_215D92000, v15, OS_LOG_TYPE_INFO, "[#Navigation] Invalid _navigationShim(%@)", (uint8_t *)&v27, 0xCu);
    }

  }
  v25 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(v4, "connectionIDObj");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v13, v26);

}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  ACCNavigationShim *navigationShim;
  ACCNavigationProvider *navigationProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *navigationQueue;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  ACCNavigationProvider *v23;
  __int16 v24;
  ACCNavigationShim *v25;
  __int16 v26;
  ACCiAP2ShimServer *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413314;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = navigationProvider;
    v24 = 2112;
    v25 = navigationShim;
    v26 = 2112;
    v27 = iap2server;
    _os_log_impl(&dword_215D92000, v10, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ accessoryDetached: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__ACCNavigationFeaturePlugin_navigation_accessoryDetached___block_invoke;
  v16[3] = &unk_24D4827C0;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  dispatch_async(navigationQueue, v16);

}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryDetached___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "findAccessoryForAccessoryUID:andKeyTag:", v3, CFSTR("Navigation"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setContext:", 0);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v15, "connectionIDObj");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "accessoryDetached:", v7);
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v15, "connectionIDObj");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAccessory:", v15);
      objc_msgSend(v7, "setIap2ShimAccessory:", 0);
      objc_msgSend(v7, "setNavigationAccessory:", 0);

      v4 = v15;
    }

  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v12 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_215D92000, v12, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }

  }
}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationShim *navigationShim;
  ACCNavigationProvider *navigationProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *navigationQueue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  ACCNavigationProvider *v30;
  __int16 v31;
  ACCNavigationShim *v32;
  __int16 v33;
  ACCiAP2ShimServer *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413570;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = navigationProvider;
    v31 = 2112;
    v32 = navigationShim;
    v33 = 2112;
    v34 = iap2server;
    _os_log_impl(&dword_215D92000, v13, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ startRouteGuidance: %@ componentList: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCNavigationFeaturePlugin_navigation_startRouteGuidance_componentList___block_invoke;
  block[3] = &unk_24D4827E8;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v18 = v10;
  v19 = v9;
  dispatch_async(navigationQueue, block);

}

void __74__ACCNavigationFeaturePlugin_navigation_startRouteGuidance_componentList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "findAccessoryForAccessoryUID:andKeyTag:", v3, CFSTR("Navigation"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v12, "connectionIDObj");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "accessoryStartRouteGuidance:componentList:", v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_215D92000, v9, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }

  }
}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationShim *navigationShim;
  ACCNavigationProvider *navigationProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *navigationQueue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  ACCNavigationProvider *v30;
  __int16 v31;
  ACCNavigationShim *v32;
  __int16 v33;
  ACCiAP2ShimServer *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    navigationShim = self->_navigationShim;
    iap2server = self->_iap2server;
    navigationProvider = self->_navigationProvider;
    *(_DWORD *)buf = 138413570;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = navigationProvider;
    v31 = 2112;
    v32 = navigationShim;
    v33 = 2112;
    v34 = iap2server;
    _os_log_impl(&dword_215D92000, v13, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation: %@ startRouteGuidance: %@ componentList: %@, _navigationProvider=%@ _navigationShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ACCNavigationFeaturePlugin_navigation_stopRouteGuidance_componentList___block_invoke;
  block[3] = &unk_24D4827E8;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v18 = v10;
  v19 = v9;
  dispatch_async(navigationQueue, block);

}

void __73__ACCNavigationFeaturePlugin_navigation_stopRouteGuidance_componentList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "findAccessoryForAccessoryUID:andKeyTag:", v3, CFSTR("Navigation"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v12, "connectionIDObj");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "accessoryStopRouteGuidance:componentList:", v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_215D92000, v9, OS_LOG_TYPE_INFO, "[#Navigation] Invalid accessory(%@) or _navigationShim(%@)", buf, 0x16u);
    }

  }
}

- (id)navigationShimAccessoryForConnectionID:(unsigned int)a3
{
  NSObject *navigationQueue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  navigationQueue = self->_navigationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ACCNavigationFeaturePlugin_navigationShimAccessoryForConnectionID___block_invoke;
  block[3] = &unk_24D482810;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(navigationQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __69__ACCNavigationFeaturePlugin_navigationShimAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_navigationShimAccessoryForConnectionIDNoLock:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)navigationShimAccessoryList
{
  void *navigationShimAccessoryList;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  if (navigationShimAccessoryList)
  {
    objc_msgSend(navigationShimAccessoryList, "allValues");
    navigationShimAccessoryList = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSMutableDictionary *)navigationShimAccessoryList;
}

- (void)updateRouteGuidanceInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationProvider *navigationProvider;
  ACCNavigationShim *navigationShim;
  NSObject *navigationQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  ACCNavigationProvider *v31;
  __int16 v32;
  ACCNavigationShim *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    navigationProvider = self->_navigationProvider;
    navigationShim = self->_navigationShim;
    *(_DWORD *)buf = 138413314;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = navigationProvider;
    v32 = 2112;
    v33 = navigationShim;
    _os_log_impl(&dword_215D92000, v13, OS_LOG_TYPE_INFO, "[#Navigation] navigation updateRouteGuidanceInfo: %@ componentIdList: %@ accessory: %@, _navigationProvider=%@ _navigationShim=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__ACCNavigationFeaturePlugin_updateRouteGuidanceInfo_componentIdList_accessory___block_invoke;
  v20[3] = &unk_24D482838;
  v20[4] = self;
  v21 = v10;
  v22 = v9;
  v23 = v8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  dispatch_async(navigationQueue, v20);

}

void __80__ACCNavigationFeaturePlugin_updateRouteGuidanceInfo_componentIdList_accessory___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1[4] + 24) && (v2 = (void *)a1[5]) != 0)
  {
    objc_msgSend(v2, "navigationAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v3;
    if (a1[6])
    {
      objc_msgSend(v3, "componentListForIdList:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v12;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v3, "updateRouteGuidanceInfo:componentList:", a1[7], v4);

  }
  else
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[6];
      v8 = a1[7];
      v10 = a1[5];
      v11 = *(_QWORD *)(a1[4] + 24);
      *(_DWORD *)buf = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_215D92000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation updateRouteGuidanceInfo: %@ componentIdList: %@ accessory: %@, skip processing, _navigationProvider(%@) or navigationShimAccessory(%@) nil", buf, 0x34u);
    }

  }
}

- (void)updateManeuverInfo:(id)a3 componentIdList:(id)a4 accessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCNavigationProvider *navigationProvider;
  ACCNavigationShim *navigationShim;
  NSObject *navigationQueue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  ACCNavigationProvider *v31;
  __int16 v32;
  ACCNavigationShim *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    navigationProvider = self->_navigationProvider;
    navigationShim = self->_navigationShim;
    *(_DWORD *)buf = 138413314;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = navigationProvider;
    v32 = 2112;
    v33 = navigationShim;
    _os_log_impl(&dword_215D92000, v13, OS_LOG_TYPE_INFO, "[#Navigation] navigation updateManeuverInfo: %@ componentIdList: %@ accessory: %@, _navigationProvider=%@ _navigationShim=%@", buf, 0x34u);
  }

  navigationQueue = self->_navigationQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__ACCNavigationFeaturePlugin_updateManeuverInfo_componentIdList_accessory___block_invoke;
  v20[3] = &unk_24D482838;
  v20[4] = self;
  v21 = v10;
  v22 = v9;
  v23 = v8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  dispatch_async(navigationQueue, v20);

}

void __75__ACCNavigationFeaturePlugin_updateManeuverInfo_componentIdList_accessory___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1[4] + 24) && (v2 = (void *)a1[5]) != 0)
  {
    objc_msgSend(v2, "navigationAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v3;
    if (a1[6])
    {
      objc_msgSend(v3, "componentListForIdList:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v12;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v3, "updateManeuverInfo:componentList:", a1[7], v4);

  }
  else
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationShimAccessory create_xpc_representation].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[6];
      v8 = a1[7];
      v10 = a1[5];
      v11 = *(_QWORD *)(a1[4] + 24);
      *(_DWORD *)buf = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_215D92000, v7, OS_LOG_TYPE_DEFAULT, "[#Navigation] navigation updateManeuverInfo: %@ componentIdList: %@ accessory: %@, skip processing, _navigationProvider(%@) or navigationShimAccessory(%@) nil", buf, 0x34u);
    }

  }
}

- (void)notifyNavigationAccessoryClientsOfStateChange
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x24BE00DD0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "nav_frameworkShouldPollNotification");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNSDistributeNotificationType:notifyDict:", v3, 0);

}

- (id)_navigationShimAccessoryForConnectionIDNoLock:(unsigned int)a3
{
  NSMutableDictionary *navigationShimAccessoryList;
  void *v4;
  void *v5;

  navigationShimAccessoryList = self->_navigationShimAccessoryList;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](navigationShimAccessoryList, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCiAP2ShimServer)iap2server
{
  return self->_iap2server;
}

- (void)setIap2server:(id)a3
{
  objc_storeStrong((id *)&self->_iap2server, a3);
}

- (ACCNavigationProvider)navigationProvider
{
  return self->_navigationProvider;
}

- (void)setNavigationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_navigationProvider, a3);
}

- (OS_dispatch_queue)navigationQueue
{
  return self->_navigationQueue;
}

- (void)setNavigationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_navigationQueue, a3);
}

- (ACCNavigationShim)navigationShim
{
  return self->_navigationShim;
}

- (void)setNavigationShim:(id)a3
{
  objc_storeStrong((id *)&self->_navigationShim, a3);
}

- (void)setNavigationShimAccessoryList:(id)a3
{
  objc_storeStrong((id *)&self->_navigationShimAccessoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationShimAccessoryList, 0);
  objc_storeStrong((id *)&self->_navigationShim, 0);
  objc_storeStrong((id *)&self->_navigationQueue, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215D92000, a2, a3, "[#Navigation] accessoryAttached: call shim accessoryAttached: navigationAccessory=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__ACCNavigationFeaturePlugin_navigation_accessoryAttached___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215D92000, a2, a3, "[#Navigation] accessoryAttached: accessory=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
