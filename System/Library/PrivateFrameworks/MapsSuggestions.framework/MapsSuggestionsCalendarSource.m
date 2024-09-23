@implementation MapsSuggestionsCalendarSource

- (MapsSuggestionsCalendarSource)initWithDelegate:(id)a3 eventKit:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11;
  id v12;
  MapsSuggestionsCalendarSource *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsCalendarSource;
  v13 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v18, sel_initWithDelegate_name_, a3, a6);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("MapsSuggestionsCalendarSourceQueue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_eventKit, a4);
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
  void *v12;
  MapsSuggestionsCalendarSource *v13;
  NSObject *v14;
  const char *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v17 = 136446978;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    v19 = 1024;
    v20 = 62;
    v21 = 2082;
    v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
    v23 = 2082;
    v24 = "nil == (resourceDepot)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x26u);
    goto LABEL_12;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v17 = 136446978;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    v19 = 1024;
    v20 = 63;
    v21 = 2082;
    v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
    v23 = 2082;
    v24 = "nil == (resourceDepot.oneSourceDelegate)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  objc_msgSend(v6, "oneEventKit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      v19 = 1024;
      v20 = 64;
      v21 = 2082;
      v22 = "-[MapsSuggestionsCalendarSource initFromResourceDepot:name:]";
      v23 = 2082;
      v24 = "nil == (resourceDepot.oneEventKit)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one EventKit!";
      goto LABEL_11;
    }
LABEL_12:

    v13 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneEventKit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneAppGuardian");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsCalendarSource initWithDelegate:eventKit:guardian:name:](self, "initWithDelegate:eventKit:guardian:name:", v10, v11, v12, v7);

  v13 = self;
LABEL_13:

  return v13;
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
  NSObject *queue;
  _QWORD block[4];
  id v6;
  id buf[2];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "start, adding self observer for EKEventStoreChangedNotification", (uint8_t *)buf, 2u);
  }

  -[MapsSuggestionsEventKit registerObserver:](self->_eventKit, "registerObserver:", self);
  -[MapsSuggestionsAppGuardian registerBundleID:withSource:](self->_guardian, "registerBundleID:withSource:", MapsSuggestionsCalendarAppBundleID, self);
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MapsSuggestionsCalendarSource_start__block_invoke;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __38__MapsSuggestionsCalendarSource_start__block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[5]);
    -[dispatch_queue_t updateSuggestionEntriesWithHandler:](v2, "updateSuggestionEntriesWithHandler:", 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsCalendarSource.m";
      v6 = 1026;
      v7 = 91;
      v8 = 2082;
      v9 = "-[MapsSuggestionsCalendarSource start]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
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
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "stop, removing self as observer for EKEventStoreChangedNotification", v4, 2u);
  }

  -[MapsSuggestionsAppGuardian unregisterBundleID:withSource:](self->_guardian, "unregisterBundleID:withSource:", MapsSuggestionsCalendarAppBundleID, self);
  -[MapsSuggestionsEventKit unregisterObserver:](self->_eventKit, "unregisterObserver:", self);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *queue;
  void *v12;
  NSObject *v13;
  id *v14;
  id *v15;
  _QWORD *v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t v33[16];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsCurrentBestLocation();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v6;
    v42 = 2112;
    v43 = CFSTR("ALL");
    v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

  }
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsBaseSource uniqueName](self, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v9;
    v42 = 2080;
    v43 = "updateSuggestionEntries";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  if (-[MapsSuggestionsAppGuardian isBundleIDLocked:forSource:](self->_guardian, "isBundleIDLocked:forSource:", MapsSuggestionsCalendarAppBundleID, self))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke;
    block[3] = &unk_1E4BCEB98;
    objc_copyWeak(&v39, (id *)buf);
    v38 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v39);
LABEL_14:
    v18 = 0.0;
    goto LABEL_23;
  }
  if (!+[MapsSuggestionsSiri canLearnFromBundleID:](MapsSuggestionsSiri, "canLearnFromBundleID:", MapsSuggestionsCalendarAppBundleID))
  {
    v17 = self->_queue;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_374;
    v34[3] = &unk_1E4BCEB98;
    objc_copyWeak(&v36, (id *)buf);
    v35 = v4;
    dispatch_async(v17, v34);

    objc_destroyWeak(&v36);
    goto LABEL_14;
  }
  MapsSuggestionsCurrentBestLocation();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
    {
      v13 = self->_queue;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_377;
      v24[3] = &unk_1E4BCEB98;
      v14 = &v26;
      objc_copyWeak(&v26, (id *)buf);
      v15 = &v25;
      v25 = v4;
      v16 = v24;
    }
    else
    {
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", v33, 2u);
      }

      v13 = self->_queue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_376;
      v27[3] = &unk_1E4BCEB98;
      v14 = &v29;
      objc_copyWeak(&v29, (id *)buf);
      v15 = &v28;
      v28 = v4;
      v16 = v27;
    }
    dispatch_async(v13, v16);
    v18 = 0.0;
  }
  else
  {
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "No current location to work with.", v33, 2u);
    }

    v20 = self->_queue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_375;
    v30[3] = &unk_1E4BCEB98;
    v14 = &v32;
    objc_copyWeak(&v32, (id *)buf);
    v31 = v4;
    dispatch_async(v20, v30);
    GEOConfigGetDouble();
    v18 = v21;
    v15 = &v31;
  }

  objc_destroyWeak(v14);
LABEL_23:
  objc_destroyWeak((id *)buf);

  return v18;
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsCalendarSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 154;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_374(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsCalendarSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 158;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_375(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsCalendarSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 164;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_376(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2080;
      *(_QWORD *)v11 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsCalendarSource.m";
      v10 = 1026;
      *(_DWORD *)v11 = 170;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_377(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_378;
    v18 = &unk_1E4BCDEE0;
    v19 = WeakRetained;
    v20 = *(id *)(a1 + 32);
    v4 = &v15;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 5));
    MapsSuggestionsCurrentBestLocation();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Current Location: %@", buf, 0xCu);
      }

      GEOConfigGetDouble();
      MapsSuggestionsNowWithOffset(-v8);
      v7 = objc_claimAutoreleasedReturnValue();
      GEOConfigGetDouble();
      MapsSuggestionsNowWithOffset(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0CB3588]);
      v12 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v7, v10, v15, v16);
      if ((objc_msgSend(*((id *)v3 + 3), "entriesForEventsAtLocation:period:fetchMapItems:handler:", v5, v12, 1, v4) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Was not called back from MapsSuggestionsEventKit"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17((uint64_t)v4, 0, v13);

      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      v23 = 1024;
      v24 = 115;
      v25 = 2082;
      v26 = "-[MapsSuggestionsCalendarSource _q_updateSuggestionEntriesWithHandler:]";
      v27 = 2082;
      v28 = "nil == (currentLocation)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This should never be called without current location", buf, 0x26u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "MapsSuggestionsCalendarSource.m";
      v23 = 1026;
      v24 = 174;
      v25 = 2082;
      v26 = "-[MapsSuggestionsCalendarSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __68__MapsSuggestionsCalendarSource_updateSuggestionEntriesWithHandler___block_invoke_378(uint64_t a1, uint64_t a2, void *a3)
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
      v18 = "updateSuggestionEntries";
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
      v18 = "updateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v15) = 0;
LABEL_17:
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntries", ", (uint8_t *)&v15, 2u);
    }
  }

}

- (BOOL)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
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
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    v18 = 1024;
    v19 = 196;
    v20 = 2082;
    v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
    v22 = 2082;
    v23 = "nil == (location)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
LABEL_11:
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
    v18 = 1024;
    v19 = 197;
    v20 = 2082;
    v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
    v22 = 2082;
    v23 = "nil == (period)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period";
    goto LABEL_11;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      v18 = 1024;
      v19 = 198;
      v20 = 2082;
      v21 = "-[MapsSuggestionsCalendarSource suggestionsEntriesAtLocation:period:handler:]";
      v22 = 2082;
      v23 = "nil == (handler)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  v12 = -[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:](self->_eventKit, "entriesForEventsAtLocation:period:fetchMapItems:handler:", v8, v9, 1, v10);
LABEL_13:

  return v12;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return -[MapsSuggestionsEventKit canProduceEntriesOfType:](self->_eventKit, "canProduceEntriesOfType:", a3);
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      v16 = 1024;
      v17 = 215;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCalendarSource removeEntry:behavior:handler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_9:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarSource.m";
      v16 = 1024;
      v17 = 216;
      v18 = 2082;
      v19 = "-[MapsSuggestionsCalendarSource removeEntry:behavior:handler:]";
      v20 = 2082;
      v21 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (a4 != 8)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = -[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:](self->_eventKit, "deleteOrDeclineEntry:handler:", v8, v9);
LABEL_12:

  return v10;
}

- (void)eventKitDidChange:(id)a3
{
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MapsSuggestionsCalendarSource_eventKitDidChange___block_invoke;
  v5[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsCalendarSource_eventKitDidChange___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Reloading because of detected change", (uint8_t *)&v5, 2u);
    }

    dispatch_assert_queue_V2(WeakRetained[5]);
    -[dispatch_queue_t updateSuggestionEntriesWithHandler:](WeakRetained, "updateSuggestionEntriesWithHandler:", 0);
  }
  else
  {
    v4 = v2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsCalendarSource.m";
      v7 = 1026;
      v8 = 233;
      v9 = 2082;
      v10 = "-[MapsSuggestionsCalendarSource eventKitDidChange:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_eventKit, 0);
}

@end
