@implementation MNWalkingTurnByTurnLocationTracker

- (MNWalkingTurnByTurnLocationTracker)initWithNavigationSession:(id)a3
{
  MNWalkingTurnByTurnLocationTracker *v3;
  MNWalkingTurnByTurnLocationTracker *v4;
  MNWalkingTurnByTurnLocationTracker *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  v3 = -[MNTurnByTurnLocationTracker initWithNavigationSession:](&v7, sel_initWithNavigationSession_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_detectedTransportType = 4;
    v5 = v3;
  }

  return v4;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  -[MNTurnByTurnLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v4, sel_startTrackingWithInitialLocation_targetLegIndex_, a3, a4);
}

- (int)transportType
{
  return 2;
}

- (id)_newMapMatcherForRoute:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D27290];
  v5 = a3;
  v6 = [v4 alloc];
  -[MNLocationTracker _auditToken](self, "_auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRoute:auditToken:", v5, v7);

  return v8;
}

- (void)_updateForReroute:(id)a3 rerouteReason:(unint64_t)a4 request:(id)a5 response:(id)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNWalkingTurnByTurnLocationTracker;
  v10 = a3;
  -[MNTurnByTurnLocationTracker _updateForReroute:rerouteReason:request:response:](&v12, sel__updateForReroute_rerouteReason_request_response_, v10, a4, a5, a6);
  +[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:](MNTrafficIncidentAlert, "validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:", v10, 0, v12.receiver, v12.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNTurnByTurnLocationTracker _updateForNewTrafficIncidentAlerts:](self, "_updateForNewTrafficIncidentAlerts:", v11);
}

- (BOOL)_allowRerouteForLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  BOOL v15;
  void *v16;
  double v17;

  v4 = a3;
  -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "initialRouteSource");

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[MNLocationTracker navigationSessionState](self, "navigationSessionState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasBeenOnRouteOnce");

    GEOConfigGetDouble();
    v10 = v9;
    if (v8)
    {
      -[MNTurnByTurnLocationTracker lastKnownGoodLocationOnRoute](self, "lastKnownGoodLocationOnRoute");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routeMatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationCoordinate3D");

      objc_msgSend(v4, "_navigation_geoCoordinate3D");
      GEOCalculateDistance();
      v14 = v13;
    }
    else
    {
      objc_msgSend(v4, "routeMatch");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "distanceFromRoute");
      v14 = v17;

    }
    v15 = v14 > v10;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (int)_detectedMotionForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int detectedTransportType;

  v4 = a3;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "motionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "confidence");
  if ((objc_msgSend(v6, "isWalking") & 1) != 0 || (objc_msgSend(v6, "isRunning") & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    if ((objc_msgSend(v6, "isDriving") & 1) == 0)
      goto LABEL_8;
    v7 = 0;
  }
  if (self->_detectedTransportType != v7)
  {
    objc_msgSend(v4, "rawLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v10 = v9;
    v12 = v11;

    self->_detectedTransportType = v7;
    self->_detectedTransportTypeOrigin.latitude = v10;
    self->_detectedTransportTypeOrigin.longitude = v12;
  }
LABEL_8:
  detectedTransportType = self->_detectedTransportType;

  return detectedTransportType;
}

- (BOOL)_allowSwitchToTransportType:(int)a3 forLocation:(id)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3
    || (objc_msgSend(v5, "speed"), v7 < 5.36)
    || (objc_msgSend(v6, "rawLocation"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "coordinate"),
        v8,
        GEOCalculateDistance(),
        v9 < 100.0))
  {
    v11 = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138477827;
      v14 = CFSTR("AUTOMOBILE");
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "Allow switching to transport type: %{private}@", (uint8_t *)&v13, 0xCu);
    }

    v11 = 1;
  }

  return v11;
}

@end
