@implementation CARThemeAssetLibraryObserverProxy

- (CARThemeAssetLibraryObserverProxy)init
{
  CARThemeAssetLibraryObserverProxy *v2;
  CARObserverHashTable *v3;
  CARObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CARThemeAssetLibraryObserverProxy;
  v2 = -[CARThemeAssetLibraryObserverProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CARObserverHashTable initWithProtocol:]([CARObserverHashTable alloc], "initWithProtocol:", &unk_1EE9AC378);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)service_attemptingDownloadForAssetVersion:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CARThemeAssetLibraryObserverProxy *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CARThemeAssetLibraryObserverProxy assetLibrary](self, "assetLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CARThemeAssetLibraryObserverProxy_service_attemptingDownloadForAssetVersion_reply___block_invoke;
  block[3] = &unk_1E54282B8;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __85__CARThemeAssetLibraryObserverProxy_service_attemptingDownloadForAssetVersion_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v16 = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "received attempting download for theme asset: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "themeAssetLibrary:attemptingDownloadOfAssetWithVersion:", v9, *(_QWORD *)(a1 + 32));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "iOSContentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "themeAssetLibrary:attemptingDownloadForAssetVersion:", v14, v12);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)service_failedDownloadForAssetVersion:(id)a3 error:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CARThemeAssetLibraryObserverProxy *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CARThemeAssetLibraryObserverProxy assetLibrary](self, "assetLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__CARThemeAssetLibraryObserverProxy_service_failedDownloadForAssetVersion_error_reply___block_invoke;
  v16[3] = &unk_1E5428208;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

}

uint64_t __87__CARThemeAssetLibraryObserverProxy_service_failedDownloadForAssetVersion_error_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v17 = 138543618;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "received failed download for theme asset: %{public}@ error: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "assetLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "assetLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "themeAssetLibrary:failedDownloadOfAssetWithVersion:error:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "iOSContentVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "observers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "assetLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "themeAssetLibrary:failedDownloadForAssetVersion:error:", v15, v13, *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)service_completedDownloadForAsset:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CARThemeAssetLibraryObserverProxy *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CARThemeAssetLibraryObserverProxy assetLibrary](self, "assetLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CARThemeAssetLibraryObserverProxy_service_completedDownloadForAsset_reply___block_invoke;
  block[3] = &unk_1E54282B8;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __77__CARThemeAssetLibraryObserverProxy_service_completedDownloadForAsset_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "received completed download for theme asset %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "themeAssetLibrary:completedDownloadOfAsset:", v9, *(_QWORD *)(a1 + 32));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)service_didUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  CARThemeAssetLibraryObserverProxy *v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CARThemeAssetLibraryObserverProxy assetLibrary](self, "assetLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__CARThemeAssetLibraryObserverProxy_service_didUpdateFromAsset_toAsset_forVehicleIdentifier_reply___block_invoke;
  block[3] = &unk_1E54282E0;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = self;
  v25 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(v15, block);

}

uint64_t __99__CARThemeAssetLibraryObserverProxy_service_didUpdateFromAsset_toAsset_forVehicleIdentifier_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "received didUpdateFromAsset: %@ toAsset: %@ forVehicleID: %@", (uint8_t *)&v12, 0x20u);
  }

  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "assetLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vehicleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v8);

  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 56), "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "assetLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "themeAssetLibrary:didUpdateFromAsset:toAsset:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (CARThemeAssetLibrary)assetLibrary
{
  return (CARThemeAssetLibrary *)objc_loadWeakRetained((id *)&self->_assetLibrary);
}

- (void)setAssetLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_assetLibrary, a3);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_assetLibrary);
}

@end
