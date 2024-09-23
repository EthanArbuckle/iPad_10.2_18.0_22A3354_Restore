@implementation ATXWidgetDescriptorCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_81);
  return (id)sharedInstance_updater;
}

void __42__ATXWidgetDescriptorCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_updater;
  sharedInstance_updater = v0;

}

- (ATXWidgetDescriptorCache)init
{
  void *v3;
  void *v4;
  ATXWidgetDescriptorCache *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("WidgetDescriptorsWithInstallDates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXAvocadoDescriptorsWithInstallDates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXWidgetDescriptorCache initWithCachePath:legacyCachePath:](self, "initWithCachePath:legacyCachePath:", v3, v4);

  return v5;
}

- (ATXWidgetDescriptorCache)initWithCachePath:(id)a3 legacyCachePath:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  ATXWidgetDescriptorCache *v10;

  v6 = (objc_class *)MEMORY[0x1E0D10170];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initIncludingIntents:", 0);
  v10 = -[ATXWidgetDescriptorCache initWithProvider:cachePath:legacyCachePath:](self, "initWithProvider:cachePath:legacyCachePath:", v9, v8, v7);

  return v10;
}

- (ATXWidgetDescriptorCache)initWithProvider:(id)a3 cachePath:(id)a4 legacyCachePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXWidgetDescriptorCache *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *observerQueue;
  uint64_t v18;
  NSString *cachePath;
  uint64_t v20;
  NSString *legacyCachePath;
  id v22;
  OS_dispatch_queue *v23;
  uint64_t v24;
  uint64_t v25;
  _PASSimpleCoalescingTimer *coalescedDescriptorUpdateOperation;
  uint64_t v27;
  NSHashTable *observers;
  NSObject *v29;
  _QWORD v31[4];
  ATXWidgetDescriptorCache *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ATXWidgetDescriptorCache;
  v11 = -[ATXWidgetDescriptorCache init](&v37, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("ATXWidgetDescriptorCache.internal", v12);
    internalQueue = v11->_internalQueue;
    v11->_internalQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("ATXWidgetDescriptorCache.observer", v15);
    observerQueue = v11->_observerQueue;
    v11->_observerQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(v9, "copy");
    cachePath = v11->_cachePath;
    v11->_cachePath = (NSString *)v18;

    v20 = objc_msgSend(v10, "copy");
    legacyCachePath = v11->_legacyCachePath;
    v11->_legacyCachePath = (NSString *)v20;

    objc_initWeak(&location, v11);
    v22 = objc_alloc(MEMORY[0x1E0D81618]);
    v23 = v11->_internalQueue;
    v24 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke;
    v34[3] = &unk_1E4D579D8;
    objc_copyWeak(&v35, &location);
    v25 = objc_msgSend(v22, "initWithQueue:operation:", v23, v34);
    coalescedDescriptorUpdateOperation = v11->_coalescedDescriptorUpdateOperation;
    v11->_coalescedDescriptorUpdateOperation = (_PASSimpleCoalescingTimer *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v27;

    v29 = v11->_internalQueue;
    v31[0] = v24;
    v31[1] = 3221225472;
    v31[2] = __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_19;
    v31[3] = &unk_1E4D57258;
    v32 = v11;
    v33 = v8;
    dispatch_async(v29, v31);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateDescriptorMappings");
  }
  else
  {
    __atxlog_handle_blending();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_cold_1(v3);

  }
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_19(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "descriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
    v14 = 134217984;
    v15 = v9;
    v10 = "ATXWidgetDescriptorCache init - descriptor count: %ld";
    v11 = v7;
    v12 = 12;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    LOWORD(v14) = 0;
    v10 = "ATXWidgetDescriptorCache init - descriptors nil";
    v11 = v7;
    v12 = 2;
  }
  _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
LABEL_7:

  v13 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v13 + 8))
  {
    *(_QWORD *)(v13 + 40) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalescedDescriptorUpdateOperation");
  }
}

- (void)_scheduleCoalescedDescriptorUpdateOperation
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedDescriptorUpdateOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ATXWidgetDescriptorCache_registerObserver___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __45__ATXWidgetDescriptorCache_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ATXWidgetDescriptorCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __47__ATXWidgetDescriptorCache_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (NSSet)homeScreenDescriptors
{
  NSObject *internalQueue;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ATXWidgetDescriptorCache_homeScreenDescriptors__block_invoke;
  v7[3] = &unk_1E4D590F8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(internalQueue, v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __49__ATXWidgetDescriptorCache_homeScreenDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_homeScreenWidgetDescriptors");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)allWidgetDescriptorsAllowedOnLockscreen
{
  char v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v4 = (void *)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ATXWidgetDescriptorCache_allWidgetDescriptorsAllowedOnLockscreen__block_invoke;
  block[3] = &unk_1E4D57D50;
  block[4] = self;
  v14 = v3;
  v6 = v4;
  v13 = v6;
  dispatch_sync(internalQueue, block);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Returning all complication descriptors: %lu", buf, 0xCu);
  }

  v9 = v13;
  v10 = (NSSet *)v6;

  return v10;
}

void __67__ATXWidgetDescriptorCache_allWidgetDescriptorsAllowedOnLockscreen__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (_QWORD)v10) & 0x400) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x800) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x1000) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 2) != 0)
          && (!*(_BYTE *)(a1 + 48) || objc_msgSend(v9, "isBackgroundRemovable")))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSSet)complicationWidgetDescriptors
{
  char v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v4 = (void *)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ATXWidgetDescriptorCache_complicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E4D57D50;
  block[4] = self;
  v14 = v3;
  v6 = v4;
  v13 = v6;
  dispatch_sync(internalQueue, block);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Returning all complication descriptors: %lu", buf, 0xCu);
  }

  v9 = v13;
  v10 = (NSSet *)v6;

  return v10;
}

void __57__ATXWidgetDescriptorCache_complicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (_QWORD)v10) & 0x400) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x800) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x1000) != 0)
          && (!*(_BYTE *)(a1 + 48) || objc_msgSend(v9, "isBackgroundRemovable")))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSSet)modularComplicationWidgetDescriptors
{
  char v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v4 = (void *)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ATXWidgetDescriptorCache_modularComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E4D57D50;
  block[4] = self;
  v14 = v3;
  v6 = v4;
  v13 = v6;
  dispatch_sync(internalQueue, block);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Returning modular complication descriptors: %lu", buf, 0xCu);
  }

  v9 = v13;
  v10 = (NSSet *)v6;

  return v10;
}

void __64__ATXWidgetDescriptorCache_modularComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (_QWORD)v10) & 0x400) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x800) != 0)
          && (!*(_BYTE *)(a1 + 48) || objc_msgSend(v9, "isBackgroundRemovable")))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSSet)landscapeModularComplicationWidgetDescriptors
{
  char v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v4 = (void *)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATXWidgetDescriptorCache_landscapeModularComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E4D57D50;
  block[4] = self;
  v14 = v3;
  v6 = v4;
  v13 = v6;
  dispatch_sync(internalQueue, block);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Returning modular complication descriptors: %lu", buf, 0xCu);
  }

  v9 = v13;
  v10 = (NSSet *)v6;

  return v10;
}

void __73__ATXWidgetDescriptorCache_landscapeModularComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (_QWORD)v10) & 0x400) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 0x800) != 0
           || (objc_msgSend(v9, "supportedFamilies") & 2) != 0)
          && (!*(_BYTE *)(a1 + 48) || objc_msgSend(v9, "isBackgroundRemovable")))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSSet)inlineComplicationWidgetDescriptors
{
  char v3;
  void *v4;
  NSObject *internalQueue;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D81588], "isiPad");
  v4 = (void *)objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ATXWidgetDescriptorCache_inlineComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E4D57D50;
  block[4] = self;
  v14 = v3;
  v6 = v4;
  v13 = v6;
  dispatch_sync(internalQueue, block);
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "Returning inline complication descriptors: %lu", buf, 0xCu);
  }

  v9 = v13;
  v10 = (NSSet *)v6;

  return v10;
}

void __63__ATXWidgetDescriptorCache_inlineComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v2, "count");
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((!*(_BYTE *)(a1 + 48)
           || objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isBackgroundRemovable", (_QWORD)v10))
          && (objc_msgSend(v9, "supportedFamilies", (_QWORD)v10) & 0x1000) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_queue_allVisibleDescriptors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  return (id)-[NSSet _pas_filteredSetWithTest:](self->_allDescriptors, "_pas_filteredSetWithTest:", &__block_literal_global_24_2);
}

BOOL __56__ATXWidgetDescriptorCache__queue_allVisibleDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "widgetVisibility");
  if (v3 == 3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Filtering out descriptor with default-off visibility: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 != 3;
}

- (id)_queue_homeScreenWidgetDescriptors
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[ATXWidgetDescriptorCache _queue_allVisibleDescriptors](self, "_queue_allVisibleDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_filteredSetWithTest:", &__block_literal_global_25_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__ATXWidgetDescriptorCache__queue_homeScreenWidgetDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_hasHomeScreenWidgetFamilies");
}

- (void)prepareForTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &__block_literal_global_26);
}

- (void)dealloc
{
  NSObject *internalQueue;
  objc_super v4;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ATXWidgetDescriptorCache_dealloc__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXWidgetDescriptorCache;
  -[ATXWidgetDescriptorCache dealloc](&v4, sel_dealloc);
}

uint64_t __35__ATXWidgetDescriptorCache_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:");
}

- (id)homeScreenDescriptorForIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_msgSend(v4, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "launchId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "atx_intentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    keyForStrings(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__19;
    v21 = __Block_byref_object_dispose__19;
    v22 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke;
    block[3] = &unk_1E4D595C0;
    v15 = v8;
    v16 = &v17;
    block[4] = self;
    v10 = v8;
    dispatch_sync(internalQueue, block);
    v11 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXWidgetDescriptorCache homeScreenDescriptorForIntent:].cold.1();

    v11 = 0;
  }

  return v11;
}

void __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) + 8) + 40))
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke_cold_1(v1 + 8, v1);

  }
}

- (id)homeScreenDescriptorForContainerBundleId:(id)a3 widgetKind:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  ATXWidgetDescriptorCache *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  v23 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke;
  v13[3] = &unk_1E4D5C588;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  keyForStrings(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v3 = a1 + 48;
  objc_msgSend(*(id *)(v4 + 88), "objectForKeyedSubscript:", v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke_cold_1((uint64_t)v2, v3);

  }
}

- (id)homeScreenDescriptorForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXWidgetDescriptorCache homeScreenDescriptorForContainerBundleId:widgetKind:](self, "homeScreenDescriptorForContainerBundleId:widgetKind:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)homeScreenDescriptorForExtensionBundleId:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ATXWidgetDescriptorCache homeScreenDescriptors](self, "homeScreenDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__ATXWidgetDescriptorCache_homeScreenDescriptorForExtensionBundleId_kind___block_invoke;
  v13[3] = &unk_1E4D5C5B0;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "bs_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __74__ATXWidgetDescriptorCache_homeScreenDescriptorForExtensionBundleId_kind___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_mergeNewDescriptorsWithCachedMetadataOnInternalQueue:(id)a3 descriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __objc2_class **v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  ATXWidgetDescriptorCacheMetadata *v23;
  void *v24;
  void *v25;
  ATXWidgetDescriptorCacheMetadata *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v10 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v10, "objectForKey:", CFSTR("dateOfFirstInstalledAvocado"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v10, "setObject:forKey:", v32, CFSTR("dateOfFirstInstalledAvocado"));
  v29 = v10;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v15 = off_1E4D54000;
    v30 = *(_QWORD *)v36;
    v31 = v6;
    do
    {
      v16 = 0;
      v33 = v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1A85A4F90]();
        v19 = (void *)objc_msgSend(objc_alloc(v15[124]), "initWithDescriptor:", v17);
        objc_msgSend(v6, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v19);
        }
        else
        {
          v21 = v8;
          __atxlog_handle_default();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v40 = "-[ATXWidgetDescriptorCache _mergeNewDescriptorsWithCachedMetadataOnInternalQueue:descriptors:]";
            v41 = 2112;
            v42 = v17;
            _os_log_impl(&dword_1A49EF000, v22, OS_LOG_TYPE_DEFAULT, "%s: added new widget descriptor to cache: %@", buf, 0x16u);
          }

          v23 = [ATXWidgetDescriptorCacheMetadata alloc];
          objc_msgSend(v17, "extensionIdentity");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "containerBundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v23, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v32, v25, objc_msgSend(v17, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v17, "atx_hasAccessoryWidgetFamiliesOnly"));
          v8 = v21;
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, v19);

          v14 = v30;
          v6 = v31;
          v15 = off_1E4D54000;
          v13 = v33;
        }

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v13);
  }

  v27 = (void *)objc_msgSend(v8, "copy");
  return v27;
}

- (id)_updateAllDescriptorMetadataOnInternalQueue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  NSString *legacyCachePath;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:](self, "_queue_fetchAllDescriptorMetadataWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetDescriptorCache _queue_allVisibleDescriptors](self, "_queue_allVisibleDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetDescriptorCache _mergeNewDescriptorsWithCachedMetadataOnInternalQueue:descriptors:](self, "_mergeNewDescriptorsWithCachedMetadataOnInternalQueue:descriptors:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", self->_legacyCachePath);

  if (!objc_msgSend(v4, "isEqualToDictionary:", v6) || v8)
  {
    v30 = 0;
    v9 = -[ATXWidgetDescriptorCache _queue_writeAllDescriptorMetadata:error:](self, "_queue_writeAllDescriptorMetadata:error:", v6, &v30);
    v10 = v30;
    if (v9)
    {
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      legacyCachePath = self->_legacyCachePath;
      v29 = v10;
      v13 = objc_msgSend(v11, "removeItemAtPath:error:", legacyCachePath, &v29);
      v14 = v29;

      if ((v13 & 1) != 0)
      {
        v10 = v14;
        goto LABEL_13;
      }
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXWidgetDescriptorCache _updateAllDescriptorMetadataOnInternalQueue].cold.1((uint64_t)v14, v15, v22, v23, v24, v25, v26, v27);
      v10 = v14;
    }
    else
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXWidgetDescriptorCache _updateAllDescriptorMetadataOnInternalQueue].cold.2((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_13;
  }
LABEL_14:

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (id)fetchAccessoryWidgetDescriptorMetadataWithError:(id *)a3
{
  NSObject *internalQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ATXWidgetDescriptorCache_fetchAccessoryWidgetDescriptorMetadataWithError___block_invoke;
  block[3] = &unk_1E4D5C5D8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __76__ATXWidgetDescriptorCache_fetchAccessoryWidgetDescriptorMetadataWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)fetchHomeScreenWidgetDescriptorMetadataWithError:(id *)a3
{
  NSObject *internalQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ATXWidgetDescriptorCache_fetchHomeScreenWidgetDescriptorMetadataWithError___block_invoke;
  block[3] = &unk_1E4D5C5D8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __77__ATXWidgetDescriptorCache_fetchHomeScreenWidgetDescriptorMetadataWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v5 = (void *)MEMORY[0x1A85A4F90](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v11 = 0;
  -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:](self, "_queue_fetchAllDescriptorMetadataWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  objc_msgSend(v6, "keysOfEntriesPassingTest:", &__block_literal_global_36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsForKeys:", v9);
  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t __92__ATXWidgetDescriptorCache__fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hasHomeScreenWidgetFamiliesOnly");
}

- (id)_fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v5 = (void *)MEMORY[0x1A85A4F90](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v11 = 0;
  -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:](self, "_queue_fetchAllDescriptorMetadataWithError:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  objc_msgSend(v6, "keysOfEntriesPassingTest:", &__block_literal_global_37_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsForKeys:", v9);
  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t __93__ATXWidgetDescriptorCache__fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hasAccessoryWidgetFamiliesOnly");
}

- (id)_queue_fetchAllDescriptorMetadataWithError:(id *)a3
{
  id v5;
  NSString *cachePath;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  ATXWidgetDescriptorCache *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSSet *allDescriptors;
  void *v22;
  ATXWidgetDescriptorCacheMetadata *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  ATXWidgetDescriptorCacheMetadata *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  ATXWidgetDescriptorCache *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = objc_alloc(MEMORY[0x1E0CF94C0]);
  cachePath = self->_cachePath;
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCacheFilePath:loggingHandle:debugName:", cachePath, v7, CFSTR("widget descriptor metadata"));

  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
  v63 = 0;
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v12, &v63, -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v63;
  if (objc_msgSend(v13, "count"))
  {
    v44 = v14;
    v46 = v12;
    v47 = v8;
    v52 = (id)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v45 = v13;
    v15 = v13;
    v54 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v54)
    {
      v16 = self;
      v53 = *(_QWORD *)v59;
      v50 = v15;
      v51 = self;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v59 != v53)
            objc_enumerationMutation(v15);
          v18 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v15, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          allDescriptors = v16->_allDescriptors;
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __71__ATXWidgetDescriptorCache__queue_fetchAllDescriptorMetadataWithError___block_invoke;
          v57[3] = &unk_1E4D5C640;
          v57[4] = v18;
          -[NSSet bs_firstObjectPassingTest:](allDescriptors, "bs_firstObjectPassingTest:", v57);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v55 = v19;
            v23 = [ATXWidgetDescriptorCacheMetadata alloc];
            v56 = v20;
            objc_msgSend(v20, "installDate");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = (uint64_t)v24;
            if (!v24)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v25 = objc_claimAutoreleasedReturnValue();
              v49 = (void *)v25;
            }
            objc_msgSend(v22, "extensionIdentity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "containerBundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (uint64_t)v27;
            if (!v27)
            {
              objc_msgSend(v56, "containerBundleId");
              v28 = objc_claimAutoreleasedReturnValue();
              v48 = (void *)v28;
            }
            v29 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v23, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v25, v28, objc_msgSend(v22, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v22, "atx_hasAccessoryWidgetFamiliesOnly"));
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v29, v18);

            if (!v27)
            if (!v24)

            v15 = v50;
            v16 = v51;
            v19 = v55;
            v20 = v56;
          }
          else
          {
            __atxlog_handle_default();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v65 = "-[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:]";
              v66 = 2112;
              v67 = v18;
              _os_log_impl(&dword_1A49EF000, v24, OS_LOG_TYPE_DEFAULT, "%s: could not find descriptor matching %@ that was present in cached metadata", buf, 0x16u);
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v54 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v54);
    }

    v12 = v46;
    v8 = v47;
    v14 = v44;
    v13 = v45;
  }
  else if (self->_legacyCachePath
         && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
             v30 = (void *)objc_claimAutoreleasedReturnValue(),
             v31 = objc_msgSend(v30, "fileExistsAtPath:", self->_legacyCachePath),
             v30,
             (v31 & 1) != 0))
  {
    v62 = 0;
    -[ATXWidgetDescriptorCache _queue_fetchAllLegacyDescriptorMetadataWithError:](self, "_queue_fetchAllLegacyDescriptorMetadataWithError:", &v62);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v62;
    if (objc_msgSend(v32, "count"))
    {
      v52 = v32;
    }
    else
    {
      __atxlog_handle_default();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:].cold.2((uint64_t)v33, (uint64_t)v14, v41);

      if (a3)
      {
        if (v33)
          v42 = v33;
        else
          v42 = v14;
        v52 = 0;
        *a3 = objc_retainAutorelease(v42);
      }
      else
      {
        v52 = 0;
      }
    }

  }
  else
  {
    __atxlog_handle_default();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:].cold.1((uint64_t)v14, v34, v35, v36, v37, v38, v39, v40);

    v52 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
  }

  return v52;
}

uint64_t __71__ATXWidgetDescriptorCache__queue_fetchAllDescriptorMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ATXWidgetPersonality *v5;
  uint64_t v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v5 = -[ATXWidgetPersonality initWithDescriptor:]([ATXWidgetPersonality alloc], "initWithDescriptor:", v3);
  v6 = -[ATXWidgetPersonality isEqual:](v5, "isEqual:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (BOOL)_queue_writeAllDescriptorMetadata:(id)a3 error:(id *)a4
{
  NSObject *internalQueue;
  id v7;
  id v8;
  NSString *cachePath;
  void *v10;
  void *v11;

  internalQueue = self->_internalQueue;
  v7 = a3;
  dispatch_assert_queue_V2(internalQueue);
  v8 = objc_alloc(MEMORY[0x1E0CF94C0]);
  cachePath = self->_cachePath;
  __atxlog_handle_default();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithCacheFilePath:loggingHandle:debugName:", cachePath, v10, CFSTR("widget descriptor metadata"));

  LOBYTE(a4) = objc_msgSend(v11, "storeSecureCodedObject:error:", v7, a4);
  return (char)a4;
}

- (id)_queue_fetchAllLegacyDescriptorMetadataWithError:(id *)a3
{
  id v5;
  NSString *legacyCachePath;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSSet *allDescriptors;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  ATXWidgetPersonality *v32;
  ATXWidgetDescriptorCacheMetadata *v33;
  void *v34;
  void *v35;
  ATXWidgetDescriptorCacheMetadata *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  ATXWidgetDescriptorCache *v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = objc_alloc(MEMORY[0x1E0CF94C0]);
  v52 = self;
  legacyCachePath = self->_legacyCachePath;
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithCacheFilePath:loggingHandle:debugName:", legacyCachePath, v7, CFSTR("legacy widget descriptor metadata"));

  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
  objc_msgSend(v8, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v14, a3, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v50 = (id)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v16 = v15;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v17)
    {
      v18 = v17;
      v45 = v15;
      v46 = v14;
      v47 = v8;
      v19 = *(_QWORD *)v56;
      v48 = *(_QWORD *)v56;
      v49 = v16;
      while (1)
      {
        v20 = 0;
        v51 = v18;
        do
        {
          if (*(_QWORD *)v56 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1A85A4F90]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = v21;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_19;
            extensionBundleIdAndKindKey(v21);
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          allDescriptors = v52->_allDescriptors;
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __77__ATXWidgetDescriptorCache__queue_fetchAllLegacyDescriptorMetadataWithError___block_invoke;
          v53[3] = &unk_1E4D5C640;
          v25 = v23;
          v54 = v25;
          -[NSSet bs_firstObjectPassingTest:](allDescriptors, "bs_firstObjectPassingTest:", v53);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v21);
            v27 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("installDate"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28)
            {
              v30 = v28;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v30 = (id)objc_claimAutoreleasedReturnValue();
            }
            v31 = v30;

            v32 = -[ATXWidgetPersonality initWithDescriptor:]([ATXWidgetPersonality alloc], "initWithDescriptor:", v26);
            v33 = [ATXWidgetDescriptorCacheMetadata alloc];
            objc_msgSend(v26, "extensionIdentity");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "containerBundleIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v33, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v31, v35, objc_msgSend(v26, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v26, "atx_hasAccessoryWidgetFamiliesOnly"));
            objc_msgSend(v50, "setObject:forKeyedSubscript:", v36, v32);

            v19 = v48;
            v16 = v49;
            v18 = v51;
          }
          else
          {
            __atxlog_handle_default();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "-[ATXWidgetDescriptorCache _queue_fetchAllLegacyDescriptorMetadataWithError:]";
              v61 = 2112;
              v62 = v21;
              _os_log_impl(&dword_1A49EF000, v27, OS_LOG_TYPE_DEFAULT, "%s: could not find descriptor matching %@ that was present in cached metadata", buf, 0x16u);
            }
          }

LABEL_19:
          objc_autoreleasePoolPop(v22);
          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (!v18)
        {
          v14 = v46;
          v8 = v47;
          v15 = v45;
          break;
        }
      }
    }
  }
  else
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXWidgetDescriptorCache _queue_fetchAllLegacyDescriptorMetadataWithError:].cold.1(v16, v37, v38, v39, v40, v41, v42, v43);
    v50 = 0;
  }

  return v50;
}

uint64_t __77__ATXWidgetDescriptorCache__queue_fetchAllLegacyDescriptorMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  extensionBundleIdAndKindKey(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void)_updateDescriptorMappings
{
  ATXWidgetDescriptorCache *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  __CFString *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  NSDictionary *intentToHomeScreenDescriptorDictionary;
  id v30;
  NSDictionary *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSDictionary *containerBundleIdAndKindToHomeScreenDescriptorDictionary;
  NSObject *v45;
  void *v46;
  ATXWidgetDescriptorCache *v47;
  NSDictionary *v48;
  id obj;
  id v50;
  NSObject *v51;
  _QWORD block[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[128];
  uint64_t v58;

  v2 = self;
  v58 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[ATXWidgetDescriptorCache _updateAllDescriptorMetadataOnInternalQueue](v2, "_updateAllDescriptorMetadataOnInternalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if ((v2->_coalescedDescriptorUpdateOptions & 1) != 0)
  {
    v46 = (void *)v3;
    v47 = v2;
    -[ATXWidgetDescriptorCache _queue_homeScreenWidgetDescriptors](v2, "_queue_homeScreenWidgetDescriptors");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v48 = (NSDictionary *)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v10 = CFSTR(".");
      v11 = CFSTR("appintent:");
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v13, "intentType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsSeparatedByString:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "hasPrefix:", v11))
          {
            objc_msgSend(v17, "substringFromIndex:", -[__CFString length](v11, "length"));
            v18 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v18;
          }
          objc_msgSend(v13, "extensionIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "containerBundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            v21 = v17 == 0;
          else
            v21 = 1;
          if (!v21)
          {
            objc_msgSend(v13, "extensionIdentity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "containerBundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            keyForStrings(v23, v17);
            v50 = v14;
            v24 = v8;
            v25 = v9;
            v26 = v11;
            v27 = v10;
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v13, v28);
            v10 = v27;
            v11 = v26;
            v9 = v25;
            v8 = v24;
            v14 = v50;
          }

          objc_autoreleasePoolPop(v14);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      }
      while (v8);
    }

    intentToHomeScreenDescriptorDictionary = v47->_intentToHomeScreenDescriptorDictionary;
    v47->_intentToHomeScreenDescriptorDictionary = v48;

    v30 = obj;
    v31 = (NSDictionary *)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v51 = v30;
    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v54 != v34)
            objc_enumerationMutation(v51);
          v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          v37 = (void *)MEMORY[0x1A85A4F90]();
          objc_msgSend(v36, "extensionIdentity");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "containerBundleIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v36, "extensionIdentity");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "containerBundleIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "kind");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            keyForStrings(v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v36, v43);
          }
          objc_autoreleasePoolPop(v37);
        }
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      }
      while (v33);
    }
    v5 = v51;

    v2 = v47;
    containerBundleIdAndKindToHomeScreenDescriptorDictionary = v47->_containerBundleIdAndKindToHomeScreenDescriptorDictionary;
    v47->_containerBundleIdAndKindToHomeScreenDescriptorDictionary = v31;

    v4 = v46;
    if (v46 && v51)
    {
      dispatch_get_global_queue(17, 0);
      v45 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__ATXWidgetDescriptorCache__updateDescriptorMappings__block_invoke;
      block[3] = &unk_1E4D57590;
      block[4] = v47;
      dispatch_async(v45, block);

    }
  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXWidgetDescriptorCache: home screen descriptors did not change", buf, 2u);
    }
  }

  v2->_coalescedDescriptorUpdateOptions = 0;
}

void __53__ATXWidgetDescriptorCache__updateDescriptorMappings__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ATXHomeScreenWidgetDescriptorCacheRefresh"), *(_QWORD *)(a1 + 32));

}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ATXWidgetDescriptorCache_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __70__ATXWidgetDescriptorCache_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_descriptorsDidChangeForDescriptorProvider:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_descriptorsDidChangeForDescriptorProvider:(id)a3
{
  NSObject *internalQueue;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSSet *v10;
  NSSet *allDescriptors;
  NSSet *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSUInteger v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *observerQueue;
  id v25;
  _QWORD v26[4];
  id v27;
  ATXWidgetDescriptorCache *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  NSUInteger v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  -[ATXWidgetDescriptorCache _queue_homeScreenWidgetDescriptors](self, "_queue_homeScreenWidgetDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v5, "descriptors");
  v10 = (NSSet *)objc_claimAutoreleasedReturnValue();

  allDescriptors = self->_allDescriptors;
  self->_allDescriptors = v10;

  v12 = self->_allDescriptors;
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14)
      goto LABEL_10;
    v15 = -[NSSet count](self->_allDescriptors, "count");
    *(_DWORD *)buf = 136315394;
    v30 = "-[ATXWidgetDescriptorCache _queue_descriptorsDidChangeForDescriptorProvider:]";
    v31 = 2048;
    v32 = v15;
    v16 = "%s, descriptor count: %ld";
    v17 = v13;
    v18 = 22;
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v30 = "-[ATXWidgetDescriptorCache _queue_descriptorsDidChangeForDescriptorProvider:]";
    v16 = "%s, nil descriptors provided";
    v17 = v13;
    v18 = 12;
  }
  _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_10:

  -[ATXWidgetDescriptorCache _queue_homeScreenWidgetDescriptors](self, "_queue_homeScreenWidgetDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = (id)objc_opt_new();
  v22 = v21;

  if ((objc_msgSend(v22, "isEqualToSet:", v9) & 1) == 0)
    self->_coalescedDescriptorUpdateOptions |= 1uLL;
  -[ATXWidgetDescriptorCache _scheduleCoalescedDescriptorUpdateOperation](self, "_scheduleCoalescedDescriptorUpdateOperation");
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__ATXWidgetDescriptorCache__queue_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v26[3] = &unk_1E4D57258;
  v27 = v23;
  v28 = self;
  v25 = v23;
  dispatch_async(observerQueue, v26);

}

void __77__ATXWidgetDescriptorCache__queue_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "widgetDescriptorCacheDidUpdateDescriptors:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdAndKindToHomeScreenDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_intentToHomeScreenDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_allDescriptors, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_coalescedDescriptorUpdateOperation, 0);
  objc_storeStrong((id *)&self->_legacyCachePath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXWidgetDescriptorCache: couldn't perform update operation because swelf is nil", v1, 2u);
}

- (void)homeScreenDescriptorForIntent:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2[3];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_6();
  v3 = v0;
  _os_log_error_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_ERROR, "%s, intent has no launchId: %@", (uint8_t *)v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)a2 + 80), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v3, v4, "%s, key (%@) not present in dictionary: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_5();
}

void __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)a2 + 88), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_4(&dword_1A49EF000, v3, v4, "%s, key (%@) not present in dictionary: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_5();
}

- (void)_updateAllDescriptorMetadataOnInternalQueue
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not write descriptor metadata cache: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_fetchAllDescriptorMetadataWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "ATXWidgetDescriptorCache: Error unarchiving data and no migration is necessary: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_fetchAllDescriptorMetadataWithError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
    a2 = a1;
  v4 = 138412290;
  v5 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXWidgetDescriptorCache: Error unarchiving data during migration: %@", (uint8_t *)&v4, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_fetchAllLegacyDescriptorMetadataWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: Error unarchiving data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
