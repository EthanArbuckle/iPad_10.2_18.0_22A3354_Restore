@implementation ATXSuggestedPagesCache

- (ATXSuggestedPagesCache)init
{
  void *v3;
  ATXSuggestedPagesCache *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXSuggestedPagesCache initWithPath:](self, "initWithPath:", v3);

  return v4;
}

- (ATXSuggestedPagesCache)initWithPath:(id)a3
{
  id v4;
  ATXSuggestedPagesCache *v5;
  uint64_t v6;
  NSString *basePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesCache;
  v5 = -[ATXSuggestedPagesCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    basePath = v5->_basePath;
    v5->_basePath = (NSString *)v6;

  }
  return v5;
}

- (id)cachedSuggestedPagesForPageType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 4)
    return 0;
  -[ATXSuggestedPagesCache _cacheForPageType:](self, "_cacheForPageType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v8, 0, 432000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "leafIcons");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_pas_filteredArrayWithTest:", &__block_literal_global_37);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setLeafIcons:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v10;
}

BOOL __58__ATXSuggestedPagesCache_cachedSuggestedPagesForPageType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "bundleId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[ATXApplicationRecord isInstalledAndNotRestrictedForBundle:](ATXApplicationRecord, "isInstalledAndNotRestrictedForBundle:", v3);

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)evictCachedSuggestedPages
{
  uint64_t i;
  void *v4;

  for (i = 4; i != 12; ++i)
  {
    -[ATXSuggestedPagesCache _cacheForPageType:](self, "_cacheForPageType:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evict");

  }
}

- (void)cacheSuggestedPages:(id)a3 forPageType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    -[ATXSuggestedPagesCache _cacheForPageType:](self, "_cacheForPageType:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "storeSecureCodedObject:error:", v7, 0);

  }
}

- (id)_cacheForPageType:(int64_t)a3
{
  NSString *basePath;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  basePath = self->_basePath;
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromATXSuggestedPageType(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SuggestedPage-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CF94C0]);
  __atxlog_handle_modes();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCacheFilePath:loggingHandle:debugName:", v7, v9, CFSTR("suggested pages"));

  return v10;
}

- (void)printCachedSuggestedPagesStats
{
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  for (i = 4; i != 12; ++i)
  {
    NSStringFromATXSuggestedPageType(i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSuggestedPagesCache _cacheForPageType:](self, "_cacheForPageType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A85A4F90]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v9, 0, 3.40282347e38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)MEMORY[0x1E0CF94D8];
      objc_msgSend(v5, "cacheFilePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "modificationDateOfFileAtPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("%@: %ld cached pages; last modified: %@"), v4, objc_msgSend(v10, "count"), v13);
    }
    else
    {
      NSLog(CFSTR("%@: no cached pages"), v4);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
}

@end
