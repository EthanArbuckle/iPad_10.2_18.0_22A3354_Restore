@implementation ATXScoreInterpreterCache

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_40 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_40, &__block_literal_global_218);
  return (id)sharedInstance__pasExprOnceResult_51;
}

void __42__ATXScoreInterpreterCache_sharedInstance__block_invoke()
{
  void *v0;
  ATXScoreInterpreterCache *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_alloc_init(ATXScoreInterpreterCache);
  v2 = (void *)sharedInstance__pasExprOnceResult_51;
  sharedInstance__pasExprOnceResult_51 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXScoreInterpreterCache)init
{
  ATXScoreInterpreterCache *v2;
  uint64_t v3;
  NSMutableDictionary *cachedInterpreters;
  uint64_t v5;
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXScoreInterpreterCache;
  v2 = -[ATXScoreInterpreterCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cachedInterpreters = v2->_cachedInterpreters;
    v2->_cachedInterpreters = (NSMutableDictionary *)v3;

    v2->_memoryPressureAllowsCaching = 1;
    objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    memoryPressureMonitor = v2->_memoryPressureMonitor;
    v2->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v5;

    -[ATXMemoryPressureMonitor registerObserver:](v2->_memoryPressureMonitor, "registerObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXMemoryPressureMonitor unregisterObserver:](self->_memoryPressureMonitor, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)ATXScoreInterpreterCache;
  -[ATXScoreInterpreterCache dealloc](&v3, sel_dealloc);
}

- (id)_assetNamesToSkipCaching
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E83D06E8);
}

- (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  char v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = self->_cachedInterpreters;
  objc_sync_enter(v5);
  +[ATXScoreInterpreterFromAssetBuilder assetFilenameForSubType:](ATXScoreInterpreterFromAssetBuilder, "assetFilenameForSubType:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedInterpreters, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - using cached score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    +[ATXScoreInterpreterFromAssetBuilder interpreterFromAssetFilename:](ATXScoreInterpreterFromAssetBuilder, "interpreterFromAssetFilename:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXScoreInterpreterCache _assetNamesToSkipCaching](self, "_assetNamesToSkipCaching");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v6);

    if ((v12 & 1) != 0 || !self->_memoryPressureAllowsCaching)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - skipping caching of score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);

      }
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInterpreters, "setObject:forKeyedSubscript:", v7, v6);
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - caching new score interpreter with filename: %@", (uint8_t *)&v18, 0x16u);

      }
    }
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)handleMemoryPressureOfType:(unint64_t)a3
{
  NSMutableDictionary *v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = self->_cachedInterpreters;
  objc_sync_enter(v5);
  if (a3)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      ATXMemoryPressureTypeToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - received memory pressure notification of type %@, forbidding caching and evicting caches", (uint8_t *)&v14, 0x16u);

    }
    self->_memoryPressureAllowsCaching = 0;
    -[ATXScoreInterpreterCache resetCache](self, "resetCache");
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      ATXMemoryPressureTypeToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - received memory pressure notification of type %@, allowing caching", (uint8_t *)&v14, 0x16u);

    }
    self->_memoryPressureAllowsCaching = 1;
  }
  objc_sync_exit(v5);

}

- (void)resetCache
{
  NSMutableDictionary *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_cachedInterpreters;
  objc_sync_enter(v3);
  -[NSMutableDictionary removeAllObjects](self->_cachedInterpreters, "removeAllObjects");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - removed all cached interpreters", (uint8_t *)&v7, 0xCu);

  }
  objc_sync_exit(v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_cachedInterpreters, 0);
}

@end
