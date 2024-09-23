@implementation MNTracePlayer

- (MNTracePlayer)initWithPath:(id)a3
{
  return -[MNTracePlayer initWithPath:outError:](self, "initWithPath:outError:", a3, 0);
}

- (MNTracePlayer)initWithPath:(id)a3 outError:(id *)a4
{
  id v6;
  MNTraceLoader *v7;
  void *v8;
  MNTracePlayer *v9;

  v6 = a3;
  v7 = objc_alloc_init(MNTraceLoader);
  -[MNTraceLoader loadTraceWithPath:outError:](v7, "loadTraceWithPath:outError:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[MNTracePlayer initWithTrace:](self, "initWithTrace:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MNTracePlayer)initWithTrace:(id)a3
{
  id v5;
  MNTracePlayer *v6;
  MNTracePlayer *v7;
  MNTracePlayerScheduler *v8;
  MNTracePlayerScheduler *scheduler;
  id v10;
  uint64_t v11;
  GEOObserverHashTable *observers;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  NSMutableArray *processedWaypointEvents;
  MNTracePlayer *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MNTracePlayer;
  v6 = -[MNTracePlayer init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trace, a3);
    v8 = objc_alloc_init(MNTracePlayerScheduler);
    scheduler = v7->_scheduler;
    v7->_scheduler = v8;

    -[MNTracePlayerScheduler setDelegate:](v7->_scheduler, "setDelegate:", v7);
    v10 = objc_alloc(MEMORY[0x1E0D272B8]);
    v11 = objc_msgSend(v10, "initWithProtocol:queue:", &unk_1EEED8018, MEMORY[0x1E0C80D38]);
    observers = v7->_observers;
    v7->_observers = (GEOObserverHashTable *)v11;

    -[MNTrace locations](v7->_trace, "locations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timestamp");
    v7->_duration = v15;

    -[MNTracePlayer setSpeedMultiplier:](v7, "setSpeedMultiplier:", 1.0);
    -[MNTracePlayer _createTimelineStreams](v7, "_createTimelineStreams");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    processedWaypointEvents = v7->_processedWaypointEvents;
    v7->_processedWaypointEvents = (NSMutableArray *)v16;

    v18 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProvider:", 0);

  -[MNTracePlayerScheduler setDelegate:](self->_scheduler, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MNTracePlayer;
  -[MNTracePlayer dealloc](&v4, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)start
{
  -[MNTracePlayer startAtLocationIndex:](self, "startAtLocationIndex:", 0);
}

- (void)startAtLocationIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_isPlaying)
  {
    -[MNTrace locations](self->_trace, "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[MNTrace locations](self->_trace, "locations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 <= a3)
      {
        GEOFindOrCreateLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[MNTrace locations](self->_trace, "locations");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109376;
          v23 = a3;
          v24 = 1024;
          v25 = objc_msgSend(v20, "count");
          _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_ERROR, "Starting index (%d) out of bounds of location array: [0,%d]", buf, 0xEu);

        }
      }
      else
      {
        if (self->_traceStartTimestamp == 0.0)
        {
          -[MNTrace locations](self->_trace, "locations");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "location");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          self->_traceStartTimestamp = v13;

        }
        *(_WORD *)&self->_isPlaying = 1;
        -[MNTracePlayerScheduler resume](self->_scheduler, "resume");
        +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setProvider:", self);

        -[GEOObserverHashTable tracePlayerDidStart:](self->_observers, "tracePlayerDidStart:", self);
        -[MNTrace locations](self->_trace, "locations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", a3);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTracePlayer _locationWithCurrentDate:](self, "_locationWithCurrentDate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOObserverHashTable tracePlayer:didUpdateLocation:](self->_observers, "tracePlayer:didUpdateLocation:", self, v17);
        objc_msgSend(v21, "timestamp");
        -[MNTracePlayerScheduler setPosition:](self->_scheduler, "setPosition:");

      }
    }
    else
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "Trace is empty", buf, 2u);
      }

    }
  }
}

- (void)stop
{
  void *v3;
  MNTracePlayerTimelineStream *locationStream;
  MNTracePlayerTimelineStream *etaUpdatesStream;

  +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProvider:", 0);

  -[MNTracePlayerScheduler pause](self->_scheduler, "pause");
  *(_WORD *)&self->_isPlaying = 256;
  -[MNTracePlayerScheduler removeAllTimelineStreams](self->_scheduler, "removeAllTimelineStreams");
  locationStream = self->_locationStream;
  self->_locationStream = 0;

  etaUpdatesStream = self->_etaUpdatesStream;
  self->_etaUpdatesStream = 0;

  -[GEOObserverHashTable tracePlayerDidStop:](self->_observers, "tracePlayerDidStop:", self);
}

- (void)pause
{
  if (self->_isPlaying && !self->_isPaused)
  {
    self->_isPaused = 1;
    -[MNTracePlayerScheduler pause](self->_scheduler, "pause");
    -[GEOObserverHashTable tracePlayerDidPause:](self->_observers, "tracePlayerDidPause:", self);
  }
}

- (void)resume
{
  if (self->_isPlaying && self->_isPaused)
  {
    self->_isPaused = 0;
    -[MNTracePlayerScheduler resume](self->_scheduler, "resume");
    -[GEOObserverHashTable tracePlayerDidResume:](self->_observers, "tracePlayerDidResume:", self);
  }
}

- (id)guidanceEventNearTimestamp:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MNTrace navigationEvents](self->_trace, "navigationEvents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {

    v8 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  v10 = 978307200.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v12, "relativeTimestamp");
      v14 = vabdd_f64(v13, a3);
      if (v14 < v10)
      {
        v15 = v12;

        v10 = v14;
        v8 = v15;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  v16 = 0;
  if (v8 && v10 < 5.0)
  {
    if (-[NSMutableArray indexOfObject:](self->_processedWaypointEvents, "indexOfObject:", v8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](self->_processedWaypointEvents, "addObject:", v8);
      v8 = v8;
      v16 = v8;
      goto LABEL_16;
    }
LABEL_15:
    v16 = 0;
  }
LABEL_16:

  return v16;
}

- (BOOL)requestDirectionsNearTimestamp:(double)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  dispatch_time_t v26;
  id v27;
  id v28;
  BOOL v29;
  NSObject *v30;
  double v31;
  double v32;
  double v33;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[MNTrace directions](self->_trace, "directions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (!v8)
  {

    goto LABEL_19;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v41;
  v12 = 978307200.0;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_msgSend(v14, "requestTimestamp");
      v16 = vabdd_f64(v15, a3);
      if (v16 < v12)
      {
        v17 = v14;

        v12 = v16;
        v10 = v17;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  }
  while (v9);

  if (v12 >= 5.0)
  {
    if (v10)
    {
      GEOFindOrCreateLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        -[NSObject requestTimestamp](v10, "requestTimestamp");
        v32 = v31;
        -[MNTracePlayer position](self, "position");
        *(_DWORD *)buf = 134218240;
        v45 = v32;
        v46 = 2048;
        v47 = v33;
        _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_INFO, "Found directions request, but request time (%0.2f) was not close to current playback time (%0.2f)", buf, 0x16u);
      }

LABEL_21:
      v29 = 0;
      goto LABEL_22;
    }
LABEL_19:
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Didn't find any directions in trace.", buf, 2u);
    }
    goto LABEL_21;
  }
  -[NSObject response](v10, "response");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject error](v10, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject requestTimestamp](v10, "requestTimestamp");
  v21 = v20;
  -[NSObject responseTimestamp](v10, "responseTimestamp");
  v23 = v22 - v21;
  v24 = fmin(v22 - v21, 0.01);
  GEOFindOrCreateLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v45 = v21;
    v46 = 2048;
    v47 = v24;
    v48 = 2048;
    v49 = v23;
    _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_INFO, "Found nearby request with timestamp %0.2f. Playing back with response delay of %0.1f seconds (original delay %0.1f seconds)", buf, 0x20u);
  }

  v26 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __60__MNTracePlayer_requestDirectionsNearTimestamp_withHandler___block_invoke;
  v35[3] = &unk_1E61D7C88;
  v36 = v18;
  v38 = v19;
  v39 = v6;
  v37 = v10;
  v27 = v19;
  v10 = v10;
  v28 = v18;
  dispatch_after(v26, MEMORY[0x1E0C80D38], v35);

  v29 = 1;
LABEL_22:

  return v29;
}

void __60__MNTracePlayer_requestDirectionsNearTimestamp_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "waypoints");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "request");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, uint64_t, void *, _QWORD))(v2 + 16))(v2, v8, v3, v4, v5, 0);

    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "Found directions request, but no response", buf, 2u);
    }

  }
}

- (void)jumpToTime:(double)a3
{
  double v5;
  double v6;
  MNLocation *lastReportedLocation;
  MNTraceNavigationUpdatesChangeRouteRow *v8;
  MNTraceLocationRow *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  GEOObserverHashTable *observers;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;

  -[MNTracePlayerScheduler position](self->_scheduler, "position");
  v6 = v5;
  -[MNTracePlayerScheduler setPosition:](self->_scheduler, "setPosition:", a3);
  lastReportedLocation = self->_lastReportedLocation;
  self->_lastReportedLocation = 0;

  -[NSMutableArray removeAllObjects](self->_processedWaypointEvents, "removeAllObjects");
  if (self->_shouldUpdateRouteWhenJumping)
  {
    -[MNTracePlayer _changeRouteRowForTimestamp:](self, "_changeRouteRowForTimestamp:", a3);
    v8 = (MNTraceNavigationUpdatesChangeRouteRow *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
      -[MNTraceNavigationUpdatesRow setTimestamp:](v8, "setTimestamp:", a3);
    }
    -[MNTracePlayer _routeForRouteChangeRow:](self, "_routeForRouteChangeRow:", v8);
    v9 = (MNTraceLocationRow *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[GEOObserverHashTable tracePlayer:didUpdateCurrentRoute:reason:](self->_observers, "tracePlayer:didUpdateCurrentRoute:reason:", self, v9, 0);
      -[MNTracePlayer _locationRowBeforeTimestamp:](self, "_locationRowBeforeTimestamp:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_16;
      goto LABEL_6;
    }
  }
  else
  {
    if (!GEOConfigGetBOOL())
    {
      v30 = 0;
      -[GEOObserverHashTable tracePlayer:didSeekToTime:fromTime:location:](self->_observers, "tracePlayer:didSeekToTime:fromTime:location:", self, 0, a3, v6);
      goto LABEL_19;
    }
    v8 = objc_alloc_init(MNTraceDirectionsRow);
    -[MNTraceNavigationUpdatesChangeRouteRow setRequestTimestamp:](v8, "setRequestTimestamp:", a3);
    -[MNTrace directions](self->_trace, "directions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTrace directions](self->_trace, "directions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v12, "count"), 1024, &__block_literal_global_44);

    v14 = v13 - 1;
    if (v13 != 1)
    {
      -[MNTrace directions](self->_trace, "directions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v14 < v16)
      {
        -[MNTrace directions](self->_trace, "directions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        observers = self->_observers;
        objc_msgSend(v18, "response");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "request");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "waypoints");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOObserverHashTable tracePlayer:didJumpToRouteResponse:request:waypoints:](observers, "tracePlayer:didJumpToRouteResponse:request:waypoints:", self, v20, v21, v22);

      }
    }
    v9 = objc_alloc_init(MNTraceLocationRow);
    -[MNTraceLocationRow setTimestamp:](v9, "setTimestamp:", a3);
    -[MNTrace locations](self->_trace, "locations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTrace locations](self->_trace, "locations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v24, "count"), 1024, &__block_literal_global_110_0);

    v26 = v25 - 1;
    if (v25 != 1)
    {
      -[MNTrace locations](self->_trace, "locations");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v26 < v28)
      {
        -[MNTrace locations](self->_trace, "locations");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
        if (objc_msgSend(v10, "originalMatchType") == 1)
        {
          objc_msgSend(v10, "location");
          v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v30 = 0;
        goto LABEL_17;
      }
    }
  }
  v30 = 0;
LABEL_18:

  -[GEOObserverHashTable tracePlayer:didSeekToTime:fromTime:location:](self->_observers, "tracePlayer:didSeekToTime:fromTime:location:", self, v30, a3, v6);
LABEL_19:

}

uint64_t __28__MNTracePlayer_jumpToTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "requestTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "requestTimestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __28__MNTracePlayer_jumpToTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (void)jumpToLocationAtIndex:(unint64_t)a3
{
  void *v5;
  MNLocation *lastReportedLocation;
  id v7;

  -[MNTrace locations](self->_trace, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timestamp");
  -[MNTracePlayerScheduler setPosition:](self->_scheduler, "setPosition:");
  lastReportedLocation = self->_lastReportedLocation;
  self->_lastReportedLocation = 0;

  -[NSMutableArray removeAllObjects](self->_processedWaypointEvents, "removeAllObjects");
}

- (void)skipByTimeInterval:(double)a3
{
  double v5;

  -[MNTracePlayer position](self, "position");
  -[MNTracePlayer jumpToTime:](self, "jumpToTime:", v5 + a3);
}

- (void)jumpToBookmarkAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[MNTracePlayer trace](self, "trace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  -[MNTracePlayer jumpToTime:](self, "jumpToTime:", v7 + -5.0);

}

- (double)position
{
  double result;

  -[MNTracePlayerScheduler position](self->_scheduler, "position");
  return result;
}

- (double)currentTime
{
  double traceStartTimestamp;
  double v3;

  traceStartTimestamp = self->_traceStartTimestamp;
  -[MNTracePlayer position](self, "position");
  return traceStartTimestamp + v3;
}

- (void)setSpeedMultiplier:(double)a3
{
  if (self->_speedMultiplier != a3)
  {
    self->_speedMultiplier = a3;
    -[MNTracePlayerScheduler setSpeedMultiplier:](self->_scheduler, "setSpeedMultiplier:");
  }
}

- (void)tracePlayerScheduler:(id)a3 didUpdatePosition:(double)a4
{
  -[GEOObserverHashTable tracePlayer:didPlayAtTime:](self->_observers, "tracePlayer:didPlayAtTime:", self, a4);
}

- (void)_createTimelineStreams
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  MNTracePlayerTimelineStream *v6;
  void *v7;
  MNTracePlayerTimelineStream *v8;
  MNTracePlayerTimelineStream *locationStream;
  void *v10;
  uint64_t v11;
  MNTracePlayerTimelineStream *v12;
  void *v13;
  MNTracePlayerTimelineStream *v14;
  void *v15;
  uint64_t v16;
  MNTracePlayerTimelineStream *v17;
  void *v18;
  MNTracePlayerTimelineStream *v19;
  void *v20;
  uint64_t v21;
  MNTracePlayerTimelineStream *v22;
  void *v23;
  MNTracePlayerTimelineStream *v24;
  void *v25;
  uint64_t v26;
  MNTracePlayerTimelineStream *v27;
  void *v28;
  MNTracePlayerTimelineStream *v29;
  void *v30;
  uint64_t v31;
  MNTracePlayerTimelineStream *v32;
  void *v33;
  MNTracePlayerTimelineStream *v34;
  void *v35;
  uint64_t v36;
  MNTracePlayerTimelineStream *v37;
  void *v38;
  MNTracePlayerTimelineStream *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id location;

  objc_initWeak(&location, self);
  -[MNTrace locations](self->_trace, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace locations](self->_trace, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MNTracePlayerTimelineStream initWithData:](v6, "initWithData:", v7);

    v52[0] = v5;
    v52[1] = 3221225472;
    v52[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke;
    v52[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v53, &location);
    -[MNTracePlayerTimelineStream setHandler:](v8, "setHandler:", v52);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v8);
    locationStream = self->_locationStream;
    self->_locationStream = v8;

    objc_destroyWeak(&v53);
  }
  -[MNTrace vehicleHeadingData](self->_trace, "vehicleHeadingData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace vehicleHeadingData](self->_trace, "vehicleHeadingData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MNTracePlayerTimelineStream initWithData:](v12, "initWithData:", v13);

    v50[0] = v5;
    v50[1] = 3221225472;
    v50[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_113;
    v50[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v51, &location);
    -[MNTracePlayerTimelineStream setHandler:](v14, "setHandler:", v50);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v14);
    objc_destroyWeak(&v51);

  }
  -[MNTrace vehicleSpeedData](self->_trace, "vehicleSpeedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace vehicleSpeedData](self->_trace, "vehicleSpeedData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MNTracePlayerTimelineStream initWithData:](v17, "initWithData:", v18);

    v48[0] = v5;
    v48[1] = 3221225472;
    v48[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_2;
    v48[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v49, &location);
    -[MNTracePlayerTimelineStream setHandler:](v19, "setHandler:", v48);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v19);
    objc_destroyWeak(&v49);

  }
  -[MNTrace motionData](self->_trace, "motionData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace motionData](self->_trace, "motionData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MNTracePlayerTimelineStream initWithData:](v22, "initWithData:", v23);

    v46[0] = v5;
    v46[1] = 3221225472;
    v46[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_3;
    v46[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v47, &location);
    -[MNTracePlayerTimelineStream setHandler:](v24, "setHandler:", v46);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v24);
    objc_destroyWeak(&v47);

  }
  -[MNTrace headingData](self->_trace, "headingData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v27 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace headingData](self->_trace, "headingData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MNTracePlayerTimelineStream initWithData:](v27, "initWithData:", v28);

    v44[0] = v5;
    v44[1] = 3221225472;
    v44[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_4;
    v44[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v45, &location);
    -[MNTracePlayerTimelineStream setHandler:](v29, "setHandler:", v44);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v29);
    objc_destroyWeak(&v45);

  }
  -[MNTrace evData](self->_trace, "evData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace evData](self->_trace, "evData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MNTracePlayerTimelineStream initWithData:](v32, "initWithData:", v33);

    v42[0] = v5;
    v42[1] = 3221225472;
    v42[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_5;
    v42[3] = &unk_1E61D7CF0;
    objc_copyWeak(&v43, &location);
    -[MNTracePlayerTimelineStream setHandler:](v34, "setHandler:", v42);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v34);
    objc_destroyWeak(&v43);

  }
  -[MNTrace navigationUpdates](self->_trace, "navigationUpdates");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    v37 = [MNTracePlayerTimelineStream alloc];
    -[MNTrace navigationUpdates](self->_trace, "navigationUpdates");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MNTracePlayerTimelineStream initWithData:](v37, "initWithData:", v38);

    v40[0] = v5;
    v40[1] = 3221225472;
    v40[2] = __39__MNTracePlayer__createTimelineStreams__block_invoke_6;
    v40[3] = &unk_1E61D7D18;
    objc_copyWeak(&v41, &location);
    v40[4] = self;
    -[MNTracePlayerTimelineStream setHandler:](v39, "setHandler:", v40);
    -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", v39);
    objc_destroyWeak(&v41);

  }
  objc_destroyWeak(&location);
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _DWORD v18[2];
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "trace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "locationEventType");
    objc_msgSend(v9, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18[0] = 67109376;
      v18[1] = a2;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "Trace index: %d | timestamp: %0.2f\n", (uint8_t *)v18, 0x12u);
    }

    switch(v10)
    {
      case 2:
        GEOFindOrCreateLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "Trace resumes location updates.", (uint8_t *)v18, 2u);
        }

        objc_msgSend(v6[3], "tracePlayerDidResumeLocationUpdates:", v6);
        break;
      case 1:
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_INFO, "Trace paused location updates.", (uint8_t *)v18, 2u);
        }

        objc_msgSend(v6[3], "tracePlayerDidPauseLocationUpdates:", v6);
        break;
      case 0:
        if (v11)
        {
          objc_msgSend(v6, "_locationWithCurrentDate:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6[3], "tracePlayer:didUpdateLocation:", v6, v14);
          v15 = v6[6];
          v6[6] = (id)v14;
LABEL_17:

          break;
        }
        if (v12)
        {
          objc_msgSend(v6[3], "tracePlayer:didReceiveLocationError:", v6, v12);
          v15 = v6[6];
          v6[6] = 0;
          goto LABEL_17;
        }
        break;
    }

  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_113(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "trace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vehicleHeadingData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "vehicleHeading");
    objc_msgSend(v6[3], "tracePlayer:didUpdateVehicleHeading:timestamp:", v6, v10);

  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "trace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vehicleSpeedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "vehicleSpeed");
    objc_msgSend(v6[3], "tracePlayer:didUpdateVehicleSpeed:timestamp:", v6, v10);

  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "trace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "motionData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7[3], "tracePlayer:didUpdateMotion:exitType:confidence:", v7, objc_msgSend(v6, "motionType"), objc_msgSend(v6, "exitType"), objc_msgSend(v6, "confidence"));
    WeakRetained = v7;
  }

}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "trace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "trueHeading");
    v9 = v8;
    objc_msgSend(v7, "magneticHeading");
    v11 = v10;
    objc_msgSend(v7, "headingAccuracy");
    memset(v14, 0, 24);
    v14[3] = v11;
    v14[4] = v9;
    v14[5] = v12;
    v15 = 0u;
    v16 = 0u;
    v17 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3A0]), "initWithClientHeading:", v14);
    objc_msgSend(v4[3], "tracePlayer:didUpdateHeading:", v4, v13);

  }
}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_5(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "trace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9[3];
    objc_msgSend(v6, "vehicle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tracePlayer:didUpdateEVData:", v9, v8);

    WeakRetained = v9;
  }

}

void __39__MNTracePlayer__createTimelineStreams__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int BOOL;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v19 = WeakRetained;
    objc_msgSend(WeakRetained, "trace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationUpdates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "navigationUpdateType");

    if (v9 == 2)
    {
      BOOL = GEOConfigGetBOOL();
      v5 = v19;
      if (BOOL)
      {
        objc_msgSend(v19, "trace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "navigationUpdates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "reason") == 1)
        {
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
          objc_msgSend(v13, "waypoint");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tracePlayer:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", v19, v14, objc_msgSend(v13, "legIndex"), objc_msgSend(v13, "reason"));
LABEL_11:

        }
LABEL_12:

        v5 = v19;
      }
    }
    else
    {
      v5 = v19;
      if (v9 == 1)
      {
        v10 = GEOConfigGetBOOL();
        v5 = v19;
        if (v10)
        {
          objc_msgSend(v19, "trace");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "navigationUpdates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", a2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "reason"))
          {
            objc_msgSend(v19, "_routeForRouteChangeRow:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "tracePlayer:didUpdateCurrentRoute:reason:", v19, v14, objc_msgSend(v13, "reason"));
            goto LABEL_11;
          }
          goto LABEL_12;
        }
      }
    }
  }

}

- (void)setShouldPlayETARequests:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  MNTracePlayerTimelineStream *v6;
  void *v7;
  MNTracePlayerTimelineStream *v8;
  MNTracePlayerTimelineStream *etaUpdatesStream;
  MNTracePlayerETAUpdater *v10;
  MNTracePlayerETAUpdater *etaUpdater;
  MNTracePlayerTimelineStream *v12;
  MNTracePlayerETAUpdater *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id location;

  if (self->_shouldPlayETARequests != a3)
  {
    self->_shouldPlayETARequests = a3;
    if (a3)
    {
      -[MNTrace etaUpdates](self->_trace, "etaUpdates");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = [MNTracePlayerTimelineStream alloc];
        -[MNTrace etaUpdates](self->_trace, "etaUpdates");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MNTracePlayerTimelineStream initWithData:](v6, "initWithData:", v7);
        etaUpdatesStream = self->_etaUpdatesStream;
        self->_etaUpdatesStream = v8;

        objc_initWeak(&location, self);
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __42__MNTracePlayer_setShouldPlayETARequests___block_invoke;
        v17 = &unk_1E61D7CF0;
        objc_copyWeak(&v18, &location);
        -[MNTracePlayerTimelineStream setHandler:](self->_etaUpdatesStream, "setHandler:", &v14);
        -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", self->_etaUpdatesStream, v14, v15, v16, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      v10 = objc_alloc_init(MNTracePlayerETAUpdater);
      etaUpdater = self->_etaUpdater;
      self->_etaUpdater = v10;

    }
    else
    {
      -[MNTracePlayerScheduler removeTimelineStream:](self->_scheduler, "removeTimelineStream:", self->_etaUpdatesStream);
      v12 = self->_etaUpdatesStream;
      self->_etaUpdatesStream = 0;

      v13 = self->_etaUpdater;
      self->_etaUpdater = 0;

    }
  }
}

void __42__MNTracePlayer_setShouldPlayETARequests___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 81))
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "trace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "etaUpdates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7[11], "playETAUpdate:", v6);
    WeakRetained = v7;
  }

}

- (MNSessionUpdateManager)sessionUpdater
{
  return (MNSessionUpdateManager *)self->_etaUpdater;
}

- (void)setShouldPlayNetworkEvents:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  MNTracePlayerTimelineStream *v6;
  void *v7;
  MNTracePlayerTimelineStream *v8;
  MNTracePlayerTimelineStream *networkEventsStream;
  MNTracePlayerTimelineStream *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id location;

  if (self->_shouldPlayNetworkEvents != a3)
  {
    self->_shouldPlayNetworkEvents = a3;
    if (a3)
    {
      -[MNTrace networkEvents](self->_trace, "networkEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = [MNTracePlayerTimelineStream alloc];
        -[MNTrace networkEvents](self->_trace, "networkEvents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MNTracePlayerTimelineStream initWithData:](v6, "initWithData:", v7);
        networkEventsStream = self->_networkEventsStream;
        self->_networkEventsStream = v8;

        objc_initWeak(&location, self);
        v11 = MEMORY[0x1E0C809B0];
        v12 = 3221225472;
        v13 = __44__MNTracePlayer_setShouldPlayNetworkEvents___block_invoke;
        v14 = &unk_1E61D7CF0;
        objc_copyWeak(&v15, &location);
        -[MNTracePlayerTimelineStream setHandler:](self->_networkEventsStream, "setHandler:", &v11);
        -[MNTracePlayerScheduler addTimelineStream:](self->_scheduler, "addTimelineStream:", self->_networkEventsStream, v11, v12, v13, v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[MNTracePlayerScheduler removeTimelineStream:](self->_scheduler, "removeTimelineStream:", self->_networkEventsStream);
      v10 = self->_networkEventsStream;
      self->_networkEventsStream = 0;

    }
  }
}

void __44__MNTracePlayer_setShouldPlayNetworkEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 104))
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "trace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7[3], "tracePlayer:didRecieveNetworkEvent:", v7, v6);
    WeakRetained = v7;
  }

}

- (id)_locationWithCurrentDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  MNLocation *v14;
  void *v15;
  MNLocation *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v21[8];
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  if (self->_lastReportedLocation)
  {
    objc_msgSend(v4, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocation originalDate](self->_lastReportedLocation, "originalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 < 0.0)
    {
      v11 = v10 / self->_speedMultiplier;
      -[MNLocation timestamp](self->_lastReportedLocation, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v6 = v11 + v13;

    }
  }
  v29 = 0u;
  memset(v30, 0, 28);
  v28 = 0u;
  v26 = 0u;
  memset(v27, 0, sizeof(v27));
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (v4)
    objc_msgSend(v4, "clientLocation");
  *(double *)((char *)v27 + 12) = v6;
  v14 = [MNLocation alloc];
  objc_msgSend(v4, "matchInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v28;
  v21[7] = v29;
  v22[0] = v30[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v30 + 12);
  v21[2] = v25;
  v21[3] = v26;
  v21[4] = v27[0];
  v21[5] = v27[1];
  v21[0] = v23;
  v21[1] = v24;
  v16 = -[MNLocation initWithClientLocation:matchInfo:](v14, "initWithClientLocation:matchInfo:", v21, v15);

  if (GEOConfigGetBOOL())
  {
    -[MNLocation uuid](v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNLocation setUuid:](v16, "setUuid:", v18);

    }
  }
  objc_msgSend(v4, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocation setOriginalDate:](v16, "setOriginalDate:", v19);

  return v16;
}

- (id)_locationRowBeforeTimestamp:(double)a3
{
  MNTraceLocationRow *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init(MNTraceLocationRow);
  -[MNTraceLocationRow setTimestamp:](v5, "setTimestamp:", a3);
  -[MNTrace locations](self->_trace, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrace locations](self->_trace, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_119);

  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  -[MNTrace locations](self->_trace, "locations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = 0;
  if (v9 < v11)
  {
    -[MNTrace locations](self->_trace, "locations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

uint64_t __45__MNTracePlayer__locationRowBeforeTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_changeRouteRowForTimestamp:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  MNTraceNavigationUpdatesChangeRouteRow *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  -[MNTrace navigationUpdates](self->_trace, "navigationUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_122);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
  -[MNTraceNavigationUpdatesRow setTimestamp:](v7, "setTimestamp:", a3);
  v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_124);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 >= objc_msgSend(v6, "count"))
    objc_msgSend(v6, "firstObject");
  else
    objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __45__MNTracePlayer__changeRouteRowForTimestamp___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "navigationUpdateType") == 1;
}

uint64_t __45__MNTracePlayer__changeRouteRowForTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (unint64_t)_directionsRowIndexBeforeTimestamp:(double)a3
{
  MNTraceDirectionsRow *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v5 = objc_alloc_init(MNTraceDirectionsRow);
  -[MNTraceDirectionsRow setResponseTimestamp:](v5, "setResponseTimestamp:", a3);
  -[MNTrace directions](self->_trace, "directions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrace directions](self->_trace, "directions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_125_0);

  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;

  return v9;
}

uint64_t __52__MNTracePlayer__directionsRowIndexBeforeTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "responseTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "responseTimestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_directionsRowForChangeRouteRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "directionsResponseID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "timestamp");
    v7 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:");
    -[MNTrace directions](self->_trace, "directions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = 0;
    if ((v7 & 0x8000000000000000) == 0 && v7 < v9)
    {
      while (1)
      {
        -[MNTrace directions](self->_trace, "directions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "response");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "directionsResponseID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "directionsResponseID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToData:", v14);

        if ((v15 & 1) != 0)
          break;

        if ((uint64_t)v7-- <= 0)
          goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (id)_etauRowForChangeRouteRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MNTraceETAUpdateRow *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "etauResponseID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = objc_alloc_init(MNTraceETAUpdateRow);
    objc_msgSend(v5, "timestamp");
    -[MNTraceETAUpdateRow setResponseTimestamp:](v7, "setResponseTimestamp:");
    -[MNTrace etaUpdates](self->_trace, "etaUpdates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTrace etaUpdates](self->_trace, "etaUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_128);

    if (v10)
      v11 = v10 - 1;
    else
      v11 = 0;
    -[MNTrace etaUpdates](self->_trace, "etaUpdates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = 0;
    if ((v11 & 0x8000000000000000) == 0 && v11 < v13)
    {
      while (1)
      {
        -[MNTrace etaUpdates](self->_trace, "etaUpdates");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "response");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "responseId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "etauResponseID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToData:", v18);

        if ((v19 & 1) != 0)
          break;

        if ((uint64_t)v11-- <= 0)
        {
          v14 = 0;
          break;
        }
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __43__MNTracePlayer__etauRowForChangeRouteRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "responseTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "responseTimestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_routeForRouteChangeRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  objc_msgSend(v4, "directionsResponseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MNTracePlayer _directionsRowForChangeRouteRow:](self, "_directionsRowForChangeRouteRow:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
LABEL_5:
      v9 = objc_alloc(MEMORY[0x1E0D274D8]);
      objc_msgSend(v8, "waypoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routeAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "response");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v9, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v10, v12, v13, v14);

      objc_msgSend(v15, "allRouteInfos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      v17 = objc_msgSend(v5, "routeIndex");
      if (v17 >= objc_msgSend(v16, "count"))
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "routeIndex"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "route");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v8 = v16;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  objc_msgSend(v5, "etauResponseID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(v5, "timestamp");
    v34 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:");
    -[MNTrace directions](self->_trace, "directions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v34 < v36)
    {
      -[MNTrace directions](self->_trace, "directions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  -[MNTracePlayer _etauRowForChangeRouteRow:](self, "_etauRowForChangeRouteRow:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v21)
  {
    objc_msgSend(v21, "requestTimestamp");
    v22 = -[MNTracePlayer _directionsRowIndexBeforeTimestamp:](self, "_directionsRowIndexBeforeTimestamp:");
    -[MNTrace directions](self->_trace, "directions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v22 < v24)
    {
      -[MNTrace directions](self->_trace, "directions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_alloc(MEMORY[0x1E0D274D8]);
      objc_msgSend(v15, "waypoints");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "request");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "routeAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "response");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "response");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "styleAttributes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v26, "initWithWaypoints:routeAttributes:etauResponse:styleAttributes:", v27, v29, v30, v32);

      objc_msgSend(v33, "allETAUAlternateRouteInfos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_15:

LABEL_19:
  return v19;
}

- (MNTrace)trace
{
  return self->_trace;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (double)duration
{
  return self->_duration;
}

- (double)speedMultiplier
{
  return self->_speedMultiplier;
}

- (BOOL)shouldUpdateRouteWhenJumping
{
  return self->_shouldUpdateRouteWhenJumping;
}

- (void)setShouldUpdateRouteWhenJumping:(BOOL)a3
{
  self->_shouldUpdateRouteWhenJumping = a3;
}

- (BOOL)shouldPlayNetworkEvents
{
  return self->_shouldPlayNetworkEvents;
}

- (BOOL)shouldPlayETARequests
{
  return self->_shouldPlayETARequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedWaypointEvents, 0);
  objc_storeStrong((id *)&self->_networkEventsStream, 0);
  objc_storeStrong((id *)&self->_etaUpdatesStream, 0);
  objc_storeStrong((id *)&self->_etaUpdater, 0);
  objc_storeStrong((id *)&self->_lastReportedLocation, 0);
  objc_storeStrong((id *)&self->_locationStream, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_trace, 0);
}

@end
