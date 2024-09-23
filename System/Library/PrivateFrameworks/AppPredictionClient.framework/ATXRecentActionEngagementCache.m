@implementation ATXRecentActionEngagementCache

- (ATXRecentActionEngagementCache)init
{
  void *v3;
  ATXRecentActionEngagementCache *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXRecentActionEngagementCache initWithCacheDirectory:](self, "initWithCacheDirectory:", v3);

  return v4;
}

- (ATXRecentActionEngagementCache)initWithCacheDirectory:(id)a3
{
  id v4;
  ATXRecentActionEngagementCache *v5;
  uint64_t v6;
  NSString *recentMLEngagementCachePath;
  uint64_t v8;
  NSString *recentHeuristicEngagementCachePath;
  objc_class *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXRecentActionEngagementCache;
  v5 = -[ATXRecentActionEngagementCache init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ATXRecentMLActions"));
    v6 = objc_claimAutoreleasedReturnValue();
    recentMLEngagementCachePath = v5->_recentMLEngagementCachePath;
    v5->_recentMLEngagementCachePath = (NSString *)v6;

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ATXRecentHeuristicActions"));
    v8 = objc_claimAutoreleasedReturnValue();
    recentHeuristicEngagementCachePath = v5->_recentHeuristicEngagementCachePath;
    v5->_recentHeuristicEngagementCachePath = (NSString *)v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_4, &__block_literal_global_28);
  return (id)sharedInstance__pasExprOnceResult_5;
}

void __48__ATXRecentActionEngagementCache_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5;
  sharedInstance__pasExprOnceResult_5 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)recentActions
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ATXRecentActionEngagementCache_recentActions__block_invoke;
  v5[3] = &unk_1E4D590F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__ATXRecentActionEngagementCache_recentActions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getAllCachedActionsNoSync");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addEngagedAction:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXRecentActionEngagementCache *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ATXRecentActionEngagementCache_addEngagedAction___block_invoke;
  v7[3] = &unk_1E4D57258;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __51__ATXRecentActionEngagementCache_addEngagedAction___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHeuristic");
  v3 = 8;
  if (v2)
    v3 = 16;
  return objc_msgSend(*(id *)(a1 + 40), "_addEngagedActionNoSync:toCacheAtPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + v3));
}

- (void)clearRecentEngagements
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", v3, &v11);
  v4 = v11;

  if (v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_2();

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v10 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", v7, &v10);
  v8 = v10;

  if (v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_1();

  }
}

- (void)clearRecentMLEngagementsExceptForActions:(id)a3
{
  -[ATXRecentActionEngagementCache clearRecentEngagementsFromCacheAtPath:withExceptionActions:](self, "clearRecentEngagementsFromCacheAtPath:withExceptionActions:", self->_recentMLEngagementCachePath, a3);
}

- (void)clearRecentHeuristicEngagementsExceptForActions:(id)a3
{
  -[ATXRecentActionEngagementCache clearRecentEngagementsFromCacheAtPath:withExceptionActions:](self, "clearRecentEngagementsFromCacheAtPath:withExceptionActions:", self->_recentHeuristicEngagementCachePath, a3);
}

- (id)_getAllCachedActionsNoSync
{
  void *v3;
  void *v4;
  void *v5;

  -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:](self, "_recentActionsNoSyncForCacheAtPath:", self->_recentMLEngagementCachePath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:](self, "_recentActionsNoSyncForCacheAtPath:", self->_recentHeuristicEngagementCachePath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_recentActionsNoSyncForCacheAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;

  v3 = a3;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1A85A4F90]();
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v11, v4, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;

    objc_autoreleasePoolPop(v7);
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:].cold.2();

      v14 = (id)objc_opt_new();
    }
    v16 = v14;

    v6 = v13;
  }
  else
  {
    if (objc_msgSend(v5, "code") != 260)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:].cold.1();

    }
    v16 = (void *)objc_opt_new();
  }

  return v16;
}

- (void)_addEngagedActionSetNoSync:(id)a3 toCacheAtPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:](self, "_recentActionsNoSyncForCacheAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);
    -[ATXRecentActionEngagementCache _serializeAndWriteNoSyncActionSet:toCacheAtPath:](self, "_serializeAndWriteNoSyncActionSet:toCacheAtPath:", v7, v6);

  }
}

- (void)_addEngagedActionNoSync:(id)a3 toCacheAtPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:](self, "_recentActionsNoSyncForCacheAtPath:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

    -[ATXRecentActionEngagementCache _serializeAndWriteNoSyncActionSet:toCacheAtPath:](self, "_serializeAndWriteNoSyncActionSet:toCacheAtPath:", v8, v6);
  }
}

- (void)_serializeAndWriteNoSyncActionSet:(id)a3 toCacheAtPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = (void *)MEMORY[0x1A85A4F90]();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    objc_msgSend(v9, "writeToFile:atomically:", v6, 1);
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXRecentActionEngagementCache _serializeAndWriteNoSyncActionSet:toCacheAtPath:].cold.1();

  }
  objc_autoreleasePoolPop(v7);

}

- (id)exceptionsFoundInCacheAtPath:(id)a3 forCandidateExceptions:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[ATXRecentActionEngagementCache _recentActionsNoSyncForCacheAtPath:](self, "_recentActionsNoSyncForCacheAtPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intersectSet:", v7);
  }
  else
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (void)clearRecentEngagementsFromCacheAtPath:(id)a3 withExceptionActions:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATXRecentActionEngagementCache *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__ATXRecentActionEngagementCache_clearRecentEngagementsFromCacheAtPath_withExceptionActions___block_invoke;
  block[3] = &unk_1E4D57FE0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __93__ATXRecentActionEngagementCache_clearRecentEngagementsFromCacheAtPath_withExceptionActions___block_invoke(id *a1)
{
  id v2;

  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[6], "exceptionsFoundInCacheAtPath:forCandidateExceptions:", a1[5], a1[4]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
      objc_msgSend(a1[6], "_serializeAndWriteNoSyncActionSet:toCacheAtPath:", v2, a1[5]);
    else
      removeCacheFile(a1[5]);

  }
  else
  {
    removeCacheFile(a1[5]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recentHeuristicEngagementCachePath, 0);
  objc_storeStrong((id *)&self->_recentMLEngagementCachePath, 0);
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to remove heuristics recent engagement cache file. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__ATXRecentActionEngagementCache_clearRecentEngagements__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to remove ML recent engagement cache file. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_recentActionsNoSyncForCacheAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_ERROR, "Error reading %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_recentActionsNoSyncForCacheAtPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to get recent actions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_serializeAndWriteNoSyncActionSet:toCacheAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to serialize recent engagements. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
