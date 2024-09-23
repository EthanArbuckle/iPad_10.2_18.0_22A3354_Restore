@implementation MapsSuggestionsVisitMonitor

- (MapsSuggestionsVisitMonitor)initWithLocationUpdater:(id)a3 startInVisit:(BOOL)a4
{
  id v7;
  MapsSuggestionsVisitMonitor *v8;
  MapsSuggestionsVisitMonitor *v9;
  CLVisit *latestVisit;
  MapsSuggestionsSimpleTrigger *v11;
  MapsSuggestionsSimpleTrigger *onEnterTrigger;
  MapsSuggestionsSimpleTrigger *v13;
  MapsSuggestionsSimpleTrigger *onExitTrigger;
  uint64_t v15;
  MapsSuggestionsBlockCondition *isInVisitCondition;
  MapsSuggestionsVisitMonitor *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  _BYTE location[12];
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)MapsSuggestionsVisitMonitor;
    v8 = -[MapsSuggestionsVisitMonitor init](&v22, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_locationUpdater, a3);
      latestVisit = v9->_latestVisit;
      v9->_latestVisit = 0;

      v9->_isInVisit = a4;
      objc_initWeak((id *)location, v9);
      v11 = -[MapsSuggestionsSimpleTrigger initWithName:]([MapsSuggestionsSimpleTrigger alloc], "initWithName:", CFSTR("onVisitEnter"));
      onEnterTrigger = v9->_onEnterTrigger;
      v9->_onEnterTrigger = v11;

      v13 = -[MapsSuggestionsSimpleTrigger initWithName:]([MapsSuggestionsSimpleTrigger alloc], "initWithName:", CFSTR("onVisitExit"));
      onExitTrigger = v9->_onExitTrigger;
      v9->_onExitTrigger = v13;

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__MapsSuggestionsVisitMonitor_initWithLocationUpdater_startInVisit___block_invoke;
      v20[3] = &unk_1E4BCF990;
      objc_copyWeak(&v21, (id *)location);
      MapsSuggestionsCondition(CFSTR("isInVisit"), v20);
      v15 = objc_claimAutoreleasedReturnValue();
      isInVisitCondition = v9->_isInVisitCondition;
      v9->_isInVisitCondition = (MapsSuggestionsBlockCondition *)v15;

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)location);
    }
    self = v9;
    v17 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      v24 = 1024;
      v25 = 40;
      v26 = 2082;
      v27 = "-[MapsSuggestionsVisitMonitor initWithLocationUpdater:startInVisit:]";
      v28 = 2082;
      v29 = "nil == (locationUpdater)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater", location, 0x26u);
    }

    v17 = 0;
  }

  return v17;
}

uint64_t __68__MapsSuggestionsVisitMonitor_initWithLocationUpdater_startInVisit___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "isInVisit");
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsVisitMonitor.m";
      v8 = 1026;
      v9 = 53;
      v10 = 2082;
      v11 = "-[MapsSuggestionsVisitMonitor initWithLocationUpdater:startInVisit:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    v3 = 0;
  }

  return v3;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (CLVisit)latestVisit
{
  MapsSuggestionsVisitMonitor *v2;
  CLVisit *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_latestVisit;
  objc_sync_exit(v2);

  return v3;
}

- (void)startMonitoring
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = (id)-[MapsSuggestionsLocationUpdater startLocationUpdatesForDelegate:](self->_locationUpdater, "startLocationUpdatesForDelegate:", self);
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Started visit monitoring", v4, 2u);
  }

}

- (void)stopMonitoring
{
  NSObject *v2;
  uint8_t v3[16];

  -[MapsSuggestionsLocationUpdater stopLocationUpdatesForDelegate:](self->_locationUpdater, "stopLocationUpdatesForDelegate:", self);
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Stopped visit monitoring", v3, 2u);
  }

}

- (BOOL)isInVisit
{
  NSObject *v3;
  BOOL isInVisit;
  MapsSuggestionsVisitMonitor *v5;
  uint8_t v7[16];

  if (GEOConfigGetBOOL())
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "DEBUG: We're always in a Visit", v7, 2u);
    }

    return 1;
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    isInVisit = v5->_isInVisit;
    objc_sync_exit(v5);

  }
  return isInVisit;
}

- (void)didEnterVisit:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  MapsSuggestionsVisitMonitor *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BYTE v13[14];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "hasArrivalDate");
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315394;
      v11 = "-[MapsSuggestionsVisitMonitor didEnterVisit:]";
      v12 = 2112;
      *(_QWORD *)v13 = v5;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v10, 0x16u);
    }

    v9 = self;
    objc_sync_enter(v9);
    objc_storeStrong((id *)&v9->_latestVisit, a3);
    v9->_isInVisit = 1;
    objc_sync_exit(v9);

    -[MapsSuggestionsSimpleTrigger fire](v9->_onEnterTrigger, "fire");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      v12 = 1024;
      *(_DWORD *)v13 = 102;
      *(_WORD *)&v13[4] = 2082;
      *(_QWORD *)&v13[6] = "-[MapsSuggestionsVisitMonitor didEnterVisit:]";
      v14 = 2082;
      v15 = "!visit.hasArrivalDate";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. An Enter CLVisit must have an arrival date", (uint8_t *)&v10, 0x26u);
    }

  }
}

- (void)didLeaveVisit:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  MapsSuggestionsVisitMonitor *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[14];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "hasArrivalDate") & 1) == 0)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      v13 = 1024;
      *(_DWORD *)v14 = 115;
      *(_WORD *)&v14[4] = 2082;
      *(_QWORD *)&v14[6] = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
      v15 = 2082;
      v16 = "!visit.hasArrivalDate";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. An Exit CLVisit must have an arrival date";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x26u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v6 = objc_msgSend(v5, "hasDepartureDate");
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVisitMonitor.m";
      v13 = 1024;
      *(_DWORD *)v14 = 116;
      *(_WORD *)&v14[4] = 2082;
      *(_QWORD *)&v14[6] = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
      v15 = 2082;
      v16 = "!visit.hasDepartureDate";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. An Exit CLVisit must have a departure date";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "-[MapsSuggestionsVisitMonitor didLeaveVisit:]";
    v13 = 2112;
    *(_QWORD *)v14 = v5;
    _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_latestVisit, a3);
  v9->_isInVisit = 0;
  objc_sync_exit(v9);

  -[MapsSuggestionsSimpleTrigger fire](v9->_onExitTrigger, "fire");
LABEL_12:

}

- (void)didLoseLocationPermission
{
  NSObject *v3;
  MapsSuggestionsVisitMonitor *v4;
  CLVisit *latestVisit;
  uint8_t v6[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Lost our permission to have locations; wiping what we know.",
      v6,
      2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  latestVisit = v4->_latestVisit;
  v4->_latestVisit = 0;

  v4->_isInVisit = 0;
  objc_sync_exit(v4);

}

- (void)didUpdateLocation:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315394;
      v6 = "-[MapsSuggestionsVisitMonitor didUpdateLocation:]";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

- (MapsSuggestionsTrigger)onEnterTrigger
{
  return (MapsSuggestionsTrigger *)self->_onEnterTrigger;
}

- (MapsSuggestionsTrigger)onExitTrigger
{
  return (MapsSuggestionsTrigger *)self->_onExitTrigger;
}

- (MapsSuggestionsCondition)isInVisitCondition
{
  return (MapsSuggestionsCondition *)self->_isInVisitCondition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInVisitCondition, 0);
  objc_storeStrong((id *)&self->_onExitTrigger, 0);
  objc_storeStrong((id *)&self->_onEnterTrigger, 0);
  objc_storeStrong((id *)&self->_latestVisit, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
}

@end
