@implementation MNTurnByTurnLocationTracker

- (id)initForTestingWithRoute:(id)a3
{
  id v4;
  MNTurnByTurnLocationTracker *v5;
  MNTurnByTurnLocationTracker *v6;
  uint64_t v7;
  GEONavigationMapMatcher *mapMatcher;
  MNTurnByTurnLocationTracker *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNTurnByTurnLocationTracker;
  v5 = -[MNLocationTracker init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = -[MNTurnByTurnLocationTracker _newMapMatcherForRoute:](v5, "_newMapMatcherForRoute:", v4);
    mapMatcher = v6->_mapMatcher;
    v6->_mapMatcher = (GEONavigationMapMatcher *)v7;

    -[GEONavigationMapMatcher setRequiresRoadNetworkData:](v6->_mapMatcher, "setRequiresRoadNetworkData:", 1);
    -[GEONavigationMapMatcher setShouldSnapRouteMatchToRoute:](v6->_mapMatcher, "setShouldSnapRouteMatchToRoute:", 1);
    -[GEONavigationMapMatcher setShouldWaitForSnappedSegments:](v6->_mapMatcher, "setShouldWaitForSnappedSegments:", 1);
    v6->_isNavigatingInLowGuidance = 0;
    v9 = v6;
  }

  return v6;
}

- (MNTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  id v4;
  MNTurnByTurnLocationTracker *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  GEONavigationMapMatcher *mapMatcher;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  GEOPathMatcher *pathMatcher;
  void *v17;
  MNTurnByTurnLocationTracker *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MNTurnByTurnLocationTracker;
  v5 = -[MNLocationTracker initWithNavigationSession:](&v20, sel_initWithNavigationSession_, v4);
  if (v5)
  {
    objc_msgSend(v4, "routeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MNTurnByTurnLocationTracker _newMapMatcherForRoute:](v5, "_newMapMatcherForRoute:", v7);
    mapMatcher = v5->_mapMatcher;
    v5->_mapMatcher = (GEONavigationMapMatcher *)v8;

    -[GEONavigationMapMatcher setTargetLegIndex:](v5->_mapMatcher, "setTargetLegIndex:", 0);
    -[GEONavigationMapMatcher setRequiresRoadNetworkData:](v5->_mapMatcher, "setRequiresRoadNetworkData:", 1);
    objc_msgSend(v4, "traceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tracePlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationMapMatcher setIsSimulation:](v5->_mapMatcher, "setIsSimulation:", objc_msgSend(v12, "isSimulation"));

    v5->_isNavigatingInLowGuidance = 0;
    v13 = objc_alloc(MEMORY[0x1E0D27320]);
    -[MNLocationTracker _auditToken](v5, "_auditToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithRoute:auditToken:", v7, v14);
    pathMatcher = v5->_pathMatcher;
    v5->_pathMatcher = (GEOPathMatcher *)v15;

    dispatch_get_global_queue(21, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

    v5->_numOfflineAttempts = 0;
    v5->_numOnlineAttempts = 0;
    v18 = v5;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)MNTurnByTurnLocationTracker;
  -[MNLocationTracker dealloc](&v3, sel_dealloc);
}

- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__MNTurnByTurnLocationTracker_rerouteWithWaypoints_completionHandler___block_invoke;
  v8[3] = &unk_1E61D3820;
  v9 = v6;
  v7 = v6;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 9, v8, a4, 0);

}

void __70__MNTurnByTurnLocationTracker_rerouteWithWaypoints_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestType:", 8);
  objc_msgSend(v3, "setWaypoints:", *(_QWORD *)(a1 + 32));

}

- (void)insertWaypoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__MNTurnByTurnLocationTracker_insertWaypoint_completionHandler___block_invoke;
  v8[3] = &unk_1E61D3820;
  v9 = v6;
  v7 = v6;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 7, v8, a4, 0);

}

void __64__MNTurnByTurnLocationTracker_insertWaypoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestType:", 7);
  objc_msgSend(v3, "setWaypointModificationType:", 0);
  objc_msgSend(v3, "setWaypointToInsert:", *(_QWORD *)(a1 + 32));

}

- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MNTurnByTurnLocationTracker_removeWaypointAtIndex_completionHandler___block_invoke;
  v4[3] = &__block_descriptor_40_e47_v16__0__GEODirectionsServiceRequestParameters_8l;
  v4[4] = a3;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 8, v4, a4, 0);
}

void __71__MNTurnByTurnLocationTracker_removeWaypointAtIndex_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestType:", 7);
  objc_msgSend(v3, "setWaypointModificationType:", 1);
  objc_msgSend(v3, "setWaypointIndexToRemove:", *(_QWORD *)(a1 + 32));

}

- (void)advanceToNextLeg
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[MNLocationTracker hasArrived](self, "hasArrived")
    || self->_lastArrivalLegIndex != 0x7FFFFFFFFFFFFFFFLL
    || -[MNArrivalUpdater isApproachingWaypoint](self->_arrivalUpdater, "isApproachingWaypoint")
    || -[MNArrivalUpdater isInPreArrivalRegion](self->_arrivalUpdater, "isInPreArrivalRegion"))
  {
    -[MNArrivalUpdater forceDepartureForCurrentLeg:](self->_arrivalUpdater, "forceDepartureForCurrentLeg:", 1);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "Manual advance to next leg ignored since the location tracker has already passed the arrival stage", v4, 2u);
    }

  }
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MNTurnByTurnLocationTracker *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__MNTurnByTurnLocationTracker_updateDestination_completionHandler___block_invoke;
  v8[3] = &unk_1E61D3868;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 6, v8, a4, 0);

}

void __67__MNTurnByTurnLocationTracker_updateDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setRequestType:", 6);
  v9[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWaypoints:", v4);

  objc_msgSend(*(id *)(a1 + 40), "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "originalDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = v7 == *(void **)(a1 + 32);

  if ((_DWORD)a1)
    objc_msgSend(v6, "originalRoute");
  else
    objc_msgSend(v6, "currentRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentRoute:", v8);

}

- (void)forceRerouteWithReason:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 0xE)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E61D3AA0[a3 - 1];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Forcing reroute with reason %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MNTurnByTurnLocationTracker_forceRerouteWithReason___block_invoke;
  v7[3] = &unk_1E61D3890;
  v7[4] = self;
  v7[5] = a3;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", a3, v7, 0, 0);
}

void __54__MNTurnByTurnLocationTracker_forceRerouteWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_QWORD *)(a1 + 40) == 11)
  {
    v4 = 11;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_offRouteRequestType");
    v3 = v5;
  }
  objc_msgSend(v3, "setRequestType:", v4);

}

- (void)reroute:(id)a3 reason:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[MNTurnByTurnLocationTracker _cancelPendingRerouteRequest](self, "_cancelPendingRerouteRequest");
  -[MNTurnByTurnLocationTracker _updateForNewRoute:rerouteReason:request:response:](self, "_updateForNewRoute:rerouteReason:request:response:", v6, a4, 0, 0);

}

- (void)changeTransportType:(int)a3 route:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  MNActiveRouteInfo *v23;
  NSObject *v24;
  __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  _QWORD v28[5];
  int v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v4 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[MNLocationTracker transportType](self, "transportType") == (_DWORD)v4)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v4 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E61D3A68[(int)v4];
      }
      *(_DWORD *)buf = 138412290;
      v31 = *(double *)&v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Requested to change transport type to %@, but we are already navigating using that transport type.", buf, 0xCu);

    }
LABEL_35:

    return;
  }
  if (v4 > 3 || (_DWORD)v4 == 1)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v4 < 7 && ((0x73u >> v4) & 1) != 0)
      {
        v10 = off_1E61D3A10[(int)v4];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v31 = *(double *)&v10;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Requested to change transport type to %@, but only driving, walking, and cycling are supported.", buf, 0xCu);

    }
    goto LABEL_35;
  }
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = off_1E61D3A48[(int)v4];
    objc_msgSend(v6, "uniqueRouteID");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = *(double *)&v11;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "Changing to transport type: %@ | %@", buf, 0x16u);

  }
  if (v6)
  {
    if (objc_msgSend(v6, "transportType") == (_DWORD)v4)
    {
      v13 = objc_alloc(MEMORY[0x1E0D27168]);
      -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithCLLocation:course:", v14, -1.0);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D274E8]), "initWithRoute:auditToken:", v6, 0);
      objc_msgSend(v16, "matchToRouteWithLocation:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "distanceFromRoute");
      v19 = v18;
      GEOFindOrCreateLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v19;
        _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "Current location distance from provided route is %0.1f meters. Ignoring provided route and requesting new one.", buf, 0xCu);
      }

      GEOConfigGetDouble();
      if (v19 > v21)
      {
        GEOFindOrCreateLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_DEFAULT, "Current location is too far from provided route. Requesting new route.", buf, 2u);
        }

        v6 = 0;
      }

      if (v6)
      {
        v23 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v6);
        -[MNTurnByTurnLocationTracker _updateForNewRoute:rerouteReason:request:response:](self, "_updateForNewRoute:rerouteReason:request:response:", v23, 5, 0, 0);

        return;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = off_1E61D3A48[(int)v4];
        v26 = objc_msgSend(v6, "transportType");
        if (v26 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E61D3A68[(int)v26];
        }
        *(_DWORD *)buf = 138412546;
        v31 = *(double *)&v25;
        v32 = 2112;
        v33 = v27;
        _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "Changing transport type to %@, but provided route is of transport type %@. Ignoring route.", buf, 0x16u);

      }
    }
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__MNTurnByTurnLocationTracker_changeTransportType_route___block_invoke;
  v28[3] = &unk_1E61D38B8;
  v29 = v4;
  v28[4] = self;
  -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 5, v28, 0, 0);
}

void __57__MNTurnByTurnLocationTracker_changeTransportType_route___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setRequestType:", 9);
  objc_msgSend(v5, "setTransportType:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "arrivalState");

  objc_msgSend(v5, "setHasArrived:", (v4 & 0xFFFFFFFFFFFFFFFDLL) == 4);
}

- (void)switchToDestinationRoute
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  void (**v18)(_QWORD, _QWORD);
  _QWORD v19[4];
  NSObject *v20;
  MNTurnByTurnLocationTracker *v21;
  uint8_t buf[16];

  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MNGetMNLocationTrackerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "switchToDestinationRoute", buf, 2u);
    }

    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke;
    v19[3] = &unk_1E61D38E0;
    v9 = v5;
    v20 = v9;
    v21 = self;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0E364](v19);
    if (-[NSObject isNavigable](v9, "isNavigable"))
    {
      ((void (**)(_QWORD, NSObject *))v10)[2](v10, v9);
    }
    else
    {
      MNGetMNLocationTrackerLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "destination route is not navigable, attempting convertToNavigableRoute:.", buf, 2u);
      }

      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setCurrentRoute:", v9);
      -[MNLocationTracker navigationSession](self, "navigationSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "routeManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "routeAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRouteAttributes:", v15);

      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke_25;
      v17[3] = &unk_1E61D3908;
      v18 = v10;
      v16 = +[MNRouteEditor convertToNavigableRoute:finishedHandler:](MNRouteEditor, "convertToNavigableRoute:finishedHandler:", v12, v17);

    }
    v7 = v20;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "switchToDestinationRoute called but there is no destination route.", buf, 2u);
  }

}

void __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  MNActiveRouteInfo *v6;

  v6 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "routeInitializerData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionsRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "routeInitializerData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "directionsResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_updateForNewRoute:rerouteReason:request:response:", v6, 12, v3, v5);
}

void __55__MNTurnByTurnLocationTracker_switchToDestinationRoute__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MNGetMNLocationTrackerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Error converting destination route to navigable route: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)changeOfflineMode:(unsigned __int8)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Should not be called anymore. Pending removal.", v3, 2u);
  }
}

- (void)_changeOfflineMode:(unsigned __int8)a3 reason:(unint64_t)a4 requestParameters:(id)a5 errorHandler:(id)a6
{
  int v7;
  id v9;
  unsigned __int8 v10;
  NSObject *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v7 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v26 = a6;
  v10 = objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *MEMORY[0x1E0D26D08]);
  MNGetMNLocationTrackerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    GEOOfflineModeAsString();
    v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    GEOOfflineStateAsString();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentRouteInfo");
    a6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a6, "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 1024;
    v33 = objc_msgSend(v15, "isOfflineRoute");
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Requesting changeOfflineMode to '%@'. Current offline state is '%@'. Current route is offline: %d", buf, 0x1Cu);

  }
  if (a4 != 15)
    goto LABEL_5;
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentRouteInfo");
  a6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a6, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isOfflineRoute");

  if ((v18 & 1) == 0)
  {
    MNGetMNLocationTrackerLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = CFSTR("UpgradeOfflineToOnline");
      _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_ERROR, "Attempted to switch to online route with reroute reason %@, but we already have an online route.", buf, 0xCu);
    }

  }
  else
  {
LABEL_5:
    if (v7 == v10)
    {
      MNGetMNLocationTrackerLog();
      a6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_ERROR))
      {
        GEOOfflineStateAsString();
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v19;
        _os_log_impl(&dword_1B0AD7000, (os_log_t)a6, OS_LOG_TYPE_ERROR, "GEOOfflineService reports offline state is already '%@', but proceeding with reroute anyway.", buf, 0xCu);

      }
    }
    objc_msgSend(v9, "traits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
      a6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a6, "defaultTraits");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "setTraits:", v21);
    if (!v20)
    {

    }
    objc_msgSend(v9, "traits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v7 == 1)
      v24 = 3;
    else
      v24 = 4;
    objc_msgSend(v22, "setRequestMode:", v24);

    -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestParameters:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestParameters:completionHandler:errorHandler:", a4, v9, 0, v26);
  }

}

- (void)updateRequestForETAUpdate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MNTurnByTurnLocationTracker;
  -[MNLocationTracker updateRequestForETAUpdate:](&v5, sel_updateRequestForETAUpdate_, v4);
  -[MNTrafficIncidentAlertUpdater updateIncidentResultForETARequest:](self->_trafficIncidentAlertUpdater, "updateIncidentResultForETARequest:", v4);

}

- (void)updateForETAUResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t Integer;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  objc_msgSend(v49, "request");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "error");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traceRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v7;
  objc_msgSend(v7, "timeSinceRecordingBegan");
  v9 = v8;
  objc_msgSend(v49, "responseTime");
  v11 = v10;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "recordETAURequest:response:error:destinationName:requestTimestamp:responseTimestamp:", v50, v4, v52, v14, v9 - v11, v9);

  Integer = GEOConfigGetInteger();
  if (Integer || !v52 && !objc_msgSend(v4, "status"))
  {
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "routeManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allRoutes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v19 = v18;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v54 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v23, "setAlternateRouteIndex:", 0x7FFFFFFFFFFFFFFFLL);
          objc_msgSend(v23, "setEtaResponse:", v4);
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v4, "status") && Integer)
    {
      -[MNLocationTracker navigationSession](self, "navigationSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "routeManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "currentRoute");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "geoETAWaypointRoute");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v4, "setWaypointRoute:", v27);

    }
    else if (!Integer)
    {
LABEL_24:
      -[MNLocationTracker navigationSession](self, "navigationSession");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "routeManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "currentRouteInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNLocationTracker safeDelegate](self, "safeDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "locationTracker:didUpdateETAForRoute:", self, v47);

      goto LABEL_25;
    }
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "routeManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentRouteInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_22;
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "routeMatch");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (v34)
    {
LABEL_22:
      v40 = 0;
    }
    else
    {
      -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "routeMatch");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "route");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "distanceToEndFromRouteCoordinate:", objc_msgSend(v36, "routeCoordinate"));
      v39 = v38;

      v40 = v39;
    }
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "routeManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "alternateRoutes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addFakeTrafficIncidentAlert:mainRouteInfo:alternateRouteInfo:currentDistance:", Integer, v30, v44, v40);

    goto LABEL_24;
  }
  GEOFindOrCreateLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_DEBUG, "Return from updateForETAUResponse without updating ETA due to error in response from Routing\n", buf, 2u);
  }
LABEL_25:

}

- (BOOL)_isLocation:(id)a3 nearOrigin:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v5, "_navigation_geoCoordinate3D");
      objc_msgSend(v7, "coordinate");
      GEOCalculateDistance();
      v9 = v8;
      GEOConfigGetDouble();
      v11 = v9 < v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_updateStateForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  unint64_t v11;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MNLocationTracker state](self, "state");
  switch(-[MNLocationTracker state](self, "state"))
  {
    case 0:
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[MNTurnByTurnLocationTracker _updateStateForLocation:]";
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        v23 = 1024;
        v24 = 441;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
      }

      break;
    case 1:
      v8 = objc_msgSend(v4, "state");
      if (v8)
      {
        if (v8 == 2)
        {
          v18 = 0;
          v14 = -[MNTurnByTurnLocationTracker _allowRerouteForLocation:outError:](self, "_allowRerouteForLocation:outError:", v4, &v18);
          v15 = v18;
          if (v14)
          {
            v5 = 4;
          }
          else
          {
            -[MNLocationTracker safeDelegate](self, "safeDelegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "locationTracker:didSuppressReroute:", self, v15);

            v5 = 1;
          }

        }
        else if (v8 == 1)
        {
          v5 = 2;
        }
        else
        {
          v5 = v5;
        }
      }
      else
      {
        v5 = 1;
      }
      break;
    case 2:
    case 3:
    case 4:
      v6 = objc_msgSend(v4, "state");
      if (v6)
      {
        if (v6 == 2)
        {
          v17 = 0;
          v9 = -[MNTurnByTurnLocationTracker _allowRerouteForLocation:outError:](self, "_allowRerouteForLocation:outError:", v4, &v17);
          v10 = v17;
          if (v9)
          {
            v5 = 4;
          }
          else
          {
            -[MNLocationTracker safeDelegate](self, "safeDelegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "locationTracker:didSuppressReroute:", self, v10);

            v5 = 3;
          }

        }
        else if (v6 == 1)
        {
          self->_consecutiveOffRouteCount = 0;
          v5 = 2;
        }
      }
      else
      {
        v11 = self->_consecutiveOffRouteCount + 1;
        self->_consecutiveOffRouteCount = v11;
        if (v11 < 5 && (_DWORD)v5 == 2)
          v5 = 2;
        else
          v5 = 3;
      }
      break;
    case 5:
    case 8:
      if (objc_msgSend(v4, "state") == 1)
      {
        if (self->_rerouteReason == 1)
          v5 = 2;
        else
          v5 = v5;
      }
      break;
    default:
      break;
  }
  -[MNLocationTracker _setState:](self, "_setState:", v5);

}

- (void)_updateSwitchTransportTypeForLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  _QWORD v18[4];
  int v19;

  v4 = a3;
  +[MNCarPlayConnectionMonitor sharedInstance](MNCarPlayConnectionMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnected");

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = -[MNTurnByTurnLocationTracker _detectedMotionForLocation:](self, "_detectedMotionForLocation:", v4);
  v8 = -[MNTurnByTurnLocationTracker isRerouting](self, "isRerouting");
  v9 = (_DWORD)v7 == 4 || v8;
  if ((v9 & 1) == 0 && -[MNLocationTracker transportType](self, "transportType") != (_DWORD)v7)
  {
    objc_msgSend(v4, "routeMatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "step");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "transportType") != 5)
    {
      objc_msgSend(v4, "routeMatch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v17, "legIndex");
      objc_msgSend(v4, "routeMatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "route");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "legs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") - 1;

      if (v12 >= v16
        && ((v6 & 1) != 0
         || -[MNTurnByTurnLocationTracker _allowSwitchToTransportType:forLocation:](self, "_allowSwitchToTransportType:forLocation:", v7, v4)))
      {
        if (GEOConfigGetBOOL())
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __69__MNTurnByTurnLocationTracker__updateSwitchTransportTypeForLocation___block_invoke;
          v18[3] = &__block_descriptor_36_e47_v16__0__GEODirectionsServiceRequestParameters_8l;
          v19 = v7;
          -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 5, v18, 0, 0);
        }
      }
    }

  }
}

void __69__MNTurnByTurnLocationTracker__updateSwitchTransportTypeForLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestType:", 4);
  objc_msgSend(v3, "setTransportType:", *(unsigned int *)(a1 + 32));

}

- (BOOL)_shouldAdvanceGuidanceToRouteMatch:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "isGoodMatch"))
    v5 = !-[MNLocationTracker hasArrived](self, "hasArrived");
  else
    LOBYTE(v5) = 0;
  -[MNLocation routeMatch](self->_lastKnownGoodLocationOnRoute, "routeMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MNLocation routeMatch](self->_lastKnownGoodLocationOnRoute, "routeMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeCoordinate");
    objc_msgSend(v4, "routeCoordinate");
    v8 = GEOPolylineCoordinateCompare();

    if (v8 != -1)
      LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)_modifiedStepIndexForMatchResult:(id)a3 matchType:(unint64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;

  objc_msgSend(a3, "routeMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MNLocationTracker transportType](self, "transportType");
  if ((!v7 || v7 == 3) && -[MNLocationTracker hasArrived](self, "hasArrived"))
  {
    objc_msgSend(v6, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", self->_lastArrivalLegIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "steps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "endStepIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "stepIndex");
LABEL_16:

    goto LABEL_17;
  }
  if (!a4)
  {
    v20 = objc_msgSend(v6, "legIndex");
    if (v20 >= -[MNLocationTracker targetLegIndex](self, "targetLegIndex"))
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(v6, "route");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "routeMatch");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "route");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v18)
  {
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "stepIndex");
LABEL_15:
    v14 = v21;
    goto LABEL_16;
  }
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v22 = objc_msgSend(v6, "legIndex");
    if (v22 == -[MNLocationTracker targetLegIndex](self, "targetLegIndex"))
      goto LABEL_13;
LABEL_14:
    objc_msgSend(v6, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "legs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v10, "startStepIndex");
    goto LABEL_15;
  }

LABEL_13:
  v14 = objc_msgSend(v6, "stepIndex");
LABEL_17:

  return v14;
}

- (id)_matchedLocationForMatchResult:(id)a3 originalLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  int v18;
  uint64_t BOOL;
  MNLocation *v20;
  unint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unsigned int v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unsigned int v47;
  void *v48;
  _BOOL4 v49;
  MNLocation **p_lastKnownGoodLocationOnRoute;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[24];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v20 = 0;
    goto LABEL_46;
  }
  MNGetPuckTrackingLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTurnByTurnLocationTracker::_matchedLocationForMatchResult:originalLocation:", buf, 0xCu);

  }
  v10 = objc_msgSend(v6, "type");
  objc_msgSend(v6, "routeMatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "roadMatch");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MNLocationTracker transportType](self, "transportType");
  if (v12)
  {
    if (v12 == 2)
    {
      BOOL = GEOConfigGetBOOL();
      goto LABEL_14;
    }
    if (v12 != 3)
    {
      BOOL = 0;
      goto LABEL_14;
    }
  }
  v13 = GEOConfigGetBOOL();
  v14 = objc_msgSend(v6, "type");
  v15 = -[MNLocationTracker hasArrived](self, "hasArrived");
  objc_msgSend(v11, "step");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14 == 2;
  LODWORD(v14) = objc_msgSend(v16, "routeSegmentType") == 3;

  v18 = v14 | v15 | v17;
  if (v18)
    BOOL = v13;
  else
    BOOL = 2;
  objc_msgSend(v11, "setShouldProjectLocationAlongRoute:", v18 ^ 1u);
LABEL_14:
  if (-[MNLocationTracker targetLegIndex](self, "targetLegIndex") != 0x7FFFFFFFFFFFFFFFLL && !v10)
  {
    v21 = objc_msgSend(v11, "legIndex");
    if (v21 <= -[MNLocationTracker targetLegIndex](self, "targetLegIndex"))
    {
      v10 = 0;
    }
    else if (v58)
    {
      v10 = 1;
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0D27490]);
      objc_msgSend(v11, "locationCoordinate3D");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v11, "matchedCourse");
      v30 = objc_msgSend(v22, "initWithCoordinateOnRoad:courseOnRoad:", v24, v26, v28, v29);
      v10 = 1;
      v58 = (void *)v30;
    }
  }
  objc_msgSend(v11, "setStepIndex:", -[MNTurnByTurnLocationTracker _modifiedStepIndexForMatchResult:matchType:](self, "_modifiedStepIndexForMatchResult:matchType:", v6, v10));
  switch(v10)
  {
    case 2:
      v33 = 0;
      v20 = -[MNLocation initWithRawLocation:locationMatchType:]([MNLocation alloc], "initWithRawLocation:locationMatchType:", v7, BOOL);
      -[MNLocation setRouteMatch:](v20, "setRouteMatch:", v11);
      break;
    case 1:
      objc_msgSend(v58, "roadFeature");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      -[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:](self, "_roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:", v41, &v59, 0, 0);
      v33 = v59;
      v20 = -[MNLocation initWithRoadMatch:rawLocation:locationMatchType:]([MNLocation alloc], "initWithRoadMatch:rawLocation:locationMatchType:", v58, v7, BOOL);
      -[MNLocation setRouteMatch:](v20, "setRouteMatch:", v11);
      -[MNLocation setRoadName:](v20, "setRoadName:", v33);
      if (v41)
      {
        objc_msgSend(v58, "coordinateOnRoad");
        v43 = v42;
        v45 = v44;
        objc_msgSend(v58, "courseOnRoad");
        if (-[MNTurnByTurnLocationTracker _isRoadFeatureInOppositeDirection:ofCoordinate:course:](self, "_isRoadFeatureInOppositeDirection:ofCoordinate:course:", v41, v43, v45, v46))
        {
          v47 = objc_msgSend(v41, "reverseDirectionDisplaySpeedLimit");
        }
        else
        {
          v47 = objc_msgSend(v41, "displaySpeedLimit");
        }
        -[MNLocation setSpeedLimit:](v20, "setSpeedLimit:", v47);
        -[MNLocation setSpeedLimitIsMPH:](v20, "setSpeedLimitIsMPH:", objc_msgSend(v41, "displaySpeedLimitIsMPH"));
        -[MNLocation setSpeedLimitShieldType:](v20, "setSpeedLimitShieldType:", objc_msgSend(v41, "speedLimitShieldId"));
        v34 = v41;
      }
      else
      {
        -[MNLocation setSpeedLimit:](v20, "setSpeedLimit:", 0);
        v34 = 0;
      }
LABEL_42:

      break;
    case 0:
      *(_QWORD *)buf = 0;
      objc_msgSend(v11, "road");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "feature");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = 0;
      v61 = 0;
      -[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:](self, "_roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:", v32, &v61, &v60, buf);
      v33 = v61;
      v34 = v60;
      v20 = -[MNLocation initWithRouteMatch:rawLocation:locationMatchType:]([MNLocation alloc], "initWithRouteMatch:rawLocation:locationMatchType:", v11, v7, BOOL);
      -[MNLocation setRoadName:](v20, "setRoadName:", v33);
      -[MNLocation setShieldText:](v20, "setShieldText:", v34);
      -[MNLocation setShieldType:](v20, "setShieldType:", *(_QWORD *)buf);
      if (v32)
      {
        objc_msgSend(v11, "locationCoordinate");
        v36 = v35;
        v38 = v37;
        objc_msgSend(v11, "matchedCourse");
        if (-[MNTurnByTurnLocationTracker _isRoadFeatureInOppositeDirection:ofCoordinate:course:](self, "_isRoadFeatureInOppositeDirection:ofCoordinate:course:", v32, v36, v38, v39))
        {
          v40 = objc_msgSend(v32, "reverseDirectionDisplaySpeedLimit");
        }
        else
        {
          v40 = objc_msgSend(v32, "displaySpeedLimit");
        }
        -[MNLocation setSpeedLimit:](v20, "setSpeedLimit:", v40);
        -[MNLocation setSpeedLimitIsMPH:](v20, "setSpeedLimitIsMPH:", objc_msgSend(v32, "displaySpeedLimitIsMPH"));
        -[MNLocation setSpeedLimitShieldType:](v20, "setSpeedLimitShieldType:", objc_msgSend(v32, "speedLimitShieldId"));
      }
      else
      {
        -[MNLocation setSpeedLimit:](v20, "setSpeedLimit:", 0);
      }
      -[MNLocation routeMatch](v20, "routeMatch");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[MNTurnByTurnLocationTracker _shouldAdvanceGuidanceToRouteMatch:](self, "_shouldAdvanceGuidanceToRouteMatch:", v48);

      if (v49)
      {
        p_lastKnownGoodLocationOnRoute = &self->_lastKnownGoodLocationOnRoute;
        objc_storeStrong((id *)p_lastKnownGoodLocationOnRoute, v20);
        -[MNLocation routeMatch](*p_lastKnownGoodLocationOnRoute, "routeMatch");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51 == 0;

        if (!v52)
        {
          -[MNLocation routeMatch](v20, "routeMatch");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNLocation routeMatch](*p_lastKnownGoodLocationOnRoute, "routeMatch");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setRouteCoordinate:", objc_msgSend(v54, "routeCoordinate"));

        }
      }

      goto LABEL_42;
    default:
      v33 = 0;
      v20 = 0;
      break;
  }
  -[MNLocation setTraceIndex:](v20, "setTraceIndex:", objc_msgSend(v7, "traceIndex"));
  objc_msgSend(v6, "detailedMatchInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocation setDetailedMatchInfo:](v20, "setDetailedMatchInfo:", v55);

  if (GEOConfigGetBOOL())
  {
    objc_msgSend(v7, "uuid");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocation setUuid:](v20, "setUuid:", v56);

  }
LABEL_46:

  return v20;
}

- (BOOL)hasArrivedAtFinalDestination
{
  unint64_t lastArrivalLegIndex;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MNTurnByTurnLocationTracker;
  if (!-[MNLocationTracker hasArrived](&v10, sel_hasArrived))
    return 0;
  lastArrivalLegIndex = self->_lastArrivalLegIndex;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = lastArrivalLegIndex >= objc_msgSend(v7, "count") - 1;

  return v8;
}

- (BOOL)_isRoadFeatureInOppositeDirection:(id)a3 ofCoordinate:(id)a4 course:(double)a5
{
  id v5;

  v5 = a3;
  if (v5)
    GEOMultiSectionFeaturePoints();

  return 0;
}

- (int)_routeHintTypeForTransportType:(int)a3
{
  if ((a3 - 1) > 5)
    return 1;
  else
    return dword_1B0BF326C[a3 - 1];
}

- (void)_sendRouteHintForLocation:(id)a3
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  MNTurnByTurnLocationTracker *v52;
  id v53;
  id obj;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  if ((-[MNLocationTracker navigationCapabilities](self, "navigationCapabilities") & 8) != 0)
  {
    v52 = self;
    if (v53 && objc_msgSend(v53, "state") == 1)
    {
      objc_msgSend(v53, "routeMatch");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "route");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "speed");
      v5 = 25.0;
      if (v4 * 20.0 > 25.0)
      {
        objc_msgSend(v53, "speed");
        v5 = v6 * 20.0;
      }
      v7 = objc_msgSend(v49, "routeCoordinate");
      -[GEOPathMatcher matchedSegmentsFromStart:toEnd:](self->_pathMatcher, "matchedSegmentsFromStart:toEnd:", v7, objc_msgSend(v48, "routeCoordinateForDistance:afterRouteCoordinate:", v7, v5));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "count"))
      {
        objc_msgSend(v49, "step");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "transportType");

        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v50, "count") + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending %d route hints: "), objc_msgSend(v50, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          v56 = v12;
        }
        else
        {
          v56 = 0;
        }
        v15 = objc_msgSend(v50, "count");
        if (v15)
        {
          if (v15 > 0x666666666666666)
            std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
          v14 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(v15);
          v17 = &v14[5 * v16];
        }
        else
        {
          v14 = 0;
          v17 = 0;
        }
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        obj = v50;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        v51 = v9;
        if (v18)
        {
          v55 = *(_QWORD *)v58;
          v19 = v14;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v58 != v55)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              if (objc_msgSend(v21, "pointCount"))
              {
                objc_msgSend(v21, "locationCoordinateAt:", 0);
                v23 = v22;
                v25 = v24;
                objc_msgSend(v21, "locationCoordinateAt:", objc_msgSend(v21, "pointCount") - 1);
                v27 = v26;
                v29 = v28;
                objc_msgSend(v21, "road");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "roadID");

                if (v19 >= v17)
                {
                  v32 = 0xCCCCCCCCCCCCCCCDLL * (v19 - v14) + 1;
                  if (v32 > 0x666666666666666)
                    std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                  if (0x999999999999999ALL * (v17 - v14) > v32)
                    v32 = 0x999999999999999ALL * (v17 - v14);
                  if (0xCCCCCCCCCCCCCCCDLL * (v17 - v14) >= 0x333333333333333)
                    v33 = 0x666666666666666;
                  else
                    v33 = v32;
                  if (v33)
                    v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(v33);
                  else
                    v34 = 0;
                  v35 = (uint64_t *)(v33 + 8 * (v19 - v14));
                  *v35 = v31;
                  v35[1] = v23;
                  v35[2] = v25;
                  v35[3] = v27;
                  v35[4] = v29;
                  if (v19 == v14)
                  {
                    v39 = (uint64_t *)(v33 + 8 * (v19 - v14));
                  }
                  else
                  {
                    v36 = v33 + 8 * (v19 - v14);
                    do
                    {
                      v37 = *(_OWORD *)(v19 - 5);
                      v38 = *(_OWORD *)(v19 - 3);
                      v39 = (uint64_t *)(v36 - 40);
                      *(_QWORD *)(v36 - 8) = *(v19 - 1);
                      *(_OWORD *)(v36 - 24) = v38;
                      *(_OWORD *)(v36 - 40) = v37;
                      v19 -= 5;
                      v36 -= 40;
                    }
                    while (v19 != v14);
                  }
                  v17 = (uint64_t *)(v33 + 40 * v34);
                  v19 = v35 + 5;
                  if (v14)
                    operator delete(v14);
                  v14 = v39;
                }
                else
                {
                  *v19 = v31;
                  v19[1] = v23;
                  v19[2] = v25;
                  v19[3] = v27;
                  v19[4] = v29;
                  v19 += 5;
                }
                if (v56)
                {
                  v40 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v21, "road");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "roadID");
                  objc_msgSend(v21, "startRouteCoordinate");
                  GEOPolylineCoordinateAsShortString();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "endRouteCoordinate");
                  GEOPolylineCoordinateAsShortString();
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "stringWithFormat:", CFSTR("%llu | [%@] %f, %f to [%@] %f, %f"), v42, v43, v23, v25, v44, v27, v29);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "addObject:", v45);

                }
              }
            }
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
          }
          while (v18);
        }

        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n\t"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v62 = v47;
          _os_log_impl(&dword_1B0AD7000, v46, OS_LOG_TYPE_DEBUG, "%{private}@", buf, 0xCu);

        }
      }
      else
      {
        v14 = 0;
        v51 = 4;
      }

    }
    else
    {
      v14 = 0;
      v51 = 4;
    }
    -[MNTurnByTurnLocationTracker _routeHintTypeForTransportType:](v52, "_routeHintTypeForTransportType:", -[MNLocationTracker transportType](v52, "transportType"));
    -[MNTurnByTurnLocationTracker _routeHintTypeForTransportType:](v52, "_routeHintTypeForTransportType:", v51);
    CLSetMapMatchingRouteHint();
    if (v14)
      operator delete(v14);
  }

}

- (BOOL)_rerouteReasonSupportsDowngradingToOffline:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFF7) == 1;
}

- (BOOL)_tryOnlineOfflineSwitchingWithRequestParameters:(id)a3 rerouteReason:(unint64_t)a4 error:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t numOfflineAttempts;
  NSObject *v14;
  BOOL v15;
  unint64_t numOnlineAttempts;
  __int16 v17;
  int v18;
  int v19;
  NSObject *v20;
  int v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(v11, "_geo_isNetworkError") & 1) == 0)
    goto LABEL_24;
  if (-[MNTurnByTurnLocationTracker _rerouteReasonSupportsDowngradingToOffline:](self, "_rerouteReasonSupportsDowngradingToOffline:", a4))
  {
    numOfflineAttempts = self->_numOfflineAttempts;
    if (numOfflineAttempts >= GEOConfigGetUInteger())
    {
      self->_numOfflineAttempts = 0;
    }
    else if (objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *MEMORY[0x1E0D26D08]) == 1)
    {
      ++self->_numOfflineAttempts;
      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Will try downgrading to Offline state because of network error in the previously requested reroute to Routing.", (uint8_t *)&v23, 2u);
      }

      -[MNTurnByTurnLocationTracker _changeOfflineMode:reason:requestParameters:errorHandler:](self, "_changeOfflineMode:reason:requestParameters:errorHandler:", 2, a4, v10, v12);
      v15 = 1;
      goto LABEL_25;
    }
  }
  if (a4 != 15)
    goto LABEL_24;
  numOnlineAttempts = self->_numOnlineAttempts;
  if (numOnlineAttempts >= GEOConfigGetUInteger())
  {
    v15 = 0;
    self->_numOnlineAttempts = 0;
    goto LABEL_25;
  }
  v17 = objc_msgSend(MEMORY[0x1E0D272C0], "activeStateForCohortId:", *MEMORY[0x1E0D26D08]);
  v18 = v17;
  if (v17 < 2u)
    goto LABEL_24;
  if (v17 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v23 = 67109120;
      v24 = v18;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)&v23, 8u);
    }
    goto LABEL_24;
  }
  v19 = HIBYTE(v17);
  if (HIBYTE(v17) >= 2u)
  {
    if (HIBYTE(v17) != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v23 = 67109120;
        v24 = v19;
        _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", (uint8_t *)&v23, 8u);
      }
      goto LABEL_18;
    }
LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
LABEL_18:
  ++self->_numOnlineAttempts;
  GEOFindOrCreateLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "Will try another attempt to switch to Online because of network error in the previous request.", (uint8_t *)&v23, 2u);
  }

  v15 = 1;
  -[MNTurnByTurnLocationTracker _changeOfflineMode:reason:requestParameters:errorHandler:](self, "_changeOfflineMode:reason:requestParameters:errorHandler:", 1, 15, v10, v12);
LABEL_25:

  return v15;
}

- (void)_requestRerouteWithReason:(unint64_t)a3 requestParameters:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  GEODirectionsServiceRequest *pendingRequest;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  GEODirectionsServiceRequest *v21;
  GEODirectionsServiceRequest *v22;
  NSObject *v23;
  unint64_t v24;
  const __CFString *v25;
  GEODirectionsServiceRequest *v26;
  id v27;
  _QWORD v28[5];
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  GEODirectionsServiceRequest *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v27 = a5;
  v11 = a6;
  -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  if ((-[MNLocationTracker navigationCapabilities](self, "navigationCapabilities") & 2) != 0)
  {
    self->_rerouteReason = a3;
    self->_numOfflineAttempts = 0;
    self->_numOnlineAttempts = 0;
    if (a3 != 15)
    {
      -[MNLocationTracker safeDelegate](self, "safeDelegate", v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationTrackerWillReroute:", self);

    }
    -[MNLocationTracker _setState:](self, "_setState:", 5, v27);
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "traceRecorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "timeSinceRecordingBegan");
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __106__MNTurnByTurnLocationTracker__requestRerouteWithReason_requestParameters_completionHandler_errorHandler___block_invoke;
    v28[3] = &unk_1E61D3950;
    v28[4] = self;
    v13 = v17;
    v29 = v13;
    v33 = v19;
    v30 = v10;
    v34 = a3;
    v31 = v11;
    v32 = v27;
    objc_msgSend(v20, "requestDirections:handler:", v30, v28);
    v21 = (GEODirectionsServiceRequest *)objc_claimAutoreleasedReturnValue();
    v22 = self->_pendingRequest;
    self->_pendingRequest = v21;

    MNGetMNLocationTrackerLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_rerouteReason - 1;
      if (v24 > 0xE)
        v25 = CFSTR("Unknown");
      else
        v25 = off_1E61D3AA0[v24];
      v26 = self->_pendingRequest;
      *(_DWORD *)buf = 138412546;
      v36 = v25;
      v37 = 2048;
      v38 = v26;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEFAULT, "Requesting reroute with reason %@. _pendingRequest = %p", buf, 0x16u);
    }

  }
  else
  {
    MNGetMNLocationTrackerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Rerouting navigation capability is not enabled (you're probably running a test).", buf, 2u);
    }
  }

}

void __106__MNTurnByTurnLocationTracker__requestRerouteWithReason_requestParameters_completionHandler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  _QWORD *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v14)
    goto LABEL_2;
  v27 = *(_QWORD **)(a1 + 32);
  if (!v27[18])
  {
LABEL_16:
    v14 = 0;
    v27[19] = 0;
    goto LABEL_25;
  }
  if (objc_msgSend(v27, "state") != 5)
  {
    v27 = *(_QWORD **)(a1 + 32);
    if (v27[18])
    {
      MNGetMNLocationTrackerLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
        v37 = 134217984;
        v38 = v29;
        _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_ERROR, "There appears to be a pending directions request (%p) but we are no longer in the RECALCULATING state. Cancelling pending request to ensure state integrity.", (uint8_t *)&v37, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "cancel");
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 144);
      *(_QWORD *)(v30 + 144) = 0;

      v27 = *(_QWORD **)(a1 + 32);
    }
    goto LABEL_16;
  }
LABEL_2:
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 144);
  *(_QWORD *)(v16 + 144) = 0;

  if (v14 && v15)
  {
    v18 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v14, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D27020], "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, v21);

    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v14, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, objc_msgSend(v14, "code"), v20);
    v24 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v24;
  }
  objc_msgSend(*(id *)(a1 + 40), "timeSinceRecordingBegan");
  objc_msgSend(*(id *)(a1 + 40), "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v12, v13, v14, v11, 0, *(double *)(a1 + 72), v25);
  if (v14 || objc_msgSend(v13, "status"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_tryOnlineOfflineSwitchingWithRequestParameters:rerouteReason:error:errorHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), v14, *(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      v26 = *(_QWORD *)(a1 + 56);
      if (v26)
      {
        (*(void (**)(uint64_t, id, id))(v26 + 16))(v26, v13, v14);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "safeDelegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "locationTracker:didFailRerouteWithError:", *(_QWORD *)(a1 + 32), v14);

      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
      objc_msgSend(*(id *)(a1 + 32), "lastMatchedLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "state");

      if (v34 == 1)
        v35 = 2;
      else
        v35 = 1;
      objc_msgSend(*(id *)(a1 + 32), "_setState:", v35);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleSuccessfulRerouteRequest:response:waypoints:", v12, v13, v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
    v36 = *(_QWORD *)(a1 + 64);
    if (v36)
      (*(void (**)(void))(v36 + 16))();
    v14 = 0;
  }
LABEL_25:

}

- (void)_requestRerouteWithReason:(unint64_t)a3 requestHandler:(id)a4 completionHandler:(id)a5 errorHandler:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  id v12;
  GEODirectionsServiceRequest *pendingRequest;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:](self, "_rerouteRequestParametersForLocation:transportType:", v14, -[MNLocationTracker transportType](self, "transportType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, v15);
    -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestParameters:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestParameters:completionHandler:errorHandler:", a3, v15, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handler must not be nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "handler != nil";
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v18, 0x16u);
    }

  }
}

- (id)_routeAttributesFromRouteCoordinate:(PolylineCoordinate)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MNRouteAttributes *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !objc_msgSend(v7, "mainTransportType"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_navigation_geoLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latLng");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v8, "addObject:", v11);
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "routeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentRoute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "waypointsFromRouteCoordinate:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "bestLatLng", (_QWORD)v23);
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v20;
          if (v20)
            objc_msgSend(v8, "addObject:", v20);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v17);
    }

    v21 = -[MNRouteAttributes initWithAttributes:latLngs:]([MNRouteAttributes alloc], "initWithAttributes:latLngs:", v7, v8);
    v7 = v21;
  }
  return v7;
}

- (id)_rerouteRequestParametersForLocation:(id)a3 transportType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = *(_QWORD *)&a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4 <= 3 && (_DWORD)v4 != 1)
  {
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _routeAttributesFromRouteCoordinate:](self, "_routeAttributesFromRouteCoordinate:", objc_msgSend(v9, "routeCoordinate"));
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (-[NSObject mainTransportType](v10, "mainTransportType") == (_DWORD)v4)
      {
LABEL_15:
        v12 = objc_alloc_init(MEMORY[0x1E0D27050]);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v6);
        objc_msgSend(v12, "setCurrentLocation:", v17);

        objc_msgSend(v8, "currentRoute");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCurrentRoute:", v18);

        objc_msgSend(v6, "routeMatch");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRouteCoordinate:", objc_msgSend(v19, "routeCoordinate"));

        objc_msgSend(v12, "setStartingLegIndex:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
        objc_msgSend(v12, "setTransportType:", v4);
        objc_msgSend(v12, "setRouteAttributes:", v10);
        objc_msgSend(v8, "commonOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCommonOptions:", v20);

        objc_msgSend(v6, "routeMatch");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pathSegment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPathSegment:", v22);

        objc_msgSend(v12, "setHasVisitedFirstStop:", -[MNLocationTracker hasVisitedFirstStop](self, "hasVisitedFirstStop"));
        -[MNLocationTracker _auditToken](self, "_auditToken");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAuditToken:", v23);

        objc_msgSend(v8, "requestingAppIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRequestingAppIdentifier:", v24);

        -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "traits");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v12, "setTraits:", v27);

        objc_msgSend(v8, "currentRouteInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "displayETAInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDisplayRemainingTimeToDestination:", (double)(unint64_t)(60 * objc_msgSend(v29, "displayRemainingMinutesToEndOfRoute")));

        -[MNLocationTracker navigationSession](self, "navigationSession");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "recentLocationHistory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRecentLocationHistory:", v31);

        objc_initWeak((id *)buf, self);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke;
        v35[3] = &unk_1E61D39A0;
        objc_copyWeak(&v36, (id *)buf);
        objc_msgSend(v12, "setRequestCallback:", v35);
        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Making a directions request with nil routeAttributes"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v38 = "-[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:]";
        v39 = 2080;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        v41 = 1024;
        v42 = 1095;
        v43 = 2080;
        v44 = "routeAttributes != nil";
        v45 = 2112;
        v46 = v33;
        _os_log_impl(&dword_1B0AD7000, v34, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = off_1E61D3A48[(int)v4];
      v14 = -[NSObject mainTransportType](v10, "mainTransportType");
      if (v14 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E61D3A68[(int)v14];
      }
      *(_DWORD *)buf = 138412546;
      v38 = (const char *)v13;
      v39 = 2112;
      v40 = (const char *)v15;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Reroute requested for (%@) but previous route's transport type was (%@). Creating new route attributes", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D274A8], "defaultRouteAttributesForTransportType:", v4);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = v16;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reroute in turn by turn only supported for driving, walking, and cycling transport types."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v38 = "-[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:]";
    v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
    v41 = 1024;
    v42 = 1088;
    v43 = 2080;
    v44 = "NO";
    v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
  }
  v12 = 0;
LABEL_16:

  return v12;
}

void __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverSessionStateInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSessionState:", v7);

    objc_msgSend(v4, "navigationSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverSessionStateInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedTrafficBanners");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke_2;
    v12[3] = &unk_1E61D3978;
    v13 = v11;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
}

void __82__MNTurnByTurnLocationTracker__rerouteRequestParametersForLocation_transportType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v6, "addDisplayedBannerId:", v7);

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientFeedbackInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setClientFeedbackInfo:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "clientFeedbackInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v10, "addDisplayedBannerEventInfo:", v11);

  }
}

- (void)_handleSuccessfulRerouteRequest:(id)a3 response:(id)a4 waypoints:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  v9 = a5;
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentRouteInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "route");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0D274D8]);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "routeManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "routeAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v9, v18, v8, v24);

  objc_msgSend(v12, "anchorPoints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "routeMatch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "anchorPointsAfter:", objc_msgSend(v21, "routeCoordinate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAnchorPoints:", v22);

  objc_msgSend(v19, "mainRouteInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTurnByTurnLocationTracker _updateForNewRoute:rerouteReason:request:response:](self, "_updateForNewRoute:rerouteReason:request:response:", v23, self->_rerouteReason, v24, v8);

}

- (void)_updateForNewRoute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MNLocation *lastKnownGoodLocationOnRoute;
  void *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  MNLocation *v40;
  void *v41;
  MNLocation *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  char *v55;
  const char *v56;
  const char *v57;
  void *v58;
  id v59;
  void *v60;
  GEOPathMatcher *v61;
  GEOPathMatcher *pathMatcher;
  MNTrafficIncidentAlertUpdater *trafficIncidentAlertUpdater;
  void *v64;
  void *v65;
  char *v66;
  id v67;
  void *v68;
  void *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v66 = (char *)a5;
  v67 = a6;
  if (v10 && (objc_msgSend(v10, "route"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v68 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (a4 - 1 > 0xE)
        v13 = CFSTR("Unknown");
      else
        v13 = off_1E61D3AA0[a4 - 1];
      *(_DWORD *)buf = 138412802;
      v71 = (const char *)v13;
      v72 = 2112;
      v73 = v66;
      v74 = 2112;
      v75 = v67;
    }

    -[MNLocationTracker navigationSession](self, "navigationSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "routeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentRouteInfo");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v71 = "-[MNTurnByTurnLocationTracker _updateForNewRoute:rerouteReason:request:response:]";
      v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      v74 = 1024;
      LODWORD(v75) = 1154;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }

  }
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "routeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentRoute");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "route");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  lastKnownGoodLocationOnRoute = self->_lastKnownGoodLocationOnRoute;
  self->_lastKnownGoodLocationOnRoute = 0;

  if (a4 - 7 <= 2)
  {
    -[MNLocationTracker arrivalInfo](self, "arrivalInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "arrivalState") == 0;

    if (!v21)
    {
      v22 = 5;
LABEL_24:
      -[MNArrivalUpdater forceDepartureForCurrentLeg:](self->_arrivalUpdater, "forceDepartureForCurrentLeg:", v22);
LABEL_32:
      v23 = 1;
      goto LABEL_33;
    }
  }
  v23 = 1;
  if ((uint64_t)a4 <= 9)
  {
    if (a4 == 1)
    {
      v24 = -[MNLocationTracker targetLegIndex](self, "targetLegIndex");
      objc_msgSend(v65, "legs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 >= objc_msgSend(v25, "count"))
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(v65, "legs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "destination");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v69, "legs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "destination");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "uniqueWaypointID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "uniqueWaypointID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v35 = v33;
      if (v34 | v35)
      {
        v36 = (void *)v35;
        v37 = objc_msgSend((id)v34, "isEqual:", v35);

        if ((v37 & 1) == 0)
          -[MNArrivalUpdater forceDepartureForCurrentLeg:](self->_arrivalUpdater, "forceDepartureForCurrentLeg:", 4);
      }

      goto LABEL_32;
    }
    if (a4 != 3)
      goto LABEL_33;
    goto LABEL_22;
  }
  switch(a4)
  {
    case 0xAuLL:
      goto LABEL_22;
    case 0xCuLL:
      v22 = 6;
      goto LABEL_24;
    case 0xFuLL:
LABEL_22:
      v23 = 0;
      break;
  }
LABEL_33:
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lastLocation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = [MNLocation alloc];
  objc_msgSend(v39, "rawLocation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[MNLocation initWithRawLocation:](v40, "initWithRawLocation:", v41);

  v43 = objc_alloc(MEMORY[0x1E0D27168]);
  objc_msgSend(v39, "rawLocation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v43, "initWithCLLocation:", v44);

  -[GEONavigationMapMatcher updateForReroute:location:routeStartsFromLocation:](self->_mapMatcher, "updateForReroute:location:routeStartsFromLocation:", v69, v45, v23);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "type"))
  {
    -[MNLocationTracker _setState:](self, "_setState:", 3);
LABEL_40:
    v51 = 0;
    goto LABEL_41;
  }
  -[MNLocationTracker _setState:](self, "_setState:", 2);
  if (a4 != 10)
    goto LABEL_40;
  objc_msgSend(v69, "legs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (unint64_t)objc_msgSend(v47, "count") > 1;

  if (!v48)
    goto LABEL_40;
  GEOFindOrCreateLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v49, OS_LOG_TYPE_DEFAULT, "User selected an alternate multi-waypoint route. Attempting to guess target leg index from route match.", buf, 2u);
  }

  objc_msgSend(v46, "routeMatch");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "legIndex");

LABEL_41:
  -[MNLocationTracker _setTargetLegIndex:](self, "_setTargetLegIndex:", v51);
  -[MNTurnByTurnLocationTracker _matchedLocationForMatchResult:originalLocation:](self, "_matchedLocationForMatchResult:originalLocation:", v46, v42);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker _updateMatchedLocation:](self, "_updateMatchedLocation:", v52);
  GEOFindOrCreateLog();
  v53 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v52, "routeMatch");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "routeCoordinate");
    GEOPolylineCoordinateAsShortString();
    v55 = (char *)(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "coordinate");
    v57 = v56;
    objc_msgSend(v52, "coordinate");
    *(_DWORD *)buf = 138412802;
    v71 = v55;
    v72 = 2048;
    v73 = v57;
    v74 = 2048;
    v75 = v58;
    _os_log_impl(&dword_1B0AD7000, v53, OS_LOG_TYPE_DEFAULT, "Handling reroute. Location on new route: [%@], %f, %f", buf, 0x20u);

  }
  v59 = objc_alloc(MEMORY[0x1E0D27320]);
  -[MNLocationTracker _auditToken](self, "_auditToken");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (GEOPathMatcher *)objc_msgSend(v59, "initWithRoute:auditToken:", v69, v60);
  pathMatcher = self->_pathMatcher;
  self->_pathMatcher = v61;

  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  objc_msgSend(v68, "route");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlertUpdater updateForReroute:](trafficIncidentAlertUpdater, "updateForReroute:", v64);

  LODWORD(v64) = objc_msgSend(v69, "transportType");
  if ((_DWORD)v64 == -[MNLocationTracker transportType](self, "transportType"))
    -[MNTurnByTurnLocationTracker _updateForReroute:rerouteReason:request:response:](self, "_updateForReroute:rerouteReason:request:response:", v68, a4, v66, v67);
  else
    -[MNTurnByTurnLocationTracker _updateForNewTransportType:rerouteReason:request:response:](self, "_updateForNewTransportType:rerouteReason:request:response:", v68, a4, v66, v67);

}

- (void)_cancelPendingRerouteRequest
{
  NSObject *v3;
  unint64_t v4;
  const __CFString *v5;
  GEODirectionsServiceRequest *pendingRequest;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_pendingRequest)
  {
    MNGetMNLocationTrackerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = self->_rerouteReason - 1;
      if (v4 > 0xE)
        v5 = CFSTR("Unknown");
      else
        v5 = off_1E61D3AA0[v4];
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling pending reroute of type: %@", (uint8_t *)&v8, 0xCu);
    }

    -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
    pendingRequest = self->_pendingRequest;
    self->_pendingRequest = 0;

    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationTrackerDidCancelReroute:", self);

  }
}

- (unint64_t)_offRouteRequestType
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRouteInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "source");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 5;
  else
    return 4;
}

- (void)_handleWaypointRerouteForLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  BOOL v18;
  NSMutableArray *rerouteDates;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tracePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (GEOConfigGetBOOL() & 1) != 0)
  {
    objc_msgSend(v8, "position");
    objc_msgSend(v8, "guidanceEventNearTimestamp:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "eventType") == 16 || objc_msgSend(v9, "eventType") == 17)
    {
      v10 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke;
      v31[3] = &unk_1E61D39C8;
      v31[4] = self;
      v11 = (void *)MEMORY[0x1B5E0E364](v31);
      objc_msgSend(v8, "position");
      v13 = v12;
      v29[0] = v10;
      v29[1] = 3221225472;
      v29[2] = __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke_69;
      v29[3] = &unk_1E61D39F0;
      v14 = v11;
      v29[4] = self;
      v30 = v14;
      if ((objc_msgSend(v8, "requestDirectionsNearTimestamp:withHandler:", v29, v13) & 1) != 0)
      {
        -[MNTurnByTurnLocationTracker _cancelPendingRerouteRequest](self, "_cancelPendingRerouteRequest");
        objc_msgSend(v5, "timestamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location has no timestamp."));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v33 = "-[MNTurnByTurnLocationTracker _handleWaypointRerouteForLocation:]";
            v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
            v36 = 1024;
            v37 = 1311;
            v38 = 2080;
            v39 = "location.timestamp != nil";
            v40 = 2112;
            v41 = v27;
            _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

        }
        objc_msgSend(v5, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          rerouteDates = self->_rerouteDates;
          if (!rerouteDates)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v21 = self->_rerouteDates;
            self->_rerouteDates = v20;

            rerouteDates = self->_rerouteDates;
          }
          objc_msgSend(v5, "timestamp");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](rerouteDates, "addObject:", v22);

          v23 = -[NSMutableArray count](self->_rerouteDates, "count");
          if (v23 > GEOConfigGetUInteger())
            -[NSMutableArray removeObjectAtIndex:](self->_rerouteDates, "removeObjectAtIndex:", 0);
        }
        objc_storeStrong((id *)&self->_previousRerouteLocation, a3);
        GEOFindOrCreateLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_DEFAULT, "Rerouting using a response from the navtrace", buf, 2u);
        }

        v25 = objc_msgSend(v9, "eventType") - 15;
        if (v25 <= 2)
          self->_rerouteReason = qword_1B0BF3288[v25];
        -[MNLocationTracker safeDelegate](self, "safeDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "locationTrackerWillReroute:", self);

        -[MNLocationTracker _setState:](self, "_setState:", 5);
      }

    }
  }

}

void __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationTracker:didFailRerouteWithError:", *(_QWORD *)(a1 + 32), v6);
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isNavigable") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    GEOErrorDomain();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -403, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "safeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationTracker:didFailRerouteWithError:", *(_QWORD *)(a1 + 32), v7);

    objc_msgSend(*(id *)(a1 + 32), "_setState:", 8);
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "No longer inside a navigable area", v12, 2u);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __65__MNTurnByTurnLocationTracker__handleWaypointRerouteForLocation___block_invoke_69(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 || objc_msgSend(v12, "status"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_handleSuccessfulRerouteRequest:response:waypoints:", v11, v12, v15);

}

- (void)_handleOffRouteForLocation:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSMutableArray *rerouteDates;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  char v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_pendingRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to reroute while another reroute is in progress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v41 = "-[MNTurnByTurnLocationTracker _handleOffRouteForLocation:]";
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      v44 = 1024;
      v45 = 1354;
      v46 = 2080;
      v47 = "NO";
      v48 = 2112;
      v49 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  else if (-[MNArrivalUpdater isInPreArrivalRegion](self->_arrivalUpdater, "isInPreArrivalRegion")
         && (objc_msgSend(v5, "horizontalAccuracy"), v9 = v8, GEOConfigGetDouble(), v9 >= v10))
  {
    GEOFindOrCreateLog();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v32 = v31;
      GEOConfigGetDouble();
      *(_DWORD *)buf = 134218240;
      v41 = v32;
      v42 = 2048;
      v43 = v33;
      _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_DEFAULT, "Off route but not rerouting because location is in pre-arrival region and location accuracy (%gm) is worse than the required accuracy (%gm)", buf, 0x16u);
    }

  }
  else if ((-[MNLocationTracker navigationCapabilities](self, "navigationCapabilities") & 2) != 0)
  {
    objc_msgSend(v5, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Location has no timestamp."));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v41 = "-[MNTurnByTurnLocationTracker _handleOffRouteForLocation:]";
        v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
        v44 = 1024;
        v45 = 1369;
        v46 = 2080;
        v47 = "location.timestamp != nil";
        v48 = 2112;
        v49 = v34;
        _os_log_impl(&dword_1B0AD7000, v35, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    objc_msgSend(v5, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      rerouteDates = self->_rerouteDates;
      if (!rerouteDates)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v17 = self->_rerouteDates;
        self->_rerouteDates = v16;

        rerouteDates = self->_rerouteDates;
      }
      objc_msgSend(v5, "timestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](rerouteDates, "addObject:", v18);

      v19 = -[NSMutableArray count](self->_rerouteDates, "count");
      if (v19 > GEOConfigGetUInteger())
        -[NSMutableArray removeObjectAtIndex:](self->_rerouteDates, "removeObjectAtIndex:", 0);
    }
    objc_storeStrong((id *)&self->_previousRerouteLocation, a3);
    v20 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke;
    v39[3] = &unk_1E61D39C8;
    v39[4] = self;
    v21 = (void *)MEMORY[0x1B5E0E364](v39);
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "traceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tracePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_24;
    if (!GEOConfigGetBOOL())
      goto LABEL_24;
    objc_msgSend(v24, "position");
    v26 = v25;
    v37[0] = v20;
    v37[1] = 3221225472;
    v37[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_76;
    v37[3] = &unk_1E61D39F0;
    v37[4] = self;
    v38 = v21;
    v27 = objc_msgSend(v24, "requestDirectionsNearTimestamp:withHandler:", v37, v26);

    if ((v27 & 1) != 0)
    {
      GEOFindOrCreateLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_DEFAULT, "Rerouting using a response from the navtrace", buf, 2u);
      }

      self->_rerouteReason = 1;
      -[MNLocationTracker safeDelegate](self, "safeDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "locationTrackerWillReroute:", self);

    }
    else
    {
LABEL_24:
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_77;
      v36[3] = &unk_1E61D3820;
      v36[4] = self;
      -[MNTurnByTurnLocationTracker _requestRerouteWithReason:requestHandler:completionHandler:errorHandler:](self, "_requestRerouteWithReason:requestHandler:completionHandler:errorHandler:", 1, v36, 0, v21);
    }
    -[MNLocationTracker _setState:](self, "_setState:", 5);

  }
  else
  {
    MNGetMNLocationTrackerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Rerouting navigation capability is not enabled (you're probably running a test).", buf, 2u);
    }

  }
}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationTracker:didFailRerouteWithError:", *(_QWORD *)(a1 + 32), v6);
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isNavigable") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    GEOErrorDomain();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -403, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "safeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationTracker:didFailRerouteWithError:", *(_QWORD *)(a1 + 32), v7);

    objc_msgSend(*(id *)(a1 + 32), "_setState:", 8);
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "No longer inside a navigable area", v12, 2u);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_76(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 || objc_msgSend(v12, "status"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_handleSuccessfulRerouteRequest:response:waypoints:", v11, v12, v15);

}

void __58__MNTurnByTurnLocationTracker__handleOffRouteForLocation___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestType:", objc_msgSend(*(id *)(a1 + 32), "_offRouteRequestType"));

}

- (BOOL)_allowRerouteForLocation:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unint64_t UInteger;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint8_t buf[4];
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    LOBYTE(a4) = 1;
    goto LABEL_22;
  }
  GEOConfigGetDouble();
  v9 = v8;
  objc_msgSend(v6, "coordinate");
  GEOCalculateDistance();
  v11 = v10;
  if (v10 < v9)
  {
    MNGetMNLocationTrackerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = v11;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "Suppressing reroute because current location is too close to origin (%0.1f meters)", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!-[NSMutableArray count](self->_rerouteDates, "count"))
    goto LABEL_14;
  GEOConfigGetDouble();
  v14 = v13;
  objc_msgSend(v6, "coordinate");
  -[MNLocation coordinate](self->_previousRerouteLocation, "coordinate");
  GEOCalculateDistance();
  if (v15 < v14)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Suppressing reroute because the current location is too close to the previous reroute location (%0.1f meters)"), *(_QWORD *)&v15);
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2938];
      v41 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_navigation_errorWithCode:userInfo:", 14, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      LOBYTE(a4) = 0;
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  GEOConfigGetDouble();
  v19 = v18;
  objc_msgSend(v6, "timestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray lastObject](self->_rerouteDates, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v21);
  v23 = v22;

  if (v23 >= v19)
  {
LABEL_14:
    UInteger = GEOConfigGetUInteger();
    if (UInteger
      && -[NSMutableArray count](self->_rerouteDates, "count") >= UInteger
      && (!-[MNArrivalUpdater isInPreArrivalRegion](self->_arrivalUpdater, "isInPreArrivalRegion")
       || GEOConfigGetBOOL()))
    {
      v27 = -[NSMutableArray count](self->_rerouteDates, "count");
      if (v27 - UInteger < -[NSMutableArray count](self->_rerouteDates, "count"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_rerouteDates, "objectAtIndexedSubscript:");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timestamp");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", v12);
        v30 = v29;

        GEOConfigGetDouble();
        if (v30 < v31)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Throttling reroute because too many (%d) have been requested in a short interval (%0.1f seconds)"), -[NSMutableArray count](self->_rerouteDates, "count"), *(_QWORD *)&v30);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v36 = *MEMORY[0x1E0CB2938];
            v37 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_navigation_errorWithCode:userInfo:", 15, v35);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_13;
        }

      }
    }
    LOBYTE(a4) = -[MNTurnByTurnLocationTracker _allowRerouteForLocation:](self, "_allowRerouteForLocation:", v6);
    goto LABEL_22;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Suppressing reroute because the previous reroute is too recent (%0.1f seconds)"), *(_QWORD *)&v23);
    v12 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2938];
    v39 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_navigation_errorWithCode:userInfo:", 14, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_22:

  return (char)a4;
}

- (void)setNavigationSessionState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MNTurnByTurnLocationTracker;
  -[MNLocationTracker setNavigationSessionState:](&v6, sel_setNavigationSessionState_, v4);
  -[MNArrivalUpdater setNavigationSessionState:](self->_arrivalUpdater, "setNavigationSessionState:", v4);
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNOfflineCoordinator setNavigationSessionState:](self->_offlineCoordinator, "setNavigationSessionState:", v5);

}

- (BOOL)isRerouting
{
  return self->_pendingRequest != 0;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSDate *startDate;
  void *v12;
  void *v13;
  double v14;
  double v15;
  MNArrivalUpdater *v16;
  MNArrivalUpdater *arrivalUpdater;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  _TtC10Navigation20MNOfflineCoordinator *v32;
  void *v33;
  _TtC10Navigation20MNOfflineCoordinator *v34;
  _TtC10Navigation20MNOfflineCoordinator *offlineCoordinator;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MNTurnByTurnLocationTracker;
  -[MNLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v36, sel_startTrackingWithInitialLocation_targetLegIndex_, v6, a4);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MNTimeManager currentDate](MNTimeManager, "currentDate");
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v10;

  objc_msgSend(v9, "origin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latLng");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinate");
  self->_originCoordinate.latitude = v14;
  self->_originCoordinate.longitude = v15;

  v16 = objc_alloc_init(MNArrivalUpdater);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = v16;

  -[MNArrivalUpdater setDelegate:](self->_arrivalUpdater, "setDelegate:", self);
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNArrivalUpdater setNavigationSessionState:](self->_arrivalUpdater, "setNavigationSessionState:", v18);

  -[MNArrivalUpdater start](self->_arrivalUpdater, "start");
  self->_lastArrivalLegIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    a4 = 0;
  objc_msgSend(v9, "uniqueRouteID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (v21 && objc_msgSend(v6, "state") == 1)
  {
    GEOFindOrCreateLog();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "routeMatch");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "routeCoordinate");
      GEOPolylineCoordinateAsShortString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v24;
      v39 = 1024;
      v40 = a4;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking with a route matched location at [%@], targetLegIndex: %d", buf, 0x12u);

    }
    v25 = 2;
    v26 = v22;
  }
  else
  {
    objc_msgSend(v9, "legs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "origin");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MNTurnByTurnLocationTracker _isLocation:nearOrigin:](self, "_isLocation:nearOrigin:", v6, v28);

    if (v29)
    {
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = a4;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking from PROCEEDING_TO_ROUTE. targetLegIndex: %d", buf, 8u);
      }
      v25 = 1;
    }
    else
    {
      GEOFindOrCreateLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = a4;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_DEFAULT, "Starting location tracking from OFF_ROUTE_OFF_ROAD state. targetLegIndex: %d", buf, 8u);
      }
      v25 = 3;
    }
  }

  -[MNLocationTracker _setState:](self, "_setState:", v25);
  -[MNLocationTracker _setTargetLegIndex:](self, "_setTargetLegIndex:", a4);
  -[GEONavigationMapMatcher setTargetLegIndex:](self->_mapMatcher, "setTargetLegIndex:", a4);
  if ((-[MNLocationTracker navigationCapabilities](self, "navigationCapabilities") & 0x10) != 0)
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v31, OS_LOG_TYPE_DEFAULT, "Starting offline coordinator.", buf, 2u);
    }

    v32 = [_TtC10Navigation20MNOfflineCoordinator alloc];
    -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MNOfflineCoordinator initWithNavigationSessionState:](v32, "initWithNavigationSessionState:", v33);
    offlineCoordinator = self->_offlineCoordinator;
    self->_offlineCoordinator = v34;

    -[MNOfflineCoordinator setDelegate:](self->_offlineCoordinator, "setDelegate:", self);
    -[MNOfflineCoordinator start](self->_offlineCoordinator, "start");
  }
  else
  {
    GEOFindOrCreateLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_DEFAULT, "Not starting offline coordinator because navigation capability is disabled.", buf, 2u);
    }

  }
}

- (void)stopTracking
{
  _TtC10Navigation20MNOfflineCoordinator *offlineCoordinator;
  MNTrafficIncidentAlertUpdater *trafficIncidentAlertUpdater;
  MNArrivalUpdater *arrivalUpdater;
  NSMutableArray *rerouteDates;
  MNLocation *previousRerouteLocation;

  -[MNLocationTracker _setState:](self, "_setState:", 0);
  -[MNOfflineCoordinator setDelegate:](self->_offlineCoordinator, "setDelegate:", 0);
  -[MNOfflineCoordinator stop](self->_offlineCoordinator, "stop");
  offlineCoordinator = self->_offlineCoordinator;
  self->_offlineCoordinator = 0;

  -[MNTrafficIncidentAlertUpdater clearAlerts](self->_trafficIncidentAlertUpdater, "clearAlerts");
  -[MNTrafficIncidentAlertUpdater setDelegate:](self->_trafficIncidentAlertUpdater, "setDelegate:", 0);
  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  self->_trafficIncidentAlertUpdater = 0;

  -[MNArrivalUpdater setDelegate:](self->_arrivalUpdater, "setDelegate:", 0);
  arrivalUpdater = self->_arrivalUpdater;
  self->_arrivalUpdater = 0;

  -[GEODirectionsServiceRequest cancel](self->_pendingRequest, "cancel");
  rerouteDates = self->_rerouteDates;
  self->_rerouteDates = 0;

  previousRerouteLocation = self->_previousRerouteLocation;
  self->_previousRerouteLocation = 0;

  -[MNTurnByTurnLocationTracker _sendRouteHintForLocation:](self, "_sendRouteHintForLocation:", 0);
}

- (void)updateLocation:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MNTurnByTurnLocationTracker hasArrivedAtFinalDestination](self, "hasArrivedAtFinalDestination"))
  {
    -[MNArrivalUpdater updateForLocation:](self->_arrivalUpdater, "updateForLocation:", v4);
  }
  else if (v4 == v5)
  {
    -[MNTurnByTurnLocationTracker _updateStateForLocation:](self, "_updateStateForLocation:", v5);
    -[MNArrivalUpdater updateForLocation:](self->_arrivalUpdater, "updateForLocation:", v5);
    if (-[MNLocationTracker state](self, "state") == 2)
    {
      if (self->_pendingRequest && self->_rerouteReason == 1)
        -[MNTurnByTurnLocationTracker _cancelPendingRerouteRequest](self, "_cancelPendingRerouteRequest");
      else
        -[MNTurnByTurnLocationTracker _handleWaypointRerouteForLocation:](self, "_handleWaypointRerouteForLocation:", v5);
    }
    else if (-[MNLocationTracker state](self, "state") == 4)
    {
      -[MNTurnByTurnLocationTracker _handleOffRouteForLocation:](self, "_handleOffRouteForLocation:", v5);
    }
    -[MNTurnByTurnLocationTracker _updateSwitchTransportTypeForLocation:](self, "_updateSwitchTransportTypeForLocation:", v5);
    -[MNTrafficIncidentAlertUpdater updateForLocation:](self->_trafficIncidentAlertUpdater, "updateForLocation:", v5);
    -[MNTurnByTurnLocationTracker _updateForLocation:](self, "_updateForLocation:", v5);
    if (!-[MNLocationTracker hasArrived](self, "hasArrived"))
      -[MNTurnByTurnLocationTracker _sendRouteHintForLocation:](self, "_sendRouteHintForLocation:", v5);
  }

}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTurnByTurnLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v26, 0xCu);

  }
  MNGetMNLocationTrackerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedTBTLocationForLocation", ", (uint8_t *)&v26, 2u);
  }

  if (objc_msgSend(v4, "type") != 6)
    goto LABEL_15;
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_DEFAULT, "Incoming cell location | No previous good location", (uint8_t *)&v26, 2u);
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  GEOConfigGetDouble();
  if (v15 >= v16)
  {
    GEOFindOrCreateLog();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C9E3B8], "_navigation_stringWithType:", objc_msgSend(v11, "type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v18;
      v28 = 2048;
      v29 = v15;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_DEFAULT, "Incoming cell location | Previous location: %@, %0.1fs", (uint8_t *)&v26, 0x16u);

    }
LABEL_14:

LABEL_15:
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v4);
    -[MNTurnByTurnLocationTracker _overrideLocationForLocation:](self, "_overrideLocationForLocation:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEONavigationMapMatcher matchLocation:transportType:](self->_mapMatcher, "matchLocation:transportType:", v11, -[MNLocationTracker transportType](self, "transportType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _matchedLocationForMatchResult:originalLocation:](self, "_matchedLocationForMatchResult:originalLocation:", v20, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = v22;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v23, OS_SIGNPOST_INTERVAL_END, v8, "MatchedTBTLocationForLocation", ", (uint8_t *)&v26, 2u);
    }
    goto LABEL_21;
  }
  GEOFindOrCreateLog();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C9E3B8], "_navigation_stringWithType:", objc_msgSend(v11, "type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v24;
    v28 = 2048;
    v29 = v15;
    _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring cell location | Previous location: %@, %0.1fs", (uint8_t *)&v26, 0x16u);

  }
  v21 = 0;
  v20 = v23;
LABEL_21:

  return v21;
}

- (void)traceJumpedInTime
{
  MNLocation *lastKnownGoodLocationOnRoute;
  NSObject *v3;
  uint8_t v4[16];

  lastKnownGoodLocationOnRoute = self->_lastKnownGoodLocationOnRoute;
  self->_lastKnownGoodLocationOnRoute = 0;

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "last known good location on route set to nil", v4, 2u);
  }

}

- (id)_newMapMatcherForRoute:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136316162;
    v9 = "-[MNTurnByTurnLocationTracker _newMapMatcherForRoute:]";
    v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
    v12 = 1024;
    v13 = 1650;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v8, 0x30u);

  }
  return 0;
}

- (id)_trafficIncidentAlertUpdater
{
  MNTrafficIncidentAlertUpdater *trafficIncidentAlertUpdater;
  MNTrafficIncidentAlertUpdater *v4;
  MNTrafficIncidentAlertUpdater *v5;

  trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  if (!trafficIncidentAlertUpdater)
  {
    v4 = (MNTrafficIncidentAlertUpdater *)objc_opt_new();
    v5 = self->_trafficIncidentAlertUpdater;
    self->_trafficIncidentAlertUpdater = v4;

    -[MNTrafficIncidentAlertUpdater setDelegate:](self->_trafficIncidentAlertUpdater, "setDelegate:", self);
    trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
  }
  return trafficIncidentAlertUpdater;
}

- (id)_overrideLocationForLocation:(id)a3
{
  return a3;
}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
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
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "route");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "transportType");
  v15 = -[MNLocationTracker transportType](self, "transportType");

  if (v14 != v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected transport type change when calling _updateForReroute:"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "-[MNTurnByTurnLocationTracker _updateForReroute:rerouteReason:request:response:]";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTurnByTurnLocationTracker.mm";
      v23 = 1024;
      v24 = 1674;
      v25 = 2080;
      v26 = "routeInfo.route.transportType == self.transportType";
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
    }

  }
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locationTracker:didReroute:newAlternateRoutes:rerouteReason:request:response:", self, v10, 0, a4, v11, v12);

}

- (void)_updateForNewTransportType:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = a6;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationTracker:didSwitchToNewTransportTypeWithRoute:rerouteReason:request:response:", self, v13, a4, v10, v11);

}

- (void)_updateForArrivalAtLegIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[MNTurnByTurnLocationTracker _cancelPendingRerouteRequest](self, "_cancelPendingRerouteRequest");
  -[MNTurnByTurnLocationTracker _sendRouteHintForLocation:](self, "_sendRouteHintForLocation:", 0);
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentRoute");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "legs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v14, "legs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationTracker:didArriveAtWaypoint:endOfLegIndex:", self, v12, a3);

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationTrackerDidArrive:", self);

}

- (void)_updateForDepartureFromLegIndex:(unint64_t)a3 withReason:(unint64_t)a4
{
  void *v4;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;

  -[MNTurnByTurnLocationTracker _cancelPendingRerouteRequest](self, "_cancelPendingRerouteRequest");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    a3 = -[MNLocationTracker targetLegIndex](self, "targetLegIndex");
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentRoute");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (a3 >= v11)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v18, "legs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a4 == 6)
  {
    -[MNLocationTracker _setTargetLegIndex:](self, "_setTargetLegIndex:", 0);
  }
  else
  {
    objc_msgSend(v18, "legs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") - 1;
    if (a3 + 1 >= v15)
    {
      objc_msgSend(v18, "legs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v4, "count") - 1;
    }
    else
    {
      v16 = a3 + 1;
    }
    -[MNLocationTracker _setTargetLegIndex:](self, "_setTargetLegIndex:", v16);
    if (a3 + 1 >= v15)

  }
  -[GEONavigationMapMatcher setTargetLegIndex:](self->_mapMatcher, "setTargetLegIndex:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
  -[MNLocationTracker _setState:](self, "_setState:", 1);
  self->_lastArrivalLegIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "locationTracker:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:", self, v13, a3, a4);

}

- (void)_updateForNewTrafficIncidentAlerts:(id)a3
{
  id v4;
  MNTrafficIncidentAlertUpdater *v5;
  MNTrafficIncidentAlertUpdater *trafficIncidentAlertUpdater;
  uint64_t BOOL;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  MNTrafficIncidentAlertUpdater *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_trafficIncidentAlertUpdater)
  {
    v5 = objc_alloc_init(MNTrafficIncidentAlertUpdater);
    trafficIncidentAlertUpdater = self->_trafficIncidentAlertUpdater;
    self->_trafficIncidentAlertUpdater = v5;

    -[MNTrafficIncidentAlertUpdater setDelegate:](self->_trafficIncidentAlertUpdater, "setDelegate:", self);
  }
  BOOL = GEOConfigGetBOOL();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "triggerRange", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

        BOOL = BOOL & v13;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[MNTrafficIncidentAlertUpdater setUseTriggerPointRangeBannerQueuing:](self->_trafficIncidentAlertUpdater, "setUseTriggerPointRangeBannerQueuing:", BOOL);
  v14 = self->_trafficIncidentAlertUpdater;
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlertUpdater updateForAlertsFromResponse:updatedLocation:](v14, "updateForAlertsFromResponse:updatedLocation:", v8, v15);

}

- (BOOL)_allowRerouteForLocation:(id)a3
{
  return 1;
}

- (int)_detectedMotionForLocation:(id)a3
{
  return 4;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  return 0;
}

- (void)_setIsNavigatingInLowGuidance:(BOOL)a3
{
  self->_isNavigatingInLowGuidance = a3;
}

- (void)forceOnRoute:(id)a3 atLocation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[GEONavigationMapMatcher setRoute:](self->_mapMatcher, "setRoute:", 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v6);
  v8 = (id)-[GEONavigationMapMatcher updateForReroute:location:routeStartsFromLocation:](self->_mapMatcher, "updateForReroute:location:routeStartsFromLocation:", v9, v7, 0);

}

- (void)arrivalUpdater:(id)a3 didUpdateArrivalInfo:(id)a4
{
  -[MNLocationTracker _updateArrivalInfo:](self, "_updateArrivalInfo:", a4);
}

- (void)arrivalUpdater:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v6;

  -[MNLocationTracker safeDelegate](self, "safeDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationTracker:isApproachingEndOfLeg:", self, a4);

}

- (void)arrivalUpdater:(id)a3 didArriveAtEndOfLegIndex:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = a4;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Arrival detected for leg: %d", (uint8_t *)v12, 8u);
  }

  self->_lastArrivalLegIndex = a4;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "count") - 1 > a4;

  if ((_DWORD)v8)
    v11 = 7;
  else
    v11 = 6;
  -[MNLocationTracker _setState:](self, "_setState:", v11);
  -[MNTurnByTurnLocationTracker _updateForArrivalAtLegIndex:](self, "_updateForArrivalAtLegIndex:", a4);

}

- (void)arrivalUpdater:(id)a3 didEnterPreArrivalStateForLegIndex:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a4;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Pre-arrival detected for leg: %d", (uint8_t *)v16, 8u);
  }

  -[MNLocationTracker navigationSession](self, "navigationSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "count") > a4;

  if ((_DWORD)v7)
  {
    objc_msgSend(v9, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locationTracker:didEnterPreArrivalStateForWaypoint:endOfLegIndex:", self, v13, a4);

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationTrackerDidEnterPreArrivalState:", self);

}

- (void)arrivalUpdater:(id)a3 didDepartFromLegIndex:(unint64_t)a4 withReason:(unint64_t)a5
{
  NSObject *v8;
  const __CFString *v9;
  _DWORD v10[2];
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a5 - 1 > 5)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E61D3B18[a5 - 1];
    v10[0] = 67109378;
    v10[1] = a4;
    v11 = 2112;
    v12 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Departure detected from leg: %d, reason: %@", (uint8_t *)v10, 0x12u);
  }

  -[MNTurnByTurnLocationTracker _updateForDepartureFromLegIndex:withReason:](self, "_updateForDepartureFromLegIndex:withReason:", a4, a5);
}

- (void)arrivalUpdater:(id)a3 didTimeoutAtLegIndex:(unint64_t)a4 withReason:(unint64_t)a5
{
  int v6;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 == 1)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = v6;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for departure from leg at index: %d", (uint8_t *)&v12, 8u);
    }

    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationTracker:didEndNavigatingWithReason:", self, 4);
    goto LABEL_9;
  }
  if (!a5)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = v6;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "Timed out in arrival region based on server parameters at leg index: %d", (uint8_t *)&v12, 8u);
    }

    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationTracker:didEndNavigatingWithReason:", self, 7);
LABEL_9:

  }
}

- (void)arrivalUpdater:(id)a3 shouldShowChargingInfoForWaypoint:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationTracker:shouldShowChargingInfoForWaypoint:", self, v6);

}

- (void)trafficIncidentAlertUpdater:(id)a3 receivedAlert:(id)a4 responseCallback:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationTracker:receivedTrafficIncidentAlert:responseCallback:", self, v9, v7);

}

- (void)trafficIncidentAlertUpdater:(id)a3 invalidatedAlert:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationTracker:invalidatedTrafficIncidentAlert:", self, v6);

}

- (void)trafficIncidentAlertUpdater:(id)a3 didDismissAlert:(id)a4 withReroute:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v5 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(v7, "alertType");
  if ((unint64_t)(v8 - 3) >= 2)
  {
    if (v8 == 1)
    {
      -[MNLocationTracker navigationSession](self, "navigationSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentRouteInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTurnByTurnLocationTracker _updateForSelectedNewRoute:alternateRoutes:](self, "_updateForSelectedNewRoute:alternateRoutes:", v11, 0);

    }
  }
  else
  {
    if (v5)
      objc_msgSend(v7, "mainRouteInfo");
    else
      objc_msgSend(v7, "alternateRouteInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "routeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentRouteInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _updateForSelectedNewRoute:alternateRoutes:](self, "_updateForSelectedNewRoute:alternateRoutes:", v16, v13);

  }
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "locationTracker:dismissedTrafficIncidentAlert:", self, v7);

}

- (void)trafficIncidentAlertUpdater:(id)a3 updatedAlert:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationTracker:updatedTrafficIncidentAlert:", self, v6);

}

- (void)trafficIncidentAlertUpdater:(id)a3 didSwitchToNewRoute:(id)a4 forAlert:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  MNActiveRouteInfo *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  MNActiveRouteInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MNActiveRouteInfo *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uniqueRouteID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    v23 = v10;
    v24 = 2113;
    v25 = v11;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "Switching to new route because of Dodgeball alert. New route: %@, %{private}@", buf, 0x16u);

  }
  v12 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v7);
  -[MNTurnByTurnLocationTracker reroute:reason:](self, "reroute:reason:", v12, 2);
  v13 = objc_msgSend(v8, "alertType");
  if (v13 <= 7 && ((1 << v13) & 0x9A) != 0)
  {
    if (objc_msgSend(v8, "alertType") == 1 || objc_msgSend(v8, "alertType") == 7)
    {
      objc_msgSend(v8, "originalRoute");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "alternateRoute");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    if (v14)
    {
      v16 = -[MNActiveRouteInfo initWithRoute:]([MNActiveRouteInfo alloc], "initWithRoute:", v14);
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    -[MNLocationTracker navigationSession](self, "navigationSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "routeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentRouteInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTurnByTurnLocationTracker _updateForSelectedNewRoute:alternateRoutes:](self, "_updateForSelectedNewRoute:alternateRoutes:", v20, v17);

  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t lastArrivalLegIndex;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[8];

  v39[6] = *MEMORY[0x1E0C80C00];
  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E08];
  v38[0] = CFSTR("isGoodMatch");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "routeMatch");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v34, "isGoodMatch"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v31;
  v38[1] = CFSTR("routeCoordinate");
  objc_msgSend(v4, "routeMatch");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "routeCoordinate");
  GEOPolylineCoordinateAsFullString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v32;
  v38[2] = CFSTR("locationCoordinate");
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "coordinate");
  v9 = v8;
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%f, %f"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v11;
  v38[3] = CFSTR("course");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "course");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v13;
  v38[4] = CFSTR("stepIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "stepIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v14;
  v38[5] = CFSTR("distanceFromRoute");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "routeMatch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "distanceFromRoute");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v18);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "altitude");
  if (v19 != 1.79769313e308)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "altitude");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v21, CFSTR("altitude"));

  }
  v36[0] = CFSTR("navigationState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MNLocationTracker state](self, "state"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  v36[1] = CFSTR("targetLegIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MNLocationTracker targetLegIndex](self, "targetLegIndex"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  v36[2] = CFSTR("mapMatcher.targetLegIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEONavigationMapMatcher targetLegIndex](self->_mapMatcher, "targetLegIndex"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v24;
  v36[3] = CFSTR("lastArrivalLegIndex");
  lastArrivalLegIndex = self->_lastArrivalLegIndex;
  if (lastArrivalLegIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = &unk_1E620F218;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastArrivalLegIndex);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[3] = v26;
  v37[4] = v35;
  v36[4] = CFSTR("lastLocation");
  v36[5] = CFSTR("sessionState");
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "serverSessionStateInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (lastArrivalLegIndex != 0x7FFFFFFFFFFFFFFFLL)
  return v29;
}

- (MNLocation)lastKnownGoodLocationOnRoute
{
  return self->_lastKnownGoodLocationOnRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMatcher, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlertUpdater, 0);
  objc_storeStrong((id *)&self->_lastKnownGoodLocationOnRoute, 0);
  objc_storeStrong((id *)&self->_rerouteDates, 0);
  objc_storeStrong((id *)&self->_previousRerouteLocation, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_offlineCoordinator, 0);
  objc_storeStrong((id *)&self->_arrivalUpdater, 0);
  objc_storeStrong((id *)&self->_mapMatcher, 0);
}

- (void)offlineCoordinatorDidDetectOnline:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MNLocationTracker lastMatchedLocation](self, "lastMatchedLocation", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTurnByTurnLocationTracker _rerouteRequestParametersForLocation:transportType:](self, "_rerouteRequestParametersForLocation:transportType:", v5, -[MNLocationTracker transportType](self, "transportType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRequestType:", 15);
  objc_msgSend(v8, "traits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setTraits:", v7);
  if (!v6)
  {

  }
  -[MNTurnByTurnLocationTracker _changeOfflineMode:reason:requestParameters:errorHandler:](self, "_changeOfflineMode:reason:requestParameters:errorHandler:", 1, 15, v8, 0);

}

@end
