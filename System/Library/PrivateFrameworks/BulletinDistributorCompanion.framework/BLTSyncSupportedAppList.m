@implementation BLTSyncSupportedAppList

- (BLTSyncSupportedAppList)init
{
  BLTSyncSupportedAppList *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *appListQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *installed;
  NSMutableSet *v8;
  NSMutableSet *removed;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSMutableSet *appListStore;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  Boolean keyExistsAndHasValidFormat;
  objc_super v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)BLTSyncSupportedAppList;
  v2 = -[BLTSyncSupportedAppList init](&v53, sel_init);
  if (!v2)
    return v2;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.private.bulletindistributor.siriActionAppListQueue", v3);
  appListQueue = v2->_appListQueue;
  v2->_appListQueue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  installed = v2->_installed;
  v2->_installed = v6;

  v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  removed = v2->_removed;
  v2->_removed = v8;

  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(CFSTR("BLTSiriActionAppListVersion"), CFSTR("com.apple.bulletindistributor"), &keyExistsAndHasValidFormat);
  -[BLTSyncSupportedAppList _syncSupportedAppListStoreURL](v2, "_syncSupportedAppListStoreURL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0x24BDBC000uLL;
  v43 = (void *)v10;
  if (keyExistsAndHasValidFormat)
  {
    v13 = (void *)MEMORY[0x24BDBCEF0];
    v50 = 0;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:error:", v10, &v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v50;
    objc_msgSend(v13, "setWithArray:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    appListStore = v2->_appListStore;
    v2->_appListStore = (NSMutableSet *)v16;

    if (v15)
    {
      blt_general_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[BLTSyncSupportedAppList init].cold.2((uint64_t)v11, (uint64_t)v15, v18);

    }
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v23 = objc_msgSend(v22, "removeItemAtURL:error:", v11, &v51);
        v24 = v51;

        if (!v23)
        {
          blt_general_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[BLTSyncSupportedAppList init].cold.1((uint64_t)v24, v41, v42);

          goto LABEL_13;
        }

      }
    }
    CFPreferencesSetAppValue(CFSTR("BLTSiriActionAppListVersion"), &unk_24D786698, CFSTR("com.apple.bulletindistributor"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:", v2);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v32 = (void *)MEMORY[0x219A0BFAC]();
        objc_msgSend(v31, "bundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v33);

        v54 = v31;
        objc_msgSend(*(id *)(v12 + 3632), "arrayWithObjects:count:", &v54, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        -[BLTSyncSupportedAppList supportedBundleIDsFromRecords:nonSyncSupportedBundleIDs:](v2, "supportedBundleIDsFromRecords:nonSyncSupportedBundleIDs:", v34, &v45);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v12;
        v37 = v45;

        -[BLTSyncSupportedAppList _handleAppListInstalled:removed:](v2, "_handleAppListInstalled:removed:", v35, v37);
        v12 = v36;

        objc_autoreleasePoolPop(v32);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v28);
  }

  v38 = (void *)-[NSMutableSet mutableCopy](v2->_appListStore, "mutableCopy");
  objc_msgSend(v38, "minusSet:", v26);
  if (objc_msgSend(v38, "count"))
  {
    objc_msgSend(v38, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSyncSupportedAppList _handleAppListInstalled:removed:](v2, "_handleAppListInstalled:removed:", 0, v39);

  }
  return v2;
}

- (id)supportedBundleIDsFromRecords:(id)a3 nonSyncSupportedBundleIDs:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDD9BE0], "appInfoWithApplicationRecord:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "supportedActions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {

LABEL_9:
          objc_msgSend(v11, "localizedName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v4;
          }
          objc_msgSend(v11, "bundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);

          if (!v16)
LABEL_13:

          goto LABEL_14;
        }
        objc_msgSend(v12, "supportedActionsByExtensions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
          goto LABEL_9;
        if (objc_msgSend(v11, "supportsLiveActivities"))
        {
          objc_msgSend(v11, "localizedName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (uint64_t)v16;
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v19 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v19;
          }
          objc_msgSend(v11, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v20);

          if (!v16)
          goto LABEL_13;
        }
        if (a4)
        {
          v21 = *a4;
          if (!*a4)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v21 = (id)objc_claimAutoreleasedReturnValue();
            *a4 = v21;
          }
          objc_msgSend(v11, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v16);
          goto LABEL_13;
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v8 = v22;
    }
    while (v22);
  }

  return v6;
}

- (id)_syncSupportedAppListStoreURL
{
  NSURL *syncSupportedAppListStoreURL;
  NSURL *v4;
  NSURL *v5;

  syncSupportedAppListStoreURL = self->_syncSupportedAppListStoreURL;
  if (!syncSupportedAppListStoreURL)
  {
    BLTFileURLInPairingPath(CFSTR("siriActionAppListStore.plist"));
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_syncSupportedAppListStoreURL;
    self->_syncSupportedAppListStoreURL = v4;

    syncSupportedAppListStoreURL = self->_syncSupportedAppListStoreURL;
  }
  return syncSupportedAppListStoreURL;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BLTSyncSupportedAppList;
  -[BLTSyncSupportedAppList dealloc](&v4, sel_dealloc);
}

- (NSDictionary)installed
{
  NSObject *appListQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  appListQueue = self->_appListQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__BLTSyncSupportedAppList_installed__block_invoke;
  v5[3] = &unk_24D761CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appListQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __36__BLTSyncSupportedAppList_installed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)removed
{
  NSObject *appListQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  appListQueue = self->_appListQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__BLTSyncSupportedAppList_removed__block_invoke;
  v5[3] = &unk_24D761CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appListQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __34__BLTSyncSupportedAppList_removed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_handleAppListInstalled:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *appListQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  BLTSyncSupportedAppList *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  appListQueue = self->_appListQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke;
  v12[3] = &unk_24D762750;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(appListQueue, v12);
  LOBYTE(appListQueue) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)appListQueue;
}

void __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v3, "minusSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    if (objc_msgSend(v3, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v5 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke_2;
      v15[3] = &unk_24D762728;
      v6 = v3;
      v7 = *(_QWORD *)(a1 + 40);
      v16 = v6;
      v17 = v7;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);

    }
    objc_msgSend(v4, "intersectSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    if (objc_msgSend(v4, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "minusSet:", v4);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 48));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v14, "intersectSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    if (objc_msgSend(v14, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "unionSet:", v14);
    }
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intersectSet:", v11);

    if (objc_msgSend(v8, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v12 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      objc_msgSend(v8, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsForKeys:", v13);

    }
  }
}

void __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v5, v6);

}

- (void)applicationsDidInstall:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = 0;
  BLTSyncSupportedBundleIDsFromProxies(a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (-[BLTSyncSupportedAppList _handleAppListInstalled:removed:](self, "_handleAppListInstalled:removed:", v4, v5))
  {
    -[BLTSyncSupportedAppList delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncSupportedAppListUpdated:", self);

  }
}

- (void)applicationsDidUninstall:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  BLTSyncSupportedBundleIDsFromProxies(a3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLTSyncSupportedAppList _handleAppListInstalled:removed:](self, "_handleAppListInstalled:removed:", 0, v4);

  if (v5)
  {
    -[BLTSyncSupportedAppList delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncSupportedAppListUpdated:", self);

  }
}

- (void)applicationIconDidChange:(id)a3
{
  NSObject *appListQueue;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;

  BLTSyncSupportedBundleIDsFromProxies(a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    appListQueue = self->_appListQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__BLTSyncSupportedAppList_applicationIconDidChange___block_invoke;
    block[3] = &unk_24D761AA8;
    block[4] = self;
    v8 = v6;
    dispatch_sync(appListQueue, block);
    -[BLTSyncSupportedAppList delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncSupportedAppListUpdated:", self);

  }
}

uint64_t __52__BLTSyncSupportedAppList_applicationIconDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)updateStoreWithInstalled:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *appListQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  appListQueue = self->_appListQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke;
  block[3] = &unk_24D761D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(appListQueue, block);

}

void __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;
  int v12;
  __CFString *v13;
  char v14;
  NSObject *v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  __CFString *v19;
  id v20;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "minusSet:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unionSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "minusSet:", *(_QWORD *)(a1 + 48));
  v4 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_syncSupportedAppListStoreURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v9 = objc_msgSend(v8, "writeToURL:options:error:", v7, 0, &v20);
    v10 = (__CFString *)v20;

    if (v9)
    {
      v11 = *MEMORY[0x24BDBCC68];
      v19 = v10;
      v12 = objc_msgSend(v7, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v11, &v19);
      v13 = v19;

      if (v12)
      {
        v18 = v13;
        v14 = objc_msgSend(v6, "writeToURL:options:error:", v7, 0x10000000, &v18);
        v10 = v18;

        if ((v14 & 1) != 0)
        {
          blt_general_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v17 = 0;
            _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Sync supported app list written.", (uint8_t *)&v17, 2u);
          }
          goto LABEL_11;
        }
      }
      else
      {
        v10 = v13;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeItemAtURL:error:", v7, 0);

  blt_general_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke_cold_1(v10, v7 == 0, v15);
LABEL_11:

}

- (BLTSyncSupportedAppListDelegate)delegate
{
  return (BLTSyncSupportedAppListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appListStore, 0);
  objc_storeStrong((id *)&self->_syncSupportedAppListStoreURL, 0);
  objc_storeStrong((id *)&self->_appListQueue, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_installed, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Error reading %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

void __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke_cold_1(const __CFString *a1, char a2, NSObject *a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Unknown error");
  if ((a2 & 1) != 0)
    v3 = CFSTR("file URL is empty. Are the devices paired?");
  if (a1)
    v3 = a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_2173D9000, a3, (uint64_t)a3, "Error storing sync supported app list. %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

@end
