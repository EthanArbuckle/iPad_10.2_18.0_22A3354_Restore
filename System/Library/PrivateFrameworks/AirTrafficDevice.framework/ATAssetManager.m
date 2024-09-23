@implementation ATAssetManager

- (ATAssetManager)init
{
  id v2;
  objc_class *v3;
  const char *Name;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ATAssetManager;
  v2 = -[ATAssetManager init](&v18, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_create(Name, 0);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v7;

    objc_msgSend(v2, "_loadAssetClients");
    objc_msgSend(v2, "reset");
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v2);

    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0x1EuLL, 0, v10);
    v12 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v11;

    objc_initWeak(&location, v2);
    v13 = *((_QWORD *)v2 + 14);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __22__ATAssetManager_init__block_invoke;
    v15[3] = &unk_1E927DA78;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 14));
    signal(30, (void (__cdecl *)(int))1);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (ATAssetManager *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_signalSource);
  v3.receiver = self;
  v3.super_class = (Class)ATAssetManager;
  -[ATAssetManager dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  NSMutableSet *v3;
  NSMutableSet *allAssets;
  NSMutableDictionary *v5;
  NSMutableDictionary *remainingAssetsByDataClass;
  NSMutableDictionary *v7;
  NSMutableDictionary *totalAssetCountByDataClass;
  NSMutableArray *v9;
  NSMutableArray *assets;
  NSMutableDictionary *v11;
  NSMutableDictionary *assetsByDataclass;
  NSMutableDictionary *v13;
  NSMutableDictionary *assetsByStoreID;
  NSMutableArray *v15;
  NSMutableArray *completedStoreAssets;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  allAssets = self->_allAssets;
  self->_allAssets = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  remainingAssetsByDataClass = self->_remainingAssetsByDataClass;
  self->_remainingAssetsByDataClass = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  totalAssetCountByDataClass = self->_totalAssetCountByDataClass;
  self->_totalAssetCountByDataClass = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  assets = self->_assets;
  self->_assets = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  assetsByDataclass = self->_assetsByDataclass;
  self->_assetsByDataclass = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  assetsByStoreID = self->_assetsByStoreID;
  self->_assetsByStoreID = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  completedStoreAssets = self->_completedStoreAssets;
  self->_completedStoreAssets = v15;

  self->_completedAssets = 0;
  self->_totalAssetCount = 0;
}

- (id)legacyAssetsForDataClass:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
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
  v15 = __Block_byref_object_copy__937;
  v16 = __Block_byref_object_dispose__938;
  v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__ATAssetManager_legacyAssetsForDataClass___block_invoke;
  v9[3] = &unk_1E927D590;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)enqueueLegacyAssetsForDataClass:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  ATAssetManager *v11;
  id v12;

  v4 = a3;
  -[ATAssetManager legacyAssetsForDataClass:](self, "legacyAssetsForDataClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke;
  block[3] = &unk_1E927E198;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync(queue, block);

}

- (void)prioritizeAssetForDataClass:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATAssetManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ATAssetManager_prioritizeAssetForDataClass_withIdentifier___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)cancelAssetForDataClass:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ATAssetManager_cancelAssetForDataClass_withIdentifier___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ATAssetManager_addObserver___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ATAssetManager_removeObserver___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)totalAssetCount
{
  return -[NSMutableSet count](self->_allAssets, "count");
}

- (id)assetProgressForAllDataclasses
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_totalAssetCountByDataClass, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_totalAssetCountByDataClass;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0C99D80];
          -[NSMutableDictionary objectForKey:](self->_totalAssetCountByDataClass, "objectForKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[ATAssetManager currentAssetForDataclass:](self, "currentAssetForDataclass:", v9));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, CFSTR("AssetCount"), v14, CFSTR("CurrentAssetNum"), 0, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v15, v9);

        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_loadAssetClients
{
  NSDictionary *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *legacyAssetClients;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_legacyAssetClients)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allClients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "supportedDataclasses");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndex:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSDictionary setObject:forKey:](v2, "setObject:forKey:", v9, v11);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    legacyAssetClients = self->_legacyAssetClients;
    self->_legacyAssetClients = v2;

  }
}

- (void)_addAssets:(id)a3 forDataClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *totalAssetCountByDataClass;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  ATAssetManager *v20;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "addObjectsFromArray:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_remainingAssetsByDataClass, "setObject:forKey:", v9, v7);
  }
  -[NSMutableSet addObjectsFromArray:](self->_allAssets, "addObjectsFromArray:", v6);
  -[NSMutableDictionary objectForKey:](self->_totalAssetCountByDataClass, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  v12 = objc_msgSend(v6, "count") + v11;
  totalAssetCountByDataClass = self->_totalAssetCountByDataClass;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](totalAssetCountByDataClass, "setObject:forKey:", v14, v7);

  v15 = (void *)-[NSHashTable copy](self->_observers, "copy");
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__ATAssetManager__addAssets_forDataClass___block_invoke;
  v18[3] = &unk_1E927E148;
  v19 = v15;
  v20 = self;
  v17 = v15;
  dispatch_async(v16, v18);

}

- (void)_finishAsset:(id)a3 forDataClass:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  ATAssetManager *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = -[ATAssetManager currentAssetForDataclass:](self, "currentAssetForDataclass:", v7);
    v26 = 2048;
    v27 = -[ATAssetManager totalAssetCountForDataclass:](self, "totalAssetCountForDataclass:", v7);
    v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "finished asset %lu/%lu for %{public}@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installCompleteForAssets:", v10);

  -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_allAssets, "removeObject:", v6);
  v12 = (void *)-[NSHashTable copy](self->_observers, "copy");
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __44__ATAssetManager__finishAsset_forDataClass___block_invoke;
  v19 = &unk_1E927E198;
  v20 = v12;
  v21 = self;
  v22 = v6;
  v14 = v6;
  v15 = v12;
  dispatch_async(v13, &v16);

  -[ATAssetManager _finishDataClassIfDone:](self, "_finishDataClassIfDone:", v7, v16, v17, v18, v19);
}

- (void)_finishDataClassIfDone:(id)a3
{
  NSObject *v4;
  NSMutableSet *allAssets;
  int v6;
  NSMutableSet *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_allAssets, "count", a3))
  {
    if ((unint64_t)-[NSMutableSet count](self->_allAssets, "count") <= 5)
    {
      _ATLogCategoryFramework();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        allAssets = self->_allAssets;
        v6 = 138543362;
        v7 = allAssets;
        _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "remaining assets: %{public}@", (uint8_t *)&v6, 0xCu);
      }

    }
  }
  else
  {
    -[ATAssetManager reset](self, "reset");
  }
}

- (void)_updateAsset:(id)a3 withProgress:(float)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ATAssetManager *v13;
  id v14;
  float v15;

  v6 = a3;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__ATAssetManager__updateAsset_withProgress___block_invoke;
  v11[3] = &unk_1E927CB60;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v15 = a4;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (id)_assetForDataclass:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_dumpStatusInformation
{
  NSObject *v3;
  NSMutableArray *assets;
  NSMutableArray *completedStoreAssets;
  int v6;
  NSMutableArray *v7;
  __int16 v8;
  NSMutableArray *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    assets = self->_assets;
    completedStoreAssets = self->_completedStoreAssets;
    v6 = 138543618;
    v7 = assets;
    v8 = 2114;
    v9 = completedStoreAssets;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_INFO, "SIGUSR1 (assets): %{public}@\n (completed store):%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (unint64_t)totalAssetCountForDataclass:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_totalAssetCountByDataClass, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unint64_t)currentAsset
{
  return self->_completedAssets + 1;
}

- (unint64_t)currentAssetForDataclass:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[ATAssetManager totalAssetCountForDataclass:](self, "totalAssetCountForDataclass:", v4);
  -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5 - objc_msgSend(v6, "count") + 1;
  return v7;
}

- (unint64_t)awaitingStoreCompletion
{
  return -[NSMutableArray count](self->_completedStoreAssets, "count");
}

- (void)mapStoreIDToAsset:(id)a3
{
  NSMutableDictionary *assetsByStoreID;
  void *v4;
  id v5;
  id v6;

  assetsByStoreID = self->_assetsByStoreID;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "storePID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](assetsByStoreID, "setObject:forKey:", v5, v6);

}

- (id)assetForStoreID:(int64_t)a3
{
  NSMutableDictionary *assetsByStoreID;
  void *v4;
  void *v5;

  assetsByStoreID = self->_assetsByStoreID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](assetsByStoreID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)assetForDataclass:(id)a3 identifier:(id)a4
{
  NSMutableDictionary *assetsByDataclass;
  id v6;
  void *v7;
  void *v8;

  assetsByDataclass = self->_assetsByDataclass;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](assetsByDataclass, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)assets
{
  return (id)-[NSMutableArray mutableCopy](self->_assets, "mutableCopy");
}

- (id)allDataclasses
{
  return (id)-[NSMutableDictionary allKeys](self->_assetsByDataclass, "allKeys");
}

- (id)completedStoreAssets
{
  return self->_completedStoreAssets;
}

- (id)storeAssetsForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Application"), CFSTR("Book"), CFSTR("Media"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "isDownload")
            && (!objc_msgSend(v13, "bypassStore")
             || objc_msgSend(v13, "isRestore")
             && objc_msgSend(v4, "isEqualToString:", CFSTR("Media"))))
          {
            objc_msgSend(v5, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (id)restoreAssetsForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isRestore"))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)bypassedRestoresForDataclass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Media")))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isRestore"))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)assetsForDataclasses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)restoreAssetsForDataclasses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ATAssetManager restoreAssetsForDataclass:](self, "restoreAssetsForDataclass:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)remainingSyncAssetCountForDataClasses:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ATAssetManager *v18;
  const __CFString *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0x1E0C99000uLL;
    v8 = CFSTR("File");
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      v24 = v5;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:", CFSTR("Photo"), CFSTR("MessagePart"), CFSTR("Book"), CFSTR("VoiceMemo"), v8, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) != 0)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v15)
          {
            v16 = v15;
            v17 = v9;
            v18 = self;
            v19 = v8;
            v20 = v7;
            v21 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v27 != v21)
                  objc_enumerationMutation(v14);
                v6 += objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "isRestore") ^ 1;
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v16);
            v7 = v20;
            v8 = v19;
            self = v18;
            v9 = v17;
            v5 = v24;
          }
        }
        else
        {
          -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v14, "count");
        }

        ++v10;
      }
      while (v10 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)remainingRestoreAssetCountForDataClasses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
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

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              v7 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "isRestore");
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)totalAssetCountForDataClasses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_totalAssetCountByDataClass, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v10, "unsignedIntegerValue");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)completedAssetCountForDataClasses:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATAssetManager totalAssetCountForDataClasses:](self, "totalAssetCountForDataClasses:", v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 -= objc_msgSend(v11, "count");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)dataclassIsEmpty:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  BOOL v10;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v12, 0, sizeof(v12));
  v5 = self->_completedStoreAssets;
  if (-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v12, v13, 16))
  {
    objc_msgSend(**((id **)&v12[0] + 1), "dataclass", *(_QWORD *)&v12[0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    v8 = v7 ^ 1;
  }
  else
  {
    v8 = 1;
  }

  -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = 0;
  else
    v10 = v8;

  return v10;
}

- (BOOL)isEmpty
{
  return !-[NSMutableArray count](self->_assets, "count")
      && -[NSMutableArray count](self->_completedStoreAssets, "count") == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalSource, 0);
  objc_storeStrong((id *)&self->_completedStoreAssets, 0);
  objc_storeStrong((id *)&self->_assetsByStoreID, 0);
  objc_storeStrong((id *)&self->_assetsByDataclass, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_totalAssetCountByDataClass, 0);
  objc_storeStrong((id *)&self->_remainingAssetsByDataClass, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_legacyAssetClients, 0);
  objc_storeStrong((id *)&self->_assetClients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__ATAssetManager__updateAsset_withProgress___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 56);
          objc_msgSend(v7, "assetManager:didUpdateAsset:withProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, (_QWORD)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __44__ATAssetManager__finishAsset_forDataClass___block_invoke(uint64_t a1)
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
          objc_msgSend(v7, "assetManager:didFinishAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __42__ATAssetManager__addAssets_forDataClass___block_invoke(uint64_t a1)
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
          objc_msgSend(v7, "assetManagerDidUpdate:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __33__ATAssetManager_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__ATAssetManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
}

void __57__ATAssetManager_cancelAssetForDataClass_withIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_assetForDataclass:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v2 = objc_claimAutoreleasedReturnValue();
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cancelAssets:withCompletion:](v2, "cancelAssets:withCompletion:", v3, 0);

  }
  else
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_INFO, "not cancel asset because we couldn't find it", v4, 2u);
    }
  }

}

void __61__ATAssetManager_prioritizeAssetForDataClass_withIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "prioritizing asset %{public}@:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_assetForDataclass:withIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prioritizeAsset:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKey:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject prioritizeAsset:](v7, "prioritizeAsset:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _ATLogCategoryFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_INFO, "not prioritzing asset because we couldn't find it", (uint8_t *)&v8, 2u);
    }
  }

}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _ATLogCategoryFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "count");
      v4 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v34 = v3;
      v35 = 2114;
      v36 = v4;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "Got %lu assets from %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createAirlockForDataclasses:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v13) & 1) == 0)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_addAssets:forDataClass:", v7, *(_QWORD *)(a1 + 48));
      +[ATClientController sharedInstance](ATClientController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientForDataclass:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CF21D8], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_15;
      v25[3] = &unk_1E927D488;
      v26 = v15;
      v21[0] = v17;
      v21[1] = 3221225472;
      v21[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_3;
      v21[3] = &unk_1E927CB38;
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(a1 + 48);
      v22 = v26;
      v23 = v18;
      v24 = v19;
      v20 = v26;
      objc_msgSend(v16, "enqueueAssets:progress:completion:", v7, v25, v21);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_finishDataClassIfDone:", *(_QWORD *)(a1 + 48));
  }
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_15(uint64_t a1, void *a2, float a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  float v10;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_2;
    v7[3] = &unk_1E927E030;
    v8 = v6;
    v9 = v5;
    v10 = a3;
    dispatch_client_async(v8, v7);

  }
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_4;
    v8[3] = &unk_1E927D688;
    v9 = v3;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v10 = v5;
    v11 = v6;
    v12 = v7;
    dispatch_client_async(v4, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_finishAsset:forDataClass:", v3, *(_QWORD *)(a1 + 48));
  }

}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  if (!objc_msgSend(*(id *)(a1 + 32), "installStarted"))
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetTransfer:succeeded:withError:", v4, v5 == 0, v6);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "assetInstallSucceeded:", *(_QWORD *)(a1 + 32));
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v13 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v13, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "assetInstallFailed:withError:", v13, v5);
      goto LABEL_5;
    }
  }
LABEL_6:
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_5;
  block[3] = &unk_1E927E198;
  block[4] = v7;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 56);
  dispatch_async(v8, block);

}

uint64_t __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishAsset:forDataClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetTransfer:updatedProgress:", *(_QWORD *)(a1 + 40), *(float *)(a1 + 48));
}

void __43__ATAssetManager_legacyAssetsForDataClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientForDataclass:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "outstandingAssetTransfersWithDownloadManager:", 0);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v4;

      goto LABEL_10;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "outstandingAssetTransfers");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "No ATClient for asset dataClass %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
LABEL_10:

}

void __22__ATAssetManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dumpStatusInformation");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_946);
  return (id)sharedInstance___sharedAssetManager;
}

void __32__ATAssetManager_sharedInstance__block_invoke()
{
  ATAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(ATAssetManager);
  v1 = (void *)sharedInstance___sharedAssetManager;
  sharedInstance___sharedAssetManager = (uint64_t)v0;

}

@end
