@implementation DNDSUntilExitLocationLifetimeMonitor

- (DNDSUntilExitLocationLifetimeMonitor)initWithAggregateMonitor:(id)a3
{
  id v4;
  DNDSUntilExitLocationLifetimeMonitor *v5;
  DNDSUntilExitLocationLifetimeMonitor *v6;
  NSArray *activeLifetimeAssertionUUIDs;
  DNDSJSONBackingStore *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  DNDSBackingStore *backingStore;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSUntilExitLocationLifetimeMonitor;
  v5 = -[DNDSUntilExitLocationLifetimeMonitor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_aggregateMonitor, v4);
    activeLifetimeAssertionUUIDs = v6->_activeLifetimeAssertionUUIDs;
    v6->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    v8 = [DNDSJSONBackingStore alloc];
    v9 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_locationAssertionUntilExitRegionFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:](v8, "initWithRecordClass:fileURL:versionNumber:", v9, v10, 0);
    backingStore = v6->_backingStore;
    v6->_backingStore = (DNDSBackingStore *)v11;

    -[DNDSUntilExitLocationLifetimeMonitor _loadDataFromBackingStore](v6, "_loadDataFromBackingStore");
  }

  return v6;
}

- (BOOL)hasCurrentRegion
{
  return self->_currentRegion != 0;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CLRegion isEqual:](self->_currentRegion, "isEqual:", v9))
  {
    v11 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring failed for region, will stop monitor and invalidate all assertions; manager=%p"
        ", region=%@, error=%{public}@",
        (uint8_t *)&v12,
        0x20u);
    }
    -[DNDSUntilExitLocationLifetimeMonitor _queue_stopMonitoringCurrentLocation](self, "_queue_stopMonitoringCurrentLocation");
    -[DNDSUntilExitLocationLifetimeMonitor _queue_sendExpiryEventForAllLocationAssertions](self, "_queue_sendExpiryEventForAllLocationAssertions");
  }

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 regionEntered;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  _BYTE v24[24];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[CLRegion identifier](self->_currentRegion, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a4 > 2)
        v14 = CFSTR("<invalid>");
      else
        v14 = off_1E86A6458[a4];
      *(_DWORD *)v24 = 134218498;
      *(_QWORD *)&v24[4] = v8;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v14;
      *(_WORD *)&v24[22] = 2112;
      v25 = v9;
      v15 = v13;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Until I leave location region state was determined; manager=%p, state=%{public}@, region=%@",
        v24,
        0x20u);

    }
    if (a4 == 2)
    {
      regionEntered = self->_regionEntered;
      v18 = DNDSLogLocationLifetimeMonitor;
      v19 = os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT);
      if (regionEntered)
      {
        if (v19)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Confirmed until I leave region exit, will invalidate all assertions", v24, 2u);
        }
        -[DNDSUntilExitLocationLifetimeMonitor _queue_sendExpiryEventForAllLocationAssertions](self, "_queue_sendExpiryEventForAllLocationAssertions", *(_QWORD *)v24, *(_OWORD *)&v24[8], v25);
      }
      else
      {
        if (v19)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Received unexpected until I leave region exit, will start region monitoring again", v24, 2u);
        }
        -[DNDSUntilExitLocationLifetimeMonitor _queue_stopMonitoringCurrentLocation](self, "_queue_stopMonitoringCurrentLocation", *(_QWORD *)v24, *(_OWORD *)&v24[8], v25);
        -[DNDSUntilExitLocationLifetimeMonitor _queue_beginMonitoringCurrentLocation](self, "_queue_beginMonitoringCurrentLocation");
      }
    }
    else if (a4 == 1)
    {
      if (!self->_regionEntered)
      {
        v16 = DNDSLogLocationLifetimeMonitor;
        if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Confirmed until I leave region entry", v24, 2u);
        }
        self->_regionEntered = 1;
        -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25);
      }
    }
    else
    {
      v20 = (void *)DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CFSTR("<invalid>");
        if (!a4)
          v21 = CFSTR("unknown");
        v22 = v21;
        *(_DWORD *)v24 = 138543362;
        *(_QWORD *)&v24[4] = v22;
        v23 = v20;
        _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Did not handle until I leave region state %{public}@", v24, 0xCu);

      }
    }
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring found location, will update geofence; manager=%p, locations=%@",
      (uint8_t *)&v10,
      0x16u);
  }
  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSUntilExitLocationLifetimeMonitor _queue_geofenceLocation:](self, "_queue_geofenceLocation:", v9);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring failed, will stop monitor and invalidate all assertions; manager=%p, error=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  -[DNDSUntilExitLocationLifetimeMonitor _queue_stopMonitoringCurrentLocation](self, "_queue_stopMonitoringCurrentLocation");
  -[DNDSUntilExitLocationLifetimeMonitor _queue_sendExpiryEventForAllLocationAssertions](self, "_queue_sendExpiryEventForAllLocationAssertions");

}

- (void)_queue_refreshMonitor
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *activeLifetimeAssertionUUIDs;
  uint8_t v11[16];

  -[DNDSUntilExitLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing until I leave monitor", v11, 2u);
  }
  objc_msgSend(v3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lifetimeMonitor:modeAssertionsWithLifetimeClass:", v3, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSArray isEqualToArray:](self->_activeLifetimeAssertionUUIDs, "isEqualToArray:", v8))
  {
    v9 = (NSArray *)objc_msgSend(v8, "copy");
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = v9;

  }
  if (-[NSArray count](self->_activeLifetimeAssertionUUIDs, "count") && !self->_hasActiveLifetimes)
  {
    self->_hasActiveLifetimes = 1;
    -[DNDSUntilExitLocationLifetimeMonitor _queue_beginMonitoringCurrentLocation](self, "_queue_beginMonitoringCurrentLocation");
  }
  else if (!-[NSArray count](self->_activeLifetimeAssertionUUIDs, "count") && self->_hasActiveLifetimes)
  {
    -[DNDSUntilExitLocationLifetimeMonitor _queue_stopMonitoringCurrentLocation](self, "_queue_stopMonitoringCurrentLocation");
    self->_hasActiveLifetimes = 0;
  }

}

uint64_t __61__DNDSUntilExitLocationLifetimeMonitor__queue_refreshMonitor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)_queue_beginMonitoringCurrentLocation
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[DNDSUntilExitLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Requesting current location to begin monitoring until I leave", v6, 2u);
  }
  objc_msgSend(v2, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestLocation");

}

- (void)_queue_stopMonitoringCurrentLocation
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  CLRegion *currentRegion;
  void *v7;
  CLRegion *v8;
  int v9;
  CLRegion *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[DNDSUntilExitLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_currentRegion)
  {
    v5 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      currentRegion = self->_currentRegion;
      v9 = 138412290;
      v10 = currentRegion;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring stopping for geofence; region=%@",
        (uint8_t *)&v9,
        0xCu);
    }
    objc_msgSend(v3, "locationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopMonitoringForRegion:", self->_currentRegion);

    v8 = self->_currentRegion;
    self->_currentRegion = 0;

    self->_regionEntered = 0;
    -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0);
  }

}

- (void)_queue_geofenceLocation:(id)a3
{
  id WeakRetained;
  NSObject *v5;
  id v6;
  CLRegion *v7;
  CLRegion *currentRegion;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_aggregateMonitor);
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_hasActiveLifetimes)
  {
    v6 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v9, "coordinate");
    v7 = (CLRegion *)objc_msgSend(v6, "initWithCenter:radius:identifier:", CFSTR("com.apple.donotdisturb.server.until-i-leave"));
    currentRegion = self->_currentRegion;
    self->_currentRegion = v7;

    -[CLRegion setNotifyOnExit:](self->_currentRegion, "setNotifyOnExit:", 1);
    -[CLRegion setNotifyOnEntry:](self->_currentRegion, "setNotifyOnEntry:", 0);
    self->_regionEntered = 0;
    -[DNDSUntilExitLocationLifetimeMonitor _queue_geofenceRegion:](self, "_queue_geofenceRegion:", self->_currentRegion);
  }

}

- (void)_queue_geofenceRegion:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CLRegion *currentRegion;
  int v9;
  CLRegion *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[DNDSUntilExitLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_hasActiveLifetimes)
  {
    objc_msgSend(v4, "locationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startMonitoringForRegion:", self->_currentRegion);

    -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:](self, "_saveDataToBackingStoreWithError:", 0);
    v7 = DNDSLogLocationLifetimeMonitor;
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
    {
      currentRegion = self->_currentRegion;
      v9 = 138412290;
      v10 = currentRegion;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Until I leave location monitoring started for geofence; region=%@",
        (uint8_t *)&v9,
        0xCu);
    }
  }

}

- (void)_queue_sendExpiryEventForAllLocationAssertions
{
  NSObject *v3;
  NSArray *activeLifetimeAssertionUUIDs;
  NSArray *v5;
  void *v6;
  void *v7;
  id v8;

  -[DNDSUntilExitLocationLifetimeMonitor aggregateMonitor](self, "aggregateMonitor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[NSArray count](self->_activeLifetimeAssertionUUIDs, "count"))
  {
    activeLifetimeAssertionUUIDs = self->_activeLifetimeAssertionUUIDs;
    self->_activeLifetimeAssertionUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];
    v5 = activeLifetimeAssertionUUIDs;

    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lifetimeMonitor:lifetimeDidExpireForAssertionUUIDs:expirationDate:", v8, v5, v7);

  }
}

- (void)_loadDataFromBackingStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load current until I leave region database, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __65__DNDSUntilExitLocationLifetimeMonitor__loadDataFromBackingStore__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = DNDSLogLocationLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Found existing until I leave region to begin monitoring", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_geofenceRegion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)_saveDataToBackingStoreWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  DNDSBackingStore *backingStore;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[DNDSUntilExitRegionStore mutableCopy](self->_store, "mutableCopy");
  objc_msgSend(v5, "setActiveLifetimeAssertionUUIDs:", self->_activeLifetimeAssertionUUIDs);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasActiveLifetimes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasActiveLifetimes:", v6);

  objc_msgSend(v5, "setCurrentRegion:", self->_currentRegion);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_regionEntered);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRegionEntered:", v7);

  backingStore = self->_backingStore;
  v17 = 0;
  v9 = -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v5, &v17);
  v10 = v17;
  if (v9)
  {
    if (v9 == 1)
    {
      v15 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        v12 = "Failed to write until I leave store, but error can be ignored; error=%{public}@";
        v13 = v15;
        v14 = 12;
        goto LABEL_11;
      }
    }
    else if (v9 == 2)
    {
      v11 = DNDSLogLocationLifetimeMonitor;
      if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Wrote out until I leave store to file";
        v13 = v11;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogLocationLifetimeMonitor, OS_LOG_TYPE_ERROR))
      -[DNDSUntilExitLocationLifetimeMonitor _saveDataToBackingStoreWithError:].cold.1();
    _DNDSRequestRadar(CFSTR("Failed to write store"), v10, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSLocationLifetimeMonitor.m"), 940);
  }
  if (a3 && v10)
    *a3 = objc_retainAutorelease(v10);

  return v9 == 2;
}

- (DNDSAggregateLocationLifetimeMonitor)aggregateMonitor
{
  return (DNDSAggregateLocationLifetimeMonitor *)objc_loadWeakRetained((id *)&self->_aggregateMonitor);
}

- (void)setAggregateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_aggregateMonitor, a3);
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  return self->_activeLifetimeAssertionUUIDs;
}

- (DNDSLifetimeMonitorDataSource)dataSource
{
  return (DNDSLifetimeMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  return (DNDSLifetimeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_activeLifetimeAssertionUUIDs, 0);
  objc_destroyWeak((id *)&self->_aggregateMonitor);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
}

- (void)_saveDataToBackingStoreWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to write until I leave store, will request radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
