@implementation ATXGlobalAppModeAffinityModel

+ (ATXGlobalAppModeAffinityModel)modelWithAllInstalledAppsKnownToSpringBoard
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
  return (ATXGlobalAppModeAffinityModel *)v6;
}

- (ATXGlobalAppModeAffinityModel)initWithBundleIds:(id)a3
{
  id v4;
  ATXGlobalAppModeAffinityModel *v5;
  uint64_t v6;
  NSSet *bundleIds;
  uint64_t v8;
  _PASCFBurstTrie *index;
  uint64_t v10;
  NSDictionary *normalizedPriors;
  uint64_t v12;
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalAppModeAffinityModel;
  v5 = -[ATXGlobalAppModeAffinityModel init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSSet *)v6;

    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalAppSignalsIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    index = v5->_index;
    v5->_index = (_PASCFBurstTrie *)v8;

    -[ATXGlobalAppModeAffinityModel _computePriors](v5, "_computePriors");
    v10 = objc_claimAutoreleasedReturnValue();
    normalizedPriors = v5->_normalizedPriors;
    v5->_normalizedPriors = (NSDictionary *)v10;

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
  v4.super_class = (Class)ATXGlobalAppModeAffinityModel;
  -[ATXGlobalAppModeAffinityModel dealloc](&v4, sel_dealloc);
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

  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("ATXGlobalAppModeAffinity_v0"), CFSTR("dat"), 0);
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
        -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset].cold.3((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
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
        -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset].cold.2(v5);
    }

    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset].cold.1(v4, v13, v14, v15, v16, v17, v18, v19);
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)_computePriors
{
  NSObject *v3;
  double v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  ATXGlobalAppModeAffinityPrior *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSSet *obj;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: _computePriors", buf, 2u);
  }

  -[ATXGlobalAppModeAffinityModel loadGlobalPriorsAsset](self, "loadGlobalPriorsAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "supportedModeTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_bundleIds;
    v26 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v36;
      v4 = 0.0;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v7 = -[ATXGlobalAppModeAffinityModel indexForBundleId:](self, "indexForBundleId:", v6);
          if ((_DWORD)v7)
          {
            v8 = v7;
            v27 = i;
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v28 = v24;
            v9 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v10; ++j)
                {
                  if (*(_QWORD *)v32 != v11)
                    objc_enumerationMutation(v28);
                  v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                  v14 = objc_msgSend(v13, "integerValue");
                  -[ATXGlobalAppModeAffinityModel _priorForMode:bundleIdIndex:priors:](self, "_priorForMode:bundleIdIndex:priors:", v14, v8, v30);
                  v16 = v15;
                  v17 = -[ATXGlobalAppModeAffinityPrior initWithMode:prior:bundleId:]([ATXGlobalAppModeAffinityPrior alloc], "initWithMode:prior:bundleId:", v14, v6, v15);
                  v18 = (void *)MEMORY[0x1E0D81638];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "tupleWithFirst:second:", v19, v13);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, v20);
                  if (v4 < v16)
                    v4 = v16;

                }
                v10 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v10);
            }

            i = v27;
          }
        }
        v26 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v26);
    }
    else
    {
      v4 = 0.0;
    }

    -[ATXGlobalAppModeAffinityModel _normalizePriors:maximumPrior:](self, "_normalizePriors:maximumPrior:", v29, v4);
    v21 = (void *)objc_msgSend(v29, "copy");

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)unloadGlobalPriorsAsset
{
  NSDictionary *normalizedPriors;
  ATXGlobalAppModeAffinityModel *obj;

  obj = self;
  objc_sync_enter(obj);
  normalizedPriors = obj->_normalizedPriors;
  obj->_normalizedPriors = 0;

  obj->_assetOffloadedDueToMemoryPressure = 1;
  objc_sync_exit(obj);

}

- (void)_normalizePriors:(id)a3 maximumPrior:(double)a4
{
  id v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSSet *obj;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: _normalizePriors:maximumPrior", buf, 2u);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_bundleIds;
  v28 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v28)
  {
    v7 = fmin(a4, 500.0);
    v26 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v29 = v8;
        v9 = -[ATXGlobalAppModeAffinityModel indexForBundleId:](self, "indexForBundleId:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8));
        objc_msgSend((id)objc_opt_class(), "supportedModeTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14);
              v16 = (void *)MEMORY[0x1E0D81638];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "tupleWithFirst:second:", v17, v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "prior");
                v22 = fmin(v21, 500.0);
                if (v22 < -500.0)
                  v22 = -500.0;
                v23 = v22 / v7;
                objc_msgSend(v5, "objectForKeyedSubscript:", v18);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setPrior:", v23);

              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v12);
        }

        v8 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v28);
  }

}

- (int)indexForBundleId:(id)a3
{
  return -[_PASCFBurstTrie payloadForString:](self->_index, "payloadForString:", a3);
}

- (double)scoreForMode:(unint64_t)a3 bundleId:(id)a4 scalingFactor:(double)a5
{
  id v8;
  ATXGlobalAppModeAffinityModel *v9;
  NSObject *v10;
  uint64_t v11;
  NSDictionary *normalizedPriors;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint8_t v22[16];

  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v9->_normalizedPriors && v9->_assetOffloadedDueToMemoryPressure)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "ATXGlobalAppModeAffinityModel: loading global priors after it was previously offloaded due to memory pressure.", v22, 2u);
    }

    -[ATXGlobalAppModeAffinityModel _computePriors](v9, "_computePriors");
    v11 = objc_claimAutoreleasedReturnValue();
    normalizedPriors = v9->_normalizedPriors;
    v9->_normalizedPriors = (NSDictionary *)v11;

    v9->_assetOffloadedDueToMemoryPressure = 0;
  }
  v13 = -[ATXGlobalAppModeAffinityModel indexForBundleId:](v9, "indexForBundleId:", v8);
  v14 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tupleWithFirst:second:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](v9->_normalizedPriors, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "prior");
  v20 = v19 * a5;

  objc_sync_exit(v9);
  return v20;
}

- (double)_priorForMode:(unint64_t)a3 bundleIdIndex:(int)a4 priors:(id)a5
{
  id v8;
  unint64_t v9;
  double v10;
  int v11;
  void *v12;
  int v13;
  int v15;

  v8 = a5;
  if (v8)
  {
    v15 = 0;
    v9 = -[ATXGlobalAppModeAffinityModel modeIndexForMode:](self, "modeIndexForMode:", a3);
    v10 = 0.0;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
      objc_msgSend((id)objc_opt_class(), "supportedModeTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 4 * (v11 + (a4 - 1) * objc_msgSend(v12, "count"));

      objc_msgSend(v8, "getBytes:range:", &v15, v13, 4);
      v10 = (double)v15 / 10000.0;
    }
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

+ (id)supportedModeTypes
{
  return &unk_1E83D0730;
}

- (unint64_t)modeIndexForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend((id)objc_opt_class(), "supportedModeTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (NSSet)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedPriors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)loadGlobalPriorsAsset
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXGlobalAppModeAffinityModel: Error encountered when attempting to load global priors: %@", a5, a6, a7, a8, 2u);
}

@end
