@implementation ATXHeuristicResultCache

- (void)_expire:(id)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "Expiring %@", (uint8_t *)&v9, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v6);
  pthread_mutex_unlock(&self->_lock);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.duetexpertd.heuristic.cache-expired"), self);

  }
}

- (void)expireAll
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *cache;
  void *v6;
  uint8_t v7[16];

  __atxlog_handle_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "Expiring all heuristics", v7, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  v4 = (NSMutableDictionary *)objc_opt_new();
  cache = self->_cache;
  self->_cache = v4;

  pthread_mutex_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.duetexpertd.heuristic.cache-expired"), self);

}

+ (ATXHeuristicResultCache)sharedInstance
{
  if (sharedInstance__pasOnceToken11 != -1)
    dispatch_once(&sharedInstance__pasOnceToken11, &__block_literal_global_2);
  return (ATXHeuristicResultCache *)(id)sharedInstance__pasExprOnceResult_0;
}

void __41__ATXHeuristicResultCache_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA46CBC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXHeuristicResultCache)init
{
  ATXHeuristicResultCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSHashTable *expirerInternTable;
  objc_class *v7;
  const char *Name;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notificationQueue;
  NSObject *v12;
  uint64_t v13;
  ATXHeuristicResultCache *v14;
  int *p_significantTimeToken;
  NSObject *v16;
  int *v17;
  NSObject *v18;
  _QWORD v20[4];
  int *v21;
  _QWORD v22[4];
  int *v23;
  _QWORD handler[4];
  ATXHeuristicResultCache *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ATXHeuristicResultCache;
  v2 = -[ATXHeuristicResultCache init](&v26, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    expirerInternTable = v2->_expirerInternTable;
    v2->_expirerInternTable = (NSHashTable *)v5;

    pthread_mutex_init(&v2->_lock, 0);
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(Name, v9);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v10;

    v12 = v2->_notificationQueue;
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __31__ATXHeuristicResultCache_init__block_invoke;
    handler[3] = &unk_1E82C4A48;
    v14 = v2;
    v25 = v14;
    notify_register_dispatch("com.apple.duet.expertcenter.appRefresh", &v2->_appRefreshToken, v12, handler);
    p_significantTimeToken = &v14->_significantTimeToken;
    v16 = v2->_notificationQueue;
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __31__ATXHeuristicResultCache_init__block_invoke_154;
    v22[3] = &unk_1E82C4A48;
    v17 = v14;
    v23 = v17;
    notify_register_dispatch("SignificantTimeChangeNotification", p_significantTimeToken, v16, v22);
    v18 = v2->_notificationQueue;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __31__ATXHeuristicResultCache_init__block_invoke_156;
    v20[3] = &unk_1E82C4A48;
    v21 = v17;
    notify_register_dispatch("com.apple.suggestions.settingsChanged", v17 + 32, v18, v20);

  }
  return v2;
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__ATXHeuristicResultCache_init__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "expireAll");
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke_154(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__ATXHeuristicResultCache_init__block_invoke_154_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "expireAll");
}

uint64_t __31__ATXHeuristicResultCache_init__block_invoke_156(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__ATXHeuristicResultCache_init__block_invoke_156_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "expireAll");
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  notify_cancel(self->_appRefreshToken);
  notify_cancel(self->_significantTimeToken);
  notify_cancel(self->_learnRefreshToken);
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicResultCache;
  -[ATXHeuristicResultCache dealloc](&v3, sel_dealloc);
}

- (void)_observeUserFocusChanges
{
  BMBiomeScheduler *v3;
  BMBiomeScheduler *focusScheduler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSSink *v10;
  BPSSink *focusSink;
  _QWORD v12[4];
  id v13;
  id location;

  if (!self->_focusSink)
  {
    objc_initWeak(&location, self);
    v3 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("ATXHeuristicResultCache.UserFocus"), self->_notificationQueue);
    focusScheduler = self->_focusScheduler;
    self->_focusScheduler = v3;

    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UserFocus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ComputedMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "atx_DSLPublisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subscribeOn:", self->_focusScheduler);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_162;
    v12[3] = &unk_1E82C49C8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_161, v12);
    v10 = (BPSSink *)objc_claimAutoreleasedReturnValue();
    focusSink = self->_focusSink;
    self->_focusSink = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_cold_1(v2);

  }
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_162(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v6, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleFocusStateUpdate:", v5);

  }
}

- (void)_handleFocusStateUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSNumber *v6;
  NSNumber *cachedIsFocusActiveState;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_INFO, "Biome user focus computed mode stream received an update: %@", (uint8_t *)&v9, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "starting"));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  self->_cachedIsFocusActiveState = v6;

  pthread_mutex_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("DNDStateChanged"), self);

}

- (BOOL)isFocusModeActiveWithError:(id *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  NSNumber *cachedIsFocusActiveState;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  if (!cachedIsFocusActiveState)
  {
    -[ATXHeuristicResultCache _observeUserFocusChanges](self, "_observeUserFocusChanges");
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    v22 = 0;
    BiomeLibrary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UserFocus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ComputedMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E82D5668, &unk_1E82D5668, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke;
    v16[3] = &unk_1E82C4A90;
    v16[4] = &v17;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_165;
    v15[3] = &unk_1E82C4AB8;
    v11 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v16, v15);

    v12 = (void *)v18[5];
    if (v12 && *a3)
      *a3 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v17, 8);

    cachedIsFocusActiveState = self->_cachedIsFocusActiveState;
  }
  v13 = -[NSNumber BOOLValue](cachedIsFocusActiveState, "BOOLValue");
  pthread_mutex_unlock(p_lock);
  return v13;
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_cold_1(v3);

    objc_msgSend(v3, "error");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_165(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "starting"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = v6;

  }
}

+ (id)sharedPassLibrary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPassLibrary_onceToken != -1)
    dispatch_once(&sharedPassLibrary_onceToken, block);
  return (id)sharedPassLibrary_passLibrary;
}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];

  v2 = objc_opt_new();
  v3 = (void *)sharedPassLibrary_passLibrary;
  sharedPassLibrary_passLibrary = v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D6A788];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_2;
  v8[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, sharedPassLibrary_passLibrary, 0, v8);

  __atxlog_handle_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_cold_1();

}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_heuristic();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = sharedPassLibrary_passLibrary;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C99DF000, v4, OS_LOG_TYPE_INFO, "PKPassLibrary: %@ received a change notification: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PassLibraryChanged"), *(_QWORD *)(a1 + 32));

}

- (unint64_t)count
{
  _opaque_pthread_mutex_t *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_cache, "count");
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)setObject:(id)a3 expirers:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  ATXHeuristicResultCacheEntry *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pthread_mutex_lock(&self->_lock);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        -[ATXHeuristicResultCache _internExpirerLocked:](self, "_internExpirerLocked:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v10);
  v18 = (ATXHeuristicResultCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v18 = -[ATXHeuristicResultCacheEntry initWithHeuristic:cache:]([ATXHeuristicResultCacheEntry alloc], "initWithHeuristic:cache:", v10, self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v18, v10);
  }
  -[ATXHeuristicResultCacheEntry setActions:expirers:](v18, "setActions:expirers:", v8, v11, (_QWORD)v19);
  pthread_mutex_unlock(&self->_lock);

}

- (id)_internExpirerLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NSHashTable member:](self->_expirerInternTable, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[NSHashTable addObject:](self->_expirerInternTable, "addObject:", v4);
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3 found:(BOOL *)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  v7 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v7);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)v8[3];
  else
    v9 = 0;
  v10 = v9;
  pthread_mutex_unlock(p_lock);
  if (a4)
    *a4 = v8 != 0;

  return v10;
}

- (id)heuristicsCached
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  return v5;
}

- (id)firstExpirationDate
{
  _opaque_pthread_mutex_t *p_lock;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_expirerInternTable;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "fireDate", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "earlierDate:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
            v14 = (void *)v12;
          else
            v14 = v11;
          v15 = v14;

          v7 = v15;
        }
      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  pthread_mutex_unlock(p_lock);
  return v7;
}

- (void)expire:(id)a3
{
  -[ATXHeuristicResultCache _expire:postNotification:](self, "_expire:postNotification:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_focusSink, 0);
  objc_storeStrong((id *)&self->_focusScheduler, 0);
  objc_storeStrong((id *)&self->_cachedIsFocusActiveState, 0);
  objc_storeStrong((id *)&self->_expirerInternTable, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __31__ATXHeuristicResultCache_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Expiring all heuristics after Darwin notification 'com.apple.duet.expertcenter.appRefresh'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __31__ATXHeuristicResultCache_init__block_invoke_154_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Expiring all heuristics after Darwin notification 'SignificantTimeChangeNotification'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __31__ATXHeuristicResultCache_init__block_invoke_156_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Expiring all heuristics after Darwin notification com.apple.suggestions.settingsChanged", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __51__ATXHeuristicResultCache__observeUserFocusChanges__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1C99DF000, v2, v3, "Unable to observe user focus for heuristics: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __54__ATXHeuristicResultCache_isFocusModeActiveWithError___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1C99DF000, v2, v3, "Could not poll current computed mode event: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __44__ATXHeuristicResultCache_sharedPassLibrary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Added observer to PKPassLibrary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
