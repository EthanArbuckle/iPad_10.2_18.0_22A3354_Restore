@implementation ATStatusMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global);
  return (id)sharedMonitor___sharedMonitor;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *statusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ATStatusMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(statusQueue, v7);

}

uint64_t __31__ATStatusMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "Added observer %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
            objc_msgSend(*(id *)(a1 + 40), "monitor:didUpdateWithStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
    return objc_msgSend(*(id *)(a1 + 40), "connection:updatedProgress:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), (_QWORD)v10);
  }
  return result;
}

- (void)setDataClasses:(id)a3 forObserver:(id)a4
{
  id v6;
  id v7;
  NSObject *statusQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATStatusMonitor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATStatusMonitor_setDataClasses_forObserver___block_invoke;
  block[3] = &unk_1E928CD38;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(statusQueue, block);

}

void __46__ATStatusMonitor_setDataClasses_forObserver___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *(void **)(a1[5] + 24);
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[ATAssetLinkController sharedInstance](ATAssetLinkController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (void *)a1[4];
        objc_msgSend(v11, "dataclass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "containsObject:", v13);

        if ((_DWORD)v12)
          objc_msgSend(v4, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)a1[6];
  objc_msgSend(v4, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connection:updatedAssets:", 0, v15);

}

- (ATStatusMonitor)init
{
  ATStatusMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *statusQueue;
  uint64_t v5;
  NSHashTable *statusObservers;
  uint64_t v7;
  NSMapTable *observerDataClasses;
  NSMutableSet *v9;
  NSMutableSet *statuses;
  id v11;
  uint64_t v12;
  NSMutableDictionary *statusDictionary;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ATStatusMonitor;
  v2 = -[ATStatusMonitor init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.airtraffic.statusmonitor", 0);
    statusQueue = v2->_statusQueue;
    v2->_statusQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    statusObservers = v2->_statusObservers;
    v2->_statusObservers = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observerDataClasses = v2->_observerDataClasses;
    v2->_observerDataClasses = (NSMapTable *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    statuses = v2->_statuses;
    v2->_statuses = v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E08]);
    v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AA60], CFSTR("ConnectedLibraries"), MEMORY[0x1E0C9AAA0], CFSTR("Enabled"), MEMORY[0x1E0C9AAA0], CFSTR("Wireless"), MEMORY[0x1E0C9AAA0], CFSTR("AutoSync"), &unk_1E9293678, CFSTR("SyncStage"), 0);
    statusDictionary = v2->_statusDictionary;
    v2->_statusDictionary = (NSMutableDictionary *)v12;

  }
  return v2;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *statusQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATStatusMonitor *v9;

  v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__ATStatusMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(statusQueue, v7);

}

- (id)allStatus
{
  return (id)-[NSMutableSet copy](self->_statuses, "copy");
}

- (void)updateStatus:(id)a3
{
  id v4;
  NSObject *statusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ATStatusMonitor_updateStatus___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(statusQueue, v7);

}

- (void)updateAssets:(id)a3
{
  id v4;
  NSObject *statusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ATStatusMonitor_updateAssets___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(statusQueue, v7);

}

- (void)updateStatusWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *statusQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ATStatusMonitor_updateStatusWithValue_forKey___block_invoke;
  block[3] = &unk_1E928CD38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(statusQueue, block);

}

- (void)updateStatusValuesWithDictionary:(id)a3
{
  id v4;
  NSObject *statusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ATStatusMonitor_updateStatusValuesWithDictionary___block_invoke;
  v7[3] = &unk_1E928CDD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(statusQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDictionary, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_observerDataClasses, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
}

void __52__ATStatusMonitor_updateStatusValuesWithDictionary___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "connection:updatedProgress:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __48__ATStatusMonitor_updateStatusWithValue_forKey___block_invoke(_QWORD *a1)
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
  objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKey:", a1[5], a1[6]);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1[4] + 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "connection:updatedProgress:", 0, *(_QWORD *)(a1[4] + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __32__ATStatusMonitor_updateAssets___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  int v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v15 = v1;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "objectForKey:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v17 = v3;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v6 = *(id *)(v1 + 40);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v20 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                objc_msgSend(v11, "dataclass");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v4, "containsObject:", v12);

                if (v13)
                  objc_msgSend(v5, "addObject:", v11);
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v8);
          }

          if (objc_msgSend(v5, "count"))
            objc_msgSend(v17, "connection:updatedAssets:", 0, v5);

          v1 = v15;
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

}

void __32__ATStatusMonitor_updateStatus___block_invoke(uint64_t a1)
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

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "syncStage"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
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
          objc_msgSend(v7, "monitor:didUpdateWithStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __34__ATStatusMonitor_removeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "Removed observer %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(a1 + 32));
}

void __32__ATStatusMonitor_sharedMonitor__block_invoke()
{
  ATStatusMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(ATStatusMonitor);
  v1 = (void *)sharedMonitor___sharedMonitor;
  sharedMonitor___sharedMonitor = (uint64_t)v0;

}

@end
