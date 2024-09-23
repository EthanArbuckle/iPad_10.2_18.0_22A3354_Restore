@implementation ML3SortMap

- (ML3SortMap)initWithConnection:(id)a3 library:(id)a4 preloadNames:(BOOL)a5
{
  id v9;
  id v10;
  ML3SortMap *v11;
  ML3SortMap *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ML3SortMap;
  v11 = -[ML3SortMap init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_library, a4);
    v12->_smallestNameDelta = 0x7FFFFFFFFFFFFFFFLL;
    v12->_preloadNames = a5;
  }

  return v12;
}

- (BOOL)loadExistingSortedEntries
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *entries;
  NSMutableDictionary *v14;
  NSMutableDictionary *nameOrders;
  void *v16;
  ML3SortMapFaultingNameOrderDictionary *v17;
  ML3DatabaseConnection *connection;
  ML3DatabaseConnection *v19;
  ML3SortMap *v20;
  uint64_t v21;
  NSMutableDictionary *dirtyInserts;
  NSMutableDictionary *v23;
  ML3SortMapFaultingEntryArray *v24;
  ML3DatabaseConnection *v25;
  ML3DatabaseConnection *v26;
  ML3SortMap *v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  NSMutableArray *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableArray *v33;
  NSMutableArray *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v40[6];
  objc_super buf;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_entries || !self->_nameOrders)
  {
    if (self->_preloadNames)
    {
      v4 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      v5 = os_signpost_id_generate(v4);

      v6 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      v7 = v6;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        LOWORD(buf.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC149000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "db:fetch", ", (uint8_t *)&buf, 2u);
      }

      v8 = (void *)MEMORY[0x1AF43CC0C]();
      -[ML3DatabaseConnection executeQuery:](self->_connection, "executeQuery:", CFSTR("SELECT COUNT(*) FROM sort_map"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "int64ValueForFirstRowAndColumn");
      if (v10)
      {
        v11 = v10;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
        v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        entries = self->_entries;
        self->_entries = v12;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
        v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        nameOrders = self->_nameOrders;
        self->_nameOrders = v14;

        -[ML3DatabaseConnection executeQuery:](self->_connection, "executeQuery:", CFSTR("SELECT name, name_order, name_section, sort_key FROM sort_map ORDER BY name_order"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __39__ML3SortMap_loadExistingSortedEntries__block_invoke;
        v40[3] = &unk_1E5B616F8;
        v40[4] = self;
        v40[5] = a2;
        objc_msgSend(v16, "enumerateRowsWithBlock:", v40);
        v9 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v32 = self->_nameOrders;
        self->_nameOrders = v31;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v34 = self->_entries;
        self->_entries = v33;

      }
      v35 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)-[NSMutableArray count](self->_entries, "count");
        LODWORD(buf.receiver) = 134217984;
        *(id *)((char *)&buf.receiver + 4) = v36;
        _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_DEFAULT, "loaded %lu existing entries", (uint8_t *)&buf, 0xCu);
      }

      objc_autoreleasePoolPop(v8);
      v37 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      v38 = v37;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        LOWORD(buf.receiver) = 0;
        _os_signpost_emit_with_name_impl(&dword_1AC149000, v38, OS_SIGNPOST_INTERVAL_END, v5, "db:fetch", ", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      v17 = [ML3SortMapFaultingNameOrderDictionary alloc];
      connection = self->_connection;
      v19 = connection;
      if (v17)
      {
        buf.receiver = v17;
        buf.super_class = (Class)ML3SortMapFaultingNameOrderDictionary;
        v20 = -[ML3SortMap init](&buf, sel_init);
        v17 = (ML3SortMapFaultingNameOrderDictionary *)v20;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_connection, connection);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v21 = objc_claimAutoreleasedReturnValue();
          dirtyInserts = v17->_dirtyInserts;
          v17->_dirtyInserts = (NSMutableDictionary *)v21;

        }
      }

      v23 = self->_nameOrders;
      self->_nameOrders = &v17->super;

      v24 = [ML3SortMapFaultingEntryArray alloc];
      v25 = self->_connection;
      v26 = v25;
      if (v24)
      {
        buf.receiver = v24;
        buf.super_class = (Class)ML3SortMapFaultingEntryArray;
        v27 = -[ML3SortMap init](&buf, sel_init);
        v24 = (ML3SortMapFaultingEntryArray *)v27;
        if (v27)
        {
          objc_storeStrong((id *)&v27->_connection, v25);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v24->_dirtyInserts;
          v24->_dirtyInserts = (NSMutableDictionary *)v28;

        }
      }

      v30 = self->_entries;
      self->_entries = &v24->super;

    }
  }
  return 1;
}

- (BOOL)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  ML3DatabaseConnection *connection;
  void *v18;
  NSMutableDictionary *nameOrders;
  NSMutableArray *entries;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  -[ML3SortMap _sortedNameEntriesToInsertForNames:](self, "_sortedNameEntriesToInsertForNames:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ML3SortMap _insertSortedNameEntriesIntoSortMap:](self, "_insertSortedNameEntriesIntoSortMap:", v7))
  {
    v8 = 1;
  }
  else
  {
    if (a4)
      *a4 = 1;
    v9 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "initial sort map insert failed - commit what we have and force a rebuild", buf, 2u);
    }

    if (-[ML3SortMap commitUpdates](self, "commitUpdates"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = v6;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_nameOrders, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              connection = self->_connection;
              v29 = v15;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[ML3DatabaseConnection executeUpdate:withParameters:error:](connection, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO sort_map (name, sort_key) VALUES (?, '')"), v18, 0);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v12);
      }

      nameOrders = self->_nameOrders;
      self->_nameOrders = 0;

      entries = self->_entries;
      self->_entries = 0;

      if (-[ML3MusicLibrary updateSortMapOnConnection:forceUpdateOriginals:](self->_library, "updateSortMapOnConnection:forceUpdateOriginals:", self->_connection, 0))
      {
        -[ML3SortMap _sortedNameEntriesToInsertForNames:](self, "_sortedNameEntriesToInsertForNames:", v10);
        v21 = objc_claimAutoreleasedReturnValue();

        v8 = -[ML3SortMap _insertSortedNameEntriesIntoSortMap:](self, "_insertSortedNameEntriesIntoSortMap:", v21);
        v7 = (void *)v21;
      }
      else
      {
        v8 = 0;
      }
      v6 = v23;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)attemptInsertStringsIntoSortMap:(id)a3
{
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  -[ML3SortMap _sortedNameEntriesToInsertForNames:](self, "_sortedNameEntriesToInsertForNames:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ML3SortMap _insertSortedNameEntriesIntoSortMap:](self, "_insertSortedNameEntriesIntoSortMap:", v4);
  if (!v5)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "initial sort map insert failed - commit what we have and force a rebuild", v8, 2u);
    }

  }
  return v5;
}

- (BOOL)commitFailedInsertedStrings:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  ML3DatabaseConnection *connection;
  void *v13;
  NSMutableDictionary *nameOrders;
  NSMutableArray *entries;
  BOOL v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ML3SortMap loadExistingSortedEntries](self, "loadExistingSortedEntries");
  if (-[ML3SortMap commitUpdates](self, "commitUpdates"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_nameOrders, "objectForKey:", v10, (_QWORD)v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            connection = self->_connection;
            v23 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[ML3DatabaseConnection executeUpdate:withParameters:error:](connection, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO sort_map (name, sort_key) VALUES (?, '')"), v13, 0);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    nameOrders = self->_nameOrders;
    self->_nameOrders = 0;

    entries = self->_entries;
    self->_entries = 0;

    v16 = 0;
    if (-[ML3MusicLibrary updateSortMapOnConnection:forceUpdateOriginals:](self->_library, "updateSortMapOnConnection:forceUpdateOriginals:", self->_connection, 0))
    {
      -[ML3SortMap _sortedNameEntriesToInsertForNames:](self, "_sortedNameEntriesToInsertForNames:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[ML3SortMap _insertSortedNameEntriesIntoSortMap:](self, "_insertSortedNameEntriesIntoSortMap:", v17);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_sortedNameEntriesToInsertForNames:(id)a3
{
  id v5;
  void *v6;
  ML3MusicLibrary *library;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  ML3SortMap *v18;
  id v19;
  SEL v20;

  v5 = a3;
  -[ML3SortMap loadExistingSortedEntries](self, "loadExistingSortedEntries");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  library = self->_library;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__ML3SortMap__sortedNameEntriesToInsertForNames___block_invoke;
  v16 = &unk_1E5B61720;
  v20 = a2;
  v17 = v5;
  v18 = self;
  v8 = v6;
  v19 = v8;
  v9 = v5;
  -[ML3MusicLibrary accessSortKeyBuilder:](library, "accessSortKeyBuilder:", &v13);
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_5057, v13, v14, v15, v16);
  v10 = v19;
  v11 = v8;

  return v11;
}

- (BOOL)_insertSortedNameEntriesIntoSortMap:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  ML3MusicLibrary *library;
  BOOL v21;
  unint64_t v23;
  os_signpost_id_t v24;
  SEL v25;
  id v26;
  _QWORD v27[4];
  id v28;
  ML3SortMap *v29;
  uint64_t *v30;
  SEL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v7 = -[ML3SortMap loadExistingSortedEntries](self, "loadExistingSortedEntries");
  *((_BYTE *)v38 + 24) = v7;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    v9 = os_signpost_id_generate(v8);

    v10 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC149000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "insert", ", buf, 2u);
    }

    v23 = v9 - 1;
    v24 = v9;
    v25 = a2;
    v26 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v14 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_entries, "indexOfObject:inSortedRange:options:usingComparator:", v17, v14, -[NSMutableArray count](self->_entries, "count", v23) - v14, 1536, &__block_literal_global_5057);
          -[NSMutableArray insertObject:atIndex:](self->_entries, "insertObject:atIndex:", v17, v14);
          objc_msgSend(v6, "addIndex:", v14);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v13);
    }

    v5 = v26;
    v18 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    v19 = v18;
    if (v23 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AC149000, v19, OS_SIGNPOST_INTERVAL_END, v24, "insert", ", buf, 2u);
    }

    library = self->_library;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __50__ML3SortMap__insertSortedNameEntriesIntoSortMap___block_invoke;
    v27[3] = &unk_1E5B61748;
    v28 = v6;
    v29 = self;
    v30 = &v37;
    v31 = v25;
    -[ML3MusicLibrary accessSortKeyBuilder:](library, "accessSortKeyBuilder:", v27);

    v21 = *((_BYTE *)v38 + 24) != 0;
  }
  else
  {
    v21 = 0;
  }
  _Block_object_dispose(&v37, 8);

  return v21;
}

- (id)_minSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  NSData *minSortKey;
  NSData *v6;
  NSData *v7;

  minSortKey = self->_minSortKey;
  if (!minSortKey)
  {
    v6 = (NSData *)iPhoneSortKeyBuilderCopySectionSortKey((uint64_t)a4, 0, 0);
    v7 = self->_minSortKey;
    self->_minSortKey = v6;

    minSortKey = self->_minSortKey;
  }
  return minSortKey;
}

- (id)_maxSortKeyForEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  NSData *maxSortKey;
  NSData *v6;
  NSData *v7;
  char v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  maxSortKey = self->_maxSortKey;
  if (!maxSortKey)
  {
    v9 = *((_BYTE *)a4 + 32) + 48;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v9, 1);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v10[0] = -1;
    -[NSData appendBytes:length:](v6, "appendBytes:length:", v10, 8);
    v7 = self->_maxSortKey;
    self->_maxSortKey = v6;

    maxSortKey = self->_maxSortKey;
  }
  return maxSortKey;
}

- (int64_t)_minNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  return 0;
}

- (int64_t)_maxNameOrderForSortMapEntry:(id)a3 iPhoneSortKeyBuilder:(iPhoneSortKeyBuilder *)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_sortKeyDistance:(id)a3 sortKey2:(id)a4 offset:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "length");
  v10 = objc_msgSend(v8, "length");
  v11 = objc_retainAutorelease(v7);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v8);
  v14 = objc_msgSend(v13, "bytes");
  if (a5 > 0xFFFFFFFFFFFFFFF8)
  {
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v16 = a5 + 7;
    do
    {
      if (a5 >= v9)
        v17 = 0;
      else
        v17 = *(unsigned __int8 *)(v12 + a5);
      if (a5 >= v10)
        v18 = 0;
      else
        v18 = *(unsigned __int8 *)(v14 + a5);
      v15 = (v15 << 8) - v17 + v18;
      ++a5;
    }
    while (a5 < v16);
  }

  return v15;
}

- (id)_sortKeyString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v6 + v7++));
    while (objc_msgSend(v5, "length") > v7);
  }

  return v4;
}

- (BOOL)commitUpdates
{
  void *v3;
  void *v4;
  NSMutableArray *entries;
  id *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  Class isa;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  ML3DatabaseConnection *connection;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  BOOL v35;
  NSObject *v36;
  NSObject *v37;
  BOOL v38;
  const char *v39;
  BOOL v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  BOOL v44;
  NSMutableArray *v45;
  int v46;
  char v47;
  NSObject *v48;
  uint64_t v49;
  _BOOL4 v50;
  BOOL v51;
  NSObject *v52;
  void *v54;
  id v55;
  char v56;
  _QWORD v57[5];
  _QWORD v58[4];
  id v59;
  _QWORD v60[5];
  _QWORD v61[4];
  id v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  __int128 buf;
  void (*v75)(uint64_t, void *, _BYTE *, uint64_t);
  void *v76;
  _QWORD *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 1;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  entries = self->_entries;
  if (self->_preloadNames)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __27__ML3SortMap_commitUpdates__block_invoke;
    v68[3] = &unk_1E5B61770;
    v69 = v3;
    -[NSMutableArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v68);
    v6 = &v69;
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __27__ML3SortMap_commitUpdates__block_invoke_2;
    v66[3] = &unk_1E5B652A0;
    v67 = v3;
    v8 = v66;
    v9 = v8;
    if (entries)
    {
      isa = entries[2].super.super.isa;
      *(_QWORD *)&buf = v7;
      *((_QWORD *)&buf + 1) = 3221225472;
      v75 = __64__ML3SortMapFaultingEntryArray_enumerateDirtyObjectsUsingBlock___block_invoke;
      v76 = &unk_1E5B618D8;
      v77 = v8;
      -[objc_class enumerateKeysAndObjectsUsingBlock:](isa, "enumerateKeysAndObjectsUsingBlock:", &buf);

    }
    v6 = &v67;
  }

  if (objc_msgSend(v4, "count"))
  {
    v11 = objc_msgSend(v4, "count");
    if (v11 < 0x1F4)
      goto LABEL_64;
    v12 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v4, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "dropping sort_map indexes for %lu additions", (uint8_t *)&buf, 0xCu);
    }

    v14 = +[ML3MusicLibrary dropIndexesUsingConnection:tableNames:](ML3MusicLibrary, "dropIndexesUsingConnection:tableNames:", self->_connection, "'sort_map'");
    *((_BYTE *)v71 + 24) = v14;
    if (v14)
    {
LABEL_64:
      v15 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("CREATE TABLE IF NOT EXISTS sort_map_no_uniques (name TEXT, name_order INTEGER, name_section INTEGER, sort_key BLOB)"));
      *((_BYTE *)v71 + 24) = v15;
      if (v15)
      {
        v16 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("DELETE FROM sort_map_no_uniques;"));
        *((_BYTE *)v71 + 24) = v16;
        if (v16)
        {
          v17 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v18 = os_signpost_id_generate(v17);

          v19 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v20 = v19;
          v21 = v18 - 1;
          if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1AC149000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "insert:nameOrder", ", (uint8_t *)&buf, 2u);
          }

          v22 = MEMORY[0x1E0C809B0];
          connection = self->_connection;
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __27__ML3SortMap_commitUpdates__block_invoke_265;
          v63[3] = &unk_1E5B617C0;
          v63[4] = self;
          v55 = v4;
          v64 = v55;
          v65 = &v70;
          -[ML3DatabaseConnection performTransactionWithBlock:](connection, "performTransactionWithBlock:", v63);
          v24 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v25 = v24;
          if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1AC149000, v25, OS_SIGNPOST_INTERVAL_END, v18, "insert:nameOrder", ", (uint8_t *)&buf, 2u);
          }

          if (!*((_BYTE *)v71 + 24))
          {
            v40 = 0;
LABEL_60:

            goto LABEL_61;
          }
          v26 = os_log_create("com.apple.amp.medialibrary", "SortMap");
          v27 = v26;
          if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1AC149000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v18, "move", ", (uint8_t *)&buf, 2u);
          }

          v56 = __exceptionsEnabled;
          __exceptionsEnabled = 0;
          v28 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("INSERT INTO sort_map (name, name_order, name_section, sort_key) SELECT name, name_order, name_section, sort_key FROM sort_map_no_uniques"));
          *((_BYTE *)v71 + 24) = v28;
          if (v28)
          {
LABEL_40:
            __exceptionsEnabled = v56;
            if (!-[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("DELETE FROM sort_map_no_uniques;"),
                    v54))
            {
              v41 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1AC149000, v41, OS_LOG_TYPE_ERROR, "failed to delete sort_map_no_uniques", (uint8_t *)&buf, 2u);
              }

            }
            v42 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            v43 = v42;
            if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              LOWORD(buf) = 0;
              _os_signpost_emit_with_name_impl(&dword_1AC149000, v43, OS_SIGNPOST_INTERVAL_END, v18, "move", ", (uint8_t *)&buf, 2u);
            }
            v44 = v11 < 0x1F4;

            v45 = self->_entries;
            self->_entries = 0;

            v46 = *((unsigned __int8 *)v71 + 24);
            if (*((_BYTE *)v71 + 24))
              v47 = v44;
            else
              v47 = 1;
            if ((v47 & 1) == 0)
            {
              v48 = os_log_create("com.apple.amp.medialibrary", "SortMap");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v49 = objc_msgSend(v55, "count");
                LODWORD(buf) = 134217984;
                *(_QWORD *)((char *)&buf + 4) = v49;
                _os_log_impl(&dword_1AC149000, v48, OS_LOG_TYPE_DEFAULT, "recreating sort_map indexes for %lu additions", (uint8_t *)&buf, 0xCu);
              }

              v50 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("CREATE INDEX IF NOT EXISTS SortMapSortKeys ON sort_map (sort_key ASC)"));
              *((_BYTE *)v71 + 24) = v50;
              if (v50
                && (v51 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("ANALYZE;")),
                    (*((_BYTE *)v71 + 24) = v51) != 0))
              {
                v46 = 1;
              }
              else
              {
                v52 = os_log_create("com.apple.amp.medialibrary", "SortMap");
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_impl(&dword_1AC149000, v52, OS_LOG_TYPE_ERROR, "failed to rebuild sort_map indexes", (uint8_t *)&buf, 2u);
                }

                v46 = *((unsigned __int8 *)v71 + 24);
              }
            }
            v40 = v46 != 0;
            goto LABEL_60;
          }
          v29 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_ERROR, "Failed to merge into sort_map - attempting to repair and try again", (uint8_t *)&buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3DatabaseConnection executeQuery:](self->_connection, "executeQuery:", CFSTR("SELECT ROWID, name, name_order, name_section, sort_key FROM sort_map_no_uniques WHERE name IN (SELECT name FROM sort_map_no_uniques GROUP BY name HAVING COUNT() > 1)"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = v22;
          v61[1] = 3221225472;
          v61[2] = __27__ML3SortMap_commitUpdates__block_invoke_277;
          v61[3] = &unk_1E5B65EE0;
          v32 = v30;
          v62 = v32;
          objc_msgSend(v31, "enumerateRowsWithBlock:", v61);
          v60[0] = v22;
          v60[1] = 3221225472;
          v60[2] = __27__ML3SortMap_commitUpdates__block_invoke_278;
          v60[3] = &unk_1E5B617E8;
          v60[4] = self;
          objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v60);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3DatabaseConnection executeQuery:](self->_connection, "executeQuery:", CFSTR("SELECT sort_map_no_uniques.name, sort_map_no_uniques.name_order, sort_map_no_uniques.name_section, sort_map_no_uniques.sort_key, sort_map.name, sort_map.name_order, sort_map.name_section, sort_map.sort_key FROM sort_map_no_uniques JOIN sort_map USING (name) WHERE sort_map_no_uniques.name IN (SELECT name FROM sort_map)"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v58[0] = v22;
          v58[1] = 3221225472;
          v58[2] = __27__ML3SortMap_commitUpdates__block_invoke_2_284;
          v58[3] = &unk_1E5B65EE0;
          v34 = v33;
          v59 = v34;
          objc_msgSend(v54, "enumerateRowsWithBlock:", v58);
          v57[0] = v22;
          v57[1] = 3221225472;
          v57[2] = __27__ML3SortMap_commitUpdates__block_invoke_285;
          v57[3] = &unk_1E5B61810;
          v57[4] = self;
          objc_msgSend(v34, "enumerateObjectsUsingBlock:", v57);
          v35 = -[ML3DatabaseConnection executeUpdate:](self->_connection, "executeUpdate:", CFSTR("INSERT INTO sort_map (name, name_order, name_section, sort_key) SELECT name, name_order, name_section, sort_key FROM sort_map_no_uniques"));
          *((_BYTE *)v71 + 24) = v35;
          _ML3LogCategoryDefault();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v35)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_DEFAULT, "Successfully merged into sort_map after removing invalid entries - rebuilding to repair tables", (uint8_t *)&buf, 2u);
            }

            v38 = -[ML3MusicLibrary inTransactionUpdateSortMapOnConnection:forceRebuild:forceUpdateOriginals:](self->_library, "inTransactionUpdateSortMapOnConnection:forceRebuild:forceUpdateOriginals:", self->_connection, 1, 1);
            *((_BYTE *)v71 + 24) = v38;
            if (v38)
              goto LABEL_39;
            _ML3LogCategoryDefault();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              v39 = "Failed to rebuild the sort map after merge - failing commit!";
LABEL_37:
              _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_ERROR, v39, (uint8_t *)&buf, 2u);
            }
          }
          else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            v39 = "Failed to merge into sort_map after removing invalid entries - failing commit";
            goto LABEL_37;
          }

LABEL_39:
          goto LABEL_40;
        }
      }
    }
    v40 = 0;
  }
  else
  {
    v40 = 1;
  }
LABEL_61:

  _Block_object_dispose(&v70, 8);
  return v40;
}

- (id)nameOrders
{
  return self->_nameOrders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSortKey, 0);
  objc_storeStrong((id *)&self->_minSortKey, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_nameOrders, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __27__ML3SortMap_commitUpdates__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 36))
    return objc_msgSend(*(id *)(result + 32), "addIndex:");
  return result;
}

uint64_t __27__ML3SortMap_commitUpdates__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:");
}

BOOL __27__ML3SortMap_commitUpdates__block_invoke_265(_QWORD *a1)
{
  void *v2;
  id v3;
  ML3StatementAccumulator *v4;
  void *v5;
  void *v6;
  ML3StatementAccumulator *v7;
  int v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, _BYTE *);
  void *v15;
  uint64_t v16;
  ML3StatementAccumulator *v17;
  __CFString *v18;
  uint64_t v19;

  v2 = (void *)MEMORY[0x1AF43CC0C]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(id *)(a1[4] + 8);
    v4 = -[ML3StatementAccumulator initWithConnection:]([ML3StatementAccumulator alloc], "initWithConnection:", *(_QWORD *)(a1[4] + 8));
    objc_msgSend(v3, "currentTransactionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3StatementAccumulator setExistingTransactionIdentifier:](v4, "setExistingTransactionIdentifier:", v5);

    -[ML3StatementAccumulator setPriorityLevel:](v4, "setPriorityLevel:", 0);
    -[ML3StatementAccumulator setStatementThreshold:](v4, "setStatementThreshold:", 200);

  }
  else
  {
    v4 = 0;
  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __27__ML3SortMap_commitUpdates__block_invoke_2_270;
  v15 = &unk_1E5B61798;
  v6 = (void *)a1[5];
  v16 = a1[4];
  v7 = v4;
  v17 = v7;
  v18 = CFSTR("INSERT INTO sort_map_no_uniques (name, name_order, name_section, sort_key) VALUES (?, ?, ?, ?)");
  v19 = a1[6];
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", &v12);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = -[ML3StatementAccumulator flushAndWait:](v7, "flushAndWait:", 1, v12, v13, v14, v15, v16);
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  v10 = v8 != 0;

  objc_autoreleasePoolPop(v2);
  return v10;
}

void __27__ML3SortMap_commitUpdates__block_invoke_277(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "int64ForColumnIndex:", 2);
  v7 = objc_msgSend(v3, "intForColumnIndex:", 3);
  objc_msgSend(v3, "dataForColumnIndex:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v12 = 138544130;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_FAULT, "Found duplicate sort_map_no_uniques entry with common name. name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@", (uint8_t *)&v12, 0x26u);
  }

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v5);

}

void __27__ML3SortMap_commitUpdates__block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = a2;
  v9[1] = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM sort_map_no_uniques WHERE name = ? AND ROWID != ?"), v8, 0);

}

void __27__ML3SortMap_commitUpdates__block_invoke_2_284(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v6 = objc_msgSend(v3, "intForColumnIndex:", 2);
  objc_msgSend(v3, "dataForColumnIndex:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "int64ForColumnIndex:", 5);
  v10 = objc_msgSend(v3, "intForColumnIndex:", 6);
  objc_msgSend(v3, "dataForColumnIndex:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v13 = 138545154;
    v14 = v4;
    v15 = 2048;
    v16 = v5;
    v17 = 1024;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 1024;
    v26 = v10;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_FAULT, "Found matching entries in both sort_map_no_uniques and sort_map. NEW: name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@. EXISTING: name='%{public}@', name_order=%lld, name_section=%d, sort_key=%{public}@", (uint8_t *)&v13, 0x4Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __27__ML3SortMap_commitUpdates__block_invoke_285(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM sort_map_no_uniques WHERE name = ?"), v5, 0, v6, v7);

}

void __27__ML3SortMap_commitUpdates__block_invoke_2_270(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1AF43CC0C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndex:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(int *)(v7 + 32);
  v9 = *(_QWORD *)(v7 + 8);
  v10 = *(id *)(v7 + 16);
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  v13 = *(void **)(v7 + 24);
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (*(_QWORD *)(a1 + 40))
  {
    +[ML3DatabaseNaturalStatement naturalStatementWithSQL:parameters:](ML3DatabaseNaturalStatement, "naturalStatementWithSQL:parameters:", *(_QWORD *)(a1 + 48), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "enqueueStatement:", v16);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeUpdate:withParameters:error:", *(_QWORD *)(a1 + 48), v15, 0);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_BYTE *)(v7 + 36) = 0;
  }
  else
  {
    v17 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "sort map insertion failed for '%{public}@'", (uint8_t *)&v18, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a3 = 1;
  }

  objc_autoreleasePoolPop(v6);
}

void __50__ML3SortMap__insertSortedNameEntriesIntoSortMap___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  int64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v2 = a1;
  v65 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "firstIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return;
  v4 = v3;
  i = 0;
  v6 = 0;
  v53 = v2;
  while (1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 32), "objectAtIndex:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 32), "objectAtIndex:", v4 - 1);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (i <= v4)
    {
      for (i = v4 + 1; i < objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 32), "count"); ++i)
      {
        v9 = (void *)v6;
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 40) + 32), "objectAtIndex:", i);
        v6 = objc_claimAutoreleasedReturnValue();

        if (!v6 || *(uint64_t *)(v6 + 8) >= 1)
          goto LABEL_13;
      }

      v6 = 0;
    }
LABEL_13:
    if (v8)
    {
      v10 = *(_QWORD *)(v8 + 8);
      if (v6)
        goto LABEL_15;
    }
    else
    {
      v10 = objc_msgSend(*(id *)(v2 + 40), "_minNameOrderForSortMapEntry:iPhoneSortKeyBuilder:", v7, a2);
      if (v6)
      {
LABEL_15:
        v11 = *(_QWORD *)(v6 + 8);
        goto LABEL_18;
      }
    }
    v11 = objc_msgSend(*(id *)(v2 + 40), "_maxNameOrderForSortMapEntry:iPhoneSortKeyBuilder:", v7, a2);
LABEL_18:
    v12 = v11 - v10;
    if (v11 <= v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v8)
        v40 = *(_QWORD *)(v8 + 16);
      else
        v40 = 0;
      if (v6)
        v50 = *(_QWORD *)(v6 + 16);
      else
        v50 = 0;
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v53 + 56), *(_QWORD *)(v53 + 40), CFSTR("ML3SortMap.m"), 816, CFSTR("corrupted name ordering detected. prevNameOrder=%lld, nextNameOrder=%lld, prevEntry=%@, nextEntry=%@"), v10, v11, v40, v50);

      v2 = v53;
    }
    if (v12 == 1)
      break;
    if (v8)
    {
      v13 = *(id *)(v8 + 24);
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 40), "_minSortKeyForEntry:iPhoneSortKeyBuilder:", v7, a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    v58 = v4;
    v59 = v7;
    v56 = v10;
    v57 = (_QWORD *)v8;
    v55 = v12;
    if (v6)
    {
      v15 = *(id *)(v6 + 24);
      v16 = (id *)v7;
    }
    else
    {
      v16 = (id *)v7;
      objc_msgSend(*(id *)(v53 + 40), "_maxSortKeyForEntry:iPhoneSortKeyBuilder:", v7, a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_retainAutorelease(v14);
    v18 = objc_msgSend(v17, "bytes");
    v19 = objc_retainAutorelease(v15);
    v20 = objc_msgSend(v19, "bytes");
    v21 = objc_msgSend(v16[3], "bytes");
    v22 = v17;
    v23 = objc_msgSend(v17, "length");
    v60 = v19;
    v24 = objc_msgSend(v19, "length");
    v25 = objc_msgSend(v16[3], "length");
    if (v23 >= v24)
      v26 = v24;
    else
      v26 = v23;
    v27 = 0;
    if (v26 >= v25)
      v26 = v25;
    if (v26)
    {
      v28 = v55;
      v29 = v59;
      v2 = v53;
      while (1)
      {
        v30 = *(unsigned __int8 *)(v18 + v27);
        if (v30 != *(unsigned __int8 *)(v20 + v27) || v30 != *(unsigned __int8 *)(v21 + v27))
          break;
        if (v26 == ++v27)
        {
          v27 = v26;
          break;
        }
      }
    }
    else
    {
      v28 = v55;
      v29 = v59;
      v2 = v53;
    }
    v31 = objc_msgSend(*(id *)(v2 + 40), "_sortKeyDistance:sortKey2:offset:", v22, v60, v27);
    v32 = objc_msgSend(*(id *)(v2 + 40), "_sortKeyDistance:sortKey2:offset:", v22, *((_QWORD *)v29 + 3), v27);
    v33 = v32;
    if (v31 >= 2 && v32 <= v31)
    {
      if (!v57)
        goto LABEL_47;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v57)
        v43 = v57[2];
      else
        v43 = 0;
      if (v6)
        v51 = *(_QWORD *)(v6 + 16);
      else
        v51 = 0;
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 40), CFSTR("ML3SortMap.m"), 841, CFSTR("incorrect sort key distance calculated. sortKeyGap=%lld, sortEntryDelta=%lld. prevEntry=%@, nextEntry=%@"), v31, v33, v43, v51);

      if (!v57)
        goto LABEL_47;
    }
    if (v33 <= 0 && compareSortKeys(v22, *((void **)v29 + 3)) >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 40), CFSTR("ML3SortMap.m"), 842, CFSTR("entryDistance = 0, but sort keys are descending"));

    }
LABEL_47:
    if (v33 >= v31 && compareSortKeys(v60, *((void **)v29 + 3)) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 40), CFSTR("ML3SortMap.m"), 843, CFSTR("entryDistance = gapDistance, but sort keys are ascending"));

      if (v33)
        goto LABEL_50;
    }
    else if (v33)
    {
      goto LABEL_50;
    }
    if (compareSortKeys(v22, *((void **)v29 + 3)))
      goto LABEL_61;
LABEL_50:
    if (v33 == v31 && compareSortKeys(v60, *((void **)v29 + 3)))
    {
LABEL_61:
      if (v31 >= 0)
        v46 = v31;
      else
        v46 = v31 + 1;
      v35 = v46 >> 1;
      v36 = 9 * (v31 / 0xAuLL);
      if (v33 != v31)
        v36 = v31 / 0xAuLL;
      v37 = v31 < 10;
      goto LABEL_67;
    }
    v35 = v31 / 10;
    v36 = 9 * (v31 / 10);
    if (v33 < v36)
      v36 = v33;
    v37 = v33 < v35;
LABEL_67:
    if (!v37)
      v35 = v36;
    v47 = (uint64_t)((double)v28 / (double)v31 * (double)v35);
    if (v47 <= 1)
      v47 = 1;
    *((_QWORD *)v29 + 1) = v47 + v56;
    *((_BYTE *)v29 + 36) = 1;
    v48 = *(void **)(*(_QWORD *)(v2 + 40) + 24);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithML3NameOrder:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v49, *((_QWORD *)v29 + 2));

    v4 = objc_msgSend(*(id *)(v2 + 32), "indexGreaterThanIndex:", v58);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_87;
  }
  v52 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v62 = v10;
    v63 = 2048;
    v64 = v11;
    _os_log_impl(&dword_1AC149000, v52, OS_LOG_TYPE_ERROR, "nameOrderSpacing <= 0 between %lld and %lld", buf, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = 0;
LABEL_87:

}

void __49__ML3SortMap__sortedNameEntriesToInsertForNames___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const UniChar *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t SectionFromiPhoneSortKey;
  CFDataRef v16;
  ML3MusicLibrary_SortMapEntry *v17;
  void *v18;
  CFAllocatorRef v19;
  uint64_t v20;
  id v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v20 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    v19 = (CFAllocatorRef)*MEMORY[0x1E0C9AE30];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v21);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1AF43CC0C]();
        if (!objc_msgSend(v7, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("ML3SortMap.m"), 749, CFSTR("blank string cannot be inserted into sort map"));

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKey:", v7, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = objc_msgSend(v7, "length");
          MEMORY[0x1E0C80A78](v10);
          v12 = (const UniChar *)((char *)&v19 - v11);
          objc_msgSend(v7, "getCharacters:range:", (char *)&v19 - v11, 0, v10);
          v22 = 0;
          v13 = v20;
          v14 = iPhoneSortKeyBuilderCreateFromUTF16String(v20, v12, v10, &v22);
          LODWORD(v10) = v22;
          SectionFromiPhoneSortKey = iPhoneSortKeyBuilderGetSectionFromiPhoneSortKey(v13, v14, v22);
          v16 = CFDataCreateWithBytesNoCopy(v19, v14, (int)v10, v19);
          v17 = -[ML3MusicLibrary_SortMapEntry initWithName:nameSection:sortKey:]([ML3MusicLibrary_SortMapEntry alloc], "initWithName:nameSection:sortKey:", v7, SectionFromiPhoneSortKey, v16);
          CFRelease(v16);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

}

void __39__ML3SortMap_loadExistingSortedEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ML3MusicLibrary_SortMapEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v5 = objc_msgSend(v3, "intForColumnIndex:", 2);
  objc_msgSend(v3, "dataForColumnIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ML3MusicLibrary_SortMapEntry initWithName:nameSection:sortKey:nameOrder:dirtyFlag:]([ML3MusicLibrary_SortMapEntry alloc], "initWithName:nameSection:sortKey:nameOrder:dirtyFlag:", v11, v5, v6, v4, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithML3NameOrder:", v4, (int)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ML3SortMap.m"), 652, CFSTR("got nil name from the sort map!"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ML3SortMap.m"), 653, CFSTR("valueWithML3NameOrder returned nil!"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, v11);

}

@end
