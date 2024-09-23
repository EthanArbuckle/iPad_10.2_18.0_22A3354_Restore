@implementation HMDSoftwareUpdateDocumentationManager

- (HMDSoftwareUpdateDocumentationManager)init
{
  HMDFileManager *v3;
  HMDSoftwareUpdateDocumentationManager *v4;

  v3 = objc_alloc_init(HMDFileManager);
  v4 = -[HMDSoftwareUpdateDocumentationManager initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (HMDSoftwareUpdateDocumentationManager)initWithFileManager:(id)a3
{
  id v5;
  HMDSoftwareUpdateDocumentationManager *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableOrderedSet *assets;
  uint64_t v14;
  NSMutableSet *registeredMetadata;
  HMFNetMonitor *v16;
  HMFNetMonitor *netMonitor;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDSoftwareUpdateDocumentationManager;
  v6 = -[HMDSoftwareUpdateDocumentationManager init](&v19, sel_init);
  if (v6)
  {
    HMDispatchQueueNameString();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_fileManager, a3);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    assets = v6->_assets;
    v6->_assets = (NSMutableOrderedSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    registeredMetadata = v6->_registeredMetadata;
    v6->_registeredMetadata = (NSMutableSet *)v14;

    v16 = (HMFNetMonitor *)objc_alloc_init(MEMORY[0x1E0D28610]);
    netMonitor = v6->_netMonitor;
    v6->_netMonitor = v16;

    -[HMFNetMonitor setDelegate:](v6->_netMonitor, "setDelegate:", v6);
    -[HMDSoftwareUpdateDocumentationManager parseCachedAssets](v6, "parseCachedAssets");
  }

  return v6;
}

- (void)parseCachedAssets
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerDocumentationMetadata:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  HMDSoftwareUpdateDocumentationManager *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke;
    v7[3] = &unk_1E89C2328;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);

  }
}

- (void)unregisterDocumentationMetadata:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__HMDSoftwareUpdateDocumentationManager_unregisterDocumentationMetadata___block_invoke;
    v7[3] = &unk_1E89C2328;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (NSArray)assets
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableOrderedSet array](self->_assets, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_recursive_lock_unlock();
  return (NSArray *)v4;
}

- (void)addAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if ((-[NSMutableOrderedSet containsObject:](self->_assets, "containsObject:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", -[NSMutableOrderedSet count](self->_assets, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_assets);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationManager willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v5, v6);

      -[NSMutableOrderedSet addObject:](self->_assets, "addObject:", v8);
      NSStringFromSelector(sel_assets);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationManager didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v5, v7);

    }
    os_unfair_recursive_lock_unlock();
    v4 = v8;
  }

}

- (void)removeAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_recursive_lock_lock_with_options();
    v5 = -[NSMutableOrderedSet indexOfObject:](self->_assets, "indexOfObject:", v9);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_assets);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationManager willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v6, v7);

      -[NSMutableOrderedSet removeObject:](self->_assets, "removeObject:", v9);
      NSStringFromSelector(sel_assets);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationManager didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v6, v8);

    }
    os_unfair_recursive_lock_unlock();
    v4 = v9;
  }

}

- (id)assetForDocumentationMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDSoftwareUpdateDocumentationManager assets](self, "assets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)auditAsset:(id)a3
{
  id v4;
  void *v5;
  HMDSoftwareUpdateDocumentationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDSoftwareUpdateDocumentationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDSoftwareUpdateDocumentationManager *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Auditing asset: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HMDSoftwareUpdateDocumentationManager registeredMetadata](v6, "registeredMetadata", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "observedObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "metadata");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) != 0)
          {

            v21 = (void *)MEMORY[0x1D17BA0A0]();
            v22 = v6;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v24;
              v32 = 2112;
              v33 = v4;
              _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Asset still in use: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            goto LABEL_18;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
    }

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Asset no longer in use, removing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "purgeWithError:", 0);
    -[HMDSoftwareUpdateDocumentationManager removeAsset:](v18, "removeAsset:", v4);
  }
LABEL_18:

}

- (OS_dispatch_queue)workQueue
{
  return self->_queue;
}

- (void)networkMonitorIsReachable:(id)a3
{
  void *v4;
  HMDSoftwareUpdateDocumentationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  HMDSoftwareUpdateDocumentationManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network is reachable, starting automatic caching", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDSoftwareUpdateDocumentationManager assets](v5, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "shouldAutomaticallyCache") && objc_msgSend(v13, "state") <= 3)
        {
          v14 = (void *)MEMORY[0x1D17BA0A0]();
          v15 = v5;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v24 = v17;
            v25 = 2112;
            v26 = v13;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting automatic caching for asset: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          objc_msgSend(v13, "startCaching");
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

}

- (NSMutableSet)registeredMetadata
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_registeredMetadata, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __73__HMDSoftwareUpdateDocumentationManager_unregisterDocumentationMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registeredMetadata", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "observedObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v22 = v14;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Unregistering metadata: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v11);
          objc_msgSend(*(id *)(a1 + 32), "registeredMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v8);

          objc_msgSend(*(id *)(a1 + 32), "assetForDocumentationMetadata:", *(_QWORD *)(a1 + 40));
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (v3)
            objc_msgSend(*(id *)(a1 + 32), "auditAsset:", v3);
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

void __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  HMDSoftwareUpdateDocumentationAsset *v9;
  void *v10;
  HMDSoftwareUpdateDocumentationAsset *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id from;
  id location;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  HMDSoftwareUpdateDocumentationAsset *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28640]), "initWithObservedObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "registeredMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(HMDSoftwareUpdateDocumentationAsset **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering metadata: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "registeredMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v2);

    objc_msgSend(*(id *)(a1 + 40), "assetForDocumentationMetadata:", *(_QWORD *)(a1 + 32));
    v11 = (HMDSoftwareUpdateDocumentationAsset *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = -[HMDSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:]([HMDSoftwareUpdateDocumentationAsset alloc], "initWithDocumentationMetadata:", *(_QWORD *)(a1 + 32));
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v15;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new documentation asset: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 40), "addAsset:", v11);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_initWeak(&location, v11);
    objc_initWeak(&from, v2);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_11;
    v16[3] = &unk_1E89B61C0;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    objc_msgSend(v2, "setDeallocationBlock:", v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
}

void __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_11(id *a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  _QWORD *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  v4 = objc_loadWeakRetained(a1 + 6);
  v5 = v4;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_2;
      block[3] = &unk_1E89C20C8;
      v8 = v4;
      v9 = WeakRetained;
      v10 = v3;
      dispatch_async(v6, block);

    }
  }

}

uint64_t __71__HMDSoftwareUpdateDocumentationManager_registerDocumentationMetadata___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "registeredMetadata");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 40), "auditAsset:", *(_QWORD *)(a1 + 48));
}

void __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void **p_cache;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  dispatch_time_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  _QWORD block[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing cached assets", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSoftwareUpdateDocumentationAsset assetDirectoryURL](HMDSoftwareUpdateDocumentationAsset, "assetDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 0, &v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v49;

  if (v8)
  {
    v39 = v9;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    p_cache = HMDSiriEndpointSessionStateTLV.cache;
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v46 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "fileManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_cache + 493, "assetWithURL:fileManager:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(*(id *)(a1 + 32), "addAsset:", v18);
            objc_msgSend(v10, "addObject:", v18);
            if (objc_msgSend(v18, "shouldAutomaticallyCache"))
            {
              if (objc_msgSend(v18, "state") <= 3)
              {
                v19 = (void *)MEMORY[0x1D17BA0A0]();
                v20 = *(id *)(a1 + 32);
                HMFGetOSLogHandle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v22 = v10;
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v52 = v23;
                  v53 = 2112;
                  v54 = v18;
                  _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Starting automatic caching of asset: %@", buf, 0x16u);

                  v10 = v22;
                  p_cache = (void **)(HMDSiriEndpointSessionStateTLV + 16);
                }

                objc_autoreleasePoolPop(v19);
                objc_msgSend(v18, "startCaching");
              }
            }
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v13);
    }

    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v27;
      v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Found cached assets: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Will purge unregistered assets in 60s", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v32 = dispatch_time(0, 60000000000);
    v33 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke_9;
    block[3] = &unk_1E89BE218;
    objc_copyWeak(&v44, (id *)buf);
    v43 = v10;
    v34 = v10;
    dispatch_after(v32, v33, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);
    v9 = v39;
    v8 = v40;
  }
  else
  {
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v38;
      v53 = 2112;
      v54 = v9;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get cached assets with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
  }

}

void __58__HMDSoftwareUpdateDocumentationManager_parseCachedAssets__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing cached assets: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "auditAsset:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

+ (HMDSoftwareUpdateDocumentationManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_129031 != -1)
    dispatch_once(&sharedManager_onceToken_129031, block);
  return (HMDSoftwareUpdateDocumentationManager *)(id)sharedManager_sharedManager_129032;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_129026 != -1)
    dispatch_once(&logCategory__hmf_once_t15_129026, &__block_literal_global_129027);
  return (id)logCategory__hmf_once_v16_129028;
}

void __52__HMDSoftwareUpdateDocumentationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_129028;
  logCategory__hmf_once_v16_129028 = v0;

}

void __54__HMDSoftwareUpdateDocumentationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_129032;
  sharedManager_sharedManager_129032 = (uint64_t)v1;

}

@end
