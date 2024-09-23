@implementation CCRapportManager

- (CCRapportManager)initWithQueue:(id)a3 forSharedUse:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CCRapportManager *v8;
  uint64_t v9;
  NSMutableDictionary *devices;
  uint64_t v11;
  NSMutableDictionary *unsupportedDevices;
  uint64_t v13;
  NSMutableDictionary *registeredRequests;
  NSObject *v15;
  objc_super v17;

  v4 = a4;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCRapportManager;
  v8 = -[CCRapportManager init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    devices = v8->_devices;
    v8->_devices = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    unsupportedDevices = v8->_unsupportedDevices;
    v8->_unsupportedDevices = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    registeredRequests = v8->_registeredRequests;
    v8->_registeredRequests = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v8->_queue, a3);
    v8->_sharedUse = 0;
    if (v4)
    {
      if (os_variant_allows_internal_security_policies())
      {
        v8->_sharedUse = 1;
      }
      else
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[CCRapportManager initWithQueue:forSharedUse:].cold.1();

      }
    }
    -[CCRapportManager registerForSigterm](v8, "registerForSigterm");
  }

  return v8;
}

- (void)registerForSigterm
{
  OS_dispatch_source *v3;
  OS_dispatch_source *sigtermSource;
  NSObject *v5;
  _QWORD handler[5];

  signal(15, (void (__cdecl *)(int))1);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, (dispatch_queue_t)self->_queue);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  v5 = self->_sigtermSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __38__CCRapportManager_registerForSigterm__block_invoke;
  handler[3] = &unk_25098A6F0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
}

uint64_t __38__CCRapportManager_registerForSigterm__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "CCRapportManager: received SIGTERM", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)createDiscoveryClientIfNotExists
{
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  BMDevicePlatformGetDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_fault_impl(&dword_237B02000, a1, OS_LOG_TYPE_FAULT, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v3, 0xCu);

  OUTLINED_FUNCTION_7();
}

- (void)createSharedDiscoveryClientIfNotExists
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_237B02000, v0, v1, "CCRapportManager: createSharedDiscoveryClientIfNotExists not currently supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)createDiscoveryClientWithControlFlags:(unint64_t)a3
{
  NSObject *v5;
  RPCompanionLinkClient *v6;
  RPCompanionLinkClient *discoveryClient;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_discoveryClient)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager createDiscoveryClientWithControlFlags:].cold.1();

  }
  else
  {
    v6 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v6;

    -[RPCompanionLinkClient setDispatchQueue:](self->_discoveryClient, "setDispatchQueue:", self->_queue);
    -[RPCompanionLinkClient setControlFlags:](self->_discoveryClient, "setControlFlags:", a3);
    -[RPCompanionLinkClient setServiceType:](self->_discoveryClient, "setServiceType:", CFSTR("com.apple.biomesyncd.cascade.rapport"));
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke;
    v17[3] = &unk_25098A718;
    objc_copyWeak(&v18, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_discoveryClient, "setInvalidationHandler:", v17);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_2;
    v15[3] = &unk_25098A740;
    objc_copyWeak(&v16, &location);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", v15);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_3;
    v13[3] = &unk_25098A740;
    objc_copyWeak(&v14, &location);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_4;
    v11[3] = &unk_25098A768;
    objc_copyWeak(&v12, &location);
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_discoveryClient, "setDeviceChangedHandler:", v11);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_5;
    v9[3] = &unk_25098A740;
    objc_copyWeak(&v10, &location);
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](self->_discoveryClient, "setLocalDeviceUpdatedHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDiscoveryClientInvalidation");

}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDiscoverDevice:", v3);

}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didLoseDevice:", v3);

}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "device:didChange:", v5, a3);

}

void __58__CCRapportManager_createDiscoveryClientWithControlFlags___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "localDeviceUpdated:", v3);

}

- (void)activateDiscoveryLinkWithCompletion:(id)a3
{
  _BOOL4 sharedUse;
  id v5;

  sharedUse = self->_sharedUse;
  v5 = a3;
  if (sharedUse)
    -[CCRapportManager createSharedDiscoveryClientIfNotExists](self, "createSharedDiscoveryClientIfNotExists");
  else
    -[CCRapportManager createDiscoveryClientIfNotExists](self, "createDiscoveryClientIfNotExists");
  -[CCRapportManager activateDiscoveryClientWithCompletion:](self, "activateDiscoveryClientWithCompletion:", v5);

}

- (void)activateDiscoveryClientWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  unint64_t discoveryClientState;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  RPCompanionLinkClient *discoveryClient;
  RPCompanionLinkClient *v10;
  _QWORD v11[4];
  void (**v12)(id, uint64_t);
  id v13;
  uint8_t buf[4];
  RPCompanionLinkClient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  discoveryClientState = self->_discoveryClientState;
  if (discoveryClientState == 1)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager activateDiscoveryClientWithCompletion:].cold.2((uint64_t)self, v7);

  }
  else if (discoveryClientState == 2)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager activateDiscoveryClientWithCompletion:].cold.1((uint64_t)self, v6);

    v4[2](v4, 1);
  }
  else
  {
    self->_discoveryClientState = 1;
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      discoveryClient = self->_discoveryClient;
      *(_DWORD *)buf = 138412290;
      v15 = discoveryClient;
      _os_log_impl(&dword_237B02000, v8, OS_LOG_TYPE_DEFAULT, "CCRapportManager: activating %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v10 = self->_discoveryClient;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__CCRapportManager_activateDiscoveryClientWithCompletion___block_invoke;
    v11[3] = &unk_25098A790;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v4;
    -[RPCompanionLinkClient activateWithCompletion:](v10, "activateWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

uint64_t __58__CCRapportManager_activateDiscoveryClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleDiscoveryClientActivationOrError:", v4);

  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4 == 0);
}

- (void)handleDiscoveryClientActivationOrError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[CCRapportManager didDiscoverDevice:](self, "didDiscoverDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CCRapportManager handleDiscoveryClientActivationOrError:].cold.1();
    v12 = 0;
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    v12 = 2;
    _os_log_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportManager: activated successfully", v13, 2u);
  }
  else
  {
    v12 = 2;
  }

  self->_discoveryClientState = v12;
}

- (void)handleDiscoveryClientInvalidation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_237B02000, v0, v1, "CCRapportManager: invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)registerRequestID:(id)a3 requestHandler:(id)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  id v10;

  queue = self->_queue;
  v7 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(queue);
  if (self->_sharedUse)
    -[CCRapportManager createSharedDiscoveryClientIfNotExists](self, "createSharedDiscoveryClientIfNotExists");
  else
    -[CCRapportManager createDiscoveryClientIfNotExists](self, "createDiscoveryClientIfNotExists");
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)MEMORY[0x23B8203DC]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", v9, v10);

  -[RPCompanionLinkClient registerRequestID:options:handler:](self->_discoveryClient, "registerRequestID:options:handler:", v10, 0, v7);
}

- (void)registerEventID:(id)a3 eventHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CCRapportManager registerEventID:eventHandler:].cold.1();

  if (self->_sharedUse)
    -[CCRapportManager createSharedDiscoveryClientIfNotExists](self, "createSharedDiscoveryClientIfNotExists");
  else
    -[CCRapportManager createDiscoveryClientIfNotExists](self, "createDiscoveryClientIfNotExists");
  -[RPCompanionLinkClient registerEventID:options:handler:](self->_discoveryClient, "registerEventID:options:handler:", v6, 0, v8);

}

- (void)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCRapportManager activateDiscoveryLinkWithCompletion:](self, "activateDiscoveryLinkWithCompletion:", &__block_literal_global);
}

- (id)discoveredDevices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (id)-[NSMutableDictionary allValues](self->_devices, "allValues");
}

- (id)localDevice
{
  CCRapportDevice *v3;
  void *v4;
  CCRapportDevice *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [CCRapportDevice alloc];
  -[RPCompanionLinkClient localDevice](self->_discoveryClient, "localDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CCRapportDevice initWithRPCompanionLinkDevice:](v3, "initWithRPCompanionLinkDevice:", v4);

  return v5;
}

- (void)registerLocalDeviceUpdatedHandler:(id)a3
{
  -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](self->_discoveryClient, "setLocalDeviceUpdatedHandler:", a3);
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CCRapportManager localDevice](self, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rapportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    -[CCRapportManager localDevice](self, "localDevice");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMutableDictionary allValues](self->_devices, "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "rapportIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v4);

          if ((v16 & 1) != 0)
          {
            v8 = v14;

            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_237B02000, v0, v1, "CCRapportManager: stop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6
{
  -[CCRapportManager sendRequest:request:device:options:responseHandler:](self, "sendRequest:request:device:options:responseHandler:", a3, a4, a5, 0, a6);
}

- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  OS_dispatch_queue *queue;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id from;
  id location;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager sendRequest:request:device:options:responseHandler:].cold.3(v14, v18);

    if (v13)
      v19 = v13;
    else
      v19 = (void *)MEMORY[0x24BDBD1B8];
    v18 = objc_msgSend(v19, "mutableCopy");
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, CFSTR("~~REQUEST_ID~~"));
    v20 = (void *)objc_msgSend(v16, "copy");
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("~~RESPONSE_HANDLER~~"));

    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v15, CFSTR("~~OPTIONS~~"));
    objc_msgSend(v14, "requestQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v18);

    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "requestQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v14;
      v50 = 2112;
      v51 = v23;
      _os_log_impl(&dword_237B02000, v22, OS_LOG_TYPE_DEFAULT, "device %@ requestQueue %@", buf, 0x16u);

    }
    objc_msgSend(v14, "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (v25)
    {
      objc_initWeak(&location, v14);
      objc_initWeak(&from, self);
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v14, "shortenedRapportIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CCRapportManager sendRequest:request:device:options:responseHandler:].cold.2(v27, (uint64_t)buf, v26);
      }

      v28 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
      objc_msgSend(v14, "setClient:", v28);

      objc_msgSend(v14, "device");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "client");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDestinationDevice:", v29);

      objc_msgSend(v14, "client");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setServiceType:", CFSTR("com.apple.biomesyncd.cascade.rapport"));

      queue = self->_queue;
      objc_msgSend(v14, "client");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDispatchQueue:", queue);

      v34 = MEMORY[0x24BDAC760];
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke;
      v43[3] = &unk_25098A7D8;
      objc_copyWeak(&v44, &from);
      objc_copyWeak(&v45, &location);
      objc_msgSend(v14, "client");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setInterruptionHandler:", v43);

      v41[0] = v34;
      v41[1] = 3221225472;
      v41[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_2;
      v41[3] = &unk_25098A718;
      objc_copyWeak(&v42, &location);
      objc_msgSend(v14, "client");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setInvalidationHandler:", v41);

      objc_msgSend(v14, "client");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v34;
      v38[1] = 3221225472;
      v38[2] = __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_3;
      v38[3] = &unk_25098A800;
      objc_copyWeak(&v39, &from);
      objc_copyWeak(&v40, &location);
      objc_msgSend(v37, "activateWithCompletion:", v38);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v45);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      -[CCRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v14);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    -[CCRapportManager sendRequest:request:device:options:responseHandler:].cold.1();
  }

}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleInterruptionForDevice:", v2);

}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateClientWithError:", 0);

}

void __71__CCRapportManager_sendRequest_request_device_options_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleActivationForDevice:error:", v5, v4);

}

- (void)sendEvent:(id)a3 event:(id)a4 toDevice:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  CCRapportManager *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager sendEvent:event:toDevice:completionHandler:].cold.2(v12, v15);

    if (objc_msgSend(v12, "linkState"))
    {
      objc_msgSend(v12, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke_2;
      v18[3] = &unk_25098A828;
      v19 = v12;
      v20 = self;
      v21 = v10;
      v22 = v11;
      v23 = v13;
      objc_msgSend(v16, "sendEventID:event:options:completion:", v21, v22, 0, v18);

      v17 = v19;
    }
    else
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke;
      v24[3] = &unk_25098A828;
      v24[4] = self;
      v25 = v10;
      v26 = v11;
      v27 = v12;
      v28 = v13;
      -[CCRapportManager activateDirectLinkToDevice:completionHandler:](self, "activateDirectLinkToDevice:completionHandler:", v27, v24);

      v17 = v25;
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[CCRapportManager sendRequest:request:device:options:responseHandler:].cold.1();

  }
}

uint64_t __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEvent:event:toDevice:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __63__CCRapportManager_sendEvent_event_toDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "code") == -71148)
  {
    objc_msgSend(v5, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE7CC90]);

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidateClientWithError:", v5);
      objc_msgSend(*(id *)(a1 + 40), "sendEvent:event:toDevice:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)activateDirectLinkToDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *queue;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  if (!v8)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CCRapportManager activateDirectLinkToDevice:completionHandler:].cold.1(v6, v10);

    v11 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
    objc_msgSend(v6, "setClient:", v11);

    objc_msgSend(v6, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDestinationDevice:", v12);

    objc_msgSend(v6, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setServiceType:", CFSTR("com.apple.biomesyncd.cascade.rapport"));

    queue = self->_queue;
    objc_msgSend(v6, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDispatchQueue:", queue);

    objc_initWeak(&location, v6);
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke;
    v27[3] = &unk_25098A850;
    v27[4] = self;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v6, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInterruptionHandler:", v27);

    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_2;
    v25[3] = &unk_25098A718;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v6, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInvalidationHandler:", v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v6, "setLinkState:", 1);
  objc_msgSend(v6, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_3;
  v22[3] = &unk_25098A878;
  v23 = v6;
  v24 = v7;
  v20 = v7;
  v21 = v6;
  objc_msgSend(v19, "activateWithCompletion:", v22);

}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "handleInterruptionForDevice:", WeakRetained);

}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateClientWithError:", 0);

}

void __65__CCRapportManager_activateDirectLinkToDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setLinkState:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)invalidateDirectLinkToDevice:(id)a3
{
  objc_msgSend(a3, "invalidateClientWithError:", 0);
}

- (void)handleActivationForDevice:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  NSMutableDictionary *unsupportedDevices;
  void *v17;
  NSMutableDictionary *devices;
  void *v19;
  NSObject *v20;
  void *v21;
  _BYTE v22[24];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (__CFString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "shortenedRapportIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("failed with error, ");
      if (!v7)
        v12 = CFSTR("completed");
      *(_DWORD *)v22 = 138412802;
      *(_QWORD *)&v22[4] = v10;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v12;
      if (v7)
        v13 = v7;
      else
        v13 = &stru_25098AF68;
      *(_WORD *)&v22[22] = 2112;
      v23 = v13;
      _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: activation %@%@", v22, 0x20u);

    }
    if (v7)
    {
      if (-[__CFString code](v7, "code") == -71165)
      {
        -[__CFString domain](v7, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE7CC90]);

        if (v15)
        {
          unsupportedDevices = self->_unsupportedDevices;
          objc_msgSend(v6, "rapportIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](unsupportedDevices, "setObject:forKeyedSubscript:", v6, v17);

          devices = self->_devices;
          objc_msgSend(v6, "rapportIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", 0, v19);

          __biome_log_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "shortenedRapportIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v22 = 138412290;
            *(_QWORD *)&v22[4] = v21;
            _os_log_impl(&dword_237B02000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: determined to not support service com.apple.biomesyncd.cascade.rapport", v22, 0xCu);

          }
        }
      }
      objc_msgSend(v6, "invalidateClientWithError:", v7, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
    }
    else
    {
      -[CCRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CCRapportManager handleActivationForDevice:error:].cold.1();

  }
}

- (void)handleInterruptionForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "shortenedRapportIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_237B02000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: interrupted", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[CCRapportManager handleInterruptionForDevice:].cold.1();
  }

}

- (void)sendNextRequestToDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    objc_msgSend(v4, "requestQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popFirstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~REQUEST_ID~~"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~OPTIONS~~"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = (id)objc_opt_new();
      v12 = v11;

      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("~~RESPONSE_HANDLER~~"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v7 && v13)
      {
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~REQUEST_ID~~"));
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~OPTIONS~~"));
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, CFSTR("~~RESPONSE_HANDLER~~"));
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "shortenedRapportIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v26 = v16;
          v27 = 2112;
          v28 = v6;
          v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_237B02000, v15, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: being sent request %@ with options %@", buf, 0x20u);

        }
        objc_initWeak((id *)buf, v4);
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "requestQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "count") != 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE7CCC0]);

        objc_msgSend(v4, "client");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __44__CCRapportManager_sendNextRequestToDevice___block_invoke;
        v22[3] = &unk_25098A8A0;
        v23 = v14;
        objc_copyWeak(&v24, (id *)buf);
        v22[4] = self;
        objc_msgSend(v20, "sendRequestID:request:options:responseHandler:", v7, v6, v12, v22);

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[CCRapportManager sendNextRequestToDevice:].cold.2(v4, (uint64_t)v6, v21);

        -[CCRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v4);
      }

    }
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CCRapportManager sendNextRequestToDevice:].cold.1();
  }

}

void __44__CCRapportManager_sendNextRequestToDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(v9, "code") == -71148
    && (objc_msgSend(v9, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE7CC90]),
        v5,
        v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "invalidateClientWithError:", v9);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "sendNextRequestToDevice:", WeakRetained);
  }

}

- (void)finishedSendingRequestsToDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "shortenedRapportIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_237B02000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: request queue empty, invalidating client", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(v4, "invalidateClientWithError:", 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CCRapportManager finishedSendingRequestsToDevice:].cold.1();

  }
}

- (void)device:(id)a3 didChange:(unsigned int)a4
{
  id v6;
  NSMutableDictionary *devices;
  void *v8;
  void *v9;
  signed int v10;
  NSObject *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  const char *v18;
  int v19;
  const char *v20;
  char v21[16];
  char v22[16];
  char v23[16];
  char v24[16];
  char v25[16];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  char v30[16];
  char v31[16];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  devices = self->_devices;
  objc_msgSend(v6, "CC_companionLinkDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    while (1)
    {
      v10 = a4 & -a4;
      if (v10 <= 31)
        break;
      if (v10 <= 127)
      {
        if (v10 == 32)
        {
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CCRapportManager device:didChange:].cold.4((uint64_t)v24, (uint64_t)v9);
        }
        else
        {
          if (v10 != 64)
          {
LABEL_19:
            __biome_log_for_category();
            v11 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              goto LABEL_39;
            objc_msgSend(v9, "shortenedRapportIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 1024;
            LODWORD(v29) = a4 & -a4;
            v14 = v11;
            v15 = "CCRapportDevice[%@]: got unexpected change flag: RPDeviceChangeFlags(%x)";
            v16 = 18;
            goto LABEL_55;
          }
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[CCRapportManager device:didChange:].cold.5((uint64_t)v23, (uint64_t)v9);
        }
      }
      else
      {
        switch(v10)
        {
          case 128:
            __biome_log_for_category();
            v11 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              break;
            objc_msgSend(v9, "shortenedRapportIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v6, "proximity");
            if (v19 > 19)
            {
              if (v19 == 20)
              {
                v20 = "Near";
              }
              else
              {
                if (v19 != 30)
                  goto LABEL_52;
                v20 = "Far";
              }
            }
            else if (v19)
            {
              if (v19 == 10)
              {
                v20 = "Immed";
                goto LABEL_53;
              }
LABEL_52:
              v20 = "?";
            }
            else
            {
              v20 = "Unknown";
            }
LABEL_53:
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 2080;
            v29 = v20;
            v14 = v11;
            v15 = "CCRapportDevice[%@]: proximity changed: %s";
LABEL_54:
            v16 = 22;
LABEL_55:
            _os_log_debug_impl(&dword_237B02000, v14, OS_LOG_TYPE_DEBUG, v15, buf, v16);
LABEL_56:

            break;
          case 256:
            __biome_log_for_category();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[CCRapportManager device:didChange:].cold.6((uint64_t)v22, (uint64_t)v9);
            break;
          case 512:
            __biome_log_for_category();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[CCRapportManager device:didChange:].cold.7((uint64_t)v21, (uint64_t)v9);
            break;
          default:
            goto LABEL_19;
        }
      }
LABEL_39:

      a4 ^= v10;
    }
    switch(v10)
    {
      case 0:
        break;
      case 1:
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CCRapportManager device:didChange:].cold.1((uint64_t)v31, (uint64_t)v9);
        goto LABEL_39;
      case 2:
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CCRapportManager device:didChange:].cold.2((uint64_t)v30, (uint64_t)v9);
        goto LABEL_39;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          goto LABEL_39;
        objc_msgSend(v9, "shortenedRapportIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "proximity");
        if (v17 > 19)
        {
          if (v17 == 20)
          {
            v18 = "Near";
            goto LABEL_49;
          }
          if (v17 == 30)
          {
            v18 = "Far";
            goto LABEL_49;
          }
        }
        else
        {
          if (!v17)
          {
            v18 = "Unknown";
            goto LABEL_49;
          }
          if (v17 == 10)
          {
            v18 = "Immed";
LABEL_49:
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 2080;
            v29 = v18;
            v14 = v11;
            v15 = "CCRapportDevice[%@]: distance changed: %s";
            goto LABEL_54;
          }
        }
        v18 = "?";
        goto LABEL_49;
      case 8:
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CCRapportManager device:didChange:].cold.3((uint64_t)v25, (uint64_t)v9);
        goto LABEL_39;
      default:
        if (v10 != 16)
          goto LABEL_19;
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          goto LABEL_39;
        objc_msgSend(v9, "shortenedRapportIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        _os_log_debug_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: name changed: %@", buf, 0x16u);

        goto LABEL_56;
    }
  }

}

- (void)didDiscoverDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *devices;
  void *v8;
  uint64_t v9;
  CCRapportDevice *v10;
  NSMutableDictionary *unsupportedDevices;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSMutableDictionary *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      devices = self->_devices;
      objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (CCRapportDevice *)v9;

      }
      else
      {
        unsupportedDevices = self->_unsupportedDevices;
        objc_msgSend(v4, "CC_companionLinkDeviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](unsupportedDevices, "objectForKeyedSubscript:", v12);
        v10 = (CCRapportDevice *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v10 = -[CCRapportDevice initWithRPCompanionLinkDevice:]([CCRapportDevice alloc], "initWithRPCompanionLinkDevice:", v4);
          __biome_log_for_category();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[CCRapportManager didDiscoverDevice:].cold.3();

          -[CCRapportDevice serviceTypes](v10, "serviceTypes");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15
            && (v16 = (void *)v15,
                -[CCRapportDevice serviceTypes](v10, "serviceTypes"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "containsObject:", CFSTR("com.apple.biomesyncd.cascade.rapport")),
                v17,
                v16,
                (v18 & 1) == 0))
          {
            __biome_log_for_category();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              -[CCRapportDevice shortenedRapportIdentifier](v10, "shortenedRapportIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 138412290;
              v32 = v29;
              _os_log_impl(&dword_237B02000, v28, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: ignoring device not listing service from serviceTypescom.apple.biomesyncd.cascade.rapport", (uint8_t *)&v31, 0xCu);

            }
            v30 = self->_unsupportedDevices;
            -[CCRapportDevice rapportIdentifier](v10, "rapportIdentifier");
            v13 = objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v10, v13);
          }
          else
          {
            -[CCRapportManager delegate](self, "delegate");
            v13 = objc_claimAutoreleasedReturnValue();
            v19 = -[NSObject rapportManager:isDeviceSupported:](v13, "rapportManager:isDeviceSupported:", self, v10);
            __biome_log_for_category();
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v21)
              {
                -[CCRapportDevice shortenedRapportIdentifier](v10, "shortenedRapportIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = 138412290;
                v32 = v22;
                _os_log_impl(&dword_237B02000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: discovered", (uint8_t *)&v31, 0xCu);

              }
              v23 = self->_devices;
              -[CCRapportDevice rapportIdentifier](v10, "rapportIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v10, v24);

              -[NSObject rapportManager:didDiscoverCCRapportDevice:](v13, "rapportManager:didDiscoverCCRapportDevice:", self, v10);
            }
            else
            {
              if (v21)
              {
                -[CCRapportDevice shortenedRapportIdentifier](v10, "shortenedRapportIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = 138412290;
                v32 = v25;
                _os_log_impl(&dword_237B02000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: ignoring unsupported device", (uint8_t *)&v31, 0xCu);

              }
              v26 = self->_unsupportedDevices;
              -[CCRapportDevice rapportIdentifier](v10, "rapportIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v10, v27);

            }
          }
          goto LABEL_12;
        }
      }
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CCRapportManager didDiscoverDevice:].cold.4();
LABEL_12:

      goto LABEL_13;
    }
    __biome_log_for_category();
    v10 = (CCRapportDevice *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      -[CCRapportManager didDiscoverDevice:].cold.2();
  }
  else
  {
    __biome_log_for_category();
    v10 = (CCRapportDevice *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      -[CCRapportManager didDiscoverDevice:].cold.1();
  }
LABEL_13:

}

- (void)didLoseDevice:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *devices;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  devices = self->_devices;
  objc_msgSend(v5, "CC_companionLinkDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "shortenedRapportIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportDevice[%@]: lost", (uint8_t *)&v15, 0xCu);

    }
    -[CCRapportManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rapportManager:didLoseNearbyCCRapportDevice:", self, v8);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateClientWithError:", v12);

    v13 = self->_devices;
    objc_msgSend(v8, "rapportIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", 0, v14);

  }
}

- (void)localDeviceUpdated:(id)a3
{
  id v4;
  void *v5;
  CCRapportDevice *v6;

  v4 = a3;
  v6 = -[CCRapportDevice initWithRPCompanionLinkDevice:]([CCRapportDevice alloc], "initWithRPCompanionLinkDevice:", v4);

  -[CCRapportManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rapportManager:localDeviceUpdated:", self, v6);

}

- (CCRapportManagerDelegate)delegate
{
  return (CCRapportManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)registeredRequests
{
  return self->_registeredRequests;
}

- (void)setRegisteredRequests:(id)a3
{
  objc_storeStrong((id *)&self->_registeredRequests, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_unsupportedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
}

- (void)initWithQueue:forSharedUse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_237B02000, v0, v1, "CCRapportManager: shared-use only supported internally", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)createDiscoveryClientWithControlFlags:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_237B02000, v0, v1, "CCRapportManager: shared discovery client already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)activateDiscoveryClientWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138412290;
  v4 = v2;
  OUTLINED_FUNCTION_3(&dword_237B02000, a2, OS_LOG_TYPE_DEBUG, "CCRapportManager: already activated %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

- (void)activateDiscoveryClientWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138412290;
  v4 = v2;
  OUTLINED_FUNCTION_3(&dword_237B02000, a2, OS_LOG_TYPE_DEBUG, "CCRapportManager: already activating %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

- (void)handleDiscoveryClientActivationOrError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "CCRapportManager: failed to activate with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)registerEventID:eventHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_237B02000, v0, OS_LOG_TYPE_DEBUG, "CCRapportManager: registerEventID %@", v1);
  OUTLINED_FUNCTION_8();
}

- (void)sendRequest:request:device:options:responseHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_237B02000, v0, v1, "sendRequest:request:device:options:responseHandler: passed nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendRequest:(NSObject *)a3 request:device:options:responseHandler:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_237B02000, a3, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: activating client", (uint8_t *)a2);

}

- (void)sendRequest:(void *)a1 request:(NSObject *)a2 device:options:responseHandler:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortenedRapportIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_237B02000, a2, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: enqueueing request", v4);

  OUTLINED_FUNCTION_7();
}

- (void)sendEvent:(void *)a1 event:(NSObject *)a2 toDevice:completionHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a1, "linkState");
  OUTLINED_FUNCTION_15(&dword_237B02000, a2, v3, "device: %@ linkState %lu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

- (void)activateDirectLinkToDevice:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortenedRapportIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_237B02000, a2, OS_LOG_TYPE_DEBUG, "CCRapportDevice[%@]: activating client", v4);

  OUTLINED_FUNCTION_7();
}

- (void)handleActivationForDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_13(&dword_237B02000, v0, v1, "handleActivationForDevice:error: passed nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleInterruptionForDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_13(&dword_237B02000, v0, v1, "handleInterruptionForDevice: passed nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendNextRequestToDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_237B02000, v0, v1, "sendNextRequestToDevice: passed nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)sendNextRequestToDevice:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortenedRapportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  v7 = a2;
  _os_log_fault_impl(&dword_237B02000, a3, OS_LOG_TYPE_FAULT, "CCRapportDevice[%@]: expected request id and response handler in %@", v6, 0x16u);

}

- (void)finishedSendingRequestsToDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_237B02000, v0, v1, "finishedSendingRequestsToDevice: passed nil device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: advertisement data changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: pairing flags/attributes changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: distance wifi information element changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: RSSI changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: SSID changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.6(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: distance/angle/something changed");

  OUTLINED_FUNCTION_4();
}

- (void)device:(uint64_t)a1 didChange:(uint64_t)a2 .cold.7(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1(a1, a2), "shortenedRapportIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_237B02000, v3, v4, "CCRapportDevice[%@]: no transports available; expect a lost callback");

  OUTLINED_FUNCTION_4();
}

- (void)didDiscoverDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "CCRapportManager: skipping RPCompanionLinkDevice missing identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)didDiscoverDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "CCRapportManager: skipping RPCompanionLinkDevice missing model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)didDiscoverDevice:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_237B02000, v0, OS_LOG_TYPE_DEBUG, "%@", v1);
  OUTLINED_FUNCTION_8();
}

- (void)didDiscoverDevice:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  v3 = v0;
  OUTLINED_FUNCTION_15(&dword_237B02000, v1, (uint64_t)v1, "CCRapportManager: already discovered device, %@ as %@", v2);
  OUTLINED_FUNCTION_8();
}

@end
