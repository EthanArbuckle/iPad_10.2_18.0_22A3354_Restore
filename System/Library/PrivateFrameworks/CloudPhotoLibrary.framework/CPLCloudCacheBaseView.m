@implementation CPLCloudCacheBaseView

- (CPLCloudCacheBaseView)initWithCloudCache:(id)a3 useFinal:(BOOL)a4
{
  id v7;
  CPLCloudCacheBaseView *v8;
  CPLCloudCacheBaseView *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudCacheBaseView;
  v8 = -[CPLCloudCacheBaseView init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cloudCache, a3);
    v9->_useFinal = a4;
  }

  return v9;
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", a3, self->_useFinal);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asRecordView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CPLEngineCloudCache recordsWithRelatedScopedIdentifier:class:isFinal:](self->_cloudCache, "recordsWithRelatedScopedIdentifier:class:isFinal:", v6, a4, self->_useFinal, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v13, "asRecordView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return CFSTR("cloudCache");
}

- (id)redactedDescription
{
  return CFSTR("cloudCache");
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (BOOL)useFinal
{
  return self->_useFinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudCache, 0);
}

@end
