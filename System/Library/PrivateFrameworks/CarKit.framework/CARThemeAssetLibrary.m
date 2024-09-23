@implementation CARThemeAssetLibrary

- (CARThemeAssetLibrary)initWithVehicle:(id)a3
{
  id v4;
  CARThemeAssetLibrary *v5;
  uint64_t v6;
  NSUUID *vehicleIdentifier;
  uint64_t v8;
  NSString *assetIdentifier;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  CARThemeAssetLibraryObserverProxy *v14;
  CARThemeAssetLibraryObserverProxy *observerProxy;
  uint64_t v16;
  NSXPCConnection *serviceConnection;
  NSObject *v18;
  _QWORD block[4];
  CARThemeAssetLibrary *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CARThemeAssetLibrary;
  v5 = -[CARThemeAssetLibrary init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleIdentifier = v5->_vehicleIdentifier;
    v5->_vehicleIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "clusterAssetIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    assetIdentifier = v5->_assetIdentifier;
    v5->_assetIdentifier = (NSString *)v8;

    if (!v5->_assetIdentifier)
    {
      CarThemeAssetsLogging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CARThemeAssetLibrary initWithVehicle:].cold.1();

    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.carkit.theme_asset_library", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc_init(CARThemeAssetLibraryObserverProxy);
    observerProxy = v5->_observerProxy;
    v5->_observerProxy = v14;

    -[CARThemeAssetLibraryObserverProxy setAssetLibrary:](v5->_observerProxy, "setAssetLibrary:", v5);
    -[CARThemeAssetLibrary _setupServiceConnection](v5, "_setupServiceConnection");
    v16 = objc_claimAutoreleasedReturnValue();
    serviceConnection = v5->_serviceConnection;
    v5->_serviceConnection = (NSXPCConnection *)v16;

    -[CARThemeAssetLibrary queue](v5, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CARThemeAssetLibrary_initWithVehicle___block_invoke;
    block[3] = &unk_1E5427E58;
    v21 = v5;
    dispatch_async(v18, block);

  }
  return v5;
}

uint64_t __40__CARThemeAssetLibrary_initWithVehicle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startObserving");
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[CARThemeAssetLibrary queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CARThemeAssetLibrary_invalidate__block_invoke;
  block[3] = &unk_1E5427E58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__CARThemeAssetLibrary_invalidate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_stopObserving");
  objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)_setupServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.theme-asset-library"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE99E798);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE99FA50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);
  -[CARThemeAssetLibrary observerProxy](self, "observerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedObject:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke;
  v10[3] = &unk_1E5427E58;
  v10[4] = self;
  objc_msgSend(v3, "setInterruptionHandler:", v10);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_6);
  CarThemeAssetsLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit theme asset library service", v9, 2u);
  }

  objc_msgSend(v3, "resume");
  return v3;
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];

  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_80;
  block[3] = &unk_1E5427E58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v10, block);

}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_80(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasObservers");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_queue_startObserving");
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  CarThemeAssetsLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)findCurrentAssetWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CARThemeAssetLibrary queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CARThemeAssetLibrary_findCurrentAssetWithCompletion___block_invoke;
  v7[3] = &unk_1E54281B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__CARThemeAssetLibrary_findCurrentAssetWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_findCurrentAssetWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CARThemeAssetLibrary queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CARThemeAssetLibrary_addObserver___block_invoke;
  v7[3] = &unk_1E5427D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__CARThemeAssetLibrary_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasObservers");

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerObserver:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_queue_startObserving");
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CARThemeAssetLibrary queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CARThemeAssetLibrary_removeObserver___block_invoke;
  v7[3] = &unk_1E5427D20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__CARThemeAssetLibrary_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasObservers");

  objc_msgSend(*(id *)(a1 + 32), "observerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserver:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_queue_stopObserving");
}

- (void)_queue_findCurrentAssetWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CARThemeAssetLibrary queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CARThemeAssetLibrary vehicleIdentifier](self, "vehicleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAssetLibrary assetIdentifier](self, "assetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "findCurrentAsset vehicleID: %@ assetID: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    -[CARThemeAssetLibrary serviceConnection](self, "serviceConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke;
    v16[3] = &unk_1E54281E0;
    v16[4] = self;
    v11 = v4;
    v17 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_82;
    v13[3] = &unk_1E5428230;
    v13[4] = self;
    v14 = v7;
    v15 = v11;
    objc_msgSend(v12, "service_currentAssetForVehicleIdentifier:reply:", v6, v13);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2;
  v6[3] = &unk_1E54281B8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_82(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_83;
  v8[3] = &unk_1E5428208;
  v9 = v3;
  v5 = a1[5];
  v6 = a1[4];
  v10 = v5;
  v11 = v6;
  v12 = a1[6];
  v7 = v3;
  dispatch_async(v4, v8);

}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_83(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  CARThemeAssetVersion *v6;
  CARThemeAssetVersion *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "_currentAssetForVehicleIdentifier service asset %@", (uint8_t *)&v14, 0xCu);
  }

  v4 = *(id *)(a1 + 32);
  CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "asset in asset library: %@", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "version");
    v6 = (CARThemeAssetVersion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[CARThemeAssetVersion initWithIdentifier:iOSContentVersion:accessoryContentVersion:]([CARThemeAssetVersion alloc], "initWithIdentifier:iOSContentVersion:accessoryContentVersion:", *(_QWORD *)(a1 + 40), CFSTR("0"), &unk_1E543F5C8);
  }
  v7 = v6;
  CarThemeAssetsLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "checking for override asset", (uint8_t *)&v14, 2u);
  }

  +[CARThemeAssetOverrider overrideAssetNewerThanAssetVersion:](CARThemeAssetOverrider, "overrideAssetNewerThanAssetVersion:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CarThemeAssetsLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "prepared override asset %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = v9;
    objc_msgSend(*(id *)(a1 + 48), "_queue_applyOverrideAsset:", v11);
    v4 = v11;
  }
  CarThemeAssetsLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_INFO, "_currentAssetForVehicleIdentifier using asset %@", (uint8_t *)&v14, 0xCu);
  }

  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);

}

- (void)_queue_applyOverrideAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CARThemeAssetLibrary queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CARThemeAssetLibrary serviceConnection](self, "serviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARThemeAssetLibrary vehicleIdentifier](self, "vehicleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service_applyOverrideAsset:forVehicleIdentifier:reply:", v4, v7, &__block_literal_global_92);

}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarThemeAssetsLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();

}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_91()
{
  NSObject *v0;
  uint8_t v1[16];

  CarThemeAssetsLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEFAULT, "applied override asset", v1, 2u);
  }

}

- (void)_queue_startObserving
{
  NSObject *v3;
  void *v4;
  id v5;

  -[CARThemeAssetLibrary queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CARThemeAssetLibrary serviceConnection](self, "serviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_93);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service_startObservingWithReply:", &__block_literal_global_95);

}

void __45__CARThemeAssetLibrary__queue_startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarThemeAssetsLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();

}

void __45__CARThemeAssetLibrary__queue_startObserving__block_invoke_94()
{
  NSObject *v0;
  uint8_t v1[16];

  CarThemeAssetsLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEFAULT, "started observing theme asset library", v1, 2u);
  }

}

- (void)_queue_stopObserving
{
  NSObject *v3;
  void *v4;
  id v5;

  -[CARThemeAssetLibrary queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CARThemeAssetLibrary serviceConnection](self, "serviceConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_96);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service_stopObservingWithReply:", &__block_literal_global_98);

}

void __44__CARThemeAssetLibrary__queue_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarThemeAssetsLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();

}

void __44__CARThemeAssetLibrary__queue_stopObserving__block_invoke_97()
{
  NSObject *v0;
  uint8_t v1[16];

  CarThemeAssetsLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEFAULT, "stopped observing theme asset library", v1, 2u);
  }

}

- (NSUUID)vehicleIdentifier
{
  return self->_vehicleIdentifier;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CARThemeAssetLibraryObserverProxy)observerProxy
{
  return self->_observerProxy;
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_observerProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
}

- (void)initWithVehicle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "no clusterAssetIdentifier for vehicle %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "interrupted connection to CARThemeAssetService", a5, a6, a7, a8, 0);
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "invalidated connection to CARThemeAssetService", a5, a6, a7, a8, 0);
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "failed to message CARThemeAssetLibraryService: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "failed to connect to theme asset library service %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
