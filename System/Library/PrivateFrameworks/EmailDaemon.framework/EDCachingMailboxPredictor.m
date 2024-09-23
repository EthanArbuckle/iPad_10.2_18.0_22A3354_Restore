@implementation EDCachingMailboxPredictor

- (EDCachingMailboxPredictor)initWithPredictor:(id)a3
{
  id v4;
  EDCachingMailboxPredictor *v5;
  EDCachingMailboxPredictor *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDCachingMailboxPredictor;
  v5 = -[EDCachingMailboxPredictor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EDCachingMailboxPredictor setPredictor:](v5, "setPredictor:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[EDCachingMailboxPredictor setCache:](v6, "setCache:", v7);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCachingMailboxPredictor setCacheKeysByProperty:](v6, "setCacheKeysByProperty:", v8);

  }
  return v6;
}

- (id)predictMailboxIDsForMessages:(id)a3 limit:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  -[EDCachingMailboxPredictor _cacheKeyForMessages:](self, "_cacheKeyForMessages:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCachingMailboxPredictor cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v35 = (id)v8;
  if (v8)
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[EDCachingMailboxPredictor predictMailboxIDsForMessages:limit:].cold.2((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[EDCachingMailboxPredictor predictMailboxIDsForMessages:limit:].cold.1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

    -[EDCachingMailboxPredictor predictor](self, "predictor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predictMailboxIDsForMessages:limit:", v34, a4);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    -[EDCachingMailboxPredictor cache](self, "cache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v35, v6);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = v34;
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v9);
          v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          -[EDCachingMailboxPredictor _propertyKeysForMessage:](self, "_propertyKeysForMessage:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v37 != v31)
                  objc_enumerationMutation(v29);
                -[EDCachingMailboxPredictor _trackCacheKey:forPropertyKey:](self, "_trackCacheKey:forPropertyKey:", v6, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v30);
          }

        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v25);
    }
  }

  return v35;
}

- (void)invalidatePredictionsAffectedByMessage:(id)a3
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EDCachingMailboxPredictor _propertyKeysForMessage:](self, "_propertyKeysForMessage:", a3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = v4;
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[EDCachingMailboxPredictor cacheKeysByProperty](self, "cacheKeysByProperty");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              -[EDCachingMailboxPredictor cache](self, "cache");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "removeObjectForKey:", v13);

              -[EDCachingMailboxPredictor cacheKeysByProperty](self, "cacheKeysByProperty");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v6);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "removeObject:", v13);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }

}

- (void)removeAllPredictions
{
  id v3;
  id v4;

  -[EDCachingMailboxPredictor cacheKeysByProperty](self, "cacheKeysByProperty");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[EDCachingMailboxPredictor cache](self, "cache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (id)_cacheKeyForMessages:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "ef_mapSelector:", sel_persistentID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_trackCacheKey:(id)a3 forPropertyKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[EDCachingMailboxPredictor cacheKeysByProperty](self, "cacheKeysByProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    -[EDCachingMailboxPredictor cacheKeysByProperty](self, "cacheKeysByProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "addObject:", v11);

}

- (id)_propertyKeysForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listIDHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v28, "int64Value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = objc_msgSend(v3, "conversationID");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v3, "to", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_mapSelector:", sel_ea_uncommentedAddress);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0D1F088]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("R %@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithString:", v15);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "int64Value"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(v29, "from");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0D1F088]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("S %@"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "int64Value"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

  }
  objc_msgSend(v29, "persistentID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "longLongValue");

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

  }
  return v4;
}

- (EDMailboxPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_predictor, a3);
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSMutableDictionary)cacheKeysByProperty
{
  return self->_cacheKeysByProperty;
}

- (void)setCacheKeysByProperty:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKeysByProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKeysByProperty, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
}

- (void)predictMailboxIDsForMessages:(uint64_t)a3 limit:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "Cache miss for %@", a5, a6, a7, a8, 2u);
}

- (void)predictMailboxIDsForMessages:(uint64_t)a3 limit:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "Cache hit for %@", a5, a6, a7, a8, 2u);
}

@end
