@implementation MapsSuggestionsBaseLocationUpdater

- (id)dispatchQueue
{
  return self->_queue._innerQueue;
}

- (void)considerMyAllowanceAsLimited:(BOOL)a3
{
  int v3;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = MapsSuggestionsIsInCoarseLocation();
  if (v5 == v3)
  {
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "Location allowance is the same. Doing nothing.", (uint8_t *)&v13, 2u);
      }

    }
  }
  else
  {
    v6 = v5;
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsBaseLocationUpdater uniqueName](self, "uniqueName");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = "Precise";
      if (v6)
        v11 = "Coarse";
      else
        v11 = "Precise";
      v13 = 138412802;
      v14 = v8;
      v16 = v11;
      v15 = 2080;
      if (v3)
        v10 = "Coarse";
      v17 = 2080;
      v18 = v10;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "%@ is switched from %s to %s", (uint8_t *)&v13, 0x20u);

    }
    MapsSuggestionsSetInCoarseLocation(v3);
    if (v3)
    {
      MapsSuggestionsResetCurrentLocation();
      -[MapsSuggestionsObservers callBlock:](self->_locationObservers, "callBlock:", &__block_literal_global_22);
    }
  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsBaseLocationUpdater)initWithName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsBaseLocationUpdater *v9;
  uint64_t v10;
  NSString *name;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *innerQueue;
  NSString *v14;
  NSString *v15;
  MapsSuggestionsObservers *v16;
  OS_dispatch_queue *v17;
  void *v18;
  uint64_t v19;
  MapsSuggestionsObservers *locationObservers;
  MapsSuggestionsObservers *v21;
  OS_dispatch_queue *v22;
  void *v23;
  uint64_t v24;
  MapsSuggestionsObservers *visitObservers;
  MapsSuggestionsBaseLocationUpdater *v26;
  NSObject *v27;
  objc_super v29;
  _BYTE buf[18];
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 41;
      v31 = 2082;
      v32 = "-[MapsSuggestionsBaseLocationUpdater initWithName:queue:]";
      v33 = 2082;
      v34 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 42;
      v31 = 2082;
      v32 = "-[MapsSuggestionsBaseLocationUpdater initWithName:queue:]";
      v33 = 2082;
      v34 = "nil == (queue)";
      _os_log_impl(&dword_1A427D000, v27, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a queue", buf, 0x26u);
    }
LABEL_11:

    v26 = 0;
    goto LABEL_12;
  }
  v29.receiver = self;
  v29.super_class = (Class)MapsSuggestionsBaseLocationUpdater;
  v9 = -[MapsSuggestionsBaseLocationUpdater init](&v29, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    MSg::Queue::Queue((NSObject **)buf, v8);
    v12 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v12;

    v14 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    v15 = v9->_queue._name;
    v9->_queue._name = v14;

    v16 = [MapsSuggestionsObservers alloc];
    v17 = v9->_queue._innerQueue;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@LocationObservers"), v9->_name);
    v19 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v16, "initWithCallbackQueue:name:", v17, v18);
    locationObservers = v9->_locationObservers;
    v9->_locationObservers = (MapsSuggestionsObservers *)v19;

    v21 = [MapsSuggestionsObservers alloc];
    v22 = v9->_queue._innerQueue;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@VisitObservers"), v9->_name);
    v24 = -[MapsSuggestionsObservers initWithCallbackQueue:name:](v21, "initWithCallbackQueue:name:", v22, v23);
    visitObservers = v9->_visitObservers;
    v9->_visitObservers = (MapsSuggestionsObservers *)v24;

  }
  self = v9;
  v26 = self;
LABEL_12:

  return v26;
}

- (void)dealloc
{
  MapsSuggestionsObservers *locationObservers;
  MapsSuggestionsObservers *visitObservers;
  objc_super v5;

  locationObservers = self->_locationObservers;
  self->_locationObservers = 0;

  visitObservers = self->_visitObservers;
  self->_visitObservers = 0;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsBaseLocationUpdater;
  -[MapsSuggestionsBaseLocationUpdater dealloc](&v5, sel_dealloc);
}

- (BOOL)hasObservers
{
  return -[MapsSuggestionsObservers count](self->_locationObservers, "count") != 0;
}

- (void)onStartImplementation
{
  -[MapsSuggestionsBaseLocationUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (void)onStopImplementation
{
  -[MapsSuggestionsBaseLocationUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

- (void)considerMyNewLocation:(id)a3
{
  void *v4;
  NSObject *v5;
  MapsSuggestionsObservers *locationObservers;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MapsSuggestionsSetMostRecentLocation(a3);
  MapsSuggestionsCurrentBestLocation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Chose best location: %@", buf, 0xCu);
    }

  }
  locationObservers = self->_locationObservers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MapsSuggestionsBaseLocationUpdater_considerMyNewLocation___block_invoke;
  v8[3] = &unk_1E4BD0440;
  v7 = v4;
  v9 = v7;
  -[MapsSuggestionsObservers callBlock:](locationObservers, "callBlock:", v8);

}

void __60__MapsSuggestionsBaseLocationUpdater_considerMyNewLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "CALLING{%@} didUpdateLocation:%@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(v3, "didUpdateLocation:", *(_QWORD *)(a1 + 32));

}

- (void)considerMyNewVisit:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  MapsSuggestionsObservers *visitObservers;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MapsSuggestionsIsValidVisit(v4))
  {
    v5 = v4;
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "departureDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && (objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "isEqualToDate:", v8),
            v8,
            !v9))
      {
        v10 = 2;
      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
        v21 = 1024;
        v22 = 93;
        v23 = 2082;
        v24 = "_MapsSuggestionsVisitEventType _visitEventType(CLVisit *__strong)";
        v25 = 2082;
        v26 = "nil == (visit)";
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a visit", buf, 0x26u);
      }

      v10 = 0;
    }

    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = "arrival";
        if (v10 == 2)
          v14 = "departure";
        *(_DWORD *)buf = 136315138;
        v20 = v14;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater visit %s", buf, 0xCu);
      }

    }
    visitObservers = self->_visitObservers;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__MapsSuggestionsBaseLocationUpdater_considerMyNewVisit___block_invoke;
    v16[3] = &unk_1E4BD0468;
    v18 = v10;
    v17 = v6;
    -[MapsSuggestionsObservers callBlock:](visitObservers, "callBlock:", v16);
    v11 = v17;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (const char *)v4;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Dropping invalid visit: %@", buf, 0xCu);
    }
  }

}

void __57__MapsSuggestionsBaseLocationUpdater_considerMyNewVisit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 2)
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      *(_QWORD *)v15 = v10;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLeaveVisit:%@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "didLeaveVisit:", *(_QWORD *)(a1 + 32));
  }
  else if (v4 == 1)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      *(_QWORD *)v15 = v7;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "CALLING{%@} didEnterVisit:%@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "didEnterVisit:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      v14 = 1024;
      *(_DWORD *)v15 = 131;
      *(_WORD *)&v15[4] = 2082;
      *(_QWORD *)&v15[6] = "-[MapsSuggestionsBaseLocationUpdater considerMyNewVisit:]_block_invoke";
      v16 = 2082;
      v17 = "YES";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsVisitEventType!", (uint8_t *)&v12, 0x26u);
    }

  }
}

void __67__MapsSuggestionsBaseLocationUpdater_considerMyAllowanceAsLimited___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "uniqueName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "CALLING{%@} didLoseLocationPermission", (uint8_t *)&v5, 0xCu);

    }
  }
  objc_msgSend(v2, "didLoseLocationPermission");

}

- (id)startLocationUpdatesForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  void *v7;
  MapsSuggestionsObservers *locationObservers;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
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
      v14 = v6;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater startLocationUpdatesForDelegate:%@", buf, 0xCu);

    }
    MapsSuggestionsCurrentBestLocation();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    locationObservers = self->_locationObservers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__MapsSuggestionsBaseLocationUpdater_startLocationUpdatesForDelegate___block_invoke;
    v11[3] = &unk_1E4BCE1D8;
    objc_copyWeak(&v12, (id *)buf);
    -[MapsSuggestionsObservers registerObserver:handler:](locationObservers, "registerObserver:handler:", v4, v11);
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE7206D8))
      -[MapsSuggestionsObservers registerObserver:handler:](self->_visitObservers, "registerObserver:handler:", v4, 0);
    -[MapsSuggestionsBaseLocationUpdater considerMyNewLocation:](self, "considerMyNewLocation:", v7);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBaseLocationUpdater.mm";
      v15 = 1024;
      v16 = 172;
      v17 = 2082;
      v18 = "-[MapsSuggestionsBaseLocationUpdater startLocationUpdatesForDelegate:]";
      v19 = 2082;
      v20 = "nil == (strongDelegate)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a delegate", buf, 0x26u);
    }

    v7 = 0;
  }

  return v7;
}

void __70__MapsSuggestionsBaseLocationUpdater_startLocationUpdatesForDelegate___block_invoke(uint64_t a1, int a2)
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
  if (a2)
  {
    WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(WeakRetained[2]);
      -[dispatch_queue_t onStartImplementation](v3, "onStartImplementation");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsBaseLocationUpdater.mm";
        v7 = 1026;
        v8 = 180;
        v9 = 2082;
        v10 = "-[MapsSuggestionsBaseLocationUpdater startLocationUpdatesForDelegate:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (void)stopLocationUpdatesForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MapsSuggestionsObservers *locationObservers;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "BaseLocationUpdater stopLocationUpdatesForDelegate:%@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  locationObservers = self->_locationObservers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__MapsSuggestionsBaseLocationUpdater_stopLocationUpdatesForDelegate___block_invoke;
  v8[3] = &unk_1E4BCE1D8;
  objc_copyWeak(&v9, (id *)buf);
  -[MapsSuggestionsObservers unregisterObserver:handler:](locationObservers, "unregisterObserver:handler:", v4, v8);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE7206D8))
    -[MapsSuggestionsObservers unregisterObserver:handler:](self->_visitObservers, "unregisterObserver:handler:", v4, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __69__MapsSuggestionsBaseLocationUpdater_stopLocationUpdatesForDelegate___block_invoke(uint64_t a1, int a2)
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
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "onStopImplementation");
    }
    else
    {
      GEOFindOrCreateLog();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136446722;
        v6 = "MapsSuggestionsBaseLocationUpdater.mm";
        v7 = 1026;
        v8 = 203;
        v9 = 2082;
        v10 = "-[MapsSuggestionsBaseLocationUpdater stopLocationUpdatesForDelegate:]_block_invoke";
        _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

    }
  }
}

- (id)restartLocationUpdatesForDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MapsSuggestionsBaseLocationUpdater stopLocationUpdatesForDelegate:](self, "stopLocationUpdatesForDelegate:", v4);
  -[MapsSuggestionsBaseLocationUpdater startLocationUpdatesForDelegate:](self, "startLocationUpdatesForDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)awaitQueue
{
  dispatch_barrier_sync((dispatch_queue_t)self->_queue._innerQueue, &__block_literal_global_72);
}

void __48__MapsSuggestionsBaseLocationUpdater_awaitQueue__block_invoke()
{
  NSLog(CFSTR("_queue ran"));
}

- (unint64_t)countLocationObservers
{
  return -[MapsSuggestionsObservers count](self->_locationObservers, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitObservers, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
