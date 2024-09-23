@implementation CPLClientCacheBaseView

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v11;

  v4 = a3;
  -[CPLClientCacheBaseView idMapping](self, "idMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[CPLClientCacheBaseView cloudCache](self, "cloudCache"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "relatedScopedIdentifierForRecordWithScopedIdentifier:isFinal:", v6, 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(v5, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v10;

  v4 = a3;
  -[CPLClientCacheBaseView idMapping](self, "idMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CPLClientCacheBaseView cloudCache](self, "cloudCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasRecordAcknowledgedByClientWithScopedIdentifier:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  char v12;

  v6 = a3;
  -[CPLClientCacheBaseView idMapping](self, "idMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CPLClientCacheBaseView cloudCache](self, "cloudCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:class:", v8, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CPLClientCacheBaseView)initWithStore:(id)a3
{
  id v5;
  CPLClientCacheBaseView *v6;
  CPLClientCacheBaseView *v7;
  uint64_t v8;
  CPLEngineCloudCache *cloudCache;
  uint64_t v10;
  CPLEngineIDMapping *idMapping;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLClientCacheBaseView;
  v6 = -[CPLClientCacheBaseView init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    objc_msgSend(v5, "cloudCache");
    v8 = objc_claimAutoreleasedReturnValue();
    cloudCache = v7->_cloudCache;
    v7->_cloudCache = (CPLEngineCloudCache *)v8;

    objc_msgSend((id)objc_opt_class(), "clientCacheBaseViewIDMappingForStore:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    idMapping = v7->_idMapping;
    v7->_idMapping = (CPLEngineIDMapping *)v10;

  }
  return v7;
}

- (id)description
{
  return CFSTR("baseClientCache");
}

- (id)redactedDescription
{
  return CFSTR("baseClientCache");
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CPLClientCacheRecordView *v8;
  char v10;

  v4 = a3;
  v10 = 0;
  -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[CPLEngineCloudCache recordAcknowledgedByClientWithScopedIdentifier:](self->_cloudCache, "recordAcknowledgedByClientWithScopedIdentifier:", v5), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = -[CPLClientCacheRecordView initWithLocalScopedIdentifier:cloudRecord:idMapping:]([CPLClientCacheRecordView alloc], "initWithLocalScopedIdentifier:cloudRecord:idMapping:", v4, v6, self->_idMapping);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  CPLClientCacheRecordView *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:](self->_idMapping, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v6, &v23);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v18 = (void *)v7;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[CPLEngineCloudCache recordsAcknowledgedByClientWithRelatedScopedIdentifier:class:](self->_cloudCache, "recordsAcknowledgedByClientWithRelatedScopedIdentifier:class:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v16 = -[CPLClientCacheRecordView initWithLocalScopedIdentifier:cloudRecord:idMapping:]([CPLClientCacheRecordView alloc], "initWithLocalScopedIdentifier:cloudRecord:idMapping:", 0, v15, self->_idMapping);
          objc_msgSend(v12, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v8 = v18;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (CPLEngineCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

+ (id)clientCacheBaseViewIDMappingForStore:(id)a3
{
  id v3;
  _CPLOptimisticIDMapping *v4;
  void *v5;
  _CPLOptimisticIDMapping *v6;

  v3 = a3;
  v4 = [_CPLOptimisticIDMapping alloc];
  objc_msgSend(v3, "idMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_CPLOptimisticIDMapping initWithIDMapping:](v4, "initWithIDMapping:", v5);
  return v6;
}

@end
