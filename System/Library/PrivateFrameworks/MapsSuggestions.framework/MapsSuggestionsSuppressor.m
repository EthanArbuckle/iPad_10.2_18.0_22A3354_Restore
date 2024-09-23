@implementation MapsSuggestionsSuppressor

- (MapsSuggestionsSuppressor)initWithFilePath:(id)a3
{
  id v4;
  MapsSuggestionsSuppressor *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *suppressionEntries;
  uint64_t v8;
  NSString *suppressionEntriesFilePath;
  MapsSuggestionsQueue *v10;
  MapsSuggestionsQueue *queue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsSuppressor;
  v5 = -[MapsSuggestionsSuppressor init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    suppressionEntries = v5->_suppressionEntries;
    v5->_suppressionEntries = v6;

    v8 = objc_msgSend(v4, "copy");
    suppressionEntriesFilePath = v5->_suppressionEntriesFilePath;
    v5->_suppressionEntriesFilePath = (NSString *)v8;

    v10 = -[MapsSuggestionsQueue initSerialQueueWithName:]([MapsSuggestionsQueue alloc], "initSerialQueueWithName:", CFSTR("MapsSuggestionsSuppressorQueue"));
    queue = v5->_queue;
    v5->_queue = v10;

    -[MapsSuggestionsSuppressor loadSuppressedEntries](v5, "loadSuppressedEntries");
  }

  return v5;
}

- (MapsSuggestionsSuppressor)init
{
  void *v3;
  MapsSuggestionsSuppressor *v4;

  MapsSuggestionsPathForSuppressedEntries();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MapsSuggestionsSuppressor initWithFilePath:](self, "initWithFilePath:", v3);

  return v4;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)isSuppressedEntry:(id)a3
{
  id v4;
  MapsSuggestionsQueue *queue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MapsSuggestionsSuppressor_isSuppressedEntry___block_invoke;
  v8[3] = &unk_1E4BD1478;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(queue) = -[MapsSuggestionsQueue syncBOOLReturningBlock:](queue, "syncBOOLReturningBlock:", v8);

  return (char)queue;
}

BOOL __47__MapsSuggestionsSuppressor_isSuppressedEntry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = MapsSuggestionsIsInTheFuture(v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)suppressEntry:(id)a3 forTime:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  MapsSuggestionsQueue *queue;
  id v10;
  id v11;
  MapsSuggestionsQueue *v12;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  MapsSuggestionsNowWithOffset(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke;
  v17[3] = &unk_1E4BCE960;
  v17[4] = self;
  v10 = v7;
  v18 = v10;
  v11 = v6;
  v19 = v11;
  -[MapsSuggestionsQueue syncBlock:](queue, "syncBlock:", v17);
  objc_initWeak(&location, self);
  v12 = self->_queue;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke_13;
  v14[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v15, &location);
  -[MapsSuggestionsQueue asyncBlock:](v12, "asyncBlock:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_INFO, "Suppressed Entries about to write to file are : %@", (uint8_t *)&v7, 0xCu);
  }

}

void __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsSuppressor _saveSuppressedEntries]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsSuppressor.m";
      v6 = 1026;
      v7 = 80;
      v8 = 2082;
      v9 = "-[MapsSuggestionsSuppressor suppressEntry:forTime:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (uint64_t)_saveSuppressedEntries
{
  uint64_t v1;
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  _QWORD *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v1 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 16) == 0;
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
        v16 = 1024;
        v17 = 153;
        v18 = 2082;
        v19 = "-[MapsSuggestionsSuppressor _saveSuppressedEntries]";
        v20 = 2082;
        v21 = "nil == (_suppressionEntriesFilePath)";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires file path to be set", buf, 0x26u);
      }
      v1 = 0;
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v5 = *(const char **)(v1 + 8);
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_INFO, "Suppressed Entries writing to file are %@", buf, 0xCu);
      }

      v6 = (id)v1;
      objc_sync_enter(v6);
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (const char *)v6[1];
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_INFO, "Suppressed Entries writing to file are %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6[1], 1, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v6);

      v9 = *(_QWORD *)(v1 + 16);
      v13 = 0;
      v1 = -[NSObject writeToFile:options:error:](v4, "writeToFile:options:error:", v9, 0, &v13);
      v10 = (char *)v13;
      if ((v1 & 1) == 0)
      {
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v10;
          _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Failed to write suppressed entries to disk: %{public}@", buf, 0xCu);
        }

      }
    }

  }
  return v1;
}

- (void)purge
{
  MapsSuggestionsQueue *queue;
  _QWORD v4[5];

  -[MapsSuggestionsSuppressor loadSuppressedEntries](self, "loadSuppressedEntries");
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__MapsSuggestionsSuppressor_purge__block_invoke;
  v4[3] = &unk_1E4BCEE50;
  v4[4] = self;
  -[MapsSuggestionsQueue syncBlock:](queue, "syncBlock:", v4);
  -[MapsSuggestionsSuppressor saveSuppressedEntries](self, "saveSuppressedEntries");
}

void __34__MapsSuggestionsSuppressor_purge__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__MapsSuggestionsSuppressor_purge__block_invoke_15;
    v13[3] = &unk_1E4BD14A0;
    v4 = v2;
    v14 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 134217984;
      v16 = v9;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_FAULT, "_suppressionEntries is not a NSDictionary:<%p>", buf, 0xCu);
    }

    v10 = objc_msgSend(v2, "mutableCopy");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v10;

  }
}

void __34__MapsSuggestionsSuppressor_purge__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (MapsSuggestionsIsInTheFuture(v5))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (BOOL)loadSuppressedEntries
{
  MapsSuggestionsQueue *queue;
  _QWORD v4[5];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsSuppressor_loadSuppressedEntries__block_invoke;
  v4[3] = &unk_1E4BD14C8;
  v4[4] = self;
  return -[MapsSuggestionsQueue syncBOOLReturningBlock:](queue, "syncBOOLReturningBlock:", v4);
}

uint64_t __50__MapsSuggestionsSuppressor_loadSuppressedEntries__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  id *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      objc_msgSend(*(id *)(v1 + 24), "innerQueue");
      v2 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v2);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "fileExistsAtPath:", *(_QWORD *)(v1 + 16));

      if ((v4 & 1) != 0)
      {
        v5 = *(_QWORD *)(v1 + 16);
        v26 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 0, &v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (char *)v26;
        if (v7)
        {
          GEOFindOrCreateLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v7;
            _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Failed to read suppressed entries to disk: %{public}@", buf, 0xCu);
          }

          v1 = 0;
        }
        else if (v6)
        {
          v12 = (id *)(id)v1;
          objc_sync_enter(v12);
          v13 = objc_alloc(MEMORY[0x1E0C99E60]);
          v14 = objc_opt_class();
          v15 = objc_opt_class();
          v16 = (void *)objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
          v25 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v16, v6, &v25);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v25;
          v19 = v12[1];
          v12[1] = (id)v17;

          v1 = v18 == 0;
          if (v18)
          {
            GEOFindOrCreateLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[MapsSuggestionsSuppressor _loadSuppressedEntries]";
              v29 = 2112;
              *(_QWORD *)v30 = v18;
              _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "%s failed with error: %@", buf, 0x16u);
            }

            objc_msgSend(v12[1], "removeAllObjects");
          }
          else
          {
            GEOFindOrCreateLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v23 = (const char *)v12[1];
              *(_DWORD *)buf = 138412290;
              v28 = v23;
              _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "Suppressed Entries loaded from file are %@", buf, 0xCu);
            }

          }
          objc_sync_exit(v12);

        }
        else
        {
          GEOFindOrCreateLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "Suppressed entries file returned nil content. Nothing to load", buf, 2u);
          }

          objc_msgSend(*(id *)(v1 + 8), "removeAllObjects");
          v1 = 1;
        }

      }
      else
      {
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = *(const char **)(v1 + 16);
          *(_DWORD *)buf = 138543362;
          v28 = v11;
          _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "Suppressed entries file '%{public}@' does not exist. Nothing to load", buf, 0xCu);
        }

        objc_msgSend(*(id *)(v1 + 8), "removeAllObjects");
        return 1;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
        v29 = 1024;
        *(_DWORD *)v30 = 110;
        *(_WORD *)&v30[4] = 2082;
        *(_QWORD *)&v30[6] = "-[MapsSuggestionsSuppressor _loadSuppressedEntries]";
        v31 = 2082;
        v32 = "nil == (_suppressionEntriesFilePath)";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires file path to be set", buf, 0x26u);
      }

      return 0;
    }
  }
  return v1;
}

- (BOOL)saveSuppressedEntries
{
  MapsSuggestionsQueue *queue;
  _QWORD v4[5];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsSuppressor_saveSuppressedEntries__block_invoke;
  v4[3] = &unk_1E4BD14C8;
  v4[4] = self;
  return -[MapsSuggestionsQueue syncBOOLReturningBlock:](queue, "syncBOOLReturningBlock:", v4);
}

uint64_t __50__MapsSuggestionsSuppressor_saveSuppressedEntries__block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsSuppressor _saveSuppressedEntries](*(_QWORD *)(a1 + 32));
}

- (void)test_deleteSuppressedEntriesFile
{
  MapsSuggestionsQueue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__MapsSuggestionsSuppressor_test_deleteSuppressedEntriesFile__block_invoke;
  v3[3] = &unk_1E4BCEE50;
  v3[4] = self;
  -[MapsSuggestionsQueue syncBlock:](queue, "syncBlock:", v3);
}

void __61__MapsSuggestionsSuppressor_test_deleteSuppressedEntriesFile__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", v3, &v5);
  v4 = v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");

}

- (id)test_dateUntilSuppressedEntry:(id)a3
{
  id v4;
  void *v5;
  MapsSuggestionsQueue *queue;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
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
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__MapsSuggestionsSuppressor_test_dateUntilSuppressedEntry___block_invoke;
    v10[3] = &unk_1E4BD14F0;
    v10[4] = self;
    v11 = v4;
    -[MapsSuggestionsQueue syncReturningBlock:](queue, "syncReturningBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
      v14 = 1024;
      v15 = 204;
      v16 = 2082;
      v17 = "-[MapsSuggestionsSuppressor test_dateUntilSuppressedEntry:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

id __59__MapsSuggestionsSuppressor_test_dateUntilSuppressedEntry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)awaitQueue
{
  NSObject *v2;

  -[MapsSuggestionsQueue innerQueue](self->_queue, "innerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v2, &__block_literal_global_37);

}

void __39__MapsSuggestionsSuppressor_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue.innerQueue ran"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_suppressionEntriesFilePath, 0);
  objc_storeStrong((id *)&self->_suppressionEntries, 0);
}

@end
