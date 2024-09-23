@implementation MKETAProvider

- (MKETAProvider)initWithPlaceItem:(id)a3
{
  id v5;
  MKETAProvider *v6;
  MKETAProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = -[MKETAProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeItem, a3);
    -[MKETAProvider _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (MKETAProvider)initWithMapItem:(id)a3
{
  id v5;
  MKETAProvider *v6;
  MKETAProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = -[MKETAProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    -[MKETAProvider _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (MKETAProvider)initWithLineItem:(id)a3
{
  id v5;
  MKETAProvider *v6;
  MKETAProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKETAProvider;
  v6 = -[MKETAProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    -[MKETAProvider _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MKETAProvider _cancelTimer](self, "_cancelTimer");
  v3.receiver = self;
  v3.super_class = (Class)MKETAProvider;
  -[MKETAProvider dealloc](&v3, sel_dealloc);
}

- (void)_commonInit
{
  void *v3;
  CLLocation *v4;
  CLLocation *currentLocation;
  MKMapItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MKMapItem *v11;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastGoodLocation");
  v4 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  currentLocation = self->_currentLocation;
  self->_currentLocation = v4;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v6 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
  if (v6 || (v6 = self->_mapItem) != 0)
  {
    v11 = v6;
    -[MKETAProvider _configureETAForMapItem:](self, "_configureETAForMapItem:", v6);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__locationManagerApprovalDidChange_, MKLocationManagerApprovalDidChangeNotification, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateETAHandler_, 0x1E20E0AC0, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__willEnterForeground, CFSTR("MKApplicationStateWillEnterForegroundNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__didEnterBackground, CFSTR("MKApplicationStateDidEnterBackgroundNotification"), 0);

}

- (void)start
{
  id v3;

  self->_paused = 0;
  if (!self->_active)
  {
    self->_active = 1;
    -[MKETAProvider currentMapItem](self, "currentMapItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider _configureETAForMapItem:](self, "_configureETAForMapItem:", v3);

  }
}

- (void)restart
{
  if (self->_paused)
    -[MKETAProvider start](self, "start");
}

- (void)pause
{
  if (self->_active)
  {
    self->_paused = 1;
    -[MKETAProvider cancel](self, "cancel");
  }
}

- (void)cancel
{
  id v3;

  -[MKETAProvider _cancelTimer](self, "_cancelTimer");
  self->_active = 0;
  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLocationUpdateWithObserver:", self);

}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  int v4;
  id v5;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLocationServicesAvailable"))
    v4 = objc_msgSend(v5, "isAuthorizedForPreciseLocation") ^ 1;
  else
    LOBYTE(v4) = 1;
  self->_distanceOrETAIsSuppressed = v4;
  -[MKETAProvider _notifyETAAllObservers](self, "_notifyETAAllObservers");
  -[MKETAProvider _updateETA](self, "_updateETA");

}

- (void)_didEnterBackground
{
  if (self->_active)
  {
    self->_inactiveInBackground = 1;
    -[MKETAProvider cancel](self, "cancel");
  }
}

- (void)_willEnterForeground
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (self->_inactiveInBackground)
  {
    self->_inactiveInBackground = 0;
    objc_initWeak(&location, self);
    v2 = dispatch_time(0, 1000000000);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37__MKETAProvider__willEnterForeground__block_invoke;
    v3[3] = &unk_1E20D8A58;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __37__MKETAProvider__willEnterForeground__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "start");

}

- (void)_refreshTimer
{
  -[MKETAProvider _cancelTimer](self, "_cancelTimer");
  -[MKETAProvider _updateETA](self, "_updateETA");
}

- (void)_startTimer
{
  NSTimer *v3;
  NSTimer *refreshTimer;

  -[MKETAProvider _cancelTimer](self, "_cancelTimer");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__refreshTimer, 0, 0, 60.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = v3;

}

- (void)_cancelTimer
{
  NSTimer *refreshTimer;

  -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;

}

- (NSHashTable)observers
{
  NSHashTable *observers;
  NSHashTable *v4;
  NSHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (NSLock)observersLock
{
  NSLock *observersLock;
  NSLock *v4;
  NSLock *v5;

  observersLock = self->_observersLock;
  if (!observersLock)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v5 = self->_observersLock;
    self->_observersLock = v4;

    observersLock = self->_observersLock;
  }
  return observersLock;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[MKETAProvider observersLock](self, "observersLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[MKETAProvider observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    -[MKETAProvider observersLock](self, "observersLock");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[MKETAProvider observersLock](self, "observersLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[MKETAProvider observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

    -[MKETAProvider observersLock](self, "observersLock");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
}

- (void)_notifyETAAllObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MKETAProvider observersLock](self, "observersLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[MKETAProvider observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[MKETAProvider observersLock](self, "observersLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "ETAProviderUpdated:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_notifyLocationAllObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MKETAProvider observersLock](self, "observersLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[MKETAProvider observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[MKETAProvider observersLock](self, "observersLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "ETAProviderLocationUpdated:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (unint64_t)etaTransportType
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed)
    return self->_etaTransportType;
  else
    return 0xFFFFFFFLL;
}

- (double)etaTravelTime
{
  double result;

  result = 0.0;
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed)
    return self->_etaTravelTime;
  return result;
}

- (NSString)distanceString
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed)
    return self->_distanceTextItem;
  else
    return (NSString *)0;
}

- (NSString)rawDistanceString
{
  if (self->_distanceOrETAWasFound && !self->_distanceOrETAIsSuppressed)
    return self->_rawDistanceString;
  else
    return (NSString *)0;
}

- (NSNumber)transportTypePreferenceNumber
{
  return self->_lastTransportTypeFound;
}

- (BOOL)isLikelyToReturnETA
{
  void *v2;
  BOOL v3;

  -[MKETAProvider currentMapItem](self, "currentMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_MKQuickRouteManager isLikelyToReturnETAForLocation:](_MKQuickRouteManager, "isLikelyToReturnETAForLocation:", v2);

  return v3;
}

- (BOOL)hasFoundDistanceOrETA
{
  return self->_distanceOrETAWasFound;
}

- (void)configureWithNearestStationMapItem:(id)a3
{
  MKMapItem *v5;
  void *v6;
  NSString *distanceTextItem;
  NSString *rawDistanceString;
  MKMapItem *v9;

  v5 = (MKMapItem *)a3;
  if (self->_nearestStationItem != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_nearestStationItem, a3);
    -[MKETAProvider start](self, "start");
    -[MKMapItem _geoMapItem](v9, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_MKQuickRouteManager updateETA](self->_quickRouteManager, "updateETA");
    }
    else
    {
      distanceTextItem = self->_distanceTextItem;
      self->_distanceTextItem = 0;

      rawDistanceString = self->_rawDistanceString;
      self->_rawDistanceString = 0;

    }
    v5 = v9;
  }

}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v5;
  GEOAutomobileOptions *v6;

  v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    -[_MKQuickRouteManager setAutomobileOptions:](self->_quickRouteManager, "setAutomobileOptions:", self->_automobileOptions);
    -[MKETAProvider _updateETA](self, "_updateETA");
    v5 = v6;
  }

}

- (void)setWalkingOptions:(id)a3
{
  GEOWalkingOptions *v5;

  v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    -[_MKQuickRouteManager setWalkingOptions:](self->_quickRouteManager, "setWalkingOptions:", v5);
    -[MKETAProvider _updateETA](self, "_updateETA");
  }

}

- (void)setTransitOptions:(id)a3
{
  GEOTransitOptions *v5;

  v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    objc_storeStrong((id *)&self->_transitOptions, a3);
    -[_MKQuickRouteManager setTransitOptions:](self->_quickRouteManager, "setTransitOptions:", v5);
    -[MKETAProvider _updateETA](self, "_updateETA");
  }

}

- (void)setCyclingOptions:(id)a3
{
  GEOCyclingOptions *v5;

  v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    -[_MKQuickRouteManager setCyclingOptions:](self->_quickRouteManager, "setCyclingOptions:", v5);
    -[MKETAProvider _updateETA](self, "_updateETA");
  }

}

- (BOOL)_areDistanceAndETAInformationAvailable
{
  void *v3;
  void *v4;
  char v5;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLocationServicesAvailable") && self->_quickRouteManager && self->_active)
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateETA
{
  void *v3;

  if (-[MKETAProvider _areDistanceAndETAInformationAvailable](self, "_areDistanceAndETAInformationAvailable"))
  {
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startLocationUpdateWithObserver:", self);

    -[_MKQuickRouteManager updateETA](self->_quickRouteManager, "updateETA");
  }
}

- (BOOL)_shouldUpdateETAForMapView:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!objc_msgSend(v3, "mapType")
     || objc_msgSend(v3, "mapType") == 105
     || objc_msgSend(v3, "mapType") == 104
     || objc_msgSend(v3, "mapType") == 108);

  return v4;
}

- (void)_updateETAHandler:(id)a3
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MKETAProvider _shouldUpdateETAForMapView:](self, "_shouldUpdateETAForMapView:", v4);

  if (v5)
    -[MKETAProvider _updateETA](self, "_updateETA");
}

- (void)_configureETAForMapItem:(id)a3
{
  id v4;
  _MKQuickRouteManager *quickRouteManager;
  _MKQuickRouteManager *v6;
  _MKQuickRouteManager *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4 && self->_active)
  {
    quickRouteManager = self->_quickRouteManager;
    v13 = v4;
    if (!quickRouteManager)
    {
      v6 = objc_alloc_init(_MKQuickRouteManager);
      v7 = self->_quickRouteManager;
      self->_quickRouteManager = v6;

      v4 = v13;
      quickRouteManager = self->_quickRouteManager;
    }
    -[_MKQuickRouteManager setMapItem:](quickRouteManager, "setMapItem:", v4);
    -[_MKQuickRouteManager setDelegate:](self->_quickRouteManager, "setDelegate:", self);
    -[_MKQuickRouteManager setTransportTypeFinder:](self->_quickRouteManager, "setTransportTypeFinder:", self);
    -[_MKQuickRouteManager setView:](self->_quickRouteManager, "setView:", self);
    -[_MKQuickRouteManager setAutomobileOptions:](self->_quickRouteManager, "setAutomobileOptions:", self->_automobileOptions);
    -[_MKQuickRouteManager setWalkingOptions:](self->_quickRouteManager, "setWalkingOptions:", self->_walkingOptions);
    -[_MKQuickRouteManager setTransitOptions:](self->_quickRouteManager, "setTransitOptions:", self->_transitOptions);
    -[_MKQuickRouteManager setCyclingOptions:](self->_quickRouteManager, "setCyclingOptions:", self->_cyclingOptions);
    -[_MKQuickRouteManager setAllowsDistantETA:](self->_quickRouteManager, "setAllowsDistantETA:", self->_allowsDistantETA);
    v8 = -[MKETAProvider _areDistanceAndETAInformationAvailable](self, "_areDistanceAndETAInformationAvailable");
    +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "startLocationUpdateWithObserver:", self);
LABEL_9:

      v4 = v13;
      goto LABEL_10;
    }
    v11 = objc_msgSend(v9, "isLocationServicesAuthorizationNeeded");

    v4 = v13;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__updateETA, MKLocationManagerApprovalDidChangeNotification, 0);

      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestWhenInUseAuthorization");
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (id)currentMapItem
{
  MKMapItem *nearestStationItem;
  MKMapItem *v3;

  nearestStationItem = self->_nearestStationItem;
  if (!nearestStationItem)
  {
    if (self->_placeItem)
    {
      -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
      v3 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    nearestStationItem = self->_mapItem;
  }
  v3 = nearestStationItem;
  return v3;
}

- (void)_updateETADisplayWithTransportType:(unint64_t)a3 travelTime:(double)a4 distance:(double)a5
{
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  MKMapItem *nearestStationItem;
  void *v14;
  uint64_t v15;
  NSString *v16;
  BOOL distanceOrETAWasFound;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *distanceTextItem;
  void *v23;
  id obj;

  self->_distanceOrETAWasFound = 0;
  if (self->_active)
  {
    if (a4 > 30.0)
    {
      self->_etaTransportType = a3;
      self->_etaTravelTime = a4;
      self->_distanceOrETAWasFound = 1;
    }
    -[MKETAProvider currentMapItem](self, "currentMapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[_MKQuickRouteManager isLikelyToReturnETAForLocation:](_MKQuickRouteManager, "isLikelyToReturnETAForLocation:", v7);

    if (!v8)
    {
      +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "coordinate");
        -[MKETAProvider currentMapItem](self, "currentMapItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_coordinate");

        GEOCalculateDistance();
        a5 = v12;
        self->_distanceOrETAWasFound = 1;
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, a5);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_rawDistanceString, obj);
    nearestStationItem = self->_nearestStationItem;
    if (!nearestStationItem)
    {
      if (a5 >= 3.0)
      {
        objc_storeStrong((id *)&self->_distanceTextItem, obj);
        self->_distanceOrETAWasFound = 1;
        goto LABEL_23;
      }
      distanceOrETAWasFound = self->_distanceOrETAWasFound;
LABEL_22:
      if (!distanceOrETAWasFound)
      {
LABEL_24:
        -[MKETAProvider _notifyETAAllObservers](self, "_notifyETAAllObservers");

        return;
      }
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("MapsButtonETAUpdatedNotification"), self, 0);

      goto LABEL_24;
    }
    -[MKMapItem name](nearestStationItem, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (a5 >= 3.0)
    {
      if (v15)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        _MKLocalizedStringFromThisBundle(CFSTR("line_card_nearest_station_distance_format"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKMapItem name](self->_nearestStationItem, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v19, v20, obj);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        distanceTextItem = self->_distanceTextItem;
        self->_distanceTextItem = v21;

LABEL_20:
        goto LABEL_21;
      }
      v16 = (NSString *)obj;
    }
    else
    {
      if (!v15)
      {
LABEL_21:
        distanceOrETAWasFound = self->_distanceOrETAWasFound || self->_distanceTextItem != 0;
        self->_distanceOrETAWasFound = distanceOrETAWasFound;
        goto LABEL_22;
      }
      -[MKMapItem name](self->_nearestStationItem, "name");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v19 = self->_distanceTextItem;
    self->_distanceTextItem = v16;
    goto LABEL_20;
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CLLocation *v8;
  CLLocation *currentLocation;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "lastLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v11, "lastGoodLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_8;
  }
  objc_msgSend(v11, "lastLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v11, "lastGoodLocation");
    v8 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  }
  currentLocation = self->_currentLocation;
  self->_currentLocation = v8;

  +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopLocationUpdateWithObserver:", self);

  -[MKETAProvider _notifyLocationAllObservers](self, "_notifyLocationAllObservers");
  -[_MKQuickRouteManager updateETA](self->_quickRouteManager, "updateETA");
  -[MKETAProvider _startTimer](self, "_startTimer");
LABEL_8:

}

- (void)locationManagerDidReset:(id)a3
{
  -[_MKQuickRouteManager updateETA](self->_quickRouteManager, "updateETA", a3);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)quickRouteManager:(id)a3 didUpdateETA:(id)a4 error:(id)a5 animated:(BOOL)a6
{
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = a4;
  v8 = objc_msgSend(v7, "transportType");
  objc_msgSend(v7, "travelTime");
  v10 = v9;
  objc_msgSend(v7, "distance");
  v12 = v11;

  -[MKETAProvider _updateETADisplayWithTransportType:travelTime:distance:](self, "_updateETADisplayWithTransportType:travelTime:distance:", v8, v10, v12);
}

- (BOOL)quickRouteShouldIncludeTransitWhenNotPreferredTransportType
{
  return 0;
}

- (BOOL)quickRouteShouldOnlyUseAutomobile
{
  return 0;
}

- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  if (v10)
  {
    -[MKETAProvider delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[MKETAProvider delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "mapTypeForETAProvider:", self);

    }
    else
    {
      v13 = 0;
    }

    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v27 = objc_msgSend(MEMORY[0x1E0D270E8], "idealTransportTypeForOrigin:destination:mapType:", v13, v8, v7, latitude, longitude);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D26D08]);

    if ((v16 & 1) != 0)
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke;
      v19[3] = &unk_1E20DF168;
      objc_copyWeak(&v22, &location);
      v21 = &v24;
      v19[4] = self;
      v20 = v10;
      MKMapsSuggestionsTransportModeForOriginAndDestination(v19, v8, v7, latitude, longitude);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = v25[3] - 1;
      if (v17 > 3)
        v18 = 1;
      else
        v18 = qword_18B2AF630[v17];
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v18);
    }
    _Block_object_dispose(&v24, 8);
  }

}

void __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  _QWORD block[4];
  __int128 v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - 1;
  if (v6 > 3)
    v7 = 0;
  else
    v7 = dword_18B2A96E0[v6];
  objc_msgSend(*(id *)(a1 + 32), "currentMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapsSuggestionsLogPredictedTransportMode(a2, v7, v9, v11);

  if ((_DWORD)a2 != 4 && GEOConfigGetBOOL())
  {
    if ((a2 - 1) > 5)
      v12 = 0;
    else
      v12 = qword_18B2AF600[(int)a2 - 1];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[MKETAProvider findDirectionsTypeForOriginCoordinate:destinationCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_DEBUG, "Using MSg PTM in %s", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke_37;
  block[3] = &unk_1E20DF140;
  objc_copyWeak(&v18, v4);
  v15 = *(_OWORD *)(a1 + 40);
  v14 = (id)v15;
  v17 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __85__MKETAProvider_findDirectionsTypeForOriginCoordinate_destinationCoordinate_handler___block_invoke_37(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeakRetained[2];
    WeakRetained[2] = v2;

  }
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - 1;
  if (v4 > 3)
    v5 = 1;
  else
    v5 = qword_18B2AF630[v4];
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);

}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (MKETAProviderDelegate)delegate
{
  return (MKETAProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (BOOL)allowsDistantETA
{
  return self->_allowsDistantETA;
}

- (void)setAllowsDistantETA:(BOOL)a3
{
  self->_allowsDistantETA = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setObserversLock:(id)a3
{
  objc_storeStrong((id *)&self->_observersLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_rawDistanceString, 0);
  objc_storeStrong((id *)&self->_distanceTextItem, 0);
  objc_storeStrong((id *)&self->_nearestStationItem, 0);
  objc_storeStrong((id *)&self->_lastTransportTypeFound, 0);
  objc_storeStrong((id *)&self->_quickRouteManager, 0);
}

@end
