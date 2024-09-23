@implementation MTIDCompositeSecretStore

- (MTIDCompositeSecretStore)init
{
  MTIDCompositeSecretStore *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTIDCompositeSecretStore;
  v2 = -[MTIDCompositeSecretStore init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCompositeSecretStore setStores:](v2, "setStores:", v3);

  }
  return v2;
}

- (id)storeKeyForScheme:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "idType");
  v5 = CFSTR("Local");
  if (v4 == 2)
    v5 = CFSTR("Cloud");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = v5;
  objc_msgSend(v3, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)secretStoreForScheme:(id)a3
{
  id v4;
  MTIDCompositeSecretStore *v5;
  void *v6;
  void *v7;
  void *v8;
  MTIDCloudKitStore *v9;
  MTIDCloudKitStore *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTIDCompositeSecretStore storeKeyForScheme:](v5, "storeKeyForScheme:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCompositeSecretStore stores](v5, "stores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = [MTIDCloudKitStore alloc];
    objc_msgSend(v4, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MTIDCloudKitStore initWithContainerIdentifer:enableSync:](v10, "initWithContainerIdentifer:enableSync:", v11, objc_msgSend(v4, "idType") == 2);

    -[MTIDCompositeSecretStore stores](v5, "stores");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_sync_exit(v5);

  return v9;
}

- (id)schemesGroupedByStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[MTIDCompositeSecretStore storeKeyForScheme:](self, "storeKeyForScheme:", v11, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        objc_msgSend(v16, "addObject:", v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secretForScheme:options:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  -[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "resetSchemes:options:", v14, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v8, "count"))
  {
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "thenWithBlock:", &__block_literal_global_17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

MTPromise *__49__MTIDCompositeSecretStore_resetSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  -[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "maintainSchemes:options:", v13, v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "count"))
  {
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "thenWithBlock:", &__block_literal_global_12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

MTPromise *__52__MTIDCompositeSecretStore_maintainSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (void)clearLocalData
{
  MTIDCompositeSecretStore *v2;
  void *v3;
  id v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MTIDCompositeSecretStore stores](v2, "stores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_14);

}

uint64_t __42__MTIDCompositeSecretStore_clearLocalData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clearLocalData");
}

- (id)debugInfo
{
  MTIDCompositeSecretStore *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[MTIDCompositeSecretStore stores](v2, "stores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __37__MTIDCompositeSecretStore_debugInfo__block_invoke;
  v12 = &unk_24C7A18D0;
  v13 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);
  v14 = CFSTR("subStores");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __37__MTIDCompositeSecretStore_debugInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "debugInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  -[MTIDCompositeSecretStore schemesGroupedByStore:](self, "schemesGroupedByStore:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDCompositeSecretStore secretStoreForScheme:](self, "secretStoreForScheme:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "syncForSchemes:options:", v14, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v8, "addObject:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v8, "count"))
  {
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "thenWithBlock:", &__block_literal_global_21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

MTPromise *__51__MTIDCompositeSecretStore_syncForSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (NSMutableDictionary)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
  objc_storeStrong((id *)&self->_stores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stores, 0);
}

@end
