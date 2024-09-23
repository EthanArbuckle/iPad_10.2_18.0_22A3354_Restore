@implementation SUUINearMeController

+ (id)sharedController
{
  if (sharedController_sOnce != -1)
    dispatch_once(&sharedController_sOnce, &__block_literal_global_2);
  return (id)sharedController_sNearMeController;
}

void __40__SUUINearMeController_sharedController__block_invoke()
{
  SUUINearMeController *v0;
  void *v1;

  v0 = objc_alloc_init(SUUINearMeController);
  v1 = (void *)sharedController_sNearMeController;
  sharedController_sNearMeController = (uint64_t)v0;

}

- (SUUINearMeController)init
{
  SUUINearMeController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUINearMeController;
  v2 = -[SUUINearMeController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground_, *MEMORY[0x24BEBE008], 0);
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", v2);

  }
  return v2;
}

- (NSArray)items
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "parentalControlsRank");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "parentalControlsRank", (_QWORD)v13) <= v5)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (BOOL)isNearMeLocationStatusEnabled
{
  uint64_t v2;

  v2 = SUUICoreLocationFramework();
  return objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v2), "authorizationStatus")- 3 < 2;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_refreshTimer)
    -[SUUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation", a3);
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUUINearMeController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__SUUINearMeController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setItems:responseDictionary:error:status:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  SUUIClientContext *clientContext;
  void *v12;
  SUUIClientContext *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((a4 - 3) > 1)
  {
    if (a4)
      -[SUUINearMeController _disableNearMe](self, "_disableNearMe");
  }
  else
  {
    -[SUUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation");
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("nearMeEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (a4 - 3) < 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("SUUINearMeLocationStatusDidChangeNotification"), v9);

  if (a4 == 2 && !self->_authorizationStatus)
  {
    v10 = objc_alloc_init(MEMORY[0x24BEBD3B8]);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("NEAR_ME_LOCATION_ALERT"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NEAR_ME_LOCATION_ALERT"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v12);

    v13 = self->_clientContext;
    if (v13)
      -[SUUIClientContext localizedStringForKey:](v13, "localizedStringForKey:", CFSTR("OK"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("OK"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCancelButtonIndex:", objc_msgSend(v10, "addButtonWithTitle:", v14));

    objc_msgSend(v10, "show");
  }
  self->_authorizationStatus = a4;

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) == 1)
    -[SUUINearMeController _disableNearMe](self, "_disableNearMe");
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "count");
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalAccuracy");
    if (v8 > 0.00000011920929 && v8 <= 65.0 && SUUILocationIsAccurate(v7))
      -[SUUINearMeController _lookupItemsForLocation:](self, "_lookupItemsForLocation:", v7);

    v6 = v9;
  }

}

- (void)_startMonitoringLocation
{
  uint64_t v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  void *v6;
  double *v7;
  int v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *locationTimeoutTimer;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[SUUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  if (!self->_isMonitoring && !self->_lookupRequest)
  {
    if (!self->_locationManager)
    {
      v3 = SUUICoreLocationFramework();
      v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v3));
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
      v6 = (void *)SUUICoreLocationFramework();
      v7 = (double *)SUUIWeakLinkedSymbolForString("kCLLocationAccuracyBest", v6);
      if (v7)
        -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *v7);
    }
    v8 = objc_msgSend((id)objc_opt_class(), "authorizationStatus");
    self->_authorizationStatus = v8;
    if (!v8)
      -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    self->_isMonitoring = 1;
    if (!self->_locationTimeoutTimer)
    {
      objc_initWeak(&location, self);
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      locationTimeoutTimer = self->_locationTimeoutTimer;
      self->_locationTimeoutTimer = v9;

      v11 = self->_locationTimeoutTimer;
      v12 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(v11, v12, 0, 0);
      v13 = self->_locationTimeoutTimer;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __48__SUUINearMeController__startMonitoringLocation__block_invoke;
      v14[3] = &unk_2511F53F8;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v13, v14);
      dispatch_resume((dispatch_object_t)self->_locationTimeoutTimer);
      self->_locationTimeoutCount = 0;
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SUUINearMeController__startMonitoringLocation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_monitorLocationTimeout");

}

- (void)_stopMonitoringLocation
{
  NSObject *locationTimeoutTimer;
  OS_dispatch_source *v4;

  if (self->_isMonitoring)
  {
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    self->_isMonitoring = 0;
  }
  locationTimeoutTimer = self->_locationTimeoutTimer;
  if (locationTimeoutTimer)
  {
    dispatch_source_cancel(locationTimeoutTimer);
    v4 = self->_locationTimeoutTimer;
    self->_locationTimeoutTimer = 0;

  }
}

- (void)_monitorLocationTimeout
{
  void *v3;
  int64_t locationTimeoutCount;
  NSObject *locationTimeoutTimer;
  dispatch_time_t v6;
  id v7;

  -[CLLocationManager location](self->_locationManager, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3 && SUUILocationIsAccurate(v3))
  {
    -[SUUINearMeController _lookupItemsForLocation:](self, "_lookupItemsForLocation:", v7);
  }
  else
  {
    locationTimeoutCount = self->_locationTimeoutCount;
    self->_locationTimeoutCount = locationTimeoutCount + 1;
    if (locationTimeoutCount > 2)
    {
      -[SUUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
      -[SUUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", MEMORY[0x24BDBD1A8], 0, 0, 2);
      -[SUUINearMeController _startRefreshTimer](self, "_startRefreshTimer");
    }
    else
    {
      locationTimeoutTimer = self->_locationTimeoutTimer;
      v6 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(locationTimeoutTimer, v6, 0, 0);
    }
  }

}

- (void)_lookupItemsForLocation:(id)a3
{
  id v4;
  SSLookupRequest *v5;
  SSLookupRequest *lookupRequest;
  SSLookupRequest *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[SUUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
  -[SUUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  if (!self->_lookupRequest)
  {
    objc_initWeak(&location, self);
    v5 = (SSLookupRequest *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1EB0]), "initWithLocation:", v4);
    lookupRequest = self->_lookupRequest;
    self->_lookupRequest = v5;

    -[SSLookupRequest setKeyProfile:](self->_lookupRequest, "setKeyProfile:", *MEMORY[0x24BEB2770]);
    v7 = self->_lookupRequest;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__SUUINearMeController__lookupItemsForLocation___block_invoke;
    v8[3] = &unk_2511F5448;
    objc_copyWeak(&v9, &location);
    -[SSLookupRequest startWithLookupBlock:](v7, "startWithLookupBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __48__SUUINearMeController__lookupItemsForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SUUISearchItem *v12;
  void *v13;
  SUUISearchItem *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v18 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v12 = [SUUISearchItem alloc];
        objc_msgSend(v11, "lookupDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SUUISearchItem initWithLookupDictionary:](v12, "initWithLookupDictionary:", v13);

        if (v14)
          objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUUINearMeController__lookupItemsForLocation___block_invoke_2;
  block[3] = &unk_2511F5420;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  v21 = v5;
  v22 = v4;
  v23 = v18;
  v15 = v18;
  v16 = v4;
  v17 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v24);
}

void __48__SUUINearMeController__lookupItemsForLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishLookupWithItems:response:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_finishLookupWithItems:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SSLookupRequest *lookupRequest;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "responseDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", v9, v10, v8, 1);

  -[SUUINearMeController _startRefreshTimer](self, "_startRefreshTimer");
  lookupRequest = self->_lookupRequest;
  self->_lookupRequest = 0;

}

- (void)_startRefreshTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *refreshTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_refreshTimer)
  {
    objc_initWeak(&location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    v5 = self->_refreshTimer;
    v6 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    v7 = self->_refreshTimer;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__SUUINearMeController__startRefreshTimer__block_invoke;
    v8[3] = &unk_2511F53F8;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_refreshTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__SUUINearMeController__startRefreshTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshTimeout");

}

- (void)_stopRefreshTimer
{
  NSObject *refreshTimer;
  OS_dispatch_source *v4;

  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
  {
    dispatch_source_cancel(refreshTimer);
    v4 = self->_refreshTimer;
    self->_refreshTimer = 0;

  }
}

- (void)_refreshTimeout
{
  -[SUUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  -[SUUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation");
}

- (void)_setItems:(id)a3 responseDictionary:(id)a4 error:(id)a5 status:(int64_t)a6
{
  NSArray *v9;
  NSDictionary *v10;
  NSArray *items;
  NSArray *v12;
  NSDictionary *responseDictionary;
  NSDictionary *v14;
  id v15;

  v9 = (NSArray *)a3;
  v10 = (NSDictionary *)a4;
  items = self->_items;
  self->_items = v9;
  v12 = v9;

  self->_status = a6;
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v10;
  v14 = v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "postNotificationName:object:", CFSTR("SUUINearMeItemsDidChangeNotification"), self);
}

- (void)_disableNearMe
{
  -[SUUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
  -[SUUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  -[SUUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", 0, 0, 0, 0);
}

- (int64_t)status
{
  return self->_status;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_locationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lookupRequest, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
