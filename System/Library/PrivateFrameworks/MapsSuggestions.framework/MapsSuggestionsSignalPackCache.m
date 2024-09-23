@implementation MapsSuggestionsSignalPackCache

- (MapsSuggestionsSignalPackCache)init
{
  MapsSuggestionsSignalPackCache *v2;
  uint64_t v3;
  NSMutableArray *mapItems;
  uint64_t v5;
  NSMutableArray *signalPacks;
  uint64_t v7;
  NSMutableArray *entries;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsSignalPackCache;
  v2 = -[MapsSuggestionsSignalPackCache init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    mapItems = v2->_mapItems;
    v2->_mapItems = (NSMutableArray *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    signalPacks = v2->_signalPacks;
    v2->_signalPacks = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v7;

  }
  return v2;
}

- (BOOL)insertMapItem:(id)a3 signalPack:(id)a4 entry:(id)a5
{
  NSObject *v8;
  MapsSuggestionsSignalPackCache *v9;
  id *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  MapsSuggestionsSignalPackCache *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  NSObject *v28;
  NSObject *v29;
  id v30;
  _BYTE buf[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  v30 = a5;
  if (v29)
  {
    if (v8)
    {
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = self;
      objc_sync_enter(v9);
      MapsSuggestionsMapItemConvertIfNeeded(v8);
      v28 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        v11 = (void *)objc_msgSend(v10[3], "copy");
        v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __55__MapsSuggestionsSignalPackCache__removeExpiredEntries__block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E4BD1538;
        v13 = v12;
        *(_QWORD *)&buf[32] = v13;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", buf);
        v14 = (void *)objc_msgSend(v13, "copy");
        -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v10, v14);

        objc_sync_exit(v10);
      }
      while (1)
      {
        v15 = -[MapsSuggestionsSignalPackCache _count](v9);
        if (v15 < GEOConfigGetInteger())
          break;
        GEOFindOrCreateLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Popping a row because we hit the limit on the number of entries in the cache", buf, 2u);
        }

        if (v9)
        {
          v17 = v9;
          objc_sync_enter(v17);
          if (-[MapsSuggestionsSignalPackCache _count](v17))
          {
            v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 0);
            -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v17, v18);
          }
          else
          {
            GEOFindOrCreateLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "This should NOT have happened. Cannot pop when the count is zero!!", buf, 2u);
            }
          }

          objc_sync_exit(v17);
        }
      }
      -[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:](v9, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        GEOFindOrCreateLog();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = objc_msgSend(v19, "unsignedIntegerValue");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Removing an existing mapItem because we are refreshing the cache. Removing index %lu", buf, 0xCu);
        }

        -[NSMutableArray objectAtIndexedSubscript:](v9->_signalPacks, "objectAtIndexedSubscript:", objc_msgSend(v19, "unsignedIntegerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");

        -[NSObject mergeIntoSignalPack:](v29, "mergeIntoSignalPack:", v23);
        v24 = objc_msgSend(v23, "copy");

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", objc_msgSend(v19, "unsignedIntegerValue"));
        -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v9, v25);

      }
      else
      {
        v24 = v29;
      }
      -[NSMutableArray addObject:](v9->_mapItems, "addObject:", v28);
      -[NSMutableArray addObject:](v9->_signalPacks, "addObject:", v24);
      -[NSMutableArray addObject:](v9->_entries, "addObject:", v30);

      objc_sync_exit(v9);
      v26 = 1;
      v8 = v28;
    }
    else
    {
      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 44;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "-[MapsSuggestionsSignalPackCache insertMapItem:signalPack:entry:]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (mapItem)";
        _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", buf, 0x26u);
      }
      v26 = 0;
      v8 = v29;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 43;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsSignalPackCache insertMapItem:signalPack:entry:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (signalPack)";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. signalPack cannot be nil", buf, 0x26u);
    }
    v26 = 0;
  }

  return v26;
}

- (uint64_t)_count
{
  id *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_msgSend(v1[1], "count");
  objc_sync_exit(v1);

  return v2;
}

- (id)_containsSignalPackForMapItem:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  _BYTE *v14;
  _BYTE buf[38];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = a1;
      objc_sync_enter(v5);
      v6 = (void *)-[objc_class copy](v5[1].isa, "copy");
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      *(_QWORD *)&buf[24] = -1;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __64__MapsSuggestionsSignalPackCache__containsSignalPackForMapItem___block_invoke;
      v12 = &unk_1E4BD1560;
      v13 = v4;
      v14 = buf;
      objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, &v9);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == -1)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9, v10, v11, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(buf, 8);
      objc_sync_exit(v5);
    }
    else
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 119;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "-[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:]";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (mapItem)";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", buf, 0x26u);
      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeObjectsAtIndices:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v11 = 136446978;
        v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        v13 = 1024;
        v14 = 172;
        v15 = 2082;
        v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
        v17 = 2082;
        v18 = "nil == (indexSet)";
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an index set", (uint8_t *)&v11, 0x26u);
      }
      goto LABEL_18;
    }
    v5 = a1;
    objc_sync_enter(v5);
    v6 = -[objc_class count](v5[1].isa, "count");
    if (v6 == -[objc_class count](v5[2].isa, "count"))
    {
      v7 = -[objc_class count](v5[1].isa, "count");
      if (v7 == -[objc_class count](v5[3].isa, "count"))
      {
        v8 = -[objc_class count](v5[3].isa, "count");
        if (v8 == -[objc_class count](v5[2].isa, "count"))
        {
          -[objc_class removeObjectsAtIndexes:](v5[1].isa, "removeObjectsAtIndexes:", v4);
          -[objc_class removeObjectsAtIndexes:](v5[2].isa, "removeObjectsAtIndexes:", v4);
          -[objc_class removeObjectsAtIndexes:](v5[3].isa, "removeObjectsAtIndexes:", v4);
LABEL_17:
          objc_sync_exit(v5);
LABEL_18:

          goto LABEL_19;
        }
        GEOFindOrCreateLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = 136446978;
          v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
          v13 = 1024;
          v14 = 177;
          v15 = 2082;
          v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
          v17 = 2082;
          v18 = "_entries.count != _signalPacks.count";
          v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of entries should always be the same as the"
                " number of signalPacks";
          goto LABEL_15;
        }
LABEL_16:

        goto LABEL_17;
      }
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      v13 = 1024;
      v14 = 176;
      v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
      v17 = 2082;
      v18 = "_mapItems.count != _entries.count";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of mapItems should always be the same as the number of entries";
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      v13 = 1024;
      v14 = 175;
      v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
      v17 = 2082;
      v18 = "_mapItems.count != _signalPacks.count";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of mapItems should always be the same as the nu"
            "mber of signalPacks";
    }
LABEL_15:
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x26u);
    goto LABEL_16;
  }
LABEL_19:

}

void __55__MapsSuggestionsSignalPackCache__removeExpiredEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "hasExpired"))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);

}

uint64_t __64__MapsSuggestionsSignalPackCache__containsSignalPackForMapItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = MapsSuggestionsMapItemsAreEqual(a2, *(void **)(a1 + 32), 0, 0, 0);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)signalPackForMapItem:(id)a3
{
  id v4;
  MapsSuggestionsSignalPackCache *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
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
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:](v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v5->_signalPacks, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "shortAddress");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "signalPack not found for mapItem %@", (uint8_t *)&v12, 0xCu);

      }
      v8 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackCache *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      v14 = 1024;
      v15 = 143;
      v16 = 2082;
      v17 = "-[MapsSuggestionsSignalPackCache signalPackForMapItem:]";
      v18 = 2082;
      v19 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", (uint8_t *)&v12, 0x26u);
    }
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_signalPacks, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end
