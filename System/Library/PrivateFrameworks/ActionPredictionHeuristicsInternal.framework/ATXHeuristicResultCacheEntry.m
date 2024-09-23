@implementation ATXHeuristicResultCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirers, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_heuristicName, 0);
}

- (void)dealloc
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *heuristicName;
  id WeakRetained;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_expirers;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        heuristicName = self->_heuristicName;
        WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
        objc_msgSend(v8, "stopExpiring:cache:", heuristicName, WeakRetained);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicResultCacheEntry;
  -[ATXHeuristicResultCacheEntry dealloc](&v11, sel_dealloc);
}

- (ATXHeuristicResultCacheEntry)initWithHeuristic:(id)a3 cache:(id)a4
{
  id v7;
  id v8;
  ATXHeuristicResultCacheEntry *v9;
  ATXHeuristicResultCacheEntry *v10;
  NSArray *actions;
  uint64_t v12;
  NSSet *expirers;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicResultCacheEntry;
  v9 = -[ATXHeuristicResultCacheEntry init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heuristicName, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
    actions = v10->_actions;
    v10->_actions = (NSArray *)MEMORY[0x1E0C9AA60];

    v12 = objc_opt_new();
    expirers = v10->_expirers;
    v10->_expirers = (NSSet *)v12;

  }
  return v10;
}

- (void)setActions:(id)a3 expirers:(id)a4
{
  NSSet *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *heuristicName;
  id WeakRetained;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  id v25;
  NSSet *expirers;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v7 = (NSSet *)a4;
  objc_storeStrong((id *)&self->_actions, a3);
  v8 = (void *)-[NSSet mutableCopy](self->_expirers, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v7);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
        heuristicName = self->_heuristicName;
        WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
        objc_msgSend(v14, "stopExpiring:cache:", heuristicName, WeakRetained);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  v17 = (void *)-[NSSet mutableCopy](v7, "mutableCopy");
  objc_msgSend(v17, "minusSet:", self->_expirers);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v22);
        v24 = self->_heuristicName;
        v25 = objc_loadWeakRetained((id *)&self->_cache);
        objc_msgSend(v23, "startExpiring:cache:", v24, v25);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

  expirers = self->_expirers;
  self->_expirers = v7;

}

@end
