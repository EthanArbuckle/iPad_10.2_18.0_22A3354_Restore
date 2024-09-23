@implementation MKCoreLocationProvider

uint64_t __47__MKCoreLocationProvider_accuracyAuthorization__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_accuracyAuthorizationOnQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_accuracyAuthorizationOnQueue
{
  -[MKCoreLocationProvider _updateAuthorizationStatus](self, "_updateAuthorizationStatus");
  return self->_accuracyAuthorization;
}

uint64_t __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 132) != *(_DWORD *)(result + 48);
  *(_DWORD *)(*(_QWORD *)(result + 32) + 132) = *(_DWORD *)(result + 48);
  return result;
}

void __64__MKCoreLocationProvider_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "locationProviderDidChangeAuthorizationStatus:", *(_QWORD *)(a1 + 32));

}

- (BOOL)shouldShiftIfNecessary
{
  return 1;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[11];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke;
  v6[8] = &unk_1E20D8FF0;
  v6[9] = self;
  v6[10] = &v8;
  v7 = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v9 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v8, 8);
}

- (int)authorizationStatus
{
  NSObject *coreLocationQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MKCoreLocationProvider_authorizationStatus__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startUpdatingHeading
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MKCoreLocationProvider_startUpdatingHeading__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __47__MKCoreLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_INFO, "Start updating Location for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startUpdatingLocation");

}

void __46__MKCoreLocationProvider_startUpdatingHeading__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingHeading");

}

- (CLLocationManager)_clLocationManager
{
  CLLocationManager *clLocationManager;

  clLocationManager = self->_clLocationManager;
  if (!clLocationManager)
  {
    -[MKCoreLocationProvider _createCLLocationManager](self, "_createCLLocationManager");
    clLocationManager = self->_clLocationManager;
  }
  return clLocationManager;
}

- (void)startUpdatingLocation
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MKCoreLocationProvider_startUpdatingLocation__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKCoreLocationProvider)init
{
  return -[MKCoreLocationProvider initWithCLLocationManager:](self, "initWithCLLocationManager:", 0);
}

- (MKCoreLocationProvider)initWithCLLocationManager:(id)a3
{
  id v5;
  MKCoreLocationProvider *v6;
  uint64_t v7;
  geo_isolater *isolation;
  uint64_t v9;
  OS_dispatch_queue *coreLocationQueue;
  double v11;
  double v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKCoreLocationProvider;
  v6 = -[MKCoreLocationProvider init](&v14, sel_init);
  if (v6)
  {
    v7 = geo_isolater_create();
    isolation = v6->_isolation;
    v6->_isolation = (geo_isolater *)v7;

    v9 = geo_dispatch_queue_create();
    coreLocationQueue = v6->_coreLocationQueue;
    v6->_coreLocationQueue = (OS_dispatch_queue *)v9;

    v6->_hasExternallyProvidedLocationManager = v5 != 0;
    objc_storeStrong((id *)&v6->_clLocationManager, a3);
    -[CLLocationManager setDelegate:](v6->_clLocationManager, "setDelegate:", v6);
    v6->_expectedGpsUpdateInterval = 1.0;
    v6->_authFetchStatus = 0;
    if (v6->_hasExternallyProvidedLocationManager)
    {
      objc_msgSend(v5, "distanceFilter");
      v6->_distanceFilter = v11;
      objc_msgSend(v5, "desiredAccuracy");
    }
    else
    {
      v6->_distanceFilter = *(double *)MEMORY[0x1E0C9E480];
      v12 = *MEMORY[0x1E0C9E490];
    }
    v6->_desiredAccuracy = v12;
  }

  return v6;
}

uint64_t __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHeadingOrientation:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 132));
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MKCoreLocationProvider_locationManager_didUpdateHeading___block_invoke;
  v7[3] = &unk_1E20D7E58;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  id v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD *v38;
  _OWORD v39[8];
  _OWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[4];
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  MKCoreLocationProvider *v50;
  id v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD v54[3];
  char v55;

  v6 = a3;
  v7 = a4;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v8 = MEMORY[0x1E0C809B0];
  if (self->_hasExternallyProvidedLocationManager)
  {
    objc_msgSend(v6, "desiredAccuracy");
    v46 = v8;
    v47 = 3221225472;
    v48 = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke;
    v49 = &unk_1E20D9090;
    v53 = v9;
    v50 = self;
    v51 = v6;
    v52 = v54;
    geo_isolate_sync();

  }
  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_navigation_setGtLog:", 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("LocationLatitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("LocationLongitude"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("LocationAccuracy"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v12)
    v16 = v13 == 0;
  else
    v16 = 1;
  v17 = !v16;
  if (!v16 || v14)
  {
    if ((locationManager_didUpdateLocations__logged & 1) == 0)
    {
      NSLog(CFSTR("Overriding core location with coordinate:%@,%@ accuracy:%@!"), v12, v13, v14);
      locationManager_didUpdateLocations__logged = 1;
    }
    objc_msgSend(v10, "coordinate");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v10, "horizontalAccuracy");
    v23 = v22;
    if (v17)
    {
      objc_msgSend(v12, "cgFloatValue");
      v25 = v24;
      objc_msgSend(v13, "cgFloatValue");
      v27 = v25 >= -90.0;
      if (v25 > 90.0)
        v27 = 0;
      if (v26 < -180.0)
        v27 = 0;
      if (v27 && v26 <= 180.0)
      {
        v19 = v25;
        v21 = v26;
      }
    }
    if (v15)
    {
      objc_msgSend(v15, "cgFloatValue");
      if (v28 <= 5000.0 && v28 > 0.0)
        v23 = v28;
    }
    v44 = 0u;
    memset(v45, 0, 60);
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    memset(&v40[2], 0, 32);
    if (v10)
      objc_msgSend(v10, "clientLocation");
    *(double *)((char *)&v40[2] + 4) = v19;
    *(double *)((char *)&v40[2] + 12) = v21;
    *(double *)((char *)v45 + 4) = v19;
    *(double *)((char *)v45 + 12) = v21;
    *(double *)((char *)&v40[3] + 4) = v23;
    v30 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v39[6] = v45[0];
    v39[7] = v45[1];
    v40[0] = v45[2];
    *(_OWORD *)((char *)v40 + 12) = *(_OWORD *)((char *)&v45[2] + 12);
    v39[2] = v41;
    v39[3] = v42;
    v39[4] = v43;
    v39[5] = v44;
    v39[0] = v40[2];
    v39[1] = v40[3];
    v31 = (void *)objc_msgSend(v30, "initWithClientLocation:", v39);
    objc_msgSend(v31, "_navigation_setGtLog:", 1);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_2;
    v36[3] = &unk_1E20D7EA8;
    v37 = v31;
    v38 = v54;
    v36[4] = self;
    v32 = v31;
    dispatch_async(MEMORY[0x1E0C80D38], v36);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_3;
    block[3] = &unk_1E20D7EA8;
    v35 = v54;
    block[4] = self;
    v34 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  _Block_object_dispose(v54, 8);

}

- (void)setDesiredAccuracy:(double)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[12];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke;
  v6[8] = &unk_1E20D8FA0;
  v6[9] = self;
  v6[10] = &v7;
  *(double *)&v6[11] = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v7, 8);
}

void __59__MKCoreLocationProvider_locationManager_didUpdateHeading___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "locationProvider:didUpdateHeading:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (double)expectedGpsUpdateInterval
{
  return self->_expectedGpsUpdateInterval;
}

uint64_t __45__MKCoreLocationProvider_authorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_authorizationStatusOnQueue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_authorizationStatusOnQueue
{
  -[MKCoreLocationProvider _updateAuthorizationStatus](self, "_updateAuthorizationStatus");
  return self->_authorizationStatus;
}

- (int64_t)accuracyAuthorization
{
  NSObject *coreLocationQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MKCoreLocationProvider_accuracyAuthorization__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  int authorizationStatus;
  NSObject *v7;
  int64_t accuracyAuthorization;
  _QWORD block[5];
  uint8_t buf[4];
  MKCoreLocationProvider *v11;
  __int16 v12;
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_authorizationStatus = objc_msgSend(v4, "authorizationStatus");
  -[MKCoreLocationProvider _authStatusReceived](self, "_authStatusReceived");
  -[MKCoreLocationProvider _updateAccuracyAuthorizationOnQueue:](self, "_updateAccuracyAuthorizationOnQueue:", v4);
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    authorizationStatus = self->_authorizationStatus;
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 1024;
    *(_DWORD *)v13 = authorizationStatus;
    *(_WORD *)&v13[4] = 2112;
    *(_QWORD *)&v13[6] = v4;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Updated authorization status for %p to: %i from CLLocationManager(%@)", buf, 0x1Cu);
  }

  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    accuracyAuthorization = self->_accuracyAuthorization;
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2048;
    *(_QWORD *)v13 = accuracyAuthorization;
    *(_WORD *)&v13[8] = 2112;
    *(_QWORD *)&v13[10] = v4;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "Updated accuracy authorization for %p to: %li from CLLocationManager(%@)", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MKCoreLocationProvider_locationManagerDidChangeAuthorization___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_updateAuthorizationStatus
{
  NSObject *v3;
  MKCoreLocationProvider *v4;
  NSObject *v5;
  int authorizationStatus;
  int64_t accuracyAuthorization;
  int v8;
  MKCoreLocationProvider *v9;
  __int16 v10;
  MKCoreLocationProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_clLocationManager)
    -[MKCoreLocationProvider _createCLLocationManager](self, "_createCLLocationManager");
  if (GEOConfigGetBOOL() && self->_authFetchStatus == 1)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[MKCoreLocationProvider _clLocationManager](self, "_clLocationManager");
      v4 = (MKCoreLocationProvider *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "CLLocationManager(%@) for %@ is avoiding location permission calls.", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    self->_authorizationStatus = -[CLLocationManager authorizationStatus](self->_clLocationManager, "authorizationStatus");
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      authorizationStatus = self->_authorizationStatus;
      v8 = 134218240;
      v9 = self;
      v10 = 1024;
      LODWORD(v11) = authorizationStatus;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_INFO, "Updated authorization status for %p to: %i", (uint8_t *)&v8, 0x12u);
    }

    -[MKCoreLocationProvider _updateAccuracyAuthorizationOnQueue:](self, "_updateAccuracyAuthorizationOnQueue:", self->_clLocationManager);
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      accuracyAuthorization = self->_accuracyAuthorization;
      v8 = 134218240;
      v9 = self;
      v10 = 2048;
      v11 = (MKCoreLocationProvider *)accuracyAuthorization;
      _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Updated accuracy authorization for %p to: %li", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)_updateAccuracyAuthorizationOnQueue:(id)a3
{
  double v4;
  double v5;
  int64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "desiredAccuracy");
  if (v4 == *MEMORY[0x1E0C9E4D8] || (objc_msgSend(v7, "desiredAccuracy"), v5 == 6380000.0))
    v6 = 1;
  else
    v6 = objc_msgSend(v7, "accuracyAuthorization");
  self->_accuracyAuthorization = v6;

}

- (void)_createCLLocationManager
{
  uint64_t v3;
  id v4;
  void *v5;
  CLLocationManager *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  CLLocationManager *clLocationManager;
  CLLocationManager *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *);
  void *v39;
  MKCoreLocationProvider *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE buf[24];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (self->_clLocationManager)
    return;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coreLocationQueue);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__5;
  v53 = __Block_byref_object_dispose__5;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__5;
  v47 = __Block_byref_object_dispose__5;
  v48 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __50__MKCoreLocationProvider__createCLLocationManager__block_invoke;
  v39 = &unk_1E20D7ED0;
  v40 = self;
  v41 = &v49;
  v42 = &v43;
  geo_isolate_sync();
  if (v50[5])
  {
    v4 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    objc_msgSend((id)v50[5], "bundlePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CLLocationManager *)objc_msgSend(v4, "initWithEffectiveBundlePath:delegate:onQueue:", v5, self, self->_coreLocationQueue);

    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)v50[5], "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v56 = v8;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "Created CLLocationManager(%@) for %p with bundle %@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  if (v44[5])
  {
    v9 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    v6 = (CLLocationManager *)objc_msgSend(v9, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v44[5], self, self->_coreLocationQueue);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)v44[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v56 = v10;
      v11 = "Created CLLocationManager(%@) for %p with bundle identifier %@";
      v12 = v7;
      v13 = 32;
LABEL_11:
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    }
  }
  else
  {
    v6 = (CLLocationManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "_initWithDelegate:onQueue:", self, self->_coreLocationQueue);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      v11 = "Created CLLocationManager(%@) for %p with no bundle";
      v12 = v7;
      v13 = 22;
      goto LABEL_11;
    }
  }
LABEL_12:

  -[CLLocationManager setDelegate:](v6, "setDelegate:", self);
  -[MKCoreLocationProvider _beginWaitingForAuthCallback](self, "_beginWaitingForAuthCallback");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v56 = 0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  geo_isolate_sync();
  -[CLLocationManager setDistanceFilter:](v6, "setDistanceFilter:", *(double *)(*(_QWORD *)&buf[8] + 24), v3, 3221225472, __50__MKCoreLocationProvider__createCLLocationManager__block_invoke_12, &unk_1E20D8F28, self, buf, &v32, &v28, &v24, &v20, &v16);
  -[CLLocationManager setDesiredAccuracy:](v6, "setDesiredAccuracy:", v33[3]);
  -[CLLocationManager setActivityType:](v6, "setActivityType:", v29[3]);
  if (*((_BYTE *)v25 + 24))
    -[CLLocationManager setMatchInfoEnabled:](v6, "setMatchInfoEnabled:", 1);
  if (*((_BYTE *)v21 + 24))
    -[CLLocationManager _setFusionInfoEnabled:](v6, "_setFusionInfoEnabled:", 1);
  if (*((_DWORD *)v17 + 6))
    -[CLLocationManager setHeadingOrientation:](v6, "setHeadingOrientation:");
  -[CLLocationManager setAllowsAlteredAccessoryLocations:](v6, "setAllowsAlteredAccessoryLocations:", 1);
  clLocationManager = self->_clLocationManager;
  self->_clLocationManager = v6;
  v15 = v6;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

void __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_3(_QWORD *a1)
{
  id WeakRetained;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    objc_msgSend(WeakRetained, "locationProviderDidChangeAuthorizationStatus:", a1[4]);

  }
  v3 = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(v3, "locationProvider:didUpdateLocation:", a1[4], a1[5]);

}

uint64_t __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke(uint64_t result)
{
  double v1;

  v1 = *(double *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(*(_QWORD *)(result + 32) + 104) != v1;
  *(double *)(*(_QWORD *)(result + 32) + 104) = v1;
  return result;
}

void __50__MKCoreLocationProvider__createCLLocationManager__block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 48));
}

- (void)dealloc
{
  void *v3;
  CLLocationManager *v4;
  CLLocationManager *clLocationManager;
  NSObject *coreLocationQueue;
  CLLocationManager *v7;
  objc_super v8;
  _QWORD block[4];
  CLLocationManager *v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NSTimer invalidate](self->_waitingForAuthCheckinTimer, "invalidate");
  v4 = self->_clLocationManager;
  clLocationManager = self->_clLocationManager;
  self->_clLocationManager = 0;

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MKCoreLocationProvider_dealloc__block_invoke;
  block[3] = &unk_1E20D7D98;
  v10 = v4;
  v7 = v4;
  dispatch_async(coreLocationQueue, block);

  v8.receiver = self;
  v8.super_class = (Class)MKCoreLocationProvider;
  -[MKCoreLocationProvider dealloc](&v8, sel_dealloc);
}

uint64_t __33__MKCoreLocationProvider_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingLocation");
  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingHeading");
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

double __50__MKCoreLocationProvider__createCLLocationManager__block_invoke_12(_QWORD *a1)
{
  double result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 120);
  result = *(double *)(a1[4] + 104);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 112);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_BYTE *)(a1[4] + 128);
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_BYTE *)(a1[4] + 129);
  *(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = *(_DWORD *)(a1[4] + 132);
  return result;
}

- (void)_beginWaitingForAuthCallback
{
  NSDate *v3;
  NSDate *beginWaitingTime;
  void *v5;
  double Integer;
  NSTimer *v7;
  NSTimer *waitingForAuthCheckinTimer;
  _QWORD v9[5];
  id v10;
  id location;

  if (!self->_authFetchStatus)
  {
    self->_authFetchStatus = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    beginWaitingTime = self->_beginWaitingTime;
    self->_beginWaitingTime = v3;

    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    Integer = (double)GEOConfigGetInteger();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke;
    v9[3] = &unk_1E20D8F78;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, v9, Integer);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
    self->_waitingForAuthCheckinTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  _QWORD block[7];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_msgSend(v3, "isValid");

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(*((id *)v7 + 9), "timeIntervalSinceNow");
      v8 = *((_QWORD *)v7 + 12);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke_2;
      block[3] = &unk_1E20D8F50;
      v9 = *(_QWORD *)(a1 + 32);
      block[4] = v7;
      block[5] = v9;
      *(double *)&block[6] = -v10;
      dispatch_async(v8, block);

    }
  }

}

void __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_ERROR, "CLLocationManager(%@) for %@ has not received auth status for %@ seconds.", (uint8_t *)&v6, 0x20u);

  }
}

- (void)_authStatusReceived
{
  NSDate *beginWaitingTime;
  NSTimer *waitingForAuthCheckinTimer;

  if (self->_authFetchStatus != 2)
  {
    beginWaitingTime = self->_beginWaitingTime;
    self->_authFetchStatus = 2;
    self->_beginWaitingTime = 0;

    -[NSTimer invalidate](self->_waitingForAuthCheckinTimer, "invalidate");
    waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
    self->_waitingForAuthCheckinTimer = 0;

  }
}

- (void)_stopWaitingForAuthCallback
{
  NSDate *beginWaitingTime;
  NSTimer *waitingForAuthCheckinTimer;

  beginWaitingTime = self->_beginWaitingTime;
  self->_authFetchStatus = 0;
  self->_beginWaitingTime = 0;

  -[NSTimer invalidate](self->_waitingForAuthCheckinTimer, "invalidate");
  waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
  self->_waitingForAuthCheckinTimer = 0;

}

- (void)stopWaitingForAuthCallback
{
  -[MKCoreLocationProvider _stopWaitingForAuthCallback](self, "_stopWaitingForAuthCallback");
  -[MKCoreLocationProvider authorizationStatus](self, "authorizationStatus");
}

- (BOOL)usesCLMapCorrection
{
  return objc_msgSend(MEMORY[0x1E0C9E3C8], "mapCorrectionAvailable");
}

- (void)stopUpdatingLocation
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MKCoreLocationProvider_stopUpdatingLocation__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __46__MKCoreLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_INFO, "Stop updating Location for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopUpdatingLocation");
}

- (void)stopUpdatingHeading
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MKCoreLocationProvider_stopUpdatingHeading__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __45__MKCoreLocationProvider_stopUpdatingHeading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopUpdatingHeading");
}

- (void)startUpdatingVehicleSpeed
{
  NSObject *v3;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Starting vehicle speed updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MKCoreLocationProvider_startUpdatingVehicleSpeed__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __51__MKCoreLocationProvider_startUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingVehicleSpeed");

}

- (void)stopUpdatingVehicleSpeed
{
  NSObject *v3;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Stopping vehicle speed updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MKCoreLocationProvider_stopUpdatingVehicleSpeed__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __50__MKCoreLocationProvider_stopUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopUpdatingVehicleSpeed");
}

- (void)startUpdatingVehicleHeading
{
  NSObject *v3;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Starting vehicle heading updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MKCoreLocationProvider_startUpdatingVehicleHeading__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __53__MKCoreLocationProvider_startUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startUpdatingVehicleHeading");

}

- (void)stopUpdatingVehicleHeading
{
  NSObject *v3;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Stopping vehicle heading updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MKCoreLocationProvider_stopUpdatingVehicleHeading__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __52__MKCoreLocationProvider_stopUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopUpdatingVehicleHeading");
}

- (void)_resetForNewEffectiveBundle
{
  NSObject *v3;
  CLLocationManager *clLocationManager;
  CLLocationManager *v5;
  CLLocationManager *v6;
  int v7;
  MKCoreLocationProvider *v8;
  __int16 v9;
  CLLocationManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    clLocationManager = self->_clLocationManager;
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = clLocationManager;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_INFO, "Reset for effective bundle %p _clLocationManager %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = self->_clLocationManager;
  if (v5)
  {
    -[CLLocationManager setDelegate:](v5, "setDelegate:", 0);
    v6 = self->_clLocationManager;
    self->_clLocationManager = 0;

    -[MKCoreLocationProvider _stopWaitingForAuthCallback](self, "_stopWaitingForAuthCallback");
    self->_authorizationStatus = 0;
    -[MKCoreLocationProvider _createCLLocationManager](self, "_createCLLocationManager");
    -[MKCoreLocationProvider _updateAuthorizationStatus](self, "_updateAuthorizationStatus");
  }
}

- (NSBundle)effectiveBundle
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__5;
  v8 = __Block_byref_object_dispose__5;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSBundle *)v2;
}

void __41__MKCoreLocationProvider_effectiveBundle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setEffectiveBundle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *coreLocationQueue;
  _QWORD v8[10];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[5] = MEMORY[0x1E0C809B0];
  v8[6] = 3221225472;
  v8[7] = __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke;
  v8[8] = &unk_1E20D7EA8;
  v10 = &v11;
  v8[9] = self;
  v6 = v4;
  v9 = v6;
  geo_isolate_sync();
  if (*((_BYTE *)v12 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke_2;
    v8[3] = &unk_1E20D7D98;
    v8[4] = self;
    dispatch_async(coreLocationQueue, v8);
  }

  _Block_object_dispose(&v11, 8);
}

void __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqual:", *(_QWORD *)(a1 + 40)) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

_QWORD *__45__MKCoreLocationProvider_setEffectiveBundle___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
    return (_QWORD *)objc_msgSend(result, "_resetForNewEffectiveBundle");
  return result;
}

- (NSString)effectiveBundleIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__5;
  v8 = __Block_byref_object_dispose__5;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __51__MKCoreLocationProvider_effectiveBundleIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *coreLocationQueue;
  _QWORD v8[10];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[5] = MEMORY[0x1E0C809B0];
  v8[6] = 3221225472;
  v8[7] = __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke;
  v8[8] = &unk_1E20D7EA8;
  v10 = &v11;
  v8[9] = self;
  v6 = v4;
  v9 = v6;
  geo_isolate_sync();
  if (*((_BYTE *)v12 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke_2;
    v8[3] = &unk_1E20D7D98;
    v8[4] = self;
    dispatch_async(coreLocationQueue, v8);
  }

  _Block_object_dispose(&v11, 8);
}

void __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isEqualToString:", *(_QWORD *)(a1 + 40)) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

  }
}

_QWORD *__55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
    return (_QWORD *)objc_msgSend(result, "_resetForNewEffectiveBundle");
  return result;
}

- (double)desiredAccuracy
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

double __41__MKCoreLocationProvider_desiredAccuracy__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[11];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v8 = 0;
    v9 = (double *)&v8;
    v10 = 0x2020000000;
    v11 = 0;
    v3 = MEMORY[0x1E0C809B0];
    block[5] = MEMORY[0x1E0C809B0];
    block[6] = 3221225472;
    block[7] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_3;
    block[8] = &unk_1E20D7E10;
    block[9] = v1;
    block[10] = &v8;
    geo_isolate_sync();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDesiredAccuracy:", v9[3]);
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[8] == 2)
    {
      v5 = v4[4];
      objc_msgSend(v4, "_updateAccuracyAuthorizationOnQueue:", v4[1]);
      v6 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v6 + 32) != v5)
      {
        block[0] = v3;
        block[1] = 3221225472;
        block[2] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_4;
        block[3] = &unk_1E20D7D98;
        block[4] = v6;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    _Block_object_dispose(&v8, 8);
  }
}

double __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_3(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 104);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "locationProviderDidChangeAuthorizationStatus:", *(_QWORD *)(a1 + 32));

}

- (int64_t)activityType
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __38__MKCoreLocationProvider_activityType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)setActivityType:(int64_t)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[12];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __42__MKCoreLocationProvider_setActivityType___block_invoke;
  v6[8] = &unk_1E20D8FA0;
  v6[9] = self;
  v6[10] = &v7;
  v6[11] = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __42__MKCoreLocationProvider_setActivityType___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v7, 8);
}

_QWORD *__42__MKCoreLocationProvider_setActivityType___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 112) != result[6];
  *(_QWORD *)(result[4] + 112) = result[6];
  return result;
}

uint64_t __42__MKCoreLocationProvider_setActivityType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setActivityType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
}

- (double)distanceFilter
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

double __40__MKCoreLocationProvider_distanceFilter__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 120);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDistanceFilter:(double)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[12];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __44__MKCoreLocationProvider_setDistanceFilter___block_invoke;
  v6[8] = &unk_1E20D8FA0;
  v6[9] = self;
  v6[10] = &v7;
  *(double *)&v6[11] = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __44__MKCoreLocationProvider_setDistanceFilter___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __44__MKCoreLocationProvider_setDistanceFilter___block_invoke(uint64_t result)
{
  double v1;

  v1 = *(double *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(double *)(*(_QWORD *)(result + 32) + 120) != v1;
  *(double *)(*(_QWORD *)(result + 32) + 120) = v1;
  return result;
}

uint64_t __44__MKCoreLocationProvider_setDistanceFilter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDistanceFilter:", *(double *)(*(_QWORD *)(a1 + 32) + 120));
}

- (BOOL)matchInfoEnabled
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __42__MKCoreLocationProvider_matchInfoEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[11];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke;
  v6[8] = &unk_1E20D8FC8;
  v6[9] = self;
  v6[10] = &v8;
  v7 = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v9 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 128) != *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = *(_BYTE *)(result + 48);
  return result;
}

uint64_t __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMatchInfoEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
}

- (BOOL)fusionInfoEnabled
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __43__MKCoreLocationProvider_fusionInfoEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 129);
  return result;
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  uint64_t v4;
  NSObject *coreLocationQueue;
  _QWORD v6[11];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v6[5] = MEMORY[0x1E0C809B0];
  v6[6] = 3221225472;
  v6[7] = __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke;
  v6[8] = &unk_1E20D8FC8;
  v6[9] = self;
  v6[10] = &v8;
  v7 = a3;
  geo_isolate_sync();
  if (*((_BYTE *)v9 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke_2;
    v6[3] = &unk_1E20D7D98;
    v6[4] = self;
    dispatch_async(coreLocationQueue, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 129) != *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 129) = *(_BYTE *)(result + 48);
  return result;
}

uint64_t __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setFusionInfoEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 129));
}

- (int)headingOrientation
{
  int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __44__MKCoreLocationProvider_headingOrientation__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 132);
  return result;
}

- (void)authorizationStatusOnQueue:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    coreLocationQueue = self->_coreLocationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke;
    block[3] = &unk_1E20D9040;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(coreLocationQueue, block);

  }
}

void __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  int v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_authorizationStatusOnQueue");
  v3 = *(NSObject **)(a1 + 40);
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke_2;
  v6[3] = &unk_1E20D9018;
  v7 = *(id *)(a1 + 48);
  v8 = v2;
  dispatch_async(v4, v6);
  if (!v3)

}

uint64_t __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)accuracyAuthorizationOnQueue:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *coreLocationQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    coreLocationQueue = self->_coreLocationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke;
    block[3] = &unk_1E20D9040;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(coreLocationQueue, block);

  }
}

void __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_accuracyAuthorizationOnQueue");
  v3 = *(NSObject **)(a1 + 40);
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke_2;
  v6[3] = &unk_1E20D9068;
  v7 = *(id *)(a1 + 48);
  v8 = v2;
  dispatch_async(v4, v6);
  if (!v3)

}

uint64_t __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (double)timeScale
{
  return 1.0;
}

- (void)dismissHeadingCalibrationDisplay
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MKCoreLocationProvider_dismissHeadingCalibrationDisplay__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __58__MKCoreLocationProvider_dismissHeadingCalibrationDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dismissHeadingCalibrationDisplay");
}

- (CLLocation)lastLocation
{
  NSObject *coreLocationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MKCoreLocationProvider_lastLocation__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

void __38__MKCoreLocationProvider_lastLocation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = *(double *)(result + 56);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(double *)(v2 + 104))
  {
    v3 = (_QWORD *)result;
    *(double *)(v2 + 104) = v1;
    v4 = *(_QWORD **)(result + 32);
    v5 = v4[4];
    result = objc_msgSend(v4, "_updateAccuracyAuthorizationOnQueue:", v3[5]);
    *(_BYTE *)(*(_QWORD *)(v3[6] + 8) + 24) = *(_QWORD *)(v3[4] + 32) != v5;
  }
  return result;
}

void __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    objc_msgSend(WeakRetained, "locationProviderDidChangeAuthorizationStatus:", a1[4]);

  }
  v3 = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(v3, "locationProvider:didUpdateLocation:", a1[4], a1[5]);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  MKCoreLocationProvider *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "CLLocationManager(%@) for %@ did fail with error: %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__MKCoreLocationProvider_locationManager_didFailWithError___block_invoke;
  v10[3] = &unk_1E20D7E58;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __59__MKCoreLocationProvider_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "locationProvider:didReceiveError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "applicationCanPromptToCalibrateHeading:", v3);
  else
    v5 = 1;

  return v5;
}

- (void)requestWhenInUseAuthorization
{
  NSObject *coreLocationQueue;
  _QWORD block[5];

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MKCoreLocationProvider_requestWhenInUseAuthorization__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __55__MKCoreLocationProvider_requestWhenInUseAuthorization__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestWhenInUseAuthorization");

}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *coreLocationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MKCoreLocationProvider_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke;
  block[3] = &unk_1E20D9040;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(coreLocationQueue, block);

}

void __96__MKCoreLocationProvider_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clLocationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke;
  v6[3] = &unk_1E20D7E58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_msgSend(WeakRetained, "locationProviderShouldPauseLocationUpdates:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(v4 + 16));
    objc_msgSend(v6, "locationProviderDidPauseLocationUpdates:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = *(NSObject **)(v4 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke_2;
    block[3] = &unk_1E20D7D98;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);

  }
}

uint64_t __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startUpdatingLocation");
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MKCoreLocationProvider_locationManagerDidResumeLocationUpdates___block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __66__MKCoreLocationProvider_locationManagerDidResumeLocationUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "locationProviderDidResumeLocationUpdates:", *(_QWORD *)(a1 + 32));

}

- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "speed");
    v8 = v7;
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle speed: %g | %{private}@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MKCoreLocationProvider_locationManager_didUpdateVehicleSpeed___block_invoke;
  v11[3] = &unk_1E20D7E58;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __64__MKCoreLocationProvider_locationManager_didUpdateVehicleSpeed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "speed");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleSpeed:timestamp:", v2, v5, v4);

}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "trueHeading");
    v8 = v7;
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle heading: %g | %{private}@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MKCoreLocationProvider_locationManager_didUpdateVehicleHeading___block_invoke;
  v11[3] = &unk_1E20D7E58;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __66__MKCoreLocationProvider_locationManager_didUpdateVehicleHeading___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "trueHeading");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleHeading:timestamp:", v2, v5, v4);

}

- (MKLocationProviderDelegate)delegate
{
  return (MKLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreLocationQueue, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_waitingForAuthCheckinTimer, 0);
  objc_storeStrong((id *)&self->_beginWaitingTime, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end
