@implementation MapsSuggestionsDefaultLocationUpdater

- (MapsSuggestionsDefaultLocationUpdater)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  MapsSuggestionsDefaultLocationUpdater *v5;
  objc_super v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("MapsSuggestionsDefaultLocationUpdaterWorkerQueue", v3);
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsDefaultLocationUpdater;
  v5 = -[MapsSuggestionsBaseLocationUpdater initWithName:queue:](&v7, sel_initWithName_queue_, CFSTR("MapsSuggestionsDefaultLocationUpdater"), v4);

  return v5;
}

- (void)onStartImplementation
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  CLLocationManager *v9;
  CLLocationManager *locationManager;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[MapsSuggestionsDefaultLocationUpdater onStartImplementation]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v12, 0xCu);
  }

  -[MapsSuggestionsBaseLocationUpdater dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_locationManager)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "Already running", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    v7 = *MEMORY[0x1E0D26D08];
    -[MapsSuggestionsBaseLocationUpdater dispatchQueue](self, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CLLocationManager *)objc_msgSend(v6, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v7, self, v8);
    locationManager = self->_locationManager;
    self->_locationManager = v9;

    GEOConfigGetDouble();
    -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:");
    -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E4A8]);
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    v11 = -[CLLocationManager _limitsPrecision](self->_locationManager, "_limitsPrecision");
    -[MapsSuggestionsBaseLocationUpdater considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", v11);
    if ((v11 & 1) != 0)
      return;
    -[CLLocationManager location](self->_locationManager, "location");
    v5 = objc_claimAutoreleasedReturnValue();
    -[MapsSuggestionsBaseLocationUpdater considerMyNewLocation:](self, "considerMyNewLocation:", v5);
  }

}

- (void)onStopImplementation
{
  NSObject *v3;
  NSObject *v4;
  CLLocationManager *locationManager;
  CLLocationManager *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[MapsSuggestionsDefaultLocationUpdater onStopImplementation]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[MapsSuggestionsBaseLocationUpdater dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  locationManager = self->_locationManager;
  if (locationManager)
  {
    -[CLLocationManager stopUpdatingLocation](locationManager, "stopUpdatingLocation");
    v6 = self->_locationManager;
    self->_locationManager = 0;

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id buf[2];

  v6 = a3;
  v7 = a4;
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "DualLocationUpdater update", (uint8_t *)buf, 2u);
    }

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_initWeak(buf, self);
    -[MapsSuggestionsBaseLocationUpdater dispatchQueue](self, "dispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MapsSuggestionsDefaultLocationUpdater_locationManager_didUpdateLocations___block_invoke;
    block[3] = &unk_1E4BCE020;
    objc_copyWeak(&v13, buf);
    v11 = v6;
    v12 = v7;
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }

}

void __76__MapsSuggestionsDefaultLocationUpdater_locationManager_didUpdateLocations___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "considerMyAllowanceAsLimited:", objc_msgSend(a1[4], "_limitsPrecision"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = a1[5];
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v11 = WeakRetained;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(char **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          if (s_verbose)
          {
            GEOFindOrCreateLog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v18 = v8;
              _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "Considering new location: %@", buf, 0xCu);
            }

          }
          if (MapsSuggestionsIsValidLocation(v8))
          {
            objc_msgSend(v11, "considerMyNewLocation:", v8);
          }
          else
          {
            GEOFindOrCreateLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v18 = v8;
              _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Dropping invalid location: %@", buf, 0xCu);
            }

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
      WeakRetained = v11;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "MapsSuggestionsDefaultLocationUpdater.m";
      v19 = 1026;
      v20 = 93;
      v21 = 2082;
      v22 = "-[MapsSuggestionsDefaultLocationUpdater locationManager:didUpdateLocations:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_msgSend(v4, "code");
  if (v5 != 3)
  {
    if (v5)
    {
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        v7 = "Location error: %@";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 12;
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        v7 = "Location unknown";
        v8 = v6;
        v9 = OS_LOG_TYPE_DEBUG;
        v10 = 2;
LABEL_10:
        _os_log_impl(&dword_1A427D000, v8, v9, v7, (uint8_t *)&v11, v10);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  -[MapsSuggestionsBaseLocationUpdater considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", objc_msgSend(a3, "_limitsPrecision"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
