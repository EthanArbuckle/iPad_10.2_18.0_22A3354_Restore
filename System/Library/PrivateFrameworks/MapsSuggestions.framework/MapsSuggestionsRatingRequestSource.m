@implementation MapsSuggestionsRatingRequestSource

+ (BOOL)isEnabled
{
  int BOOL;

  if (MapsFeature_IsEnabled_LagunaBeach()
    && (GEODoesUserHaveValidAccountForMakingContributions() & 1) != 0
    || (BOOL = GEOConfigGetBOOL()) != 0)
  {
    LOBYTE(BOOL) = GEOConfigGetBOOL();
  }
  return BOOL;
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsRatingRequestSource)initWithMapsSync:(id)a3 routine:(id)a4 delegate:(id)a5 name:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MapsSuggestionsRatingRequestSource *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  MapsSuggestionsBudget *v19;
  MapsSuggestionsBudget *budget;
  MapsSuggestionsBudget *v21;
  uint64_t Integer;
  double v23;
  MapsSuggestionsBudget *v24;
  uint64_t v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MapsSuggestionsRatingRequestSource;
  v15 = -[MapsSuggestionsBaseSource initWithDelegate:name:](&v34, sel_initWithDelegate_name_, v13, v14);
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("MapsSuggestionsRatingRequestSourceQueue", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_mapsSync, a3);
    objc_storeStrong((id *)&v15->_routine, a4);
    v19 = -[MapsSuggestionsBudget initWithDelegate:name:]([MapsSuggestionsBudget alloc], "initWithDelegate:name:", v15, CFSTR("MapsSuggestionsRatingRequestSource"));
    budget = v15->_budget;
    v15->_budget = v19;

    v21 = v15->_budget;
    Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    location = (id)(uint64_t)(v23 * 1000000000.0);
    -[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:](v21, "addRollingWindowOfCount:perDuration:name:", Integer, &location, CFSTR("Short"));
    v24 = v15->_budget;
    v25 = GEOConfigGetInteger();
    GEOConfigGetDouble();
    location = (id)(uint64_t)(v26 * 1000000000.0);
    -[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:](v24, "addRollingWindowOfCount:perDuration:name:", v25, &location, CFSTR("Long"));
    objc_initWeak(&location, v15);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D26770];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __77__MapsSuggestionsRatingRequestSource_initWithMapsSync_routine_delegate_name___block_invoke;
    v31[3] = &unk_1E4BD0D88;
    objc_copyWeak(&v32, &location);
    v29 = (id)objc_msgSend(v27, "addObserverForName:object:queue:usingBlock:", v28, 0, 0, v31);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __77__MapsSuggestionsRatingRequestSource_initWithMapsSync_routine_delegate_name___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  unsigned int v6;
  const __CFString *v7;
  NSObject *v8;
  int v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint8_t buf[4];
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_14:

      objc_msgSend(WeakRetained, "updateSuggestionEntriesWithHandler:", 0);
      goto LABEL_15;
    }
    v6 = objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *MEMORY[0x1E0D26D08]);
    if (v6 >= 2)
    {
      if (v6 == 2)
      {
        v7 = CFSTR("YES");
LABEL_13:
        v10 = 138412290;
        v11 = (char *)v7;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_INFO, "Offline state changed: %@", (uint8_t *)&v10, 0xCu);
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v6;
        _os_log_fault_impl(&dword_1A427D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    v7 = CFSTR("NO");
    goto LABEL_13;
  }
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = 136446722;
    v11 = "MapsSuggestionsRatingRequestSource.mm";
    v12 = 1026;
    v13 = 96;
    v14 = 2082;
    v15 = "-[MapsSuggestionsRatingRequestSource initWithMapsSync:routine:delegate:name:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
  }

LABEL_15:
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
  void *v13;
  MapsSuggestionsRatingRequestSource *v14;
  NSObject *v15;
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
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      v19 = 1024;
      v20 = 108;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      v23 = 2082;
      v24 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend(v6, "oneSourceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      v19 = 1024;
      v20 = 109;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      v23 = 2082;
      v24 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend(v6, "oneMapsSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      v19 = 1024;
      v20 = 110;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      v23 = 2082;
      v24 = "nil == (resourceDepot.oneMapsSync)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one MapsSync!", (uint8_t *)&v17, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend(v6, "oneRoutine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
      v19 = 1024;
      v20 = 111;
      v21 = 2082;
      v22 = "-[MapsSuggestionsRatingRequestSource initFromResourceDepot:name:]";
      v23 = 2082;
      v24 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v17, 0x26u);
    }
LABEL_17:

    v14 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v6, "oneMapsSync");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneRoutine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneSourceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[MapsSuggestionsRatingRequestSource initWithMapsSync:routine:delegate:name:](self, "initWithMapsSync:routine:delegate:name:", v11, v12, v13, v7);

  v14 = self;
LABEL_18:

  return v14;
}

- (void)start
{
  -[MapsSuggestionsRatingRequestSource updateSuggestionEntriesWithHandler:](self, "updateSuggestionEntriesWithHandler:", 0);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  double v7;
  double v8;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MapsSuggestionsRatingRequestSource_updateSuggestionEntriesWithHandler___block_invoke;
  block[3] = &unk_1E4BCE550;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v6 = v4;
  dispatch_async(queue, block);
  GEOConfigGetDouble();
  v8 = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

void __73__MapsSuggestionsRatingRequestSource_updateSuggestionEntriesWithHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  id v3;
  unsigned int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_queue_t v25;
  double v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  id from;
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;
  id location[5];
  id v36;
  _BYTE buf[32];
  id v38;
  id v39[3];
  id v40[4];

  v40[3] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    dispatch_assert_queue_V2(WeakRetained[3]);
    v4 = objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *MEMORY[0x1E0D26D08]);
    if (v4 >= 2)
    {
      if (v4 == 2)
      {
        GEOFindOrCreateLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Maps is Offline. Not running Ratings Request Source.", buf, 2u);
        }

        objc_initWeak(location, WeakRetained);
        v6 = WeakRetained[3];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E4BCE550;
        objc_copyWeak(v39, location);
        v38 = v3;
        dispatch_async(v6, buf);

        objc_destroyWeak(v39);
        objc_destroyWeak(location);
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v4;
        _os_log_fault_impl(&dword_1A427D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled")
        && !MapsSuggestionsIsInCoarseLocation())
      {
        MapsSuggestionsCurrentBestLocation();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          GEOFindOrCreateLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "Current location is nil", buf, 2u);
          }

          objc_initWeak(location, WeakRetained);
          v29 = WeakRetained[3];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_158;
          *(_QWORD *)&buf[24] = &unk_1E4BCE550;
          objc_copyWeak(v39, location);
          v38 = v3;
          dispatch_async(v29, buf);

          objc_destroyWeak(v39);
          objc_destroyWeak(location);
        }
        else
        {
          GEOFindOrCreateLog();
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromMapsSuggestionsEntryType(0x15uLL);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromMapsSuggestionsCurrentBestLocation();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v18;
            _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

          }
          GEOConfigGetDouble();
          v20 = v19;
          GEOConfigGetDouble();
          v22 = v21;
          GEOConfigGetDouble();
          v24 = v23;
          location[0] = 0;
          location[1] = location;
          location[2] = (id)0x3032000000;
          location[3] = __Block_byref_object_copy__18;
          location[4] = __Block_byref_object_dispose__18;
          MapsSuggestionsNowWithOffset(-v20);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v33[0] = 0;
          v33[1] = v33;
          v33[2] = 0x3032000000;
          v33[3] = __Block_byref_object_copy__18;
          v33[4] = __Block_byref_object_dispose__18;
          v34 = 0;
          v31[0] = 0;
          v31[1] = v31;
          v31[2] = 0x2020000000;
          v32 = 0;
          objc_initWeak(&from, WeakRetained);
          v25 = WeakRetained[4];
          GEOConfigGetDouble();
          v27 = v26;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_159;
          *(_QWORD *)&buf[24] = &unk_1E4BD0F18;
          objc_copyWeak(v40, &from);
          v38 = v3;
          v39[0] = location;
          v39[1] = v33;
          v39[2] = v31;
          v40[1] = v24;
          v40[2] = v22;
          -[NSObject mapItemsForHistoricPlaces:routes:maxAge:handler:](v25, "mapItemsForHistoricPlaces:routes:maxAge:handler:", 1, 1, buf, v27);

          objc_destroyWeak(v40);
          objc_destroyWeak(&from);
          _Block_object_dispose(v31, 8);
          _Block_object_dispose(v33, 8);

          _Block_object_dispose(location, 8);
        }
      }
      else
      {
        GEOFindOrCreateLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "User turned off Siri for Maps or is in coarse location", buf, 2u);
        }

        objc_initWeak(location, WeakRetained);
        v10 = WeakRetained[3];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_157;
        *(_QWORD *)&buf[24] = &unk_1E4BCE550;
        objc_copyWeak(v39, location);
        v38 = v3;
        dispatch_async(v10, buf);

        objc_destroyWeak(v39);
        objc_destroyWeak(location);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Laguna Beach Suggestions has been disabled in the Maps Settings!", buf, 2u);
      }

      objc_initWeak(location, WeakRetained);
      v12 = WeakRetained[3];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_155;
      *(_QWORD *)&buf[24] = &unk_1E4BCE550;
      objc_copyWeak(v39, location);
      v38 = v3;
      dispatch_async(v12, buf);

      objc_destroyWeak(v39);
      objc_destroyWeak(location);
    }
LABEL_22:

    goto LABEL_23;
  }
  GEOFindOrCreateLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "MapsSuggestionsRatingRequestSource.mm";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = 130;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = "-[MapsSuggestionsRatingRequestSource updateSuggestionEntriesWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_23:
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 21;
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke(uint64_t a1)
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
      v7 = "MapsSuggestionsRatingRequestSource.mm";
      v8 = 1026;
      v9 = 255;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_155(uint64_t a1)
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
      v7 = "MapsSuggestionsRatingRequestSource.mm";
      v8 = 1026;
      v9 = 261;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_157(uint64_t a1)
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
      v7 = "MapsSuggestionsRatingRequestSource.mm";
      v8 = 1026;
      v9 = 266;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_158(uint64_t a1)
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
      v7 = "MapsSuggestionsRatingRequestSource.mm";
      v8 = 1026;
      v9 = 271;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint8_t buf[4];
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  GEOFindOrCreateLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Received %u mapItems from MapsSync", buf, 8u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_160;
    block[3] = &unk_1E4BD0EF0;
    objc_copyWeak(&v18, (id *)(a1 + 64));
    v13 = v6;
    v14 = v5;
    v15 = *(id *)(a1 + 32);
    v16 = *(_OWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 56);
    v19 = *(_OWORD *)(a1 + 72);
    dispatch_async(v10, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "MapsSuggestionsRatingRequestSource.mm";
      v22 = 1026;
      v23 = 291;
      v24 = 2082;
      v25 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_160(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_group_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char *v12;
  void *v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id *from;
  uint64_t v25;
  _QWORD *WeakRetained;
  _QWORD block[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[5];
  NSObject *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[4];
  NSObject *v42;
  _QWORD *v43;
  __int128 v44;
  uint64_t v45;
  id v46[2];
  uint8_t v47[128];
  uint8_t buf[4];
  char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  from = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v49 = "MapsSuggestionsRatingRequestSource.mm";
      v50 = 1026;
      v51 = 293;
      v52 = 2082;
      v53 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
    v6 = v5;
    goto LABEL_28;
  }
  v25 = a1;
  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    v7 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_161;
    aBlock[3] = &unk_1E4BD0E00;
    v6 = v7;
    v42 = v6;
    v43 = WeakRetained;
    v46[1] = *(id *)(a1 + 88);
    objc_copyWeak(v46, from);
    v44 = *(_OWORD *)(a1 + 56);
    v45 = *(_QWORD *)(a1 + 72);
    v23 = _Block_copy(aBlock);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v8);
          v12 = *(char **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((objc_msgSend(v12, "_hasMUID") & 1) != 0)
          {
            dispatch_group_enter(v6);
            v13 = (void *)WeakRetained[4];
            v14 = *(double *)(v25 + 96);
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_166;
            v33[3] = &unk_1E4BD0E50;
            objc_copyWeak(&v36, from);
            v33[4] = v12;
            v15 = v6;
            v34 = v15;
            v35 = v23;
            if (!objc_msgSend(v13, "canProduceRatingRequestForMapItem:maxAge:handler:", v12, v33, v14))
            {
              GEOFindOrCreateLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v12;
                _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "We got no response from MSgMapsSync for %@", buf, 0xCu);
              }

              dispatch_group_leave(v15);
            }

            objc_destroyWeak(&v36);
          }
          else
          {
            GEOFindOrCreateLog();
            v17 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "name");
              v18 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v49 = v18;
              _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "We're skipping mapItem: %@ without MUIDs", buf, 0xCu);

            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v9);
    }

    v19 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_169;
    block[3] = &unk_1E4BD0EC8;
    objc_copyWeak(&v32, from);
    v29 = *(_QWORD *)(v25 + 64);
    v20 = *(id *)(v25 + 48);
    v21 = *(_QWORD *)(v25 + 72);
    v28 = v20;
    v22 = *(_QWORD *)(v25 + 56);
    v30 = v21;
    v31 = v22;
    dispatch_group_notify(v6, v19, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak(v46);
    v5 = v42;
LABEL_28:

    goto LABEL_29;
  }
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v49 = v3;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "Error reading MapsSync: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
LABEL_29:

}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_161(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  GEOFindOrCreateLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "fetchLastVisitAtMapItem: %@", buf, 0xCu);

  }
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v9 = *(double *)(a1 + 80);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_162;
  v12[3] = &unk_1E4BD0DD8;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  v13 = *(id *)(a1 + 32);
  v10 = v5;
  v14 = v10;
  v15 = *(_OWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v18 = a3;
  if (!objc_msgSend(v8, "fetchLastVisitAtMapItem:withinDistance:handler:", v10, v12, v9))
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "We got no response from MSgRoutine for %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  objc_destroyWeak(&v17);
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_162(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_163;
    block[3] = &unk_1E4BD0DB0;
    v15 = v9;
    v16 = *(id *)(a1 + 32);
    v17 = v7;
    v18 = v8;
    v19 = *(id *)(a1 + 40);
    v20 = *(_OWORD *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = *(_BYTE *)(a1 + 80);
    dispatch_async(v12, block);

    v13 = v15;
  }
  else
  {
    GEOFindOrCreateLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "MapsSuggestionsRatingRequestSource.mm";
      v25 = 1026;
      v26 = 311;
      v27 = 2082;
      v28 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_163(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32) == 0;
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(void **)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v9 = objc_msgSend(*(id *)(a1 + 64), "_hasPlaceQuestionnaire");
      objc_msgSend(*(id *)(a1 + 64), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v8;
      v20 = 2112;
      v21 = v7;
      v22 = 1024;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "lastVisitStartTime: %@; lastVisitEndTime: %@; _hasPlaceQuestionnaire: %d for mapItem: %@",
        (uint8_t *)&v18,
        0x26u);

    }
    v11 = 56;
    if (!*(_QWORD *)(a1 + 56))
      v11 = 48;
    v12 = *(void **)(a1 + v11);
    v13 = v12;
    if (v13)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "laterDate:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v13)
      {
        v15 = objc_msgSend(*(id *)(a1 + 64), "_hasPlaceQuestionnaire");

        if (v15)
        {
          GEOFindOrCreateLog();
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 64), "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 138412290;
            v19 = v17;
            _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Updating mostRecentDate/MapItem/IsBrandNew for mapItem: %@", (uint8_t *)&v18, 0xCu);

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v12);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 64));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(a1 + 96);
        }
      }
      else
      {

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v18 = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error getting last visit: %@", (uint8_t *)&v18, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_166(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_167;
    block[3] = &unk_1E4BD0E28;
    v15 = a2;
    v9 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v14 = *(id *)(a1 + 48);
    v13 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsRatingRequestSource.mm";
      v18 = 1026;
      v19 = 350;
      v20 = 2082;
      v21 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_167(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 56);
    MapsSuggestionsMapItemConvertIfNeeded(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, BOOL))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 48) == 0);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "canProduceRatingRequestForMapItem returned NO. We should not suggest a RatingRequest for %@", (uint8_t *)&v6, 0xCu);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_169(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  MapsSuggestionsEntry *v9;
  void *v10;
  MapsSuggestionsEntry *v11;
  void *v12;
  MapsSuggestionsEntry *v13;
  MapsSuggestionsEntry *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  id v46;
  __int128 v47;
  _QWORD v48[4];
  NSObject *v49;
  __int128 v50;
  id v51;
  _QWORD v52[5];
  _BYTE buf[40];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsRatingRequestSource.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 372;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfNotify went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_52;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Winning mapItem being sent for RatingRequest entry creation is: %@", buf, 0xCu);

    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      || (objc_msgSend(*((id *)WeakRetained + 6), "hasBudgetLeft") & 1) != 0)
    {
      MapsSuggestionsMapItemConvertIfNeeded(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v8 = v6;
      v46 = v7;
      v9 = [MapsSuggestionsEntry alloc];
      objc_msgSend(v8, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MapsSuggestionsEntry initWithType:title:](v9, "initWithType:title:", 21, v10);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("RatingRequest_%llu"), objc_msgSend(v8, "_muid"));
      -[MapsSuggestionsEntry setString:forKey:](v11, "setString:forKey:", v12, CFSTR("MapsSuggestionsMapsSyncSourcePK"));

      -[MapsSuggestionsEntry setString:forKey:](v11, "setString:forKey:", CFSTR("MapsSuggestionsMapsSyncSourcePK"), CFSTR("MapsSuggestionsPrimaryKey"));
      -[MapsSuggestionsEntry setBoolean:forKey:](v11, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsIsNotADestinationKey"));
      -[MapsSuggestionsEntry setDate:forKey:](v11, "setDate:forKey:", v46, CFSTR("MapsSuggestionsCoreRoutineLastVisit"));
      -[MapsSuggestionsEntry setGeoMapItem:](v11, "setGeoMapItem:", v8);
      GEOConfigGetDouble();
      -[MapsSuggestionsEntry setWeight:](v11, "setWeight:");
      v13 = v11;
      v14 = v13;
      if (v13)
      {
        -[MapsSuggestionsEntry geoMapItem](v13, "geoMapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (!v16)
        {
          -[MapsSuggestionsEntry geoMapItem](v14, "geoMapItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = MapsSuggestionsSetLocationFromMapItem(v14, v17, 6);

          -[MapsSuggestionsEntry geoMapItem](v14, "geoMapItem");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            GEOFindOrCreateLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 166;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "NSArray<NSString *> *_extractTitleAndSubtitleFromMapItem(MapsSuggestionsMapItem *__strong)";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "nil == (mapItem)";
              _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
            }
            goto LABEL_36;
          }
          objc_msgSend(v19, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length") == 0;

          if (v22)
          {
            v24 = 0;
          }
          else
          {
            objc_msgSend(v20, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__18;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__18;
            v54 = 0;
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = ___ZL18_firstLineOfStringP8NSString_block_invoke_0;
            v52[3] = &unk_1E4BD0BA0;
            v52[4] = buf;
            objc_msgSend(v23, "enumerateLinesUsingBlock:", v52);
            v24 = *(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            if (v24)
            {
              objc_msgSend(v20, "shortAddress");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v25, "containsString:", v24);

              if (!v45)
              {
LABEL_34:
                if (-[NSObject length](v24, "length"))
                {
                  *(_QWORD *)buf = v24;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
                  v31 = objc_claimAutoreleasedReturnValue();
LABEL_37:

                  if (-[NSObject count](v31, "count"))
                  {
                    -[NSObject firstObject](v31, "firstObject");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MapsSuggestionsEntry setUndecoratedTitle:](v14, "setUndecoratedTitle:", v34);

                    if ((unint64_t)-[NSObject count](v31, "count") >= 2)
                    {
                      -[NSObject lastObject](v31, "lastObject");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MapsSuggestionsEntry setUndecoratedSubtitle:](v14, "setUndecoratedSubtitle:", v35);

                    }
                  }
                  goto LABEL_40;
                }
LABEL_36:
                v31 = 0;
                goto LABEL_37;
              }
            }
          }
          objc_msgSend(v20, "shortAddress");
          v33 = objc_claimAutoreleasedReturnValue();

          v24 = v33;
          goto LABEL_34;
        }
        GEOFindOrCreateLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_40:

          if (v14)
          {
            v36 = (void *)*((_QWORD *)WeakRetained + 4);
            v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_170;
            v48[3] = &unk_1E4BD0EA0;
            objc_copyWeak(&v51, v2);
            v47 = *(_OWORD *)(a1 + 32);
            v38 = (id)v47;
            v50 = v47;
            v26 = v14;
            v49 = v26;
            if (!objc_msgSend(v36, "didProduceRatingRequestForMapItem:handler:", v37, v48))
            {
              GEOFindOrCreateLog();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v40;
                _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_ERROR, "Could not write the RatingRequest for MapItem %@", buf, 0xCu);
              }

              objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
              v41 = *(_QWORD *)(a1 + 32);
              if (v41)
                (*(void (**)(void))(v41 + 16))();
            }

            objc_destroyWeak(&v51);
          }
          else
          {
            GEOFindOrCreateLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v43;
              _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_ERROR, "Could not make Entry out of MapItem %@", buf, 0xCu);
            }

            objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
            v44 = *(_QWORD *)(a1 + 32);
            if (v44)
              (*(void (**)(void))(v44 + 16))();
            v26 = 0;
          }
LABEL_52:

          goto LABEL_53;
        }
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 188;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "BOOL _addFieldsToSuggestionsEntry(MapsSuggestionsEntry *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (entry.geoMapItem)";
        v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem to be set in advance";
      }
      else
      {
        GEOFindOrCreateLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestSource.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 187;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "BOOL _addFieldsToSuggestionsEntry(MapsSuggestionsEntry *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = "nil == (entry)";
        v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
      }
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x26u);
      goto LABEL_40;
    }
    GEOFindOrCreateLog();
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "No budget left to suggest this RatingRequest : %@", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_DEBUG, "Found no suitable MapItem to generate RatingRequest entry", buf, 2u);
    }

    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", MEMORY[0x1E0C9AA60]);
  }
  v30 = *(_QWORD *)(a1 + 32);
  if (v30)
    (*(void (**)(void))(v30 + 16))();
LABEL_53:

}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  id v16;
  NSObject **v17;
  __int128 v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_171;
    block[3] = &unk_1E4BD0E78;
    v14 = v6;
    v15 = v5;
    v12 = *(_OWORD *)(a1 + 40);
    v10 = (id)v12;
    v18 = v12;
    v16 = *(id *)(a1 + 32);
    v17 = v8;
    dispatch_async(v9, block);

    v11 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsRatingRequestSource.mm";
      v21 = 1026;
      v22 = 397;
      v23 = 2082;
      v24 = "-[MapsSuggestionsRatingRequestSource _q_updateHistoryEntriesWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __73__MapsSuggestionsRatingRequestSource__q_updateHistoryEntriesWithHandler___block_invoke_171(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v7 = *(void **)(a1 + 40)) == 0)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_ERROR, "Error during the writing of the RatingRequest: %@ ; timeWritten: %@ ; for mapItem:%@",
        buf,
        0x20u);

    }
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
  else
  {
    GEOConfigGetDouble();
    objc_msgSend(v7, "dateByAddingTimeInterval:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setExpires:", v8);

    v9 = *(void **)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOrUpdateMySuggestionEntries:", v10);

    objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GEOConfigGetString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12 || (objc_msgSend(v12, "isEqualToString:", v11) & 1) == 0)
    {
      GEOFindOrCreateLog();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "We will spend budget on this new Entry: %@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "spendNow");
      GEOConfigSetString();
    }
    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(void))(v16 + 16))();

  }
}

- (id)readBudgetState
{
  return (id)GEOConfigGetDictionary();
}

- (void)writeBudgetState:(id)a3
{
  GEOConfigSetDictionary();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budget, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
