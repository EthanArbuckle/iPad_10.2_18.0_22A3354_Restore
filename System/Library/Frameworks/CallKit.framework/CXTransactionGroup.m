@implementation CXTransactionGroup

- (CXTransactionGroup)init
{
  CXTransactionGroup *v2;
  uint64_t v3;
  NSMutableDictionary *callSourceIdentifierToTransaction;
  uint64_t v5;
  NSMutableArray *mutableCallSources;
  uint64_t v7;
  NSMutableDictionary *providerSourceIdentifierToTransaction;
  uint64_t v9;
  NSMutableArray *mutableProviderSources;
  NSMutableDictionary *v11;
  NSMutableDictionary *serviceClientIdentifierToTransaction;
  NSMutableArray *v13;
  NSMutableArray *mutableServiceClients;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CXTransactionGroup;
  v2 = -[CXTransactionGroup init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    callSourceIdentifierToTransaction = v2->_callSourceIdentifierToTransaction;
    v2->_callSourceIdentifierToTransaction = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableCallSources = v2->_mutableCallSources;
    v2->_mutableCallSources = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    providerSourceIdentifierToTransaction = v2->_providerSourceIdentifierToTransaction;
    v2->_providerSourceIdentifierToTransaction = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    mutableProviderSources = v2->_mutableProviderSources;
    v2->_mutableProviderSources = (NSMutableArray *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serviceClientIdentifierToTransaction = v2->_serviceClientIdentifierToTransaction;
    v2->_serviceClientIdentifierToTransaction = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableServiceClients = v2->_mutableServiceClients;
    v2->_mutableServiceClients = v13;

  }
  return v2;
}

- (id)description
{
  void *v2;
  void *v3;

  -[CXTransactionGroup callSourceIdentifierToTransaction](self, "callSourceIdentifierToTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CXTransactionGroup transactions](self, "transactions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isComplete"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)callSources
{
  void *v2;
  void *v3;

  -[CXTransactionGroup mutableCallSources](self, "mutableCallSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)transactions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[CXTransactionGroup callSourceIdentifierToTransaction](self, "callSourceIdentifierToTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[CXTransactionGroup callSourceIdentifierToTransaction](self, "callSourceIdentifierToTransaction");
  else
    -[CXTransactionGroup providerSourceIdentifierToTransaction](self, "providerSourceIdentifierToTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)allActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CXTransactionGroup transactions](self, "transactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "actions", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v15;
}

- (id)transactionForCallSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CXTransactionGroup callSourceIdentifierToTransaction](self, "callSourceIdentifierToTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addAction:(id)a3 forCallSource:(id)a4
{
  id v6;
  CXTransaction *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CXTransactionGroup transactionForCallSource:](self, "transactionForCallSource:", v6);
  v7 = (CXTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(CXTransaction);
    -[CXTransactionGroup callSourceIdentifierToTransaction](self, "callSourceIdentifierToTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    -[CXTransactionGroup mutableCallSources](self, "mutableCallSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  -[CXTransaction addAction:](v7, "addAction:", v11);

}

- (NSArray)providerSources
{
  void *v2;
  void *v3;

  -[CXTransactionGroup mutableProviderSources](self, "mutableProviderSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addAction:(id)a3 forProviderSource:(id)a4
{
  id v6;
  CXTransaction *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CXTransactionGroup transactionForProviderSource:](self, "transactionForProviderSource:", v6);
  v7 = (CXTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(CXTransaction);
    -[CXTransactionGroup providerSourceIdentifierToTransaction](self, "providerSourceIdentifierToTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    -[CXTransactionGroup mutableProviderSources](self, "mutableProviderSources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  -[CXTransaction addAction:](v7, "addAction:", v11);

}

- (id)transactionForProviderSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CXTransactionGroup providerSourceIdentifierToTransaction](self, "providerSourceIdentifierToTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isServiceClientGroupComplete
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CXTransactionGroup serviceClientTransactions](self, "serviceClientTransactions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isComplete"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)serviceClientActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CXTransactionGroup serviceClientTransactions](self, "serviceClientTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "actions", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v15;
}

- (NSArray)serviceClientTransactions
{
  void *v2;
  void *v3;

  -[CXTransactionGroup serviceClientIdentifierToTransaction](self, "serviceClientIdentifierToTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)serviceClients
{
  void *v2;
  void *v3;

  -[CXTransactionGroup mutableServiceClients](self, "mutableServiceClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addAction:(id)a3 forServiceClient:(id)a4
{
  id v6;
  CXTransaction *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CXTransactionGroup transactionForServiceClient:](self, "transactionForServiceClient:", v6);
  v7 = (CXTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(CXTransaction);
    -[CXTransactionGroup serviceClientIdentifierToTransaction](self, "serviceClientIdentifierToTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    -[CXTransactionGroup mutableServiceClients](self, "mutableServiceClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  -[CXTransaction addAction:](v7, "addAction:", v11);

}

- (id)transactionForServiceClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CXTransactionGroup serviceClientIdentifierToTransaction](self, "serviceClientIdentifierToTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableDictionary)callSourceIdentifierToTransaction
{
  return self->_callSourceIdentifierToTransaction;
}

- (NSMutableArray)mutableCallSources
{
  return self->_mutableCallSources;
}

- (NSMutableDictionary)providerSourceIdentifierToTransaction
{
  return self->_providerSourceIdentifierToTransaction;
}

- (NSMutableArray)mutableProviderSources
{
  return self->_mutableProviderSources;
}

- (NSMutableArray)mutableServiceClients
{
  return self->_mutableServiceClients;
}

- (NSMutableDictionary)serviceClientIdentifierToTransaction
{
  return self->_serviceClientIdentifierToTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientIdentifierToTransaction, 0);
  objc_storeStrong((id *)&self->_mutableServiceClients, 0);
  objc_storeStrong((id *)&self->_mutableProviderSources, 0);
  objc_storeStrong((id *)&self->_providerSourceIdentifierToTransaction, 0);
  objc_storeStrong((id *)&self->_mutableCallSources, 0);
  objc_storeStrong((id *)&self->_callSourceIdentifierToTransaction, 0);
}

@end
