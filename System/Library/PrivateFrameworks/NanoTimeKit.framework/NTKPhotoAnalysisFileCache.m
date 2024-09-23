@implementation NTKPhotoAnalysisFileCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1)
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_154);
  return (id)sharedInstance___sharedInstance_8;
}

void __43__NTKPhotoAnalysisFileCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_8;
  sharedInstance___sharedInstance_8 = v0;

}

- (NTKPhotoAnalysisFileCache)init
{
  NTKPhotoAnalysisFileCache *v2;
  uint64_t v3;
  NTKTaskScheduler *taskScheduler;
  uint64_t v5;
  NSMutableDictionary *cache;
  NTKPhotoAnalysisFileCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKPhotoAnalysisFileCache;
  v2 = -[NTKPhotoAnalysisFileCache init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (NTKTaskScheduler *)v3;

    if (!-[NTKPhotoAnalysisFileCache _load](v2, "_load"))
    {
      v5 = objc_opt_new();
      cache = v2->_cache;
      v2->_cache = (NSMutableDictionary *)v5;

      v2->_sequenceNumber = 100;
    }
    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  v3.receiver = self;
  v3.super_class = (Class)NTKPhotoAnalysisFileCache;
  -[NTKPhotoAnalysisFileCache dealloc](&v3, sel_dealloc);
}

- (BOOL)_load
{
  return 0;
}

- (void)_dirtyCache
{
  NTKTaskScheduler *taskScheduler;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_cacheDirty)
  {
    self->_cacheDirty = 1;
    objc_initWeak(&location, self);
    taskScheduler = self->_taskScheduler;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__NTKPhotoAnalysisFileCache__dirtyCache__block_invoke;
    v5[3] = &unk_1E6BCE0A8;
    objc_copyWeak(&v6, &location);
    v4 = -[NTKTaskScheduler scheduleTask:identifier:](taskScheduler, "scheduleTask:identifier:", v5, CFSTR("com.apple.ntk.NTKPhotoAnalysisCacheEntry"));
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

uint64_t __40__NTKPhotoAnalysisFileCache__dirtyCache__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_save");

  return v2;
}

- (BOOL)_save
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_cache, "keysSortedByValueUsingComparator:", &__block_literal_global_46);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v3, "count") < 151)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "count") - 150;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = 100;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = v4 - 1;
        if (v4 < 1)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSequenceNumber:", v9);

          v9 = (v9 + 1);
        }
        else
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] evict %@", buf, 0xCu);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v11);
          v4 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }
  else
  {
    LODWORD(v9) = 100;
  }

  self->_cacheDirty = 0;
  self->_sequenceNumber = v9;

  return 1;
}

uint64_t __34__NTKPhotoAnalysisFileCache__save__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "sequenceNumber");
  v5 = objc_msgSend(v4, "sequenceNumber");

  v6 = (_DWORD)a2 - v5;
  if ((int)a2 < v5)
    v6 = -1;
  if (v6 >= 1)
    return 1;
  return v6;
}

- (id)photoAnalysisForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] found %@", (uint8_t *)&v10, 0xCu);
    }

    ++self->_sequenceNumber;
    objc_msgSend(v5, "setSequenceNumber:");
    -[NTKPhotoAnalysisFileCache _dirtyCache](self, "_dirtyCache");
    objc_msgSend(v5, "analysis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] not found %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)setPhotoAnalysis:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  ++self->_sequenceNumber;
  objc_msgSend(v8, "setSequenceNumber:");
  objc_msgSend(v8, "setAnalysis:", v7);

  -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v8, v6);
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "[photo analysis file cache] add %@", (uint8_t *)&v10, 0xCu);
  }

  -[NTKPhotoAnalysisFileCache _dirtyCache](self, "_dirtyCache");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
