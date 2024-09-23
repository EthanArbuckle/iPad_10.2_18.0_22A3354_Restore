@implementation CARThemeAssetLibraryAgent

- (CARThemeAssetLibraryAgent)init
{
  CARThemeAssetLibraryAgent *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CARThemeAssetLibraryAgent;
  v2 = -[CARThemeAssetLibraryAgent init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARThemeAssetLibraryAgent setConnections:](v2, "setConnections:", v3);

  }
  return v2;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CARThemeAssetLibraryAgent connections](self, "connections", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CARThemeAssetLibraryAgent _removeConnection:](self, "_removeConnection:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v6 = a4;
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.carkit.themeAssetLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE99E798);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v9);
    objc_msgSend(v6, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE99FA50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v10);
    objc_initWeak(&location, v6);
    objc_initWeak(&from, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __64__CARThemeAssetLibraryAgent_listener_shouldAcceptNewConnection___block_invoke;
    v17[3] = &unk_1E5427CF8;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    v11 = (void *)MEMORY[0x1A85D396C](v17);
    objc_msgSend(v6, "setInterruptionHandler:", v11);
    objc_msgSend(v6, "setInvalidationHandler:", v11);
    CarThemeAssetsLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "serviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v6;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_DEFAULT, "receiving a service connection %@ to service %@ from %@", buf, 0x20u);

    }
    objc_msgSend(v6, "resume");

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    CarThemeAssetsLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CARThemeAssetLibraryAgent listener:shouldAcceptNewConnection:].cold.1(v6, v9);
  }

  return v8;
}

void __64__CARThemeAssetLibraryAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_DEFAULT, "theme asset library connection interrupted or invalidated; removing connection.",
      v7,
      2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4 && WeakRetained)
  {
    objc_msgSend(v4, "connections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    objc_msgSend(v5, "_removeConnection:", WeakRetained);
    objc_sync_exit(v6);

  }
}

- (void)service_currentAssetForVehicleIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CarThemeAssetsLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "requesting current asset for vehicleID: %@", (uint8_t *)&v12, 0xCu);
  }

  -[CARThemeAssetLibraryAgent delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CARThemeAssetLibraryAgent delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryAgent:requestsCurrentAssetForVehicleIdentifier:completion:", self, v6, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)service_applyOverrideAsset:(id)a3 forVehicleIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  CarThemeAssetsLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_INFO, "applying override asset: %@ for vehicleID: %@", (uint8_t *)&v15, 0x16u);
  }

  -[CARThemeAssetLibraryAgent delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CARThemeAssetLibraryAgent delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryAgent:receivedOverrideAsset:forVehicleIdentifier:", self, v8, v9);

  }
  v10[2](v10);

}

- (void)service_startObservingWithReply:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "start observing theme library for connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[CARThemeAssetLibraryAgent _addConnection:](self, "_addConnection:", v4);
}

- (void)service_stopObservingWithReply:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "stop observing theme library for connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[CARThemeAssetLibraryAgent _removeConnection:](self, "_removeConnection:", v4);
}

- (void)notifyAttemptingDownloadForAssetVersion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "notifying theme asset observers of attempting download for asset: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke;
  v7[3] = &unk_1E5427D48;
  v8 = v4;
  v6 = v4;
  -[CARThemeAssetLibraryAgent _performObserverAction:](self, "_performObserverAction:", v7);

}

void __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke_2;
  v6[3] = &unk_1E5427D20;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "service_attemptingDownloadForAssetVersion:reply:", v4, v6);

}

void __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of attempting download for %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)notifyFailedDownloadForAssetVersion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CarThemeAssetsLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "notifying theme asset observers of failed download for asset: %{public}@ error: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke;
  v11[3] = &unk_1E5427D98;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[CARThemeAssetLibraryAgent _performObserverAction:](self, "_performObserverAction:", v11);

}

void __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke_2;
  v7[3] = &unk_1E5427D70;
  v8 = v3;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v6, "service_failedDownloadForAssetVersion:error:reply:", v5, v4, v7);

}

void __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = 138412802;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of failed download for asset: %{public}@ error: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)notifyCompletedDownloadOfAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CarThemeAssetsLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_INFO, "notifying theme asset observers of completed download for asset: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke;
  v7[3] = &unk_1E5427D48;
  v8 = v4;
  v6 = v4;
  -[CARThemeAssetLibraryAgent _performObserverAction:](self, "_performObserverAction:", v7);

}

void __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke_2;
  v6[3] = &unk_1E5427D20;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "service_completedDownloadForAsset:reply:", v4, v6);

}

void __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of completed download for asset: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)notifyDidUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CarThemeAssetsLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_INFO, "notifiying theme asset observers of update from asset %{public}@ to asset: %{public}@ for vehicleID: %@", buf, 0x20u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke;
  v15[3] = &unk_1E5427DE8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[CARThemeAssetLibraryAgent _performObserverAction:](self, "_performObserverAction:", v15);

}

void __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v5 = a1[5];
  v4 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke_2;
  v8[3] = &unk_1E5427DC0;
  v9 = v3;
  v6 = (void *)a1[4];
  v10 = v6;
  v11 = (id)a1[5];
  v12 = (id)a1[6];
  v7 = v3;
  objc_msgSend(v7, "service_didUpdateFromAsset:toAsset:forVehicleIdentifier:reply:", v6, v5, v4, v8);

}

void __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CarThemeAssetsLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = 138413058;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A83A2000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of update from asset %{public}@ to asset %{public}@ for vehicleID: %@", (uint8_t *)&v7, 0x2Au);
  }

}

- (void)_addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CARThemeAssetLibraryAgent connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    CarThemeAssetsLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "holding a theme library observing transaction for %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = (void *)os_transaction_create();
    objc_msgSend(v4, "setUserInfo:", v8);

  }
  -[CARThemeAssetLibraryAgent connections](self, "connections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

  objc_sync_exit(v5);
}

- (void)_removeConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CARThemeAssetLibraryAgent connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  CarThemeAssetsLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "releasing a theme library observing transaction for %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v4, "setUserInfo:", 0);
  -[CARThemeAssetLibraryAgent connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
  {
    CarThemeAssetsLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_DEFAULT, "Removing theme library connection %@", (uint8_t *)&v11, 0xCu);
    }

    -[CARThemeAssetLibraryAgent connections](self, "connections");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v10, "removeObject:", v4);
  }
  else
  {
    CarThemeAssetsLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "Connection %@ was not observing theme library", (uint8_t *)&v11, 0xCu);
    }
  }

  objc_sync_exit(v5);
}

- (void)_performObserverAction:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CARThemeAssetLibraryAgent connections](self, "connections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarThemeAssetsLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke_cold_1((uint64_t)v2, v3);

}

- (CARThemeAssetLibraryAgentDelegate)delegate
{
  return (CARThemeAssetLibraryAgentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit.themeAssetLibrary");
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "failed to connect to theme library observer service %@", (uint8_t *)&v2, 0xCu);
}

@end
