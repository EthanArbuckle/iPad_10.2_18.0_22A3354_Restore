@implementation ML3DatabaseStatementCache

- (id)cachedStatementForSQL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_statementsDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[ML3StatementCacheList promoteNodeWithDictionaryKey:](self->_nodeList, "promoteNodeWithDictionaryKey:", v4);

  return v5;
}

- (id)allStatements
{
  return (id)-[NSMutableDictionary allValues](self->_statementsDictionary, "allValues");
}

- (void)cacheStatement:(id)a3
{
  void *v4;
  ML3StatementCacheNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  ML3StatementCacheList *nodeList;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "sql");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_statementsDictionary, "setObject:forKey:", v13, v4);
  v5 = -[ML3StatementCacheNode initWithDictionaryKey:]([ML3StatementCacheNode alloc], "initWithDictionaryKey:", v4);
  -[ML3StatementCacheList appendNode:](self->_nodeList, "appendNode:", v5);
  -[NSMutableDictionary allValues](self->_statementsDictionary, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_8909);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    while (-[ML3StatementCacheList count](self->_nodeList, "count") > self->_cacheSize)
    {
      -[ML3StatementCacheList oldestNode](self->_nodeList, "oldestNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_statementsDictionary, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isExecuting");
      nodeList = self->_nodeList;
      if (v11)
      {
        -[ML3StatementCacheList promoteNodeWithDictionaryKey:](nodeList, "promoteNodeWithDictionaryKey:", v9);
      }
      else
      {
        -[ML3StatementCacheList deleteOldestNode](nodeList, "deleteOldestNode");
        objc_msgSend(v10, "finalizeStatement");
        -[NSMutableDictionary removeObjectForKey:](self->_statementsDictionary, "removeObjectForKey:", v9);
      }

    }
  }

}

uint64_t __44__ML3DatabaseStatementCache_cacheStatement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExecuting") ^ 1;
}

- (ML3DatabaseStatementCache)initWithCacheSize:(unint64_t)a3
{
  ML3DatabaseStatementCache *v4;
  ML3DatabaseStatementCache *v5;
  uint64_t v6;
  NSMutableDictionary *statementsDictionary;
  ML3StatementCacheList *v8;
  ML3StatementCacheList *nodeList;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseStatementCache;
  v4 = -[ML3DatabaseStatementCache init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cacheSize = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4->_cacheSize);
    statementsDictionary = v5->_statementsDictionary;
    v5->_statementsDictionary = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(ML3StatementCacheList);
    nodeList = v5->_nodeList;
    v5->_nodeList = v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ML3DatabaseStatementCache clearCache](self, "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseStatementCache;
  -[ML3DatabaseStatementCache dealloc](&v3, sel_dealloc);
}

- (void)clearCache
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_statementsDictionary, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "finalizeStatement");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_statementsDictionary, "removeAllObjects");
  -[ML3StatementCacheList deleteAllNodes](self->_nodeList, "deleteAllNodes");

}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeList, 0);
  objc_storeStrong((id *)&self->_statementsDictionary, 0);
}

@end
