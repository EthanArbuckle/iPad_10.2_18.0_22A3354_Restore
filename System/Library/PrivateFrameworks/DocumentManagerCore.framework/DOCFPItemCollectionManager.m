@implementation DOCFPItemCollectionManager

- (void)collectionDidStartObserving:(id)a3
{
  DOCFPItemCollectionManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSCountedSet addObject:](v4->_activeCollections, "addObject:", v5);
  objc_sync_exit(v4);

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__DOCFPItemCollectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, block);
  return (id)sharedManager_sharedMyManager;
}

uint64_t __72__DOCFPItemCollectionManager_applicationWillEnterForegroundNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObserving");
}

void __43__DOCFPItemCollectionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedMyManager;
  sharedManager_sharedMyManager = (uint64_t)v1;

}

- (DOCFPItemCollectionManager)init
{
  DOCFPItemCollectionManager *v2;
  uint64_t v3;
  NSCountedSet *activeCollections;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *notificationObservances;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)DOCFPItemCollectionManager;
  v2 = -[DOCFPItemCollectionManager init](&v21, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithCapacity:", 100);
  activeCollections = v2->_activeCollections;
  v2->_activeCollections = (NSCountedSet *)v3;

  objc_initWeak(&location, v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __34__DOCFPItemCollectionManager_init__block_invoke;
  v18[3] = &unk_24C0FF060;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __34__DOCFPItemCollectionManager_init__block_invoke_2;
  v16 = &unk_24C0FF060;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2, v13, v14, v15, v16);
  v10 = objc_claimAutoreleasedReturnValue();
  notificationObservances = v2->_notificationObservances;
  v2->_notificationObservances = (NSArray *)v10;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v2;
}

void __34__DOCFPItemCollectionManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applicationWillEnterForegroundNotification");

}

- (void)applicationWillEnterForegroundNotification
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DOCFPItemCollectionManager observingCollections](self, "observingCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v3 = docLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v2;
    _os_log_impl(&dword_2090A2000, v3, OS_LOG_TYPE_DEFAULT, "App will become foreground. Starting collections %@", buf, 0xCu);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "workingQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __72__DOCFPItemCollectionManager_applicationWillEnterForegroundNotification__block_invoke;
        block[3] = &unk_24C0FE168;
        block[4] = v10;
        dispatch_async(v11, block);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (NSArray)observingCollections
{
  DOCFPItemCollectionManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSCountedSet allObjects](v2->_activeCollections, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

void __34__DOCFPItemCollectionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applicationDidEnterBackground");

}

- (void)dealloc
{
  void *v3;
  NSArray *notificationObservances;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__DOCFPItemCollectionManager_dealloc__block_invoke;
  v7[3] = &unk_24C0FF088;
  v8 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](notificationObservances, "enumerateObjectsUsingBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)DOCFPItemCollectionManager;
  -[DOCFPItemCollectionManager dealloc](&v6, sel_dealloc);
}

uint64_t __37__DOCFPItemCollectionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", a2);
}

- (void)applicationDidEnterBackground
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v3 = docLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2090A2000, v3, OS_LOG_TYPE_DEFAULT, "App did enter background. Calling process activity to suspend FPItemCollection enumeration", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke;
  v5[3] = &unk_24C0FF0B0;
  v5[4] = self;
  objc_msgSend(v4, "performExpiringActivityWithReason:usingBlock:", CFSTR("suspend FPItemCollection enumeration"), v5);

}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD block[5];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v4 = docLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v6, "observingCollections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v5;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_2090A2000, v7, OS_LOG_TYPE_DEFAULT, "App did enter background. Now performing expiring activity [expired: %@] for collections %@", buf, 0x16u);

  }
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "observingCollections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = dispatch_group_create();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v22 = v9;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        v16 = (void *)MEMORY[0x24BDAC9B8];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v18, "workingQueue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 == v16)
            {
              objc_msgSend(v11, "addObject:", v18);
            }
            else
            {
              dispatch_group_enter(v10);
              objc_msgSend(v18, "workingQueue");
              v20 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_18;
              block[3] = &unk_24C0FE190;
              block[4] = v18;
              v27 = v10;
              dispatch_async(v20, block);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v14);
      }

      if (objc_msgSend(v11, "count"))
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_19;
        v23[3] = &unk_24C0FE190;
        v24 = v10;
        v25 = v11;
        dispatch_async(MEMORY[0x24BDAC9B8], v23);

      }
      v21 = dispatch_time(0, 3000000000);
      dispatch_group_wait(v10, v21);

      v9 = v22;
    }

  }
}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2090A2000, v2, OS_LOG_TYPE_DEFAULT, "App did enter background. Call stopObserving on working queue for collection %@", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "stopObserving");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__DOCFPItemCollectionManager_applicationDidEnterBackground__block_invoke_19(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v4 = 138412290;
    v10 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v9 = docLogHandle;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_impl(&dword_2090A2000, v9, OS_LOG_TYPE_DEFAULT, "App did enter background. Call stopObserving on main queue for collection %@", buf, 0xCu);
        }
        objc_msgSend(v8, "stopObserving", v10, (_QWORD)v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)collectionDidStopObserving:(id)a3
{
  DOCFPItemCollectionManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSCountedSet removeObject:](v4->_activeCollections, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_activeCollections, 0);
}

@end
