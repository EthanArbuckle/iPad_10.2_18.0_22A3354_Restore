@implementation MapsSuggestionsVirtualGarageSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsVirtualGarageSource)initWithVirtualGarage:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9;
  MapsSuggestionsVirtualGarageSource *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsVirtualGarageSource;
  v10 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v15, sel_initWithDelegate_name_, a4, a5);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("MapsSuggestionsVirtualGarageSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_virtualGarage, a3);
  }

  return v10;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MapsSuggestionsVirtualGarageSource *v11;
  NSObject *v12;
  const char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
    v17 = 1024;
    v18 = 61;
    v19 = 2082;
    v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
    v21 = 2082;
    v22 = "nil == (resourceDepot)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
    v17 = 1024;
    v18 = 62;
    v19 = 2082;
    v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
    v21 = 2082;
    v22 = "nil == (resourceDepot.oneSourceDelegate)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One SourceDelegate";
    goto LABEL_11;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageSource.m";
      v17 = 1024;
      v18 = 63;
      v19 = 2082;
      v20 = "-[MapsSuggestionsVirtualGarageSource initFromResourceDepot:name:]";
      v21 = 2082;
      v22 = "nil == (name)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name";
      goto LABEL_11;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneVirtualGarage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsVirtualGarageSource initWithVirtualGarage:delegate:name:](self, "initWithVirtualGarage:delegate:name:", v9, v10, v7);

  v11 = self;
LABEL_13:

  return v11;
}

- (void)start
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[5];
  id v6;
  id buf[2];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MapsSuggestionsVirtualGarageSource_start__block_invoke;
  v5[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __43__MapsSuggestionsVirtualGarageSource_start__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "openConnection");
    objc_msgSend(v3[3], "registerObserver:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsVirtualGarageSource.m";
      v7 = 1026;
      v8 = 76;
      v9 = 2082;
      v10 = "-[MapsSuggestionsVirtualGarageSource start]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)stop
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[5];
  id v6;
  id buf[2];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "stop", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MapsSuggestionsVirtualGarageSource_stop__block_invoke;
  v5[3] = &unk_1E4BCDB40;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __42__MapsSuggestionsVirtualGarageSource_stop__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "unregisterObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3[3], "closeConnection");
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsVirtualGarageSource.m";
      v7 = 1026;
      v8 = 88;
      v9 = 2082;
      v10 = "-[MapsSuggestionsVirtualGarageSource stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  double v10;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2080;
    v19 = "updateSuggestionEntriesWithHandler";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke;
  v13[3] = &unk_1E4BCEB98;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v4;
  v14 = v9;
  dispatch_async(queue, v13);
  GEOConfigGetDouble();
  v11 = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v11;
}

void __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke_93;
    v6[3] = &unk_1E4BCDEE0;
    v6[4] = WeakRetained;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "entriesForUnpairedVehiclesWithHandler:", v6);

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v9 = "MapsSuggestionsVirtualGarageSource.m";
      v10 = 1026;
      v11 = 105;
      v12 = 2082;
      v13 = "-[MapsSuggestionsVirtualGarageSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsVirtualGarageSource_updateSuggestionEntriesWithHandler___block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Error while creating Entries: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v14;
      v17 = 2080;
      v18 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addOrUpdateMySuggestionEntries:", a2);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2080;
      v18 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
LABEL_17:
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", (uint8_t *)&v15, 2u);
    }
  }

}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 20;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
}

@end
