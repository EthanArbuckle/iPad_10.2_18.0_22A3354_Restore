@implementation ENRegionMonitorCoreLocationDataSource

- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ENRegionMonitorCoreLocationDataSource *v7;

  v4 = (void *)MEMORY[0x1E0D18468];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ENRegionMonitorCoreLocationDataSource initWithDelegate:routineManager:](self, "initWithDelegate:routineManager:", v5, v6);

  return v7;
}

- (ENRegionMonitorCoreLocationDataSource)initWithDelegate:(id)a3 routineManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ENRegionMonitorCoreLocationDataSource *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionMonitorCoreLocationDataSource.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceDelegate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionMonitorCoreLocationDataSource.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routineManager"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)ENRegionMonitorCoreLocationDataSource;
  v10 = -[ENRegionMonitorCoreLocationDataSource init](&v17, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.exposureNotification.regionMonitorCoreLocationDataSource", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_routineManager, a4);
    objc_storeWeak((id *)&v10->delegate, v7);
    -[ENRegionMonitorCoreLocationDataSource setup](v10, "setup");
  }

  return v10;
}

- (void)_setup
{
  NSObject *v3;
  id v4;
  void *v5;
  CLLocationManager *v6;
  CLLocationManager *locationManager;
  id v8;

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(MEMORY[0x1E0C9E3C0]);
  objc_msgSend(MEMORY[0x1E0CB34D8], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/ExposureNotificationBundle.bundle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CLLocationManager *)objc_msgSend(v4, "initWithEffectiveBundle:delegate:onQueue:", v8, self, v5);
  locationManager = self->_locationManager;
  self->_locationManager = v6;

}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ENRegionMonitorCoreLocationDataSource_setup__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __46__ENRegionMonitorCoreLocationDataSource_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (id)currentRegionVisit
{
  return self->_cachedRegionVisit;
}

- (void)startMonitoring
{
  NSObject *v4;
  _QWORD v5[6];

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ENRegionMonitorCoreLocationDataSource_startMonitoring__block_invoke;
  v5[3] = &unk_1E87D9E80;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __56__ENRegionMonitorCoreLocationDataSource_startMonitoring__block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v5;

  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "startMonitoringVisits");
}

- (void)stopMonitoring
{
  NSObject *v4;
  _QWORD v5[6];

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ENRegionMonitorCoreLocationDataSource_stopMonitoring__block_invoke;
  v5[3] = &unk_1E87D9E80;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t __55__ENRegionMonitorCoreLocationDataSource_stopMonitoring__block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v5;

  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopMonitoringVisits");
}

- (BOOL)updateRegionAllowed
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  CFDateGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    v5 = v4;

  }
  else
  {
    v5 = 1.79769313e308;
  }
  if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 >= 86400.0;
}

- (void)_updatedRegion
{
  NSObject *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ENRegionMonitorCoreLocationDataSource updateRegionAllowed](self, "updateRegionAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFPrefs_SetValue();

    v5 = *MEMORY[0x1E0C9E4A0];
    -[ENRegionMonitorCoreLocationDataSource locationManager](self, "locationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDesiredAccuracy:", v5);

    -[ENRegionMonitorCoreLocationDataSource locationManager](self, "locationManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestLocation");

  }
}

- (void)updateRegion
{
  NSObject *v3;
  _QWORD block[5];

  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ENRegionMonitorCoreLocationDataSource_updateRegion__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __53__ENRegionMonitorCoreLocationDataSource_updateRegion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatedRegion");
}

- (void)_updateRegionVisit:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v7)
  {
    objc_storeStrong((id *)&self->_cachedRegionVisit, a3);
    -[ENRegionMonitorCoreLocationDataSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionDataSource:updatedWithVisit:", self, v7);

  }
}

- (void)updateRegionVisit:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ENRegionMonitorCoreLocationDataSource_updateRegionVisit___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__ENRegionMonitorCoreLocationDataSource_updateRegionVisit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRegionVisit:", *(_QWORD *)(a1 + 40));
}

- (void)_processLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENRegionMonitorCoreLocationDataSource routineManager](self, "routineManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "horizontalAccuracy");
  v8 = v7 + 250.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ENRegionMonitorCoreLocationDataSource__processLocation___block_invoke;
  v10[3] = &unk_1E87D9EA8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v9, v10, v8);

}

void __58__ENRegionMonitorCoreLocationDataSource__processLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5
    && gLogCategory__ENRegionMonitorCoreLocationDataSource <= 90
    && (gLogCategory__ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v6 = v5;
    LogPrintF_safe();
  }
  objc_msgSend(*(id *)(a1 + 32), "processLocation:locationsOfInterest:", *(_QWORD *)(a1 + 40), v7, v6);

}

- (void)_processVisit:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ENRegionMonitorCoreLocationDataSource *v12;

  v4 = a3;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "_placeInference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_loiIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENRegionMonitorCoreLocationDataSource routineManager](self, "routineManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ENRegionMonitorCoreLocationDataSource__processVisit___block_invoke;
  v10[3] = &unk_1E87D9ED0;
  v11 = v4;
  v12 = self;
  v9 = v4;
  objc_msgSend(v8, "fetchLocationOfInterestWithIdentifier:withHandler:", v7, v10);

}

void __55__ENRegionMonitorCoreLocationDataSource__processVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (v5)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

    if (v7)
    {
      if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 90
        && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
  v8 = objc_alloc(MEMORY[0x1E0C9E3B0]);
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "horizontalAccuracy");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "detectionDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v10, v12, 0.0, v14, 0.0);

  objc_msgSend(*(id *)(a1 + 40), "processLocation:locationOfInterest:", v16, v17);
}

- (void)processLocation:(id)a3 locationOfInterest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ENRegionMonitorCoreLocationDataSource_processLocation_locationOfInterest___block_invoke;
  block[3] = &unk_1E87D9EF8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __76__ENRegionMonitorCoreLocationDataSource_processLocation_locationOfInterest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processLocation:locationOfInterest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_processLocation:(id)a3 locationOfInterest:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

  if (v9
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v6)
  {
    objc_msgSend(v6, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iso3166CountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iso3166SubdivisionCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = objc_alloc(MEMORY[0x1E0CAA378]);
      if (v15)
        v17 = objc_msgSend(v16, "initWithCountryCode:subdivisionCode:", v12, v15);
      else
        v17 = objc_msgSend(v16, "initWithCountryCode:", v12);
      v20 = (void *)v17;
      v21 = objc_alloc(MEMORY[0x1E0CAA3B0]);
      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithRegion:date:", v20, v22);

      -[ENRegionMonitorCoreLocationDataSource updateRegionVisit:](self, "updateRegionVisit:", v23);
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

      if (v19
        && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
        && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }

  }
  else if (gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
         && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)processLocation:(id)a3 locationsOfInterest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ENRegionMonitorCoreLocationDataSource_processLocation_locationsOfInterest___block_invoke;
  block[3] = &unk_1E87D9EF8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __77__ENRegionMonitorCoreLocationDataSource_processLocation_locationsOfInterest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processLocation:locationsOfInterest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_processLocation:(id)a3 locationsOfInterest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ENRegionMonitorCoreLocationDataSource queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0CB3878], "predicateWithBlock:", &__block_literal_global_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0C9E320];
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v18 = objc_alloc(MEMORY[0x1E0C9E3B0]);
        objc_msgSend(v17, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "latitude");
        v21 = v20;
        objc_msgSend(v17, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "longitude");
        v24 = (void *)objc_msgSend(v18, "initWithLatitude:longitude:", v21, v23);

        objc_msgSend(v6, "distanceFromLocation:", v24);
        if (v25 < v11)
        {
          v26 = v25;
          v27 = v17;

          v11 = v26;
          v14 = v27;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

  if (v29
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v32 = v11;
    v30 = v14;
    v31 = v6;
    LogPrintF_safe();
  }
  -[ENRegionMonitorCoreLocationDataSource _processLocation:locationOfInterest:](self, "_processLocation:locationOfInterest:", v6, v14, v30, v31, *(_QWORD *)&v32);

}

BOOL __78__ENRegionMonitorCoreLocationDataSource__processLocation_locationsOfInterest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iso3166SubdivisionCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

  if (v6
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v8 = v9;
    LogPrintF_safe();
  }
  objc_msgSend(v9, "lastObject", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[ENRegionMonitorCoreLocationDataSource _processLocation:](self, "_processLocation:", v7);

}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  void *v5;
  int v6;
  id v7;
  id v8;

  v8 = a4;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

  if (v6
    && gLogCategory_ENRegionMonitorCoreLocationDataSource <= 30
    && (gLogCategory_ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    v7 = v8;
    LogPrintF_safe();
  }
  if ((objc_msgSend(v8, "hasDepartureDate", v7) & 1) == 0)
    -[ENRegionMonitorCoreLocationDataSource _processVisit:](self, "_processVisit:", v8);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory__ENRegionMonitorCoreLocationDataSource <= 90
    && (gLogCategory__ENRegionMonitorCoreLocationDataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (ENRegionMonitorSourceDelegate)delegate
{
  return (ENRegionMonitorSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (ENRegionVisit)cachedRegionVisit
{
  return self->_cachedRegionVisit;
}

- (void)setCachedRegionVisit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedRegionVisit, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
