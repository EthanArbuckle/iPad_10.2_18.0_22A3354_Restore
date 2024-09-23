@implementation MNRouteManager

- (MNRouteManager)init
{
  return -[MNRouteManager initWithAuditToken:](self, "initWithAuditToken:", 0);
}

- (MNRouteManager)initWithAuditToken:(id)a3
{
  id v5;
  MNRouteManager *v6;
  MNRouteManager *v7;
  MNRouteManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNRouteManager;
  v6 = -[MNRouteManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auditToken, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOComposedRoute)currentRoute
{
  return -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
}

- (NSArray)allRoutes
{
  NSArray *allRoutes;
  NSArray *v3;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  allRoutes = self->_allRoutes;
  if (allRoutes)
  {
    v3 = allRoutes;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_currentRouteInfo);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", self->_alternateRoutes);
    v6 = self->_allRoutes;
    self->_allRoutes = v5;
    v7 = v5;

    v3 = self->_allRoutes;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MNRouteManager close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MNRouteManager;
  -[MNRouteManager dealloc](&v3, sel_dealloc);
}

- (void)open
{
  void *v3;
  NSString *v4;
  NSString *tileLoaderClientIdentifier;
  void *v6;
  id v7;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addLocationListener:", self);

  if (!self->_tileLoaderClientIdentifier)
  {
    GEOTileLoaderClientIdentifier();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = v4;

    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openForClient:", self->_tileLoaderClientIdentifier);

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openServerConnection");

  }
}

- (void)close
{
  void *v3;
  void *v4;
  NSString *tileLoaderClientIdentifier;
  id v6;

  if (self->_tileLoaderClientIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closeForClient:", self->_tileLoaderClientIdentifier);

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "closeServerConnection:", 1);

    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = 0;

  }
  -[MNRouteManager _clearPreloader](self, "_clearPreloader");
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeLocationListener:", self);

}

- (void)updateWithPreviewRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_previewRoutes, a3);
  self->_selectedRouteIndex = a4;
  if (-[NSArray count](self->_previewRoutes, "count") <= a4)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_previewRoutes, "objectAtIndexedSubscript:", self->_selectedRouteIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MNRouteManager _updatePreloaderForRoute:](self, "_updatePreloaderForRoute:", v7);

}

- (void)updateWithStartNavigationDetails:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  GEORouteAttributes *v15;
  GEORouteAttributes *routeAttributes;
  NSObject *v17;
  GEORouteAttributes *v18;
  void *v19;
  GEOCommonOptions *v20;
  GEOCommonOptions *commonOptions;
  GEODirectionsRequest *v22;
  GEODirectionsRequest *directionsRequest;
  GEODirectionsResponse *v24;
  GEODirectionsResponse *directionsResponse;
  NSString *v26;
  NSString *requestingAppIdentifier;
  void *v28;
  void *v29;
  MNActiveRouteInfo *v30;
  GEOComposedWaypoint *v31;
  GEOComposedWaypoint *originalDestination;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MNActiveRouteInfo *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint8_t buf[4];
  _BYTE v52[10];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "selectedRouteIndex");
  objc_msgSend(v4, "routes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid selected route index"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v52 = "-[MNRouteManager updateWithStartNavigationDetails:]";
        *(_WORD *)&v52[8] = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
        v54 = 1024;
        v55 = 146;
        v56 = 2080;
        v57 = "selectedRouteIndex != NSNotFound";
        v58 = 2112;
        v59 = v43;
        _os_log_impl(&dword_1B0AD7000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

      MNGetMNNavigationSessionLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v45, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex not set", buf, 2u);
      }

    }
    objc_msgSend(v4, "routes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v5 >= v9)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      v47 = objc_msgSend(v4, "selectedRouteIndex");
      objc_msgSend(v4, "routes");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("Selected route index is outside valid range of routes. Index: %d. Routes count: %d\n"), v47, objc_msgSend(v48, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v52 = "-[MNRouteManager updateWithStartNavigationDetails:]";
        *(_WORD *)&v52[8] = 2080;
        v53 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
        v54 = 1024;
        v55 = 151;
        v56 = 2080;
        v57 = "selectedRouteIndex < details.routes.count";
        v58 = 2112;
        v59 = v49;
        _os_log_impl(&dword_1B0AD7000, v50, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    objc_msgSend(v4, "routes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v5 >= v11)
    {
      MNGetMNNavigationSessionLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "routes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v52 = v5;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v14;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "MNStartNavigationDetails selectedRouteIndex is %d. Only (%d) routes were passed in", buf, 0xEu);

      }
    }
    v5 = 0;
  }
  objc_msgSend(v4, "routeAttributes");
  v15 = (GEORouteAttributes *)objc_claimAutoreleasedReturnValue();
  routeAttributes = self->_routeAttributes;
  self->_routeAttributes = v15;

  MNGetMNRouteAttributesLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_routeAttributes;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v52 = v18;
    _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_DEFAULT, "_routeAttributes = %{public}@", buf, 0xCu);
  }

  objc_msgSend(v4, "directionsRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonOptions");
  v20 = (GEOCommonOptions *)objc_claimAutoreleasedReturnValue();
  commonOptions = self->_commonOptions;
  self->_commonOptions = v20;

  objc_msgSend(v4, "directionsRequest");
  v22 = (GEODirectionsRequest *)objc_claimAutoreleasedReturnValue();
  directionsRequest = self->_directionsRequest;
  self->_directionsRequest = v22;

  objc_msgSend(v4, "directionsResponse");
  v24 = (GEODirectionsResponse *)objc_claimAutoreleasedReturnValue();
  directionsResponse = self->_directionsResponse;
  self->_directionsResponse = v24;

  objc_msgSend(v4, "requestingAppIdentifier");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestingAppIdentifier = self->_requestingAppIdentifier;
  self->_requestingAppIdentifier = v26;

  self->_selectedRouteIndex = objc_msgSend(v4, "selectedRouteIndex");
  objc_msgSend(v4, "routes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v29);
  objc_storeStrong((id *)&self->_currentRouteInfo, v30);
  objc_msgSend(v29, "destination");
  v31 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  originalDestination = self->_originalDestination;
  self->_originalDestination = v31;

  if (objc_msgSend(v4, "navigationType") == 3 && !objc_msgSend(v29, "transportType"))
  {
    objc_msgSend(v4, "routes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = 0;
      v36 = 0;
      do
      {
        if (v35 != objc_msgSend(v4, "selectedRouteIndex"))
        {
          if (!v36)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v4, "routes");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v38, "usesZilch"))
          {
            objc_msgSend(v38, "routeAttributes");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setIncludeRoutingPathLeg:", 0);

          }
          v40 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v38);
          objc_msgSend(v36, "addObject:", v40);

        }
        ++v35;
        objc_msgSend(v4, "routes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

      }
      while (v35 < v42);
    }
    else
    {
      v36 = 0;
    }
    -[MNRouteManager updateWithAlternateRoutes:](self, "updateWithAlternateRoutes:", v36);

  }
  -[MNRouteManager _updatePreloaderForRoute:](self, "_updatePreloaderForRoute:", v30);

}

- (void)updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  MNActiveRouteInfo *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSArray *allRoutes;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = (MNActiveRouteInfo *)a3;
  v12 = a5;
  v13 = a6;
  if (self->_currentRouteInfo == v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rerouting to already active route"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "-[MNRouteManager updateForReroute:rerouteReason:request:response:]";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNRouteManager.m";
      v23 = 1024;
      v24 = 203;
      v25 = 2080;
      v26 = "_currentRouteInfo != routeInfo";
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_directionsRequest, a5);
    objc_storeStrong((id *)&self->_directionsResponse, a6);
    v14 = -[NSMutableArray indexOfObject:](self->_alternateRoutes, "indexOfObject:", v11);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_alternateRoutes, "removeObjectAtIndex:", v14);
      allRoutes = self->_allRoutes;
      self->_allRoutes = 0;

    }
    -[MNActiveRouteInfo route](v11, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentRouteInfo, a3);
    if (a4 - 8 <= 0xFFFFFFFFFFFFFFFDLL)
      objc_storeStrong((id *)&self->_originalRoute, v16);
    -[MNRouteManager _updatePreloaderForRoute:](self, "_updatePreloaderForRoute:", v11);

  }
}

- (void)updateForLocation:(id)a3
{
  GEORoutePreloader *preloader;
  id v4;

  preloader = self->_preloader;
  objc_msgSend(a3, "routeMatch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORoutePreloader updateWithRouteMatch:](preloader, "updateWithRouteMatch:", v4);

}

- (void)updateWithAlternateRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *alternateRoutes;
  NSArray *allRoutes;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  alternateRoutes = self->_alternateRoutes;
  self->_alternateRoutes = v4;

  allRoutes = self->_allRoutes;
  self->_allRoutes = 0;

}

- (void)clearCurrentRoute
{
  MNActiveRouteInfo *currentRouteInfo;

  currentRouteInfo = self->_currentRouteInfo;
  self->_currentRouteInfo = 0;

}

- (void)_clearPreloader
{
  GEORoutePreloader *preloader;

  -[GEORoutePreloader stop](self->_preloader, "stop");
  -[GEORoutePreloader tearDown](self->_preloader, "tearDown");
  preloader = self->_preloader;
  self->_preloader = 0;

}

- (void)_updatePreloaderForRoute:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  id *v10;
  void *v11;
  GEORoutePreloader *v12;
  GEORoutePreloader *preloader;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MNRouteManager _clearPreloader](self, "_clearPreloader");
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isOfflineRoute");
  if (v5)
  {
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v5, "origin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isCurrentLocation");

      if (v8)
      {
        if (objc_msgSend(v5, "transportType") == 1)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0D27610]);
          objc_msgSend(v9, "addTileSetStyle:betweenZoom:andZoom:", 53, 13, 15);
          objc_msgSend(v9, "addTileSetStyle:betweenZoom:andZoom:", 37, 13, 15);
          v15[0] = v9;
          v10 = (id *)v15;
        }
        else
        {
          v9 = objc_alloc_init(MEMORY[0x1E0D27250]);
          objc_msgSend(v9, "addTileSetStyle:betweenZoom:andZoom:", 53, 13, 15);
          v14 = v9;
          v10 = &v14;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (GEORoutePreloader *)objc_msgSend(objc_alloc(MEMORY[0x1E0D274F0]), "initWithRoute:strategies:auditToken:", v5, v11, self->_auditToken);
        preloader = self->_preloader;
        self->_preloader = v12;

      }
    }
  }

}

- (void)locationManagerUpdatedLocation:(id)a3
{
  GEORoutePreloader *preloader;
  void *v5;
  id v6;

  objc_msgSend(a3, "lastLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  preloader = self->_preloader;
  objc_msgSend(v6, "routeMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoutePreloader updateWithRouteMatch:](preloader, "updateWithRouteMatch:", v5);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (NSArray)alternateRoutes
{
  return &self->_alternateRoutes->super;
}

- (NSArray)contingencyRouteSegments
{
  return self->_contingencyRouteSegments;
}

- (NSArray)previewRoutes
{
  return self->_previewRoutes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (GEOComposedWaypoint)originalDestination
{
  return self->_originalDestination;
}

- (GEOComposedRoute)originalRoute
{
  return self->_originalRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_contingencyRouteSegments, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  objc_storeStrong((id *)&self->_preloader, 0);
  objc_storeStrong((id *)&self->_originalRouteInfo, 0);
  objc_storeStrong((id *)&self->_originalDestination, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
  objc_storeStrong((id *)&self->_allRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
}

@end
