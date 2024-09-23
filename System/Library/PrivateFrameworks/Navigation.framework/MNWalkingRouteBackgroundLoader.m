@implementation MNWalkingRouteBackgroundLoader

- (void)dealloc
{
  objc_super v3;

  -[MNWalkingRouteBackgroundLoader stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MNWalkingRouteBackgroundLoader;
  -[MNWalkingRouteBackgroundLoader dealloc](&v3, sel_dealloc);
}

- (void)setNavigationSessionState:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  MNNavigationSessionState *v7;
  MNNavigationSessionState *navigationSessionState;
  void *v9;
  id v10;

  v10 = a3;
  -[MNNavigationSessionState location](self->_navigationSessionState, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MNWalkingRouteBackgroundLoader _requestTypeForArrivalState:](self, "_requestTypeForArrivalState:", -[MNNavigationSessionState arrivalState](self->_navigationSessionState, "arrivalState"));
  v7 = (MNNavigationSessionState *)objc_msgSend(v10, "copy");
  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = v7;

  if (v4 != v5 && self->_isFetchingWalkingRoutes)
  {
    -[MNNavigationSessionState location](self->_navigationSessionState, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNWalkingRouteBackgroundLoader _updateForLocation:](self, "_updateForLocation:", v9);

  }
  if (v6 != -[MNWalkingRouteBackgroundLoader _requestTypeForArrivalState:](self, "_requestTypeForArrivalState:", objc_msgSend(v10, "arrivalState")))-[MNWalkingRouteBackgroundLoader _updateWalkingRoute](self, "_updateWalkingRoute");

}

- (void)start
{
  NSObject *v2;
  NSDate *dateSinceLastRouteRequest;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (self->_isFetchingWalkingRoutes)
  {
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "-[MNWalkingRouteBackground start]: Already fetching walking routes.", buf, 2u);
    }

  }
  else
  {
    self->_isFetchingWalkingRoutes = 1;
    dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
    self->_dateSinceLastRouteRequest = 0;

    *(_OWORD *)&self->_lastFailedRequestCoordinate.latitude = kGEOLocationCoordinate3DInvalid;
    self->_lastFailedRequestCoordinate.altitude = 1.79769313e308;
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Started background loading of walking route.", v6, 2u);
    }

    -[MNWalkingRouteBackgroundLoader _updateWalkingRoute](self, "_updateWalkingRoute");
  }
}

- (void)stop
{
  NSObject *v3;
  NSDate *dateSinceLastRouteRequest;
  MNActiveRouteInfo *walkingRouteInfo;
  id WeakRetained;
  char v7;
  id v8;
  uint8_t v9[16];

  if (self->_isFetchingWalkingRoutes)
  {
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Stopped background loading of walking route.", v9, 2u);
    }

    -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
    self->_isFetchingWalkingRoutes = 0;
    dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
    self->_dateSinceLastRouteRequest = 0;

    walkingRouteInfo = self->_walkingRouteInfo;
    if (walkingRouteInfo)
    {
      self->_walkingRouteInfo = 0;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "walkingRouteBackgroundLoader:didUpdateWalkingRoute:", self, 0);

      }
    }
  }
}

- (unint64_t)_requestTypeForArrivalState:(int64_t)a3
{
  if (a3 == 5)
    return 10;
  else
    return 9;
}

- (id)_requestWalkingRouteWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[8];
  _QWORD v30[3];
  CLLocationCoordinate2D v31;

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MNNavigationSessionState location](self->_navigationSessionState, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "coordinate"), CLLocationCoordinate2DIsValid(v31)))
    {
      -[MNNavigationSessionState currentWaypoint](self->_navigationSessionState, "currentWaypoint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[MNNavigationSessionState currentRouteInfo](self->_navigationSessionState, "currentRouteInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "route");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v6);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26FF8]), "initWithLocation:isCurrentLocation:", v10, 1);
          objc_msgSend(v9, "routeAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "routeInitializerData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "directionsRequest");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "commonOptions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = -[MNNavigationSessionState arrivalState](self->_navigationSessionState, "arrivalState");
          v15 = objc_alloc_init(MEMORY[0x1E0D27050]);
          objc_msgSend(v15, "setRequestType:", -[MNWalkingRouteBackgroundLoader _requestTypeForArrivalState:](self, "_requestTypeForArrivalState:", v14));
          objc_msgSend(v15, "setCurrentLocation:", v10);
          v30[0] = v26;
          v30[1] = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setWaypoints:", v16);

          objc_msgSend(v15, "setCurrentRoute:", v9);
          objc_msgSend(v15, "setTransportType:", 2);
          objc_msgSend(v15, "setRouteAttributes:", v25);
          objc_msgSend(v15, "setCommonOptions:", v13);
          objc_msgSend(v15, "setMaxRouteCount:", 1);
          objc_msgSend(v15, "setHasArrived:", (v14 & 0xFFFFFFFFFFFFFFFDLL) == 4);
          -[MNNavigationSessionState auditToken](self->_navigationSessionState, "auditToken");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAuditToken:", v17);

          -[MNNavigationSessionState requestingAppIdentifier](self->_navigationSessionState, "requestingAppIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setRequestingAppIdentifier:", v18);

          objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __66__MNWalkingRouteBackgroundLoader__requestWalkingRouteWithHandler___block_invoke;
          v27[3] = &unk_1E61D1A78;
          v28 = v4;
          objc_msgSend(v19, "requestRoutes:handler:", v15, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          MNGetMNWalkingRouteBackgroundLoaderLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's current route is invalid.", buf, 2u);
          }

          (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
          v20 = 0;
        }

      }
      else
      {
        MNGetMNWalkingRouteBackgroundLoaderLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's destination waypoint is invalid.", buf, 2u);
        }

        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
        v20 = 0;
      }

    }
    else
    {
      MNGetMNWalkingRouteBackgroundLoaderLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Error requesting walking background route because the navigation session state's location is invalid.", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __66__MNWalkingRouteBackgroundLoader__requestWalkingRouteWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  MNActiveRouteInfo *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error requesting walking background route from server: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v11);
  else
    v12 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_updateWalkingRoute
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  GEODirectionsServiceRequest *v17;
  GEODirectionsServiceRequest *pendingRequest;
  _QWORD v19[5];
  id v20[4];
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_isFetchingWalkingRoutes && !self->_pendingRequest)
  {
    if (self->_dateSinceLastRouteRequest
      && (GEOConfigGetDouble(),
          v4 = v3,
          +[MNTimeManager currentDate](MNTimeManager, "currentDate"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "timeIntervalSinceDate:", self->_dateSinceLastRouteRequest),
          v7 = v6,
          v5,
          v7 < v4))
    {
      MNGetMNWalkingRouteBackgroundLoaderLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v22 = v7;
        v23 = 2048;
        v24 = v4;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "Not requesting new background walking route because only %0.1fs has elapsed since the previous request, and at least %0.1fs is required.", buf, 0x16u);
      }

    }
    else
    {
      -[MNNavigationSessionState location](self->_navigationSessionState, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_navigation_geoCoordinate3D");
      v11 = v10;
      v13 = v12;
      v15 = v14;

      MNGetMNWalkingRouteBackgroundLoaderLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283777;
        v22 = *(double *)&v11;
        v23 = 2049;
        v24 = *(double *)&v13;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "Requesting walking background route from server from %{private}f, %{private}f.", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __53__MNWalkingRouteBackgroundLoader__updateWalkingRoute__block_invoke;
      v19[3] = &unk_1E61D7170;
      v19[4] = self;
      v20[1] = v11;
      v20[2] = v13;
      v20[3] = v15;
      objc_copyWeak(v20, (id *)buf);
      -[MNWalkingRouteBackgroundLoader _requestWalkingRouteWithHandler:](self, "_requestWalkingRouteWithHandler:", v19);
      v17 = (GEODirectionsServiceRequest *)objc_claimAutoreleasedReturnValue();
      pendingRequest = self->_pendingRequest;
      self->_pendingRequest = v17;

      objc_destroyWeak(v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __53__MNWalkingRouteBackgroundLoader__updateWalkingRoute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  id WeakRetained;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_OWORD *)(a1 + 48);
    *(_QWORD *)(v13 + 64) = *(_QWORD *)(a1 + 64);
    *(_OWORD *)(v13 + 48) = v14;
    v15 = a2;
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v6;
      v9 = "Error requesting walking background route from server: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    v7 = a2;
    MNGetMNWalkingRouteBackgroundLoaderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v9 = "Received walking background route.";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 2;
LABEL_7:
      _os_log_impl(&dword_1B0AD7000, v10, v11, v9, (uint8_t *)&v17, v12);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleWalkingRouteResponse:", a2);

}

- (void)_updateForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  double longitude;
  double latitude;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id WeakRetained;
  char v31;
  id v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_isFetchingWalkingRoutes)
  {
    if (self->_walkingRouteInfo)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:course:", v4, -1.0);
      v7 = objc_alloc(MEMORY[0x1E0D274E8]);
      -[MNActiveRouteInfo route](self->_walkingRouteInfo, "route");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationSessionState auditToken](self->_navigationSessionState, "auditToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v7, "initWithRoute:auditToken:", v8, v9);

      objc_msgSend(v10, "matchToRouteWithLocation:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GEOConfigGetDouble();
      v13 = v12;
      objc_msgSend(v11, "distanceFromRoute");
      if (v14 <= v13)
      {
        +[MNDisplayETAInfo displayETAInfoForRouteInfo:routeCoordinate:](MNDisplayETAInfo, "displayETAInfoForRouteInfo:routeCoordinate:", self->_walkingRouteInfo, objc_msgSend(v11, "routeCoordinate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[MNActiveRouteInfo displayETAInfo](self->_walkingRouteInfo, "displayETAInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28
            || (v29 = objc_msgSend(v27, "displayRemainingMinutesToEndOfRoute"),
                v29 != objc_msgSend(v28, "displayRemainingMinutesToEndOfRoute")))
          {
            -[MNActiveRouteInfo setDisplayETAInfo:](self->_walkingRouteInfo, "setDisplayETAInfo:", v27);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v31 = objc_opt_respondsToSelector();

            if ((v31 & 1) != 0)
            {
              v32 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v32, "walkingRouteBackgroundLoader:didUpdateWalkingRoute:", self, self->_walkingRouteInfo);

            }
          }

        }
      }
      else
      {
        MNGetMNWalkingRouteBackgroundLoaderLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "distanceFromRoute");
          v33 = 134217984;
          v34 = v16;
          _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_DEFAULT, "Location too far from route: %0.1f", (uint8_t *)&v33, 0xCu);
        }

        -[MNWalkingRouteBackgroundLoader _updateWalkingRoute](self, "_updateWalkingRoute");
      }

    }
    else
    {
      longitude = self->_lastFailedRequestCoordinate.longitude;
      if (longitude >= -180.0 && longitude <= 180.0)
      {
        latitude = self->_lastFailedRequestCoordinate.latitude;
        if (latitude >= -90.0 && latitude <= 90.0 && !self->_pendingRequest)
        {
          objc_msgSend(v4, "_navigation_geoCoordinate3D");
          v20 = v19;
          v22 = v21;
          GEOCalculateDistance();
          v24 = v23;
          GEOConfigGetDouble();
          if (v24 > v25)
          {
            MNGetMNWalkingRouteBackgroundLoaderLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              v33 = 134284033;
              v34 = v20;
              v35 = 2049;
              v36 = v22;
              v37 = 2049;
              v38 = v24;
              _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_INFO, "Retrying request for background loading route from %{private}f, %{private}f. Distance from last failed request is %{private}0.1f meters.", (uint8_t *)&v33, 0x20u);
            }

            -[MNWalkingRouteBackgroundLoader _updateWalkingRoute](self, "_updateWalkingRoute");
          }
        }
      }
    }
  }

}

- (void)_handleWalkingRouteResponse:(id)a3
{
  void *v5;
  GEODirectionsServiceRequest *pendingRequest;
  NSDate *v7;
  NSDate *dateSinceLastRouteRequest;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_walkingRouteInfo, a3);
  if (v9)
  {
    -[MNNavigationSessionState location](self->_navigationSessionState, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNWalkingRouteBackgroundLoader _updateForLocation:](self, "_updateForLocation:", v5);

  }
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  +[MNTimeManager currentDate](MNTimeManager, "currentDate");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateSinceLastRouteRequest = self->_dateSinceLastRouteRequest;
  self->_dateSinceLastRouteRequest = v7;

}

- (MNWalkingRouteBackgroundLoaderDelegate)delegate
{
  return (MNWalkingRouteBackgroundLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (MNActiveRouteInfo)walkingRouteInfo
{
  return self->_walkingRouteInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingRouteInfo, 0);
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateSinceLastRouteRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
