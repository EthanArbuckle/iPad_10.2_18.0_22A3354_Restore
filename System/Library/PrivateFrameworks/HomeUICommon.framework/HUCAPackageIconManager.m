@implementation HUCAPackageIconManager

uint64_t __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __40__HUCAPackageIconManager_sharedInstance__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_25433F630;
  qword_25433F630 = v0;

}

- (HUCAPackageIconManager)init
{
  HUCAPackageIconManager *v2;
  id v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  id v8;
  dispatch_group_t v9;
  OS_dispatch_group *prefetchDispatchGroup;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUCAPackageIconManager;
  v2 = -[HUCAPackageIconManager init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    -[HUCAPackageIconManager setPackageDataCache:](v2, "setPackageDataCache:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    -[HUCAPackageIconManager setPackageReuseQueue:](v2, "setPackageReuseQueue:", v4);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("HUCAPackageIconManagerScheduler", v5);

    objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconManager setPrefetchScheduler:](v2, "setPrefetchScheduler:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BE4D0F8]);
    -[HUCAPackageIconManager setPrefetchPriorityQueue:](v2, "setPrefetchPriorityQueue:", v8);

    v9 = dispatch_group_create();
    prefetchDispatchGroup = v2->_prefetchDispatchGroup;
    v2->_prefetchDispatchGroup = (OS_dispatch_group *)v9;

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v2->_signpostID = os_signpost_id_make_with_pointer(v11, v2);

  }
  return v2;
}

- (void)setPrefetchScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchScheduler, a3);
}

- (void)setPrefetchPriorityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchPriorityQueue, a3);
}

- (void)setPackageReuseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_packageReuseQueue, a3);
}

- (void)setPackageDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_packageDataCache, a3);
}

void __51__HUCAPackageIconManager__startPrefetchIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_group_enter(*((dispatch_group_t *)WeakRetained + 2));
  objc_msgSend(WeakRetained, "prefetchPriorityQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      HFLogForCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_signpost_id_make_with_pointer(v4, v3);

      HFLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_signpost_emit_with_name_impl(&dword_23EB80000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PackageIconManagerPrefetch", "Loading: %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "_loadPackageWithIconDescriptor:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(WeakRetained, "_queueForIconDescriptorIdentifier:", v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
        objc_msgSend(v9, "enqueue:", v8);
        os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

      }
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_signpost_emit_with_name_impl(&dword_23EB80000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PackageIconManagerPrefetch", "Loading: %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "prefetchPriorityQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dequeue");
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v13;
    }
    while (v13);
  }
  dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 2));

}

id __41__HUCAPackageIconManager__prefetchIcons___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "prefetchPriorityQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HFMutablePriorityQueue)prefetchPriorityQueue
{
  return self->_prefetchPriorityQueue;
}

- (id)_loadPackageWithIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HUCAPackageIconManager _packageDataForIconDescriptor:](self, "_packageDataForIconDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v6 = (void *)MEMORY[0x24BDE5718];
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "packageWithData:type:options:error:", v7, v8, 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    if (!v9)
      NSLog(CFSTR("Failed to identify package for icon identifier: %@!"), v4);
    if (v10)
    {
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        v17 = 2112;
        v18 = v13;
        _os_log_error_impl(&dword_23EB80000, v11, OS_LOG_TYPE_ERROR, "HUCAPackageIconManager: Failed to identify CAPackage for icon identifier: %@ due to error: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_packageDataForIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HUCAPackageIconManager packageDataCache](self, "packageDataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6718]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithName:bundle:", v4, v8);

    if (v6)
    {
      -[HUCAPackageIconManager packageDataCache](self, "packageDataCache");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v6, v4);
    }
    else
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_error_impl(&dword_23EB80000, v9, OS_LOG_TYPE_ERROR, "HUCAPackageIconManager: Failed to load NSDataAsset for icon identifier: %@", (uint8_t *)&v12, 0xCu);
      }
    }

  }
  v10 = v6;

  return v10;
}

- (NSCache)packageDataCache
{
  return self->_packageDataCache;
}

- (id)tryReclaimPackage:(id)a3 forIconDescriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCAPackageIconManager.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

  }
  -[HUCAPackageIconManager packageReuseQueue](self, "packageReuseQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_queueLock);
  if (v7)
  {
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v7);

    if (v13)
    {
      objc_msgSend(v11, "dequeueObject:", v7);
      v14 = v7;
LABEL_8:
      v15 = v14;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "dequeue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v15 = 0;
LABEL_10:
  v16 = objc_msgSend(v11, "count");
  os_unfair_lock_unlock(&self->_queueLock);
  if (v15)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v22;
      v26 = 2048;
      v27 = v16;
      _os_log_debug_impl(&dword_23EB80000, v17, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: dequeued package with identifier %@, queue now contains %lu packages", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCAPackageIconManager _loadPackageWithIconDescriptor:](self, "_loadPackageWithIconDescriptor:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "rootLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGeometryFlipped:", 1);

  objc_msgSend(v15, "rootLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShouldRasterize:", 1);

  return v15;
}

- (id)_queueForIconDescriptorIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUCAPackageIconManager packageReuseQueue](self, "packageReuseQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[HUCAPackageIconManager packageReuseQueue](self, "packageReuseQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (NSCache)packageReuseQueue
{
  return self->_packageReuseQueue;
}

id __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "packageReuseQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
      v8 = -objc_msgSend(v11, "count");
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8 + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v5);

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = v8 >= 0 || *(_BYTE *)(v13 + 24) != 0;
  *(_BYTE *)(v13 + 24) = v15;

  return v6;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_6 != -1)
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_2);
  return (id)qword_25433F630;
}

uint64_t __52__HUCAPackageIconManager_prioritizeIconDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)prefetchIconDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE4D098], "isSpringBoard") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_2;
    v21[3] = &unk_250F49ED0;
    v21[4] = self;
    v21[5] = &v22;
    objc_msgSend(v6, "na_reduceWithInitialValue:reducer:", v7, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v23 + 24))
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_23EB80000, v10, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: prefetchIconDescriptors called with icon descriptors: %@", buf, 0xCu);
      }

      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      v15 = v8;
      v16 = 3221225472;
      v17 = __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_19;
      v18 = &unk_250F49EF8;
      v19 = v9;
      v12 = v11;
      v20 = v12;
      objc_msgSend(v6, "na_filter:", &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCAPackageIconManager _prefetchIcons:](self, "_prefetchIcons:", v13, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

    _Block_object_dispose(&v22, 8);
  }

  return v5;
}

- (id)_prefetchIcons:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HUCAPackageIconManager signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      v21 = objc_msgSend(v4, "count");
      _os_signpost_emit_with_name_impl(&dword_23EB80000, v5, OS_SIGNPOST_EVENT, v7, "PackageIconManagerPrefetch", "Number of icon descriptors prefetch requested: %lu", buf, 0xCu);
    }
  }

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = (uint64_t)v4;
    _os_log_debug_impl(&dword_23EB80000, v8, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: prefetchIconDescriptors prefetching icon descriptors: %@", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__HUCAPackageIconManager__prefetchIcons___block_invoke;
  v19[3] = &unk_250F49F40;
  v19[4] = self;
  objc_msgSend(v4, "na_map:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconManager _startPrefetchIfNecessary](self, "_startPrefetchIfNecessary");
  v11 = (void *)MEMORY[0x24BE6B5F8];
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __41__HUCAPackageIconManager__prefetchIcons___block_invoke_2;
  v16[3] = &unk_250F49F68;
  v16[4] = self;
  v17 = v10;
  v18 = v4;
  v12 = v4;
  v13 = v10;
  objc_msgSend(v11, "tokenWithCancelationBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)prioritizeIconDescriptors:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[HUCAPackageIconManager signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v4, "count");
      _os_signpost_emit_with_name_impl(&dword_23EB80000, v5, OS_SIGNPOST_EVENT, v7, "PackageIconManagerPrefetch", "Prioritized icon descriptors: %lu", (uint8_t *)&v10, 0xCu);
    }
  }

  -[HUCAPackageIconManager prefetchPriorityQueue](self, "prefetchPriorityQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prioritizeObjects:", v9);

}

void __41__HUCAPackageIconManager__prefetchIcons___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "prefetchPriorityQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsWithEntries:", *(_QWORD *)(a1 + 40));

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      v7 = 134217984;
      v8 = v6;
      _os_signpost_emit_with_name_impl(&dword_23EB80000, v3, OS_SIGNPOST_EVENT, v5, "PackageIconManagerPrefetch", "Cancel Sent for %lu icon descriptors", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)_startPrefetchIfNecessary
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!dispatch_group_wait((dispatch_group_t)self->_prefetchDispatchGroup, 0))
  {
    objc_initWeak(&location, self);
    -[HUCAPackageIconManager prefetchScheduler](self, "prefetchScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __51__HUCAPackageIconManager__startPrefetchIfNecessary__block_invoke;
    v4[3] = &unk_250F49F90;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "performBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (NAScheduler)prefetchScheduler
{
  return self->_prefetchScheduler;
}

- (id)packageForIconDescriptor:(id)a3
{
  return -[HUCAPackageIconManager tryReclaimPackage:forIconDescriptor:](self, "tryReclaimPackage:forIconDescriptor:", 0, a3);
}

- (void)returnPackageToCache:(id)a3 forIconDescriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_queueLock;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCAPackageIconManager.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (!v7)
      goto LABEL_6;
  }
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCAPackageIconManager _queueForIconDescriptorIdentifier:](self, "_queueForIconDescriptorIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(p_queueLock);
  objc_msgSend(v10, "enqueue:", v7);
  os_unfair_lock_unlock(p_queueLock);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v13;
    v17 = 2048;
    v18 = objc_msgSend(v10, "count");
    _os_log_debug_impl(&dword_23EB80000, v12, OS_LOG_TYPE_DEBUG, "HUCAPackageIconManager: reclaimed package with identifier %@, queue now contains %lu packages", buf, 0x16u);

  }
LABEL_6:

}

BOOL __50__HUCAPackageIconManager_prefetchIconDescriptors___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  if ((v5 & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "intValue") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v3);

  }
  return v5 >= 0;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchPriorityQueue, 0);
  objc_storeStrong((id *)&self->_prefetchScheduler, 0);
  objc_storeStrong((id *)&self->_packageReuseQueue, 0);
  objc_storeStrong((id *)&self->_packageDataCache, 0);
  objc_storeStrong((id *)&self->_prefetchDispatchGroup, 0);
}

@end
