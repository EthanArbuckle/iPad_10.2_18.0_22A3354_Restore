@implementation MNNavigationProxyUpdater

- (MNNavigationProxyUpdater)init
{
  MNNavigationProxyUpdater *v2;
  GEONavigationProxy *v3;
  GEONavigationProxy *navigationProxy;
  MNNanoFormattedStringFormatter *v5;
  MNNavigationProxyUpdater *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNNavigationProxyUpdater;
  v2 = -[MNNavigationProxyUpdater init](&v8, sel_init);
  if (v2)
  {
    v3 = (GEONavigationProxy *)objc_alloc_init(MEMORY[0x1E0D27280]);
    navigationProxy = v2->_navigationProxy;
    v2->_navigationProxy = v3;

    v5 = objc_alloc_init(MNNanoFormattedStringFormatter);
    -[GEONavigationProxy setFormatter:](v2->_navigationProxy, "setFormatter:", v5);

    v6 = v2;
  }

  return v2;
}

- (void)enteredRoutePreviewWithTransportType:(int)a3
{
  -[GEONavigationProxy setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:](self->_navigationProxy, "setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:", 1, *(_QWORD *)&a3, 0, 0);
}

- (void)navigationSessionStopped:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "routeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRoute");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    v5 = objc_msgSend(v6, "transportType");
  else
    v5 = 4;
  -[GEONavigationProxy setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:](self->_navigationProxy, "setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:", 0, v5, 0, 0);
  -[GEONavigationProxy stop](self->_navigationProxy, "stop");

}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  -[GEONavigationProxy setDisplayedStepIndex:](self->_navigationProxy, "setDisplayedStepIndex:", a3);
}

- (void)updateClusteredSectionSelectedRideForNavigationSession:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "routeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRoute");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[GEONavigationProxy setClusteredSectionSelectedRideFromRoute:](self->_navigationProxy, "setClusteredSectionSelectedRideFromRoute:", v5);
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  -[GEONavigationProxy setIsNavigatingInLowGuidance:](self->_navigationProxy, "setIsNavigatingInLowGuidance:", a3);
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  -[GEONavigationProxy setIsConnectedToCarplay:](self->_navigationProxy, "setIsConnectedToCarplay:", a3);
}

- (int)_geoNavigationTypeForNavigationType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 1;
  else
    return dword_1B0BF3790[a3];
}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  GEONavigationProxy *navigationProxy;
  uint64_t v18;
  id v19;

  v7 = a6;
  v10 = a3;
  objc_msgSend(v10, "routeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentRoute");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "waypoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navDisplayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEONavigationProxy startWithDestinationName:nextDestinationName:](self->_navigationProxy, "startWithDestinationName:nextDestinationName:", v13, v16);
  -[GEONavigationProxy setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:](self->_navigationProxy, "setNavigationSessionState:transportType:navigationType:isResumingMultipointRoute:", 2, objc_msgSend(v19, "transportType"), -[MNNavigationProxyUpdater _geoNavigationTypeForNavigationType:](self, "_geoNavigationTypeForNavigationType:", a5), v7);
  -[GEONavigationProxy setRoute:](self->_navigationProxy, "setRoute:", v19);
  navigationProxy = self->_navigationProxy;
  v18 = objc_msgSend(v10, "guidancePromptsEnabled");

  -[GEONavigationProxy setGuidancePromptsEnabled:](navigationProxy, "setGuidancePromptsEnabled:", v18);
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
  -[GEONavigationProxy setNavigationState:](self->_navigationProxy, "setNavigationState:", *(_QWORD *)&a4);
}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  GEONavigationProxy *navigationProxy;
  void *v10;
  GEONavigationProxy *v11;
  void *v12;
  GEONavigationProxy *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetPuckTrackingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationProxyUpdater::navigationSession:didUpdateMatchedLocation:", (uint8_t *)&v15, 0xCu);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v5);
  navigationProxy = self->_navigationProxy;
  objc_msgSend(v5, "routeMatch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationProxy setLastLocation:routeMatchedCoordinate:](navigationProxy, "setLastLocation:routeMatchedCoordinate:", v8, objc_msgSend(v10, "routeCoordinate"));

  v11 = self->_navigationProxy;
  objc_msgSend(v5, "routeMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationProxy setRouteMatch:](v11, "setRouteMatch:", v12);

  v13 = self->_navigationProxy;
  objc_msgSend(v5, "roadName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationProxy setCurrentRoadName:](v13, "setCurrentRoadName:", v14);

}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  -[GEONavigationProxy setStepIndex:](self->_navigationProxy, "setStepIndex:", a4);
}

- (void)navigationSession:(id)a3 didUpdateStepNameInfo:(id)a4
{
  -[GEONavigationProxy setStepNameInfo:](self->_navigationProxy, "setStepNameInfo:", a4);
}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[GEONavigationProxy setArrivedAtWaypoint:endOfLegIndex:](self->_navigationProxy, "setArrivedAtWaypoint:endOfLegIndex:", a4, a5);
}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "routeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "legs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (a5 + 1 >= v14)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[MNNavigationProxyUpdater navigationSession:didResumeNavigatingFromWaypoint:endOfLegIndex:reason:]";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationProxyUpdater.m";
      v25 = 1024;
      v26 = 160;
      v27 = 2080;
      v28 = "(legIndex + 1) < navigationSession.routeManager.currentRoute.legs.count";
      _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v21, 0x26u);
    }

  }
  objc_msgSend(v9, "routeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentRoute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "waypoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a5 + 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navDisplayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEONavigationProxy setDestinationName:nextDestinationName:](self->_navigationProxy, "setDestinationName:nextDestinationName:", 0, v19);
  -[GEONavigationProxy setResumedNavigatingFromWaypoint:endOfLegIndex:](self->_navigationProxy, "setResumedNavigatingFromWaypoint:endOfLegIndex:", v10, a5);

}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  char v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  MNNavigationProxyUpdater *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "routeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueRouteID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v14;
  if (v15 | v16)
  {
    v17 = (void *)v16;
    v18 = objc_msgSend((id)v15, "isEqual:", v16);

    if ((v18 & 1) == 0)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = (double)(unint64_t)objc_msgSend(v9, "displayRemainingMinutesToEndOfLeg") * 60.0;
  objc_msgSend(v10, "distanceRemainingToEndOfLeg");
  v31 = self;
  -[GEONavigationProxy setPositionFromDestination:](self->_navigationProxy, "setPositionFromDestination:", v19, v20);
  v21 = objc_alloc_init(MEMORY[0x1E0D26F00]);
  v22 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "legInfos");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = v9;
  objc_msgSend(v9, "legInfos");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26F08]), "initWithLegIndex:remainingTime:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "legIndex"), (double)(unint64_t)(60* objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "remainingMinutes")));
        objc_msgSend(v24, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v27);
  }

  objc_msgSend(v21, "setArrivalTimeInfo:", v24);
  objc_msgSend(v10, "distanceRemainingToEndOfLeg");
  objc_msgSend(v21, "setDistanceRemainingToEndOfLeg:");
  objc_msgSend(v10, "distanceRemainingToEndOfRoute");
  objc_msgSend(v21, "setDistanceRemainingToEndOfRoute:");
  -[GEONavigationProxy setETAUpdate:](v31->_navigationProxy, "setETAUpdate:", v21);

  v9 = v32;
LABEL_12:

}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  GEONavigationProxy *navigationProxy;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentRouteInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7 == v12)
  {
    navigationProxy = self->_navigationProxy;
    objc_msgSend(v12, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traffic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationProxy setTrafficForCurrentRoute:](navigationProxy, "setTrafficForCurrentRoute:", v11);

    v8 = v12;
  }

}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  void *v8;
  void *v9;
  unint64_t v10;
  GEONavigationProxy *navigationProxy;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "route", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= 1)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[MNNavigationProxyUpdater navigationSession:didReroute:withLocation:withAlternateRoutes:rerouteReason:]";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationProxyUpdater.m";
      v23 = 1024;
      v24 = 202;
      v25 = 2080;
      v26 = "route.waypoints.count >= 2";
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v19, 0x26u);
    }

  }
  navigationProxy = self->_navigationProxy;
  objc_msgSend(v8, "waypoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waypoints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationProxy setDestinationName:nextDestinationName:](navigationProxy, "setDestinationName:nextDestinationName:", v14, v17);

  -[GEONavigationProxy setRoute:](self->_navigationProxy, "setRoute:", v8);
}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  id v7;

  objc_msgSend(a5, "route", a3, *(_QWORD *)&a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GEONavigationProxy setRoute:](self->_navigationProxy, "setRoute:", v7);

}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilSign:(double)a5 timeUntilSign:(double)a6
{
  -[GEONavigationProxy setPositionFromSign:](self->_navigationProxy, "setPositionFromSign:", a3, a4, a6, a5);
}

- (void)navigationSession:(id)a3 currentStepIndex:(unint64_t)a4 didUpdateDistanceUntilManeuver:(double)a5 timeUntilManeuver:(double)a6
{
  -[GEONavigationProxy setPositionFromManeuver:](self->_navigationProxy, "setPositionFromManeuver:", a3, a4, a6, a5);
}

- (void)navigationSession:(id)a3 willAnnounce:(unint64_t)a4 inSeconds:(double)a5
{
  -[GEONavigationProxy setNextAnnouncementStage:timeUntilNextAnnouncement:](self->_navigationProxy, "setNextAnnouncementStage:timeUntilNextAnnouncement:", a4, a5);
}

- (void)navigationSession:(id)a3 triggerHaptics:(int)a4
{
  -[GEONavigationProxy triggerHaptics:](self->_navigationProxy, "triggerHaptics:", *(_QWORD *)&a4);
}

- (void)navigationSession:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  -[GEONavigationProxy setAnnouncementStage:](self->_navigationProxy, "setAnnouncementStage:", a4);
}

- (void)navigationSession:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  -[GEONavigationProxy setGuidancePromptsEnabled:](self->_navigationProxy, "setGuidancePromptsEnabled:", a4);
}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a4, "type") == 2)
    -[MNNavigationProxyUpdater navigationSessionStopped:](self, "navigationSessionStopped:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationProxy, 0);
}

@end
