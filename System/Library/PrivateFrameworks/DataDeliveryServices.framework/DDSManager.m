@implementation DDSManager

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5 autoAssetManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DDSManager *v15;
  DDSManager *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *pendingAssertionsToUpdateByAssetType;
  dispatch_queue_t v19;
  OS_dispatch_queue *workQueue;
  uint64_t v21;
  NSMutableDictionary *remoteSyncStateByAssetType;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  DDSRemoteSyncState *v29;
  DDSAssetObserver *v30;
  DDSAssetObserving *assetObserver;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)DDSManager;
  v15 = -[DDSManager init](&v38, sel_init);
  v16 = v15;
  if (v15)
  {
    v33 = v12;
    v15->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingAssertionsToUpdateByAssetType = v16->_pendingAssertionsToUpdateByAssetType;
    v16->_pendingAssertionsToUpdateByAssetType = v17;

    v19 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSManager", 0);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_tracker, a4);
    -[DDSAssetTracking setDelegate:](v16->_tracker, "setDelegate:", v16);
    objc_storeStrong((id *)&v16->_provider, a3);
    -[DDSAssetProviding setDelegate:](v16->_provider, "setDelegate:", v16);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_autoAssetManager, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    remoteSyncStateByAssetType = v16->_remoteSyncStateByAssetType;
    v16->_remoteSyncStateByAssetType = (NSMutableDictionary *)v21;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[DDSAssetTracking trackedAssetTypes](v16->_tracker, "trackedAssetTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v29 = -[DDSRemoteSyncState initWithDelegate:assetType:]([DDSRemoteSyncState alloc], "initWithDelegate:assetType:", v16, v28);
          -[NSMutableDictionary setObject:forKey:](v16->_remoteSyncStateByAssetType, "setObject:forKey:", v29, v28);
          -[DDSRemoteSyncState loadStateAndScheduleUpdate](v29, "loadStateAndScheduleUpdate");

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v25);
    }

    v30 = objc_alloc_init(DDSAssetObserver);
    assetObserver = v16->_assetObserver;
    v16->_assetObserver = (DDSAssetObserving *)v30;

    -[DDSAssetObserving setDelegate:](v16->_assetObserver, "setDelegate:", v16);
    -[DDSAssetObserving observeAssetType:](v16->_assetObserver, "observeAssetType:", CFSTR("com.apple.MobileAsset.LinguisticData"));
    -[DDSManager removeOldAssets](v16, "removeOldAssets");
    -[DDSManager createAutoAssetAssertionForExistingAssertions](v16, "createAutoAssetAssertionForExistingAssertions");
    v12 = v33;
  }

  return v16;
}

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  DDSManagerDataSource *v8;
  DDSManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(DDSManagerDataSource);
  v9 = -[DDSManager initWithProvider:tracker:dataSource:](self, "initWithProvider:tracker:dataSource:", v7, v6, v8);

  return v9;
}

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  DDSMAAutoAssetManager *v11;
  DDSManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(DDSMAAutoAssetManager);
  v12 = -[DDSManager initWithProvider:tracker:dataSource:autoAssetManager:](self, "initWithProvider:tracker:dataSource:autoAssetManager:", v10, v9, v8, v11);

  return v12;
}

- (void)beginUpdateCycleForAssetType:(id)a3 forced:(BOOL)a4 discretionaryDownload:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  BOOL v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v5 = a5;
  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  UpdateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Beginning update cycle for asset type: %@ (forced %d, discretionary %d)...", buf, 0x18u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[DDSManager remoteSyncStateByAssetType](self, "remoteSyncStateByAssetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    UpdateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:].cold.1();
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "syncStatus") == 1)
  {
    UpdateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Update cycle already triggered, holding with pending assertions...", buf, 2u);
    }
LABEL_9:

    goto LABEL_13;
  }
  -[DDSManager didStartUpdateCycleForAssetType:](self, "didStartUpdateCycleForAssetType:", v8);
  UpdateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_1DA990000, v13, OS_LOG_TYPE_DEFAULT, "Updating catalog for asset type: %{public}@", buf, 0xCu);
  }

  -[DDSManager provider](self, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke;
  v15[3] = &unk_1EA141D70;
  v15[4] = self;
  v16 = v8;
  v17 = v6;
  v18 = v5;
  objc_msgSend(v14, "updateCatalogForAssetType:discretionaryDownload:withCompletion:", v16, v5, v15);

LABEL_13:
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id location;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_initWeak(&location, v4);

  if (v4)
  {
    if (v3)
    {
      v6 = objc_loadWeakRetained(&location);
      objc_msgSend(v6, "workQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_2;
      block[3] = &unk_1EA141180;
      objc_copyWeak(&v36, &location);
      v35 = *(id *)(a1 + 40);
      dispatch_sync(v7, block);

      objc_destroyWeak(&v36);
    }
    else
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__5;
      v32 = __Block_byref_object_dispose__5;
      v33 = 0;
      v16 = objc_loadWeakRetained(&location);
      objc_msgSend(v16, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_186;
      v23[3] = &unk_1EA141D48;
      objc_copyWeak(&v26, &location);
      v18 = *(id *)(a1 + 40);
      v27 = *(_BYTE *)(a1 + 48);
      v24 = v18;
      v25 = &v28;
      dispatch_sync(v17, v23);

      v19 = objc_msgSend((id)v29[5], "count");
      v20 = objc_loadWeakRetained(&location);
      v21 = v20;
      if (v19)
      {
        objc_msgSend(v20, "provider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "beginDownloadForAssertions:discretionaryDownload:", v29[5], *(unsigned __int8 *)(a1 + 49));

      }
      else
      {
        objc_msgSend(v20, "didEndUpdateCycleWithAssetType:error:", *(_QWORD *)(a1 + 40), 0);
      }

      objc_destroyWeak(&v26);
      _Block_object_dispose(&v28, 8);

    }
  }
  else
  {
    UpdateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_destroyWeak(&location);

}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingAssertionsToUpdateByAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));

}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_186(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pendingAssertionsToUpdateByAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = v7;

  if (*(_BYTE *)(a1 + 56))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = objc_loadWeakRetained(v2);
    objc_msgSend(v12, "tracker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allAssertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v19, "query");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "assetType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v22)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v16);
    }

    UpdateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v59 = v25;
      v60 = 2114;
      v61 = v24;
      v26 = "Cycle will force update all assertions: %{public}@ for asset type: %{public}@";
LABEL_30:
      _os_log_impl(&dword_1DA990000, v23, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
    }
  }
  else if (objc_msgSend(v8, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    v27 = objc_loadWeakRetained(v2);
    objc_msgSend(v27, "pendingAssertionsToUpdateByAssetType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v28, "setObject:forKey:", v29, *(_QWORD *)(a1 + 32));

    UpdateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v59 = v31;
      v60 = 2114;
      v61 = v30;
      v26 = "Cycle will update pending assertions: %{public}@ for asset type: %{public}@";
      goto LABEL_30;
    }
  }
  else
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = objc_loadWeakRetained(v2);
    objc_msgSend(v35, "tracker", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "assertionDueForUpdateSinceDate:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v50 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v43, "query");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "assetType");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v46)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v43);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v40);
    }

    UpdateLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v47 = *(_QWORD *)(a1 + 32);
      v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v59 = v48;
      v60 = 2114;
      v61 = v47;
      v26 = "Cycle will update time eligible assertions: %{public}@ for asset type: %{public}@";
      goto LABEL_30;
    }
  }

}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  UpdateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544130;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Add assertion for query: %{public}@ policy: (%{public}@) assertionID: (%{public}@) clientID: (%{public}@)", (uint8_t *)&v18, 0x2Au);
  }

  -[DDSManager assetObserver](self, "assetObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "observeAssetType:", v16);

  -[DDSManager tracker](self, "tracker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAssertionForQuery:policy:assertionID:clientID:", v10, v11, v12, v13);

}

- (void)removeAssertionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Remove assertion with ID: (%{public}@)", (uint8_t *)&v7, 0xCu);
  }

  -[DDSManager tracker](self, "tracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAssertionWithID:", v4);

}

- (void)assertionIDsForClientID:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[DDSManager tracker](self, "tracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertionIDsForClientID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DDSManager assertionIDsForClientID:reply:].cold.1();

  v7[2](v7, v9);
}

- (void)triggerDump
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA990000, log, OS_LOG_TYPE_DEBUG, "Asset log dump requested!", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)triggerUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Asset update requested via ddsutil", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[DDSManager tracker](self, "tracker", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackedAssetTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)autoAssetQueryForAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  DDSAssetQuery *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DDSAssetQuery *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[DDSMAAutoAssetManager isAutoAssetType:](DDSMAAutoAssetManager, "isAutoAssetType:", v6);

  if (v7)
  {
    objc_msgSend(v4, "query");
    v8 = (DDSAssetQuery *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDSManager autoAssetManager](self, "autoAssetManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "autoAssetTypeForAsserType:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [DDSAssetQuery alloc];
      objc_msgSend(v4, "query");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "filter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[DDSAssetQuery initWithAssetType:filter:](v13, "initWithAssetType:filter:", v12, v15);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)handleNewAssertions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  DDSManager *v19;
  __int128 *p_buf;
  uint8_t v21[128];
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Handle new assertions: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[DDSManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__DDSManager_handleNewAssertions___block_invoke;
  block[3] = &unk_1EA141C20;
  v7 = v4;
  v18 = v7;
  v19 = self;
  p_buf = &buf;
  dispatch_sync(v6, block);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[DDSManager createRemoteSyncStateForAssetType:](self, "createRemoteSyncStateForAssetType:", v12, (_QWORD)v13);
        -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", v12, 0, 0);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&buf, 8);
}

void __34__DDSManager_handleNewAssertions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  DDSAssetQuery *v19;
  void *v20;
  void *v21;
  DDSAssetQuery *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v37;
    v6 = 0x1EA140000uLL;
    *(_QWORD *)&v3 = 138543618;
    v33 = v3;
    do
    {
      v7 = 0;
      v34 = v4;
      do
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v9 = *(void **)(v6 + 2768);
        objc_msgSend(v8, "query", v33);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "assetType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "isAutoAssetType:", v11);

        if ((_DWORD)v9)
        {
          AutoAssetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v8;
            _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Handle new assertion for auto asset: %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "autoAssetManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "query");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "registerInterestInContentForQuery:", v14);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "autoAssetManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "query");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "assetType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "autoAssetTypeForAsserType:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            AutoAssetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              v41 = v13;
              v42 = 2114;
              v43 = v8;
              _os_log_impl(&dword_1DA990000, v18, OS_LOG_TYPE_DEFAULT, "Handle new assertion for auto asset with override asset type: %{public}@, assertion: %{public}@", buf, 0x16u);
            }

            v19 = [DDSAssetQuery alloc];
            objc_msgSend(v8, "query");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "filter");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[DDSAssetQuery initWithAssetType:filter:](v19, "initWithAssetType:filter:", v13, v21);

            objc_msgSend(*(id *)(a1 + 40), "autoAssetManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "registerInterestInContentForQuery:", v22);

          }
          v24 = v5;
          v25 = v6;
          objc_msgSend(v8, "query");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "assetType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v14);
          objc_msgSend(*(id *)(a1 + 40), "pendingAssertionsToUpdateByAssetType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
            v30 = v28;
          else
            v30 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v31 = v30;

          objc_msgSend(v31, "addObject:", v8);
          objc_msgSend(*(id *)(a1 + 40), "pendingAssertionsToUpdateByAssetType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v31, v14);

          v6 = v25;
          v5 = v24;
          v4 = v34;
        }

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v4);
  }

}

- (void)handleAddedNewDescriptor:(id)a3 forAssertion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  DefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "New descriptor : %{public}@ added for assertion: %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)handleRemovedAssertions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove assertions: %{public}@, will let garbage collection collect.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(v7);
        -[DDSManager autoAssetQueryForAssertion:](self, "autoAssetQueryForAssertion:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v35 = v7;
    AutoAssetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA990000, v13, OS_LOG_TYPE_DEFAULT, "Asked to remove assertions for auto asset", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[DDSManager tracker](self, "tracker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allAssertions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          -[DDSManager autoAssetQueryForAssertion:](self, "autoAssetQueryForAssertion:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[DDSManager autoAssetManager](self, "autoAssetManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "autoAssetSelectorsForQuery:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "addObjectsFromArray:", v23);
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v18);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v36 = v6;
    obj = v6;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v46;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v46 != v38)
            objc_enumerationMutation(obj);
          v40 = v24;
          v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v24);
          -[DDSManager autoAssetManager](self, "autoAssetManager", v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "autoAssetSelectorsForQuery:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v28 = v27;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v42;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v42 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
                if ((objc_msgSend(v14, "containsObject:", v33) & 1) != 0)
                {
                  AutoAssetLog();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v62 = v33;
                    _os_log_impl(&dword_1DA990000, v34, OS_LOG_TYPE_DEFAULT, "Cannot eliminate interest in content for asset selector: %{public}@", buf, 0xCu);
                  }
                }
                else
                {
                  -[DDSManager autoAssetManager](self, "autoAssetManager");
                  v34 = objc_claimAutoreleasedReturnValue();
                  -[NSObject unregisterInterestInContentForAssetSelector:](v34, "unregisterInterestInContentForAssetSelector:", v33);
                }

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
            }
            while (v30);
          }

          v24 = v40 + 1;
        }
        while (v40 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v39);
    }

    v7 = v35;
    v6 = v36;
  }

}

- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  DefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debuggingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134349314;
    v12 = a3;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Download state: %{public}lu for asset: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      +[DDSAnalytics sharedInstance](DDSAnalytics, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelRecordingForAsset:", v5);
      goto LABEL_13;
    }
    if (a3 == 11)
    {
      +[DDSAnalytics sharedInstance](DDSAnalytics, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 4;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 1)
    {
      +[DDSAnalytics sharedInstance](DDSAnalytics, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1;
      goto LABEL_11;
    }
    if (a3 == 9)
    {
      +[DDSAnalytics sharedInstance](DDSAnalytics, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 3;
LABEL_11:
      objc_msgSend(v8, "recordAssetAction:forAsset:", v10, v5);
LABEL_13:

    }
  }

}

- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UpdateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Completed download for assertion (%{public}@) with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (!v7)
  {
    -[DDSManager tracker](self, "tracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateAssertion:atDate:", v6, v10);

  }
}

- (void)didCompleteDownloadForAssertions:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UpdateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v34 = v6;
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Completed download for assertions (%{public}@) with error: %{public}@", buf, 0x16u);
  }

  UpdateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Calling didEndUpdateCycle", buf, 2u);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "query");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "assetType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[DDSManager didEndUpdateCycleWithAssetType:error:](self, "didEndUpdateCycleWithAssetType:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), v7, (_QWORD)v23);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UpdateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "didUpdateCatalogWithAssetType for asset type: %{public}@ with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (v7)
  {
    -[DDSManager didEndUpdateCycleWithAssetType:error:](self, "didEndUpdateCycleWithAssetType:error:", v6, v7);
  }
  else
  {
    -[DDSManager dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSManager setCatalogUpdateDate:forAssetType:](self, "setCatalogUpdateDate:forAssetType:", v10, v6);

  }
}

- (void)createRemoteSyncStateForAssetType:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  DDSRemoteSyncState *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DDSManager remoteSyncStateByAssetType](self, "remoteSyncStateByAssetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (DDSRemoteSyncState *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[DDSRemoteSyncState initWithDelegate:assetType:]([DDSRemoteSyncState alloc], "initWithDelegate:assetType:", self, v8);
    -[DDSManager remoteSyncStateByAssetType](self, "remoteSyncStateByAssetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)updateAutoAssetForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Begin update cycle for auto asset corresponding to asset type %@ ...", buf, 0xCu);
  }
  v15 = v4;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[DDSManager tracker](self, "tracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allAssertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        -[DDSManager autoAssetQueryForAssertion:](self, "autoAssetQueryForAssertion:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[DDSManager autoAssetManager](self, "autoAssetManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = v11;
          v16[1] = 3221225472;
          v16[2] = __42__DDSManager_updateAutoAssetForAssetType___block_invoke;
          v16[3] = &unk_1EA141D98;
          v17 = v13;
          objc_msgSend(v14, "updateAssetForQuery:callback:", v17, v16);

        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

void __42__DDSManager_updateAutoAssetForAssetType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AutoAssetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset update for query: %{public}@ completed successfully", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __42__DDSManager_updateAutoAssetForAssetType___block_invoke_cold_1();
  }

}

- (void)remoteSyncStateRequestsUpdateForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Begin update cycle requested for %@ ...", (uint8_t *)&v6, 0xCu);
  }

  -[DDSManager updateAutoAssetForAssetType:](self, "updateAutoAssetForAssetType:", v4);
  -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", v4, 0, 1);

}

- (void)remoteSyncStateRequestsRetryForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Retry update cycle requested for %@ ...", (uint8_t *)&v6, 0xCu);
  }

  -[DDSManager willRetryUpdateCycle](self, "willRetryUpdateCycle");
  -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", v4, 0, 0);

}

- (void)remoteSyncStateRequestsResetForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UpdateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "DDS assertion reset requested, initiating forced update for %@", (uint8_t *)&v7, 0xCu);
  }

  -[DDSManager updateAutoAssetForAssetType:](self, "updateAutoAssetForAssetType:", v4);
  -[DDSManager tracker](self, "tracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetAssertionDueDatesForAssetType:", v4);

  -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", v4, 1, 0);
}

- (void)didStartUpdateCycleForAssetType:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[DDSManager remoteSyncStateByAssetType](self, "remoteSyncStateByAssetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v7, "beganUpdateCycle");

}

- (void)didEndUpdateCycleWithAssetType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  DDSManager *v20;
  id v21;
  uint8_t v22[8];
  _QWORD block[5];
  id v24;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UpdateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Update cycled ended with error: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[DDSManager remoteSyncStateByAssetType](self, "remoteSyncStateByAssetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v10, "completedUpdateCycleWithError:", v7);
  if (v7)
  {
    -[DDSManager workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke_194;
    v19 = &unk_1EA1412F0;
    v20 = self;
    v21 = v6;
    dispatch_sync(v11, &v16);

    objc_msgSend(v10, "syncStatus", v16, v17, v18, v19, v20);
  }
  else
  {
    -[DDSManager assetObserver](self, "assetObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyObserversAssetsUpdatedForType:", v6);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x2020000000;
    v28 = 0;
    -[DDSManager workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke;
    block[3] = &unk_1EA141C20;
    block[4] = self;
    v14 = v6;
    v24 = v14;
    p_buf = &buf;
    dispatch_sync(v13, block);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      UpdateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1DA990000, v15, OS_LOG_TYPE_DEFAULT, "Begin cycle for missed/remaining pending assertions...", v22, 2u);
      }

      -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:](self, "beginUpdateCycleForAssetType:forced:discretionaryDownload:", v14, 0, 1);
    }

    _Block_object_dispose(&buf, 8);
  }

}

void __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingAssertionsToUpdateByAssetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "count") != 0;
}

void __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke_194(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingAssertionsToUpdateByAssetType");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDSManager provider](self, "provider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverDidUpdateAssetsWithType:", v4);

}

- (void)deleteV1AssetsIfNecessary
{
  NSObject *v2;

  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_7);

}

void __39__DDSManager_deleteV1AssetsIfNecessary__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  DefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEFAULT, "Requesting clean v1 LinguisticData repository", buf, 2u);
  }

  MEMORY[0x1DF0A2F40](CFSTR("com.apple.MobileAsset.LinguisticData"));
  DefaultLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1DA990000, v1, OS_LOG_TYPE_DEFAULT, "Finished clean v1 LinguisticData repository", v2, 2u);
  }

}

- (void)removeOldAssets
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DDSManager_removeOldAssets__block_invoke;
  block[3] = &unk_1EA141158;
  block[4] = self;
  dispatch_async(v3, block);

}

void __29__DDSManager_removeOldAssets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "deleteV1AssetsIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "tracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeOldAssetsForAssertions:", v5);

}

- (void)createAutoAssetAssertionForExistingAssertions
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  DDSAssetQuery *v15;
  void *v16;
  void *v17;
  DDSAssetQuery *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Create auto asset assertions for existing assertions", buf, 2u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[DDSManager tracker](self, "tracker", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        -[DDSManager autoAssetManager](self, "autoAssetManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "query");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "assetType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "autoAssetTypeForAsserType:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [DDSAssetQuery alloc];
          objc_msgSend(v10, "query");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "filter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[DDSAssetQuery initWithAssetType:filter:](v15, "initWithAssetType:filter:", v14, v17);

          -[DDSManager autoAssetManager](self, "autoAssetManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "registerInterestInContentForQuery:", v18);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

}

- (int64_t)assetUpdateStatusForAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;

  v4 = a3;
  -[DDSManager provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatableAssetsForAssertion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count") != 0;
  DefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DDSManager assetUpdateStatusForAssertion:].cold.1(v4, v7, v8);

  return v7;
}

- (void)updateCatalogForAssetType:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[DDSManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v9, "setAllowsCellularAccess:", 1);
  objc_msgSend(v9, "setAllowsExpensiveAccess:", 1);
  objc_msgSend(v9, "setDiscretionary:", 0);
  -[DDSManager provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__DDSManager_updateCatalogForAssetType_withCompletion___block_invoke;
  v12[3] = &unk_1EA141AB8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "startCatalogDownloadForAssetType:withDownloadOptions:withCompletion:", v7, v9, v12);

}

uint64_t __55__DDSManager_updateCatalogForAssetType_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)updateCatalogMetadataKeyForAssetType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("UpdateCatalogMetadata"), a3);
}

- (void)setCatalogUpdateDate:(id)a3 forAssetType:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[DDSManager updateCatalogMetadataKeyForAssetType:](DDSManager, "updateCatalogMetadataKeyForAssetType:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DDSManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDate:forPreferenceKey:", v6, v8);

}

- (id)catalogUpdateDateForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DDSManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[DDSManager updateCatalogMetadataKeyForAssetType:](DDSManager, "updateCatalogMetadataKeyForAssetType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDSManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateForPreferenceKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)modifyAssetUpdateStatusForAssertion:(id)a3 status:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[DDSManager tracker](self, "tracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "updateStatusForAssertion:", v6);

  if (v8 == 2)
  {
    a4 = 2;
  }
  else
  {
    -[DDSManager tracker](self, "tracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modifyUpdateStatusForAssertion:toStatus:", v6, a4);

  }
  return a4;
}

- (void)fetchCatalogBasedAssetUpdateStatusForAssertion:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, int64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  DDSManager *v22;
  id v23;
  void (**v24)(id, int64_t, _QWORD);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, int64_t, _QWORD))a4;
  objc_msgSend(v6, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSManager catalogUpdateDateForAssetType:](self, "catalogUpdateDateForAssetType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "timeIntervalSinceNow"), v11 > -86400.0))
  {
    DefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "query");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Catalog is already updated for asset type: %@ at %@, hence skip updating it again", buf, 0x16u);

    }
    v15 = -[DDSManager assetUpdateStatusForAssertion:](self, "assetUpdateStatusForAssertion:", v6);
    -[DDSManager tracker](self, "tracker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "modifyUpdateStatusForAssertion:toStatus:", v6, v15);

    v7[2](v7, v15, 0);
  }
  else
  {
    objc_msgSend(v6, "query");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke;
    v20[3] = &unk_1EA141DC0;
    v21 = v17;
    v22 = self;
    v23 = v6;
    v24 = v7;
    v19 = v17;
    -[DDSManager updateCatalogForAssetType:withCompletion:](self, "updateCatalogForAssetType:withCompletion:", v18, v20);

  }
}

void __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    DDSAssetDownloadUIError((void *)1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Catalog updated successfully for asset type: (%{public}@)", (uint8_t *)&v19, 0xCu);

    }
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v15, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCatalogUpdateDate:forAssetType:", v17, v18);

    objc_msgSend(*(id *)(a1 + 40), "assetUpdateStatusForAssertion:", *(_QWORD *)(a1 + 48));
    v13 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DDSManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[DDSManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 *p_buf;
  _QWORD *v30;
  _QWORD v31[4];
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1DA990000, v2, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(a1[5], "tracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertionForQuery:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[5], "tracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "updateStatusForAssertion:", v5);

    if (v7 == 2)
    {
      DefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = a1[4];
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Asset update is in progress for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v33 = 0x2020000000;
      v34 = 0;
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x2020000000;
      v31[3] = 0;
      v13 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_202;
      v26[3] = &unk_1EA141E10;
      v26[4] = a1[5];
      v28 = a1[6];
      p_buf = &buf;
      v30 = v31;
      v14 = v5;
      v27 = v14;
      v15 = (void *)MEMORY[0x1DF0A321C](v26);
      v16 = a1[5];
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_3;
      v23[3] = &unk_1EA141E38;
      v24 = a1[4];
      v17 = v15;
      v25 = v17;
      objc_msgSend(v16, "fetchCatalogBasedAssetUpdateStatusForAssertion:callback:", v14, v23);
      objc_msgSend(a1[5], "autoAssetQueryForAssertion:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(a1[5], "autoAssetManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v13;
        v20[1] = 3221225472;
        v20[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_204;
        v20[3] = &unk_1EA141E38;
        v21 = v18;
        v22 = v17;
        objc_msgSend(v19, "fetchAssetUpdateStatusForQuery:callback:", v21, v20);

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD))v17 + 2))(v17, 0, 0);
      }

      _Block_object_dispose(v31, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1();

    v11 = (void (**)(id, _QWORD, void *))a1[6];
    DDSAssetDownloadUIError(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);

  }
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  id v15[2];
  id location;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = objc_initWeak(&location, v6);

  if (v6)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_2;
    v10[3] = &unk_1EA141DE8;
    v11 = v5;
    v13 = *(id *)(a1 + 48);
    v15[1] = a2;
    v14 = *(_OWORD *)(a1 + 56);
    objc_copyWeak(v15, &location);
    v12 = *(id *)(a1 + 40);
    dispatch_async(v9, v10);

    objc_destroyWeak(v15);
  }
  objc_destroyWeak(&location);

}

uint64_t __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_2(uint64_t result)
{
  _QWORD *v1;
  uint64_t (*v2)(void);
  id WeakRetained;

  v1 = (_QWORD *)result;
  if (*(_QWORD *)(result + 32))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(result + 48) + 16);
    return v2();
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24);
  if (*(_QWORD *)(result + 80) == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(result + 72));
    objc_msgSend(WeakRetained, "modifyAssetUpdateStatusForAssertion:status:", v1[5], *(_QWORD *)(*(_QWORD *)(v1[8] + 8) + 24));

    v2 = *(uint64_t (**)(void))(v1[6] + 16);
    return v2();
  }
  return result;
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 134218242;
    v9 = a2;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Catalog based asset update status: (%ld) for query: (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 134218242;
    v9 = a2;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset update status: (%ld) for query: (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateCatalogBasedAssetForAssertion:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DDSManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[DDSManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id obj;
  void *v14;
  _QWORD v15[6];
  id v16;
  id v17;
  __int128 *p_buf;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  char v25;
  uint8_t v26[128];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  objc_msgSend(a1[4], "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatableAssetsForAssertion:", *v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__5;
    v30 = __Block_byref_object_dispose__5;
    v31 = (id)objc_msgSend(v4, "mutableCopy");
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v5 = objc_alloc_init(MEMORY[0x1E0D4E088]);
    objc_msgSend(v5, "setAllowsCellularAccess:", 1);
    objc_msgSend(v5, "setAllowsExpensiveAccess:", 1);
    objc_msgSend(v5, "setDiscretionary:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          v9 = v4;
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
          objc_msgSend(a1[5], "provider");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205;
          v15[3] = &unk_1EA141E60;
          v15[4] = a1[5];
          v15[5] = v10;
          p_buf = &buf;
          v16 = v14;
          v19 = v24;
          v17 = a1[6];
          objc_msgSend(v11, "startDownloadForAsset:withOptions:progress:handler:", v10, v5, 0, v15);

          v4 = v9;
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v6);
    }

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    DefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1DA990000, v12, OS_LOG_TYPE_DEFAULT, "Assets are already updated for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205(uint64_t a1, unint64_t a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id location;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = objc_initWeak(&location, v4);

  if (v4)
  {
    if (a2 <= 0x24 && ((1 << a2) & 0x1000000401) != 0)
    {
      DefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v19 = v7;
        v20 = 2048;
        v21 = a2;
        _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Asset download completed for %{public}@, result: %ld", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      DefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205_cold_2();

      DefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205_cold_1();

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v15 = *(_QWORD *)(a1 + 56);
        DDSAssetDownloadUIError((void *)2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, MEMORY[0x1E0C9AAA0], v16);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      }
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      DefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v19 = v9;
        _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "Asset update completed successfully for query: (%{public}@)", buf, 0xCu);
      }

      v10 = objc_loadWeakRetained(&location);
      objc_msgSend(v10, "assetObserver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "assetType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "notifyObserversAssetsUpdatedForType:", v12);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  objc_destroyWeak(&location);
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[DDSManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 *p_buf;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertionForQuery:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "tracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "updateStatusForAssertion:", v3);

    if (v5 == 2)
    {
      DefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Asset update is already in progress for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
      }

      v8 = *(_QWORD *)(a1 + 48);
      DDSAssetDownloadUIError((void *)3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, MEMORY[0x1E0C9AAA0], v9);

    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v33 = 0x2020000000;
      v34 = 0;
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v31 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_206;
      v25[3] = &unk_1EA141EB0;
      v25[4] = *(_QWORD *)(a1 + 32);
      p_buf = &buf;
      v14 = v3;
      v26 = v14;
      v27 = *(id *)(a1 + 48);
      v29 = v30;
      v15 = (void *)MEMORY[0x1DF0A321C](v25);
      v16 = *(void **)(a1 + 32);
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_3;
      v23[3] = &unk_1EA141368;
      v17 = v15;
      v24 = v17;
      objc_msgSend(v16, "updateCatalogBasedAssetForAssertion:callback:", v14, v23);
      objc_msgSend(*(id *)(a1 + 32), "autoAssetQueryForAssertion:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "autoAssetManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v13;
        v21[1] = 3221225472;
        v21[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_4;
        v21[3] = &unk_1EA141368;
        v22 = v17;
        objc_msgSend(v19, "updateAssetForQuery:callback:", v18, v21);

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD))v17 + 2))(v17, MEMORY[0x1E0C9AAB0], 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "tracker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "modifyUpdateStatusForAssertion:toStatus:", v14, 2);

      _Block_object_dispose(v30, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 48);
    DDSAssetDownloadUIError(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, MEMORY[0x1E0C9AAA0], v12);

  }
}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = objc_initWeak(&location, v7);

  if (v7)
  {
    v9 = objc_loadWeakRetained(&location);
    objc_msgSend(v9, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_2;
    block[3] = &unk_1EA141E88;
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = v11;
    v19 = v12;
    objc_copyWeak(&v21, &location);
    v17 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    v18 = v13;
    v20 = v14;
    dispatch_async(v10, block);

    objc_destroyWeak(&v21);
  }
  objc_destroyWeak(&location);

}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(WeakRetained, "tracker");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modifyUpdateStatusForAssertion:toStatus:", *(_QWORD *)(a1 + 40), 0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v4, "tracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modifyUpdateStatusForAssertion:toStatus:", *(_QWORD *)(a1 + 40), 1);

    v6 = *(_QWORD *)(a1 + 48);
    DDSAssetDownloadUIError((void *)2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, MEMORY[0x1E0C9AAA0], v7);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __43__DDSManager_updateAssetForQuery_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__DDSManager_updateAssetForQuery_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (DDSManagingDelegate)delegate
{
  return (DDSManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DDSAssetTracking)tracker
{
  return self->_tracker;
}

- (DDSAssetProviding)provider
{
  return self->_provider;
}

- (DDSAssetObserving)assetObserver
{
  return self->_assetObserver;
}

- (NSMutableDictionary)remoteSyncStateByAssetType
{
  return self->_remoteSyncStateByAssetType;
}

- (NSMutableDictionary)pendingAssertionsToUpdateByAssetType
{
  return self->_pendingAssertionsToUpdateByAssetType;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (DDSManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (DDSMAAutoAssetManager)autoAssetManager
{
  return self->_autoAssetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pendingAssertionsToUpdateByAssetType, 0);
  objc_storeStrong((id *)&self->_remoteSyncStateByAssetType, 0);
  objc_storeStrong((id *)&self->_assetObserver, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)beginUpdateCycleForAssetType:forced:discretionaryDownload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Unexpected error occured as remote sync state object not found for asset type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1DA990000, a1, a3, "Update abandoned (due to unexpected welf=nil during update)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)assertionIDsForClientID:reply:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1DA990000, v1, (uint64_t)v1, "For clientID (%{public}@), found assertion IDs (%{public}@)", v2);
  OUTLINED_FUNCTION_4();
}

void __42__DDSManager_updateAutoAssetForAssetType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1DA990000, v0, v1, "Auto asset update for query: %{public}@ completed with error: %{public}@");
  OUTLINED_FUNCTION_4();
}

- (void)assetUpdateStatusForAssertion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assertionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2048;
  v9 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1DA990000, a3, v6, "Assertion: (%{public}@), DDSAssetUpdateStatus: (%ld)", v7);

}

void __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1DA990000, a1, a3, "Update catalog request failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Assertion not found for query: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Asset update failed for query: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_205_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_1DA990000, v0, v1, "Unexpected error downloading asset %{public}@, result: %ld");
  OUTLINED_FUNCTION_4();
}

@end
