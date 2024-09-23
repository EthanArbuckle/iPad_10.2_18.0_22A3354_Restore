@implementation SUUIItemStateCenter

- (SUUIItemStateCenter)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  SUUIMediaLibraryInterface *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  SUUIStoreItemRelationshipCounsellor *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __CFNotificationCenter *DistributedCenter;
  objc_super v32;
  _QWORD v33[5];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)SUUIItemStateCenter;
  v2 = -[SUUIItemStateCenter init](&v32, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIItemStateCenter.access", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIItemStateCenter.observers", 0);
    v6 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v5;

    v7 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIItemStateCenter.mediaLibrary", 0);
    v8 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v7;

    v9 = *((_QWORD *)v2 + 12);
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v9, v10);

    v11 = objc_alloc_init(SUUIMediaLibraryInterface);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v12;

    objc_msgSend(*((id *)v2 + 13), "addObject:", v11);
    *((_BYTE *)v2 + 16) = -1;
    *((_WORD *)v2 + 20) = -1;
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v14;

    *((_QWORD *)v2 + 17) = -1;
    *((_BYTE *)v2 + 160) = -1;
    v16 = objc_alloc_init(SUUIStoreItemRelationshipCounsellor);
    v17 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v16;

    v18 = objc_alloc_init(MEMORY[0x24BEB1E20]);
    objc_msgSend(MEMORY[0x24BEB1E18], "allStoreDownloadKinds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDownloadKinds:", v19);

    v34[0] = *MEMORY[0x24BEB2270];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrefetchedDownloadExternalProperties:", v20);

    v21 = *MEMORY[0x24BEB2360];
    v33[0] = *MEMORY[0x24BEB2410];
    v33[1] = v21;
    v22 = *MEMORY[0x24BEB2390];
    v33[2] = *MEMORY[0x24BEB2378];
    v33[3] = v22;
    v33[4] = *MEMORY[0x24BEB2398];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrefetchedDownloadProperties:", v23);

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1E18]), "initWithManagerOptions:", v18);
    v25 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v24;

    objc_msgSend(*((id *)v2 + 6), "addObserver:", v2);
    objc_msgSend(v2, "_jobManager");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v26;

    objc_msgSend(MEMORY[0x24BE0FB70], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:", v2);

    objc_msgSend(v2, "_reloadAppUpdatesStore");
    objc_msgSend(v2, "_reloadDownloadManager");
    objc_msgSend(v2, "_reloadJobManager");
    objc_msgSend(v2, "_reloadPurchaseHistory");
    objc_msgSend(v2, "_reloadSoftwareLibrary");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, sel__storefrontDidChangeNotification_, *MEMORY[0x24BEB20F0], 0);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)__SoftwareLibraryChangeNotification, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)__SoftwareLibraryChangeNotification, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorCoalesce);

  }
  return (SUUIItemStateCenter *)v2;
}

- (id)_jobManager
{
  ASDJobManager *jobManager;
  void *v4;
  ASDJobManager *v5;
  ASDJobManager *v6;

  jobManager = self->_jobManager;
  if (!jobManager)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setShouldFilterExternalOriginatedDownloads:", 0);
    objc_msgSend(v4, "setShouldReportDownloadProgress:", 1);
    v5 = (ASDJobManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE04558]), "initWithOptions:", v4);
    v6 = self->_jobManager;
    self->_jobManager = v5;

    -[ASDJobManager addJobObserver:](self->_jobManager, "addJobObserver:", self);
    jobManager = self->_jobManager;
  }
  return jobManager;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *DistributedCenter;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB20F0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE044C8], 0);
  v4 = (void *)SUUIMediaPlayerFramework();
  v5 = *(id *)SUUIWeakLinkedSymbolForString("MPMediaLibraryDidChangeNotification", v4);
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB20F8], 0);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemStateCenter;
  -[SUUIItemStateCenter dealloc](&v8, sel_dealloc);
}

+ (id)defaultCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SUUIItemStateCenter_defaultCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultCenter_sOnce_0 != -1)
    dispatch_once(&defaultCenter_sOnce_0, block);
  return (id)defaultCenter_sCenter_0;
}

void __36__SUUIItemStateCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_sCenter_0;
  defaultCenter_sCenter_0 = (uint64_t)v1;

}

- (void)addMediaLibrary:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUUIItemStateCenter_addMediaLibrary___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __39__SUUIItemStateCenter_addMediaLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUUIItemStateCenter_addObserver___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __35__SUUIItemStateCenter_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)cancelDownloadForItemWithIdentifier:(int64_t)a3
{
  SUUIStoreIdentifier *v5;
  void *v6;
  SUUIStoreIdentifier *v7;
  void *v8;
  ASDJobManager *jobManager;
  uint64_t v10;
  SSDownloadManager *downloadManager;
  NSObject *accessQueue;
  _QWORD v13[5];
  SUUIStoreIdentifier *v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  _QWORD v18[5];
  id v19;
  id v20;
  id v21[2];
  id from;
  id location;

  v5 = [SUUIStoreIdentifier alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIStoreIdentifier initWithNumber:](v5, "initWithNumber:", v6);

  -[NSMutableDictionary objectForKey:](self->_itemStates, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "mediaCategory") == 1)
  {
    objc_initWeak(&location, self->_jobManager);
    objc_initWeak(&from, self);
    jobManager = self->_jobManager;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke;
    v18[3] = &unk_2511FDC30;
    v21[1] = (id)a3;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(v21, &from);
    v18[4] = self;
    v19 = v8;
    -[ASDJobManager getJobsUsingBlock:](jobManager, "getJobsUsingBlock:", v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, self->_downloadManager);
    v10 = MEMORY[0x24BDAC760];
    downloadManager = self->_downloadManager;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_38;
    v15[3] = &unk_2511FDC58;
    v17[1] = (id)a3;
    v16 = v8;
    objc_copyWeak(v17, &location);
    -[SSDownloadManager getDownloadsUsingBlock:](downloadManager, "getDownloadsUsingBlock:", v15);
    objc_destroyWeak(v17);

    objc_destroyWeak(&location);
    accessQueue = self->_accessQueue;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_2_39;
    v13[3] = &unk_2511F46D0;
    v13[4] = self;
    v14 = v7;
    dispatch_async(accessQueue, v13);

  }
}

void __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "storeItemID") == *(_QWORD *)(a1 + 64))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "cancelJobsWithIDs:completionBlock:", v16, &__block_literal_global_67);

          v9 = v3;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v5)
        continue;
      break;
    }
  }

  v9 = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(v10 + 8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[2] = __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3;
  v17[3] = &unk_2511FDC08;
  v17[1] = 3221225472;
  v13 = *(_QWORD *)(a1 + 64);
  v17[4] = v10;
  v20 = v13;
  v18 = v11;
  v19 = v9;
  dispatch_async(v12, v17);

LABEL_11:
}

void __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_9;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 56);
  *(_DWORD *)v12 = 138412546;
  *(_QWORD *)&v12[4] = v6;
  *(_WORD *)&v12[12] = 2048;
  *(_QWORD *)&v12[14] = v7;
  v8 = v6;
  LODWORD(v11) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(_QWORD *)&v12[16]);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_9:

  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(*(id *)(a1 + 40), "setState:", objc_msgSend(*(id *)(a1 + 40), "state") & 0xFFFFFFFFFFFFFFFCLL);
  objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) && objc_msgSend(v10, "count"))
    objc_msgSend(*(id *)(a1 + 48), "_notifyObserversOfStateChanges:", v10);

}

void __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id WeakRetained;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v6 = *MEMORY[0x24BEB2410];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "valueForProperty:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "longLongValue");
        v11 = *(_QWORD *)(a1 + 48);

        if (v10 != v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "downloadIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v8, "persistentIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "containsObject:", v13);

          if (!v14)
            continue;
        }
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        v22 = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "cancelDownloads:completionBlock:", v16, 0);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

void __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_2_39(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "familyForItem:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        SUUILibraryItemForStoreIdentifier(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3_40;
    v12[3] = &unk_2511F46D0;
    v13 = v2;
    v14 = v4;
    dispatch_async(v11, v12);

  }
}

void __59__SUUIItemStateCenter_cancelDownloadForItemWithIdentifier___block_invoke_3_40(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "removeMediaItemsForLibraryItems:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)finishLoadingWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUUIItemStateCenter_finishLoadingWithCompletionBlock___block_invoke;
  v7[3] = &unk_2511F4C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __56__SUUIItemStateCenter_finishLoadingWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = _Block_copy(v7);
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");
}

- (BOOL)isApplicationInstallRestricted
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__SUUIItemStateCenter_isApplicationInstallRestricted__block_invoke;
  v5[3] = &unk_2511FCAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__SUUIItemStateCenter_isApplicationInstallRestricted__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2 == 255)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isOnDeviceAppInstallationAllowed");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = v4 ^ 1;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)isGratisEligible
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SUUIItemStateCenter_isGratisEligible__block_invoke;
  v5[3] = &unk_2511FCAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SUUIItemStateCenter_isGratisEligible__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SUUIItemStateCenter_isGratisEligible__block_invoke_2;
  v4[3] = &unk_2511FDC80;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __39__SUUIItemStateCenter_isGratisEligible__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "state");
  if ((result & 0x10) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isItemRestrictedWithParentalControlsRank:(int64_t)a3
{
  return -[SUUIItemStateCenter isRunningInStoreDemoMode](self, "isRunningInStoreDemoMode")
      || -[SUUIItemStateCenter isApplicationInstallRestricted](self, "isApplicationInstallRestricted")
      || -[SUUIItemStateCenter parentalControlsRank](self, "parentalControlsRank") < a3;
}

- (BOOL)isRunningInStoreDemoMode
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SUUIItemStateCenter_isRunningInStoreDemoMode__block_invoke;
  v5[3] = &unk_2511FCAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SUUIItemStateCenter_isRunningInStoreDemoMode__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 160);
  if (v2 == 255)
  {
    result = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 160) = result;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 32) + 160);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = v2 != 0;
  return result;
}

- (id)metricsActionTypeForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id *v9;

  v4 = a3;
  -[SUUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", objc_msgSend(v4, "itemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");
  if ((v6 & 2) != 0)
  {
    v9 = (id *)MEMORY[0x24BEB28D8];
LABEL_6:
    v8 = *v9;
    goto LABEL_13;
  }
  if ((v6 & 0x24) != 4)
  {
    if ((v6 & 1) != 0)
    {
      v8 = 0;
      goto LABEL_13;
    }
    if ((v6 & 8) != 0)
      v9 = (id *)MEMORY[0x24BEB28E0];
    else
      v9 = (id *)MEMORY[0x24BEB28D0];
    goto LABEL_6;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (id)*MEMORY[0x24BEB28E8];
  else
    v8 = 0;

LABEL_13:
  return v8;
}

- (int64_t)parentalControlsRank
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1000;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SUUIItemStateCenter_parentalControlsRank__block_invoke;
  v5[3] = &unk_2511FCAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__SUUIItemStateCenter_parentalControlsRank__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v2 == -1)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE639D0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = objc_msgSend(v4, "integerValue");
    else
      v5 = 1000;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v5;

    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
}

- (id)performActionForItem:(id)a3 withCompletionBlock:(id)a4
{
  return -[SUUIItemStateCenter performActionForItem:clientContext:completionBlock:](self, "performActionForItem:clientContext:completionBlock:", a3, 0, a4);
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "primaryItemOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemStateCenter performActionForItem:offer:clientContext:completionBlock:](self, "performActionForItem:offer:clientContext:completionBlock:", v10, v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = SUUIItemStateCenterUseAppstoredPurchases(v7);
  objc_msgSend(v7, "primaryItemOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[SUUIItemStateCenter performActionForSoftwareItem:offer:clientContext:completionBlock:](self, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v7, v9, v6, 0);
  else
    -[SUUIItemStateCenter performActionForItem:offer:clientContext:completionBlock:](self, "performActionForItem:offer:clientContext:completionBlock:", v7, v9, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  const void *v18;
  NSObject *observerQueue;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SUUIItemStateCenter metricsActionTypeForItem:](self, "metricsActionTypeForItem:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28D0]) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28E0]))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__SUUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke;
    v22[3] = &unk_2511FDCA8;
    v15 = &v23;
    v23 = v13;
    -[SUUIItemStateCenter purchaseItem:offer:clientContext:completionBlock:](self, "purchaseItem:offer:clientContext:completionBlock:", v10, v11, v12, v22);
    -[SUUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28E8]))
    {
      objc_msgSend(v10, "bundleIdentifier");
      v18 = (const void *)objc_claimAutoreleasedReturnValue();
      SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v18, 0);
      CFRelease(v18);
    }
    else if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28D8]))
    {
      -[SUUIItemStateCenter cancelDownloadForItemWithIdentifier:](self, "cancelDownloadForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
    }
    if (!v13)
    {
      v16 = 0;
      goto LABEL_5;
    }
    observerQueue = self->_observerQueue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__SUUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke_2;
    v20[3] = &unk_2511F7A18;
    v15 = &v21;
    v21 = v13;
    dispatch_async(observerQueue, v20);
    v16 = 0;
  }

LABEL_5:
  return v16;
}

uint64_t __80__SUUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__SUUIItemStateCenter_performActionForItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t *v16;
  void *v17;
  const void *v18;
  NSObject *observerQueue;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SUUIItemStateCenter metricsActionTypeForItem:](self, "metricsActionTypeForItem:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28D0]) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28E0]))
  {
    if (SUUIItemStateCenterUseAppstoredPurchases(v10))
    {
      v24 = MEMORY[0x24BDAC760];
      v15 = __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke;
      v16 = &v24;
    }
    else
    {
      v23 = MEMORY[0x24BDAC760];
      v15 = __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
      v16 = &v23;
    }
    v16[1] = 3221225472;
    v16[2] = (uint64_t)v15;
    v16[3] = (uint64_t)&unk_2511FDCD0;
    v16[4] = (uint64_t)v13;
    -[SUUIItemStateCenter purchaseSoftwareItem:offer:clientContext:completionBlock:](self, "purchaseSoftwareItem:offer:clientContext:completionBlock:", v10, v11, v12, v16);

    -[SUUIItemStateCenter stateForItemWithIdentifier:](self, "stateForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28E8]))
    {
      objc_msgSend(v10, "bundleIdentifier");
      v18 = (const void *)objc_claimAutoreleasedReturnValue();
      SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v18, 0);
      CFRelease(v18);
    }
    else if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEB28D8]))
    {
      -[SUUIItemStateCenter cancelDownloadForItemWithIdentifier:](self, "cancelDownloadForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
    }
    if (v13)
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_3;
      block[3] = &unk_2511F7A18;
      v22 = v13;
      dispatch_async(observerQueue, block);

    }
    v17 = 0;
  }

  return v17;
}

uint64_t __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __88__SUUIItemStateCenter_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)purchaseItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  SUUIItemStateCenter *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke;
  block[3] = &unk_2511FDD20;
  v20 = v10;
  v21 = self;
  v23 = v12;
  v24 = v13;
  v22 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_async(accessQueue, block);

}

void __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "itemKind");
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v2 == 17)
  {
    v6 = (void *)objc_msgSend(v3, "_newPurchasesWithBundleItem:bundleOffer:", v4, v5);
  }
  else
  {
    v7 = (void *)objc_msgSend(v3, "_newPurchaseWithItem:offer:", v4, v5);
    if (v7)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
    else
      v6 = 0;

  }
  if (objc_msgSend(v6, "count"))
  {
    v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_3;
    v13[3] = &unk_2511FDCF8;
    v9 = &v14;
    v10 = *(_QWORD *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v8, "_performPurchases:hasBundlePurchase:withClientContext:completionBlock:", v6, v2 == 17, v10, v13);
LABEL_11:

    goto LABEL_12;
  }
  v11 = *(void **)(a1 + 64);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_2;
    block[3] = &unk_2511F7A18;
    v9 = &v16;
    v16 = v11;
    dispatch_async(v12, block);
    goto LABEL_11;
  }
LABEL_12:

}

uint64_t __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__SUUIItemStateCenter_purchaseItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = v3;
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = v5;
  }

}

- (void)purchaseSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  SUUIItemStateCenter *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke;
  block[3] = &unk_2511FDD20;
  v20 = v10;
  v21 = self;
  v23 = v12;
  v24 = v13;
  v22 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_async(accessQueue, block);

}

void __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "itemKind") == 17)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newPurchasesForSoftwareWithBundleItem:bundleOffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "itemKind") == 12)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "_newSoftwarePurchaseWithItem:offer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4 = (void *)v3;
    if (v3)
    {
      v13[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v5 = *(void **)(a1 + 64);
    if (v5)
    {
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
      block[3] = &unk_2511F7A18;
      v12 = v5;
      dispatch_async(v6, block);

    }
  }
  if (objc_msgSend(v2, "count"))
  {
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_3;
    v9[3] = &unk_2511FDD48;
    v8 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v7, "_performSoftwarePurchases:withClientContext:completionBlock:", v2, v8, v9);

  }
}

uint64_t __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SUUIItemStateCenter_purchaseSoftwareItem_offer_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)purchaseItems:(id)a3 withCompletionBlock:(id)a4
{
  -[SUUIItemStateCenter purchaseItems:withClientContext:completionBlock:](self, "purchaseItems:withClientContext:completionBlock:", a3, 0, a4);
}

- (void)purchaseItems:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SUUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke;
  v15[3] = &unk_2511FDD70;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(accessQueue, v15);

}

void __71__SUUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newPurchasesWithItems:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_performPurchases:hasBundlePurchase:withClientContext:completionBlock:", v2, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = *(void **)(a1 + 56);
    if (v3)
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__SUUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke_2;
      block[3] = &unk_2511F7A18;
      v6 = v3;
      dispatch_async(v4, block);

    }
  }

}

uint64_t __71__SUUIItemStateCenter_purchaseItems_withClientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadFromServer
{
  -[SSDownloadManager reloadFromServer](self->_downloadManager, "reloadFromServer");
}

- (void)reloadGratisEligibilityWithBundleIdentifiers:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke(uint64_t a1)
{
  SUUILoadGratisEligibilityOperation *v2;
  uint64_t v3;
  NSObject *v4;
  SUUILoadGratisEligibilityOperation *v5;
  _QWORD v6[4];
  SUUILoadGratisEligibilityOperation *v7;
  _QWORD v8[5];
  id v9;
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "_gratisStateIsValid") & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v2 = -[SUUILoadGratisEligibilityOperation initWithBundleIdentifiers:clientContext:]([SUUILoadGratisEligibilityOperation alloc], "initWithBundleIdentifiers:clientContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_2;
    v8[3] = &unk_2511FDD98;
    objc_copyWeak(&v9, &location);
    v8[4] = *(_QWORD *)(a1 + 32);
    -[SUUILoadGratisEligibilityOperation setOutputBlock:](v2, "setOutputBlock:", v8);
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_3;
    v6[3] = &unk_2511F47C0;
    v7 = v2;
    v5 = v2;
    dispatch_async(v4, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setGratisIdentifiers:error:", v9, v6);
  if (v6)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v10);
  if (!v6)

}

uint64_t __82__SUUIItemStateCenter_reloadGratisEligibilityWithBundleIdentifiers_clientContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "main");
}

- (void)reloadMediaLibrary:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUUIItemStateCenter_reloadMediaLibrary___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __42__SUUIItemStateCenter_reloadMediaLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_reloadStateForObservedMediaLibraryItems");
  return result;
}

- (void)removeMediaLibrary:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUUIItemStateCenter_removeMediaLibrary___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __42__SUUIItemStateCenter_removeMediaLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUUIItemStateCenter_removeObserver___block_invoke;
  block[3] = &unk_2511F46D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __38__SUUIItemStateCenter_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)stateForItemWithIdentifier:(int64_t)a3
{
  NSObject *accessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__103;
  v11 = __Block_byref_object_dispose__103;
  v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUUIItemStateCenter_stateForItemWithIdentifier___block_invoke;
  block[3] = &unk_2511F4748;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__SUUIItemStateCenter_stateForItemWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  SUUIStoreIdentifier *v6;

  v6 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)stateForItemWithStoreIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__103;
  v16 = __Block_byref_object_dispose__103;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUUIItemStateCenter_stateForItemWithStoreIdentifier___block_invoke;
  block[3] = &unk_2511F4770;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SUUIItemStateCenter_stateForItemWithStoreIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addDownloads:(id)a3
{
  -[SSDownloadManager addDownloads:completionBlock:](self->_downloadManager, "addDownloads:completionBlock:", a3, 0);
}

- (void)addManifestDownloadWithURL:(id)a3 placeholderMetadata:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  SUUIStoreIdentifier *v12;
  uint64_t v13;
  NSObject *accessQueue;
  SUUIStoreIdentifier *v15;
  id v16;
  SUUIStoreIdentifier *v17;
  _QWORD v18[5];
  SUUIStoreIdentifier *v19;
  _QWORD block[5];
  SUUIStoreIdentifier *v21;
  id v22;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BEB1E28];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithURLRequest:", v10);
  objc_msgSend(v11, "setManifestFormat:", 1);
  v12 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  v13 = MEMORY[0x24BDAC760];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v15 = v12;
  v21 = v15;
  v22 = v6;
  v16 = v6;
  dispatch_async(accessQueue, block);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_2;
  v18[3] = &unk_2511FDDC0;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v11, "startWithManifestResponseBlock:", v18);

}

void __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_addState:forItemIdentifier:", 1, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(*(id *)(a1 + 48), "isSample"))
      objc_msgSend(v3, "setDownloadContentFlags:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChange:", v3);
    v2 = v3;
  }

}

void __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_3;
  block[3] = &unk_2511F4798;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

void __70__SUUIItemStateCenter_addManifestDownloadWithURL_placeholderMetadata___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_removeState:forItemIdentifier:", 1, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(*(id *)(a1 + 48), "validDownloads");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_addState:forItemIdentifier:", 2, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v6, "setDownloadContentFlags:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChange:", v6);

    v2 = v6;
  }

}

- (ASDSoftwareUpdatesStore)appstoredUpdatesStore
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__103;
  v10 = __Block_byref_object_dispose__103;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SUUIItemStateCenter_appstoredUpdatesStore__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDSoftwareUpdatesStore *)v3;
}

void __44__SUUIItemStateCenter_appstoredUpdatesStore__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_appstoredUpdatesStore");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SSSoftwareUpdatesStore)appUpdatesStore
{
  return 0;
}

- (void)beginObservingLibraryItems:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SUUIItemStateCenter_beginObservingLibraryItems___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __50__SUUIItemStateCenter_beginObservingLibraryItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 112))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "countForObject:", v9, (_QWORD)v14))
            objc_msgSend(v3, "addObject:", v9);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "_reloadMediaLibraryStateForItems:", v3);
  }
  else
  {
    v10 = *(NSObject **)(v2 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__SUUIItemStateCenter_beginObservingLibraryItems___block_invoke_2;
    block[3] = &unk_2511F47C0;
    block[4] = v2;
    dispatch_async(v10, block);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithSet:", *(_QWORD *)(a1 + 40));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 112);
    *(_QWORD *)(v12 + 112) = v11;

    objc_msgSend(*(id *)(a1 + 32), "_reloadMediaLibraryStateForItems:", *(_QWORD *)(a1 + 40));
  }
}

void __50__SUUIItemStateCenter_beginObservingLibraryItems___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = SUUIMediaPlayerFramework();
  v3 = SUUIWeakLinkedClassForString(CFSTR("MPMediaLibrary"), v2);
  objc_msgSend(v3, "defaultMediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginGeneratingLibraryChangeNotifications");

  v5 = (void *)SUUIMediaPlayerFramework();
  v6 = (id *)SUUIWeakLinkedSymbolForString("MPMediaLibraryDidChangeNotification", v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *v6;
  objc_msgSend(v3, "defaultMediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__mediaLibraryDidChangeNotification_, v8, v9);

}

- (void)evaluatePurchaseResponseForRentals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SUUIStoreIdentifier *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    v23 = v4;
    objc_msgSend(v4, "purchase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buyParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copyDictionaryForQueryString:unescapedValues:", v7, 1);

    objc_msgSend(v23, "purchase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !objc_msgSend(v10, "unsignedLongLongValue"))
    {
      objc_msgSend(v8, "valueForKey:", CFSTR("salableAdamId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "longLongValue"));
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }

    }
    v13 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v10);
    objc_msgSend(v23, "purchase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForDownloadProperty:", *MEMORY[0x24BEB2390]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v8, "valueForKey:", CFSTR("rental"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v23, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v23, "cancelsPurchaseBatch") & 1) != 0)
    {

    }
    else if (v16 | v18)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SUUIItemStateCenter _setStateFlag:forItemsWithIdentifiers:sendNotification:](self, "_setStateFlag:forItemsWithIdentifiers:sendNotification:", 2048, v20, 1);
LABEL_12:

      v4 = v23;
      goto LABEL_13;
    }
    -[SUUIItemStateCenter stateForItemWithStoreIdentifier:](self, "stateForItemWithStoreIdentifier:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "state") & 0x800) != 0)
      v21 = -[SUUIItemStateCenter _removeState:forItemIdentifier:](self, "_removeState:forItemIdentifier:", 2048, v13);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)endObservingLibraryItems:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUUIItemStateCenter_endObservingLibraryItems___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __48__SUUIItemStateCenter_endObservingLibraryItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  SUUIStoreIdentifier *v9;
  void *v10;
  SUUIStoreIdentifier *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "countForObject:", v7, (_QWORD)v13);
        if (v8 == 1)
        {
          v9 = [SUUIStoreIdentifier alloc];
          objc_msgSend(v7, "storeItemIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SUUIStoreIdentifier initWithNumber:](v9, "initWithNumber:", v10);

          v12 = (id)objc_msgSend(*(id *)(a1 + 40), "_removeState:forItemIdentifier:", 64, v11);
        }
        else if (v8 < 1)
        {
          continue;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)getSoftwareUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUUIItemStateCenter appstoredUpdatesStore](self, "appstoredUpdatesStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SUUIItemStateCenter_getSoftwareUpdatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_2511FDDE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getUpdatesWithCompletionBlock:", v7);

}

void __61__SUUIItemStateCenter_getSoftwareUpdatesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_setAvailableAppstoredUpdatesWithUpdates:decrementLoadCount:", v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)performActionForLibraryItem:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUUIItemStateCenter_performActionForLibraryItem___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __51__SUUIItemStateCenter_performActionForLibraryItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUUIItemStateCenter_performActionForLibraryItem___block_invoke_2;
  block[3] = &unk_2511F4798;
  v9 = v2;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v2;
  dispatch_async(v4, block);

}

void __51__SUUIItemStateCenter_performActionForLibraryItem___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "stateForLibraryItem:", *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "availability"))
        {
          objc_msgSend(v7, "performActionForLibraryItem:", *(_QWORD *)(a1 + 40));
LABEL_20:

          goto LABEL_21;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v4)
        continue;
      break;
    }
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 48) + 104);
  v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(a1 + 40), "storeItemIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("ibooks://assetid/%@"), v14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "openURL:options:completionHandler:", v15, MEMORY[0x24BDBD1B8], 0);

          goto LABEL_20;
        }
      }
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_21:

}

- (void)reloadSoftwareUpdatesFromServerWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUUIItemStateCenter appstoredUpdatesStore](self, "appstoredUpdatesStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SUUIItemStateCenter_reloadSoftwareUpdatesFromServerWithCompletionBlock___block_invoke;
  v7[3] = &unk_2511FDE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "reloadFromServerWithCompletionBlock:", v7);

}

void __74__SUUIItemStateCenter_reloadSoftwareUpdatesFromServerWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "_setAvailableAppstoredUpdatesWithUpdates:decrementLoadCount:", v6, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)findLibraryItemsForContentIdentifiers:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SUUIItemStateCenter *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke;
  v15[3] = &unk_2511FDD70;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(accessQueue, v15);

}

void __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  SUUISoftwareLibraryInterface *v13;
  SUUISoftwareLibraryInterface *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("kinds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v2);
  else
    v3 = 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 40) + 104);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "exposedPlatformItemKinds");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (!v3 || !v11 || objc_msgSend(v3, "intersectsSet:", v11))
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  v13 = objc_alloc_init(SUUISoftwareLibraryInterface);
  v14 = v13;
  if (!v3
    || (-[SUUISoftwareLibraryInterface exposedPlatformItemKinds](v13, "exposedPlatformItemKinds"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v3, "intersectsSet:", v15),
        v15,
        v16))
  {
    objc_msgSend(v4, "addObject:", v14);
  }
  v17 = *(void **)(a1 + 48);
  v18 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_2;
  block[3] = &unk_2511FDE60;
  v23 = v17;
  v24 = v4;
  v19 = *(_QWORD *)(a1 + 40);
  v25 = v3;
  v26 = v19;
  v27 = *(id *)(a1 + 56);
  v20 = v3;
  v21 = v4;
  dispatch_async(v18, block);

}

void __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  SUUILibraryItem *v8;
  id v9;
  void *v10;
  SUUIStoreIdentifier *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id obj;
  id v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v8 = objc_alloc_init(SUUILibraryItem);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v7;
        else
          v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v7, "longLongValue"));
        v10 = v9;
        v11 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v9);
        -[SUUILibraryItem setStoreIdentifier:](v8, "setStoreIdentifier:", v11);

        objc_msgSend(v2, "addObject:", v8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v4);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  v14 = MEMORY[0x24BDAC760];
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v19 = (void *)MEMORY[0x2426A2860]();
        v29[0] = v14;
        v29[1] = 3221225472;
        v29[2] = __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_3;
        v29[3] = &unk_2511FDE38;
        v30 = *(id *)(v25 + 48);
        v31 = v24;
        objc_msgSend(v18, "enumerateStatesForLibraryItems:usingBlock:", v2, v29);

        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v15);
  }

  v20 = *(void **)(v25 + 64);
  v21 = *(NSObject **)(*(_QWORD *)(v25 + 56) + 120);
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_4;
  block[3] = &unk_2511F4930;
  v27 = v24;
  v28 = v20;
  v22 = v24;
  dispatch_async(v21, block);

}

void __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "availability") == 2)
  {
    objc_msgSend(v5, "storePlatformKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (v7 = *(void **)(a1 + 32)) == 0 || objc_msgSend(v7, "containsObject:", v6))
    {
      v8 = (void *)objc_msgSend(v5, "newJavaScriptRepresentation");
      objc_msgSend(v11, "storeItemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKey:", v10, 0x251203528);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v10);

    }
  }

}

uint64_t __85__SUUIItemStateCenter_findLibraryItemsForContentIdentifiers_options_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)gratisEligibleItemIdentifiers
{
  NSObject *accessQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__103;
  v11 = __Block_byref_object_dispose__103;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SUUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke;
  v6[3] = &unk_2511FCAF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __52__SUUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SUUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke_2;
  v4[3] = &unk_2511FDC80;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __52__SUUIItemStateCenter_gratisEligibleItemIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "state") & 0x10) != 0)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v6, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)purchaseTone:(id)a3 withProperties:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke;
  block[3] = &unk_2511FDE88;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(accessQueue, block);

}

void __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "primaryItemOffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "_newPurchaseWithItem:offer:", v3, v4);

  if (v5)
  {
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_msgSend(v6, "assigneeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAssigneeIdentifier:", v7);

      objc_msgSend(*(id *)(a1 + 48), "assigneeContactIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAssigneeContactIdentifier:", v8);

      objc_msgSend(*(id *)(a1 + 48), "assigneeToneStyle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAssigneeToneStyle:", v9);

      objc_msgSend(v5, "setShouldMakeDefaultRingtone:", objc_msgSend(*(id *)(a1 + 48), "shouldMakeDefaultRingtone"));
      objc_msgSend(v5, "setShouldMakeDefaultTextTone:", objc_msgSend(*(id *)(a1 + 48), "shouldMakeDefaultTextTone"));
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v5, 0);
    v11 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_3;
    v15[3] = &unk_2511FDCF8;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v11, "_performPurchases:hasBundlePurchase:withClientContext:completionBlock:", v10, 0, v12, v15);

    goto LABEL_7;
  }
  v13 = *(void **)(a1 + 64);
  if (v13)
  {
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_2;
    block[3] = &unk_2511F7A18;
    v18 = v13;
    dispatch_async(v14, block);
    v10 = v18;
LABEL_7:

  }
}

uint64_t __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__SUUIItemStateCenter_purchaseTone_withProperties_clientContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = v3;
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = v5;
  }

}

- (void)addRelationshipForParentAdamId:(id)a3 withChildAdamIds:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SUUIItemStateCenter *v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SUUIItemStateCenter_addRelationshipForParentAdamId_withChildAdamIds___block_invoke;
  block[3] = &unk_2511F4798;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __71__SUUIItemStateCenter_addRelationshipForParentAdamId_withChildAdamIds___block_invoke(uint64_t a1)
{
  SUUIStoreIdentifier *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SUUIStoreIdentifier *v10;
  SUUIStoreIdentifier *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = [SUUIStoreIdentifier alloc];
        v11 = -[SUUIStoreIdentifier initWithNumber:](v10, "initWithNumber:", v9, (_QWORD)v12);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 152), "addChildren:forParent:", v3, v2);
}

- (void)removeRelationshipsForParentAdamId:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SUUIItemStateCenter_removeRelationshipsForParentAdamId___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __58__SUUIItemStateCenter_removeRelationshipsForParentAdamId___block_invoke(uint64_t a1)
{
  SUUIStoreIdentifier *v2;

  v2 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "removeAllRelationshipsForItem:", v2);

}

- (void)jobManager:(id)a3 completedJobs:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIItemStateCenter *v10;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SUUIItemStateCenter_jobManager_completedJobs___block_invoke;
  v8[3] = &unk_2511F46D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

void __48__SUUIItemStateCenter_jobManager_completedJobs___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  SUUIStoreIdentifier *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  NSObject *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  char v52;
  id obj;
  void *v54;
  unint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  SUUIStoreIdentifier *v59;
  SUUIStoreIdentifier *v60;
  SUUIStoreIdentifier *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  unint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v51 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = *(id *)(a1 + 32);
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v64;
    v49 = a1;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v64 != v57)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "storeItemID", v47));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v3, "phase");
        if (!v6)
        {
          v60 = v5;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "shouldLog");
          if (objc_msgSend(v19, "shouldLogToDisk"))
            v20 |= 2u;
          objc_msgSend(v19, "OSLogObject");
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            v20 &= 2u;
          if (v20)
          {
LABEL_27:
            v23 = a1;
            v24 = v4;
            v25 = (void *)objc_opt_class();
            v26 = v25;
            objc_msgSend(v3, "bundleID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138412546;
            v68 = v25;
            v4 = v24;
            v69 = 2112;
            v70 = v27;
            LODWORD(v48) = 22;
            v47 = &v67;
            v28 = (void *)_os_log_send_and_compose_impl();

            if (v28)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, &v67, v48);
              v21 = objc_claimAutoreleasedReturnValue();
              free(v28);
              v47 = (int *)v21;
              SSFileLog();
              goto LABEL_30;
            }
LABEL_31:

            a1 = v23;
            v5 = v60;
            goto LABEL_59;
          }
LABEL_29:
          v23 = a1;
LABEL_30:

          goto LABEL_31;
        }
        v8 = v7;
        v9 = objc_msgSend(v6, "state");
        if ((v9 & 0x23) == 0)
        {
          v60 = v5;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v19, "shouldLog");
          if (objc_msgSend(v19, "shouldLogToDisk"))
            v22 |= 2u;
          objc_msgSend(v19, "OSLogObject");
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            v22 &= 2u;
          if (v22)
            goto LABEL_27;
          goto LABEL_29;
        }
        v10 = v9;
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "shouldLog");
          if (objc_msgSend(v29, "shouldLogToDisk"))
            v30 |= 2u;
          objc_msgSend(v29, "OSLogObject");
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            v30 &= 2u;
          if (v30)
          {
            v61 = v5;
            v32 = a1;
            v33 = v4;
            v34 = (void *)objc_opt_class();
            v56 = v34;
            objc_msgSend(v3, "bundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138412546;
            v68 = v34;
            v4 = v33;
            a1 = v32;
            v5 = v61;
            v69 = 2112;
            v70 = v35;
            LODWORD(v48) = 22;
            v47 = &v67;
            v36 = (void *)_os_log_send_and_compose_impl();

            if (v36)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v67, v48);
              v31 = objc_claimAutoreleasedReturnValue();
              free(v36);
              v47 = (int *)v31;
              SSFileLog();
              goto LABEL_39;
            }
          }
          else
          {
LABEL_39:

          }
          v38 = v10 & 0xFFFFFFFFFFFFFFFCLL;
          goto LABEL_58;
        }
        v54 = v4;
        v52 = v9;
        v11 = v9 & 0xFFFFFFFFFFFFFFDCLL;
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v13 |= 2u;
        objc_msgSend(v12, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          v13 &= 2u;
        v55 = v11;
        if (!v13)
        {
          v18 = v52;
          goto LABEL_42;
        }
        v15 = (void *)objc_opt_class();
        v50 = v15;
        objc_msgSend(v3, "bundleID");
        v59 = v5;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 138413058;
        v68 = v15;
        v69 = 2112;
        v70 = v16;
        v71 = 2048;
        v72 = v8;
        v73 = 2048;
        v74 = v11;
        LODWORD(v48) = 42;
        v47 = &v67;
        v17 = (void *)_os_log_send_and_compose_impl();

        v5 = v59;
        v18 = v52;
        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v67, v48);
          v14 = objc_claimAutoreleasedReturnValue();
          free(v17);
          v47 = (int *)v14;
          SSFileLog();
LABEL_42:

        }
        if (v8 != 4)
        {
          a1 = v49;
          v4 = v54;
          goto LABEL_57;
        }
        a1 = v49;
        v4 = v54;
        v38 = v55;
        if ((v18 & 4) == 0)
        {
          v39 = v55 | 4;
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "shouldLog");
          if (objc_msgSend(v40, "shouldLogToDisk"))
            v41 |= 2u;
          objc_msgSend(v40, "OSLogObject", v47);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            v43 = v41;
          else
            v43 = v41 & 2;
          v55 |= 4uLL;
          if (v43)
          {
            v44 = (void *)objc_opt_class();
            v62 = v44;
            objc_msgSend(v3, "bundleID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 138413058;
            v68 = v44;
            v69 = 2112;
            v70 = v45;
            v71 = 2048;
            v72 = 4;
            v73 = 2048;
            v74 = v39;
            LODWORD(v48) = 42;
            v47 = &v67;
            v46 = (void *)_os_log_send_and_compose_impl();

            v4 = v54;
            if (v46)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v67, v48);
              v42 = objc_claimAutoreleasedReturnValue();
              free(v46);
              v47 = (int *)v42;
              SSFileLog();
              goto LABEL_55;
            }
          }
          else
          {
            v4 = v54;
LABEL_55:

          }
LABEL_57:
          v38 = v55;
        }
LABEL_58:
        LODWORD(v37) = 0;
        objc_msgSend(v6, "setDownloadProgress:", v37, v47);
        objc_msgSend(v6, "setState:", v38);
        objc_msgSend(v51, "addObject:", v6);
LABEL_59:

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v58);
  }

  if (objc_msgSend(v51, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v51);

}

- (void)jobManager:(id)a3 updatedProgressOfJobs:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIItemStateCenter *v10;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SUUIItemStateCenter_jobManager_updatedProgressOfJobs___block_invoke;
  v8[3] = &unk_2511F46D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

void __56__SUUIItemStateCenter_jobManager_updatedProgressOfJobs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __objc2_class **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  double v18;
  float v19;
  float v21;
  float v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v24 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = a1;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v6 = 0x24BDD1000uLL;
    v7 = off_2511F3000;
    v25 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      v26 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        objc_msgSend(*(id *)(v6 + 1760), "numberWithLongLong:", objc_msgSend(v9, "storeItemID", v24));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v11 = 0;
LABEL_20:
          v13 = 0;
          goto LABEL_21;
        }
        v11 = (void *)objc_msgSend(objc_alloc(v7[32]), "initWithNumber:", v10);
        if (!v11)
          goto LABEL_20;
        objc_msgSend(*(id *)(*(_QWORD *)(v27 + 40) + 88), "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v2;
          v15 = objc_msgSend(v12, "state");
          v16 = ~(_BYTE)v15;
          v17 = objc_msgSend(v9, "phase");
          objc_msgSend(v9, "percentComplete");
          v19 = v18;
          if (v19 != 1.0 && v17 == 5)
            v21 = 1.0;
          else
            v21 = v19;
          if (v15 != (v16 & 2 | v15 & 0xFFFFFFFFFFFFFFFELL) || (objc_msgSend(v13, "downloadProgress"), v21 != v22))
          {
            objc_msgSend(v13, "setState:", v16 & 2 | v15 & 0xFFFFFFFFFFFFFFFELL);
            *(float *)&v23 = v21;
            objc_msgSend(v13, "setDownloadProgress:", v23);
            objc_msgSend(v24, "addObject:", v13);
          }
          v2 = v14;
          v5 = v25;
          v4 = v26;
          v6 = 0x24BDD1000;
          v7 = off_2511F3000;
        }
LABEL_21:

        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v24, "count"))
    objc_msgSend(*(id *)(v27 + 40), "_notifyObserversOfStateChanges:", v24);

}

- (void)jobManager:(id)a3 updatedStateOfJobs:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIItemStateCenter *v10;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SUUIItemStateCenter_jobManager_updatedStateOfJobs___block_invoke;
  v8[3] = &unk_2511F46D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

void __53__SUUIItemStateCenter_jobManager_updatedStateOfJobs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SUUIStoreIdentifier *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34 = a1;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v36;
    v6 = 0x24BDD1000uLL;
    v28 = *(_QWORD *)v36;
    v29 = v2;
    do
    {
      v7 = 0;
      v31 = v4;
      do
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        objc_msgSend(*(id *)(v6 + 1760), "numberWithLongLong:", objc_msgSend(v8, "storeItemID", v26));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v10 = 0;
          goto LABEL_22;
        }
        v10 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v9);
        if (v10)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(v34 + 40) + 88), "objectForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            v13 = objc_msgSend(v8, "phase");
            objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "shouldLog");
            if (objc_msgSend(v14, "shouldLogToDisk"))
              v16 = v15 | 2;
            else
              v16 = v15;
            objc_msgSend(v14, "OSLogObject");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              v18 = v16;
            else
              v18 = v16 & 2;
            if (v18)
            {
              v19 = (void *)objc_opt_class();
              v33 = v19;
              objc_msgSend(v8, "bundleID");
              v32 = v13;
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v12, "state");
              v39 = 138413058;
              v40 = v19;
              v41 = 2112;
              v42 = v20;
              v22 = (void *)v20;
              v43 = 2048;
              v44 = v32;
              v45 = 2048;
              v46 = v21;
              LODWORD(v27) = 42;
              v26 = &v39;
              v23 = (void *)_os_log_send_and_compose_impl();

              v2 = v29;
              if (v23)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v39, v27);
                v17 = objc_claimAutoreleasedReturnValue();
                free(v23);
                v26 = (int *)v17;
                SSFileLog();
                goto LABEL_20;
              }
            }
            else
            {
              v2 = v29;
LABEL_20:

            }
            objc_msgSend(*(id *)(v34 + 40), "_downloadPhaseForJobPhase:", objc_msgSend(v8, "phase"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDownloadPhase:", v24);

            objc_msgSend(v8, "percentComplete");
            *(float *)&v25 = v25;
            objc_msgSend(v12, "setDownloadProgress:", v25);
            objc_msgSend(v30, "addObject:", v12);

            v5 = v28;
            v6 = 0x24BDD1000;
            v4 = v31;
          }
        }
LABEL_22:

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(v34 + 40), "_notifyObserversOfStateChanges:", v30);
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIItemStateCenter *v10;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__SUUIItemStateCenter_downloadManager_downloadStatesDidChange___block_invoke;
  v8[3] = &unk_2511F46D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

void __63__SUUIItemStateCenter_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  SUUIStoreIdentifier *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  SUUIItemState *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v39 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v3)
  {
    v4 = v3;
    v35 = 0;
    v5 = *(_QWORD *)v46;
    v6 = *MEMORY[0x24BEB23A8];
    v7 = *MEMORY[0x24BEB2288];
    v40 = v2;
    v41 = *MEMORY[0x24BEB2410];
    v34 = *MEMORY[0x24BEB22F8];
    v42 = *MEMORY[0x24BEB2288];
    v43 = a1;
    while (1)
    {
      v8 = 0;
      v44 = v4;
      do
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        objc_msgSend(v9, "valueForProperty:", v6, v34);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if ((v11 & 1) == 0)
        {
          v12 = v6;
          objc_msgSend(v9, "valueForProperty:", v41);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v13);
            if (v14)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v14);
              v15 = a1;
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
                goto LABEL_22;
              objc_msgSend(v9, "downloadPhaseIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setDownloadPhase:", v17);

              objc_msgSend(v16, "downloadProgress");
              v19 = v18;
              objc_msgSend(v9, "percentComplete");
              *(float *)&v20 = v20;
              objc_msgSend(v16, "setDownloadProgress:", v20);
              objc_msgSend(v39, "addObject:", v16);
              if (objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 152), "itemHasParent:", v14))
              {
                objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 152), "parentItemForItem:", v14);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 88), "objectForKey:", v21);
                v22 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
                if (!v22)
                {
                  v22 = objc_alloc_init(SUUIItemState);
                  objc_msgSend(v21, "itemIdentifier");
                  v37 = v21;
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SUUIItemState setItemIdentifier:](v22, "setItemIdentifier:", v23);

                  -[SUUIItemState setStoreIdentifier:](v22, "setStoreIdentifier:", v37);
                  objc_msgSend(v16, "downloadPhase");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SUUIItemState setDownloadPhase:](v22, "setDownloadPhase:", v24);

                  v21 = v37;
                  -[SUUIItemState setDownloadContentFlags:](v22, "setDownloadContentFlags:", objc_msgSend(v16, "downloadContentFlags"));
                  objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 88), "setObject:forKey:", v22, v37);
                }
                objc_msgSend(*(id *)(*(_QWORD *)(v15 + 40) + 152), "siblingItemsForItem:", v14);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUUIItemState downloadProgress](v22, "downloadProgress");
                v27 = v26;
                v36 = v25;
                v28 = (float)(unint64_t)objc_msgSend(v25, "count");
                v29 = v19 / v28;
                if ((float)(v27 - (float)(v19 / v28)) >= 0.0)
                  v29 = -0.0;
                v30 = (float)(v27 - (float)(v19 / v28)) + v29;
                objc_msgSend(v16, "downloadProgress");
                *(float *)&v31 = (float)(*(float *)&v31 / v28) + v30;
                if (*(float *)&v31 > 1.0)
                  *(float *)&v31 = 1.0;
                -[SUUIItemState setDownloadProgress:](v22, "setDownloadProgress:", v31);
                if ((objc_msgSend(v35, "isEqual:", v34) & 1) == 0)
                {
                  objc_msgSend(v9, "downloadPhaseIdentifier");
                  v38 = v21;
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SUUIItemState setDownloadPhase:](v22, "setDownloadPhase:", v32);

                  v21 = v38;
                  objc_msgSend(v9, "downloadPhaseIdentifier");
                  v33 = objc_claimAutoreleasedReturnValue();

                  v35 = (void *)v33;
                }
                v2 = v40;
                objc_msgSend(v39, "addObject:", v22);

              }
              else
              {
LABEL_22:
                v2 = v40;
              }
              goto LABEL_23;
            }
          }
          else
          {
            v14 = 0;
          }
          v16 = 0;
LABEL_23:

          v6 = v12;
          a1 = v43;
          v4 = v44;
          v7 = v42;
        }
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (!v4)
        goto LABEL_28;
    }
  }
  v35 = 0;
LABEL_28:

  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v39);
}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIItemStateCenter *v10;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__SUUIItemStateCenter_downloadQueue_downloadStatesDidChange___block_invoke;
  v8[3] = &unk_2511F46D0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

void __61__SUUIItemStateCenter_downloadQueue_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIStoreIdentifier *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  int *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  SUUIStoreIdentifier *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = *(id *)(a1 + 32);
  v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v32;
    v27 = *MEMORY[0x24BEB22F8];
    v26 = *MEMORY[0x24BEB2308];
    v25 = v3;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v3);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v5, "storeID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
        {
          v8 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v5, "permLink");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "URLWithString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v10, "identifierFromPermlink");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "integerValue"));
              v7 = v6;
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
          }
          else
          {
            v11 = 0;
LABEL_13:

          }
          v7 = v11;
          if (!v6)
            goto LABEL_31;
          goto LABEL_15;
        }
        if (!v6)
          goto LABEL_31;
LABEL_15:
        v12 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v6);
        if (v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            goto LABEL_26;
        }
        v28 = v12;
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "shouldLog");
        if (objc_msgSend(v14, "shouldLogToDisk"))
          v15 |= 2u;
        objc_msgSend(v14, "OSLogObject");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          v15 &= 2u;
        if (!v15)
          goto LABEL_24;
        v17 = (void *)objc_opt_class();
        v35 = 138412290;
        v36 = v17;
        v18 = v2;
        v19 = a1;
        v20 = v17;
        LODWORD(v24) = 12;
        v23 = &v35;
        v21 = (void *)_os_log_send_and_compose_impl();

        a1 = v19;
        v2 = v18;
        v3 = v25;

        if (v21)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v35, v24);
          v16 = objc_claimAutoreleasedReturnValue();
          free(v21);
          v23 = (int *)v16;
          SSFileLog();
LABEL_24:

        }
        v12 = v28;
        objc_msgSend(*(id *)(a1 + 40), "_addState:forItemIdentifier:", 2, v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
        objc_msgSend(v13, "setMediaCategory:", 3, v23);
        objc_msgSend(v13, "setDownloadPhase:", v27);
        if (objc_msgSend(v5, "downloadPhase") == 8)
          objc_msgSend(v13, "setDownloadPhase:", v26);
        objc_msgSend(v5, "percentComplete");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        objc_msgSend(v13, "setDownloadProgress:");

        objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") | 2);
        objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") & 0xFFFFFFFFFFFFFFFELL);
        if (objc_msgSend(v5, "isSample"))
          objc_msgSend(v13, "setDownloadContentFlags:", 1);
        objc_msgSend(v2, "addObject:", v13);

LABEL_31:
      }
      v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v2);
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  SUUIItemStateCenter *v11;

  v6 = a4;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__SUUIItemStateCenter_downloadQueue_downloadStates_didCompleteWithError___block_invoke;
  v9[3] = &unk_2511F46D0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(accessQueue, v9);

}

void __73__SUUIItemStateCenter_downloadQueue_downloadStates_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  SUUIStoreIdentifier *v9;
  NSObject *v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  SUUILibraryItem *v20;
  SUUIStoreIdentifier *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  SUUIStoreIdentifier *v45;
  NSObject *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  int v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v41 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v52;
    v40 = *MEMORY[0x24BEB2308];
    v36 = *(_QWORD *)v52;
    v37 = a1;
    do
    {
      v5 = 0;
      v38 = v3;
      do
      {
        if (*(_QWORD *)v52 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v5);
        objc_msgSend(v6, "storeID", v34, v35);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          if (v7)
            goto LABEL_8;
          goto LABEL_38;
        }
        v23 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v6, "permLink");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "URLWithString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v25, "identifierFromPermlink");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            goto LABEL_37;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v26, "integerValue"));
          v8 = v7;
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }

LABEL_37:
        v8 = v26;
        if (v7)
        {
LABEL_8:
          v44 = v6;
          v9 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v7);
          if (!v9
            || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v9),
                (v10 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend(*(id *)(a1 + 40), "_addState:forItemIdentifier:", 2, v9);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          v45 = v9;
          -[NSObject setMediaCategory:](v10, "setMediaCategory:", 3);
          -[NSObject setDownloadPhase:](v10, "setDownloadPhase:", v40);
          LODWORD(v11) = 1.0;
          -[NSObject setDownloadProgress:](v10, "setDownloadProgress:", v11);
          -[NSObject setState:](v10, "setState:", -[NSObject state](v10, "state") & 0xFFFFFFFFFFFFFFFDLL);
          v46 = v10;
          -[NSObject setState:](v10, "setState:", -[NSObject state](v10, "state") & 0xFFFFFFFFFFFFFFFELL);
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v12 = *(id *)(*(_QWORD *)(a1 + 40) + 104);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v13)
          {
            v14 = v13;
            v42 = v8;
            v43 = v5;
            v15 = v7;
            v16 = 0;
            v17 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v48 != v17)
                  objc_enumerationMutation(v12);
                v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v20 = objc_alloc_init(SUUILibraryItem);
                  v21 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v15);
                  -[SUUILibraryItem setStoreIdentifier:](v20, "setStoreIdentifier:", v21);

                  objc_msgSend(v19, "stateForLibraryItemAfterLibraryIntegration:", v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v22, "availability") == 2)
                  {
                    -[NSObject setState:](v46, "setState:", -[NSObject state](v46, "state") | 0x40);
                    v16 = 1;
                  }

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            }
            while (v14);

            v4 = v36;
            a1 = v37;
            v3 = v38;
            v7 = v15;
            v8 = v42;
            v5 = v43;
            v10 = v46;
            if ((v16 & 1) != 0)
              goto LABEL_29;
          }
          else
          {

          }
          -[NSObject setState:](v10, "setState:", -[NSObject state](v10, "state") | 0x40);
LABEL_29:
          -[NSObject setLibraryContentFlags:](v10, "setLibraryContentFlags:", 0);
          v27 = v45;
          if (objc_msgSend(v44, "isSample"))
          {
            -[NSObject setDownloadContentFlags:](v10, "setDownloadContentFlags:", 1);
            -[NSObject setLibraryContentFlags:](v10, "setLibraryContentFlags:", 1);
          }
          objc_msgSend(v41, "addObject:", v10);
          goto LABEL_32;
        }
LABEL_38:
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "shouldLog");
        if (objc_msgSend(v27, "shouldLogToDisk"))
          v28 |= 2u;
        objc_msgSend(v27, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          v28 &= 2u;
        if (!v28)
          goto LABEL_32;
        v29 = (void *)objc_opt_class();
        v56 = 138412290;
        v57 = v29;
        v30 = v10;
        v31 = v29;
        LODWORD(v35) = 12;
        v34 = &v56;
        v32 = (void *)_os_log_send_and_compose_impl();

        if (v32)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v32, 4, &v56, v35);
          v10 = objc_claimAutoreleasedReturnValue();
          free(v32);
          v34 = (int *)v10;
          SSFileLog();
LABEL_32:

        }
        ++v5;
      }
      while (v5 != v3);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      v3 = v33;
    }
    while (v33);
  }

  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v41);
}

- (void)_reloadStateForObservedMediaLibraryItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUUIStoreItemRelationshipCounsellor *relationshipCouncellor;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *mediaLibraryQueue;
  id v19;
  id obj;
  _QWORD block[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (-[NSCountedSet count](self->_observedLibraryItems, "count"))
  {
    v3 = (void *)-[NSCountedSet copy](self->_observedLibraryItems, "copy");
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          relationshipCouncellor = self->_relationshipCouncellor;
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v8), "storeIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIStoreItemRelationshipCounsellor childItemsForItem:](relationshipCouncellor, "childItemsForItem:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                SUUILibraryItemForStoreIdentifier(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v16));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v17);

                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v14);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v6);
    }

    mediaLibraryQueue = self->_mediaLibraryQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SUUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke;
    block[3] = &unk_2511F46D0;
    block[4] = self;
    v22 = v4;
    v19 = v4;
    dispatch_async(mediaLibraryQueue, block);

  }
}

void __63__SUUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyItemsStatesForLibraryItems:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SUUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke_2;
  v6[3] = &unk_2511F46D0;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __63__SUUIItemStateCenter__reloadStateForObservedMediaLibraryItems__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  SUUIStoreIdentifier *v14;
  SUUIStoreIdentifier *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SUUIItemState *v34;
  void *v35;
  SUUIItemState *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __int128 v65;
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
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableCopy");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v74;
    v54 = v4;
    v55 = v2;
    v53 = *(_QWORD *)v74;
    do
    {
      v8 = 0;
      v63 = v6;
      do
      {
        if (*(_QWORD *)v74 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v8);
        objc_msgSend(v9, "storeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "storeIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "copy");
        }
        else
        {
          v13 = v8;
          v14 = [SUUIStoreIdentifier alloc];
          objc_msgSend(v9, "storeItemIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v8 = v13;
          v12 = -[SUUIStoreIdentifier initWithNumber:](v15, "initWithNumber:", v11);
        }
        v16 = (void *)v12;

        if ((objc_msgSend(v64, "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v19 = v7;
            v20 = v2;
            v21 = v4;
            v22 = v17;
            v23 = objc_msgSend(v17, "state");
            v24 = objc_msgSend(v18, "state") | v23 & 0xFFFFFFFFFFFFFFBFLL;
            v25 = v23 == v24;
            v17 = v22;
            v4 = v21;
            v2 = v20;
            v7 = v19;
            if (!v25)
            {
              v26 = v24;
              objc_msgSend(v17, "setLibraryContentFlags:", objc_msgSend(v18, "libraryContentFlags"));
              objc_msgSend(v17, "setMediaCategory:", objc_msgSend(v18, "mediaCategory"));
              objc_msgSend(v17, "setState:", v26);
              objc_msgSend(v18, "variantIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setVariantIdentifier:", v27);

              v28 = v2;
              v29 = v17;
              goto LABEL_14;
            }
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKey:", v18, v16);
            v28 = v2;
            v29 = v18;
LABEL_14:
            objc_msgSend(v28, "addObject:", v29);
          }
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "itemHasParent:", v16))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "parentItemForItem:", v16);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v64, "containsObject:", v30) & 1) == 0)
            {
              v60 = v8;
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "siblingItemsForItem:", v16);
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v30;
              v33 = (void *)v31;
              v62 = v32;
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v61)
              {
                v57 = v33;
                v34 = objc_alloc_init(SUUIItemState);
                objc_msgSend(v62, "numberValue");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUUIItemState setItemIdentifier:](v34, "setItemIdentifier:", v35);

                -[SUUIItemState setStoreIdentifier:](v34, "setStoreIdentifier:", v62);
                -[SUUIItemState setState:](v34, "setState:", 0);
                v61 = v34;
                v36 = v34;
                v33 = v57;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKey:", v36, v62);
              }
              v56 = v18;
              v58 = v17;
              v71 = 0u;
              v72 = 0u;
              v69 = 0u;
              v70 = 0u;
              v37 = v33;
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
              v59 = v16;
              if (v38)
              {
                v39 = v38;
                v40 = *(_QWORD *)v70;
                v41 = 64;
                do
                {
                  for (i = 0; i != v39; ++i)
                  {
                    if (*(_QWORD *)v70 != v40)
                      objc_enumerationMutation(v37);
                    v43 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                    SUUILibraryItemForStoreIdentifier(v43);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 &= objc_msgSend(v45, "state");
                    objc_msgSend(v64, "addObject:", v43);
                    objc_msgSend(v3, "removeObjectForKey:", v43);

                  }
                  v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
                }
                while (v39);
              }
              else
              {
                v41 = 64;
              }

              objc_msgSend(v61, "setState:", objc_msgSend(v61, "state") | v41);
              v2 = v55;
              objc_msgSend(v55, "addObject:", v61);
              objc_msgSend(v64, "addObject:", v62);
              objc_msgSend(v3, "removeObjectForKey:", v62);

              v30 = v62;
              v7 = v53;
              v4 = v54;
              v16 = v59;
              v8 = v60;
              v18 = v56;
              v17 = v58;
            }

          }
          objc_msgSend(v3, "removeObjectForKey:", v16);

          v6 = v63;
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v6);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v46 = v3;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(a1 + 32), "_removeState:forItemIdentifier:", 64, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          objc_msgSend(v51, "setLibraryContentFlags:", 0);
          objc_msgSend(v2, "addObject:", v52);
        }

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v48);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfMediaLibraryChange");

}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUUIItemStateCenter__mediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__SUUIItemStateCenter__mediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadStateForObservedMediaLibraryItems");
}

- (void)_restrictionsChangedNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUUIItemStateCenter__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__SUUIItemStateCenter__restrictionsChangedNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (*(unsigned __int8 *)(v1 + 16) == 255)
  {
    v4 = *(_QWORD *)(v1 + 136);
    v3 = (_QWORD *)(v1 + 136);
    if (v4 == -1)
      return result;
  }
  else
  {
    *(_BYTE *)(v1 + 16) = -1;
    v2 = *(_QWORD **)(result + 32);
    v3 = v2 + 17;
    if (v2[17] == -1)
      return objc_msgSend(v2, "_notifyObserversOfRestrictionsChange");
  }
  *v3 = -1;
  v2 = *(_QWORD **)(result + 32);
  return objc_msgSend(v2, "_notifyObserversOfRestrictionsChange");
}

- (void)_storefrontDidChangeNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUUIItemStateCenter__storefrontDidChangeNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__SUUIItemStateCenter__storefrontDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 64) != 1)
    *(_QWORD *)(v1 + 64) = 0;
  return result;
}

- (id)_addState:(unint64_t)a3 forItemIdentifier:(id)a4
{
  id v6;
  SUUIItemState *v7;
  SUUIItemState *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_itemStates, "objectForKey:", v6);
  v7 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (v6)
    {
      v8 = objc_alloc_init(SUUIItemState);
      objc_msgSend(v6, "numberValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemState setItemIdentifier:](v8, "setItemIdentifier:", v10);

      -[SUUIItemState setStoreIdentifier:](v8, "setStoreIdentifier:", v6);
      -[SUUIItemState setState:](v8, "setState:", a3);
      -[NSMutableDictionary setObject:forKey:](self->_itemStates, "setObject:forKey:", v8, v6);
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUUIItemState shouldLog](v8, "shouldLog");
    if (-[SUUIItemState shouldLogToDisk](v8, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    -[SUUIItemState OSLogObject](v8, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      LODWORD(v18) = 138412290;
      *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
      v14 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v18, v17, v18);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }

    goto LABEL_15;
  }
  v8 = v7;
  v9 = -[SUUIItemState state](v7, "state");
  if ((v9 & a3) != 0)
  {
LABEL_15:

    v8 = 0;
    goto LABEL_16;
  }
  -[SUUIItemState setState:](v8, "setState:", v9 | a3);
LABEL_16:

  return v8;
}

- (id)_appstoredUpdatesStore
{
  ASDSoftwareUpdatesStore *v3;
  ASDSoftwareUpdatesStore *appstoredUpdatesStore;
  void *v5;

  if (!self->_appstoredUpdatesStore)
  {
    v3 = (ASDSoftwareUpdatesStore *)objc_alloc_init(MEMORY[0x24BE045D8]);
    appstoredUpdatesStore = self->_appstoredUpdatesStore;
    self->_appstoredUpdatesStore = v3;

    if (-[ASDSoftwareUpdatesStore hasEntitlement](self->_appstoredUpdatesStore, "hasEntitlement"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appstoredUpdatesStoreChangeNotification_, *MEMORY[0x24BE044C8], self->_appstoredUpdatesStore);

    }
  }
  return self->_appstoredUpdatesStore;
}

- (id)_copyItemsStatesForLibraryItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (objc_class *)MEMORY[0x24BDD1650];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SUUIItemStateCenter__copyItemsStatesForLibraryItems___block_invoke;
  v9[3] = &unk_2511FDEB0;
  v7 = v6;
  v10 = v7;
  -[SUUIItemStateCenter _enumerateAvailableItemsForLibraryItems:usingBlock:](self, "_enumerateAvailableItemsForLibraryItems:usingBlock:", v5, v9);

  return v7;
}

void __55__SUUIItemStateCenter__copyItemsStatesForLibraryItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SUUIItemState *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = objc_alloc_init(SUUIItemState);
  objc_msgSend(v18, "storeItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemState setItemIdentifier:](v6, "setItemIdentifier:", v7);

  objc_msgSend(v18, "storeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemState setStoreIdentifier:](v6, "setStoreIdentifier:", v8);

  v9 = objc_msgSend(v5, "isPreview");
  v10 = objc_msgSend(v5, "availability");
  v11 = 64;
  v12 = 8;
  if (v10 != 1)
    v12 = 0;
  if (v10 != 2)
    v11 = v12;
  if (v10 == 3)
    v13 = 64;
  else
    v13 = v11;
  if (v10 == 3)
    v14 = v9 | 2;
  else
    v14 = v9;
  -[SUUIItemState setLibraryContentFlags:](v6, "setLibraryContentFlags:", v14);
  -[SUUIItemState setState:](v6, "setState:", v13);
  objc_msgSend(v5, "itemStateVariantIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemState setVariantIdentifier:](v6, "setVariantIdentifier:", v15);

  v16 = objc_msgSend(v5, "AVTypes");
  if ((v16 & 2) != 0)
  {
    v17 = 3;
    goto LABEL_19;
  }
  if ((v16 & 4) != 0)
  {
    v17 = 4;
    goto LABEL_19;
  }
  if ((v16 & 1) != 0)
  {
    v17 = 2;
    goto LABEL_19;
  }
  if ((v16 & 8) != 0)
  {
    v17 = 5;
LABEL_19:
    -[SUUIItemState setMediaCategory:](v6, "setMediaCategory:", v17);
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v18);

}

- (void)_enumerateAvailableItemsForLibraryItems:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableArray *obj;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_mediaLibraries;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v18 = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      v14 = 0;
      v15 = v8;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        v20[0] = v13;
        v20[1] = 3221225472;
        v20[2] = __74__SUUIItemStateCenter__enumerateAvailableItemsForLibraryItems_usingBlock___block_invoke;
        v20[3] = &unk_2511FDED8;
        v17 = v9;
        v21 = v17;
        v22 = v7;
        objc_msgSend(v16, "enumerateStatesForLibraryItems:usingBlock:", v15, v20, v18);
        v8 = v17;

        v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        ++v14;
        v15 = v8;
      }
      while (v11 != v14);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

}

void __74__SUUIItemStateCenter__enumerateAvailableItemsForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a2;
  if (objc_msgSend(v6, "availability"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)_fireFinishLoadBlocksIfNecessary
{
  void *v3;
  NSObject *observerQueue;
  id v5;
  _QWORD block[4];
  id v7;

  if (!self->_loadCount)
  {
    if (-[NSMutableArray count](self->_finishLoadBlocks, "count"))
    {
      v3 = (void *)-[NSMutableArray copy](self->_finishLoadBlocks, "copy");
      -[NSMutableArray removeAllObjects](self->_finishLoadBlocks, "removeAllObjects");
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__SUUIItemStateCenter__fireFinishLoadBlocksIfNecessary__block_invoke;
      block[3] = &unk_2511F47C0;
      v7 = v3;
      v5 = v3;
      dispatch_async(observerQueue, block);

    }
  }
}

void __55__SUUIItemStateCenter__fireFinishLoadBlocksIfNecessary__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)_gratisStateIsValid
{
  void *v3;
  double v4;
  BOOL v5;

  if (!self->_gratisState || !self->_gratisStateLastUpdate)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_gratisStateLastUpdate);
  v5 = v4 <= 604800.0;

  return v5;
}

- (id)_downloadPhaseForJobPhase:(int64_t)a3
{
  id *v3;

  if ((unint64_t)a3 > 6)
    v3 = (id *)MEMORY[0x24BEB2320];
  else
    v3 = (id *)qword_2511FE060[a3];
  return *v3;
}

- (id)_newPurchaseWithItem:(id)a3 offer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SUUIStoreIdentifier *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void **v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = 0;
    goto LABEL_39;
  }
  v9 = (objc_class *)objc_opt_class();
  if (SUUIItemKindIsToneKind(objc_msgSend(v6, "itemKind")))
    v9 = (objc_class *)objc_opt_class();
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setBuyParameters:", v8);
  objc_msgSend(v10, "setExpectedDownloadFileSize:", objc_msgSend(v7, "fileSize"));
  objc_msgSend(v6, "requiredCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequiredDeviceCapabilities:", v11);

  objc_msgSend(v10, "setUsesLocalRedownloadParametersIfPossible:", 1);
  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forDownloadProperty:", v12, *MEMORY[0x24BEB2338]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
  objc_msgSend(v10, "setValue:forDownloadProperty:", v13, *MEMORY[0x24BEB2410]);
  objc_msgSend(v6, "artistName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forDownloadProperty:", v14, *MEMORY[0x24BEB2328]);

  objc_msgSend(v6, "_downloadKind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forDownloadProperty:", v15, *MEMORY[0x24BEB23A8]);

  objc_msgSend(v6, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forDownloadProperty:", v16, *MEMORY[0x24BEB2470]);

  if (objc_msgSend(v6, "isNewsstandApp"))
    objc_msgSend(v10, "setValue:forDownloadProperty:", *MEMORY[0x24BEB2478], *MEMORY[0x24BEB23E0]);
  if (objc_msgSend(v6, "hasPrerenderedArtwork"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forDownloadProperty:", v17, *MEMORY[0x24BEB2330]);

  }
  objc_msgSend(v7, "variantIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("HD"));

  if (v19)
    objc_msgSend(v10, "setValue:forDownloadProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB2378]);
  if (objc_msgSend(v6, "itemKind") == 18)
    objc_msgSend(v10, "setEnabledServiceType:", &unk_2512EEE68);
  if (-[SUUIItemStateCenter _isPurchaseForOffDeviceContent:](self, "_isPurchaseForOffDeviceContent:", v6))
  {
    objc_msgSend(v10, "setCreatesDownloads:", 0);
    objc_msgSend(v10, "setCreatesJobs:", 0);
  }
  v20 = objc_msgSend(v7, "offerType");
  if (v20 == 3)
  {
    v21 = *MEMORY[0x24BEB2390];
    v23 = (void *)MEMORY[0x24BDBD1C8];
    v22 = v10;
    goto LABEL_19;
  }
  if (v20 == 2)
  {
    v21 = *MEMORY[0x24BEB2420];
    v22 = v10;
    v23 = v13;
LABEL_19:
    objc_msgSend(v22, "setValue:forDownloadProperty:", v23, v21);
  }
  v24 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v13);
  -[NSMutableDictionary objectForKey:](self->_itemStates, "objectForKey:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = objc_msgSend(v25, "state");
    v28 = v27;
    if ((v27 & 8) != 0)
    {
      objc_msgSend(v10, "setValue:forDownloadProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB2388]);
    }
    else if ((v27 & 0x10) != 0)
    {
      if (v12)
      {
        v41[0] = v12;
        v29 = (void *)MEMORY[0x24BDBCE30];
        v30 = (void **)v41;
      }
      else
      {
        v40 = v13;
        v29 = (void *)MEMORY[0x24BDBCE30];
        v30 = &v40;
      }
      objc_msgSend(v29, "arrayWithObjects:count:", v30, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setGratisIdentifiers:", v31);

    }
    if ((~v28 & 0x24) == 0)
    {
      objc_msgSend(v10, "requestProperties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v32, "mutableCopy");

      if (!v33)
        v33 = objc_alloc_init(MEMORY[0x24BEB1F30]);
      objc_msgSend(v33, "setURLBagKey:", CFSTR("updateProduct"));
      objc_msgSend(v10, "setRequestProperties:", v33);

    }
  }
  if (objc_msgSend(v6, "hasMessagesExtension")
    && objc_msgSend(v7, "shouldEnableMessagesExtension"))
  {
    objc_msgSend(v10, "setValue:forDownloadProperty:", &unk_2512EEE80, *MEMORY[0x24BEB2368]);
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "scale");
  if (v35 <= 1.0)
    v36 = 64;
  else
    v36 = 128;

  objc_msgSend(v6, "artworkURLForSize:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "absoluteString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forDownloadProperty:", v38, *MEMORY[0x24BEB2468]);

LABEL_39:
  return v10;
}

- (id)_newSoftwarePurchaseWithItem:(id)a3 offer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUUIStoreIdentifier *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v23;
  int v24;
  _BOOL4 v25;
  int v26;
  int *v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  int *v34;
  void *v35;
  int v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE04570]);
    objc_msgSend(v9, "setBuyParameters:", v8);
    objc_msgSend(v6, "requiredCapabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "requiredCapabilities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRequiredCapabilities:", v11);

    }
    objc_msgSend(v6, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBundleID:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v6, "itemIdentifier"));
    objc_msgSend(v9, "setItemID:", v13);
    objc_msgSend(v6, "artistName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVendorName:", v14);

    objc_msgSend(v6, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemName:", v15);

    if (-[SUUIItemStateCenter _isPurchaseForOffDeviceContent:](self, "_isPurchaseForOffDeviceContent:", v6))
      objc_msgSend(v9, "setCreatesJobs:", 0);
    v16 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v13);
    -[NSMutableDictionary objectForKey:](self->_itemStates, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "state");
      v20 = v19;
      if ((v19 & 8) != 0)
      {
        objc_msgSend(v9, "setIsRedownload:", 1);
      }
      else if ((v19 & 0x10) != 0)
      {
        if (v12)
        {
          v38[0] = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setGratisIdentifiers:", v21);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v35, "shouldLog");
          v23 = objc_msgSend(v35, "shouldLogToDisk");
          v24 = v32 | 2;
          if (!v23)
            v24 = v32;
          v30 = v24;
          objc_msgSend(v35, "OSLogObject");
          v33 = objc_claimAutoreleasedReturnValue();
          v25 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
          v26 = v30 & 2;
          if (v25)
            v26 = v30;
          if (v26)
          {
            v36 = 138412290;
            v37 = (id)objc_opt_class();
            v29 = v37;
            LODWORD(v28) = 12;
            v27 = &v36;
            v31 = (void *)_os_log_send_and_compose_impl();

            if (v31)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v36, v28);
              v34 = (int *)objc_claimAutoreleasedReturnValue();
              free(v31);
              v27 = v34;
              SSFileLog();

            }
          }
          else
          {

          }
        }
      }
      if ((~v20 & 0x24) == 0)
        objc_msgSend(v9, "setBagKey:", CFSTR("updateProduct"));
    }
    if (objc_msgSend(v6, "hasMessagesExtension", v27)
      && objc_msgSend(v7, "shouldEnableMessagesExtension"))
    {
      objc_msgSend(v9, "setExtensionsToEnable:", 1);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_newPurchasesWithBundleItem:(id)a3 bundleOffer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableDictionary *itemStates;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "childItemIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(v6, "loadedChildItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == v11)
  {
    v29 = v11;
    v30 = v12;
    v31 = v7;
    v32 = v8;
    v33 = v6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          itemStates = self->_itemStates;
          objc_msgSend(v19, "storeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](itemStates, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "state");
          if ((v23 & 1) == 0)
          {
            if ((v23 & 6) != 0)
            {
              ++v16;
            }
            else if ((v23 & 8) != 0)
            {
              objc_msgSend(v19, "primaryItemOffer");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[SUUIItemStateCenter _newPurchaseWithItem:offer:](self, "_newPurchaseWithItem:offer:", v19, v24);

              if (v25)
                objc_msgSend(v9, "addObject:", v25);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v8 = v32;
    v6 = v33;
    v12 = v30;
    v7 = v31;
    v11 = v29;
  }
  else
  {
    v16 = 0;
  }
  if (v11 >= 1 && objc_msgSend(v9, "count") + v16 == v11)
  {
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  }
  else
  {
    v26 = -[SUUIItemStateCenter _newPurchaseWithItem:offer:](self, "_newPurchaseWithItem:offer:", v6, v7);
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "setValue:forDownloadProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB23D8]);
      objc_msgSend(v8, "addObject:", v27);
    }

  }
  return v8;
}

- (id)_newPurchasesForSoftwareWithBundleItem:(id)a3 bundleOffer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableDictionary *itemStates;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "childItemIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(v6, "loadedChildItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == v11)
  {
    v29 = v11;
    v30 = v12;
    v31 = v7;
    v32 = v8;
    v33 = v6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          itemStates = self->_itemStates;
          objc_msgSend(v19, "storeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](itemStates, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "state");
          if ((v23 & 1) == 0)
          {
            if ((v23 & 6) != 0)
            {
              ++v16;
            }
            else if ((v23 & 8) != 0)
            {
              objc_msgSend(v19, "primaryItemOffer");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[SUUIItemStateCenter _newSoftwarePurchaseWithItem:offer:](self, "_newSoftwarePurchaseWithItem:offer:", v19, v24);

              if (v25)
                objc_msgSend(v9, "addObject:", v25);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v8 = v32;
    v6 = v33;
    v12 = v30;
    v7 = v31;
    v11 = v29;
  }
  else
  {
    v16 = 0;
  }
  if (v11 >= 1 && objc_msgSend(v9, "count") + v16 == v11)
  {
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  }
  else
  {
    v26 = -[SUUIItemStateCenter _newSoftwarePurchaseWithItem:offer:](self, "_newSoftwarePurchaseWithItem:offer:", v6, v7);
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "setShouldCancelForInstalledBundleItems:", 1);
      objc_msgSend(v8, "addObject:", v27);
    }

  }
  return v8;
}

- (id)_newPurchasesWithItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2426A2860](v7);
        v13 = objc_msgSend(v11, "itemKind", (_QWORD)v17);
        objc_msgSend(v11, "primaryItemOffer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == 17)
        {
          v15 = -[SUUIItemStateCenter _newPurchasesWithBundleItem:bundleOffer:](self, "_newPurchasesWithBundleItem:bundleOffer:", v11, v14);

          if (v15)
            objc_msgSend(v5, "addObjectsFromArray:", v15);
        }
        else
        {
          v15 = -[SUUIItemStateCenter _newPurchaseWithItem:offer:](self, "_newPurchaseWithItem:offer:", v11, v14);

          if (v15)
            objc_msgSend(v5, "addObject:", v15);
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (void)_notifyObserversOfMediaLibraryChange
{
  id v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *observerQueue;
  _QWORD v11[4];
  id v12;
  SUUIItemStateCenter *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    observerQueue = self->_observerQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__SUUIItemStateCenter__notifyObserversOfMediaLibraryChange__block_invoke;
    v11[3] = &unk_2511F46D0;
    v12 = v3;
    v13 = self;
    dispatch_async(observerQueue, v11);

  }
}

void __59__SUUIItemStateCenter__notifyObserversOfMediaLibraryChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenterMediaLibrariesDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfStateChange:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  -[SUUIItemStateCenter _notifyObserversOfStateChanges:](self, "_notifyObserversOfStateChanges:", v6);
}

- (void)_notifyObserversOfRestrictionsChange
{
  id v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *observerQueue;
  _QWORD v11[4];
  id v12;
  SUUIItemStateCenter *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    observerQueue = self->_observerQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__SUUIItemStateCenter__notifyObserversOfRestrictionsChange__block_invoke;
    v11[3] = &unk_2511F46D0;
    v12 = v3;
    v13 = self;
    dispatch_async(observerQueue, v11);

  }
}

void __59__SUUIItemStateCenter__notifyObserversOfRestrictionsChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenterRestrictionsChanged:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfStateChanges:(id)a3
{
  id v4;
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerQueue;
  _QWORD block[4];
  id v14;
  SUUIItemStateCenter *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__SUUIItemStateCenter__notifyObserversOfStateChanges___block_invoke;
      block[3] = &unk_2511F4798;
      v14 = v5;
      v15 = self;
      v16 = v4;
      dispatch_async(observerQueue, block);

    }
  }

}

void __54__SUUIItemStateCenter__notifyObserversOfStateChanges___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenter:itemStatesChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfPurchasesResponses:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SUUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __60__SUUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke(int8x16_t *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  id v13;
  int8x16_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)a1[2].i64[0], "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1[2].i64[1] + 128);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v2, "addObject:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v2, "count"))
    {
      v9 = *(NSObject **)(a1[2].i64[1] + 120);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__SUUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke_2;
      block[3] = &unk_2511F4798;
      v13 = v2;
      v11 = a1[2];
      v10 = (id)v11.i64[0];
      v14 = vextq_s8(v11, v11, 8uLL);
      dispatch_async(v9, block);

    }
  }
}

void __60__SUUIItemStateCenter__notifyObserversOfPurchasesResponses___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenter:didFinishPurchases:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfSoftwarePurchasesResponses:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SUUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __68__SUUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke(int8x16_t *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  id v13;
  int8x16_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)a1[2].i64[0], "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1[2].i64[1] + 128);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v2, "addObject:", v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v2, "count"))
    {
      v9 = *(NSObject **)(a1[2].i64[1] + 120);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__SUUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke_2;
      block[3] = &unk_2511F4798;
      v13 = v2;
      v11 = a1[2];
      v10 = (id)v11.i64[0];
      v14 = vextq_s8(v11, v11, 8uLL);
      dispatch_async(v9, block);

    }
  }
}

void __68__SUUIItemStateCenter__notifyObserversOfSoftwarePurchasesResponses___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "itemStateCenter:didFinishSoftwarePurchases:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_performPurchases:(id)a3 hasBundlePurchase:(BOOL)a4 withClientContext:(id)a5 completionBlock:(id)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  SUUIStoreIdentifier *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int IsSoftwareKind;
  int v29;
  BOOL v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  BOOL v39;
  id v40;
  id v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id obj;
  uint64_t v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  char v57;
  BOOL v58;
  BOOL v59;
  char v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD *v64;
  char v65;
  BOOL v66;
  BOOL v67;
  char v68;
  _QWORD v69[3];
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v50 = a5;
  v42 = a6;
  v46 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (v9)
  {
    v49 = *(_QWORD *)v72;
    v10 = *MEMORY[0x24BEB2410];
    v45 = *MEMORY[0x24BEB2378];
    v44 = *MEMORY[0x24BEB2390];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v72 != v49)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v12, "valueForDownloadProperty:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v13);
          -[SUUIItemStateCenter _addState:forItemIdentifier:](self, "_addState:forItemIdentifier:", 1, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = v12;
            objc_msgSend(v16, "valueForDownloadProperty:", v45);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "BOOLValue");

            objc_msgSend(v16, "valueForDownloadProperty:", v44);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "BOOLValue");
            v21 = CFSTR("buy");
            if (v20)
              v21 = CFSTR("rent");
            v22 = CFSTR("buy_HD");
            if (v20)
              v22 = CFSTR("rent_HD");
            if (v18)
              v23 = v22;
            else
              v23 = v21;
            objc_msgSend(v15, "setVariantIdentifier:", v23);
            objc_msgSend(v46, "addObject:", v15);
          }

        }
        objc_msgSend(v50, "customizePurchase:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v46, "count"))
    -[SUUIItemStateCenter _notifyObserversOfStateChanges:](self, "_notifyObserversOfStateChanges:", v46);
  if (objc_msgSend(obj, "count") == 1)
  {
    objc_msgSend(obj, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForDownloadProperty:", *MEMORY[0x24BEB2390]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "BOOLValue");

  }
  if (objc_msgSend(obj, "count") == 1)
  {
    objc_msgSend(obj, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForDownloadProperty:", *MEMORY[0x24BEB23A8]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    IsSoftwareKind = SSDownloadKindIsSoftwareKind();
    if (IsSoftwareKind)
      v29 = objc_msgSend(v26, "createsJobs") ^ 1;
    else
      v29 = 0;
    if (SSDownloadKindIsEBookKind())
    {
      objc_msgSend(v26, "valueForDownloadProperty:", *MEMORY[0x24BEB2420]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31 == 0;

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v29 = 0;
    IsSoftwareKind = 0;
    v30 = 0;
  }
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F88]), "initWithPurchases:", obj);
  v35 = v34;
  if (IsSoftwareKind)
    objc_msgSend(v34, "setCreatesDownloads:", 0);
  if (v29)
    objc_msgSend(v35, "setCreatesJobs:", 0);
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 0;
  v36 = MEMORY[0x24BDAC760];
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __93__SUUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke;
  v61[3] = &unk_2511FDF00;
  v62 = v33;
  v64 = v69;
  v65 = IsSoftwareKind;
  v66 = v30;
  v67 = a4;
  v68 = v29;
  v63 = v32;
  v51[0] = v36;
  v51[1] = 3221225472;
  v51[2] = __93__SUUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke_2;
  v51[3] = &unk_2511FDF28;
  v37 = v62;
  v52 = v37;
  v38 = obj;
  v53 = v38;
  v39 = v30;
  v40 = v63;
  v54 = v40;
  v41 = v42;
  v57 = IsSoftwareKind;
  v58 = v39;
  v59 = a4;
  v60 = v29;
  v55 = v41;
  v56 = v69;
  objc_msgSend(v35, "startWithPurchaseResponseBlock:completionBlock:", v61, v51);

  _Block_object_dispose(v69, 8);
}

void __93__SUUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  SUUIStoreIdentifier *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v5);
    objc_msgSend(v9, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57) || *(_BYTE *)(a1 + 58) || *(_BYTE *)(a1 + 59))
    {
      objc_msgSend(v9, "downloadIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_replacePurchasingItem:withDownloadIDs:", v6, v8);

    }
    objc_msgSend(v3, "evaluatePurchaseResponseForRentals:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __93__SUUIItemStateCenter__performPurchases_hasBundlePurchase_withClientContext_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB1F90]);
    objc_msgSend(v4, "setError:", v6);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "_notifyObserversOfPurchasesResponses:", *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(a1 + 72) && !*(_BYTE *)(a1 + 73)
    || *(_BYTE *)(a1 + 74)
    || *(_BYTE *)(a1 + 75)
    || *(_BYTE *)(a1 + 72) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    || *(_BYTE *)(a1 + 73) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v3, "_removePurchasingItemsForPurchases:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_performSoftwarePurchases:(id)a3 withClientContext:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  SUUIStoreIdentifier *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v21 = a5;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "itemID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v14);
          -[SUUIItemStateCenter _addState:forItemIdentifier:](self, "_addState:forItemIdentifier:", 1, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v22, "addObject:", v16);

        }
        objc_msgSend(v9, "customizeSoftwarePurchase:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v22, "count"))
    -[SUUIItemStateCenter _notifyObserversOfStateChanges:](self, "_notifyObserversOfStateChanges:", v22);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE045A0]), "initWithPurchases:", obj);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04598]), "initWithOptions:", v17);
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __83__SUUIItemStateCenter__performSoftwarePurchases_withClientContext_completionBlock___block_invoke;
  v24[3] = &unk_2511FDF50;
  objc_copyWeak(&v27, &location);
  v19 = v21;
  v26 = v19;
  v20 = obj;
  v25 = v20;
  objc_msgSend(v18, "startWithCompletionBlock:", v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __83__SUUIItemStateCenter__performSoftwarePurchases_withClientContext_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v16 = v7;
  objc_msgSend(v16, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = v16;
  if (!v11)
  {
    v13 = objc_alloc(MEMORY[0x24BE045A8]);
    v12 = (void *)objc_msgSend(v13, "initWithPurchaseResponseItems:", MEMORY[0x24BDBD1A8]);

    objc_msgSend(v16, "setError:", v8);
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
  objc_msgSend(v16, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_notifyObserversOfSoftwarePurchasesResponses:", v15);

  objc_msgSend(WeakRetained, "_updatesSoftwarePurchasingItemsForPurchases:purchaseWasSuccessful:", *(_QWORD *)(a1 + 32), a2);
}

- (id)_purchaseHistoryDatabase
{
  int canAccessPurchaseHistory;
  void *v4;
  void *v5;
  SSAppPurchaseHistoryDatabase *v6;
  SSAppPurchaseHistoryDatabase *purchaseHistoryDatabase;
  __CFNotificationCenter *DarwinNotifyCenter;

  canAccessPurchaseHistory = self->_canAccessPurchaseHistory;
  if (canAccessPurchaseHistory == 255)
  {
    objc_msgSend(MEMORY[0x24BEB1D98], "databasePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_canAccessPurchaseHistory = SSFileIsLocalWritable();

    canAccessPurchaseHistory = self->_canAccessPurchaseHistory;
  }
  if (canAccessPurchaseHistory && !self->_purchaseHistoryDatabase)
  {
    v6 = (SSAppPurchaseHistoryDatabase *)objc_msgSend(MEMORY[0x24BEB1D90], "newDefaultInstance");
    purchaseHistoryDatabase = self->_purchaseHistoryDatabase;
    self->_purchaseHistoryDatabase = v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__PurchaseHistoryChangeNotification, (CFStringRef)*MEMORY[0x24BEB20F8], 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return self->_purchaseHistoryDatabase;
}

- (void)_reloadAppUpdatesStore
{
  NSObject *accessQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUIItemStateCenter__reloadAppUpdatesStore__block_invoke;
  block[3] = &unk_2511F6980;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(accessQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__SUUIItemStateCenter__reloadAppUpdatesStore__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_appstoredUpdatesStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasEntitlement"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __45__SUUIItemStateCenter__reloadAppUpdatesStore__block_invoke_2;
    v3[3] = &unk_2511FDF78;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    objc_msgSend(v2, "getUpdatesWithCompletionBlock:", v3);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    objc_destroyWeak(&v4);
  }

}

void __45__SUUIItemStateCenter__reloadAppUpdatesStore__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setAvailableAppstoredUpdatesWithUpdates:decrementLoadCount:", v3, 1);

}

- (void)_reloadDownloadManager
{
  uint64_t v3;
  NSObject *accessQueue;
  SSDownloadManager *downloadManager;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUIItemStateCenter__reloadDownloadManager__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  downloadManager = self->_downloadManager;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __45__SUUIItemStateCenter__reloadDownloadManager__block_invoke_2;
  v6[3] = &unk_2511FDF78;
  objc_copyWeak(&v7, &location);
  -[SSDownloadManager getDownloadsUsingBlock:](downloadManager, "getDownloadsUsingBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __45__SUUIItemStateCenter__reloadDownloadManager__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

void __45__SUUIItemStateCenter__reloadDownloadManager__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setDownloads:", v3);

}

- (void)_reloadJobManager
{
  uint64_t v3;
  NSObject *accessQueue;
  ASDJobManager *jobManager;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUUIItemStateCenter__reloadJobManager__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  jobManager = self->_jobManager;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __40__SUUIItemStateCenter__reloadJobManager__block_invoke_2;
  v6[3] = &unk_2511FDF78;
  objc_copyWeak(&v7, &location);
  -[ASDJobManager getJobsUsingBlock:](jobManager, "getJobsUsingBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __40__SUUIItemStateCenter__reloadJobManager__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

void __40__SUUIItemStateCenter__reloadJobManager__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setJobs:", v3);

}

- (void)_reloadMediaLibraryStateForItems:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id obj;
  _QWORD block[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 152);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v6), "storeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "childItemsForItem:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              SUUILibraryItemForStoreIdentifier(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v14));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v4);
  }

  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(NSObject **)(v16 + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_2;
  block[3] = &unk_2511F46D0;
  block[4] = v16;
  v21 = v2;
  v18 = v2;
  dispatch_async(v17, block);

}

void __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyItemsStatesForLibraryItems:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_3;
  v6[3] = &unk_2511F46D0;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __56__SUUIItemStateCenter__reloadMediaLibraryStateForItems___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SUUIStoreIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id obj;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v40;
    v28 = *(_QWORD *)v40;
    do
    {
      v5 = 0;
      v29 = v3;
      do
      {
        if (*(_QWORD *)v40 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "containsObject:", v6))
        {
          objc_msgSend(v6, "storeIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            objc_msgSend(v6, "storeIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "copy");
          }
          else
          {
            v10 = [SUUIStoreIdentifier alloc];
            objc_msgSend(v6, "storeItemIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[SUUIStoreIdentifier initWithNumber:](v10, "initWithNumber:", v8);
          }
          v11 = (void *)v9;

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "childItemsForItem:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            v33 = v12;
            v34 = v11;
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v32 = v14;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v36;
              v19 = 64;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v36 != v18)
                    objc_enumerationMutation(v15);
                  SUUILibraryItemForStoreIdentifier(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 &= objc_msgSend(v22, "state");

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v17);
            }
            else
            {
              v19 = 64;
            }

            objc_msgSend(v13, "setState:", objc_msgSend(v13, "state") | v19);
            v4 = v28;
            v3 = v29;
            v12 = v33;
            v11 = v34;
            v14 = v32;
          }
          if (v12)
          {
            v23 = objc_msgSend(v12, "state");
            v24 = objc_msgSend(v13, "state") | v23 & 0xFFFFFFFFFFFFFFBFLL;
            if (v23 != v24)
            {
              objc_msgSend(v12, "setLibraryContentFlags:", objc_msgSend(v13, "libraryContentFlags"));
              objc_msgSend(v12, "setMediaCategory:", objc_msgSend(v13, "mediaCategory"));
              objc_msgSend(v12, "setState:", v24);
              objc_msgSend(v13, "variantIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setVariantIdentifier:", v25);

              v26 = v30;
              v27 = v12;
              goto LABEL_25;
            }
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKey:", v13, v11);
            v26 = v30;
            v27 = v13;
LABEL_25:
            objc_msgSend(v26, "addObject:", v27);
          }

        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v30);
}

- (void)_reloadPurchaseHistory
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_2;
  v3[3] = &unk_2511FDFC8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "getRemovableSytemApplicationsWithCompletionBlock:", v3);
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  SUUIStoreIdentifier *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id WeakRetained;
  id v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v23 = a3;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = v4;
  if (v4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16, v23);
    if (v6)
    {
      v7 = *(_QWORD *)v34;
      v8 = *MEMORY[0x24BEB2A80];
      v9 = *MEMORY[0x24BEB2A60];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "valueForProperty:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v12);
            objc_msgSend(v11, "valueForProperty:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUUIStoreIdentifier setBundleIdentifier:](v13, "setBundleIdentifier:", v14);

            objc_msgSend(v27, "addObject:", v13);
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v6);
    }

  }
  v15 = (void *)objc_msgSend(v27, "copy", v23);
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_purchaseHistoryDatabase");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v18 && v19)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_3;
    v28[3] = &unk_2511FDFA0;
    v29 = v18;
    v30 = v27;
    objc_copyWeak(&v32, (id *)(a1 + 40));
    v31 = v15;
    objc_msgSend(v20, "readAsyncUsingTransactionBlock:", v28);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);

    objc_destroyWeak(&v32);
    v21 = v29;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setPurchaseHistoryItemsWithIdentifiers:", v27);

    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v21, "_setFirstPartyRemovableItemsIdentifiers:", v15);
  }

}

uint64_t __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BEB1FA8], "predicateWithProperty:equalToValue:", *MEMORY[0x24BEB2100], *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEB1DA0];
  objc_msgSend(v3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryWithDatabase:predicate:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = (id)*MEMORY[0x24BEB2110];
  v21[1] = (id)*MEMORY[0x24BEB2108];
  v21[2] = (id)*MEMORY[0x24BEB2118];
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_4;
  v18 = &unk_2511F85C8;
  v9 = v8;
  v19 = v9;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumeratePersistentIDsAndProperties:count:usingBlock:", v21, 3, &v15);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_setPurchaseHistoryItemsWithIdentifiers:", *(_QWORD *)(a1 + 40), v15, v16, v17, v18);

  v11 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v11, "_setFirstPartyRemovableItemsIdentifiers:", *(_QWORD *)(a1 + 48));

  if (objc_msgSend(v9, "count"))
  {
    v12 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v12, "_setPurchaseHistoryVPPItemsWithIdentifiers:", v9);

  }
  for (i = 2; i != -1; --i)

  return 1;
}

void __45__SUUIItemStateCenter__reloadPurchaseHistory__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  SUUIStoreIdentifier *v8;
  uint64_t v9;
  id v10;

  v10 = *(id *)a3;
  v5 = *(void **)(a3 + 8);
  v6 = *(void **)(a3 + 16);
  v7 = v5;
  LODWORD(v6) = objc_msgSend(v6, "BOOLValue");
  v8 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v10);
  -[SUUIStoreIdentifier setBundleIdentifier:](v8, "setBundleIdentifier:", v7);
  v9 = 40;
  if ((_DWORD)v6)
    v9 = 32;
  objc_msgSend(*(id *)(a1 + v9), "addObject:", v8);

}

- (void)_reloadSoftwareLibrary
{
  uint64_t v3;
  NSObject *accessQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUUIItemStateCenter__reloadSoftwareLibrary__block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(accessQueue, block);
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __45__SUUIItemStateCenter__reloadSoftwareLibrary__block_invoke_2;
  v6[3] = &unk_2511F58B8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "getLibraryItemsForITunesStoreItemIdentifiers:completionBlock:", 0, v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

uint64_t __45__SUUIItemStateCenter__reloadSoftwareLibrary__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

void __45__SUUIItemStateCenter__reloadSoftwareLibrary__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setInstalledItems:", v3);

}

- (void)_removePurchasingItemsForPurchases:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUUIItemStateCenter *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SUUIItemStateCenter__removePurchasingItemsForPurchases___block_invoke;
  v7[3] = &unk_2511F46D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __58__SUUIItemStateCenter__removePurchasingItemsForPurchases___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SUUIStoreIdentifier *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x24BEB2410];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "valueForDownloadProperty:", v6, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v8);
          objc_msgSend(*(id *)(a1 + 40), "_removeState:forItemIdentifier:", 1, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChange:", v10);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (id)_removeState:(unint64_t)a3 forItemIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_itemStates, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "state");
    if ((v9 & a3) != 0)
    {
      objc_msgSend(v8, "setState:", v9 & ~a3);
      if (!objc_msgSend(v8, "state"))
        -[NSMutableDictionary removeObjectForKey:](self->_itemStates, "removeObjectForKey:", v6);
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)_replacePurchasingItem:(id)a3 withDownloadIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SUUIItemStateCenter__replacePurchasingItem_withDownloadIDs___block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __62__SUUIItemStateCenter__replacePurchasingItem_withDownloadIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(*(id *)(a1 + 32), "_removeState:forItemIdentifier:", 1, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v7, "addObject:", v2);
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_addState:forItemIdentifier:", 2, *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (!v3 || (void *)v3 == v2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    else
    {
      objc_msgSend(v7, "addObject:", v3);
    }
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setDownloadProgress:", v5);
    objc_msgSend(v4, "setDownloadIdentifiers:", *(_QWORD *)(a1 + 48));

  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", v7);

}

- (void)_setAvailableAppstoredUpdatesWithUpdates:(id)a3 decrementLoadCount:(BOOL)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[4];
  id v10;
  SUUIItemStateCenter *v11;
  BOOL v12;

  v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__SUUIItemStateCenter__setAvailableAppstoredUpdatesWithUpdates_decrementLoadCount___block_invoke;
  block[3] = &unk_2511FA250;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

void __83__SUUIItemStateCenter__setAvailableAppstoredUpdatesWithUpdates_decrementLoadCount___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  SUUIStoreIdentifier *v6;
  SUUIItemState *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v27)
  {
    v3 = *(_QWORD *)v29;
    v23 = v2;
    v24 = a1;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v6 = -[SUUIStoreIdentifier initWithLongLong:]([SUUIStoreIdentifier alloc], "initWithLongLong:", objc_msgSend(v5, "storeItemIdentifier"));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v6);
        v7 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
        v8 = -[SUUIItemState state](v7, "state");
        switch(objc_msgSend(v5, "updateState"))
        {
          case 0:
            v9 = v8 & 0xFFFFFFFFFFFFFFDELL | 0x20;
            if (!v7)
              goto LABEL_19;
            break;
          case 1:
          case 2:
            v9 = v8 & 0xFFFFFFFFFFFFFFD8 | 4;
            if (!v7)
              goto LABEL_19;
            break;
          case 3:
            v9 = ((v8 & 2) == 0) | (unint64_t)v8;
            if (!v7)
              goto LABEL_19;
            break;
          case 4:
            if ((v8 & 2) != 0)
              v9 = v8;
            else
              v9 = v8 & 0xFFFFFFFFFFFFFFDELL | 0x20;
            if (!v7)
              goto LABEL_19;
            break;
          default:
            v9 = v8;
            if (!v7)
            {
LABEL_19:
              v7 = objc_alloc_init(SUUIItemState);
              -[SUUIStoreIdentifier numberValue](v6, "numberValue");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUUIItemState setItemIdentifier:](v7, "setItemIdentifier:", v10);

              -[SUUIItemState setStoreIdentifier:](v7, "setStoreIdentifier:", v6);
              -[SUUIItemState setState:](v7, "setState:", v9);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKey:", v7, v6);
            }
            break;
        }
        if (v8 != v9)
        {
          -[SUUIItemState setState:](v7, "setState:", v9);
          objc_msgSend(v2, "addObject:", v7);
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "shouldLog");
          if (objc_msgSend(v11, "shouldLogToDisk"))
            v13 = v12 | 2;
          else
            v13 = v12;
          objc_msgSend(v11, "OSLogObject", v20, v21);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            v15 = v13;
          else
            v15 = v13 & 2;
          if (v15)
          {
            v16 = (void *)objc_opt_class();
            v26 = v16;
            objc_msgSend(v5, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v5, "updateState");
            v32 = 138413058;
            v33 = v16;
            v34 = 2112;
            v35 = v17;
            v36 = 2048;
            v37 = v18;
            v38 = 2048;
            v39 = v9;
            LODWORD(v21) = 42;
            v20 = &v32;
            v19 = (void *)_os_log_send_and_compose_impl();

            v2 = v23;
            if (v19)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v32, v21);
              v14 = objc_claimAutoreleasedReturnValue();
              free(v19);
              v20 = (int *)v14;
              SSFileLog();
              goto LABEL_31;
            }
          }
          else
          {
            v2 = v23;
LABEL_31:

          }
          a1 = v24;
          v3 = v22;
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v27);
  }

  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChanges:", v2);
  if (*(_BYTE *)(a1 + 48))
  {
    --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
    objc_msgSend(*(id *)(a1 + 40), "_fireFinishLoadBlocksIfNecessary");
  }

}

- (void)_setDownloads:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUUIItemStateCenter__setDownloads___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __37__SUUIItemStateCenter__setDownloads___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  SUUIStoreIdentifier *v14;
  SUUIItemState *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  __CFString *v25;
  const __CFString *v26;
  __CFString *v27;
  void *v28;
  char v29;
  void *v30;
  SUUIItemState *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id obj;
  SUUIItemState *v72;
  SUUIStoreIdentifier *v73;
  __CFString *v74;
  uint64_t v75;
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
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v1 = a1;
  v96 = *MEMORY[0x24BDAC8D0];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableCopy");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v61 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = *(id *)(v1 + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v89;
    v7 = *MEMORY[0x24BEB23A8];
    v8 = *MEMORY[0x24BEB2288];
    v70 = *MEMORY[0x24BEB2410];
    v65 = *MEMORY[0x24BEB2398];
    v63 = *MEMORY[0x24BEB2390];
    v64 = *MEMORY[0x24BEB2378];
    v62 = v2;
    v67 = *MEMORY[0x24BEB23A8];
    v68 = *(_QWORD *)v89;
    v66 = *MEMORY[0x24BEB2288];
    v58 = v3;
    v59 = v1;
    do
    {
      v9 = 0;
      v69 = v5;
      do
      {
        if (*(_QWORD *)v89 != v6)
          objc_enumerationMutation(obj);
        v75 = v9;
        v10 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v9);
        objc_msgSend(v10, "valueForProperty:", v7, v58);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "valueForProperty:", v70);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v13);
            objc_msgSend(v2, "objectForKey:", v14);
            v15 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              v15 = objc_alloc_init(SUUIItemState);
              -[SUUIItemState setItemIdentifier:](v15, "setItemIdentifier:", v13);
              -[SUUIItemState setStoreIdentifier:](v15, "setStoreIdentifier:", v14);
              objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "setObject:forKey:", v15, v14);
            }
            v16 = -[SUUIItemState state](v15, "state");
            if ((v16 & 2) == 0)
            {
              -[SUUIItemState setState:](v15, "setState:", v16 | 2);
              objc_msgSend(v3, "addObject:", v15);
            }
            v17 = -[SUUIItemState downloadContentFlags](v15, "downloadContentFlags");
            objc_msgSend(v10, "valueForProperty:", v65);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "BOOLValue");

            if ((v17 & 2) != v19)
            {
              -[SUUIItemState setDownloadContentFlags:](v15, "setDownloadContentFlags:", v17 | v19);
              objc_msgSend(v3, "addObject:", v15);
            }
            v20 = v10;
            objc_msgSend(v20, "valueForProperty:", v64);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "BOOLValue");

            objc_msgSend(v20, "valueForProperty:", v63);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = objc_msgSend(v23, "BOOLValue");
            v25 = CFSTR("buy");
            if (v24)
              v25 = CFSTR("rent");
            v26 = CFSTR("buy_HD");
            if (v24)
              v26 = CFSTR("rent_HD");
            if (v22)
              v25 = (__CFString *)v26;
            v27 = v25;
            -[SUUIItemState variantIdentifier](v15, "variantIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v27;
            v29 = objc_msgSend(v28, "isEqualToString:", v27);

            if ((v29 & 1) == 0)
            {
              -[SUUIItemState setVariantIdentifier:](v15, "setVariantIdentifier:", v27);
              objc_msgSend(v3, "addObject:", v15);
            }
            objc_msgSend(v2, "removeObjectForKey:", v14);
            v72 = v15;
            v73 = v14;
            if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 152), "itemHasParent:", v14))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 152), "parentItemForItem:", v14);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "objectForKey:", v30);
              v31 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
              if (!v31)
              {
                v31 = objc_alloc_init(SUUIItemState);
                objc_msgSend(v30, "itemIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUUIItemState setItemIdentifier:](v31, "setItemIdentifier:", v32);

                -[SUUIItemState setStoreIdentifier:](v31, "setStoreIdentifier:", v30);
                -[SUUIItemState downloadPhase](v15, "downloadPhase");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUUIItemState setDownloadPhase:](v31, "setDownloadPhase:", v33);

                objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "setObject:forKey:", v31, v30);
              }
              v34 = -[SUUIItemState state](v31, "state");
              if ((v34 & 2) == 0)
              {
                -[SUUIItemState setState:](v31, "setState:", v34 | 2);
                objc_msgSend(v3, "addObject:", v31);
              }
              v35 = v30;
LABEL_40:
              objc_msgSend(v61, "addObject:", v30);

              v2 = v62;
            }
            else
            {
              v86 = 0u;
              v87 = 0u;
              v84 = 0u;
              v85 = 0u;
              v35 = v2;
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
              if (v36)
              {
                v37 = v36;
                v60 = v13;
                v38 = *(_QWORD *)v85;
                while (2)
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v85 != v38)
                      objc_enumerationMutation(v35);
                    v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                    objc_msgSend(v35, "objectForKey:", v30);
                    v31 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
                    -[SUUIItemState downloadIdentifiers](v31, "downloadIdentifiers");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v20, "persistentIdentifier"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = objc_msgSend(v40, "containsObject:", v41);

                    if (v42)
                    {
                      v43 = -[SUUIItemState state](v31, "state");
                      v3 = v58;
                      if ((v43 & 2) == 0)
                      {
                        -[SUUIItemState setState:](v31, "setState:", v43 | 2);
                        objc_msgSend(v58, "addObject:", v31);
                      }
                      v1 = v59;
                      v44 = *(void **)(*(_QWORD *)(v59 + 32) + 152);
                      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v73);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "addChildren:forParent:", v45, v30);

                      v13 = v60;
                      goto LABEL_40;
                    }

                  }
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
                  if (v37)
                    continue;
                  break;
                }
                v3 = v58;
                v1 = v59;
                v2 = v62;
                v13 = v60;
              }
            }

            v7 = v67;
            v6 = v68;
            v5 = v69;
            v8 = v66;
          }

        }
        v9 = v75 + 1;
      }
      while (v75 + 1 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    }
    while (v5);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v46 = v61;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v81 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v48);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v51 = v2;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v77;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v77 != v54)
          objc_enumerationMutation(v51);
        objc_msgSend(*(id *)(v1 + 32), "_removeState:forItemIdentifier:", 2, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v56)
        {
          objc_msgSend(v56, "setDownloadContentFlags:", 0);
          objc_msgSend(v57, "setVariantIdentifier:", 0);
          objc_msgSend(v3, "addObject:", v57);
        }

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v53);
  }

  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(v1 + 32), "_notifyObserversOfStateChanges:", v3);
  objc_msgSend(*(id *)(v1 + 32), "_fireFinishLoadBlocksIfNecessary");

}

- (void)_setJobs:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SUUIItemStateCenter__setJobs___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __32__SUUIItemStateCenter__setJobs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  SUUIStoreIdentifier *v6;
  SUUIItemState *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SUUIStoreIdentifier *v22;
  int *v23;
  uint64_t v24;
  id v25;
  id obj;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  SUUIStoreIdentifier *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x24BDAC8D0];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableCopy");
  v25 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(v1 + 40);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v31)
  {
    v2 = *(_QWORD *)v34;
    v27 = v1;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v34 != v2)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "storeItemID", v23, v24));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = -[SUUIStoreIdentifier initWithNumber:]([SUUIStoreIdentifier alloc], "initWithNumber:", v5);
          objc_msgSend(v28, "objectForKey:", v6);
          v7 = (SUUIItemState *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            v7 = objc_alloc_init(SUUIItemState);
            -[SUUIItemState setItemIdentifier:](v7, "setItemIdentifier:", v5);
            -[SUUIItemState setStoreIdentifier:](v7, "setStoreIdentifier:", v6);
            objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "setObject:forKey:", v7, v6);
          }
          v32 = v6;
          -[SUUIItemState setMediaCategory:](v7, "setMediaCategory:", 1);
          v8 = -[SUUIItemState state](v7, "state");
          v9 = v8;
          if ((v8 & 1) != 0)
            v10 = 0;
          else
            v10 = v8;
          v11 = v10 | ~(_BYTE)v8 & 2;
          v30 = objc_msgSend(v4, "phase");
          objc_msgSend(v4, "percentComplete");
          *(float *)&v12 = v12;
          -[SUUIItemState setDownloadProgress:](v7, "setDownloadProgress:", v12);
          -[SUUIItemState setState:](v7, "setState:", v11);
          v13 = -[SUUIItemState downloadContentFlags](v7, "downloadContentFlags");
          if ((v13 & v11) != 0)
            -[SUUIItemState setDownloadContentFlags:](v7, "setDownloadContentFlags:", v13);
          if (v9 != v11 || v13 != 0)
            objc_msgSend(v25, "addObject:", v7);
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "shouldLog");
          if (objc_msgSend(v15, "shouldLogToDisk"))
            v16 |= 2u;
          objc_msgSend(v15, "OSLogObject");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            v16 &= 2u;
          if (v16)
          {
            v18 = v2;
            v19 = (void *)objc_opt_class();
            v29 = v19;
            objc_msgSend(v4, "bundleID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138413058;
            v38 = v19;
            v2 = v18;
            v39 = 2112;
            v40 = v20;
            v41 = 2048;
            v42 = v30;
            v43 = 2048;
            v44 = v11;
            LODWORD(v24) = 42;
            v23 = &v37;
            v21 = (void *)_os_log_send_and_compose_impl();

            v22 = v32;
            if (v21)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v37, v24);
              v17 = objc_claimAutoreleasedReturnValue();
              free(v21);
              v23 = (int *)v17;
              SSFileLog();
              goto LABEL_27;
            }
          }
          else
          {
            v22 = v32;
LABEL_27:

          }
          v1 = v27;
        }

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v31);
  }

  if (objc_msgSend(v25, "count"))
    objc_msgSend(*(id *)(v1 + 32), "_notifyObserversOfStateChanges:", v25);
  objc_msgSend(*(id *)(v1 + 32), "_fireFinishLoadBlocksIfNecessary", v23);

}

- (void)_setGratisIdentifiers:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUUIItemStateCenter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUUIItemStateCenter__setGratisIdentifiers_error___block_invoke;
  block[3] = &unk_2511F4798;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(accessQueue, block);

}

uint64_t __51__SUUIItemStateCenter__setGratisIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)(v2 + 64) = 3;
  }
  else
  {
    *(_QWORD *)(v2 + 64) = 2;
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_setStateFlag:forOnlyItemsWithIdentifiers:sendNotification:", 16, *(_QWORD *)(a1 + 48), 1);
  }
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
  return objc_msgSend(*(id *)(a1 + 40), "_fireFinishLoadBlocksIfNecessary");
}

- (void)_setInstalledItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *accessQueue;
  _QWORD v15[4];
  id v16;
  SUUIItemStateCenter *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BEB1FD0]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = *MEMORY[0x24BEB2A60];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "valueForProperty:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);
    }

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke_2;
    v15[3] = &unk_2511F6D38;
    v16 = v7;
    v17 = self;
    objc_msgSend(v6, "playableApplicationsWithBundleIdentifiers:completionBlock:", v5, v15);

  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke;
    block[3] = &unk_2511F47C0;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }

}

uint64_t __42__SUUIItemStateCenter__setInstalledItems___block_invoke(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  return objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");
}

void __42__SUUIItemStateCenter__setInstalledItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __objc2_class **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id obj;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v6 = *MEMORY[0x24BEB2A80];
    v24 = *MEMORY[0x24BEB2A70];
    v21 = *MEMORY[0x24BEB2A60];
    v7 = off_2511F3000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v9, "valueForProperty:", v6, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)objc_msgSend(objc_alloc(v7[32]), "initWithNumber:", v10);
          if ((objc_msgSend(v9, "isPlaceholder") & 1) == 0 && (objc_msgSend(v9, "isBeta") & 1) == 0)
          {
            objc_msgSend(v9, "valueForProperty:", v24);
            v12 = v7;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "longLongValue");

            v7 = v12;
            if (!v14
              || (objc_msgSend(v9, "valueForProperty:", v21),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  v16 = objc_msgSend(v22, "containsObject:", v15),
                  v15,
                  v7 = v12,
                  v16))
            {
              objc_msgSend(v23, "setObject:forKey:", v9, v11);
            }
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }

  v17 = *(_QWORD *)(v20 + 40);
  v18 = *(NSObject **)(v17 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke_3;
  block[3] = &unk_2511F46D0;
  block[4] = v17;
  v27 = v23;
  v19 = v23;
  dispatch_async(v18, block);

}

void __42__SUUIItemStateCenter__setInstalledItems___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD aBlock[5];
  id v21;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke_4;
  aBlock[3] = &unk_2511FDFF0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v21 = v4;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke_5;
  v15[3] = &unk_2511FE018;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v16 = v7;
  v17 = v8;
  v9 = v4;
  v18 = v9;
  v10 = v5;
  v19 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
  v11 = *(void **)(a1 + 40);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __42__SUUIItemStateCenter__setInstalledItems___block_invoke_6;
  v13[3] = &unk_2511FE040;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStateChanges:", v9);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfMediaLibraryChange");
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");

}

void __42__SUUIItemStateCenter__setInstalledItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_addState:forItemIdentifier:", 4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if (objc_msgSend(v5, "isLaunchProhibited"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_addState:forItemIdentifier:", 4096, v8);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      v6 = (void *)v7;
    }
    else
    {
      v6 = 0;
    }
  }

}

void __42__SUUIItemStateCenter__setInstalledItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeState:forItemIdentifier:", 4, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 40), "_removeState:forItemIdentifier:", 4096, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v6);

}

uint64_t __42__SUUIItemStateCenter__setInstalledItems___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setPurchaseHistoryItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SUUIItemStateCenter__setPurchaseHistoryItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __63__SUUIItemStateCenter__setPurchaseHistoryItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_setStateFlag:forItemsWithIdentifiers:sendNotification:", 8, *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");
}

- (void)_setPurchaseHistoryVPPItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__SUUIItemStateCenter__setPurchaseHistoryVPPItemsWithIdentifiers___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __66__SUUIItemStateCenter__setPurchaseHistoryVPPItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_setStateFlag:forItemsWithIdentifiers:sendNotification:", 512, *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");
}

- (void)_setFirstPartyRemovableItemsIdentifiers:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SUUIItemStateCenter__setFirstPartyRemovableItemsIdentifiers___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __63__SUUIItemStateCenter__setFirstPartyRemovableItemsIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_setStateFlag:forItemsWithIdentifiers:sendNotification:", 1024, *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_fireFinishLoadBlocksIfNecessary");
}

- (id)_setStateFlag:(unint64_t)a3 forItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v24 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = (void *)-[NSMutableDictionary mutableCopy](self->_itemStates, "mutableCopy");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[SUUIItemStateCenter _addState:forItemIdentifier:](self, "_addState:forItemIdentifier:", a3, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v8, "addObject:", v16);
        objc_msgSend(v9, "removeObjectForKey:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        -[SUUIItemStateCenter _removeState:forItemIdentifier:](self, "_removeState:forItemIdentifier:", a3, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v8, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  if (v24 && objc_msgSend(v8, "count"))
    -[SUUIItemStateCenter _notifyObserversOfStateChanges:](self, "_notifyObserversOfStateChanges:", v8);

  return v8;
}

- (id)_setStateFlag:(unint64_t)a3 forOnlyItemsWithIdentifiers:(id)a4 sendNotification:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SUUIStoreIdentifier *v16;
  SUUIStoreIdentifier *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        v16 = [SUUIStoreIdentifier alloc];
        v17 = -[SUUIStoreIdentifier initWithNumber:](v16, "initWithNumber:", v15, (_QWORD)v20);
        objc_msgSend(v9, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[SUUIItemStateCenter _setStateFlag:forItemsWithIdentifiers:sendNotification:](self, "_setStateFlag:forItemsWithIdentifiers:sendNotification:", a3, v9, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_updatesSoftwarePurchasingItemsForPurchases:(id)a3 purchaseWasSuccessful:(BOOL)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[4];
  id v10;
  SUUIItemStateCenter *v11;
  BOOL v12;

  v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SUUIItemStateCenter__updatesSoftwarePurchasingItemsForPurchases_purchaseWasSuccessful___block_invoke;
  block[3] = &unk_2511FA250;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

void __89__SUUIItemStateCenter__updatesSoftwarePurchasingItemsForPurchases_purchaseWasSuccessful___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  SUUIStoreIdentifier *v9;
  void *v10;
  SUUIStoreIdentifier *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "itemID", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = [SUUIStoreIdentifier alloc];
          objc_msgSend(v7, "itemID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SUUIStoreIdentifier initWithNumber:](v9, "initWithNumber:", v10);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "state");
          v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
          if (objc_msgSend(v7, "createsJobs"))
          {
            if ((v13 & 2) == 0 && *(_BYTE *)(a1 + 48) != 0)
              v14 = v13 & 0xFFFFFFFFFFFFFFFCLL | 2;
          }
          if (v13 != v14)
          {
            objc_msgSend(v12, "setState:", v14);
            objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfStateChange:", v12);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (BOOL)_isPurchaseForOffDeviceContent:(id)a3
{
  return SUUIItemDeviceFamilyIsTVOnly(objc_msgSend(a3, "deviceFamilies"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipCouncellor, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observedLibraryItems, 0);
  objc_storeStrong((id *)&self->_mediaLibraries, 0);
  objc_storeStrong((id *)&self->_mediaLibraryQueue, 0);
  objc_storeStrong((id *)&self->_itemStates, 0);
  objc_storeStrong((id *)&self->_gratisStateLastUpdate, 0);
  objc_storeStrong((id *)&self->_finishLoadBlocks, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_jobManager, 0);
  objc_storeStrong((id *)&self->_appstoredUpdatesStore, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
