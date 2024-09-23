@implementation ATDeviceDiskUsageProvider

- (ATDeviceDiskUsageProvider)init
{
  ATDeviceDiskUsageProvider *v2;
  uint64_t v3;
  ATUserDefaults *defaults;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  ATClientController *clientController;
  uint64_t v10;
  NSMutableSet *usageUpdateCompletionHandlers;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *diskUsageInfo;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ATDeviceDiskUsageProvider;
  v2 = -[ATDeviceDiskUsageProvider init](&v18, sel_init);
  if (v2)
  {
    +[ATUserDefaults sharedInstance](ATUserDefaults, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    defaults = v2->_defaults;
    v2->_defaults = (ATUserDefaults *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceDiskUsageProvider.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    clientController = v2->_clientController;
    v2->_clientController = (ATClientController *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    usageUpdateCompletionHandlers = v2->_usageUpdateCompletionHandlers;
    v2->_usageUpdateCompletionHandlers = (NSMutableSet *)v10;

    -[ATUserDefaults diskUsageInfo](v2->_defaults, "diskUsageInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    diskUsageInfo = v2->_diskUsageInfo;
    v2->_diskUsageInfo = (NSMutableDictionary *)v13;

    if (!v2->_diskUsageInfo)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = v2->_diskUsageInfo;
      v2->_diskUsageInfo = v15;

    }
  }
  return v2;
}

- (id)getCurrentUsage
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSObject *v5;
  int v7;
  ATDeviceDiskUsageProvider *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_diskUsageInfo, "copy");
  os_unfair_lock_unlock(p_lock);
  _ATLogCategoryFramework_Oversize();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ getCurrentUsage=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)getUpdatedUsageWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableSet *usageUpdateCompletionHandlers;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMutableSet count](self->_usageUpdateCompletionHandlers, "count");
  usageUpdateCompletionHandlers = self->_usageUpdateCompletionHandlers;
  v7 = (void *)MEMORY[0x1D8230780](v4);
  -[NSMutableSet addObject:](usageUpdateCompletionHandlers, "addObject:", v7);

  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ATClientController allClients](self->_clientController, "allClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "supportedDataclasses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke;
    v15[3] = &unk_1E927DD18;
    v15[4] = self;
    -[ATDeviceDiskUsageProvider getCurrentUsageWithUpdatedDataClasses:withCompletion:](self, "getCurrentUsageWithUpdatedDataClasses:withCompletion:", v8, v15);

  }
}

- (void)getCurrentUsageWithUpdatedDataClasses:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  ATDeviceDiskUsageProvider *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering updated usage metrics for data classes %{public}@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke;
  block[3] = &unk_1E927E0A8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(queue, block);

}

- (id)_diskUsageForDataClass:(id)a3
{
  void *v3;
  void *v4;

  -[ATClientController clientForDataclass:](self->_clientController, "clientForDataclass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "installedAssetMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_cacheDeletePurgeableStorageData
{
  NSObject *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  double v8;
  int v10;
  ATDeviceDiskUsageProvider *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering purgeable metrics from CacheDelete", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0D51270], "setAutoFilledTracksArePurgeable:", 0);
  v6 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
  objc_msgSend(MEMORY[0x1E0D51270], "setAutoFilledTracksArePurgeable:", 1);
  _ATLogCategoryFramework_Oversize();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = 138543874;
    v11 = self;
    v12 = 2048;
    v13 = v8 - v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded purgeable metrics from CacheDelete in %.2fs: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageUpdateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_clientController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_diskUsageInfo, 0);
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  double v22;
  void *v23;
  NSObject *queue;
  _QWORD v25[5];
  NSObject *v26;
  _QWORD block[6];
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_cacheDeletePurgeableStorageData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.amp.AirTrafficDevice.ATDeviceDiskUsageProvider.usageUpdateQueue", v5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = a1;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v4);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_2;
        block[3] = &unk_1E927E198;
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = v13;
        v28 = v4;
        dispatch_async(queue, block);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v10);
  }

  dispatch_group_enter(v4);
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_13;
  v25[3] = &unk_1E927E148;
  v25[4] = *(_QWORD *)(a1 + 32);
  v14 = v4;
  v26 = v14;
  dispatch_async(queue, v25);
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v23, "valueForKey:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("_PurgeableSize"));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v19 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDiskUsageInfo:", v19);
  _ATLogCategoryFramework_Oversize();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 138543874;
    v34 = v21;
    v35 = 2048;
    v36 = v22 - v3;
    v37 = 2114;
    v38 = v19;
    _os_log_impl(&dword_1D1868000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering storage usage metrics in %.2fs. diskUsageInfo=%{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(v6 + 48) + 16))();
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering usage metrics for data class '%{public}@'", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_diskUsageForDataClass:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  }
  _ATLogCategoryFramework_Oversize();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12 = 138544130;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11 - v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering usage metrics for data class '%{public}@' in %.2fs. usageInfo=%{public}@", (uint8_t *)&v12, 0x2Au);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __82__ATDeviceDiskUsageProvider_getCurrentUsageWithUpdatedDataClasses_withCompletion___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  MSVSystemRootDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99CF0];
  v6 = *MEMORY[0x1E0C99BB8];
  v25[0] = *MEMORY[0x1E0C99CF0];
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "resourceValuesForKeys:error:", v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  _ATLogCategoryFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "msv_description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Finished gathering volume diskUsage=%@ error=%{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished gathering volume diskUsage=%@", buf, 0x16u);
  }

  objc_msgSend(v8, "objectForKey:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && v16)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v15, CFSTR("_PhysicalSize"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v17, CFSTR("_FreeSize"));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ invoking %lu completion handlers", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke_7;
  v8[3] = &unk_1E927D438;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __59__ATDeviceDiskUsageProvider_getUpdatedUsageWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2721 != -1)
    dispatch_once(&sharedInstance_onceToken_2721, &__block_literal_global_2722);
  return (id)sharedInstance___sharedInstance_2723;
}

void __43__ATDeviceDiskUsageProvider_sharedInstance__block_invoke()
{
  ATDeviceDiskUsageProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ATDeviceDiskUsageProvider);
  v1 = (void *)sharedInstance___sharedInstance_2723;
  sharedInstance___sharedInstance_2723 = (uint64_t)v0;

}

@end
