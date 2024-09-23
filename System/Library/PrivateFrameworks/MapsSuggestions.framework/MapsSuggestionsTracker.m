@implementation MapsSuggestionsTracker

- (MapsSuggestionsTracker)initWithManager:(id)a3 requirements:(id)a4 network:(id)a5 flightUpdater:(id)a6 virtualGarage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MapsSuggestionsTracker *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  MapsSuggestionsETARequirements *requirements;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *etaTitleFormatters;
  NSMutableDictionary *v30;
  NSMutableDictionary *distanceTitleFormatters;
  NSMutableDictionary *v32;
  NSMutableDictionary *etaChargeTitleFormatters;
  uint64_t v34;
  NSMutableDictionary *previousETAs;
  MapsSuggestionsDonater *v36;
  MapsSuggestionsDonater *donater;
  uint64_t v38;
  uint64_t v39;
  id transportTypeChangedListener;
  uint64_t v41;
  MapsSuggestionsPredictor *predictor;
  MapsSuggestionsETARequester *v43;
  MapsSuggestionsETARequester *etaRequester;
  MapsSuggestionsGCDTimer *v45;
  OS_dispatch_queue *v46;
  uint64_t v47;
  MapsSuggestionsTimer *refreshTimer;
  MapsSuggestionsCanKicker *v49;
  OS_dispatch_queue *v50;
  uint64_t v51;
  MapsSuggestionsCanKicker *currentLocationWiper;
  __CFNotificationCenter *LocalCenter;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60[5];
  id v61;
  id location;
  objc_super v63;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v63.receiver = self;
  v63.super_class = (Class)MapsSuggestionsTracker;
  v17 = -[MapsSuggestionsTracker init](&v63, sel_init);
  if (v17)
  {
    v55 = v15;
    v56 = v14;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("MapsSuggestionsTrackerQueue", v18);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v19;

    objc_storeWeak((id *)&v17->_manager, v12);
    v21 = objc_msgSend(v13, "copy");
    requirements = v17->_requirements;
    v17->_requirements = (MapsSuggestionsETARequirements *)v21;

    GEOConfigGetDouble();
    v17->_refreshInterval = v23;
    GEOConfigGetDouble();
    v17->_refreshLeeway = v24;
    GEOConfigGetDouble();
    v26 = v25;
    GEOConfigGetDouble();
    v17->_refreshDeferTime = v27;
    v17->_transportType = GEOTransportTypeFromUserPreference();
    v17->_mapType = 0;
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    etaTitleFormatters = v17->_etaTitleFormatters;
    v17->_etaTitleFormatters = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    distanceTitleFormatters = v17->_distanceTitleFormatters;
    v17->_distanceTitleFormatters = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    etaChargeTitleFormatters = v17->_etaChargeTitleFormatters;
    v17->_etaChargeTitleFormatters = v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    previousETAs = v17->_previousETAs;
    v17->_previousETAs = (NSMutableDictionary *)v34;

    v36 = objc_alloc_init(MapsSuggestionsDonater);
    donater = v17->_donater;
    v17->_donater = v36;

    objc_initWeak(&location, v17);
    v38 = MEMORY[0x1E0C809B0];
    v60[1] = (id)MEMORY[0x1E0C809B0];
    v60[2] = (id)3221225472;
    v60[3] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke;
    v60[4] = &unk_1E4BCDEB8;
    objc_copyWeak(&v61, &location);
    _GEOConfigAddBlockListenerForKey();
    v39 = objc_claimAutoreleasedReturnValue();
    transportTypeChangedListener = v17->_transportTypeChangedListener;
    v17->_transportTypeChangedListener = (id)v39;

    objc_storeStrong((id *)&v17->_networkRequester, a5);
    +[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor");
    v41 = objc_claimAutoreleasedReturnValue();
    predictor = v17->_predictor;
    v17->_predictor = (MapsSuggestionsPredictor *)v41;

    v43 = -[MapsSuggestionsETARequester initWithNetworkRequester:transportModePredictor:requirements:]([MapsSuggestionsETARequester alloc], "initWithNetworkRequester:transportModePredictor:requirements:", v17->_networkRequester, v17->_predictor, v13);
    etaRequester = v17->_etaRequester;
    v17->_etaRequester = v43;

    objc_storeStrong((id *)&v17->_virtualGarage, a7);
    objc_storeStrong((id *)&v17->_flightUpdater, a6);
    v45 = [MapsSuggestionsGCDTimer alloc];
    v46 = v17->_queue;
    v59[0] = v38;
    v59[1] = 3221225472;
    v59[2] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_141;
    v59[3] = &unk_1E4BCDFF8;
    objc_copyWeak(v60, &location);
    v47 = -[MapsSuggestionsGCDTimer initWithName:queue:block:](v45, "initWithName:queue:block:", CFSTR("MapsSuggestionsTrackerRefreshTimer"), v46, v59);
    refreshTimer = v17->_refreshTimer;
    v17->_refreshTimer = (MapsSuggestionsTimer *)v47;

    v49 = [MapsSuggestionsCanKicker alloc];
    v50 = v17->_queue;
    v57[0] = v38;
    v57[1] = 3221225472;
    v57[2] = __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_146;
    v57[3] = &unk_1E4BCDFF8;
    objc_copyWeak(&v58, &location);
    v51 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v49, "initWithName:time:queue:block:", CFSTR("MapsSuggestionsTrackerLocationWiper"), v50, v57, v26);
    currentLocationWiper = v17->_currentLocationWiper;
    v17->_currentLocationWiper = (MapsSuggestionsCanKicker *)v51;

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v17, (CFNotificationCallback)onLocaleCurrentLocaleDidChangeNotification, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_destroyWeak(&v58);
    objc_destroyWeak(v60);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
    v15 = v55;
    v14 = v56;
  }

  return v17;
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke(uint64_t a1)
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
    -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      v6 = 1026;
      v7 = 141;
      v8 = 2082;
      v9 = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (uint64_t)_q_scheduleRefresh
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 8));
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_refresh schedule", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 24), "scheduleWithTimeInterval:repeatAfter:leeway:", *(double *)(v1 + 48), *(double *)(v1 + 32), *(double *)(v1 + 40));
  }
  return result;
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_141(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id location;
  _BYTE buf[32];
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "uniqueName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_refresh", ", buf, 2u);
    }

    objc_initWeak(&location, v2);
    v6 = v2[1];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __36__MapsSuggestionsTracker__q_refresh__block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E4BCDFF8;
    objc_copyWeak(v10, &location);
    dispatch_async(v6, buf);
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 157;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __91__MapsSuggestionsTracker_initWithManager_requirements_network_flightUpdater_virtualGarage___block_invoke_146(uint64_t a1)
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
    objc_msgSend(WeakRetained, "resetAllTitleFormatting");
    objc_msgSend(v2, "setCurrentLocation:", 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      v6 = 1026;
      v7 = 165;
      v8 = 2082;
      v9 = "-[MapsSuggestionsTracker initWithManager:requirements:network:flightUpdater:virtualGarage:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  OS_dispatch_queue *queue;
  objc_super v5;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  -[MapsSuggestionsVirtualGarage closeConnection](self->_virtualGarage, "closeConnection");
  -[MapsSuggestionsTracker _unschedule](self);
  -[MapsSuggestionsTracker setTrackedEntries:](self, "setTrackedEntries:", 0);
  -[MapsSuggestionsCanKicker cancel](self->_currentLocationWiper, "cancel");
  queue = self->_queue;
  self->_queue = 0;

  GEOConfigRemoveBlockListener();
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsTracker;
  -[MapsSuggestionsTracker dealloc](&v5, sel_dealloc);
}

- (_QWORD)_unschedule
{
  _QWORD *v1;
  NSObject *v2;
  __int16 v3[8];

  if (result)
  {
    v1 = result;
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3[0] = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_unschedule", (uint8_t *)v3, 2u);
    }

    result = (_QWORD *)v1[3];
    if (result)
      return (_QWORD *)objc_msgSend(result, "unschedule");
  }
  return result;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)setTitleFormatter:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  MapsSuggestionsTracker *v12;
  int64_t v13;
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
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MapsSuggestionsTracker_setTitleFormatter_forType___block_invoke;
    block[3] = &unk_1E4BCF7C0;
    v11 = v6;
    v12 = self;
    v13 = a4;
    dispatch_sync(queue, block);

  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
      v16 = 1024;
      v17 = 202;
      v18 = 2082;
      v19 = "-[MapsSuggestionsTracker setTitleFormatter:forType:]";
      v20 = 2082;
      v21 = "nil == (titleFormatter)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title formatter", buf, 0x26u);
    }

  }
}

void __52__MapsSuggestionsTracker_setTitleFormatter_forType___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (objc_msgSend((id)a1[4], "conformsToProtocol:", &unk_1EE71BFF8))
  {
    v2 = a1[4];
    v3 = *(void **)(a1[5] + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  }
  if (objc_msgSend((id)a1[4], "conformsToProtocol:", &unk_1EE71D9F0))
  {
    v5 = a1[4];
    v6 = *(void **)(a1[5] + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  if (objc_msgSend((id)a1[4], "conformsToProtocol:", &unk_1EE724D30))
  {
    v8 = a1[4];
    v9 = *(void **)(a1[5] + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
}

- (id)_q_etaTitleFormatterForType:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

uint64_t __46__MapsSuggestionsTracker__q_prunePreviousETAs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isValidForLocation:requirements:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_q_rememberETA:(void *)a3 forEntry:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v6)
    {
      objc_msgSend(v6, "setETA:forKey:", v5, CFSTR("MapsSuggestionsETAKey"));
      MapsSuggestionsDestinationKey(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 128);
      if (v5)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v7);
      else
        objc_msgSend(v8, "removeObjectForKey:", v7);

    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446978;
        v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        v12 = 1024;
        v13 = 257;
        v14 = 2082;
        v15 = "-[MapsSuggestionsTracker _q_rememberETA:forEntry:]";
        v16 = 2082;
        v17 = "nil == (entry)";
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v10, 0x26u);
      }

    }
  }

}

- (uint64_t)_q_isUnusableETA:(uint64_t)a1
{
  id v3;
  int v4;
  int v5;
  uint64_t v7;

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v4 = objc_msgSend(v3, "transportType");
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v5 = *(_DWORD *)(a1 + 56);
  if (v5 == 4 || v5 == v4)
    v7 = objc_msgSend(v3, "isValidForLocation:requirements:", *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 16)) ^ 1;
  else
    v7 = 0;

  return v7;
}

- (void)trackSuggestionEntries:(id)a3 transportType:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsTracker_trackSuggestionEntries_transportType___block_invoke;
  block[3] = &unk_1E4BCF810;
  block[4] = self;
  v8 = v6;
  v14 = a4;
  v12 = v8;
  v13 = &v15;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v16 + 24))
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "New entries contained one or more previously-untracked entries. Forcing immediate update.", v10, 2u);
    }

    -[MapsSuggestionsTracker scheduleRefresh](self, "scheduleRefresh");
  }

  _Block_object_dispose(&v15, 8);
}

void __63__MapsSuggestionsTracker_trackSuggestionEntries_transportType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  MapsSuggestionsMutableWeakEntries *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  id obj;
  id obja;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  _BYTE buf[120];
  uint64_t v78;

  v1 = a1;
  v78 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v59 = v3;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, buf, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v72 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v8, "geoMapItem");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend((id)v2, "currentLocation");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "coordinate");
            +[MapsSuggestionsSignalPack extractFromDestinationEntry:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationEntry:originCoordinate:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = *(void **)(v2 + 200);
            v13 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v8, "geoMapItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "storeSignalPack:forMapItem:andEntry:", v13, v14, v8);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, buf, 16);
      }
      while (v5);
    }

    v3 = v59;
  }

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v58 = *(id *)(v1 + 40);
  obja = (id)objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (obja)
  {
    v15 = *(_QWORD *)v68;
    v16 = 0x1E0CB3000uLL;
    v57 = *(_QWORD *)v68;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(v58);
        v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v17);
        v19 = v1;
        v20 = *(_QWORD *)(v1 + 32);
        v21 = objc_msgSend(v18, "type", v57);
        if (v20)
        {
          v22 = v21;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v20 + 8));
          v23 = *(void **)(v20 + 72);
          v24 = v16;
          objc_msgSend(*(id *)(v16 + 2024), "numberWithInteger:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            goto LABEL_21;
          v27 = *(void **)(v20 + 80);
          objc_msgSend(*(id *)(v24 + 2024), "numberWithInteger:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {

            v26 = 0;
            v15 = v57;
LABEL_21:

            v16 = v24;
LABEL_22:
            objc_msgSend(v60, "addObject:", v18);
            goto LABEL_23;
          }
          v30 = *(void **)(v20 + 88);
          objc_msgSend(*(id *)(v24 + 2024), "numberWithInteger:", v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v24;
          v15 = v57;
          if (v32)
            goto LABEL_22;
        }
LABEL_23:
        v17 = (char *)v17 + 1;
        v1 = v19;
      }
      while (obja != v17);
      v33 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      obja = (id)v33;
    }
    while (v33);
  }

  v34 = *(_DWORD *)(v1 + 56);
  v35 = *(_QWORD *)(v1 + 32);
  if (v34 != *(_DWORD *)(v35 + 56))
  {
    *(_DWORD *)(v35 + 56) = v34;
    v35 = *(_QWORD *)(v1 + 32);
    v34 = *(_DWORD *)(v35 + 56);
  }
  if (v34 != 4)
    goto LABEL_34;
  GEOFindOrCreateLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v36, OS_LOG_TYPE_DEBUG, "Resetting tracker transportType with the user preference.", buf, 2u);
  }

  *(_DWORD *)(*(_QWORD *)(v1 + 32) + 56) = GEOTransportTypeFromUserPreference();
  v35 = *(_QWORD *)(v1 + 32);
  if (v35)
  {
LABEL_34:
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v35 + 8));
    v37 = *(void **)(v35 + 128);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __46__MapsSuggestionsTracker__q_prunePreviousETAs__block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E4BCF7E8;
    *(_QWORD *)&buf[32] = v35;
    objc_msgSend(v37, "MSg_mutableCopyIf:", buf);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(v35 + 128);
    *(_QWORD *)(v35 + 128) = v38;

  }
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v40 = v60;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v64 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        -[MapsSuggestionsTracker _q_etaTitleFormatterForType:](*(_QWORD *)(v1 + 32), objc_msgSend(v45, "type"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          MapsSuggestionsDestinationKey(v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = *(NSObject **)(v1 + 32);
          v49 = v45;
          v50 = v47;
          if (!v48)
            goto LABEL_61;
          dispatch_assert_queue_V2((dispatch_queue_t)v48[1].isa);
          if (v49)
          {
            if (v50)
            {
              -[objc_class objectForKeyedSubscript:](v48[16].isa, "objectForKeyedSubscript:", v50);
              v51 = objc_claimAutoreleasedReturnValue();
              if (-[MapsSuggestionsTracker _q_isUnusableETA:]((uint64_t)v48, v51))
              {

                v51 = 0;
              }
              if (objc_msgSend(v49, "containsKey:", CFSTR("MapsSuggestionsETAKey")))
              {
                objc_msgSend(v49, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
                v52 = objc_claimAutoreleasedReturnValue();
                if (-[MapsSuggestionsTracker _q_isUnusableETA:]((uint64_t)v48, v52))
                {

                  goto LABEL_49;
                }
              }
              else
              {
LABEL_49:
                v52 = 0;
              }
              if (-[NSObject isBetterThanETA:requirements:](v51, "isBetterThanETA:requirements:", v52, v48[2].isa))v53 = v51;
              else
                v53 = v52;
              v48 = v53;

LABEL_60:
LABEL_61:

              -[MapsSuggestionsTracker _q_rememberETA:forEntry:](*(_QWORD *)(v1 + 32), v48, v49);
              if (v48)
              {
                if ((MapsSuggestionsIsInCoarseLocation() & 1) == 0)
                  -[MapsSuggestionsTracker _q_decorateETA:forEntry:](*(_QWORD *)(v1 + 32), v48, v49);
              }
              else
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
              }

              continue;
            }
            GEOFindOrCreateLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 301;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsTracker _q_bestValidOfflineETAForEntry:destinationKey:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "nil == (destinationKey)";
              v54 = v51;
              v55 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationKey";
LABEL_58:
              _os_log_impl(&dword_1A427D000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x26u);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 300;
              *(_WORD *)&buf[18] = 2082;
              *(_QWORD *)&buf[20] = "-[MapsSuggestionsTracker _q_bestValidOfflineETAForEntry:destinationKey:]";
              *(_WORD *)&buf[28] = 2082;
              *(_QWORD *)&buf[30] = "nil == (entry)";
              v54 = v51;
              v55 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
              goto LABEL_58;
            }
          }
          v48 = 0;
          goto LABEL_60;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v42);
  }

  v56 = -[MapsSuggestionsMutableWeakEntries initWithEntries:]([MapsSuggestionsMutableWeakEntries alloc], "initWithEntries:", v40);
  objc_msgSend(*(id *)(v1 + 32), "setTrackedEntries:", v56);

}

- (void)_q_decorateETA:(void *)a3 forEntry:
{
  id v5;
  id v6;
  void *v7;
  double v8;
  NSObject *v9;
  id WeakRetained;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  char *v18;
  int v19;
  __CFString *v20;
  const char *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[28];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      if (v5)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        GEOConfigGetDouble();
        MapsSuggestionsNowWithOffset(v8);
        v9 = objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "trackerRefreshedETAsUntil:", v9);

        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromMapsSuggestionsEntryType(objc_msgSend(v7, "type"));
          v12 = (char *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "_decorateETA:forEntry:%@", (uint8_t *)&v27, 0xCu);

        }
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)a1, "uniqueName");
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          v27 = 138412546;
          v28 = v14;
          v29 = 2080;
          *(_QWORD *)v30 = "_decorateETA";
          _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v27, 0x16u);

        }
        GEOFindOrCreateLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v15))
        {
          LOWORD(v27) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateETA", ", (uint8_t *)&v27, 2u);
        }

        -[MapsSuggestionsTracker _q_etaTitleFormatterForType:](a1, objc_msgSend(v7, "type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v7, "setBoolean:forKey:", 1, CFSTR("MapsSuggestionsNeedsETATrackingKey"));
          objc_msgSend(v7, "setNumber:forKey:", 0, CFSTR("MapsSuggestionsRoutingNotAvailableKey"));
          if (objc_msgSend(v16, "formatTitlesForEntry:eta:", v7, v5))
          {
            GEOFindOrCreateLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)a1, "uniqueName");
              v18 = (char *)objc_claimAutoreleasedReturnValue();
              if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
                dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
              v19 = s_verbose;
              if (s_verbose)
              {
                objc_msgSend(v7, "serializedBase64String");
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = &stru_1E4BDFC28;
              }
              v27 = 138413058;
              v28 = v18;
              v29 = 2048;
              *(_QWORD *)v30 = v7;
              *(_WORD *)&v30[8] = 2112;
              *(_QWORD *)&v30[10] = v20;
              *(_WORD *)&v30[18] = 2112;
              *(_QWORD *)&v30[20] = v7;
              _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} ETA UPDATE by TRACKER{%@} {%p:%@}:\n%@", (uint8_t *)&v27, 0x2Au);
              if (v19)

            }
          }
          GEOFindOrCreateLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)a1, "uniqueName");
            v26 = (char *)objc_claimAutoreleasedReturnValue();
            v27 = 138412546;
            v28 = v26;
            v29 = 2080;
            *(_QWORD *)v30 = "_decorateETA";
            _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);

          }
          GEOFindOrCreateLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v24))
            goto LABEL_36;
          LOWORD(v27) = 0;
        }
        else
        {
          GEOFindOrCreateLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)a1, "uniqueName");
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            v27 = 138412546;
            v28 = v23;
            v29 = 2080;
            *(_QWORD *)v30 = "_decorateETA";
            _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);

          }
          GEOFindOrCreateLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v24))
            goto LABEL_36;
          LOWORD(v27) = 0;
        }
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateETA", ", (uint8_t *)&v27, 2u);
LABEL_36:

        goto LABEL_37;
      }
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v27 = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        v29 = 1024;
        *(_DWORD *)v30 = 412;
        *(_WORD *)&v30[4] = 2082;
        *(_QWORD *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateETA:forEntry:]";
        *(_WORD *)&v30[14] = 2082;
        *(_QWORD *)&v30[16] = "nil == (eta)";
        v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
        goto LABEL_21;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v27 = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        v29 = 1024;
        *(_DWORD *)v30 = 411;
        *(_WORD *)&v30[4] = 2082;
        *(_QWORD *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateETA:forEntry:]";
        *(_WORD *)&v30[14] = 2082;
        *(_QWORD *)&v30[16] = "nil == (entry)";
        v21 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_21:
        _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 0x26u);
      }
    }
LABEL_37:

  }
}

- (void)_q_decorateEntry:(void *)a3 eta:(void *)a4 requiredChargeLevel:(void *)a5 currentChargeLevel:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v9)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v14;
      v29 = 2080;
      *(_QWORD *)v30 = "_decorateEntryEV";
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v27, 0x16u);

    }
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateEntryEV", ", (uint8_t *)&v27, 2u);
    }

    v16 = objc_msgSend(v9, "type");
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v17 = *(void **)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (-[NSObject formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:](v19, "formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:", v9, v10, v11, v12))
      {
        GEOFindOrCreateLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "title");
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v21;
          _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_INFO, "Update EV Resume Route entry title to %@", (uint8_t *)&v27, 0xCu);

        }
      }
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v23;
        v29 = 2080;
        *(_QWORD *)v30 = "_decorateEntryEV";
        _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);

      }
      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v24))
        goto LABEL_22;
      LOWORD(v27) = 0;
    }
    else
    {
      GEOFindOrCreateLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)a1, "uniqueName");
        v26 = (char *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v26;
        v29 = 2080;
        *(_QWORD *)v30 = "_decorateEntryEV";
        _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v27, 0x16u);

      }
      GEOFindOrCreateLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v24))
        goto LABEL_22;
      LOWORD(v27) = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateEntryEV", ", (uint8_t *)&v27, 2u);
LABEL_22:

    goto LABEL_23;
  }
  GEOFindOrCreateLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v27 = 136446978;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
    v29 = 1024;
    *(_DWORD *)v30 = 494;
    *(_WORD *)&v30[4] = 2082;
    *(_QWORD *)&v30[6] = "-[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    v31 = 2082;
    v32 = "nil == (entry)";
    _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v27, 0x26u);
  }
LABEL_23:

}

uint64_t __40__MapsSuggestionsTracker__q_requestETAs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsNeedsETATrackingKey"), 1);
}

void __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_223(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error while getting ETAs: %@", buf, 0xCu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      v6 = *((_QWORD *)WeakRetained + 1);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_224;
      v8[3] = &unk_1E4BCDB40;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      v9 = *(id *)(a1 + 32);
      dispatch_async(v6, v8);

      objc_destroyWeak(&v10);
    }
    else
    {
      GEOFindOrCreateLog();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v12 = "MapsSuggestionsTracker.m";
        v13 = 1026;
        v14 = 606;
        v15 = 2082;
        v16 = "-[MapsSuggestionsTracker _q_requestETAs]_block_invoke";
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }

      v4 = 0;
    }
  }

}

void __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_224(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  uint8_t v21[128];
  _BYTE buf[32];
  id v23;
  NSObject *v24;
  id v25;
  id v26[5];

  v26[2] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v7, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsNotADestinationKey"), 1, (_QWORD)v16) & 1) == 0
            && objc_msgSend(v7, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsETATrackingKey"))
            && objc_msgSend(v7, "containsKey:", CFSTR("MapsSuggestionsETAKey")))
          {
            objc_msgSend(v7, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)WeakRetained + 14), "donateETA:entry:", v8, v7);
            -[MapsSuggestionsTracker _q_rememberETA:forEntry:]((uint64_t)WeakRetained, v8, v7);
            if (objc_msgSend(v7, "containsKey:", CFSTR("MapsSuggestionsIsResumingAnEVRoute")))
            {
              v10 = v7;
              v9 = v8;
              dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
              objc_msgSend(v10, "numberForKey:", CFSTR("MapsSuggestionsRequiredChargeForEVKey"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "stringForKey:", CFSTR("MapsSuggestionsVehicleIdentifierKey"));
              v12 = objc_claimAutoreleasedReturnValue();
              v13 = (void *)v12;
              if (v11 && v12)
              {
                objc_msgSend(*((id *)WeakRetained + 18), "openConnection");
                objc_initWeak(&location, WeakRetained);
                v14 = (void *)*((_QWORD *)WeakRetained + 18);
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke;
                *(_QWORD *)&buf[24] = &unk_1E4BCF8A8;
                objc_copyWeak(v26, &location);
                v23 = v10;
                v24 = v9;
                v25 = v11;
                objc_msgSend(v14, "stateOfChargeForVehicleWithIdentifier:handler:", v13, buf);

                objc_destroyWeak(v26);
                objc_destroyWeak(&location);
              }
              else
              {
                GEOFindOrCreateLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_INFO, "This is a regular ResumeRoute entry.", buf, 2u);
                }

                -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, v10, v9, 0, 0);
              }

              goto LABEL_25;
            }
            -[MapsSuggestionsTracker _q_decorateETA:forEntry:]((uint64_t)WeakRetained, v8, v7);

          }
        }
        v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v4)
          continue;
        break;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 608;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsTracker _q_requestETAs]_block_invoke";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    v3 = v9;
LABEL_25:

  }
}

void __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke_226;
    v11[3] = &unk_1E4BCF880;
    objc_copyWeak(&v17, a1 + 7);
    v12 = v6;
    v13 = a1[4];
    v14 = a1[5];
    v15 = a1[6];
    v16 = v5;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v17);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "MapsSuggestionsTracker.m";
      v20 = 1026;
      v21 = 667;
      v22 = 2082;
      v23 = "-[MapsSuggestionsTracker _q_requestChargeInfoAndDecorateEntry:eta:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __67__MapsSuggestionsTracker__q_requestChargeInfoAndDecorateEntry_eta___block_invoke_226(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  char *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446722;
      v10 = "MapsSuggestionsTracker.m";
      v11 = 1026;
      v12 = 670;
      v13 = 2082;
      v14 = "-[MapsSuggestionsTracker _q_requestChargeInfoAndDecorateEntry:eta:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "displayedBatteryPercentage") / 100.0);
    v5 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, v6, v7, v8, v5);
LABEL_10:

    goto LABEL_11;
  }
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(char **)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "VirtualGarage returned an error while trying to fetch the charge status for the car: %@. Falling back to normal ResumeRoute", (uint8_t *)&v9, 0xCu);
  }

  -[MapsSuggestionsTracker _q_decorateEntry:eta:requiredChargeLevel:currentChargeLevel:]((uint64_t)WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, 0);
LABEL_11:

}

void __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  _BYTE v19[14];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 40);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*(id *)(a1 + 32) == v5)
    {
      if (!v6)
      {
        v12 = WeakRetained[1];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke_229;
        v13[3] = &unk_1E4BCDB40;
        objc_copyWeak(&v15, v7);
        v14 = v5;
        dispatch_async(v12, v13);

        objc_destroyWeak(&v15);
        goto LABEL_9;
      }
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "uniqueIdentifier");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        v18 = 2112;
        *(_QWORD *)v19 = v6;
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Error when updating Flight for Entry %@: %@", buf, 0x16u);

      }
    }
    else
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
        v18 = 1024;
        *(_DWORD *)v19 = 721;
        *(_WORD *)&v19[4] = 2082;
        *(_QWORD *)&v19[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
        v20 = 2082;
        v21 = "returnedEntry != entry";
        _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The returned Entry must always equal the one we asked for", buf, 0x26u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "MapsSuggestionsTracker.m";
      v18 = 1026;
      *(_DWORD *)v19 = 720;
      *(_WORD *)&v19[4] = 2082;
      *(_QWORD *)&v19[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
LABEL_9:

}

void __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke_229(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  int v14;
  __CFString *v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  NSObject *v19;
  char *v20;
  int v21;
  char *v22;
  __int16 v23;
  _BYTE v24[28];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    if (v3)
    {
      dispatch_assert_queue_V2(WeakRetained[1]);
      if (-[NSObject containsKey:](v3, "containsKey:", CFSTR("MapsSuggestionsETAKey")))
      {
        -[NSObject ETAForKey:](v3, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject stringForKey:](v3, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
        v6 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "_decorateFlightInfoForEntry:%@", (uint8_t *)&v21, 0xCu);

      }
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v8;
        v23 = 2080;
        *(_QWORD *)v24 = "_decorateFlightInfoForEntry";
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v21, 0x16u);

      }
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A427D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_decorateFlightInfoForEntry", ", (uint8_t *)&v21, 2u);
      }

      -[MapsSuggestionsTracker _q_etaTitleFormatterForType:]((uint64_t)WeakRetained, -[NSObject type](v3, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "formatTitlesForEntry:eta:", v3, v4))
        {
          GEOFindOrCreateLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
            v13 = (char *)objc_claimAutoreleasedReturnValue();
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            v14 = s_verbose;
            if (s_verbose)
            {
              -[NSObject serializedBase64String](v3, "serializedBase64String");
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = &stru_1E4BDFC28;
            }
            v21 = 138413058;
            v22 = v13;
            v23 = 2048;
            *(_QWORD *)v24 = v3;
            *(_WORD *)&v24[8] = 2112;
            *(_QWORD *)&v24[10] = v15;
            *(_WORD *)&v24[18] = 2112;
            *(_QWORD *)&v24[20] = v3;
            _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} FLIGHT UPDATE by TRACKER{%@} {%p:%@}:\n%@", (uint8_t *)&v21, 0x2Au);
            if (v14)

          }
        }
        GEOFindOrCreateLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
          v20 = (char *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = v20;
          v23 = 2080;
          *(_QWORD *)v24 = "_decorateFlightInfoForEntry";
          _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);

        }
        GEOFindOrCreateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v18))
          goto LABEL_38;
        LOWORD(v21) = 0;
      }
      else
      {
        GEOFindOrCreateLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[dispatch_queue_t uniqueName](WeakRetained, "uniqueName");
          v17 = (char *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = v17;
          v23 = 2080;
          *(_QWORD *)v24 = "_decorateFlightInfoForEntry";
          _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v21, 0x16u);

        }
        GEOFindOrCreateLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v18))
          goto LABEL_38;
        LOWORD(v21) = 0;
      }
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_decorateFlightInfoForEntry", ", (uint8_t *)&v21, 2u);
LABEL_38:

      goto LABEL_39;
    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTracker.m";
      v23 = 1024;
      *(_DWORD *)v24 = 457;
      *(_WORD *)&v24[4] = 2082;
      *(_QWORD *)&v24[6] = "-[MapsSuggestionsTracker _q_decorateFlightInfoForEntry:]";
      *(_WORD *)&v24[14] = 2082;
      *(_QWORD *)&v24[16] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v21, 0x26u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446722;
      v22 = "MapsSuggestionsTracker.m";
      v23 = 1026;
      *(_DWORD *)v24 = 728;
      *(_WORD *)&v24[4] = 2082;
      *(_QWORD *)&v24[6] = "-[MapsSuggestionsTracker _q_requestFlightInfo]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v21, 0x1Cu);
    }
    v3 = v4;
  }
LABEL_39:

}

- (void)setLocation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MapsSuggestionsTracker *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MapsSuggestionsTracker_setLocation___block_invoke;
  block[3] = &unk_1E4BCED40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __38__MapsSuggestionsTracker_setLocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int IsUsableLocation;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(void **)(a1 + 32);
      v22 = 138412290;
      v23 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "LOCATION received: %@", (uint8_t *)&v22, 0xCu);
    }

  }
  if ((MapsSuggestionsTrackerIsUsableLocation(*(void **)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "kickCanBySameTime");
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = *(void **)(a1 + 32);
        v22 = 138412290;
        v23 = v6;
        _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "LOCATION accepted: %@", (uint8_t *)&v22, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "setCurrentLocation:", *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v4;
    if (v7)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 8));
      if (*(_BYTE *)(v7 + 96))
      {
        objc_msgSend((id)v7, "currentLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(v9);

        if (IsUsableLocation)
        {
          objc_msgSend((id)v7, "currentLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "distanceFromLocation:", v8);
          v13 = v12;
          GEOConfigGetDouble();
          v15 = v14;

          if (v13 >= v15 || (MapsSuggestionsTrackerIsUsableLocation(v8) & 1) == 0)
          {
            GEOFindOrCreateLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v22) = 0;
              _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "LOCATION caused a Tracker REFRESH", (uint8_t *)&v22, 2u);
            }

            -[MapsSuggestionsTracker _q_scheduleRefresh](v7);
          }
        }
      }
    }

  }
  else
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "currentLocation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_DEBUG, "LOCATION dropped for current one: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "currentLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MapsSuggestionsTrackerIsUsableLocation(v19);

    if ((v20 & 1) == 0)
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1A427D000, v21, OS_LOG_TYPE_DEBUG, "LOCATION reset to nil", (uint8_t *)&v22, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "setCurrentLocation:", 0);
    }
  }
}

- (void)setMapType:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MapsSuggestionsTracker_setMapType___block_invoke;
  v4[3] = &unk_1E4BCDCF8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __37__MapsSuggestionsTracker_setMapType___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 160) != v2)
  {
    v3 = result;
    *(_DWORD *)(v1 + 160) = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 104), "setMapType:", *(unsigned int *)(result + 40));
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "MAP TYPE caused a Tracker REFRESH", v5, 2u);
    }

    return -[MapsSuggestionsTracker _q_scheduleRefresh](*(_QWORD *)(v3 + 32));
  }
  return result;
}

- (void)setAutomobileOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MapsSuggestionsTracker_setAutomobileOptions___block_invoke;
  block[3] = &unk_1E4BCED40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __47__MapsSuggestionsTracker_setAutomobileOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (result != v2)
  {
    result = objc_msgSend((id)result, "isEqual:");
    if ((result & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setAutomobileOptions:", *(_QWORD *)(a1 + 40));
      GEOFindOrCreateLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "AUTOMOBILE OPTIONS caused a Tracker REFRESH with values: %@", (uint8_t *)&v6, 0xCu);
      }

      return -[MapsSuggestionsTracker _q_scheduleRefresh](*(_QWORD *)(a1 + 32));
    }
  }
  return result;
}

void __36__MapsSuggestionsTracker__q_refresh__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  char IsUsableLocation;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  const char *v60;
  NSObject *v61;
  os_log_type_t v62;
  NSObject *v63;
  void *v64;
  __int128 v65;
  id val;
  _QWORD v67[5];
  id v68;
  id location[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id from;
  uint8_t v74[4];
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE buf[32];
  NSObject *v79;
  id v80[15];
  CLLocationCoordinate2D v81;
  CLLocationCoordinate2D v82;

  v80[12] = *(id *)MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  val = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "MapsSuggestionsTracker.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 865;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsTracker _q_refresh]_block_invoke";
      _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_86;
  }
  objc_msgSend(WeakRetained, "currentLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    GEOFindOrCreateLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v28, OS_LOG_TYPE_DEBUG, "_refresh had no location", buf, 2u);
    }

    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(val, "uniqueName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v27))
      goto LABEL_86;
    *(_WORD *)buf = 0;
LABEL_85:
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_refresh", ", buf, 2u);
    goto LABEL_86;
  }
  objc_msgSend(val, "trackedEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "_refresh had nothing to track", buf, 2u);
    }

    GEOFindOrCreateLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(val, "uniqueName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "_refresh";
      _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v27))
      goto LABEL_86;
    *(_WORD *)buf = 0;
    goto LABEL_85;
  }
  if ((MapsSuggestionsIsInCoarseLocation() & 1) != 0)
    goto LABEL_57;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  objc_msgSend(val, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "No current location, can't calculate distance.", buf, 2u);
    }
    goto LABEL_44;
  }
  objc_msgSend(val, "currentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v7 = CLLocationCoordinate2DIsValid(v81);

  if (v7 && objc_msgSend(*((id *)val + 10), "count"))
  {
    objc_msgSend(val, "currentLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    objc_msgSend(val, "currentLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");

    objc_msgSend(val, "trackedEntries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strongArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = 0u;
    v72 = 0u;
    *(_OWORD *)location = 0u;
    v70 = 0u;
    v12 = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", location, buf, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v70 != v14)
            objc_enumerationMutation(v12);
          v16 = (void *)*((_QWORD *)location[1] + i);
          if (v16)
          {
            v17 = objc_msgSend(*((id *)location[1] + i), "type");
            dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
            v18 = (void *)*((_QWORD *)val + 10);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              if (objc_msgSend(v16, "BOOLeanForKey:", CFSTR("MapsSuggestionsNeedsDistanceTrackingKey")))
              {
                if (objc_msgSend(v16, "containsKey:", CFSTR("MapsSuggestionsLatitudeKey")))
                {
                  if (objc_msgSend(v16, "containsKey:", CFSTR("MapsSuggestionsLongitudeKey")))
                  {
                    objc_msgSend(v16, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "doubleValue");
                    v23 = v22;
                    objc_msgSend(v16, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "doubleValue");
                    v26 = v25;

                    if (v26 >= -180.0 && v26 <= 180.0 && v23 >= -90.0 && v23 <= 90.0)
                    {
                      GEOCalculateDistance();
                      objc_msgSend(v20, "formatTitlesForEntry:distance:trafficString:", v16, 0);
                    }
                  }
                }
              }
            }

          }
        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", location, buf, 16);
      }
      while (v13);
    }

LABEL_44:
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  objc_msgSend(val, "currentLocation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    GEOFindOrCreateLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v39, OS_LOG_TYPE_DEBUG, "No current location, can't make an ETA request.", buf, 2u);
    }
    goto LABEL_56;
  }
  objc_msgSend(val, "currentLocation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "coordinate");
  v36 = CLLocationCoordinate2DIsValid(v82);

  if (v36 && objc_msgSend(*((id *)val + 9), "count"))
  {
    objc_msgSend(val, "trackedEntries");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "strongArray");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "MSg_copyIf:", &__block_literal_global_14);
    v39 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v39, "count"))
    {
      objc_msgSend(val, "currentLocation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      IsUsableLocation = MapsSuggestionsTrackerIsUsableLocation(v40);

      if ((IsUsableLocation & 1) != 0)
      {
        objc_initWeak(location, val);
        v42 = (void *)*((_QWORD *)val + 13);
        objc_msgSend(val, "currentLocation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __40__MapsSuggestionsTracker__q_requestETAs__block_invoke_223;
        *(_QWORD *)&buf[24] = &unk_1E4BCF858;
        objc_copyWeak(v80, location);
        v39 = v39;
        v79 = v39;
        objc_msgSend(v42, "ETAsFromLocation:toEntries:completion:", v43, v39, buf);

        objc_destroyWeak(v80);
        objc_destroyWeak(location);
      }
      else
      {
        GEOFindOrCreateLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(val, "currentLocation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_1A427D000, v44, OS_LOG_TYPE_DEBUG, "Can't use location for ETA Requests: %@", buf, 0xCu);

        }
      }
    }
LABEL_56:

  }
LABEL_57:
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      goto LABEL_81;
    *(_WORD *)buf = 0;
    v60 = "Live flight updates have been disabled";
    v61 = v48;
    v62 = OS_LOG_TYPE_INFO;
LABEL_80:
    _os_log_impl(&dword_1A427D000, v61, v62, v60, buf, 2u);
    goto LABEL_81;
  }
  dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
  if (!objc_msgSend(*((id *)val + 9), "count"))
  {
    GEOFindOrCreateLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_WORD *)buf = 0;
    v60 = "Cannot show flight status updates without ETA Title Formatters";
    v61 = v48;
    v62 = OS_LOG_TYPE_ERROR;
    goto LABEL_80;
  }
  objc_msgSend(val, "trackedEntries");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "strongArray");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "copy");

  if (-[NSObject count](v48, "count"))
  {
    objc_initWeak(&from, val);
    v71 = 0u;
    v72 = 0u;
    *(_OWORD *)location = 0u;
    v70 = 0u;
    v48 = v48;
    v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", location, buf, 16);
    if (v49)
    {
      v51 = *(_QWORD *)v70;
      *(_QWORD *)&v50 = 138412290;
      v65 = v50;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v70 != v51)
            objc_enumerationMutation(v48);
          v53 = (void *)*((_QWORD *)location[1] + j);
          if ((objc_msgSend(v53, "hasEssentialFlightInfo", v65) & 1) != 0)
          {
            GEOFindOrCreateLog();
            v54 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v53, "uniqueIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "stringForKey:", CFSTR("MapsSuggestionsFullFlightNumberKey"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v74 = 138412546;
              v75 = v55;
              v76 = 2112;
              v77 = v56;
              _os_log_impl(&dword_1A427D000, v54, OS_LOG_TYPE_DEBUG, "Updating flight info on Entry %@ (Flight %@)", v74, 0x16u);

            }
            v57 = (void *)*((_QWORD *)val + 19);
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __46__MapsSuggestionsTracker__q_requestFlightInfo__block_invoke;
            v67[3] = &unk_1E4BCF8D0;
            objc_copyWeak(&v68, &from);
            v67[4] = v53;
            if ((objc_msgSend(v57, "updateFlightsForEntry:handler:", v53, v67) & 1) == 0)
            {
              GEOFindOrCreateLog();
              v58 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v53, "uniqueIdentifier");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v74 = v65;
                v75 = v59;
                _os_log_impl(&dword_1A427D000, v58, OS_LOG_TYPE_ERROR, "Cannot update Flight for Entry %@", v74, 0xCu);

              }
            }
            objc_destroyWeak(&v68);
          }
        }
        v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", location, buf, 16);
      }
      while (v49);
    }

    objc_destroyWeak(&from);
  }
LABEL_81:

  GEOFindOrCreateLog();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(val, "uniqueName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "_refresh";
    _os_log_impl(&dword_1A427D000, v63, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    goto LABEL_85;
  }
LABEL_86:

}

- (void)scheduleRefresh
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
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "scheduleRefresh", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MapsSuggestionsTracker_scheduleRefresh__block_invoke;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __41__MapsSuggestionsTracker_scheduleRefresh__block_invoke(uint64_t a1)
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
    *((_BYTE *)WeakRetained + 96) = 1;
    -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      v6 = 1026;
      v7 = 913;
      v8 = 2082;
      v9 = "-[MapsSuggestionsTracker scheduleRefresh]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)rescheduleRefreshOnlyIfAlreadyRunning
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
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "rescheduleRefreshOnlyIfAlreadyRunning", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MapsSuggestionsTracker_rescheduleRefreshOnlyIfAlreadyRunning__block_invoke;
  block[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v6, buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __63__MapsSuggestionsTracker_rescheduleRefreshOnlyIfAlreadyRunning__block_invoke(uint64_t a1)
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
    if (*((_BYTE *)WeakRetained + 96))
      -[MapsSuggestionsTracker _q_scheduleRefresh]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      v6 = 1026;
      v7 = 925;
      v8 = 2082;
      v9 = "-[MapsSuggestionsTracker rescheduleRefreshOnlyIfAlreadyRunning]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)unschedule
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "unschedule", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MapsSuggestionsTracker_unschedule__block_invoke;
  block[3] = &unk_1E4BCEE50;
  block[4] = self;
  dispatch_async(queue, block);
}

_QWORD *__36__MapsSuggestionsTracker_unschedule__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  return -[MapsSuggestionsTracker _unschedule](*(_QWORD **)(a1 + 32));
}

- (void)clearLocationAndETAs
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MapsSuggestionsTracker_clearLocationAndETAs__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__MapsSuggestionsTracker_clearLocationAndETAs__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    v3 = (void *)WeakRetained[16];
    WeakRetained[16] = v2;

    objc_msgSend(WeakRetained, "setCurrentLocation:", 0);
    -[MapsSuggestionsTracker _q_resetAllTitleFormatting]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsTracker.m";
      v7 = 1026;
      v8 = 962;
      v9 = 2082;
      v10 = "-[MapsSuggestionsTracker clearLocationAndETAs]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)_q_resetAllTitleFormatting
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_resetAllTitleFormatting", buf, 2u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 184), "strongArray", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "setETA:forKey:", 0, CFSTR("MapsSuggestionsETAKey"));
        v9 = *(void **)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resetTitlesForEntry:", v8);

        v12 = *(void **)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resetTitlesForEntry:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v5);
  }

}

- (void)resetAllTitleFormatting
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__MapsSuggestionsTracker_resetAllTitleFormatting__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__MapsSuggestionsTracker_resetAllTitleFormatting__block_invoke(uint64_t a1)
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
    -[MapsSuggestionsTracker _q_resetAllTitleFormatting]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsTracker.m";
      v6 = 1026;
      v7 = 988;
      v8 = 2082;
      v9 = "-[MapsSuggestionsTracker resetAllTitleFormatting]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (int)mapType
{
  return self->_mapType;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (MapsSuggestionsMutableWeakEntries)trackedEntries
{
  return self->_trackedEntries;
}

- (void)setTrackedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_trackedEntries, a3);
}

- (MapsSuggestionsNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
  objc_storeStrong((id *)&self->_networkRequester, a3);
}

- (MapsSuggestionsPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_predictor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_trackedEntries, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_flightUpdater, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong(&self->_transportTypeChangedListener, 0);
  objc_storeStrong((id *)&self->_previousETAs, 0);
  objc_storeStrong((id *)&self->_currentLocationWiper, 0);
  objc_storeStrong((id *)&self->_donater, 0);
  objc_storeStrong((id *)&self->_etaRequester, 0);
  objc_storeStrong((id *)&self->_etaChargeTitleFormatters, 0);
  objc_storeStrong((id *)&self->_distanceTitleFormatters, 0);
  objc_storeStrong((id *)&self->_etaTitleFormatters, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
