@implementation MCMChildParentMapCache

- (MCMChildParentMapCache)initWithDB:(id)a3 queue:(id)a4
{
  id v7;
  NSObject *v8;
  MCMChildParentMapCache *v9;
  MCMChildParentMapCache *v10;
  _QWORD block[4];
  MCMChildParentMapCache *v13;
  id v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCMChildParentMapCache;
  v9 = -[MCMChildParentMapCache init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_db, a3);
    objc_msgSend(v7, "setPeerageDelegate:", v10);
    objc_storeStrong((id *)&v10->_queue, a4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MCMChildParentMapCache_initWithDB_queue___block_invoke;
    block[3] = &unk_1E8CB6318;
    v13 = v10;
    v14 = v7;
    dispatch_sync(v8, block);

  }
  return v10;
}

- (id)childBundleIdentifiersForParentIdentifier:(id)a3
{
  id v4;
  MCMChildParentMapCache *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MCMChildParentMapCache cache](v5, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[MCMChildParentMapCache cache](v5, "cache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isEqualToString:", v4))
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  objc_sync_exit(v5);

  return v14;
}

- (id)parentIdentifierForChildIdentifier:(id)a3
{
  id v4;
  MCMChildParentMapCache *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MCMChildParentMapCache cache](v5, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)codeSigningDB:(id)a3 addChildIdentifier:(id)a4 forParentIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[MCMChildParentMapCache cache](self, "cache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)codeSigningDB:(id)a3 removeParentIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MCMChildParentMapCache cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[MCMChildParentMapCache cache](self, "cache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "isEqualToString:", v5))
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v9);
  }

  -[MCMChildParentMapCache cache](self, "cache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsForKeys:", v16);

}

- (MCMSQLiteDB)db
{
  return self->_db;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __43__MCMChildParentMapCache_initWithDB_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v8[0] = 0;
  objc_msgSend(v2, "childParentMapWithError:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8[0];
  v5 = objc_msgSend(v3, "mutableCopy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

}

@end
