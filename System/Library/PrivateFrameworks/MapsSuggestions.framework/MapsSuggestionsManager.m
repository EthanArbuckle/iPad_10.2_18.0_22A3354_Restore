@implementation MapsSuggestionsManager

- (MapsSuggestionsManager)initWithStrategy:(id)a3 locationUpdater:(id)a4 network:(id)a5 flightUpdater:(id)a6 ETARequirements:(id)a7 virtualGarage:(id)a8
{
  id v15;
  id v16;
  MapsSuggestionsManager *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *gatheringQueue;
  dispatch_queue_t v21;
  OS_dispatch_queue *storageQueue;
  MapsSuggestionsTracker *v23;
  MapsSuggestionsTracker *tracker;
  MapsSuggestionsCompositeSource *v25;
  MapsSuggestionsCompositeSource *compositeSource;
  MapsSuggestionsObservers *v27;
  MapsSuggestionsObservers *sinks;
  NSMutableDictionary *v29;
  NSMutableDictionary *storage;
  uint64_t v31;
  NSMutableDictionary *additionalFiltersPerSink;
  MapsSuggestionsCanKicker *v33;
  OS_dispatch_queue *v34;
  uint64_t v35;
  uint64_t v36;
  MapsSuggestionsCanKicker *expiredEntryInvalidator;
  MapsSuggestionsCanKicker *v38;
  OS_dispatch_queue *v39;
  uint64_t v40;
  MapsSuggestionsCanKicker *wipeStaleETAWiper;
  double v42;
  double v43;
  MapsSuggestionsCanKicker *v44;
  OS_dispatch_queue *v45;
  uint64_t v46;
  MapsSuggestionsCanKicker *deferredSourcesUpdater;
  MapsSuggestionsManager *v48;
  NSObject *v49;
  NSObject *attr;
  id v52;
  id v53;
  id obj;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;
  _BYTE location[12];
  __int16 v64;
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  obj = a4;
  v52 = a5;
  v53 = a6;
  v55 = a7;
  v16 = a8;
  if (v15)
  {
    v62.receiver = self;
    v62.super_class = (Class)MapsSuggestionsManager;
    v17 = -[MapsSuggestionsManager init](&v62, sel_init);
    if (v17)
    {
      objc_initWeak((id *)location, v17);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
      attr = objc_claimAutoreleasedReturnValue();

      v19 = dispatch_queue_create("MapsSuggestionsManagerGatheringQueue", attr);
      gatheringQueue = v17->_gatheringQueue;
      v17->_gatheringQueue = (OS_dispatch_queue *)v19;

      v21 = dispatch_queue_create("MapsSuggestionsManagerStorageQueue", attr);
      storageQueue = v17->_storageQueue;
      v17->_storageQueue = (OS_dispatch_queue *)v21;

      -[MapsSuggestionsCanKicker cancel](v17->_deferredSourcesUpdater, "cancel");
      objc_storeStrong((id *)&v17->_strategy, a3);
      -[MapsSuggestionsStrategy setManager:](v17->_strategy, "setManager:", v17);
      objc_storeWeak((id *)&v17->_locationUpdater, obj);
      if (v55)
      {
        v23 = -[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]([MapsSuggestionsTracker alloc], "initWithManager:requirements:network:flightUpdater:virtualGarage:", v17, v55, v52, v53, v16);
        tracker = v17->_tracker;
        v17->_tracker = v23;

      }
      v25 = -[MapsSuggestionsCompositeSource initWithDelegate:name:]([MapsSuggestionsCompositeSource alloc], "initWithDelegate:name:", v17, CFSTR("MapsSuggestionsBuiltinCompositeSource"));
      compositeSource = v17->_compositeSource;
      v17->_compositeSource = v25;

      v27 = -[MapsSuggestionsObservers initWithCallbackQueue:name:]([MapsSuggestionsObservers alloc], "initWithCallbackQueue:name:", v17->_storageQueue, CFSTR("MapsSuggestionsManagerSinks"));
      sinks = v17->_sinks;
      v17->_sinks = v27;

      v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      storage = v17->_storage;
      v17->_storage = v29;

      v17->_defaultTansportType = GEOTransportTypeFromUserPreference();
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      additionalFiltersPerSink = v17->_additionalFiltersPerSink;
      v17->_additionalFiltersPerSink = (NSMutableDictionary *)v31;

      v33 = [MapsSuggestionsCanKicker alloc];
      v34 = v17->_storageQueue;
      v35 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke;
      v60[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v61, (id *)location);
      v36 = -[MapsSuggestionsCanKicker initWithName:queue:block:](v33, "initWithName:queue:block:", CFSTR("MapsSuggestionsManagerExpiredEntryInvalidator"), v34, v60);
      expiredEntryInvalidator = v17->_expiredEntryInvalidator;
      v17->_expiredEntryInvalidator = (MapsSuggestionsCanKicker *)v36;

      v38 = [MapsSuggestionsCanKicker alloc];
      v39 = v17->_storageQueue;
      v58[0] = v35;
      v58[1] = 3221225472;
      v58[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_93;
      v58[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v59, (id *)location);
      v40 = -[MapsSuggestionsCanKicker initWithName:queue:block:](v38, "initWithName:queue:block:", CFSTR("MapsSuggestionsManagerETAWiper"), v39, v58);
      wipeStaleETAWiper = v17->_wipeStaleETAWiper;
      v17->_wipeStaleETAWiper = (MapsSuggestionsCanKicker *)v40;

      GEOConfigGetDouble();
      v43 = v42;
      v44 = [MapsSuggestionsCanKicker alloc];
      v45 = v17->_gatheringQueue;
      v56[0] = v35;
      v56[1] = 3221225472;
      v56[2] = __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_96;
      v56[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v57, (id *)location);
      v46 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v44, "initWithName:time:queue:block:", CFSTR("MapsSuggestionsManagerDeferredUpdater"), v45, v56, v43);
      deferredSourcesUpdater = v17->_deferredSourcesUpdater;
      v17->_deferredSourcesUpdater = (MapsSuggestionsCanKicker *)v46;

      v17->_mapType = 0;
      v17->_sourcesRunning = 0;
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);

      objc_destroyWeak((id *)location);
    }
    self = v17;
    v48 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v64 = 1024;
      v65 = 114;
      v66 = 2082;
      v67 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]";
      v68 = 2082;
      v69 = "nil == (strategy)";
      _os_log_impl(&dword_1A427D000, v49, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A strategy is required.", location, 0x26u);
    }

    v48 = 0;
  }

  return v48;
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke(uint64_t a1)
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
    -[MapsSuggestionsManager _sendInvalidateToAllSinks]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsManager.mm";
      v6 = 1026;
      v7 = 151;
      v8 = 2082;
      v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)_sendInvalidateToAllSinks
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id buf[2];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_sendInvalidateToAllSinks", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, (id)a1);
  v3 = *(void **)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MapsSuggestionsManager__sendInvalidateToAllSinks__block_invoke;
  v4[3] = &unk_1E4BCE5C8;
  objc_copyWeak(&v5, buf);
  objc_msgSend(v3, "callBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_93(uint64_t a1)
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
    -[MapsSuggestionsManager _wipeStaleETAs]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsManager.mm";
      v6 = 1026;
      v7 = 157;
      v8 = 2082;
      v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)_wipeStaleETAs
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    if (!MapsSuggestionsIsInTheFuture(v2))
    {
      objc_initWeak(&location, (id)a1);
      v3 = *(NSObject **)(a1 + 16);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke;
      v4[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v5, &location);
      dispatch_async(v3, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __111__MapsSuggestionsManager_initWithStrategy_locationUpdater_network_flightUpdater_ETARequirements_virtualGarage___block_invoke_96(uint64_t a1)
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
    -[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]((uint64_t)WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsManager.mm";
      v6 = 1026;
      v7 = 164;
      v8 = 2082;
      v9 = "-[MapsSuggestionsManager initWithStrategy:locationUpdater:network:flightUpdater:ETARequirements:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)_updateAllSourcesOnceWithHandler:(uint64_t)a1
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 8);
    objc_initWeak(&location, (id)a1);
    v5 = *(NSObject **)(a1 + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke;
    v7[3] = &unk_1E4BCE578;
    v8 = v4;
    v6 = v4;
    objc_copyWeak(&v10, &location);
    v9 = v3;
    dispatch_async(v5, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsCanKicker cancel](self->_expiredEntryInvalidator, "cancel");
  -[MapsSuggestionsCanKicker cancel](self->_wipeStaleETAWiper, "cancel");
  -[MapsSuggestionsCanKicker cancel](self->_deferredSourcesUpdater, "cancel");
  -[MapsSuggestionsManager _stopAllSources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsManager;
  -[MapsSuggestionsManager dealloc](&v3, sel_dealloc);
}

- (void)_stopAllSources
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v3;
      v12 = 2080;
      v13 = "Stop Sources";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Stop Sources", ", (uint8_t *)&v10, 2u);
    }

    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 64), "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Stopping SOURCE{%@}", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 64), "stop");
    *(_BYTE *)(a1 + 128) = 0;
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2080;
      v13 = "Stop Sources";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);

    }
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stop Sources", ", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)setMapType:(int)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    -[MapsSuggestionsTracker setMapType:](self->_tracker, "setMapType:");
  }
}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v5;

  v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    -[MapsSuggestionsTracker setAutomobileOptions:](self->_tracker, "setAutomobileOptions:", v5);
  }

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)_updateCurrentLocation:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  char IsUsableLocation;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  double v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "LOCATION UPDATE %@", (uint8_t *)&v16, 0xCu);
    }

  }
  if (v3)
  {
    MapsSuggestionsSetMostRecentLocation(v3);
    IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(*(void **)(a1 + 120));
    objc_msgSend(v3, "distanceFromLocation:", *(_QWORD *)(a1 + 120));
    v7 = v6;
    MapsSuggestionsCurrentBestLocation();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v8;

    v10 = *(void **)(a1 + 40);
    MapsSuggestionsCurrentBestLocation();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocation:", v11);

    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      if ((IsUsableLocation & 1) == 0 && MapsSuggestionsTrackerIsUsableLocation(v3))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          v13 = "_updateAllSourcesOnce schedule (usability)";
LABEL_16:
          _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      GEOConfigGetDouble();
      if (v7 > v14)
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          v13 = "_updateAllSourcesOnce schedule (distance)";
          goto LABEL_16;
        }
LABEL_17:

        objc_msgSend(*(id *)(a1 + 112), "kickCanBySameTime");
      }
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "No Sinks are watching.", (uint8_t *)&v16, 2u);
        }

      }
    }
  }

}

- (void)_startSource:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Starting SOURCE{%@}", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "start");

}

- (void)_updateSource:(void *)a3 forType:(int)a4 repeat:(void *)a5 handler:
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  dispatch_time_t v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  dispatch_assert_queue_V2(a1[1]);
  NSStringFromMapsSuggestionsEntryType((unint64_t)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uniqueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromMapsSuggestionsCurrentBestLocation();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = v13;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);

  }
  objc_msgSend(v9, "updateSuggestionEntriesOfType:handler:", a3, v10);
  if (a4)
  {
    v16 = v15;
    if (v15 > 0.0)
    {
      objc_initWeak((id *)buf, a1);
      v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      v18 = a1[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsManager__updateSource_forType_repeat_handler___block_invoke;
      block[3] = &unk_1E4BCDDD0;
      objc_copyWeak(v21, (id *)buf);
      v20 = v9;
      v21[1] = a3;
      dispatch_after(v17, v18, block);

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __63__MapsSuggestionsManager__updateSource_forType_repeat_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _updateSource:forType:repeat:handler:](WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 1, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 282;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager _updateSource:forType:repeat:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_2;
  v3[3] = &unk_1E4BCE550;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  _WORD v15[17];

  *(_QWORD *)&v15[13] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2080;
      *(_QWORD *)v15 = "_updateAllSourcesOnce";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateAllSourcesOnce", ", buf, 2u);
    }

    v7 = (void *)WeakRetained[8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_100;
    v9[3] = &unk_1E4BCE550;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 32);
    -[MapsSuggestionsManager _updateSource:forType:repeat:handler:]((dispatch_queue_t *)WeakRetained, v7, 0, 0, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "MapsSuggestionsManager.mm";
      v14 = 1026;
      *(_DWORD *)v15 = 301;
      v15[2] = 2082;
      *(_QWORD *)&v15[3] = "-[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __59__MapsSuggestionsManager__updateAllSourcesOnceWithHandler___block_invoke_100(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v4;
      v10 = 2080;
      *(_QWORD *)v11 = "_updateAllSourcesOnce";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateAllSourcesOnce", ", (uint8_t *)&v8, 2u);
    }

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsManager.mm";
      v10 = 1026;
      *(_DWORD *)v11 = 308;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (id)_pruneExpiredFromEntries:(dispatch_queue_t *)a1
{
  __CFString *v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  id v15;
  id v16;
  dispatch_queue_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v17 = a1;
  dispatch_assert_queue_V2(a1[2]);
  if (objc_msgSend(v4, "count"))
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v19;
      v16 = v4;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
          if ((objc_msgSend(v9, "deleted") & 1) != 0 || objc_msgSend(v9, "hasExpired"))
          {
            objc_msgSend(v9, "setDeleted:", 1);
            GEOFindOrCreateLog();
            v10 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              -[dispatch_queue_t uniqueName](v17, "uniqueName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
              v12 = s_verbose;
              if (s_verbose)
              {
                objc_msgSend(v9, "serializedBase64String");
                v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v13 = v2;
              }
              else
              {
                v13 = &stru_1E4BDFC28;
              }
              *(_DWORD *)buf = 138413058;
              v23 = v11;
              v24 = 2048;
              v25 = v9;
              v26 = 2112;
              v27 = v13;
              v28 = 2112;
              v29 = v9;
              _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} PRUNED by OBJECT{%@} {%p:%@}:\n%@", buf, 0x2Au);
              if (v12)

              v4 = v16;
            }

          }
          else
          {
            objc_msgSend(v15, "addObject:", v9);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v6);
    }

  }
  else
  {
    v15 = v4;
  }

  return v15;
}

BOOL __62__MapsSuggestionsManager__pruneSourceEntriesNotRepresentedIn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Kicking out non-result sourceEntry: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

void __51__MapsSuggestionsManager__sendInvalidateToAllSinks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "invalidateForMapsSuggestionsManager:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsManager.mm";
      v8 = 1026;
      v9 = 442;
      v10 = 2082;
      v11 = "-[MapsSuggestionsManager _sendInvalidateToAllSinks]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)_updateResult
{
  NSObject *v1;
  char *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  char *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  char *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  char *v49;
  NSObject *v50;
  char *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  char *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id obj;
  NSObject *v70;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  _BYTE v92[24];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 24))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    GEOFindOrCreateLog();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v2 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v90 = v2;
      v91 = 2080;
      *(_QWORD *)v92 = "_updateResult";
      _os_log_impl(&dword_1A427D000, v1, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateResult", ", buf, 2u);
    }

    v70 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v4 = *(id *)(a1 + 72);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v78 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "mutableCopy");
          -[NSObject setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", v10, v8);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      }
      while (v5);
    }

    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", *(_QWORD *)(a1 + 80), 1);
    v11 = *(void **)(a1 + 24);
    v76 = 0;
    objc_msgSend(v11, "topSuggestionsWithSourceEntries:error:", v70, &v76);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v76;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v73 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          if ((objc_msgSend(v16, "containsKey:", CFSTR("MapsSuggestionsNewSourceKey")) & 1) != 0)
          {
            objc_msgSend(v16, "originatingSourceName");
            v17 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringForKey:", CFSTR("MapsSuggestionsNewSourceKey"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
            {
              GEOFindOrCreateLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v90 = v17;
                v91 = 2112;
                *(_QWORD *)v92 = v18;
                *(_WORD *)&v92[8] = 2112;
                *(_QWORD *)&v92[10] = v16;
                _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "RELINKING from %@ to %@: %@", buf, 0x20u);
              }

              objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObjectIdenticalTo:", v16);

              objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v16);

              objc_msgSend(v16, "setOriginatingSourceName:", v18);
            }
            objc_msgSend(v16, "setString:forKey:", 0, CFSTR("MapsSuggestionsNewSourceKey"));

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      }
      while (v13);
    }

    if (v68)
    {
      GEOFindOrCreateLog();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__updateResult);
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v23;
        v91 = 2112;
        *(_QWORD *)v92 = v68;
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "%@ received error: %@", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v25;
        v91 = 2080;
        *(_QWORD *)v92 = "_updateResult";
        _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v26))
        goto LABEL_79;
      *(_WORD *)buf = 0;
    }
    else
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      v28 = *(id *)(a1 + 72);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v30 = v28;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v84 != v32)
              objc_enumerationMutation(v30);
            v34 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k);
            objc_msgSend(v30, "objectForKeyedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)a1, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(v36, "mutableCopy");
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, v34);

          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
        }
        while (v31);
      }

      v38 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v29;

      -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)a1, obj);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v66;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      v65 = *(id *)(a1 + 72);
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v40 = v65;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v84;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v84 != v42)
              objc_enumerationMutation(v40);
            v44 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m);
            objc_msgSend(v40, "objectForKeyedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = __62__MapsSuggestionsManager__pruneSourceEntriesNotRepresentedIn___block_invoke;
            v81[3] = &unk_1E4BCE5A0;
            v82 = obj;
            objc_msgSend(v45, "MSg_mutableCopyIf:", v81);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, v44);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
        }
        while (v41);
      }

      v47 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v39;

      if (objc_msgSend(v67, "isEqualToArray:", obj))
      {
        GEOFindOrCreateLog();
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(sel__updateResult);
          v49 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v90 = v49;
          _os_log_impl(&dword_1A427D000, v48, OS_LOG_TYPE_DEBUG, "%@ found no changes to previous result.", buf, 0xCu);

        }
        GEOFindOrCreateLog();
        v50 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)a1, "uniqueName");
          v51 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v51;
          v91 = 2080;
          *(_QWORD *)v92 = "_updateResult";
          _os_log_impl(&dword_1A427D000, v50, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v26))
          goto LABEL_79;
        *(_WORD *)buf = 0;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 80), v66);
        v52 = *(id *)(a1 + 80);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        if (objc_msgSend(v52, "count"))
        {
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v53 = v52;
          v54 = 0;
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
          if (v55)
          {
            v56 = *(_QWORD *)v84;
            while (2)
            {
              for (n = 0; n != v55; ++n)
              {
                if (*(_QWORD *)v84 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * n);
                if (objc_msgSend(v58, "deleted"))
                {
                  v60 = v58;

                  v54 = v60;
                  goto LABEL_70;
                }
                if (!v54 || objc_msgSend(v58, "expiresBeforeEntry:", v54))
                {
                  v59 = v58;

                  v54 = v59;
                }
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
              if (v55)
                continue;
              break;
            }
          }
LABEL_70:

          objc_msgSend(v54, "expires");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v61;
          if (v61)
            objc_msgSend(*(id *)(a1 + 96), "kickCanByTime:", MapsSuggestionsSecondsTo(v61));

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 96), "cancel");
        }

        objc_msgSend(*(id *)(a1 + 40), "trackSuggestionEntries:transportType:", obj, *(unsigned int *)(a1 + 88));
        -[MapsSuggestionsManager _sendInvalidateToAllSinks](a1);
        GEOFindOrCreateLog();
        v63 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)a1, "uniqueName");
          v64 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v64;
          v91 = 2080;
          *(_QWORD *)v92 = "_updateResult";
          _os_log_impl(&dword_1A427D000, v63, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

        }
        GEOFindOrCreateLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v26))
          goto LABEL_79;
        *(_WORD *)buf = 0;
      }
    }
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateResult", ", buf, 2u);
LABEL_79:

    v27 = v70;
    goto LABEL_80;
  }
  GEOFindOrCreateLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v90 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v91 = 1024;
    *(_DWORD *)v92 = 482;
    *(_WORD *)&v92[4] = 2082;
    *(_QWORD *)&v92[6] = "-[MapsSuggestionsManager _updateResult]";
    *(_WORD *)&v92[14] = 2082;
    *(_QWORD *)&v92[16] = "nil == (_strategy)";
    _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot do anything without a Strategy.", buf, 0x26u);
  }
LABEL_80:

}

- (void)hintRefreshOfType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *gatheringQueue;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsEntryType(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "hintRefreshOfType:%@", buf, 0xCu);

  }
  if (a3)
  {
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__MapsSuggestionsManager_hintRefreshOfType___block_invoke;
    v8[3] = &unk_1E4BCE5F0;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = (id)a3;
    dispatch_async(gatheringQueue, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

void __44__MapsSuggestionsManager_hintRefreshOfType___block_invoke(uint64_t a1)
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[8], "canProduceEntriesOfType:", *(_QWORD *)(a1 + 40)))
      -[MapsSuggestionsManager _updateSource:forType:repeat:handler:]((dispatch_queue_t *)v3, v3[8], *(void **)(a1 + 40), 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 563;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager hintRefreshOfType:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)attachSource:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  NSObject *gatheringQueue;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
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
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "attachSource:%@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__MapsSuggestionsManager_attachSource___block_invoke;
    v9[3] = &unk_1E4BCE618;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v4;
    dispatch_async(gatheringQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v14 = 1024;
      v15 = 572;
      v16 = 2082;
      v17 = "-[MapsSuggestionsManager attachSource:]";
      v18 = 2082;
      v19 = "nil == (source)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source to attach to.", buf, 0x26u);
    }

  }
}

void __39__MapsSuggestionsManager_attachSource___block_invoke(uint64_t a1)
{
  void **WeakRetained;
  void **v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[8], "attachSource:", *(_QWORD *)(a1 + 32));
    -[MapsSuggestionsManager _startSource:]((uint64_t)v3, v3[8]);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 579;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager attachSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)detachSource:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  NSObject *gatheringQueue;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
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
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "detachSource:%@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__MapsSuggestionsManager_detachSource___block_invoke;
    v9[3] = &unk_1E4BCE618;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v4;
    dispatch_async(gatheringQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v14 = 1024;
      v15 = 587;
      v16 = 2082;
      v17 = "-[MapsSuggestionsManager detachSource:]";
      v18 = 2082;
      v19 = "nil == (source)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source to detach from.", buf, 0x26u);
    }

  }
}

void __39__MapsSuggestionsManager_detachSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueName");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Stopping SOURCE{%@} (because of detach)", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(WeakRetained[8], "detachSource:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsManager.mm";
      v8 = 1026;
      v9 = 594;
      v10 = 2082;
      v11 = "-[MapsSuggestionsManager detachSource:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)attachSink:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  MapsSuggestionsObservers *v7;
  NSObject *storageQueue;
  MapsSuggestionsObservers *v9;
  NSObject *v10;
  _QWORD block[4];
  MapsSuggestionsObservers *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "attachSink:%@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v7 = self->_sinks;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_attachSink___block_invoke;
    block[3] = &unk_1E4BCE758;
    v12 = v7;
    v13 = v4;
    v9 = v7;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_async(storageQueue, block);
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v17 = 1024;
      v18 = 603;
      v19 = 2082;
      v20 = "-[MapsSuggestionsManager attachSink:]";
      v21 = 2082;
      v22 = "nil == (sink)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink to attach to.", buf, 0x26u);
    }

  }
}

void __37__MapsSuggestionsManager_attachSink___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__MapsSuggestionsManager_attachSink___block_invoke_2;
  v3[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "registerObserver:handler:", v2, v3);
  objc_destroyWeak(&v4);
}

void __37__MapsSuggestionsManager_attachSink___block_invoke_2(uint64_t a1, int a2)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(*((id *)WeakRetained + 5), "scheduleRefresh");
      v5 = v4[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__MapsSuggestionsManager_attachSink___block_invoke_115;
      block[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v8, v2);
      dispatch_async(v5, block);
      objc_destroyWeak(&v8);
    }
    else
    {
      GEOFindOrCreateLog();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v10 = "MapsSuggestionsManager.mm";
        v11 = 1026;
        v12 = 614;
        v13 = 2082;
        v14 = "-[MapsSuggestionsManager attachSink:]_block_invoke_2";
        _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

    }
  }
}

void __37__MapsSuggestionsManager_attachSink___block_invoke_115(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  int v14;
  char *v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Starting location updater", (uint8_t *)&v14, 2u);
    }

    v4 = objc_loadWeakRetained((id *)(v2 + 144));
    objc_msgSend(v4, "startLocationUpdatesForDelegate:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (MapsSuggestionsIsInCoarseLocation())
      objc_msgSend((id)v2, "didLoseLocationPermission");
    -[MapsSuggestionsManager _updateCurrentLocation:](v2, v5);

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    v6 = *(unsigned __int8 *)(v2 + 128);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Sources already started. No need to start again", (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      v9 = v7;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)v2, "uniqueName");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v10;
        v16 = 2080;
        *(_QWORD *)v17 = "Start Sources";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v14, 0x16u);

      }
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Start Sources", ", (uint8_t *)&v14, 2u);
      }

      -[MapsSuggestionsManager _startSource:](v2, *(void **)(v2 + 64));
      *(_BYTE *)(v2 + 128) = 1;
      GEOFindOrCreateLog();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)v2, "uniqueName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v13;
        v16 = 2080;
        *(_QWORD *)v17 = "Start Sources";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);

      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Start Sources", ", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446722;
      v15 = "MapsSuggestionsManager.mm";
      v16 = 1026;
      *(_DWORD *)v17 = 619;
      v17[2] = 2082;
      *(_QWORD *)&v17[3] = "-[MapsSuggestionsManager attachSink:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: gatheringStrongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }

  }
}

- (void)detachSink:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  MapsSuggestionsObservers *v7;
  NSObject *storageQueue;
  NSObject *v9;
  _QWORD block[4];
  MapsSuggestionsObservers *v11;
  id v12;
  MapsSuggestionsManager *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "detachSink:%@", buf, 0xCu);

    }
    v7 = self->_sinks;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_detachSink___block_invoke;
    block[3] = &unk_1E4BCE690;
    v11 = v7;
    v12 = v4;
    v13 = self;
    v9 = v7;
    dispatch_async(storageQueue, block);

  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      v17 = 630;
      v18 = 2082;
      v19 = "-[MapsSuggestionsManager detachSink:]";
      v20 = 2082;
      v21 = "nil == (sink)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink to detach from.", buf, 0x26u);
    }
  }

}

void __37__MapsSuggestionsManager_detachSink___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MapsSuggestionsManager_detachSink___block_invoke_2;
  v6[3] = &unk_1E4BCE668;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "unregisterObserver:handler:", v4, v6);

}

void __37__MapsSuggestionsManager_detachSink___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Removed Sink: '%@'", buf, 0xCu);

  }
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = (uint64_t *)(a1 + 40);
    objc_msgSend(*(id *)(v7 + 40), "unschedule");
    v8 = *v6;
    v9 = *(NSObject **)(*v6 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MapsSuggestionsManager_detachSink___block_invoke_117;
    block[3] = &unk_1E4BCE640;
    block[4] = v8;
    dispatch_async(v9, block);
  }
}

void __37__MapsSuggestionsManager_detachSink___block_invoke_117(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  -[MapsSuggestionsManager _stopAllSources](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Stopping location updater", v5, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
    objc_msgSend(WeakRetained, "stopLocationUpdatesForDelegate:", v2);

  }
}

void __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  int IsUsableLocation;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Wiping out a previous, stale ETA UPDATE", buf, 2u);
    }

    objc_msgSend(*((id *)WeakRetained + 5), "resetAllTitleFormatting");
    MapsSuggestionsCurrentBestLocation();
    v4 = objc_claimAutoreleasedReturnValue();
    IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(v4);
    v6 = (void *)*((_QWORD *)WeakRetained + 5);
    if (IsUsableLocation)
    {
      objc_msgSend(v6, "setLocation:", v4);
      objc_msgSend(*((id *)WeakRetained + 5), "rescheduleRefreshOnlyIfAlreadyRunning");
    }
    else
    {
      objc_msgSend(v6, "setLocation:", 0);
      v7 = *((_QWORD *)WeakRetained + 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke_118;
      block[3] = &unk_1E4BCDDF8;
      objc_copyWeak(&v9, v1);
      dispatch_async(v7, block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsManager.mm";
      v12 = 1026;
      v13 = 694;
      v14 = 2082;
      v15 = "-[MapsSuggestionsManager _wipeStaleETAs]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __40__MapsSuggestionsManager__wipeStaleETAs__block_invoke_118(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsManager.mm";
      v8 = 1026;
      v9 = 712;
      v10 = 2082;
      v11 = "-[MapsSuggestionsManager _wipeStaleETAs]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
  if (objc_msgSend(v2[7], "count"))
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v6) = 0;
        _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Restarting location updater", (uint8_t *)&v6, 2u);
      }

    }
    v4 = objc_loadWeakRetained(v2 + 18);
    objc_msgSend(v4, "restartLocationUpdatesForDelegate:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    MapsSuggestionsSetMostRecentLocation(v5);
LABEL_13:

  }
}

- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return -[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:](self, "topSuggestionsForSink:transportType:count:queue:handler:", a3, *(_QWORD *)&a5, a4, a7, a6);
}

- (char)topSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  NSObject *storageQueue;
  id v20;
  char v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void (**v31)(id, _QWORD, void *);
  id v32[2];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  _BYTE v36[14];
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a7;
  if (!v14)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v35 = 1024;
      *(_DWORD *)v36 = 737;
      *(_WORD *)&v36[4] = 2082;
      *(_QWORD *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      v37 = 2082;
      v38 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!v12)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v35 = 1024;
      *(_DWORD *)v36 = 738;
      *(_WORD *)&v36[4] = 2082;
      *(_QWORD *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      v37 = 2082;
      v38 = "nil == (sink)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!v13)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v35 = 1024;
      *(_DWORD *)v36 = 739;
      *(_WORD *)&v36[4] = 2082;
      *(_QWORD *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      v37 = 2082;
      v38 = "nil == (queue)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v35 = 1024;
      *(_DWORD *)v36 = 740;
      *(_WORD *)&v36[4] = 2082;
      *(_QWORD *)&v36[6] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]";
      v37 = 2082;
      v38 = "0u == count";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A count of zero doesn't make sense", buf, 0x26u);
    }
    goto LABEL_27;
  }
  self->_defaultTansportType = a4;
  GEOFindOrCreateLog();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsManager uniqueName](self, "uniqueName");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v16;
    v35 = 2080;
    *(_QWORD *)v36 = "topSuggestionsForSink";
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", ", buf, 2u);
  }

  if (!self->_strategy)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Cannot do anything without a Strategy."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v23);

    GEOFindOrCreateLog();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsManager uniqueName](self, "uniqueName");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v25;
      v35 = 2080;
      *(_QWORD *)v36 = "topSuggestionsForSink";
      _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", ", buf, 2u);
    }
LABEL_27:

    v21 = 0;
    goto LABEL_28;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke;
  v27[3] = &unk_1E4BCE6E0;
  objc_copyWeak(v32, (id *)buf);
  v28 = v18;
  v29 = v12;
  v32[1] = (id)a5;
  v30 = v13;
  v31 = v14;
  v20 = v18;
  dispatch_async(storageQueue, v27);

  objc_destroyWeak(v32);
  objc_destroyWeak((id *)buf);
  v21 = 1;
LABEL_28:

  return v21;
}

void __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void **WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  char *v26;
  int v27;
  __CFString *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  __int128 v33;
  void *v34;
  void *v35;
  id *from;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void **v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  _BYTE v61[28];
  uint8_t v62[4];
  char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v1 = a1;
  v70 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 64));
  v42 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (uint64_t)WeakRetained;
    from = v2;
    -[MapsSuggestionsManager _pruneExpiredFromEntries:]((dispatch_queue_t *)WeakRetained, WeakRetained[10]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v5;

    -[MapsSuggestionsManager _wipeStaleETAs](v4);
    v7 = *(void **)(v4 + 80);
    v35 = *(void **)(v1 + 32);
    objc_msgSend(*(id *)(v1 + 40), "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(v1 + 72);
    v37 = v7;
    v43 = v8;
    if (objc_msgSend(v43, "length"))
    {
      if (v41)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)v42[2]);
        if (objc_msgSend(v37, "count"))
        {
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v41);
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          obj = v37;
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v40)
          {
            v10 = 0;
            v39 = *(_QWORD *)v50;
            *(_QWORD *)&v9 = 138413058;
            v33 = v9;
LABEL_7:
            v11 = 0;
            while (1)
            {
              if (*(_QWORD *)v50 != v39)
                objc_enumerationMutation(obj);
              if (v10 >= v41)
                break;
              v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
              v13 = v43;
              v14 = v12;
              if (objc_msgSend(v13, "length"))
              {
                if (v14)
                {
                  dispatch_assert_queue_V2((dispatch_queue_t)v42[2]);
                  objc_msgSend(v42[4], "objectForKeyedSubscript:", v13);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v15)
                  {
                    v16 = v1;
                    v55 = 0u;
                    v56 = 0u;
                    v53 = 0u;
                    v54 = 0u;
                    v17 = v15;
                    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
                    if (v18)
                    {
                      v19 = *(_QWORD *)v54;
                      while (2)
                      {
                        for (i = 0; i != v18; ++i)
                        {
                          if (*(_QWORD *)v54 != v19)
                            objc_enumerationMutation(v17);
                          v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                          if ((objc_msgSend(v21, "shouldKeepEntry:", v14, v33) & 1) == 0)
                          {
                            GEOFindOrCreateLog();
                            v25 = (id)objc_claimAutoreleasedReturnValue();
                            v1 = v16;
                            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                            {
                              objc_msgSend(v21, "uniqueName");
                              v26 = (char *)objc_claimAutoreleasedReturnValue();
                              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
                              v27 = s_verbose;
                              if (s_verbose)
                              {
                                objc_msgSend(v14, "serializedBase64String");
                                v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v28 = &stru_1E4BDFC28;
                              }
                              *(_DWORD *)buf = v33;
                              v59 = v26;
                              v60 = 2048;
                              *(_QWORD *)v61 = v14;
                              *(_WORD *)&v61[8] = 2112;
                              *(_QWORD *)&v61[10] = v28;
                              *(_WORD *)&v61[18] = 2112;
                              *(_QWORD *)&v61[20] = v14;
                              _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} FILTERED by FILTER{%@} {%p:%@}:\n%@", buf, 0x2Au);
                              if (v27)

                              v1 = v16;
                            }

                            goto LABEL_41;
                          }
                        }
                        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
                        if (v18)
                          continue;
                        break;
                      }
                    }

                    v1 = v16;
                  }
                  else
                  {

                  }
                  objc_msgSend(v34, "addObject:", v14, v33);
                  ++v10;
                  goto LABEL_41;
                }
                GEOFindOrCreateLog();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
                  v60 = 1024;
                  *(_DWORD *)v61 = 892;
                  *(_WORD *)&v61[4] = 2082;
                  *(_QWORD *)&v61[6] = "-[MapsSuggestionsManager _sink:allowsEntry:]";
                  *(_WORD *)&v61[14] = 2082;
                  *(_QWORD *)&v61[16] = "nil == (entry)";
                  v23 = v22;
                  v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry";
                  goto LABEL_27;
                }
              }
              else
              {
                GEOFindOrCreateLog();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  v59 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
                  v60 = 1024;
                  *(_DWORD *)v61 = 891;
                  *(_WORD *)&v61[4] = 2082;
                  *(_QWORD *)&v61[6] = "-[MapsSuggestionsManager _sink:allowsEntry:]";
                  *(_WORD *)&v61[14] = 2082;
                  *(_QWORD *)&v61[16] = "0u == sinkName.length";
                  v23 = v22;
                  v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName";
LABEL_27:
                  _os_log_impl(&dword_1A427D000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x26u);
                }
              }

LABEL_41:
              if (++v11 == v40)
              {
                v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
                if (v40)
                  goto LABEL_7;
                break;
              }
            }
          }

          v29 = (id)objc_msgSend(v34, "copy");
        }
        else
        {
          v29 = v37;
        }
        goto LABEL_53;
      }
      GEOFindOrCreateLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136446978;
        v63 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        v64 = 1024;
        v65 = 920;
        v66 = 2082;
        v67 = "-[MapsSuggestionsManager _filteredEntries:forSink:limit:]";
        v68 = 2082;
        v69 = "0u == limit";
        _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires limit > 0", v62, 0x26u);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v62 = 136446978;
        v63 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        v64 = 1024;
        v65 = 919;
        v66 = 2082;
        v67 = "-[MapsSuggestionsManager _filteredEntries:forSink:limit:]";
        v68 = 2082;
        v69 = "0u == sinkName.length";
        _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", v62, 0x26u);
      }
    }

    v29 = 0;
LABEL_53:

    objc_msgSend(v35, "addObjectsFromArray:", v29);
    v32 = *(NSObject **)(v1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke_128;
    block[3] = &unk_1E4BCE6B8;
    objc_copyWeak(&v48, from);
    v45 = *(id *)(v1 + 32);
    v47 = *(id *)(v1 + 56);
    v46 = *(id *)(v1 + 40);
    dispatch_async(v32, block);

    objc_destroyWeak(&v48);
    goto LABEL_54;
  }
  GEOFindOrCreateLog();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v62 = 136446722;
    v63 = "MapsSuggestionsManager.mm";
    v64 = 1026;
    v65 = 761;
    v66 = 2082;
    v67 = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v62, 0x1Cu);
  }

LABEL_54:
}

void __82__MapsSuggestionsManager_topSuggestionsForSink_transportType_count_queue_handler___block_invoke_128(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  unint64_t i;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *context;
  id WeakRetained;
  NSObject *v18;
  uint8_t buf[4];
  _BYTE v20[24];
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_318);
    v5 = objc_msgSend(v4, "copy");

    v18 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v20 = v7;
      *(_WORD *)&v20[8] = 2080;
      *(_QWORD *)&v20[10] = "topSuggestionsForSink";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "topSuggestionsForSink", ", buf, 2u);
    }

    context = (void *)MEMORY[0x1A859CDD8]();
    for (i = 0; i < objc_msgSend(*(id *)(a1 + 32), "count", context); ++i)
    {
      GEOFindOrCreateLog();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        v13 = s_verbose;
        if (s_verbose)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "serializedBase64String");
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v14 = v2;
        }
        else
        {
          v14 = &stru_1E4BDFC28;
        }
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v20 = i;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = v11;
        *(_WORD *)&v20[14] = 2048;
        *(_QWORD *)&v20[16] = v12;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} SERVED as #%u to SINK{%@} {%p:%@}:\n%@", buf, 0x30u);

        v5 = v18;
        if (v13)
        {

        }
      }

    }
    objc_autoreleasePoolPop(context);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v20 = "MapsSuggestionsManager.mm";
      *(_WORD *)&v20[8] = 1026;
      *(_DWORD *)&v20[10] = 769;
      *(_WORD *)&v20[14] = 2082;
      *(_QWORD *)&v20[16] = "-[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (char)topSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  LOBYTE(a4) = -[MapsSuggestionsManager topSuggestionsForSink:transportType:count:queue:handler:](self, "topSuggestionsForSink:transportType:count:queue:handler:", v10, GEOTransportTypeFromUserPreference(), a4, v11, v12);

  return a4;
}

- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 transportType:(int)a5 callback:(id)a6 onQueue:(id)a7
{
  return -[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:](self, "oneShotTopSuggestionsForSink:transportType:count:queue:handler:", a3, *(_QWORD *)&a5, a4, a7, a6);
}

- (char)oneShotTopSuggestionsForSink:(id)a3 transportType:(int)a4 count:(unint64_t)a5 queue:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  id v18;
  char v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26[2];
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (!v14)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 816;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      v32 = 2082;
      v33 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!v12)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 817;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      v32 = 2082;
      v33 = "nil == (sink)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a sink", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!v13)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 818;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      v32 = 2082;
      v33 = "nil == (queue)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (!a5)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v30 = 1024;
      *(_DWORD *)v31 = 819;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]";
      v32 = 2082;
      v33 = "0u == count";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A count of zero doesn't make sense", buf, 0x26u);
    }
LABEL_21:

    v19 = 0;
    goto LABEL_22;
  }
  GEOFindOrCreateLog();
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsManager uniqueName](self, "uniqueName");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v16;
    v30 = 2080;
    *(_QWORD *)v31 = "oneShotTopSuggestionsForSink";
    _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", ", buf, 2u);
  }

  -[MapsSuggestionsManager attachSink:](self, "attachSink:", v12);
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke;
  v22[3] = &unk_1E4BCE730;
  objc_copyWeak(v26, (id *)buf);
  v18 = v12;
  v27 = a4;
  v23 = v18;
  v26[1] = (id)a5;
  v24 = v13;
  v25 = v14;
  -[MapsSuggestionsManager _updateAllSourcesOnceWithHandler:]((uint64_t)self, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);
  v19 = 1;
LABEL_22:

  return v19;
}

void __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(unsigned int *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke_130;
    v13[3] = &unk_1E4BCE708;
    v15 = *(id *)(a1 + 48);
    v13[4] = WeakRetained;
    v14 = *(id *)(a1 + 32);
    if (!objc_msgSend(WeakRetained, "topSuggestionsForSink:transportType:count:queue:handler:", v5, v3, v4, v6, v13))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("topSuggestionsForSink failed with ContractForbids"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, MEMORY[0x1E0C9AA60], v8);

      objc_msgSend(WeakRetained, "detachSink:", *(_QWORD *)(a1 + 32));
      GEOFindOrCreateLog();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "uniqueName");
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v10;
        v18 = 2080;
        *(_QWORD *)v19 = "oneShotTopSuggestionsForSink";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);

      }
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", ", buf, 2u);
      }

    }
    v12 = v15;
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsManager.mm";
      v18 = 1026;
      *(_DWORD *)v19 = 828;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __89__MapsSuggestionsManager_oneShotTopSuggestionsForSink_transportType_count_queue_handler___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "detachSink:", *(_QWORD *)(a1 + 40));
  GEOFindOrCreateLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2080;
    v13 = "oneShotTopSuggestionsForSink";
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "oneShotTopSuggestionsForSink", ", (uint8_t *)&v10, 2u);
  }

}

- (char)oneShotTopSuggestionsForSink:(id)a3 count:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id location;

  objc_initWeak(&location, a3);
  v10 = a5;
  v11 = a6;
  v12 = objc_loadWeakRetained(&location);
  LOBYTE(a4) = -[MapsSuggestionsManager oneShotTopSuggestionsForSink:transportType:count:queue:handler:](self, "oneShotTopSuggestionsForSink:transportType:count:queue:handler:", v12, GEOTransportTypeFromUserPreference(), a4, v10, v11);

  objc_destroyWeak(&location);
  return a4;
}

- (void)addAdditionalFilter:(id)a3 forSink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *storageQueue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      v17 = 860;
      v18 = 2082;
      v19 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]";
      v20 = 2082;
      v21 = "nil == (filter)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v7, "length"))
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      v17 = 861;
      v18 = 2082;
      v19 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]";
      v20 = 2082;
      v21 = "0u == sinkName.length";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MapsSuggestionsManager_addAdditionalFilter_forSink___block_invoke;
  block[3] = &unk_1E4BCE758;
  objc_copyWeak(&v14, (id *)location);
  v12 = v8;
  v13 = v6;
  dispatch_async(storageQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_10:

}

void __54__MapsSuggestionsManager_addAdditionalFilter_forSink___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      objc_msgSend(v3[4], "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsManager.mm";
      v8 = 1026;
      v9 = 866;
      v10 = 2082;
      v11 = "-[MapsSuggestionsManager addAdditionalFilter:forSink:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void)removeAdditionalFilter:(id)a3 forSink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *storageQueue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      v17 = 879;
      v18 = 2082;
      v19 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]";
      v20 = 2082;
      v21 = "nil == (filter)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires filter", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v7, "length"))
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      v17 = 880;
      v18 = 2082;
      v19 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]";
      v20 = 2082;
      v21 = "0u == sinkName.length";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires sinkName", location, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MapsSuggestionsManager_removeAdditionalFilter_forSink___block_invoke;
  block[3] = &unk_1E4BCE758;
  objc_copyWeak(&v14, (id *)location);
  v12 = v8;
  v13 = v6;
  dispatch_async(storageQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_10:

}

void __57__MapsSuggestionsManager_removeAdditionalFilter_forSink___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsManager.mm";
      v8 = 1026;
      v9 = 884;
      v10 = 2082;
      v11 = "-[MapsSuggestionsManager removeAdditionalFilter:forSink:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (char)saveStorageToFile:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *storageQueue;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "saveStorageToFile:%@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "length"))
  {
    objc_initWeak((id *)buf, self);
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MapsSuggestionsManager_saveStorageToFile_callback___block_invoke;
    block[3] = &unk_1E4BCE780;
    objc_copyWeak(&v14, (id *)buf);
    v12 = v6;
    v13 = v7;
    dispatch_async(storageQueue, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

  return v7 != 0;
}

void __53__MapsSuggestionsManager_saveStorageToFile_callback___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _BOOL8 v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = +[MapsSuggestionsCache saveToFilePath:storage:ETAValidUntilDate:](MapsSuggestionsCache, "saveToFilePath:storage:ETAValidUntilDate:", *(_QWORD *)(a1 + 32), WeakRetained[9], WeakRetained[6]);
    if (!v3)
    {
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(char **)(a1 + 32);
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Failed to write to %@.", (uint8_t *)&v8, 0xCu);
      }

    }
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v3);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsManager.mm";
      v10 = 1026;
      v11 = 957;
      v12 = 2082;
      v13 = "-[MapsSuggestionsManager saveStorageToFile:callback:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

  }
}

- (BOOL)loadStorageFromFile:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *storageQueue;
  BOOL v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  _BYTE *v12;
  _BYTE buf[28];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "loadStorageFromFile:%@ sync", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 1;
    storageQueue = self->_storageQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MapsSuggestionsManager_loadStorageFromFile___block_invoke;
    block[3] = &unk_1E4BCE7A8;
    v12 = buf;
    block[4] = self;
    v11 = v4;
    dispatch_sync(storageQueue, block);
    v7 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 973;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsManager loadStorageFromFile:]";
      v14 = 2082;
      v15 = "0u == path.length";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a file path", buf, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

uint64_t __46__MapsSuggestionsManager_loadStorageFromFile___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[MapsSuggestionsManager _loadStorageFromFile:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_loadStorageFromFile:(uint64_t)a1
{
  char *v3;
  char *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "length"))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

      if ((v6 & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 72), "count"))
        {
          GEOFindOrCreateLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Already loaded from Storage. Aborting this load", buf, 2u);
          }

          goto LABEL_15;
        }
        v12 = (void *)MEMORY[0x1A859CDD8](objc_msgSend(*(id *)(a1 + 24), "clearData"));
        v21 = 0;
        v22 = 0;
        v13 = +[MapsSuggestionsCache loadFromFilePath:storage:ETAValidUntilDate:](MapsSuggestionsCache, "loadFromFilePath:storage:ETAValidUntilDate:", v4, &v22, &v21);
        v14 = v22;
        v15 = v21;
        v16 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v14;
        v17 = v14;

        v18 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v15;

        objc_autoreleasePoolPop(v12);
        if (v13)
        {
LABEL_15:
          -[MapsSuggestionsManager _updateResult](a1);
          a1 = 1;
          goto LABEL_16;
        }
        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = *(NSObject **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v20;
        goto LABEL_13;
      }
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        v9 = "File does not exist: %@";
        v10 = v8;
        v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        v25 = 1024;
        v26 = 1009;
        v27 = 2082;
        v28 = "-[MapsSuggestionsManager _loadStorageFromFile:]";
        v29 = 2082;
        v30 = "0u == path.length";
        v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a file path";
        v10 = v8;
        v11 = 38;
LABEL_12:
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
    }
LABEL_13:

    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (char)loadStorageFromFile:(id)a3 callback:(id)a4 callbackQueue:(id)a5
{
  char *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *storageQueue;
  char v13;
  NSObject *v14;
  _QWORD v16[4];
  char *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v23 = 1024;
      v24 = 990;
      v25 = 2082;
      v26 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]";
      v27 = 2082;
      v28 = "nil == (callback)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback block", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v10)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v23 = 1024;
      v24 = 991;
      v25 = 2082;
      v26 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]";
      v27 = 2082;
      v28 = "NULL == callbackQueue";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback queue", buf, 0x26u);
    }
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "loadStorageFromFile:%@ async", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke;
  v16[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v8;
  v18 = v10;
  v19 = v9;
  dispatch_async(storageQueue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
  v13 = 1;
LABEL_12:

  return v13;
}

void __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  char v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = -[MapsSuggestionsManager _loadStorageFromFile:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke_143;
    v7[3] = &unk_1E4BCE7D0;
    v5 = *(NSObject **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = v4;
    dispatch_async(v5, v7);
    v6 = v8;
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsManager.mm";
      v12 = 1026;
      v13 = 997;
      v14 = 2082;
      v15 = "-[MapsSuggestionsManager loadStorageFromFile:callback:callbackQueue:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

uint64_t __69__MapsSuggestionsManager_loadStorageFromFile_callback_callbackQueue___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_addOrUpdateSuggestionEntries:(void *)a3 source:
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  NSObject *v24;
  const char *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  id obj;
  uint64_t v33;
  NSObject *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[28];
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v35 = a3;
  if (!objc_msgSend(v35, "length"))
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 1056;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "0u == sourceName.length";
    v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name.";
LABEL_69:
    _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x26u);
    goto LABEL_70;
  }
  if (!v4)
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 1057;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "nil == (entries)";
    v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a list of entries.";
    goto LABEL_69;
  }
  if (!objc_msgSend(v4, "count"))
  {
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    *(_DWORD *)buf = 136446978;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v42 = 1024;
    *(_DWORD *)v43 = 1058;
    *(_WORD *)&v43[4] = 2082;
    *(_QWORD *)&v43[6] = "-[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]";
    *(_WORD *)&v43[14] = 2082;
    *(_QWORD *)&v43[16] = "0 == entries.count";
    v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires at least one entry";
    goto LABEL_69;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v41 = (const char *)v35;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Adding/Updating for %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v35);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:");
  }
  v34 = v6;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v7)
  {
    v8 = 0;
    v33 = *(_QWORD *)v37;
    v30 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        GEOFindOrCreateLog();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v12 = s_verbose;
          if (s_verbose)
          {
            objc_msgSend(v10, "serializedBase64String");
            v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v13 = v6;
          }
          else
          {
            v13 = &stru_1E4BDFC28;
          }
          *(_DWORD *)buf = 138413058;
          v41 = (const char *)v35;
          v42 = 2048;
          *(_QWORD *)v43 = v10;
          *(_WORD *)&v43[8] = 2112;
          *(_QWORD *)&v43[10] = v13;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v10;
          _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} NEW INJECT from SOURCE{%@} {%p:%@}:\n%@", buf, 0x2Au);
          if (v12)

        }
        objc_msgSend(v10, "setOriginatingSourceName:", v35);
        if (objc_msgSend(v10, "deleted"))
        {
          -[NSObject addObject:](v34, "addObject:", v10);
          GEOFindOrCreateLog();
          ++v8;
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            goto LABEL_60;
          objc_msgSend((id)a1, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v16 = s_verbose;
          if (s_verbose)
          {
            objc_msgSend(v10, "serializedBase64String");
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v17 = v29;
          }
          else
          {
            v17 = &stru_1E4BDFC28;
          }
          *(_DWORD *)buf = 136316162;
          v41 = "ADDDEL";
          v42 = 2112;
          *(_QWORD *)v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v17;
          v44 = 2112;
          v45 = v10;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v16)

        }
        else if (-[NSObject containsObject:](v34, "containsObject:", v10))
        {
          GEOFindOrCreateLog();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            goto LABEL_60;
          objc_msgSend((id)a1, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v18 = s_verbose;
          if (s_verbose)
          {
            objc_msgSend(v10, "serializedBase64String");
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v19 = v28;
          }
          else
          {
            v19 = &stru_1E4BDFC28;
          }
          *(_DWORD *)buf = 136316162;
          v41 = "SKIPPED";
          v42 = 2112;
          *(_QWORD *)v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v19;
          v44 = 2112;
          v45 = v10;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v18)

        }
        else if ((objc_msgSend(*(id *)(a1 + 24), "preFiltersKept:", v10) & 1) != 0)
        {
          -[NSObject addObject:](v34, "addObject:", v10);
          GEOFindOrCreateLog();
          ++v8;
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            goto LABEL_60;
          objc_msgSend((id)a1, "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v20 = s_verbose;
          if (s_verbose)
          {
            objc_msgSend(v10, "serializedBase64String");
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v21 = v26;
          }
          else
          {
            v21 = &stru_1E4BDFC28;
          }
          *(_DWORD *)buf = 136316162;
          v41 = "ADDED";
          v42 = 2112;
          *(_QWORD *)v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v21;
          v44 = 2112;
          v45 = v10;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v20)

        }
        else
        {
          GEOFindOrCreateLog();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            goto LABEL_60;
          objc_msgSend(*(id *)(a1 + 24), "uniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          v22 = s_verbose;
          if (s_verbose)
          {
            objc_msgSend(v10, "serializedBase64String");
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v23 = v27;
          }
          else
          {
            v23 = &stru_1E4BDFC28;
          }
          *(_DWORD *)buf = 136316162;
          v41 = "UNKEPT";
          v42 = 2112;
          *(_QWORD *)v43 = v15;
          *(_WORD *)&v43[8] = 2048;
          *(_QWORD *)&v43[10] = v10;
          *(_WORD *)&v43[18] = 2112;
          *(_QWORD *)&v43[20] = v23;
          v44 = 2112;
          v45 = v10;
          _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} %s by OBJECT{%@} {%p:%@}:\n%@", buf, 0x34u);
          if (v22)

        }
        v4 = v30;
LABEL_60:

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v7);
  }

  v24 = v34;
  -[MapsSuggestionsManager _updateResult](a1);
LABEL_70:

}

- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *storageQueue;
  id v17;
  id v18;
  unint64_t v19;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const char *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v7;
    v31 = 1024;
    LODWORD(v32) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "addOrUpdate from SOURCE{%@} with %u entries", buf, 0x12u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12++), "setDeleted:", 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v10);
  }

  GEOFindOrCreateLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsManager uniqueName](self, "uniqueName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v14;
    v31 = 2080;
    v32 = "addOrUpdateSuggestionEntries";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "addOrUpdateSuggestionEntries", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsManager_addOrUpdateSuggestionEntries_source___block_invoke;
  block[3] = &unk_1E4BCE758;
  objc_copyWeak(&v24, (id *)buf);
  v17 = v7;
  v22 = v17;
  v18 = v9;
  v23 = v18;
  dispatch_async(storageQueue, block);
  v19 = objc_msgSend(v18, "count");

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __62__MapsSuggestionsManager_addOrUpdateSuggestionEntries_source___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  dispatch_queue_t *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  _BYTE v37[14];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v19 = (dispatch_queue_t *)WeakRetained;
  if (WeakRetained)
  {
    v23 = a1;
    objc_msgSend(*((id *)WeakRetained + 9), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = v18;
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v3)
      {
        v22 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(obj);
            v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v6 = *(id *)(v23 + 40);
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v7)
            {
              v8 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v7; ++j)
                {
                  if (*(_QWORD *)v25 != v8)
                    objc_enumerationMutation(v6);
                  v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                  v11 = objc_msgSend(v5, "type");
                  if (v11 == objc_msgSend(v10, "type"))
                  {
                    objc_msgSend(v5, "uniqueIdentifier");
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "uniqueIdentifier");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    v14 = objc_msgSend(v12, "isEqualToString:", v13);

                    if ((v14 & 1) != 0)
                    {

                      goto LABEL_19;
                    }
                  }
                }
                v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v7)
                  continue;
                break;
              }
            }

            objc_msgSend(v20, "addObject:", v5);
LABEL_19:
            ;
          }
          v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v3);
      }

      if (objc_msgSend(v20, "count"))
        -[MapsSuggestionsManager _sq_deleteEntries:source:](v19, v20, *(void **)(v23 + 32));

    }
    if (objc_msgSend(*(id *)(v23 + 40), "count"))
      -[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]((uint64_t)v19, *(void **)(v23 + 40), *(void **)(v23 + 32));
    GEOFindOrCreateLog();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[dispatch_queue_t uniqueName](v19, "uniqueName");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v16;
      v36 = 2080;
      *(_QWORD *)v37 = "addOrUpdateSuggestionEntries";
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "addOrUpdateSuggestionEntries", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "MapsSuggestionsManager.mm";
      v36 = 1026;
      *(_DWORD *)v37 = 1120;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = "-[MapsSuggestionsManager addOrUpdateSuggestionEntries:source:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v18 = v17;
  }

}

- (void)_sq_deleteEntries:(void *)a3 source:
{
  __CFString *v3;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  char *v13;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  char *v21;
  id v22;
  id v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  _BYTE v33[28];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v22 = a3;
  if (!objc_msgSend(v22, "length"))
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446978;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v32 = 1024;
    *(_DWORD *)v33 = 1220;
    *(_WORD *)&v33[4] = 2082;
    *(_QWORD *)&v33[6] = "-[MapsSuggestionsManager _sq_deleteEntries:source:]";
    *(_WORD *)&v33[14] = 2082;
    *(_QWORD *)&v33[16] = "0u == sourceName.length";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name";
LABEL_32:
    _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x26u);
    goto LABEL_38;
  }
  if (!v23)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_DWORD *)buf = 136446978;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
    v32 = 1024;
    *(_DWORD *)v33 = 1221;
    *(_WORD *)&v33[4] = 2082;
    *(_QWORD *)&v33[6] = "-[MapsSuggestionsManager _sq_deleteEntries:source:]";
    *(_WORD *)&v33[14] = 2082;
    *(_QWORD *)&v33[16] = "nil == (entries)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a list of entries";
    goto LABEL_32;
  }
  dispatch_assert_queue_V2(a1[2]);
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[dispatch_queue_t uniqueName](a1, "uniqueName");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 2080;
    *(_QWORD *)v33 = "deleteEntries";
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "deleteEntries", ", buf, 2u);
  }

  if (objc_msgSend(v23, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v23;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
          GEOFindOrCreateLog();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            -[dispatch_queue_t uniqueName](a1, "uniqueName");
            v13 = (char *)objc_claimAutoreleasedReturnValue();
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            v14 = s_verbose;
            if (s_verbose)
            {
              objc_msgSend(v11, "serializedBase64String");
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v15 = v3;
            }
            else
            {
              v15 = &stru_1E4BDFC28;
            }
            *(_DWORD *)buf = 138413058;
            v31 = v13;
            v32 = 2048;
            *(_QWORD *)v33 = v11;
            *(_WORD *)&v33[8] = 2112;
            *(_QWORD *)&v33[10] = v15;
            *(_WORD *)&v33[18] = 2112;
            *(_QWORD *)&v33[20] = v11;
            _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} DELETED by OBJECT{%@} {%p:%@}:\n%@", buf, 0x2Au);
            if (v14)

          }
          objc_msgSend(v11, "setDeleted:", 1);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v8);
    }

    -[MapsSuggestionsManager _addOrUpdateSuggestionEntries:source:]((uint64_t)a1, obj, v22);
    GEOFindOrCreateLog();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[dispatch_queue_t uniqueName](a1, "uniqueName");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2080;
      *(_QWORD *)v33 = "deleteEntries";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
LABEL_37:
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "deleteEntries", ", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[dispatch_queue_t uniqueName](a1, "uniqueName");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v21;
      v32 = 2080;
      *(_QWORD *)v33 = "deleteEntries";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      goto LABEL_37;
    }
  }
LABEL_38:

}

- (void)removeEntry:(id)a3
{
  char *v4;
  NSObject *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v22 = 1024;
      v23 = 1161;
      v24 = 2082;
      v25 = "-[MapsSuggestionsManager removeEntry:]";
      v26 = 2082;
      v27 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      v13 = v11;
      v14 = 38;
LABEL_21:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_22:

    goto LABEL_23;
  }
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "REMOVE %@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_storageQueue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_storage;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
  {

    goto LABEL_19;
  }
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      if ((v8 & 1) != 0)
        v8 = 1;
      else
        v8 = -[MapsSuggestionsManager _removeEntry:sourceName:]((uint64_t)self, v4, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
    }
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
LABEL_19:
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      v12 = "Could not find entry %@";
      v13 = v11;
      v14 = 12;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_23:

}

- (uint64_t)_removeEntry:(void *)a3 sourceName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
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
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_13;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v14 = 1024;
      v15 = 1178;
      v16 = 2082;
      v17 = "-[MapsSuggestionsManager _removeEntry:sourceName:]";
      v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "length"))
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v14 = 1024;
      v15 = 1179;
      v16 = 2082;
      v17 = "-[MapsSuggestionsManager _removeEntry:sourceName:]";
      v18 = 2082;
      v19 = "0u == sourceName.length";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name", (uint8_t *)&v12, 0x26u);
    }
LABEL_12:

    a1 = 0;
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v5);
  a1 = v9 != 0x7FFFFFFFFFFFFFFFLL;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "removeObjectAtIndex:", v9);

LABEL_13:
  return a1;
}

- (void)removeEntry:(void *)a3 sourceName:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  _BYTE location[12];
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (objc_msgSend(v6, "length"))
      {
        objc_initWeak((id *)location, a1);
        v8 = a1[2];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__MapsSuggestionsManager_removeEntry_sourceName___block_invoke;
        block[3] = &unk_1E4BCE758;
        objc_copyWeak(&v13, (id *)location);
        v11 = v5;
        v12 = v7;
        dispatch_async(v8, block);

        objc_destroyWeak(&v13);
        objc_destroyWeak((id *)location);
        goto LABEL_11;
      }
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        v15 = 1024;
        v16 = 1198;
        v17 = 2082;
        v18 = "-[MapsSuggestionsManager removeEntry:sourceName:]";
        v19 = 2082;
        v20 = "0u == sourceName.length";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source name", location, 0x26u);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446978;
        *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
        v15 = 1024;
        v16 = 1197;
        v17 = 2082;
        v18 = "-[MapsSuggestionsManager removeEntry:sourceName:]";
        v19 = 2082;
        v20 = "nil == (entry)";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", location, 0x26u);
      }
    }

  }
LABEL_11:

}

void __49__MapsSuggestionsManager_removeEntry_sourceName___block_invoke(void **a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _removeEntry:sourceName:]((uint64_t)WeakRetained, a1[4], a1[5]);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1202;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager removeEntry:sourceName:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __48__MapsSuggestionsManager__deleteEntries_source___block_invoke(void **a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _sq_deleteEntries:source:](WeakRetained, a1[4], a1[5]);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1212;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager _deleteEntries:source:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)trackerRefreshedETAsUntil:(id)a3
{
  NSDate *v4;
  NSDate *etaValidUntil;
  id v6;

  v6 = a3;
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  etaValidUntil = self->_etaValidUntil;
  self->_etaValidUntil = v4;

  -[MapsSuggestionsCanKicker kickCanByTime:](self->_wipeStaleETAWiper, "kickCanByTime:", MapsSuggestionsSecondsTo(v6));
}

- (void)setTitleFormatter:(void *)a3 forType:
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v6 = a1[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__MapsSuggestionsManager_setTitleFormatter_forType___block_invoke;
    v7[3] = &unk_1E4BCDDD0;
    objc_copyWeak(v9, &location);
    v8 = v5;
    v9[1] = a3;
    dispatch_async(v6, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

void __52__MapsSuggestionsManager_setTitleFormatter_forType___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[5], "setTitleFormatter:forType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1260;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager setTitleFormatter:forType:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *gatheringQueue;
  char v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 1272;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. entry cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 1273;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  v11 = objc_msgSend(v8, "availableRemovalBehaviors");
  GEOFindOrCreateLog();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsRemovalBehavior(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v23 = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
    v24 = 2112;
    *(_QWORD *)v25 = v8;
    *(_WORD *)&v25[8] = 2112;
    *(_QWORD *)&v25[10] = v13;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "%s User removed Entry %@ (using %@)", buf, 0x20u);

  }
  if ((v11 & a4) == 0)
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 1277;
      *(_WORD *)&v25[4] = 2082;
      *(_QWORD *)&v25[6] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]";
      *(_WORD *)&v25[14] = 2082;
      *(_QWORD *)&v25[16] = "0 == (supportedRemovalBehavior & behavior)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requested Suppression behavior is not supported by the entry", buf, 0x26u);
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  objc_initWeak((id *)buf, self);
  gatheringQueue = self->_gatheringQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke;
  v18[3] = &unk_1E4BCE820;
  objc_copyWeak(v21, (id *)buf);
  v19 = v8;
  v21[1] = (id)a4;
  v20 = v10;
  dispatch_async(gatheringQueue, v18);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
  v15 = 1;
LABEL_16:

  return v15;
}

void __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 8);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke_155;
    v9[3] = &unk_1E4BCE780;
    objc_copyWeak(&v12, v2);
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    if (!objc_msgSend(v5, "removeEntry:behavior:handler:", v6, v7, v9))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "MapsSuggestionsManager.mm";
      v15 = 1026;
      v16 = 1284;
      v17 = 2082;
      v18 = "-[MapsSuggestionsManager removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __55__MapsSuggestionsManager_removeEntry_behavior_handler___block_invoke_155(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *__p[2];
  char v12;
  uint64_t v13;
  _BYTE block[32];
  id v15;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "originatingSourceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    objc_initWeak(__p, WeakRetained);
    v7 = WeakRetained[2];
    *(_QWORD *)block = MEMORY[0x1E0C809B0];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __48__MapsSuggestionsManager__deleteEntries_source___block_invoke;
    *(_QWORD *)&block[24] = &unk_1E4BCE758;
    objc_copyWeak(v17, __p);
    v8 = v5;
    v15 = v8;
    v9 = v6;
    v16 = v9;
    dispatch_async(v7, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(__p);

    objc_msgSend(WeakRetained, "hintRefreshOfType:", objc_msgSend(*(id *)(a1 + 32), "type"));
    std::string::basic_string[abi:ne180100]<0>(__p, "com.apple.maps.userdeleted");
    MSg::NotificationSender::NotificationSender((std::string *)block, (__int128 *)__p);
    MSg::NotificationSender::notify((MSg::NotificationSender *)block, 0);
    if ((block[23] & 0x80000000) != 0)
      operator delete(*(void **)block);
    if (v12 < 0)
      operator delete(__p[0]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 136446722;
      *(_QWORD *)&block[4] = "MapsSuggestionsManager.mm";
      *(_WORD *)&block[12] = 1026;
      *(_DWORD *)&block[14] = 1287;
      *(_WORD *)&block[18] = 2082;
      *(_QWORD *)&block[20] = "-[MapsSuggestionsManager removeEntry:behavior:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: removedStrongSelf went away in %{public}s", block, 0x1Cu);
    }

  }
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *gatheringQueue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntryEngagement(a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v15 = "-[MapsSuggestionsManager feedbackForEntry:action:]";
      v16 = 2112;
      *(_QWORD *)v17 = v8;
      *(_WORD *)&v17[8] = 2112;
      *(_QWORD *)&v17[10] = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s UserAction %@ on entry %@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MapsSuggestionsManager_feedbackForEntry_action___block_invoke;
    block[3] = &unk_1E4BCDDD0;
    objc_copyWeak(v13, (id *)buf);
    v12 = v6;
    v13[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      *(_DWORD *)v17 = 1308;
      *(_WORD *)&v17[4] = 2082;
      *(_QWORD *)&v17[6] = "-[MapsSuggestionsManager feedbackForEntry:action:]";
      *(_WORD *)&v17[14] = 2082;
      *(_QWORD *)&v17[16] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. entry cannot be nil", buf, 0x26u);
    }

  }
}

void __50__MapsSuggestionsManager_feedbackForEntry_action___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[8], "feedbackForEntry:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1312;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager feedbackForEntry:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *gatheringQueue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[MapsSuggestionsManager feedbackForMapItem:action:]";
      v16 = 2112;
      *(_QWORD *)v17 = v8;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s:%@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsManager_feedbackForMapItem_action___block_invoke;
    block[3] = &unk_1E4BCDDD0;
    objc_copyWeak(v13, (id *)buf);
    v12 = v6;
    v13[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v16 = 1024;
      *(_DWORD *)v17 = 1322;
      *(_WORD *)&v17[4] = 2082;
      *(_QWORD *)&v17[6] = "-[MapsSuggestionsManager feedbackForMapItem:action:]";
      v18 = 2082;
      v19 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem", buf, 0x26u);
    }

  }
}

void __52__MapsSuggestionsManager_feedbackForMapItem_action___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[8], "feedbackForMapItem:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1326;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager feedbackForMapItem:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *gatheringQueue;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[MapsSuggestionsManager feedbackForContact:action:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    gatheringQueue = self->_gatheringQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsManager_feedbackForContact_action___block_invoke;
    block[3] = &unk_1E4BCDDD0;
    objc_copyWeak(v12, (id *)buf);
    v11 = v6;
    v12[1] = (id)a4;
    dispatch_async(gatheringQueue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsManager.mm";
      v15 = 1024;
      v16 = 1335;
      v17 = 2082;
      v18 = "-[MapsSuggestionsManager feedbackForContact:action:]";
      v19 = 2082;
      v20 = "nil == (contact)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires contact", buf, 0x26u);
    }

  }
}

void __52__MapsSuggestionsManager_feedbackForContact_action___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained[8], "feedbackForContact:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1339;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager feedbackForContact:action:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4;
  NSObject *gatheringQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  gatheringQueue = self->_gatheringQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MapsSuggestionsManager_didUpdateLocation___block_invoke;
  block[3] = &unk_1E4BCE618;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(gatheringQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__MapsSuggestionsManager_didUpdateLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsManager _updateCurrentLocation:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsManager.mm";
      v7 = 1026;
      v8 = 1352;
      v9 = 2082;
      v10 = "-[MapsSuggestionsManager didUpdateLocation:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)didLoseLocationPermission
{
  NSObject *gatheringQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  gatheringQueue = self->_gatheringQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MapsSuggestionsManager_didLoseLocationPermission__block_invoke;
  v4[3] = &unk_1E4BCDDF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(gatheringQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__MapsSuggestionsManager_didLoseLocationPermission__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "clearLocationAndETAs");
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsManager.mm";
      v6 = 1026;
      v7 = 1361;
      v8 = 2082;
      v9 = "-[MapsSuggestionsManager didLoseLocationPermission]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (id)storage
{
  NSObject *storageQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  storageQueue = self->_storageQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MapsSuggestionsManager_storage__block_invoke;
  v5[3] = &unk_1E4BCE848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storageQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__MapsSuggestionsManager_storage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)storageForSource:(id)a3
{
  id v4;
  NSObject *storageQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  storageQueue = self->_storageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MapsSuggestionsManager_storageForSource___block_invoke;
  block[3] = &unk_1E4BCE7A8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(storageQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__MapsSuggestionsManager_storageForSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "uniqueName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)sources
{
  return -[MapsSuggestionsCompositeSource sources](self->_compositeSource, "sources");
}

- (id)sinks
{
  void *v3;
  MapsSuggestionsObservers *sinks;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MapsSuggestionsObservers count](self->_sinks, "count"));
  sinks = self->_sinks;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__MapsSuggestionsManager_sinks__block_invoke;
  v8[3] = &unk_1E4BCE870;
  v5 = v3;
  v9 = v5;
  -[MapsSuggestionsObservers synchronouslyCallBlock:](sinks, "synchronouslyCallBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __31__MapsSuggestionsManager_sinks__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)awaitGatheringQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_gatheringQueue, &__block_literal_global_4);
  -[MapsSuggestionsCompositeSource test_awaitQueue](self->_compositeSource, "test_awaitQueue");
}

void __45__MapsSuggestionsManager_awaitGatheringQueue__block_invoke()
{
  NSLog(CFSTR("_gatheringQueue ran"));
}

- (void)awaitStorageQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_storageQueue, &__block_literal_global_161);
}

void __43__MapsSuggestionsManager_awaitStorageQueue__block_invoke()
{
  NSLog(CFSTR("_storageQueue ran"));
}

- (id)storageQueue
{
  return self->_storageQueue;
}

- (id)tracker
{
  return self->_tracker;
}

- (id)additionalFiltersPerSink
{
  return self->_additionalFiltersPerSink;
}

- (MapsSuggestionsStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_strategy, a3);
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (MapsSuggestionsLocationUpdater)locationUpdater
{
  return (MapsSuggestionsLocationUpdater *)objc_loadWeakRetained((id *)&self->_locationUpdater);
}

- (void)setLocationUpdater:(id)a3
{
  objc_storeWeak((id *)&self->_locationUpdater, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationUpdater);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_oldLocation, 0);
  objc_storeStrong((id *)&self->_deferredSourcesUpdater, 0);
  objc_storeStrong((id *)&self->_wipeStaleETAWiper, 0);
  objc_storeStrong((id *)&self->_expiredEntryInvalidator, 0);
  objc_storeStrong((id *)&self->_latestResults, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_compositeSource, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_etaValidUntil, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_additionalFiltersPerSink, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_gatheringQueue, 0);
}

@end
