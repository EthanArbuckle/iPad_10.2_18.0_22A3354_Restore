@implementation _HKChartCachePendingFetchOperationManager

- (_HKChartCachePendingFetchOperationManager)init
{
  _HKChartCachePendingFetchOperationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *fetchOperationsByIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *fetchOperationsByUUID;
  NSMutableDictionary *v7;
  NSMutableDictionary *retryCountByIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKChartCachePendingFetchOperationManager;
  v2 = -[_HKChartCachePendingFetchOperationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchOperationsByIdentifier = v2->_fetchOperationsByIdentifier;
    v2->_fetchOperationsByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchOperationsByUUID = v2->_fetchOperationsByUUID;
    v2->_fetchOperationsByUUID = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    retryCountByIdentifier = v2->_retryCountByIdentifier;
    v2->_retryCountByIdentifier = v7;

  }
  return v2;
}

- (void)addFetchOperation:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *fetchOperationsByIdentifier;
  void *v8;
  NSMutableDictionary *fetchOperationsByUUID;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKChartCache.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fetchOperation identifier] != nil"));

  }
  fetchOperationsByIdentifier = self->_fetchOperationsByIdentifier;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](fetchOperationsByIdentifier, "setObject:forKeyedSubscript:", v5, v8);

  fetchOperationsByUUID = self->_fetchOperationsByUUID;
  objc_msgSend(v5, "UUID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](fetchOperationsByUUID, "setObject:forKeyedSubscript:", v5, v11);

}

- (void)removeFetchOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](self->_fetchOperationsByUUID, "removeObjectForKey:", v6);
  -[NSMutableDictionary removeObjectForKey:](self->_fetchOperationsByIdentifier, "removeObjectForKey:", v5);

}

- (id)fetchOperationForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_fetchOperationsByIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)allPendingIdentifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableDictionary allKeys](self->_fetchOperationsByIdentifier, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)MEMORY[0x1E0C99E60];
  if (v4)
  {
    -[NSMutableDictionary allKeys](self->_fetchOperationsByIdentifier, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int64_t)retryCountForIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_retryCountByIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)incrementRetryCountForIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  v5 = -[_HKChartCachePendingFetchOperationManager retryCountForIdentifier:](self, "retryCountForIdentifier:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_retryCountByIdentifier, "setObject:forKeyedSubscript:", v6, v4);

}

- (void)resetRetryCountForIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_retryCountByIdentifier, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCountByIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByUUID, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByIdentifier, 0);
}

@end
