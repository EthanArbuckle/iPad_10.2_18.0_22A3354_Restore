@implementation NTKSiderealDataSource

- (NTKSiderealDataSource)initWithXR:(BOOL)a3
{
  NTKSiderealDataSource *v4;
  uint64_t v5;
  NSHashTable *observers;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  CLLocation *currentReferenceLocation;
  uint64_t v12;
  NSDate *currentReferenceDate;
  uint64_t v14;
  NTKPromise *currentData;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  CLLocation *v19;
  uint64_t v20;
  NSDate *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NTKSiderealDataSource;
  v4 = -[NTKSiderealDataSource init](&v27, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    v4->_useXR = a3;
    v4->_locationManagerRefCount = 0;
    +[NTKSiderealData loadCached](NTKSiderealData, "loadCached");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && v4->_useXR == objc_msgSend(v7, "useXR"))
    {
      _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: found cached data.", buf, 2u);
      }

      objc_msgSend(v8, "referenceLocation");
      v10 = objc_claimAutoreleasedReturnValue();
      currentReferenceLocation = v4->_currentReferenceLocation;
      v4->_currentReferenceLocation = (CLLocation *)v10;

      objc_msgSend(v8, "referenceDate");
      v12 = objc_claimAutoreleasedReturnValue();
      currentReferenceDate = v4->_currentReferenceDate;
      v4->_currentReferenceDate = (NSDate *)v12;

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __36__NTKSiderealDataSource_initWithXR___block_invoke;
      v24[3] = &unk_1E6BD09D8;
      v25 = v8;
      +[NTKPromise promiseNamed:withBlock:](NTKPromise, "promiseNamed:withBlock:", CFSTR("Cached Sidereal Data"), v24);
      v14 = objc_claimAutoreleasedReturnValue();
      currentData = v4->_currentData;
      v4->_currentData = (NTKPromise *)v14;

    }
    else
    {
      _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: could not find cached data.", buf, 2u);
      }

      +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyLocation");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v4->_currentReferenceLocation;
      v4->_currentReferenceLocation = (CLLocation *)v18;

      +[NTKDate faceDate](NTKDate, "faceDate");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v4->_currentReferenceDate;
      v4->_currentReferenceDate = (NSDate *)v20;

      -[NTKSiderealDataSource _updateData](v4, "_updateData");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v4, sel__updateForSignificantTimeChange_, *MEMORY[0x1E0C998A0], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v4, sel__updateForSignificantTimeChange_, *MEMORY[0x1E0DC4838], 0);

  }
  return v4;
}

id __36__NTKSiderealDataSource_initWithXR___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C998A0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealDataSource;
  -[NTKSiderealDataSource dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  id v5;
  id v6;

  observers = self->_observers;
  v5 = a3;
  -[NSHashTable addObject:](observers, "addObject:", v5);
  -[NTKPromise object](self->_currentData, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceDidUpdateSolarData:", v6);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_updateData
{
  NSObject *v3;
  CLLocation *v4;
  NSDate *v5;
  BOOL useXR;
  CLLocation *v7;
  NSDate *v8;
  NTKPromise *v9;
  NTKPromise *currentData;
  _QWORD v11[4];
  CLLocation *v12;
  NSDate *v13;
  id v14;
  BOOL v15;
  id buf[2];

  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKSiderealDataSource: Updating data", (uint8_t *)buf, 2u);
  }

  v4 = self->_currentReferenceLocation;
  v5 = self->_currentReferenceDate;
  useXR = self->_useXR;
  objc_initWeak(buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__NTKSiderealDataSource__updateData__block_invoke;
  v11[3] = &unk_1E6BD0A00;
  objc_copyWeak(&v14, buf);
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v15 = useXR;
  +[NTKPromise promiseNamed:withBlock:](NTKPromise, "promiseNamed:withBlock:", CFSTR("Sidereal Data Source Load"), v11);
  v9 = (NTKPromise *)objc_claimAutoreleasedReturnValue();
  currentData = self->_currentData;
  self->_currentData = v9;

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

id __36__NTKSiderealDataSource__updateData__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[NTKSiderealDataSource siderealDataForLocation:atDate:useXR:](NTKSiderealDataSource, "siderealDataForLocation:atDate:useXR:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__NTKSiderealDataSource__updateData__block_invoke_2;
    v7[3] = &unk_1E6BCD778;
    v4 = v3;
    v8 = v4;
    v9 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __36__NTKSiderealDataSource__updateData__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "save");
  return objc_msgSend(*(id *)(a1 + 40), "_notifySiderealDataDidUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)_updateDataIfNeededToDate:(id)a3 atLocation:(id)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDate:inSameDayAsDate:", v10, self->_currentReferenceDate);

  if ((v9 & 1) == 0)
    objc_storeStrong((id *)&self->_currentReferenceDate, a3);
  if (v7
    && self->_currentReferenceDate
    && !-[NTKSiderealDataSource _didLocationChangeSignificantlyFromOldLocation:toNewLocation:](self, "_didLocationChangeSignificantlyFromOldLocation:toNewLocation:", self->_currentReferenceLocation, v7))
  {
    if ((v9 & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    objc_storeStrong((id *)&self->_currentReferenceLocation, a4);
  }
  -[NTKSiderealDataSource _updateData](self, "_updateData");
LABEL_8:

}

- (void)_notifySiderealDataDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "solarEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "daytimeEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "waypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] _notifyDidUpdate: solarEvents: %@ dayAngles: %@ waypoints: %@", buf, 0x20u);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_observers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "dataSourceDidUpdateSolarData:", v4, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)updateModelWithDate:(id)a3
{
  -[NTKSiderealDataSource _updateDataIfNeededToDate:atLocation:](self, "_updateDataIfNeededToDate:atLocation:", a3, self->_currentReferenceLocation);
}

- (void)_updateForSignificantTimeChange:(id)a3
{
  void *v4;
  id v5;

  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceDisplayTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealDataSource updateModelWithDate:](self, "updateModelWithDate:", v4);

}

- (void)_locationManagerUpdatedLocation:(id)a3 error:(id)a4
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
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138478083;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "[NTKSiderealDataSource] _locationManagerUpdatedLocation with location:%{private}@ and error:%@", (uint8_t *)&v9, 0x16u);
  }

  -[NTKSiderealDataSource _updateDataIfNeededToDate:atLocation:](self, "_updateDataIfNeededToDate:atLocation:", self->_currentReferenceDate, v6);
}

- (void)startLocationUpdates
{
  int64_t locationManagerRefCount;
  NSObject *v4;
  void *v5;
  NSString *v6;
  NSString *locationManagerToken;
  _QWORD v8[4];
  id v9;
  id buf[2];

  locationManagerRefCount = self->_locationManagerRefCount;
  if (!locationManagerRefCount)
  {
    _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] startLocationUpdates", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__NTKSiderealDataSource_startLocationUpdates__block_invoke;
    v8[3] = &unk_1E6BD0A28;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v5, "startLocationUpdatesWithIdentifier:handler:", CFSTR("ntk.sidereal.controller"), v8);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    locationManagerToken = self->_locationManagerToken;
    self->_locationManagerToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
    locationManagerRefCount = self->_locationManagerRefCount;
  }
  self->_locationManagerRefCount = locationManagerRefCount + 1;
}

void __45__NTKSiderealDataSource_startLocationUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_locationManagerUpdatedLocation:error:", v7, v6);

}

- (void)stopLocationUpdates
{
  int64_t v2;
  NSObject *v4;
  void *v5;
  NSString *locationManagerToken;
  uint8_t v7[16];

  v2 = self->_locationManagerRefCount - 1;
  self->_locationManagerRefCount = v2;
  if (!v2)
  {
    _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] stopLocationUpdates", v7, 2u);
    }

    if (self->_locationManagerToken)
    {
      +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopLocationUpdatesForToken:", self->_locationManagerToken);

      locationManagerToken = self->_locationManagerToken;
      self->_locationManagerToken = 0;

    }
  }
}

- (void)ensureLocation:(id)a3
{
  -[NTKSiderealDataSource _locationManagerUpdatedLocation:error:](self, "_locationManagerUpdatedLocation:error:", a3, 0);
}

- (BOOL)_didLocationChangeSignificantlyFromOldLocation:(id)a3 toNewLocation:(id)a4
{
  double v4;
  double v5;
  NSObject *v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "distanceFromLocation:", a4);
  v5 = v4;
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] _didLocationChangeSignificantlyFromOldLocation:newLocation: %f", (uint8_t *)&v8, 0xCu);
  }

  return v5 >= 250000.0;
}

+ (id)siderealDataForLocation:(id)a3 atDate:(id)a4 useXR:(BOOL)a5
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  NSObject *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  _DWORD *v23;
  unint64_t i;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NTKSiderealData *v38;
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "+[NTKSiderealDataSource siderealDataForLocation:atDate:useXR:]";
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s", buf, 0xCu);
  }

  v36 = v6;
  +[NTKSiderealDataSource _geoLocationForLocation:](NTKSiderealDataSource, "_geoLocationForLocation:", v6);
  v10 = v9;
  v12 = v11;
  objc_msgSend(off_1E6BCA6B8, "transitInfoForDate:location:sunAltitude:", v7);
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v13;
    _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] Updated sunrise/sunset transit info: %@", buf, 0xCu);
  }

  v15 = v13;
  objc_msgSend(v13, "solarNoon");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270E0]), "initWithLocation:date:body:", v16, 0, v10, v12);
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v17, "altitude");
    *(_DWORD *)buf = 134217984;
    v40 = v19;
    _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] solar noon altitude: %f", buf, 0xCu);
  }
  v34 = v17;

  NTKStartOfDayForDate(v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  NTKEndOfDayForDate(v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v16;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v16);
  v23 = malloc_type_malloc(0x5A4uLL, 0x100004052888210uLL);
  for (i = 0; i != 361; ++i)
  {
    NTKInterpolateBetweenDates(v20, v22, (float)((float)i / 360.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270E0]), "initWithLocation:date:body:", v25, 0, v10, v12);
    objc_msgSend(v26, "altitude");
    CLKMapFractionIntoRange();
    *(float *)&v27 = v27;
    v23[i] = LODWORD(v27);

  }
  +[NTKSiderealDataSource _solarEventsForLocation:atDate:](NTKSiderealDataSource, "_solarEventsForLocation:atDate:", v7, v10, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSiderealDataSource _solarSectorsForEvents:](NTKSiderealDataSource, "_solarSectorsForEvents:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSiderealDataSource _dayEventsFromEvents:](NTKSiderealDataSource, "_dayEventsFromEvents:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSiderealDataSource _waypointsForTransitInfo:andEvents:](NTKSiderealDataSource, "_waypointsForTransitInfo:andEvents:", v15, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = a5;
  v38 = -[NTKSiderealData initWithReferenceDate:referenceLocation:sunriseSunsetInfo:solarEvents:daytimeEvents:sectors:waypoints:altitudes:useXR:]([NTKSiderealData alloc], "initWithReferenceDate:referenceLocation:sunriseSunsetInfo:solarEvents:daytimeEvents:sectors:waypoints:altitudes:useXR:", v21, v36, v15, v28, v30, v29, v31, v23, v33);
  free(v23);

  return v38;
}

+ (id)_solarEventsForLocation:(id)a3 atDate:(id)a4
{
  double var1;
  double var0;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  var1 = a3.var1;
  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  NTKStartOfDayForDate(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKEndOfDayForDate(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0D27558]);
  v14 = (void *)objc_msgSend(v13, "initWithLocation:time:altitudeInDegrees:accuracy:", var0, var1, v10, *MEMORY[0x1E0D26430], 60.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  do
  {
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) <= 9 && ((0x1EFu >> v16) & 1) != 0)
    {
      objc_msgSend(v14, "nextEventOfType:", dword_1B755E028[v16]);
      if (v18 != 0.0 && v18 < v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKSiderealDataSource _eventWithType:time:](NTKSiderealDataSource, "_eventWithType:time:", v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
    }
    v16 = v17;
  }
  while (v17 != 9);
  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_39);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[NTKSiderealDataSource _startOfDayEventPreceedingFirstSolarEvent:](NTKSiderealDataSource, "_startOfDayEventPreceedingFirstSolarEvent:", objc_msgSend(v23, "type"));

    objc_msgSend(v22, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[NTKSiderealDataSource _endOfDayEventFollowingSolarEvent:](NTKSiderealDataSource, "_endOfDayEventFollowingSolarEvent:", objc_msgSend(v25, "type"));

  }
  else
  {
    if (geo_isDayLightForLocation())
      v24 = 5;
    else
      v24 = 0;
    v26 = v24;
  }
  +[NTKSiderealSolarEvent eventWithType:degree:](NTKSiderealSolarEvent, "eventWithType:degree:", v24, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "insertObject:atIndex:", v27, 0);
  +[NTKSiderealSolarEvent eventWithType:degree:](NTKSiderealSolarEvent, "eventWithType:degree:", v26, 360.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v28);
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "+[NTKSiderealDataSource _solarEventsForLocation:atDate:]";
    v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated solar events: %@", buf, 0x16u);
  }

  v30 = (void *)objc_msgSend(v22, "copy");
  return v30;
}

uint64_t __56__NTKSiderealDataSource__solarEventsForLocation_atDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_dayEventsFromEvents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_175);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredOrderedSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[NTKSiderealDataSource _dayEventsFromEvents:].cold.1(v11);

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedSetWithObjects:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[NTKSiderealDataSource _dayEventsFromEvents:]";
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated day events: %@", buf, 0x16u);
  }

  v13 = (void *)objc_msgSend(v10, "copy");
  return v13;
}

BOOL __46__NTKSiderealDataSource__dayEventsFromEvents___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "type") - 4) < 3;
}

+ (id)_solarSectorsForEvents:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NTKSiderealSector *v8;
  void *v9;
  double v10;
  float v11;
  void *v12;
  double v13;
  float v14;
  double v15;
  __int128 v16;
  __float2 v17;
  __float2 v18;
  __float2 v19;
  void *v20;
  __int128 v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", ++v5 % objc_msgSend(v3, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NTKSiderealSector initWithStartingEvent:endingEvent:]([NTKSiderealSector alloc], "initWithStartingEvent:endingEvent:", v6, v7);
      if (!-[NTKSiderealSector type](v8, "type"))
      {
        -[NTKSiderealSector startingEvent](v8, "startingEvent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "angle");
        v11 = 4.71238898 - v10;

        -[NTKSiderealSector endingEvent](v8, "endingEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "angle");
        v14 = 4.71238898 - v13;

        v15 = 0.0;
        if (vabds_f32(v14, v11) > 3.14159265)
        {
          v17 = __sincosf_stret(v11);
          *(_QWORD *)&v16 = __PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval));
          v22 = v16;
          v18 = __sincosf_stret(v14);
          v15 = COERCE_DOUBLE(vmul_f32(vadd_f32(*(float32x2_t *)&v22, (float32x2_t)__PAIR64__(LODWORD(v18.__sinval), LODWORD(v18.__cosval))), (float32x2_t)0x3F0000003F000000));
        }
        -[NTKSiderealSector setGradientStartPoint:](v8, "setGradientStartPoint:", v15, v22);
        v19 = __sincosf_stret((float)(v11 + v14) * 0.5);
        -[NTKSiderealSector setGradientEndPoint:](v8, "setGradientEndPoint:", COERCE_DOUBLE(__PAIR64__(LODWORD(v19.__sinval), LODWORD(v19.__cosval))));
      }
      objc_msgSend(v4, "addObject:", v8);

    }
    while (objc_msgSend(v3, "count") - 1 > v5);
  }
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

+ (id)_waypointsForTransitInfo:(id)a3 andEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "solarNoon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "solarNoon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v9);
    +[NTKSiderealDataSource _solarPercentageToDegree:](NTKSiderealDataSource, "_solarPercentageToDegree:");
    +[NTKSiderealWaypoint waypointWithType:degree:](NTKSiderealWaypoint, "waypointWithType:degree:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  objc_msgSend(v5, "solarMidnight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "solarMidnight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v12);
    +[NTKSiderealDataSource _solarPercentageToDegree:](NTKSiderealDataSource, "_solarPercentageToDegree:");
    +[NTKSiderealWaypoint waypointWithType:degree:](NTKSiderealWaypoint, "waypointWithType:degree:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__NTKSiderealDataSource__waypointsForTransitInfo_andEvents___block_invoke;
  v18[3] = &unk_1E6BD0AD0;
  v14 = v7;
  v19 = v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "+[NTKSiderealDataSource _waypointsForTransitInfo:andEvents:]";
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_INFO, "[NTKSiderealDataSource] %s: updated waypoints: %@", buf, 0x16u);
  }

  v16 = (void *)objc_msgSend(v14, "copy");
  return v16;
}

void __60__NTKSiderealDataSource__waypointsForTransitInfo_andEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "type") != 5 && objc_msgSend(v5, "type"))
  {
    v3 = *(void **)(a1 + 32);
    +[NTKSiderealWaypoint waypointFromSolarEvent:](NTKSiderealWaypoint, "waypointFromSolarEvent:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

+ (id)_eventWithType:(int64_t)a3 time:(id)a4
{
  id v5;
  double v6;
  void *v7;

  v5 = a4;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v5);
  +[NTKSiderealSolarEvent eventWithType:time:degree:](NTKSiderealSolarEvent, "eventWithType:time:degree:", a3, v5, v6 * 360.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)_startOfDayEventPreceedingFirstSolarEvent:(int64_t)a3
{
  if (a3 >= 1)
    return a3 - 1;
  else
    return 9;
}

+ (int64_t)_endOfDayEventFollowingSolarEvent:(int64_t)a3
{
  if (a3 <= 8)
    return a3 + 1;
  else
    return 0;
}

+ (BOOL)_date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "compare:", a4) != -1 && objc_msgSend(v7, "compare:", v8) != 1;

  return v9;
}

+ (double)_solarPercentageToDegree:(double)a3
{
  return a3 * 360.0;
}

+ (double)reverseInterpolateBetweenCalendricalMidnights:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;

  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (!reverseInterpolateBetweenCalendricalMidnights___currentCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)reverseInterpolateBetweenCalendricalMidnights___currentCalendar;
    reverseInterpolateBetweenCalendricalMidnights___currentCalendar = v6;

  }
  if (!reverseInterpolateBetweenCalendricalMidnights___cachedDate
    || (objc_msgSend((id)reverseInterpolateBetweenCalendricalMidnights___currentCalendar, "isDate:inSameDayAsDate:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&reverseInterpolateBetweenCalendricalMidnights___cachedDate, a3);
    NTKStartOfDayForDate(v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay;
    reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay = v8;

    NTKStartOfNextDayForDate(v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay;
    reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay = v10;

  }
  v12 = NTKPercentageOfDayDoneForDateWithStartAndEnd(v4, (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfDay, (void *)reverseInterpolateBetweenCalendricalMidnights___cachedStartOfNextDay);
  objc_sync_exit(v5);

  return v12;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = a3;
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  objc_msgSend(v3, "coordinate");
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_currentReferenceLocation, 0);
  objc_storeStrong((id *)&self->_currentReferenceDate, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_dayEventsFromEvents:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "+[NTKSiderealDataSource _dayEventsFromEvents:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "[NTKSiderealDataSource] %s: Something has gone wrong calculating day events. We found none or 1, which isn't good. daytimeEvents: %@", (uint8_t *)&v1, 0x16u);
}

@end
