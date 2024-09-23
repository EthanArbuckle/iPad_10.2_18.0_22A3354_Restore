@implementation AXAssetsService

- (AXAssetsService)init
{
  AXAssetsService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *xpcConnectionQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAssetsService;
  v2 = -[AXAssetsService init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AXAssetsService", v3);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_destroyXPCConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  AXAssetsService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXLogAssetLoader();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D3F8E000, v3, OS_LOG_TYPE_DEFAULT, "AXAssetsService being deallocated: %@", buf, 0xCu);
  }

  -[AXAssetsService _destroyXPCConnection](self, "_destroyXPCConnection");
  v4.receiver = self;
  v4.super_class = (Class)AXAssetsService;
  -[AXAssetsService dealloc](&v4, sel_dealloc);
}

- (id)xpcConnection
{
  NSObject *xpcConnectionQueue;
  NSXPCConnection *v4;
  _QWORD block[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AXAssetsService_xpcConnection__block_invoke;
  block[3] = &unk_1E95D3E68;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __32__AXAssetsService_xpcConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.accessibility.axassetsd.service"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE37B90);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    objc_msgSend(v2, "setExportedInterface:", 0);
    objc_msgSend(v2, "setExportedObject:", 0);
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__AXAssetsService_xpcConnection__block_invoke_2;
    v12[3] = &unk_1E95D3E40;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    objc_msgSend(v2, "setInterruptionHandler:", v12);
    v7 = v4;
    v8 = 3221225472;
    v9 = __32__AXAssetsService_xpcConnection__block_invoke_5;
    v10 = &unk_1E95D3E40;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    objc_msgSend(v2, "setInvalidationHandler:", &v7);
    objc_msgSend(v2, "resume", v7, v8, v9, v10);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v2;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
  }
}

void __32__AXAssetsService_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXLogAssetLoader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = WeakRetained;
    _os_log_impl(&dword_1D3F8E000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "_destroyXPCConnection");
}

void __32__AXAssetsService_xpcConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXLogAssetLoader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __32__AXAssetsService_xpcConnection__block_invoke_5_cold_1((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(WeakRetained, "_destroyXPCConnection");
}

- (id)_serviceProxy
{
  void *v2;
  void *v3;

  -[AXAssetsService xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __32__AXAssetsService__serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  AXLogAssetLoader();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __32__AXAssetsService__serviceProxy__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)refreshAssetCatalogForPolicy:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "refreshAssetCatalogForAssetType:withOverrideTimeout:forceCatalogRefresh:", v10, v8, v5);
}

- (void)updateAssetForPolicy:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateAssetForAssetType:", v5);
}

- (void)runFirstBootTasks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runFirstBootTasks:", v3);

}

- (void)runFirstUnlockTasks
{
  id v2;

  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runFirstUnlockTasks");

}

- (void)informSiriVoiceSubscriptionsWithVoiceId:(id)a3 addition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a4;
  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("kAXVoiceId");
  v10[1] = CFSTR("kAXVoiceSubscriptionAddition");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invokeSimpleTaskById:arguments:", CFSTR("AXInformSiriVoiceSubscriptionsSimpleTask"), v9);
}

- (void)downloadTTSResourceForVoiceId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("kAXVoiceId");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invokeSimpleTaskById:arguments:", CFSTR("AXDownloadTTSResourceTask"), v6);
}

- (void)updateTTSResourcesForActionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("kAXActionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeSimpleTaskById:arguments:", CFSTR("AXUpdateResourcesSimpleTask"), v6);

}

- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("kAXVoiceId");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invokeSimpleTaskById:arguments:", CFSTR("AXDeleteCompactResourceSimpleTask"), v6);
}

- (void)restartTTSResourceMigration
{
  id v2;

  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invokeSimpleTaskById:arguments:", CFSTR("AXMigrateResourcesSimpleTask"), MEMORY[0x1E0C9AA70]);

}

- (void)componentCacheChanged
{
  id v2;

  -[AXAssetsService _serviceProxy](self, "_serviceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invokeSimpleTaskById:arguments:", CFSTR("AXComponentChangeSimpleTask"), MEMORY[0x1E0C9AA70]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __32__AXAssetsService_xpcConnection__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3F8E000, a2, a3, "Connection to service invalidated. client: %@", a5, a6, a7, a8, 2u);
}

void __32__AXAssetsService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3F8E000, a2, a3, "Failed to get service proxy: %@", a5, a6, a7, a8, 2u);
}

@end
