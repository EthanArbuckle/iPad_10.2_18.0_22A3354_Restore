@implementation ATXGlobalInterruptingAppModel

+ (ATXGlobalInterruptingAppModel)modelWithAllInstalledAppsKnownToSpringBoard
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allInstalledAppsKnownToSpringBoard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleIds:", v5);
  return (ATXGlobalInterruptingAppModel *)v6;
}

- (ATXGlobalInterruptingAppModel)initWithBundleIds:(id)a3
{
  id v4;
  ATXGlobalInterruptingAppModel *v5;
  uint64_t v6;
  NSSet *bundleIds;
  uint64_t v8;
  _PASCFBurstTrie *index;
  uint64_t v10;
  NSDictionary *priors;
  uint64_t v12;
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalInterruptingAppModel;
  v5 = -[ATXGlobalInterruptingAppModel init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSSet *)v6;

    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalAppSignalsIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    index = v5->_index;
    v5->_index = (_PASCFBurstTrie *)v8;

    -[ATXGlobalInterruptingAppModel _computePriors](v5, "_computePriors");
    v10 = objc_claimAutoreleasedReturnValue();
    priors = v5->_priors;
    v5->_priors = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CF94C8], "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    memoryPressureMonitor = v5->_memoryPressureMonitor;
    v5->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v12;

    -[ATXMemoryPressureMonitor registerObserver:](v5->_memoryPressureMonitor, "registerObserver:", v5);
  }

  return v5;
}

- (void)dealloc
{
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v4;

  -[ATXMemoryPressureMonitor unregisterObserver:](self->_memoryPressureMonitor, "unregisterObserver:", self);
  memoryPressureMonitor = self->_memoryPressureMonitor;
  self->_memoryPressureMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)ATXGlobalInterruptingAppModel;
  -[ATXGlobalInterruptingAppModel dealloc](&v4, sel_dealloc);
}

- (id)loadGlobalPriorsAsset
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("ATXGlobalInterruptingApp_v0"), CFSTR("dat"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v2, 1, &v21);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v21;
    if (v4)
    {
      __atxlog_handle_modes();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset].cold.3((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
    else
    {
      if (v3)
      {
        v12 = v3;
        goto LABEL_11;
      }
      __atxlog_handle_modes();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset].cold.2(v5);
    }

    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset].cold.1(v4, v13, v14, v15, v16, v17, v18, v19);
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)_computePriors
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXGlobalInterruptingAppModel: _computePriors", v18, 2u);
  }

  -[ATXGlobalInterruptingAppModel loadGlobalPriorsAsset](self, "loadGlobalPriorsAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_bundleIds;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = -[ATXGlobalInterruptingAppModel indexForBundleId:](self, "indexForBundleId:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          if ((_DWORD)v11)
          {
            v12 = v11;
            *(_DWORD *)v18 = 0;
            objc_msgSend(v4, "getBytes:range:", v18, (4 * v11 - 4), 4);
            LODWORD(v13) = *(_DWORD *)v18;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v13 / 4294967300.0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);

          }
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)unloadGlobalPriorsAsset
{
  NSDictionary *priors;
  ATXGlobalInterruptingAppModel *obj;

  obj = self;
  objc_sync_enter(obj);
  priors = obj->_priors;
  obj->_priors = 0;

  obj->_assetOffloadedDueToMemoryPressure = 1;
  objc_sync_exit(obj);

}

- (int)indexForBundleId:(id)a3
{
  return -[_PASCFBurstTrie payloadForString:](self->_index, "payloadForString:", a3);
}

- (double)scoreForBundleId:(id)a3 scalingFactor:(double)a4
{
  id v6;
  ATXGlobalInterruptingAppModel *v7;
  NSObject *v8;
  uint64_t v9;
  NSDictionary *priors;
  uint64_t v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint8_t v18[16];

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_priors && v7->_assetOffloadedDueToMemoryPressure)
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "ATXGlobalInterruptingAppModel: loading global priors after it was previously offloaded due to memory pressure.", v18, 2u);
    }

    -[ATXGlobalInterruptingAppModel _computePriors](v7, "_computePriors");
    v9 = objc_claimAutoreleasedReturnValue();
    priors = v7->_priors;
    v7->_priors = (NSDictionary *)v9;

    v7->_assetOffloadedDueToMemoryPressure = 0;
  }
  v11 = -[ATXGlobalInterruptingAppModel indexForBundleId:](v7, "indexForBundleId:", v6);
  v12 = v7->_priors;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15 * a4;

  objc_sync_exit(v7);
  return v16;
}

- (NSSet)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)loadGlobalPriorsAsset
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXGlobalInterruptingAppModel: Error encountered when attempting to load global priors: %@", a5, a6, a7, a8, 2u);
}

@end
