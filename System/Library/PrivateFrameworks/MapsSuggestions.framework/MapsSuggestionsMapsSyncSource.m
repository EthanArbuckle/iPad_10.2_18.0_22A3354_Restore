@implementation MapsSuggestionsMapsSyncSource

- (MapsSuggestionsMapsSyncSource)initWithMapsSync:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9;
  MapsSuggestionsMapsSyncSource *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  MapsSuggestionsMapsSyncSource *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsSuggestionsMapsSyncSource;
    v10 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v17, sel_initWithDelegate_name_, a4, a5);
    if (v10)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create("MapsSuggestionsMapsSyncSourceQueue", v11);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v10->_mapsSync, a3);
    }
    self = v10;
    v14 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v20 = 1024;
      v21 = 59;
      v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource initWithMapsSync:delegate:name:]";
      v24 = 2082;
      v25 = "nil == (mapsSync)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This version requires a MapsSync", buf, 0x26u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsMapsSyncSource *v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
    v18 = 1024;
    v19 = 76;
    v20 = 2082;
    v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
    v18 = 1024;
    v19 = 77;
    v20 = 2082;
    v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
    v22 = 2082;
    v23 = "nil == (resourceDepot.oneSourceDelegate)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  objc_msgSend(v6, "oneMapsSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v18 = 1024;
      v19 = 78;
      v20 = 2082;
      v21 = "-[MapsSuggestionsMapsSyncSource initFromResourceDepot:name:]";
      v22 = 2082;
      v23 = "nil == (resourceDepot.oneMapsSync)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one MapsSync!";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneMapsSync");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsMapsSyncSource initWithMapsSync:delegate:name:](self, "initWithMapsSync:delegate:name:", v10, v11, v7);

  v12 = self;
LABEL_13:

  return v12;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 2;
}

- (void)start
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  -[MapsSuggestionsMapsSync addMapsSyncObserver:forContentType:](self->_mapsSync, "addMapsSyncObserver:forContentType:", self, 1);
  -[MapsSuggestionsMapsSyncSource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", 0);
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "stop", v4, 2u);
  }

  -[MapsSuggestionsMapsSync removeMapsSyncObserver:forContentType:](self->_mapsSync, "removeMapsSyncObserver:forContentType:", self, 1);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2080;
    v17 = "updateSuggestionEntries";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__MapsSuggestionsMapsSyncSource_updateSuggestionEntriesWithHandler___block_invoke;
  v11[3] = &unk_1E4BCEB98;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  v9 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return 0.0;
}

void __68__MapsSuggestionsMapsSyncSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  _WORD v10[17];

  *(_QWORD *)&v10[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2080;
      *(_QWORD *)v10 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);

    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsMapsSyncSource.m";
      v9 = 1026;
      *(_DWORD *)v10 = 113;
      v10[2] = 2082;
      *(_QWORD *)&v10[3] = "-[MapsSuggestionsMapsSyncSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)_q_updateRecentHistoryEntriesWithHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)a1, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsEntryType(5uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsCurrentBestLocation();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

  }
  objc_initWeak((id *)buf, (id)a1);
  v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__MapsSuggestionsMapsSyncSource__q_updateRecentHistoryEntriesWithHandler___block_invoke;
  v12[3] = &unk_1E4BCEDD8;
  objc_copyWeak(&v14, (id *)buf);
  v9 = (void (**)(_QWORD))v3;
  v13 = v9;
  if ((objc_msgSend(v8, "entriesFromHistoryWithHandler:", v12) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "MapsSuggestionsMapsSync did not call back?", v11, 2u);
    }

    objc_msgSend((id)a1, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    if (v9)
      v9[2](v9);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 0x19)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v8 = 1024;
      v9 = 156;
      v10 = 2082;
      v11 = "-[MapsSuggestionsMapsSyncSource canProduceEntriesOfType:]";
      v12 = 2082;
      v13 = "YES";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v6, 0x26u);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x820u >> a3) & 1;
  }
  return v3;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MapsSuggestionsMapsSync *mapsSync;
  char v12;
  NSObject *v13;
  const char *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "removeEntry", buf, 2u);
  }

  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v20 = 1024;
      v21 = 165;
      v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource removeEntry:behavior:handler:]";
      v24 = 2082;
      v25 = "nil == (handler)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_13:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x26u);
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v20 = 1024;
      v21 = 166;
      v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncSource removeEntry:behavior:handler:]";
      v24 = 2082;
      v25 = "nil == (entry)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4 == 8
    && -[MapsSuggestionsMapsSyncSource canProduceEntriesOfType:](self, "canProduceEntriesOfType:", objc_msgSend(v8, "type")))
  {
    mapsSync = self->_mapsSync;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__MapsSuggestionsMapsSyncSource_removeEntry_behavior_handler___block_invoke;
    v16[3] = &unk_1E4BCF1E0;
    v17 = v9;
    v12 = -[MapsSuggestionsMapsSync deleteEntry:handler:](mapsSync, "deleteEntry:handler:", v8, v16);
    v13 = v17;
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

void __62__MapsSuggestionsMapsSyncSource_removeEntry_behavior_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Deleted with error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__MapsSuggestionsMapsSyncSource__q_updateRecentHistoryEntriesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  _BYTE v16[14];
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v5, "count");
      v11 = &stru_1E4BDFC28;
      if (v6)
        v11 = v6;
      v15 = 67109378;
      *(_DWORD *)v16 = v10;
      *(_WORD *)&v16[4] = 2112;
      *(_QWORD *)&v16[6] = v11;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "Received %u entries%@", (uint8_t *)&v15, 0x12u);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", v12);

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
  else
  {
    v14 = v8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446722;
      *(_QWORD *)v16 = "MapsSuggestionsMapsSyncSource.m";
      *(_WORD *)&v16[8] = 1026;
      *(_DWORD *)&v16[10] = 197;
      v17 = 2082;
      v18 = "-[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }

  }
}

- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Detected changes in MapsSuggestionsMapsSyncTypeHistory", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MapsSuggestionsMapsSyncSource_mapsSync_didChangeForContentType___block_invoke;
    block[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncSource.m";
      v13 = 1024;
      v14 = 215;
      v15 = 2082;
      v16 = "-[MapsSuggestionsMapsSyncSource mapsSync:didChangeForContentType:]";
      v17 = 2082;
      v18 = "MapsSuggestionsMapsSyncTypeHistory != type";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. We shouldn't get changes we're not interested in", buf, 0x26u);
    }

  }
}

void __66__MapsSuggestionsMapsSyncSource_mapsSync_didChangeForContentType___block_invoke(uint64_t a1)
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
    -[MapsSuggestionsMapsSyncSource _q_updateRecentHistoryEntriesWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsMapsSyncSource.m";
      v6 = 1026;
      v7 = 221;
      v8 = 2082;
      v9 = "-[MapsSuggestionsMapsSyncSource mapsSync:didChangeForContentType:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue, &__block_literal_global_9);
}

void __43__MapsSuggestionsMapsSyncSource_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
