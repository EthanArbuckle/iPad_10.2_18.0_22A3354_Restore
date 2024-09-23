@implementation CPLMetrics

- (CPLMetrics)initWithClientLibraryBaseURL:(id)a3
{
  id v4;
  CPLMetrics *v5;
  uint64_t v6;
  NSURL *metricsFileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLMetrics;
  v5 = -[CPLMetrics init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("metrics.plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    metricsFileURL = v5->_metricsFileURL;
    v5->_metricsFileURL = (NSURL *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)forceLoad
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  CPLMetrics *v7;

  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __23__CPLMetrics_forceLoad__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_lock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

}

- (void)_loadIfNecessary
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *metrics;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_metrics)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfURL:", self->_metricsFileURL);
    v6 = v3;
    if (v3)
      v4 = v3;
    else
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metrics = self->_metrics;
    self->_metrics = v4;

  }
}

- (void)_save
{
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary writeToURL:atomically:](self->_metrics, "writeToURL:atomically:", self->_metricsFileURL, 1);
}

- (void)resetMetrics
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  void *v4;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  CPLMetrics *v8;

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __26__CPLMetrics_resetMetrics__block_invoke;
  v7 = &unk_1E60D65B8;
  v8 = self;
  v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CPLMetricsDidChangeNotification"), 0);

}

- (int64_t)countForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  int64_t v8;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  CPLMetrics *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  p_lock = &self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __26__CPLMetrics_countForKey___block_invoke;
  v12 = &unk_1E60DC8F0;
  v13 = self;
  v15 = &v16;
  v6 = v4;
  v14 = v6;
  v7 = v10;
  os_unfair_lock_lock(p_lock);
  v11((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

  v8 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)incrementCountForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPLMetrics *v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __35__CPLMetrics_incrementCountForKey___block_invoke;
  v10 = &unk_1E60D6F88;
  v11 = self;
  v6 = v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_lock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

- (id)metricsDescription
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLMetrics *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7115;
  v15 = __Block_byref_object_dispose__7116;
  v16 = 0;
  p_lock = &self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __32__CPLMetrics_metricsDescription__block_invoke;
  v8 = &unk_1E60DC8A0;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metricsFileURL, 0);
}

void __32__CPLMetrics_metricsDescription__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v10 = objc_msgSend(*(id *)(a1 + 32), "countForKey:", v9);
          if (v10 >= 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %ld"), v9, v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

uint64_t __35__CPLMetrics_incrementCountForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __26__CPLMetrics_countForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

uint64_t __26__CPLMetrics_resetMetrics__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __23__CPLMetrics_forceLoad__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

@end
