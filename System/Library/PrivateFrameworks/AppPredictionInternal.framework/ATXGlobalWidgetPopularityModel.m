@implementation ATXGlobalWidgetPopularityModel

+ (ATXGlobalWidgetPopularityModel)modelWithAllAvailableWidgets
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[ATXWidgetModeModel fetchAvailableWidgets](ATXWidgetModeModel, "fetchAvailableWidgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithArray:", v5);

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleIdAndKinds:", v6);
  return (ATXGlobalWidgetPopularityModel *)v7;
}

id __62__ATXGlobalWidgetPopularityModel_modelWithAllAvailableWidgets__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:%@"), v5, v6);
  return v7;
}

- (ATXGlobalWidgetPopularityModel)initWithBundleIdAndKinds:(id)a3
{
  id v4;
  ATXGlobalWidgetPopularityModel *v5;
  uint64_t v6;
  NSSet *bundleIdAndKinds;
  uint64_t v8;
  _PASCFBurstTrie *priorsTrie;
  uint64_t v10;
  NSDictionary *priors;
  uint64_t v12;
  ATXMemoryPressureMonitor *memoryPressureMonitor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXGlobalWidgetPopularityModel;
  v5 = -[ATXGlobalWidgetPopularityModel init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdAndKinds = v5->_bundleIdAndKinds;
    v5->_bundleIdAndKinds = (NSSet *)v6;

    +[ATXGlobalAppScoresUtil initializeTrieAtPath:](ATXGlobalAppScoresUtil, "initializeTrieAtPath:", CFSTR("ATXGlobalWidgetPopularity_v0"));
    v8 = objc_claimAutoreleasedReturnValue();
    priorsTrie = v5->_priorsTrie;
    v5->_priorsTrie = (_PASCFBurstTrie *)v8;

    -[ATXGlobalWidgetPopularityModel _computePriors](v5, "_computePriors");
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
  v4.super_class = (Class)ATXGlobalWidgetPopularityModel;
  -[ATXGlobalWidgetPopularityModel dealloc](&v4, sel_dealloc);
}

- (id)_computePriors
{
  NSObject *v3;
  void *v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_INFO, "ATXGlobalWidgetPopularityModel: _computePriors", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_bundleIdAndKinds;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = -[_PASCFBurstTrie payloadForString:](self->_priorsTrie, "payloadForString:", v10, (_QWORD)v15);
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v11 - 1) / 4294967300.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void)unloadGlobalPriorsAsset
{
  NSDictionary *priors;
  ATXGlobalWidgetPopularityModel *obj;

  obj = self;
  objc_sync_enter(obj);
  priors = obj->_priors;
  obj->_priors = 0;

  obj->_assetOffloadedDueToMemoryPressure = 1;
  objc_sync_exit(obj);

}

- (double)scoreForBundleIdAndKind:(id)a3 scalingFactor:(double)a4
{
  id v6;
  ATXGlobalWidgetPopularityModel *v7;
  NSDictionary *priors;
  NSObject *v9;
  uint64_t v10;
  NSDictionary *v11;
  void *v12;
  double v13;
  double v14;
  uint8_t v16[16];

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  priors = v7->_priors;
  if (!priors)
  {
    if (v7->_assetOffloadedDueToMemoryPressure)
    {
      __atxlog_handle_modes();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "ATXGlobalWidgetPopularityModel: loading global priors after it was previously offloaded due to memory pressure.", v16, 2u);
      }

      -[ATXGlobalWidgetPopularityModel _computePriors](v7, "_computePriors");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v7->_priors;
      v7->_priors = (NSDictionary *)v10;

      v7->_assetOffloadedDueToMemoryPressure = 0;
      priors = v7->_priors;
    }
    else
    {
      priors = 0;
    }
  }
  -[NSDictionary objectForKeyedSubscript:](priors, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13 * a4;

  objc_sync_exit(v7);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priors, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_priorsTrie, 0);
  objc_storeStrong((id *)&self->_bundleIdAndKinds, 0);
}

@end
