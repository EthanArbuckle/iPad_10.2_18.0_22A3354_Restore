@implementation MapsSuggestionsLimitedDictionary

- (MapsSuggestionsLimitedDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  MapsSuggestionsLimitedDictionary *v3;
  MapsSuggestionsLimitedDictionary *v5;
  MapsSuggestionsLimitedDictionary *v6;
  uint64_t v7;
  NSMutableDictionary *dict;
  uint64_t v9;
  NSMutableDictionary *hits;
  uint64_t v11;
  NSMutableArray *order;
  MapsSuggestionsLimitedDictionary *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v3 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)MapsSuggestionsLimitedDictionary;
    v5 = -[MapsSuggestionsLimitedDictionary init](&v16, sel_init);
    v6 = v5;
    if (v5)
    {
      v5->_maxCapacity = a3;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
      dict = v6->_dict;
      v6->_dict = (NSMutableDictionary *)v7;

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
      hits = v6->_hits;
      v6->_hits = (NSMutableDictionary *)v9;

      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
      order = v6->_order;
      v6->_order = (NSMutableArray *)v11;

      v6->_totalHits = 0;
      v6->_totalMisses = 0;
    }
    v3 = v6;
    v13 = v3;
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      v19 = 1024;
      v20 = 32;
      v21 = 2082;
      v22 = "-[MapsSuggestionsLimitedDictionary initWithMaximumCapacity:]";
      v23 = 2082;
      v24 = "0u == maxCapacity";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This collection won't grow, so zero doens't make any sense.", buf, 0x26u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)objectForKeyedSubscript:(id)a3
{
  char *v4;
  MapsSuggestionsLimitedDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *hits;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  _BYTE v20[14];
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_hits, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "unsignedIntegerValue") + 1;
      hits = v5->_hits;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](hits, "setObject:forKey:", v10, v4);

      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          -[MapsSuggestionsLimitedDictionary totalHitRatio](v5, "totalHitRatio");
          v17 = 138412802;
          v18 = v4;
          v19 = 1024;
          *(_DWORD *)v20 = v8;
          *(_WORD *)&v20[4] = 2048;
          *(_QWORD *)&v20[6] = v12;
          _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "HIT '%@' x %u (total ratio: %.2f)", (uint8_t *)&v17, 0x1Cu);
        }

      }
      ++v5->_totalHits;
      -[NSMutableDictionary objectForKey:](v5->_dict, "objectForKey:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[MapsSuggestionsLimitedDictionary totalHitRatio](v5, "totalHitRatio");
          v17 = 138412546;
          v18 = v4;
          v19 = 2048;
          *(_QWORD *)v20 = v15;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "MISSED '%@' (total ratio: %.2f)", (uint8_t *)&v17, 0x16u);
        }

      }
      v13 = 0;
      ++v5->_totalMisses;
    }

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsLimitedDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      v19 = 1024;
      *(_DWORD *)v20 = 48;
      *(_WORD *)&v20[4] = 2082;
      *(_QWORD *)&v20[6] = "-[MapsSuggestionsLimitedDictionary objectForKeyedSubscript:]";
      v21 = 2082;
      v22 = "nil == (key)";
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v17, 0x26u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  MapsSuggestionsLimitedDictionary *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      v14 = 1024;
      v15 = 73;
      v16 = 2082;
      v17 = "-[MapsSuggestionsLimitedDictionary setObject:forKeyedSubscript:]";
      v18 = 2082;
      v19 = "nil == (key)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      v14 = 1024;
      v15 = 74;
      v16 = 2082;
      v17 = "-[MapsSuggestionsLimitedDictionary setObject:forKeyedSubscript:]";
      v18 = 2082;
      v19 = "nil == (obj)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an object", (uint8_t *)&v12, 0x26u);
    }
LABEL_13:

    goto LABEL_14;
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[NSMutableArray indexOfObject:](v8->_order, "indexOfObject:", v7);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](v8->_order, "removeObjectAtIndex:", v9);
  if (-[NSMutableArray count](v8->_order, "count", v9) + 1 > v8->_maxCapacity)
  {
    -[NSMutableArray firstObject](v8->_order, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](v8->_order, "removeObjectAtIndex:", 0);
    -[NSMutableDictionary removeObjectForKey:](v8->_dict, "removeObjectForKey:", v10);
    -[NSMutableDictionary removeObjectForKey:](v8->_hits, "removeObjectForKey:", v10);

  }
  -[NSMutableDictionary setObject:forKey:](v8->_dict, "setObject:forKey:", v6, v7);
  -[NSMutableDictionary setObject:forKey:](v8->_hits, "setObject:forKey:", &unk_1E4C09890, v7);
  -[NSMutableArray addObject:](v8->_order, "addObject:", v7);
  objc_sync_exit(v8);

LABEL_14:
}

- (void)removeObjectForKey:(id)a3
{
  MapsSuggestionsLimitedDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_dict, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](v4->_hits, "removeObjectForKey:", v5);
  -[NSMutableArray removeObject:](v4->_order, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeAllObjects
{
  MapsSuggestionsLimitedDictionary *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_dict, "removeAllObjects");
  -[NSMutableArray removeAllObjects](obj->_order, "removeAllObjects");
  obj->_totalHits = 0;
  obj->_totalMisses = 0;
  objc_sync_exit(obj);

}

- (unint64_t)count
{
  MapsSuggestionsLimitedDictionary *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_dict, "count");
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)hitsOnKey:(id)a3
{
  id v4;
  MapsSuggestionsLimitedDictionary *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_hits, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLimitedDictionary.m";
      v12 = 1024;
      v13 = 127;
      v14 = 2082;
      v15 = "-[MapsSuggestionsLimitedDictionary hitsOnKey:]";
      v16 = 2082;
      v17 = "nil == (key)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v10, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

- (double)totalHitRatio
{
  MapsSuggestionsLimitedDictionary *v2;
  unint64_t totalHits;
  unint64_t v4;
  double v5;

  v2 = self;
  objc_sync_enter(v2);
  totalHits = v2->_totalHits;
  v4 = v2->_totalMisses + totalHits;
  if (v4)
    v5 = (double)totalHits / (double)v4;
  else
    v5 = 0.0;
  objc_sync_exit(v2);

  return v5;
}

- (NSString)description
{
  MapsSuggestionsLimitedDictionary *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *context;
  NSMutableArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = objc_sync_enter(v2);
  context = (void *)MEMORY[0x1A859CDD8](v3);
  v22.receiver = v2;
  v22.super_class = (Class)MapsSuggestionsLimitedDictionary;
  -[MapsSuggestionsLimitedDictionary description](&v22, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "appendFormat:", CFSTR("(%u){ "), -[NSMutableDictionary count](v2->_dict, "count"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v2->_order;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_hits, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        -[NSMutableDictionary objectForKeyedSubscript:](v2->_dict, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("'%@' (%u hits) => '%@', "), v9, v11, v12);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  -[MapsSuggestionsLimitedDictionary totalHitRatio](v2, "totalHitRatio");
  objc_msgSend(v5, "appendFormat:", CFSTR("} (hit ratio: %.2f)"), v13);
  v14 = (void *)objc_msgSend(v5, "copy");

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v2);

  return (NSString *)v14;
}

- (void)triggerFired:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsLimitedDictionary uniqueName](self, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Throwing away all content for %@", (uint8_t *)&v6, 0xCu);

  }
  -[MapsSuggestionsLimitedDictionary removeAllObjects](self, "removeAllObjects");
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_hits, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
