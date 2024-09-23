@implementation MapsSuggestionsRoutineSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsRoutineSource)initWithRoutine:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  MapsSuggestionsRoutineSource *v11;
  void *v12;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *innerQueue;
  NSString *v16;
  NSString *name;
  dispatch_queue_t v19;
  NSString *v20;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MapsSuggestionsRoutineSource;
  v11 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v21, sel_initWithDelegate_name_, a4, v10);
  if (v11)
  {
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("Queue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue(&v19, v12, v13);
    v14 = v19;
    v19 = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = (OS_dispatch_queue *)v14;

    v16 = v20;
    v20 = 0;
    name = v11->_queue._name;
    v11->_queue._name = v16;

    objc_storeStrong((id *)&v11->_routine, a3);
  }

  return v11;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MapsSuggestionsRoutineSource *v12;
  NSObject *v13;
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
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      v17 = 1024;
      v18 = 68;
      v19 = 2082;
      v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      v21 = 2082;
      v22 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      v17 = 1024;
      v18 = 69;
      v19 = 2082;
      v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      v21 = 2082;
      v22 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "oneRoutine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineSource.mm";
      v17 = 1024;
      v18 = 70;
      v19 = 2082;
      v20 = "-[MapsSuggestionsRoutineSource initFromResourceDepot:name:]";
      v21 = 2082;
      v22 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v15, 0x26u);
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "oneRoutine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsRoutineSource initWithRoutine:delegate:name:](self, "initWithRoutine:delegate:name:", v10, v11, v7);

  v12 = self;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsRoutine removeParkedCarObserver:](self->_routine, "removeParkedCarObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsRoutineSource;
  -[MapsSuggestionsRoutineSource dealloc](&v3, sel_dealloc);
}

- (void)_q_updateSuggestionEntriesWithHandler:(uint64_t)a1
{
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  id v22;
  _QWORD block[4];
  void (**v24)(_QWORD);
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled")
      && !MapsSuggestionsIsInCoarseLocation())
    {
      GEOFindOrCreateLog();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromMapsSuggestionsCurrentBestLocation();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v8;
        v28 = 2112;
        v29 = CFSTR("ALL");
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

      }
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      MapsSuggestionsNow();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOConfigGetDouble();
      v12 = (void *)objc_msgSend(v10, "initWithStartDate:duration:", v11);

      MapsSuggestionsCurrentBestLocation();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        GEOFindOrCreateLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)a1, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v15;
          v28 = 2080;
          v29 = "_updateSuggestionEntries";
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A427D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", ", buf, 2u);
        }

        objc_initWeak((id *)buf, (id)a1);
        v17 = *(void **)(a1 + 24);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke_123;
        v20[3] = &unk_1E4BCF048;
        objc_copyWeak(&v22, (id *)buf);
        v21 = v3;
        objc_msgSend(v17, "fetchEntriesForLocation:period:handler:", v13, v12, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)a1, "uniqueName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v19;
            _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "%@ did not have a current location fix to query with.", buf, 0xCu);

          }
        }
        objc_msgSend((id)a1, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
        if (v3)
          v3[2](v3);
      }

    }
    else
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "User does not allow us to run.", buf, 2u);
      }

      objc_initWeak((id *)buf, (id)a1);
      v5 = *(void **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke;
      block[3] = &unk_1E4BCE550;
      v6 = v5;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v3;
      dispatch_async(v6, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRoutineSource.mm";
      v8 = 1026;
      v9 = 90;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __70__MapsSuggestionsRoutineSource__q_updateSuggestionEntriesWithHandler___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  int v18;
  char *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "Error while fetching entries: %@", (uint8_t *)&v18, 0xCu);
      }

      if (v5)
        v14 = v5;
      else
        v14 = (id)MEMORY[0x1E0C9AA60];
      objc_msgSend(v8, "addOrUpdateMySuggestionEntries:", v14);
      GEOFindOrCreateLog();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "uniqueName");
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v16;
        v20 = 2080;
        *(_QWORD *)v21 = "_updateSuggestionEntries";
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v18, 0x16u);

      }
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", ", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", v5);
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "uniqueName");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v10;
        v20 = 2080;
        *(_QWORD *)v21 = "_updateSuggestionEntries";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v18, 0x16u);

      }
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateSuggestionEntries", ", (uint8_t *)&v18, 2u);
      }
    }

    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(void))(v17 + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "MapsSuggestionsRoutineSource.mm";
      v20 = 1026;
      *(_DWORD *)v21 = 117;
      v21[2] = 2082;
      *(_QWORD *)&v21[3] = "-[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v18, 0x1Cu);
    }

  }
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

  -[MapsSuggestionsRoutine addParkedCarObserver:](self->_routine, "addParkedCarObserver:", self);
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

  -[MapsSuggestionsRoutine removeParkedCarObserver:](self->_routine, "removeParkedCarObserver:", self);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "updateSuggestionEntriesWithHandler", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__MapsSuggestionsRoutineSource_updateSuggestionEntriesWithHandler___block_invoke;
  v10[3] = &unk_1E4BD11A8;
  v6 = v4;
  v11 = v6;
  MSg::Queue::async<MapsSuggestionsRoutineSource>((NSObject **)&self->_queue, self, v10);
  GEOConfigGetDouble();
  v8 = v7;

  return v8;
}

void __67__MapsSuggestionsRoutineSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:](a2, *(void **)(a1 + 32));
}

- (char)suggestionsEntriesAtLocation:(id)a3 period:(id)a4 handler:(id)a5
{
  return -[MapsSuggestionsRoutine fetchEntriesForLocation:period:handler:](self->_routine, "fetchEntriesForLocation:period:handler:", a3, a4, a5);
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return -[MapsSuggestionsRoutine canProduceEntriesOfType:](self->_routine, "canProduceEntriesOfType:", a3);
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  MapsSuggestionsRoutine *routine;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  NSStringFromMapsSuggestionsRemovalBehavior(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 7)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "About to %@ Parked Car entry in Source", buf, 0xCu);
    }

    if (a4 == 8)
    {
      v13 = 0;
      goto LABEL_14;
    }
    v12 = 0;
    if (a4 == 4)
    {
      v13 = 1;
LABEL_14:
      -[MapsSuggestionsRoutine removeParkedCarsAllowingFeature:handler:](self->_routine, "removeParkedCarsAllowingFeature:handler:", v13, v9);
LABEL_15:
      v12 = 1;
    }
  }
  else
  {
    if (a4 == 4 && objc_msgSend(v8, "wasEverOfType:", 4))
    {
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "About to %@ FrequentLocation '%@' in the actual CR", buf, 0x16u);

      }
      routine = self->_routine;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __61__MapsSuggestionsRoutineSource_removeEntry_behavior_handler___block_invoke;
      v18[3] = &unk_1E4BD11D0;
      v19 = v10;
      v20 = v8;
      v21 = v9;
      -[MapsSuggestionsRoutine forgetLocationOfInterest:handler:](routine, "forgetLocationOfInterest:handler:", v20, v18);

      goto LABEL_15;
    }
    v12 = 0;
  }

  return v12;
}

void __61__MapsSuggestionsRoutineSource_removeEntry_behavior_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error during %@ of '%@': %@", (uint8_t *)&v10, 0x20u);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Successful %@ of '%@'", (uint8_t *)&v10, 0x16u);

    }
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)updatedParkedCar
{
  MSg::Queue::async<MapsSuggestionsRoutineSource>((NSObject **)&self->_queue, self, &__block_literal_global_32);
}

void __48__MapsSuggestionsRoutineSource_updatedParkedCar__block_invoke(uint64_t a1, uint64_t a2)
{
  -[MapsSuggestionsRoutineSource _q_updateSuggestionEntriesWithHandler:](a2, 0);
}

- (void).cxx_destruct
{
  Queue *p_queue;

  p_queue = &self->_queue;

  objc_storeStrong((id *)&self->_routine, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
