@implementation ATXContextHeuristicCache

- (ATXContextHeuristicCache)init
{
  ATXContextHeuristicCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSHashTable *criteriaTable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXContextHeuristicCache;
  v2 = -[ATXContextHeuristicCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    criteriaTable = v2->_criteriaTable;
    v2->_criteriaTable = (NSHashTable *)v5;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXContextHeuristicCache;
  -[ATXContextHeuristicCache dealloc](&v3, sel_dealloc);
}

- (id)suggestionsForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (void)setSuggestions:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _opaque_pthread_mutex_t *p_lock;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v6, v7);
  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v7;
    v34 = 2048;
    v35 = objc_msgSend(v6, "count", p_lock);
    _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "[Cache internal] Adding suggestions for key %@: %lu", buf, 0x16u);
  }
  v23 = v7;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v24 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      v25 = v10;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        objc_msgSend(v13, "atxActionCriteria", p_lock, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __atxlog_handle_context_heuristic();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "uiSpecification");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uiSpecification");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reason");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "hash");
          objc_msgSend(v14, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v33 = v16;
          v34 = 2048;
          v35 = v19;
          v36 = 2112;
          v37 = v20;
          v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "[Cache internal] Adding criteria for suggestion %@, reason.hash %lu, start: %@ end: %@", buf, 0x2Au);

          v10 = v25;
          v11 = v24;

        }
        -[NSHashTable addObject:](self->_criteriaTable, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v10);
  }

  pthread_mutex_unlock(p_lock);
}

- (id)heuristicsCached
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  return v5;
}

- (id)allRelevantSuggestionsForDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  _opaque_pthread_mutex_t *p_lock;
  NSMutableDictionary *obj;
  uint64_t v23;
  ATXContextHeuristicCache *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v27 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = self;
  obj = self->_cache;
  v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v26 = v5;
        -[NSMutableDictionary objectForKeyedSubscript:](v24->_cache, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v5), p_lock);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v28 = v6;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v30 != v9)
                objc_enumerationMutation(v28);
              v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v11, "atxActionCriteria");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              __atxlog_handle_context_heuristic();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v12, "startDate");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "endDate");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v38 = v4;
                v39 = 2112;
                v40 = v14;
                v41 = 2112;
                v42 = v15;
                _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "[Cache internal] Considering date: %@ for interval %@ - %@", buf, 0x20u);

              }
              objc_msgSend(v12, "dateInterval");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "containsDate:", v4);

              if (v17)
              {
                objc_msgSend(v27, "addObject:", v11);
              }
              else
              {
                __atxlog_handle_context_heuristic();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v11;
                  _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "[Cache internal] Suggestion is no longer relevant: %@", buf, 0xCu);
                }

              }
            }
            v8 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
          }
          while (v8);
        }

        v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v25);
  }

  pthread_mutex_unlock(p_lock);
  v19 = (void *)objc_msgSend(v27, "copy");

  return v19;
}

- (id)nextChangeAfterDate:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = self->_criteriaTable;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_24;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v34;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
      objc_msgSend(v12, "startDate", (_QWORD)v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else
      {
        objc_msgSend(v12, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_18;
      }
      objc_msgSend(v12, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
        v17 = v16;
        objc_msgSend(v12, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        v20 = v19;

        if (v17 < v20)
        {
          objc_msgSend(v12, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "earlierDate:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            goto LABEL_16;
          objc_msgSend(v12, "startDate");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      objc_msgSend(v12, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
        v26 = v25;
        objc_msgSend(v12, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        v29 = v28;

        if (v26 < v29)
        {
          objc_msgSend(v12, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "earlierDate:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
LABEL_16:
            v23 = v22;
            v22 = v23;
          }
          else
          {
            objc_msgSend(v12, "endDate");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_17:
          v30 = v23;

          v9 = v30;
        }
      }
LABEL_18:
      ++v11;
    }
    while (v8 != v11);
    v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v8 = v31;
  }
  while (v31);
LABEL_24:

  pthread_mutex_unlock(p_lock);
  return v9;
}

- (void)evictBefore:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __40__ATXContextHeuristicCache_evictBefore___block_invoke;
        v13[3] = &unk_1E82C4790;
        v14 = v4;
        objc_msgSend(v10, "_pas_filteredArrayWithTest:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  pthread_mutex_unlock(&self->_lock);

}

uint64_t __40__ATXContextHeuristicCache_evictBefore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "atxActionCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate"),
        v7 = v6,
        objc_msgSend(v4, "endDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "timeIntervalSinceReferenceDate"),
        v10 = v9,
        v8,
        v7 >= v10))
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing suggestion: %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)evict:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing %@", (uint8_t *)&v6, 0xCu);
  }

  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v4);
  pthread_mutex_unlock(&self->_lock);

}

- (void)evictAll
{
  NSObject *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cache;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_context_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXContextHeuristicCache heuristicsCached](self, "heuristicsCached");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "[Cache internal] Removing all heuristics %@", (uint8_t *)&v7, 0xCu);

  }
  pthread_mutex_lock(&self->_lock);
  v5 = (NSMutableDictionary *)objc_opt_new();
  cache = self->_cache;
  self->_cache = v5;

  pthread_mutex_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaTable, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
