@implementation CNAutocompleteStoreQueryContext

- (CNAutocompleteStoreQueryContext)init
{
  CNAutocompleteStoreQueryContext *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CNCache *directoryServerReuseCache;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CNCache *calendarServerReuseCache;
  CNAutocompleteStoreQueryContext *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteStoreQueryContext;
  v2 = -[CNAutocompleteStoreQueryContext init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D139B0]);
    objc_msgSend((id)objc_opt_class(), "cacheBoundaryStrategies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCacheScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithBoundingStrategies:resourceScheduler:", v4, v5);
    directoryServerReuseCache = v2->_directoryServerReuseCache;
    v2->_directoryServerReuseCache = (CNCache *)v6;

    v8 = objc_alloc(MEMORY[0x1E0D139B0]);
    objc_msgSend((id)objc_opt_class(), "cacheBoundaryStrategies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCacheScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithBoundingStrategies:resourceScheduler:", v9, v10);
    calendarServerReuseCache = v2->_calendarServerReuseCache;
    v2->_calendarServerReuseCache = (CNCache *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)cacheBoundaryStrategies
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithTTL:", 3600.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNCache)directoryServerReuseCache
{
  return (CNCache *)objc_getProperty(self, a2, 8, 1);
}

- (CNCache)calendarServerReuseCache
{
  return (CNCache *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarServerReuseCache, 0);
  objc_storeStrong((id *)&self->_directoryServerReuseCache, 0);
}

@end
