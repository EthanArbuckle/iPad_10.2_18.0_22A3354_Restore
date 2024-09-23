@implementation MapsSuggestionsContactActivitySource

- (MapsSuggestionsContactActivitySource)initWithContactActivity:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11;
  id v12;
  MapsSuggestionsContactActivitySource *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsContactActivitySource;
  v13 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v18, sel_initWithDelegate_name_, a4, a6);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("MapsSuggestionsContactActivitySource", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_contactActivity, a3);
    -[MapsSuggestionsContactActivity setContactActivityDelegate:](v13->_contactActivity, "setContactActivityDelegate:", v13);
    objc_storeStrong((id *)&v13->_guardian, a5);
  }

  return v13;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsContactActivitySource *v12;
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
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContactActivitySource.m";
      v18 = 1024;
      v19 = 49;
      v20 = 2082;
      v21 = "-[MapsSuggestionsContactActivitySource initFromResourceDepot:name:]";
      v22 = 2082;
      v23 = "nil == (resourceDepot)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "oneContactActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContactActivitySource.m";
      v18 = 1024;
      v19 = 50;
      v20 = 2082;
      v21 = "-[MapsSuggestionsContactActivitySource initFromResourceDepot:name:]";
      v22 = 2082;
      v23 = "nil == (resourceDepot.oneContactActivity)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one ContactActivity!";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "oneContactActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneAppGuardian");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsContactActivitySource initWithContactActivity:delegate:guardian:name:](self, "initWithContactActivity:delegate:guardian:name:", v9, v10, v11, v7);

  v12 = self;
LABEL_10:

  return v12;
}

+ (unint64_t)disposition
{
  return 2;
}

+ (BOOL)isEnabled
{
  int BOOL;

  BOOL = GEOConfigGetBOOL();
  if (BOOL)
    LOBYTE(BOOL) = MapsFeature_IsEnabled_MapsWally();
  return BOOL;
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

  -[MapsSuggestionsAppGuardian registerBundleID:withSource:](self->_guardian, "registerBundleID:withSource:", MapsSuggestionsFindMyAppBundleID, self);
}

- (void)stop
{
  NSObject *v2;
  uint8_t v3[16];

  -[MapsSuggestionsAppGuardian unregisterBundleID:withSource:](self->_guardian, "unregisterBundleID:withSource:", MapsSuggestionsFindMyAppBundleID, self);
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "stop", v3, 2u);
  }

}

- (void)contactActivityUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_INFO, "Received a real-time update from Biome. New SmartReplies/FindMy activity. Checking with Biome.", v4, 2u);
  }

  -[MapsSuggestionsContactActivitySource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", 0);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *queue;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[5];
  void (**v21)(_QWORD);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2080;
    v26 = "updateSuggestionEntriesWithHandler";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", buf, 2u);
  }

  if (!+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_INFO, "Siri is not enabled. Returning.", buf, 2u);
    }

    -[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:](self, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    if (v4)
      v4[2](v4);
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v11))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    goto LABEL_33;
  }
  if (-[MapsSuggestionsAppGuardian isBundleIDLocked:forSource:](self->_guardian, "isBundleIDLocked:forSource:", MapsSuggestionsFindMyAppBundleID, self))
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_INFO, "App is locked. Returning.", buf, 2u);
    }

    -[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:](self, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    if (v4)
      v4[2](v4);
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v11))
      goto LABEL_34;
    *(_WORD *)buf = 0;
LABEL_33:
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", buf, 2u);
LABEL_34:

    goto LABEL_35;
  }
  if (!+[MapsSuggestionsSiri canLearnFromBundleID:](MapsSuggestionsSiri, "canLearnFromBundleID:", MapsSuggestionsFindMyAppBundleID))
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_INFO, "App prevents us from Learning. Returning.", buf, 2u);
    }

    -[MapsSuggestionsBaseSource addOrUpdateMySuggestionEntries:](self, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    if (v4)
      v4[2](v4);
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2080;
      v26 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v11))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    goto LABEL_33;
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E4BCEA10;
  objc_copyWeak(&v22, (id *)buf);
  block[4] = self;
  v21 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
LABEL_35:

  return 0.0;
}

void __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  _BYTE v17[18];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromMapsSuggestionsCurrentBestLocation();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      *(_QWORD *)v17 = CFSTR("ALL");
      *(_WORD *)&v17[8] = 2112;
      *(_QWORD *)&v17[10] = v7;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

    }
    v8 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke_368;
    v11[3] = &unk_1E4BCF510;
    objc_copyWeak(&v13, v2);
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    objc_msgSend(v8, "contactActivityEntriesWith:", v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    v10 = v4;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "MapsSuggestionsContactActivitySource.m";
      v16 = 1026;
      *(_DWORD *)v17 = 113;
      *(_WORD *)&v17[4] = 2082;
      *(_QWORD *)&v17[6] = "-[MapsSuggestionsContactActivitySource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __75__MapsSuggestionsContactActivitySource_updateSuggestionEntriesWithHandler___block_invoke_368(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  char *v22;
  __int16 v23;
  _WORD v24[17];

  *(_QWORD *)&v24[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v9 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Received an error inside contactActivityEntriesWith: %@", (uint8_t *)&v21, 0xCu);

      }
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueName");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v11;
        v23 = 2080;
        *(_QWORD *)v24 = "updateSuggestionEntriesWithHandler";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v21, 0x16u);

      }
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", (uint8_t *)&v21, 2u);
      }

    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v13 = v5;
    v14 = v13;
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v14);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v16;
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Sending: %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", v14);
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v18;
      v23 = 2080;
      *(_QWORD *)v24 = "updateSuggestionEntriesWithHandler";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);

    }
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", ", (uint8_t *)&v21, 2u);
    }

    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
      (*(void (**)(void))(v20 + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446722;
      v22 = "MapsSuggestionsContactActivitySource.m";
      v23 = 1026;
      *(_DWORD *)v24 = 117;
      v24[2] = 2082;
      *(_QWORD *)&v24[3] = "-[MapsSuggestionsContactActivitySource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v21, 0x1Cu);
    }

  }
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 24;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contactActivity, 0);
}

@end
