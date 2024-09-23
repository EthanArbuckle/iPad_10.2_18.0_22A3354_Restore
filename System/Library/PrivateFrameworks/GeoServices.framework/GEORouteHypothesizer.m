@implementation GEORouteHypothesizer

+ (id)hypothesizerForPlannedDestination:(id)a3
{
  id v3;
  GEORouteHypothesizer *v4;

  v3 = a3;
  v4 = -[GEORouteHypothesizer initWithPlannedDestination:]([GEORouteHypothesizer alloc], "initWithPlannedDestination:", v3);

  return v4;
}

+ (BOOL)transitTTLSupportedInCurrentCountry
{
  void *v2;
  char v3;

  +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitTTLSupported");

  return v3;
}

- (GEORouteHypothesizer)initWithPlannedDestination:(id)a3
{
  id v5;
  GEORouteHypothesizer *v6;
  GEORouteHypothesizer *v7;
  GEORouteHypothesis *currentHypothesis;
  NSError *currentError;
  id updateHandler;
  uint64_t v11;
  geo_isolater *isolater;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEORouteHypothesizer;
  v6 = -[GEORouteHypothesizer init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_plannedDestination, a3);
    currentHypothesis = v7->_currentHypothesis;
    v7->_currentHypothesis = 0;

    currentError = v7->_currentError;
    v7->_currentError = 0;

    updateHandler = v7->_updateHandler;
    v7->_updateHandler = 0;

    v11 = geo_isolater_create();
    isolater = v7->_isolater;
    v7->_isolater = (geo_isolater *)v11;

    v7->_wakeForDelay = 1;
    +[GEORouteHypothesizerDelayer checkin](GEORouteHypothesizerDelayer, "checkin");
  }

  return v7;
}

- (double)willBeginHypothesizingInterval
{
  void *v2;
  double v3;
  double v4;

  +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hypothesisShouldPersistThresholdInSeconds");
  v4 = -v3;

  return v4;
}

- (double)willEndHypothesizingInterval
{
  void *v2;
  double v3;
  double v4;

  +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hypothesisShouldPersistThresholdInSeconds");
  v4 = v3;

  return v4;
}

- (BOOL)wakeForDelay
{
  return self->_wakeForDelay;
}

- (void)setDoNotWakeForDelay
{
  self->_wakeForDelay = 0;
}

- (BOOL)_wontHypothesizeAgain
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[GEORouteHypothesizer state](self, "state") == 4 || -[GEORouteHypothesizer state](self, "state") == 2)
    return 1;
  -[GEOPlannedDestination expirationDate](self->_plannedDestination, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlannedDestination expirationDate](self->_plannedDestination, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 == v7;

  return v3;
}

- (void)_performDelayedStart
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[GEOPlannedDestination description](self->_plannedDestination, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138477827;
    v6 = v4;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Delay activity fired for %{private}@", (uint8_t *)&v5, 0xCu);

  }
  -[GEORouteHypothesizer startHypothesizingWithUpdateHandler:](self, "startHypothesizingWithUpdateHandler:", self->_updateHandler);
}

- (void)_delayStartingWithoutXpc
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *delayDispatchTimer;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[GEOPlannedDestination arrivalDate](self->_plannedDestination, "arrivalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesizer willBeginHypothesizingInterval](self, "willBeginHypothesizingInterval");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = randomJitterForHypothesisWakeup();

  +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumRefreshIntervalLeeway");
  v10 = v9;

  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v17, &location);
  v11 = v6 + v7;
  v12 = (OS_dispatch_source *)geo_dispatch_timer_create_on_qos();
  delayDispatchTimer = self->_delayDispatchTimer;
  self->_delayDispatchTimer = v12;

  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[GEOPlannedDestination description](self->_plannedDestination, "description", v16, 3221225472, __48__GEORouteHypothesizer__delayStartingWithoutXpc__block_invoke, &unk_1E1BFF8B0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v20 = v15;
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = v10;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Too early to hypothesize. Setting up a dispatch_source timer for  %{private}@ with interval %f and leeway %f", buf, 0x20u);

  }
  dispatch_activate((dispatch_object_t)self->_delayDispatchTimer);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __48__GEORouteHypothesizer__delayStartingWithoutXpc__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performDelayedStart");
  objc_msgSend(WeakRetained, "cancelDelayDispatchTimer");

}

- (void)cancelDelayDispatchTimer
{
  NSObject *delayDispatchTimer;
  OS_dispatch_source *v4;

  delayDispatchTimer = self->_delayDispatchTimer;
  if (delayDispatchTimer)
  {
    dispatch_source_cancel(delayDispatchTimer);
    v4 = self->_delayDispatchTimer;
    self->_delayDispatchTimer = 0;

  }
}

- (void)_delayStartingWithBGST
{
  NSObject *v3;
  GEOPlannedDestination *plannedDestination;
  int v5;
  GEOPlannedDestination *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECDBCA60 != -1)
    dispatch_once(&qword_1ECDBCA60, &__block_literal_global_182);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    plannedDestination = self->_plannedDestination;
    v5 = 138477827;
    v6 = plannedDestination;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Too early to hypothesize. Adding hypothesis to delayer for destination %{private}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend((id)_MergedGlobals_318, "delayStartOfHypothesizer:", self);
}

void __46__GEORouteHypothesizer__delayStartingWithBGST__block_invoke()
{
  GEORouteHypothesizerDelayer *v0;
  void *v1;

  v0 = objc_alloc_init(GEORouteHypothesizerDelayer);
  v1 = (void *)_MergedGlobals_318;
  _MergedGlobals_318 = (uint64_t)v0;

}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "_wontHypothesizeAgain") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v2 + 48))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 48);
      *(_QWORD *)(v4 + 48) = v3;

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 8), "arrivalDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "willBeginHypothesizingInterval");
    objc_msgSend(v6, "dateByAddingTimeInterval:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (v9 == 1)
    {
      v10 = *(_BYTE **)(a1 + 32);
      if (v10[72])
        objc_msgSend(v10, "_delayStartingWithBGST");
      else
        objc_msgSend(v10, "_delayStartingWithoutXpc");
    }
    else
    {
      +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEONavdManager navdManager](GEONavdManager, "navdManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openForClient:", v11);

      objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 56);
      *(_QWORD *)(v14 + 56) = v13;

      +[GEONavdManager navdManager](GEONavdManager, "navdManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "plannedDestination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(v18 + 56);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke_2;
      v20[3] = &unk_1E1C15BE8;
      v20[4] = v18;
      objc_msgSend(v16, "startMonitoringDestination:forClient:uuid:handler:", v17, v11, v19, v20);

    }
  }
}

void __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138477827;
    v26 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Received callback from GEONavdManager with hypothesis %{private}@", (uint8_t *)&v25, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_wontHypothesizeAgain"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopHypothesizing");
  }
  else
  {
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = 0;

    v12 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      objc_storeStrong((id *)(v12 + 40), v7);
      objc_msgSend(v7, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_16;
      v16 = objc_msgSend(v7, "code");
      v17 = objc_msgSend(v7, "code");
      if (v16 != -1500 && v17 != -1501)
        goto LABEL_16;
      objc_msgSend(v7, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", v21))
      {
        v22 = objc_msgSend(v19, "code");

        if (v22 == -8)
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
      }
      else
      {

      }
      if (v16 == -1500)
        v23 = 3;
      else
LABEL_16:
        v23 = 2;
    }
    else
    {
      objc_storeStrong((id *)(v12 + 32), a2);
      v23 = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", v23);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (v24)
      (*(void (**)(void))(v24 + 16))();

  }
}

- (void)requestRefresh
{
  geo_isolate_sync();
}

void __38__GEORouteHypothesizer_requestRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[GEONavdManager navdManager](GEONavdManager, "navdManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "plannedDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestRefreshForPlannedDestination:client:", v3, v4);

  }
}

- (void)stopHypothesizing
{
  geo_isolate_sync();
}

void __41__GEORouteHypothesizer_stopHypothesizing__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[10])
  {
    objc_msgSend(v2, "cancelDelayDispatchTimer");
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = (void *)v2[6];
  v2[6] = 0;

  +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    +[GEONavdManager navdManager](GEONavdManager, "navdManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "plannedDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopMonitoringDestination:forClient:uuid:", v5, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = 0;

  }
  +[GEONavdManager navdManager](GEONavdManager, "navdManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closeForClient:", v9);

  if (objc_msgSend(*(id *)(a1 + 32), "state") != 2)
    objc_msgSend(*(id *)(a1 + 32), "setState:", 4);

}

- (void)onlyPerformLocalUpdates
{
  geo_isolate_sync();
}

void __47__GEORouteHypothesizer_onlyPerformLocalUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1 || objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[GEONavdManager navdManager](GEONavdManager, "navdManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "plannedDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "onlyPerformLocalUpdatesForPlannedDestination:client:", v3, v4);

  }
}

- (void)didPostUINotification:(unint64_t)a3
{
  geo_isolate_sync();
}

void __46__GEORouteHypothesizer_didPostUINotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[GEONavdManager navdManager](GEONavdManager, "navdManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "plannedDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPostUINotification:forDestination:fromClient:", v3, v4, v5);

}

- (void)dealloc
{
  id updateHandler;
  void *v4;
  void *v5;
  NSUUID *uuid;
  geo_isolater *isolater;
  objc_super v8;

  if (self->_delayDispatchTimer)
    -[GEORouteHypothesizer cancelDelayDispatchTimer](self, "cancelDelayDispatchTimer");
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

  if (-[GEORouteHypothesizer state](self, "state") != 4)
  {
    +[GEONavdManager navdManagerClientIdentifier:](GEONavdManager, "navdManagerClientIdentifier:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEONavdManager navdManager](GEONavdManager, "navdManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeForClient:", v4);

  }
  uuid = self->_uuid;
  self->_uuid = 0;

  isolater = self->_isolater;
  self->_isolater = 0;

  v8.receiver = self;
  v8.super_class = (Class)GEORouteHypothesizer;
  -[GEORouteHypothesizer dealloc](&v8, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEORouteHypothesizer plannedDestination](self, "plannedDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEORouteHypothesizer state](self, "state");
  if (v5 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E1C15C08[v5];
  }
  if (self->_unableToFindRouteForOriginalTransportType)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[GEORouteHypothesizer currentHypothesis](self, "currentHypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tDestination: %@\n\tState: %@\n\tUnableToFindRouteForOriginalTransportType: %@\n\tHypothesis:%@\n}\n"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (GEORouteHypothesis)currentHypothesis
{
  return self->_currentHypothesis;
}

- (GEOPlannedDestination)plannedDestination
{
  return self->_plannedDestination;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (BOOL)unableToFindRouteForOriginalTransportType
{
  return self->_unableToFindRouteForOriginalTransportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDispatchTimer, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_currentHypothesis, 0);
  objc_storeStrong((id *)&self->_plannedDestination, 0);
}

@end
