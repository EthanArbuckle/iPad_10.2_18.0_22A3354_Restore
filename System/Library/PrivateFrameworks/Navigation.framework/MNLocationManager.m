@implementation MNLocationManager

+ (id)sharedLocationManager
{
  if (qword_1ED0C4020 != -1)
    dispatch_once(&qword_1ED0C4020, &__block_literal_global_30);
  return (id)_MergedGlobals_35;
}

void __42__MNLocationManager_sharedLocationManager__block_invoke()
{
  MNLocationManager *v0;
  void *v1;

  v0 = objc_alloc_init(MNLocationManager);
  v1 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v0;

}

- (MNLocationManager)init
{
  MNLocationManager *v2;
  NSLock *v3;
  NSLock *observersLock;
  NSLock *v5;
  NSLock *lastLocationLock;
  GEOLocationShifter *v7;
  GEOLocationShifter *locationShifter;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MNLocationManager;
  v2 = -[MNLocationManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    observersLock = v2->_observersLock;
    v2->_observersLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lastLocationLock = v2->_lastLocationLock;
    v2->_lastLocationLock = v5;

    v7 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v7;

    v2->_locationProviderType = 0;
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTileGroupObserver:queue:", v2, MEMORY[0x1E0C80D38]);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MNLocationManager;
  -[MNLocationManager dealloc](&v4, sel_dealloc);
}

- (void)setLocationCorrector:(id)a3
{
  void *v4;
  id locationCorrector;
  void *v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  MNLocation *v11;
  _BYTE v12[156];

  if (self->_locationCorrector != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    locationCorrector = self->_locationCorrector;
    self->_locationCorrector = v4;

    -[MNLocationManager lastLocation](self, "lastLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void (**)(id, void *))self->_locationCorrector;
      if (v7)
      {
        v7[2](v7, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNLocationManager setLastLocation:](self, "setLastLocation:", v8);
LABEL_7:

        goto LABEL_8;
      }
      if ((objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      {
        v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v6, "clientLocation");
        objc_msgSend(v6, "coarseMetaData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v9, "initWithClientLocation:coarseMetaData:", v12, v10);

        v11 = -[MNLocation initWithRawLocation:]([MNLocation alloc], "initWithRawLocation:", v8);
        -[MNLocationManager setLastLocation:](self, "setLastLocation:", v11);

        goto LABEL_7;
      }
    }
LABEL_8:

  }
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)-[MNLocationProvider effectiveBundleIdentifier](self->_locationProvider, "effectiveBundleIdentifier");
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, a3);
  v5 = a3;
  -[MNLocationProvider setEffectiveBundleIdentifier:](self->_locationProvider, "setEffectiveBundleIdentifier:", v5);

}

- (NSBundle)effectiveBundle
{
  return (NSBundle *)-[MNLocationProvider effectiveBundle](self->_locationProvider, "effectiveBundle");
}

- (void)setEffectiveBundle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_effectiveBundle, a3);
  v5 = a3;
  -[MNLocationProvider setEffectiveBundle:](self->_locationProvider, "setEffectiveBundle:", v5);

}

- (BOOL)isHeadingServicesAvailable
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "headingAvailable");
}

- (MNLocation)lastLocation
{
  MNLocation *v3;

  -[NSLock lock](self->_lastLocationLock, "lock");
  v3 = self->_lastLocation;
  -[NSLock unlock](self->_lastLocationLock, "unlock");
  return v3;
}

- (void)setLastLocation:(id)a3
{
  MNLocation *v5;

  v5 = (MNLocation *)a3;
  -[NSLock lock](self->_lastLocationLock, "lock");
  if (self->_lastLocation != v5)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    -[CLLocation _navigation_setGtLog:](self->_lastLocation, "_navigation_setGtLog:", 1);
  }
  -[NSLock unlock](self->_lastLocationLock, "unlock");

}

- (BOOL)coarseModeEnabled
{
  return -[MNLocationProvider coarseModeEnabled](self->_locationProvider, "coarseModeEnabled");
}

- (double)expectedGpsUpdateInterval
{
  return self->_expectedGpsUpdateInterval;
}

- (double)timeScale
{
  void *v2;
  double v3;
  double v4;

  -[MNLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeScale");
  v4 = v3;

  return v4;
}

- (int)headingOrientation
{
  void *v2;
  int v3;

  -[MNLocationManager locationProvider](self, "locationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "headingOrientation");

  return v3;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MNLocationManager locationProvider](self, "locationProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeadingOrientation:", v3);

}

- (void)addLocationListener:(id)a3
{
  NSHashTable *locationListeners;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  locationListeners = self->_locationListeners;
  if (!locationListeners)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 5);
    v6 = self->_locationListeners;
    self->_locationListeners = v5;

    locationListeners = self->_locationListeners;
  }
  if (!-[NSHashTable containsObject:](locationListeners, "containsObject:", v7))
    -[NSHashTable addObject:](self->_locationListeners, "addObject:", v7);
  -[NSLock unlock](self->_observersLock, "unlock");

}

- (void)removeLocationListener:(id)a3
{
  NSLock *observersLock;
  id v5;

  observersLock = self->_observersLock;
  v5 = a3;
  -[NSLock lock](observersLock, "lock");
  -[NSHashTable removeObject:](self->_locationListeners, "removeObject:", v5);

  -[NSLock unlock](self->_observersLock, "unlock");
}

- (void)setLocationProviderType:(unint64_t)a3
{
  __CFString *v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_locationProviderType != a3)
  {
    if (a3 > 4)
      v5 = 0;
    else
      v5 = off_1E61D70F0[a3];
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138477827;
      v8 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "MNLocationManager setting provider type to [%{private}@]", (uint8_t *)&v7, 0xCu);
    }

    self->_locationProviderType = a3;
  }
}

- (void)setLocationProvider:(id)a3
{
  MNLocationProvider *v5;
  MNLocationProvider *locationProvider;
  id *p_locationProvider;
  MNLocationProvider *v8;
  MNLocationProvider *v9;
  MNLocationProvider *v10;

  v5 = (MNLocationProvider *)a3;
  p_locationProvider = (id *)&self->_locationProvider;
  locationProvider = self->_locationProvider;
  if (locationProvider != v5)
  {
    v10 = v5;
    if (locationProvider)
    {
      -[MNLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 0);
      v8 = self->_locationProvider;
    }
    else
    {
      v8 = 0;
    }
    if (self->_trackingHeading)
    {
      -[MNLocationProvider stopUpdatingHeading](v8, "stopUpdatingHeading");
      v8 = (MNLocationProvider *)*p_locationProvider;
    }
    self->_expectedGpsUpdateInterval = 0.0;
    -[MNLocationProvider setDelegate:](v8, "setDelegate:", 0);
    v9 = self->_locationProvider;
    self->_locationProvider = 0;

    -[MNLocationManager setLastLocation:](self, "setLastLocation:", 0);
    v5 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&self->_locationProvider, a3);
      -[MNLocationProvider setEffectiveBundle:](self->_locationProvider, "setEffectiveBundle:", self->_effectiveBundle);
      -[MNLocationProvider setEffectiveBundleIdentifier:](self->_locationProvider, "setEffectiveBundleIdentifier:", self->_effectiveBundleIdentifier);
      -[MNLocationProvider setDelegate:](self->_locationProvider, "setDelegate:", self);
      -[MNLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 1);
      v5 = v10;
      if (self->_trackingHeading)
      {
        objc_msgSend(*p_locationProvider, "startUpdatingHeading");
        v5 = v10;
      }
    }
  }

}

- (void)stop
{
  CLHeading *heading;

  -[MNLocationManager setLocationProviderType:](self, "setLocationProviderType:", 0);
  -[MNLocationManager setLocationProvider:](self, "setLocationProvider:", 0);
  -[MNLocationManager setLastLocation:](self, "setLastLocation:", 0);
  heading = self->_heading;
  self->_heading = 0;

}

- (void)useGPSLocationProviderWithCLParameters:(id)a3
{
  id v4;
  MNCoreLocationProvider *v5;

  v4 = a3;
  -[MNLocationManager setLocationProviderType:](self, "setLocationProviderType:", 1);
  v5 = objc_alloc_init(MNCoreLocationProvider);
  -[MNLocationManager setLocationProvider:](self, "setLocationProvider:", v5);
  -[MNCoreLocationProvider setCLParameters:](v5, "setCLParameters:", v4);

}

- (void)useHybridLocationProvider
{
  MNHybridLocationProvider *v3;

  -[MNLocationManager setLocationProviderType:](self, "setLocationProviderType:", 2);
  v3 = objc_alloc_init(MNHybridLocationProvider);
  -[MNLocationManager setLocationProvider:](self, "setLocationProvider:", v3);

}

- (void)useTraceLocationProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[MNLocationManager setLocationProviderType:](self, "setLocationProviderType:", 3);
  -[MNLocationManager setLocationProvider:](self, "setLocationProvider:", v4);

}

- (void)useSimulationLocationProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[MNLocationManager setLocationProviderType:](self, "setLocationProviderType:", 4);
  -[MNLocationManager setLocationProvider:](self, "setLocationProvider:", v4);

}

- (void)startLocationUpdateWithObserver:(id)a3
{
  NSHashTable *locationObservers;
  BOOL v5;
  NSHashTable *v6;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  locationObservers = self->_locationObservers;
  if (locationObservers)
  {
    v5 = -[NSHashTable containsObject:](locationObservers, "containsObject:", v11);
    v6 = self->_locationObservers;
    if (v6)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
  v7 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 5);
  v8 = self->_locationObservers;
  self->_locationObservers = v7;

  v6 = self->_locationObservers;
LABEL_6:
  if (!-[NSHashTable containsObject:](v6, "containsObject:", v11))
    -[NSHashTable addObject:](self->_locationObservers, "addObject:", v11);
  -[NSLock unlock](self->_observersLock, "unlock");
  if (!v5)
  {
    if (self->_trackingLocation)
    {
      -[MNLocationManager lastLocation](self, "lastLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v11, "locationManagerUpdatedLocation:", self);
    }
    else
    {
      -[MNLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 1);
    }
  }
  if ((-[MNLocationProvider isAuthorized](self->_locationProvider, "isAuthorized") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:", 18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocationManager _reportLocationFailureWithError:](self, "_reportLocationFailureWithError:", v10);

  }
}

- (void)stopLocationUpdateWithObserver:(id)a3
{
  NSUInteger v4;
  id v5;

  v5 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  if (-[NSHashTable containsObject:](self->_locationObservers, "containsObject:", v5))
  {
    -[NSHashTable removeObject:](self->_locationObservers, "removeObject:", v5);
    v4 = -[NSHashTable count](self->_locationObservers, "count");
    -[NSLock unlock](self->_observersLock, "unlock");
    if (!v4)
      -[MNLocationManager _setTrackingLocation:](self, "_setTrackingLocation:", 0);
  }
  else
  {
    -[NSLock unlock](self->_observersLock, "unlock");
  }

}

- (void)startHeadingUpdateWithObserver:(id)a3
{
  id v4;
  NSHashTable *headingObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[MNLocationManager isHeadingServicesAvailable](self, "isHeadingServicesAvailable"))
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315906;
      v10 = "-[MNLocationManager startHeadingUpdateWithObserver:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocationManager.m";
      v13 = 1024;
      v14 = 353;
      v15 = 2080;
      v16 = "self.isHeadingServicesAvailable";
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }

  }
  headingObservers = self->_headingObservers;
  if (!headingObservers)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 5);
    v7 = self->_headingObservers;
    self->_headingObservers = v6;

    headingObservers = self->_headingObservers;
  }
  if (!-[NSHashTable containsObject:](headingObservers, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_headingObservers, "addObject:", v4);
    -[MNLocationManager _setTrackingHeading:](self, "_setTrackingHeading:", 1);
  }

}

- (void)stopHeadingUpdateWithObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_headingObservers, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_headingObservers, "removeObject:", v4);
    if (!-[NSHashTable count](self->_headingObservers, "count"))
      -[MNLocationManager _setTrackingHeading:](self, "_setTrackingHeading:", 0);
  }

}

- (void)pushLocation:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Pushing external location: %{private}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__MNLocationManager_pushLocation___block_invoke;
    v6[3] = &unk_1E61D7080;
    objc_copyWeak(&v8, (id *)buf);
    v7 = v4;
    -[MNLocationManager _shiftLocationIfNecessary:handler:](self, "_shiftLocationIfNecessary:handler:", v7, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }

}

void __34__MNLocationManager_pushLocation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updateForNewShiftedLocation:rawLocation:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_createLocationAssertion
{
  void *v3;
  void *v4;
  CLInUseAssertion *v5;
  CLInUseAssertion *locationAssertion;
  NSObject *v7;
  CLInUseAssertion *v8;
  uint8_t buf[4];
  CLInUseAssertion *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_locationAssertion)
  {
    v3 = (void *)MEMORY[0x1E0C9E3A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location access requested for: %@"), self->_accessRequesters);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CLInUseAssertion *)objc_msgSend(v3, "newAssertionForBundleIdentifier:withReason:", CFSTR("com.apple.Maps"), v4);
    locationAssertion = self->_locationAssertion;
    self->_locationAssertion = v5;

    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_locationAssertion;
      *(_DWORD *)buf = 138477827;
      v10 = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "Creating location assertion. Assertion object: %{private}@", buf, 0xCu);
    }

  }
}

- (void)_clearLocationAssertion
{
  NSObject *v3;
  CLInUseAssertion *locationAssertion;
  CLInUseAssertion *v5;
  int v6;
  CLInUseAssertion *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_locationAssertion)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      locationAssertion = self->_locationAssertion;
      v6 = 138477827;
      v7 = locationAssertion;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "Invalidating location assertion: %{private}@", (uint8_t *)&v6, 0xCu);
    }

    -[CLInUseAssertion invalidate](self->_locationAssertion, "invalidate");
    v5 = self->_locationAssertion;
    self->_locationAssertion = 0;

  }
}

- (BOOL)_hasLocationAssertion
{
  return self->_locationAssertion != 0;
}

- (void)requestLocationAccessFor:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *accessRequesters;
  NSHashTable *v7;
  NSHashTable *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138477827;
      v10 = v4;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "Location access requested by %{private}@", (uint8_t *)&v9, 0xCu);
    }

    accessRequesters = self->_accessRequesters;
    if (!accessRequesters)
    {
      v7 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      v8 = self->_accessRequesters;
      self->_accessRequesters = v7;

      accessRequesters = self->_accessRequesters;
    }
    -[NSHashTable addObject:](accessRequesters, "addObject:", v4);
    -[MNLocationManager _createLocationAssertion](self, "_createLocationAssertion");
  }

}

- (void)removeLocationAccessFor:(id)a3
{
  id v4;
  NSHashTable *accessRequesters;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    accessRequesters = self->_accessRequesters;
    if (accessRequesters)
    {
      if (-[NSHashTable containsObject:](accessRequesters, "containsObject:", v4))
      {
        GEOFindOrCreateLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v7 = 138477827;
          v8 = v4;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "Location access released for %{private}@", (uint8_t *)&v7, 0xCu);
        }

        -[NSHashTable removeObject:](self->_accessRequesters, "removeObject:", v4);
      }
      if (!-[NSHashTable count](self->_accessRequesters, "count"))
        -[MNLocationManager _clearLocationAssertion](self, "_clearLocationAssertion");
    }
  }

}

- (void)removeLocationAccessForAll
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "Location access released for all", v4, 2u);
  }

  -[NSHashTable removeAllObjects](self->_accessRequesters, "removeAllObjects");
  -[MNLocationManager _clearLocationAssertion](self, "_clearLocationAssertion");
}

- (void)startMonitoringForRegion:(id)a3
{
  -[MNLocationProvider startMonitoringForRegion:](self->_locationProvider, "startMonitoringForRegion:", a3);
}

- (void)stopMonitoringForRegion:(id)a3
{
  -[MNLocationProvider stopMonitoringForRegion:](self->_locationProvider, "stopMonitoringForRegion:", a3);
}

- (void)_reset
{
  if (self->_trackingLocation)
  {
    -[MNLocationManager setLastLocation:](self, "setLastLocation:", 0);
    -[MNLocationManager _reportLocationReset](self, "_reportLocationReset");
  }
}

- (void)_setTrackingLocation:(BOOL)a3
{
  double v4;
  MNLocationProvider *locationProvider;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_trackingLocation != a3)
  {
    if (a3)
    {
      self->_trackingLocation = 1;
      -[MNLocationProvider startUpdatingLocation](self->_locationProvider, "startUpdatingLocation");
      -[MNLocationProvider expectedGpsUpdateInterval](self->_locationProvider, "expectedGpsUpdateInterval");
      self->_expectedGpsUpdateInterval = v4;
    }
    else
    {
      locationProvider = self->_locationProvider;
      if (!locationProvider)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("location provider should be non nil"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = 136316162;
          v9 = "-[MNLocationManager _setTrackingLocation:]";
          v10 = 2080;
          v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocationManager.m";
          v12 = 1024;
          v13 = 489;
          v14 = 2080;
          v15 = "_locationProvider != NULL";
          v16 = 2112;
          v17 = v6;
          _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
        }

        locationProvider = self->_locationProvider;
      }
      self->_expectedGpsUpdateInterval = 0.0;
      -[MNLocationProvider stopUpdatingLocation](locationProvider, "stopUpdatingLocation");
      self->_trackingLocation = 0;
    }
  }
}

- (void)_setTrackingHeading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_trackingHeading != a3)
  {
    v3 = a3;
    -[MNLocationManager locationProvider](self, "locationProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "startUpdatingHeading");
      LOBYTE(v3) = 1;
    }
    else
    {
      objc_msgSend(v5, "stopUpdatingHeading");
    }

    self->_trackingHeading = v3;
  }
}

- (void)_shiftLocationIfNecessary:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  dispatch_group_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  GEOLocationShifter *locationShifter;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  GEOLocationShifter *v32;
  double v33;
  double v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 *v40;
  _QWORD *v41;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD *v44;
  _QWORD v45[6];
  _QWORD v46[4];
  NSObject *v47;
  __int128 *p_buf;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _DWORD v57[7];
  __int128 buf;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_22;
  MNGetPuckTrackingLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::_shiftLocationIfNecessary:handler:", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v6, "coordinate");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "rawCoordinate");
  v15 = v14;
  v17 = v16;
  if (!-[MNLocationProvider isTracePlayer](self->_locationProvider, "isTracePlayer")
    || (unint64_t)-[MNLocationProvider traceVersion](self->_locationProvider, "traceVersion") > 0x30)
  {
    if (objc_msgSend(v6, "referenceFrame") == 2)
    {
      v19 = 0;
      if (v6)
        goto LABEL_9;
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v11, v13);
      if (v6)
      {
LABEL_9:
        objc_msgSend(v6, "clientLocation");
        if (v57[2] == 2)
        {
          objc_msgSend(v6, "rawCoordinate");
          objc_msgSend(v6, "setRawShiftedCoordinate:");
          v18 = 0;
          goto LABEL_14;
        }
LABEL_13:
        v18 = objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v15, v17);
        goto LABEL_14;
      }
    }
    v56 = 0u;
    memset(v57, 0, sizeof(v57));
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    goto LABEL_13;
  }
  v18 = objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v15, v17);
  v19 = 0;
LABEL_14:
  if ((v19 & 1) != 0 || (v18 & 1) != 0)
  {
    v20 = dispatch_group_create();
    v21 = v20;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v59 = 0x3010000000;
    v60 = &unk_1B0C0A341;
    v61 = v11;
    v62 = v13;
    v22 = MEMORY[0x1E0C809B0];
    if (v19)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_48;
      v46[3] = &unk_1E61D70A8;
      p_buf = &buf;
      v23 = v20;
      v47 = v23;
      v24 = (void *)MEMORY[0x1B5E0E364](v46);
      dispatch_group_enter(v23);
      locationShifter = self->_locationShifter;
      objc_msgSend(v6, "horizontalAccuracy");
      v27 = v26;
      v28 = MEMORY[0x1E0C80D38];
      v29 = MEMORY[0x1E0C80D38];
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v24, 0, &__block_literal_global_47, v28, v11, v13, v27);

    }
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3010000000;
    v45[3] = &unk_1B0C0A341;
    *(double *)&v45[4] = v15;
    *(double *)&v45[5] = v17;
    if (v18)
    {
      v42[0] = v22;
      v42[1] = 3221225472;
      v42[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_2;
      v42[3] = &unk_1E61D70A8;
      v44 = v45;
      v30 = v21;
      v43 = v30;
      v31 = (void *)MEMORY[0x1B5E0E364](v42);
      dispatch_group_enter(v30);
      v32 = self->_locationShifter;
      objc_msgSend(v6, "horizontalAccuracy");
      v34 = v33;
      v35 = MEMORY[0x1E0C80D38];
      v36 = MEMORY[0x1E0C80D38];
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v32, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v31, 0, &__block_literal_global_47, v35, v15, v17, v34);

    }
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_3;
    v37[3] = &unk_1E61D70D0;
    v38 = v6;
    v40 = &buf;
    v41 = v45;
    v39 = v7;
    dispatch_group_notify(v21, MEMORY[0x1E0C80D38], v37);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
LABEL_22:

}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "Unable to shift location with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_48(uint64_t a1, double a2, double a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __55__MNLocationManager__shiftLocationIfNecessary_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  MNLocation *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];

  v24 = 0u;
  memset(v25, 0, 28);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  memset(&v18[2], 0, 32);
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "clientLocation");
    v2 = *(void **)(a1 + 32);
  }
  *(_OWORD *)((char *)&v18[2] + 4) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  *(_QWORD *)((char *)v25 + 4) = 0x200000002;
  objc_msgSend(v2, "matchInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [MNLocation alloc];
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v5, "matchInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    v17 = v24;
    v18[0] = v25[0];
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)((char *)v25 + 12);
    v12 = v19;
    v13 = v20;
    v14 = v21;
    v15 = v22;
    v10 = v18[2];
    v11 = v18[3];
    v7 = -[MNLocation initWithClientLocation:matchInfo:](v4, "initWithClientLocation:matchInfo:", &v10, v6);
  }
  else
  {
    objc_msgSend(v5, "coarseMetaData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    v17 = v24;
    v18[0] = v25[0];
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)((char *)v25 + 12);
    v12 = v19;
    v13 = v20;
    v14 = v21;
    v15 = v22;
    v10 = v18[2];
    v11 = v18[3];
    v7 = -[MNLocation initWithClientLocation:coarseMetaData:](v4, "initWithClientLocation:coarseMetaData:", &v10, v6);
  }
  v8 = (void *)v7;

  objc_msgSend(v8, "setRawShiftedCoordinate:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUuid:", v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateForNewShiftedLocation:(id)a3 rawLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MNGetPuckTrackingLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::_updateForNewShiftedLocation:rawLocation:", (uint8_t *)&v14, 0xCu);

  }
  v10 = v6;
  v11 = v10;
  if (self->_locationCorrector)
  {
    MNGetPuckTrackingLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling _locationCorrector()", (uint8_t *)&v14, 0xCu);

    }
    (*((void (**)(void))self->_locationCorrector + 2))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MNLocationRecorder recordLocation:rawLocation:](self->_locationRecorder, "recordLocation:rawLocation:", v11, v7);
  if (v11)
  {
    objc_msgSend(v11, "_navigation_setGtLog:", 1);
    -[MNLocationManager setLastLocation:](self, "setLastLocation:", v11);
    -[MNLocationManager _reportLocationSuccess](self, "_reportLocationSuccess");
  }

}

- (void)_reportLocationSuccess
{
  -[MNLocationManager _reportLocationStatus:](self, "_reportLocationStatus:", sel_locationManagerUpdatedLocation_);
}

- (void)_reportLocationFailureWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13++), "locationManagerFailedToUpdateLocation:withError:", self, v4);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "locationManagerFailedToUpdateLocation:withError:", self, v4, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)_reportLocationReset
{
  -[MNLocationManager _reportLocationStatus:](self, "_reportLocationStatus:", sel_locationManagerDidReset_);
}

- (void)_reportLocationStatus:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", a3, self);
  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", a3, self);

}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  double v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MNGetPuckTrackingLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationManager::didUpdateLocation:", buf, 0xCu);

  }
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v25 = v7;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "Received location from location provider: %{private}@", buf, 0xCu);
  }

  if (-[MNLocationProvider isAuthorized](self->_locationProvider, "isAuthorized"))
  {
    if (v7)
    {
      objc_msgSend(v7, "coordinate");
      if (v11 == 0.0 && (objc_msgSend(v7, "coordinate"), v12 == 0.0)
        || (objc_msgSend(v7, "rawCoordinate"), v13 == 0.0) && (objc_msgSend(v7, "rawCoordinate"), v14 == 0.0))
      {
        -[MNLocationRecorder recordLocation:rawLocation:](self->_locationRecorder, "recordLocation:rawLocation:", v7, v7);
      }
      else
      {
        if (!self->_trackingLocation)
        {
          -[MNLocationManager locationProvider](self, "locationProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stopUpdatingLocation");

        }
        objc_msgSend(v7, "course");
        if (v17 < 0.0)
        {
          GEOFindOrCreateLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_INFO, "Location quality: course is < 0", buf, 2u);
          }

        }
        objc_msgSend(v7, "speed");
        if (v19 < 0.0)
        {
          GEOFindOrCreateLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_INFO, "Location quality: speed is < 0", buf, 2u);
          }

        }
        objc_initWeak((id *)buf, self);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __56__MNLocationManager_locationProvider_didUpdateLocation___block_invoke;
        v21[3] = &unk_1E61D7080;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v7;
        -[MNLocationManager _shiftLocationIfNecessary:handler:](self, "_shiftLocationIfNecessary:handler:", v22, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C9E488], 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNLocationManager locationProvider:didReceiveError:](self, "locationProvider:didReceiveError:", v6, v15);

    }
  }

}

void __56__MNLocationManager_locationProvider_didUpdateLocation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updateForNewShiftedLocation:rawLocation:", v4, *(_QWORD *)(a1 + 32));

}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MNLocationManager locationRecorder](self, "locationRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordError:", v6);

  -[MNLocationManager _reportLocationFailureWithError:](self, "_reportLocationFailureWithError:", v6);
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MNLocationManager locationRecorder](self, "locationRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trueHeading");
  v9 = v8;
  objc_msgSend(v6, "magneticHeading");
  v11 = v10;
  objc_msgSend(v6, "headingAccuracy");
  v13 = v12;
  objc_msgSend(v6, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordCompassHeading:magneticHeading:accuracy:timestamp:", v14, v9, v11, v13);

  objc_storeStrong((id *)&self->_heading, a4);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!self->_lastUpdatedHeadingDate || (objc_msgSend(v15, "timeIntervalSinceDate:"), v17 > 0.05))
  {
    objc_storeStrong((id *)&self->_lastUpdatedHeadingDate, v16);
    -[NSHashTable allObjects](self->_headingObservers, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "locationManagerUpdatedHeading:", self, (_QWORD)v25);
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v22);
    }

  }
}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  if ((-[MNLocationProvider isAuthorized](self->_locationProvider, "isAuthorized", a3) & 1) == 0)
    -[MNLocationManager _reset](self, "_reset");
}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_observersLock, "lock", a3);
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "locationManagerShouldPauseLocationUpdates:", self))
        {
          v18 = 0;
          v13 = v8;
          goto LABEL_21;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v10)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "locationManagerShouldPauseLocationUpdates:", self, (_QWORD)v20))
        {
          v18 = 0;
          goto LABEL_21;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v18 = 1;
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v18 = 1;
  }
LABEL_21:

  return v18;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MNLocationManager locationRecorder](self, "locationRecorder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordLocationUpdatePause");

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidPauseLocationUpdates_, self);
  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidPauseLocationUpdates_, self);

}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MNLocationManager locationRecorder](self, "locationRecorder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordLocationUpdateResume");

  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidResumeLocationUpdates_, self);
  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_locationManagerDidResumeLocationUpdates_, self);

}

- (void)locationProvider:(id)a3 didEnterRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "locationManager:didEnterRegion:", self, v5);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "locationManager:didEnterRegion:", self, v5, (_QWORD)v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (void)locationProvider:(id)a3 didExitRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "locationManager:didExitRegion:", self, v5);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "locationManager:didExitRegion:", self, v5, (_QWORD)v22);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (void)locationProvider:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[NSLock lock](self->_observersLock, "lock");
  -[NSHashTable allObjects](self->_locationObservers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSHashTable allObjects](self->_locationListeners, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[NSLock unlock](self->_observersLock, "unlock");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "locationManager:monitoringDidFailForRegion:withError:", self, v7, v8);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v24, "locationManager:monitoringDidFailForRegion:withError:", self, v7, v8, (_QWORD)v25);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v21);
  }

}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v5;

  if (self->_trackingLocation)
  {
    -[MNLocationManager locationProvider](self, "locationProvider", a3, a4, a5);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetForActiveTileGroupChanged");

  }
}

- (id)locationCorrector
{
  return self->_locationCorrector;
}

- (CLHeading)heading
{
  return self->_heading;
}

- (MNLocationRecorder)locationRecorder
{
  return self->_locationRecorder;
}

- (void)setLocationRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_locationRecorder, a3);
}

- (unint64_t)locationProviderType
{
  return self->_locationProviderType;
}

- (MNLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationCorrector, 0);
  objc_storeStrong((id *)&self->_lastUpdatedHeadingDate, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_locationAssertion, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_lastLocationLock, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_headingObservers, 0);
  objc_storeStrong((id *)&self->_locationListeners, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_accessRequesters, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_storeStrong((id *)&self->_locationRecorder, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
