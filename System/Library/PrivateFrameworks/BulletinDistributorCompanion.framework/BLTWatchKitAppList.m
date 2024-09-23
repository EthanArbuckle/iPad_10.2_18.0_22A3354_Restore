@implementation BLTWatchKitAppList

- (BLTWatchKitAppList)init
{
  BLTWatchKitAppList *v2;
  uint64_t v3;
  NSMutableArray *loadingCompletionHandlers;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLTWatchKitAppList;
  v2 = -[BLTWatchKitAppList init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    loadingCompletionHandlers = v2->_loadingCompletionHandlers;
    v2->_loadingCompletionHandlers = (NSMutableArray *)v3;

    pthread_mutex_init(&v2->_lock, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)ApplicationsChanged, (CFStringRef)*MEMORY[0x24BDFA1C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BDFA1C8], 0);
  pthread_mutex_destroy(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)BLTWatchKitAppList;
  -[BLTWatchKitAppList dealloc](&v4, sel_dealloc);
}

- (id)watchKitAppDefinitionWithBundleID:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    pthread_mutex_lock(p_lock);
    -[NSDictionary objectForKeyedSubscript:](self->_appsByAppBundleID, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_mutex_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_fetchWatchKitInfoWithForce:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *loadingCompletionHandlers;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSDictionary *appsByAppBundleID;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  BLTWatchKitAppList *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTWatchKitAppList _fetchWatchKitInfoWithForce:completion:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    pthread_mutex_lock(&self->_lock);
    if (v6)
    {
      loadingCompletionHandlers = self->_loadingCompletionHandlers;
      v9 = (void *)objc_msgSend(v6, "copy");
      -[NSMutableArray addObject:](loadingCompletionHandlers, "addObject:", v9);

    }
    if (self->_loading)
    {
      pthread_mutex_unlock(&self->_lock);
      goto LABEL_10;
    }
    self->_loading = 1;
    pthread_mutex_unlock(&self->_lock);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  blt_general_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v41 = v11;
    v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_DEFAULT, "Fetching apps for paired device %p id: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&self->_lock);
  appsByAppBundleID = self->_appsByAppBundleID;
  v16 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke;
  v38[3] = &unk_24D762138;
  v17 = v14;
  v39 = v17;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](appsByAppBundleID, "enumerateKeysAndObjectsUsingBlock:", v38);
  pthread_mutex_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2;
  v30[3] = &unk_24D762188;
  v19 = v10;
  v31 = v19;
  v32 = self;
  v37 = a3;
  v36 = v6;
  v20 = v18;
  v33 = v20;
  v34 = v17;
  v35 = v7;
  v21 = v17;
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_35;
  v26[3] = &unk_24D7621B0;
  v28 = v20;
  v29 = (id)MEMORY[0x219A0C15C](v30);
  v27 = v19;
  v22 = v20;
  v23 = v19;
  v24 = v29;
  objc_msgSend(v25, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:", v11, 0, v26);

LABEL_10:
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isInstalled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Fetched watchkit apps count: %lu", buf, 0xCu);

  }
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), *(id *)(a1 + 32));
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(*(id *)(a1 + 40), "setLoaded:", 1);
  if (*(_BYTE *)(a1 + 80))
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 16));
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "copy");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v6;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 88) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 16));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i) + 16))();
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  v14 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  objc_msgSend(v14, "minusSet:", *(_QWORD *)(a1 + 56));
  v15 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  objc_msgSend(v15, "minusSet:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v15, "count") || objc_msgSend(v14, "count"))
  {
    BLTWorkQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_33;
    v17[3] = &unk_24D762160;
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v15;
    v20 = *(id *)(a1 + 64);
    dispatch_async(v16, v17);

  }
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "watchKitAppList:added:removed:", v2, v3, v4);

}

uint64_t __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BLTWatchKitAppDefinition *v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    blt_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_35_cold_1((uint64_t)v6, v7);

  }
  if (v5)
  {
    if (objc_msgSend(v5, "applicationType") == 2)
    {
      objc_msgSend(v5, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "counterpartIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "deviceStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "installStatus");

      v13 = -[BLTWatchKitAppDefinition initWithContainerBundleID:watchKitAppBundleID:isInstalled:runsIndependently:]([BLTWatchKitAppDefinition alloc], "initWithContainerBundleID:watchKitAppBundleID:isInstalled:runsIndependently:", v10, v8, v12 == 2, objc_msgSend(v5, "applicationMode") == 2);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v10);
      if (-[BLTWatchKitAppDefinition isInstalled](v13, "isInstalled"))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  return 1;
}

- (void)fetchWatchKitInfoWithCompletion:(id)a3
{
  -[BLTWatchKitAppList _fetchWatchKitInfoWithForce:completion:](self, "_fetchWatchKitInfoWithForce:completion:", 0, a3);
}

- (void)_fetchWatchKitInfo
{
  -[BLTWatchKitAppList _fetchWatchKitInfoWithForce:completion:](self, "_fetchWatchKitInfoWithForce:completion:", 1, 0);
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BLTWatchKitAppListDelegate)delegate
{
  return (BLTWatchKitAppListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_appsByAppBundleID, 0);
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_35_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Error enumerating WatchKit apps: %@", (uint8_t *)&v2, 0xCu);
}

@end
