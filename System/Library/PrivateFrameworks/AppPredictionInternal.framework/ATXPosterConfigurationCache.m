@implementation ATXPosterConfigurationCache

+ (ATXPosterConfigurationCache)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_171);
  return (ATXPosterConfigurationCache *)(id)sharedInstance_cache_0;
}

void __45__ATXPosterConfigurationCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_cache_0;
  sharedInstance_cache_0 = v0;

}

- (ATXPosterConfigurationCache)init
{
  void *v3;
  ATXPosterConfigurationCache *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "posterConfigurationCacheFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXPosterConfigurationCache initWithPath:](self, "initWithPath:", v3);

  return v4;
}

- (ATXPosterConfigurationCache)initWithPath:(id)a3
{
  id v4;
  ATXPosterConfigurationCache *v5;
  id v6;
  void *v7;
  uint64_t v8;
  ATXGenericFileBasedCache *fileCache;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *outputQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPosterConfigurationCache;
  v5 = -[ATXPosterConfigurationCache init](&v18, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_alloc(MEMORY[0x1E0CF94C0]);
      __atxlog_handle_lock_screen();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithCacheFilePath:loggingHandle:debugName:", v4, v7, CFSTR("Poster configuration cache"));
      fileCache = v5->_fileCache;
      v5->_fileCache = (ATXGenericFileBasedCache *)v8;

    }
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.proactive.ATXPosterConfigurationCache.Output", v14);
    outputQueue = v5->_outputQueue;
    v5->_outputQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (NSArray)configurations
{
  _PASLock *lock;
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
  v9 = __Block_byref_object_copy__78;
  v10 = __Block_byref_object_dispose__78;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ATXPosterConfigurationCache_configurations__block_invoke;
  v5[3] = &unk_1E82E7188;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__ATXPosterConfigurationCache_configurations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = (void *)v4[1];
  v8 = objc_msgSend(v7, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)updateConfigurations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke;
  v11[3] = &unk_1E82E71D8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

void __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke(id *a1, void *a2)
{
  id *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v3 = a2;
  objc_msgSend(a1[4], "_fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v6 = (void *)*((_QWORD *)a1[4] + 1);
  v22 = 0;
  objc_msgSend(v6, "storeSecureCodedObject:error:", v5, &v22);
  v7 = v22;
  objc_storeStrong(v3 + 1, a1[5]);
  if (objc_msgSend(a1[5], "count"))
    objc_msgSend(a1[4], "_updateLastActiveDatesWithConfigurations:", a1[5]);
  v8 = (void *)objc_msgSend(v3[2], "copy");
  v9 = (void *)objc_msgSend(a1[5], "copy");
  v10 = *((_QWORD *)a1[4] + 3);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke_2;
  v16[3] = &unk_1E82E71B0;
  v11 = a1[6];
  v20 = v4;
  v21 = v11;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v12 = v4;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(v10, v16);

}

void __63__ATXPosterConfigurationCache_updateConfigurations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
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
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(a1 + 40);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "configurationCacheDidUpdateWithNewConfigurations:oldConfigurations:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_fetchConfigurationsReadingFromCacheIfNecessaryWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  ATXGenericFileBasedCache *fileCache;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)v4[1];
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    fileCache = self->_fileCache;
    v8 = (void *)MEMORY[0x1CAA48B6C]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:](fileCache, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v11, 0, 2419200.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ATXPosterConfigurationCache_registerObserver___block_invoke;
  v7[3] = &unk_1E82E7200;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __48__ATXPosterConfigurationCache_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATXPosterConfigurationCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E82E7200;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __50__ATXPosterConfigurationCache_unregisterObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_updateLastActiveDatesWithConfigurations:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v34 = v3;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_25_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v35 = *MEMORY[0x1E0CF95E8];
  v36 = v8;
  objc_msgSend(v8, "dictionaryForKey:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, -7, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v13, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v16, "compare:", v23);
        if (objc_msgSend(v6, "containsObject:", v22))
          v25 = v24 == -1;
        else
          v25 = 0;
        if (!v25)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v19);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = v34;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (objc_msgSend(v31, "isActive"))
        {
          v32 = (void *)objc_opt_new();
          objc_msgSend(v31, "posterUUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, v33);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v28);
  }

  objc_msgSend(v36, "setObject:forKey:", v13, v35);
}

uint64_t __72__ATXPosterConfigurationCache__updateLastActiveDatesWithConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterUUID");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fileCache, 0);
}

@end
