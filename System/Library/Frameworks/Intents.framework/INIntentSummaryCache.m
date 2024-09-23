@implementation INIntentSummaryCache

- (INIntentSummaryCache)init
{
  INIntentSummaryCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *resourceAccessQueue;
  uint64_t v6;
  NSMutableDictionary *allBundlesCache;
  INIntentSummaryCache *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INIntentSummaryCache;
  v2 = -[INIntentSummaryCache init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.IntentsCore.summarycache", v3);
    resourceAccessQueue = v2->_resourceAccessQueue;
    v2->_resourceAccessQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    allBundlesCache = v2->_allBundlesCache;
    v2->_allBundlesCache = (NSMutableDictionary *)v6;

    -[INIntentSummaryCache startAutomaticInvalidation](v2, "startAutomaticInvalidation");
    v8 = v2;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[INIntentSummaryCache stopAutomaticInvalidation](self, "stopAutomaticInvalidation");
  v3.receiver = self;
  v3.super_class = (Class)INIntentSummaryCache;
  -[INIntentSummaryCache dealloc](&v3, sel_dealloc);
}

- (id)bundleCacheForBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__50154;
    v15 = __Block_byref_object_dispose__50155;
    v16 = 0;
    -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__INIntentSummaryCache_bundleCacheForBundleId___block_invoke;
    block[3] = &unk_1E228F728;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setBundleCache:(id)a3 forBundleId:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__INIntentSummaryCache_setBundleCache_forBundleId___block_invoke;
    block[3] = &unk_1E228DE38;
    block[4] = self;
    v10 = v6;
    v11 = v8;
    dispatch_sync(v7, block);

  }
}

- (id)cachedSummaryForIntent:(id)a3 languageCode:(id)a4 creatingIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  INIntentSummary *v16;
  INIntentSummary *v17;
  void *v18;
  id v20;

  v5 = a5;
  v8 = a3;
  v9 = (__CFString *)a4;
  if (!-[__CFString length](v9, "length"))
  {

    v9 = CFSTR("SystemLanguage");
  }
  objc_msgSend(v8, "launchId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  INExtractAppInfoFromSiriLaunchId(v10, &v20, 0);
  v11 = v20;

  if (objc_msgSend(v11, "length"))
  {
    v12 = v9;
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[INIntentSummaryCache bundleCacheForBundleId:](self, "bundleCacheForBundleId:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v14);
    v16 = (INIntentSummary *)objc_claimAutoreleasedReturnValue();
    if (!v16 && v5)
    {
      if (!v15)
      {
        v15 = (void *)objc_opt_new();
        -[INIntentSummaryCache setBundleCache:forBundleId:](self, "setBundleCache:forBundleId:", v15, v11);
      }
      v17 = [INIntentSummary alloc];
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[INIntentSummary initWithIntentIdentifier:originatingBundleId:languageCode:](v17, "initWithIntentIdentifier:originatingBundleId:languageCode:", v18, v11, v12);

      objc_msgSend(v15, "setObject:forKey:", v16, v14);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)getTitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v9 = a5;
  -[INIntentSummaryCache cachedSummaryForIntent:languageCode:creatingIfNeeded:](self, "cachedSummaryForIntent:languageCode:creatingIfNeeded:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__INIntentSummaryCache_getTitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E228D7D8;
  v15 = v10;
  v16 = &v18;
  v17 = a3;
  v12 = v10;
  dispatch_sync(v11, block);

  LOBYTE(v10) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

- (BOOL)getSubtitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v9 = a5;
  -[INIntentSummaryCache cachedSummaryForIntent:languageCode:creatingIfNeeded:](self, "cachedSummaryForIntent:languageCode:creatingIfNeeded:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__INIntentSummaryCache_getSubtitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E228D7D8;
  v15 = v10;
  v16 = &v18;
  v17 = a3;
  v12 = v10;
  dispatch_sync(v11, block);

  LOBYTE(v10) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

- (void)setTitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v8 = a3;
  -[INIntentSummaryCache cachedSummaryForIntent:languageCode:creatingIfNeeded:](self, "cachedSummaryForIntent:languageCode:creatingIfNeeded:", a4, a5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__INIntentSummaryCache_setTitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E2293C38;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

}

- (void)setSubtitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v8 = a3;
  -[INIntentSummaryCache cachedSummaryForIntent:languageCode:creatingIfNeeded:](self, "cachedSummaryForIntent:languageCode:creatingIfNeeded:", a4, a5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__INIntentSummaryCache_setSubtitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E2293C38;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

}

- (void)startAutomaticInvalidation
{
  -[INIntentSummaryCache startObservingApplicationWorkspaceChanges](self, "startObservingApplicationWorkspaceChanges");
  -[INIntentSummaryCache startObservingSystemLanguageChanges](self, "startObservingSystemLanguageChanges");
}

- (void)stopAutomaticInvalidation
{
  -[INIntentSummaryCache stopObservingApplicationWorkspaceChanges](self, "stopObservingApplicationWorkspaceChanges");
  -[INIntentSummaryCache stopObservingSystemLanguageChanges](self, "stopObservingSystemLanguageChanges");
}

- (void)startObservingApplicationWorkspaceChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)stopObservingApplicationWorkspaceChanges
{
  if (-[INIntentSummaryCache systemLanguageChangeNotificationToken](self, "systemLanguageChangeNotificationToken"))
    notify_cancel(-[INIntentSummaryCache systemLanguageChangeNotificationToken](self, "systemLanguageChangeNotificationToken"));
}

- (void)startObservingSystemLanguageChanges
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__INIntentSummaryCache_startObservingSystemLanguageChanges__block_invoke;
  v6[3] = &unk_1E228D6B8;
  objc_copyWeak(&v7, &location);
  v3 = (void *)MEMORY[0x18D7812C4](v6);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  notify_register_dispatch("com.apple.language.changed", &self->_systemLanguageChangeNotificationToken, v4, v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)stopObservingSystemLanguageChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)invalidateCache
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  -[INIntentSummaryCache resourceAccessQueue](self, "resourceAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__INIntentSummaryCache_invalidateCache__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_sync(v3, block);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.IntentsCore.summarycache.invalidation"), self);

}

- (void)invalidateCacheForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentSummaryCache setBundleCache:forBundleId:](self, "setBundleCache:forBundleId:", 0, v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("bundleId");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.IntentsCore.summarycache.invalidation"), self, v6);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "appState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isPlaceholder");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[INIntentSummaryCache invalidateCacheForBundleId:](self, "invalidateCacheForBundleId:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (OS_dispatch_queue)resourceAccessQueue
{
  return self->_resourceAccessQueue;
}

- (NSMutableDictionary)allBundlesCache
{
  return self->_allBundlesCache;
}

- (int)systemLanguageChangeNotificationToken
{
  return self->_systemLanguageChangeNotificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allBundlesCache, 0);
  objc_storeStrong((id *)&self->_resourceAccessQueue, 0);
}

void __39__INIntentSummaryCache_invalidateCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __59__INIntentSummaryCache_startObservingSystemLanguageChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateCache");

}

uint64_t __59__INIntentSummaryCache_setSubtitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__INIntentSummaryCache_setTitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__INIntentSummaryCache_getSubtitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "containedProperties");
  if ((result & 2) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "subtitle");
      result = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      **(_QWORD **)(a1 + 48) = result;
    }
  }
  return result;
}

uint64_t __56__INIntentSummaryCache_getTitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "containedProperties");
  if ((result & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "title");
      result = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      **(_QWORD **)(a1 + 48) = result;
    }
  }
  return result;
}

void __51__INIntentSummaryCache_setBundleCache_forBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "allBundlesCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __47__INIntentSummaryCache_bundleCacheForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "allBundlesCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_50159);
  return (id)sharedCache_cache;
}

void __35__INIntentSummaryCache_sharedCache__block_invoke()
{
  INIntentSummaryCache *v0;
  void *v1;

  v0 = objc_alloc_init(INIntentSummaryCache);
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;

}

@end
