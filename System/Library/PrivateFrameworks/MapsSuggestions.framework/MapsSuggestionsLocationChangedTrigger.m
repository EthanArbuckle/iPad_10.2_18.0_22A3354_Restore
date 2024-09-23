@implementation MapsSuggestionsLocationChangedTrigger

- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3
{
  id v5;
  MapsSuggestionsLocationChangedTrigger *v6;
  MapsSuggestionsLocationChangedTrigger *v7;
  MapsSuggestionsLocationChangedTrigger *v8;
  NSObject *v9;
  objc_super v11;
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
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsLocationChangedTrigger;
    v6 = -[MapsSuggestionsBaseTrigger initWithName:](&v11, sel_initWithName_, CFSTR("MapsSuggestionsLocationChangedTrigger"));
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_locationUpdater, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
      v14 = 1024;
      v15 = 68;
      v16 = 2082;
      v17 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:]";
      v18 = 2082;
      v19 = "nil == (locationUpdater)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (MapsSuggestionsLocationChangedTrigger)initWithLocationUpdater:(id)a3 forcingLocationUpdater:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsSuggestionsLocationChangedTrigger *v9;
  MapsSuggestionsLocationChangedTrigger *v10;
  MapsSuggestionsLocationChangedTrigger *v11;
  NSObject *v12;
  const char *v13;
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
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
    v17 = 1024;
    v18 = 80;
    v19 = 2082;
    v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
    v21 = 2082;
    v22 = "nil == (locationUpdater)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater";
LABEL_13:
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_14;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
    v17 = 1024;
    v18 = 81;
    v19 = 2082;
    v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
    v21 = 2082;
    v22 = "nil == (forcingLocationUpdater)";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location updater or use initWithLocationUpdater:";
    goto LABEL_13;
  }
  if (v6 == v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLocationChangedTrigger.m";
      v17 = 1024;
      v18 = 82;
      v19 = 2082;
      v20 = "-[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:forcingLocationUpdater:]";
      v21 = 2082;
      v22 = "locationUpdater == forcingLocationUpdater";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. The location updates cannot be the same (because we will s"
            "top only one of them)";
      goto LABEL_13;
    }
LABEL_14:

    v11 = 0;
    goto LABEL_15;
  }
  v9 = -[MapsSuggestionsLocationChangedTrigger initWithLocationUpdater:](self, "initWithLocationUpdater:", v6);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_forcingLocationUpdater, a4);
  self = v10;
  v11 = self;
LABEL_15:

  return v11;
}

- (void)_kickForceUpdateWithTime:(void *)a1
{
  id v3;
  NSObject *v4;
  MapsSuggestionsCanKicker *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (*((_QWORD *)v3 + 9))
    {
      if (a2 == 0.0)
      {
        GEOFindOrCreateLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Trying to init location Force Update with time 0.0!", (uint8_t *)buf, 2u);
        }

      }
      else
      {
        if (*((double *)v3 + 8) != a2 || (v9 = (void *)*((_QWORD *)v3 + 7)) == 0)
        {
          objc_initWeak(buf, v3);
          *((double *)v3 + 8) = a2;
          v5 = [MapsSuggestionsCanKicker alloc];
          objc_msgSend(v3, "dispatchQueue");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __66__MapsSuggestionsLocationChangedTrigger__kickForceUpdateWithTime___block_invoke;
          v10[3] = &unk_1E4BCDFF8;
          objc_copyWeak(&v11, buf);
          v7 = -[MapsSuggestionsCanKicker initWithName:time:queue:block:](v5, "initWithName:time:queue:block:", CFSTR("LocationForceUpdateCanKicker"), v6, v10, a2);
          v8 = (void *)*((_QWORD *)v3 + 7);
          *((_QWORD *)v3 + 7) = v7;

          objc_destroyWeak(&v11);
          objc_destroyWeak(buf);
          v9 = (void *)*((_QWORD *)v3 + 7);
        }
        objc_msgSend(v9, "kickCanBySameTime");
      }
    }
    else
    {
      -[MapsSuggestionsLocationChangedTrigger _cancelLocationForceUpdate](v3);
    }
    objc_sync_exit(v3);

  }
}

- (void)_cancelLocationForceUpdate
{
  id v1;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    objc_msgSend(obj[7], "cancel");
    v1 = obj[7];
    obj[7] = 0;

    objc_sync_exit(obj);
  }
}

void __66__MapsSuggestionsLocationChangedTrigger__kickForceUpdateWithTime___block_invoke(uint64_t a1)
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
    objc_msgSend(WeakRetained, "_forceLocationUpdate");
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsLocationChangedTrigger.m";
      v6 = 1026;
      v7 = 108;
      v8 = 2082;
      v9 = "-[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)_forceLocationUpdate
{
  id v2;

  v2 = (id)-[MapsSuggestionsLocationUpdater startLocationUpdatesForDelegate:](self->_forcingLocationUpdater, "startLocationUpdatesForDelegate:", self);
}

- (void)changeMinDistance:(double)a3
{
  MapsSuggestionsLocationChangedTrigger *v4;
  NSObject *v5;
  double minDistance;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v4->_minDistance = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    minDistance = v4->_minDistance;
    v7 = 134217984;
    v8 = minDistance;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Minimum distance set to %f", (uint8_t *)&v7, 0xCu);
  }

  objc_sync_exit(v4);
}

- (void)restartWithUpdateTime:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "restartWithUpdateTime: %f", (uint8_t *)&v6, 0xCu);
  }

  -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](self, a3);
}

- (uint64_t)stopForcingUpdate
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "Stopping forcing LocationUpdater", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 72), "stopLocationUpdatesForDelegate:", v1);
  }
  return result;
}

- (void)startWithMinimumUpdateTime:(double)a3 minimumDistance:(double)a4
{
  NSObject *v7;
  MapsSuggestionsLocationChangedTrigger *v8;
  double v9;
  double v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134218240;
    v12 = a3;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Starting Trigger with Time:%f Distance:%f", (uint8_t *)&v11, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  GEOConfigGetDouble();
  if (v9 > a3)
  {
    GEOConfigGetDouble();
    a3 = v10;
  }
  objc_sync_exit(v8);

  -[MapsSuggestionsLocationChangedTrigger startWithMinimumDistance:](v8, "startWithMinimumDistance:", a4);
  -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](v8, a3);
}

- (void)startWithMinimumDistance:(double)a3
{
  NSObject *v5;
  MapsSuggestionsLocationChangedTrigger *v6;
  double v7;
  double v8;
  uint64_t v9;
  CLLocation *previousLocation;
  id v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "Starting Trigger with Distance:%f", (uint8_t *)&v12, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  v6->_minDistance = a3;
  GEOConfigGetDouble();
  if (v7 > a3)
  {
    GEOConfigGetDouble();
    v6->_minDistance = v8;
  }
  MapsSuggestionsCurrentBestLocation();
  v9 = objc_claimAutoreleasedReturnValue();
  previousLocation = v6->_previousLocation;
  v6->_previousLocation = (CLLocation *)v9;

  objc_sync_exit(v6);
  v11 = (id)-[MapsSuggestionsLocationUpdater startLocationUpdatesForDelegate:](v6->_locationUpdater, "startLocationUpdatesForDelegate:", v6);
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
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Stopping Trigger", v4, 2u);
  }

  -[MapsSuggestionsLocationChangedTrigger stopForcingUpdate]((uint64_t)self);
  -[MapsSuggestionsLocationChangedTrigger _cancelLocationForceUpdate](self);
  -[MapsSuggestionsLocationUpdater stopLocationUpdatesForDelegate:](self->_locationUpdater, "stopLocationUpdatesForDelegate:", self);
}

- (void)didUpdateLocation:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MapsSuggestionsLocationChangedTrigger *v10;
  CLLocation *previousLocation;
  double v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[MapsSuggestionsLocationChangedTrigger stopForcingUpdate]((uint64_t)self);
    -[MapsSuggestionsLocationChangedTrigger _kickForceUpdateWithTime:](self, self->_locationForceUpdateTime);
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "coordinate");
      v8 = v7;
      objc_msgSend(v5, "coordinate");
      v14 = 134218240;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "we received location <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    v10 = self;
    objc_sync_enter(v10);
    previousLocation = v10->_previousLocation;
    if (previousLocation
      && (-[CLLocation distanceFromLocation:](previousLocation, "distanceFromLocation:", v5), v12 < v10->_minDistance))
    {
      objc_sync_exit(v10);

    }
    else
    {
      GEOFindOrCreateLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "Trigger Observers", (uint8_t *)&v14, 2u);
      }

      objc_storeStrong((id *)&v10->_previousLocation, a3);
      objc_sync_exit(v10);

      -[MapsSuggestionsBaseTrigger triggerMyObservers](v10, "triggerMyObservers");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcingLocationUpdater, 0);
  objc_storeStrong((id *)&self->_locationForceUpdateCanKicker, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_previousLocation, 0);
}

@end
