@implementation MNLocationTracker

- (MNLocationTracker)init
{
  MNLocationTracker *v2;
  MNLocationTracker *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNLocationTracker;
  v2 = -[MNLocationTracker init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MNLocationTracker _updateShouldLocalizeRoadNames](v2, "_updateShouldLocalizeRoadNames");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__defaultsDidChange, *MEMORY[0x1E0CB3420], 0);

  }
  return v3;
}

- (MNLocationTracker)initWithNavigationSession:(id)a3
{
  id v4;
  MNLocationTracker *v5;
  MNLocationTracker *v6;
  uint64_t v7;
  GEOApplicationAuditToken *auditToken;
  MNLocationTracker *v9;

  v4 = a3;
  v5 = -[MNLocationTracker init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    objc_storeWeak((id *)&v5->_navigationSession, v4);
    v6->_targetLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "auditToken");
    v7 = objc_claimAutoreleasedReturnValue();
    auditToken = v6->_auditToken;
    v6->_auditToken = (GEOApplicationAuditToken *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3420], 0);

  v4.receiver = self;
  v4.super_class = (Class)MNLocationTracker;
  -[MNLocationTracker dealloc](&v4, sel_dealloc);
}

- (int)transportType
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_opt_class();
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136316162;
    v8 = "-[MNLocationTracker transportType]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
    v11 = 1024;
    v12 = 73;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v7, 0x30u);

  }
  return 4;
}

- (BOOL)isRerouting
{
  return 0;
}

- (BOOL)hasArrived
{
  return (self->_state & 0xFFFFFFFE) == 6;
}

- (BOOL)shouldProjectAlongRoute
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  MNObserverHashTable *v4;
  MNObserverHashTable *safeDelegate;
  MNObserverHashTable *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEE83C8);
    safeDelegate = self->_safeDelegate;
    self->_safeDelegate = v4;

    -[MNObserverHashTable registerObserver:](self->_safeDelegate, "registerObserver:", v7);
  }
  else
  {
    v6 = self->_safeDelegate;
    self->_safeDelegate = 0;

  }
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[MNNavigationSessionState currentRouteInfo](self->_navigationSessionState, "currentRouteInfo", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "routeInitializerData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "directionsRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tripInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasVisitedFirstStop");

  if (v9)
    self->_hasVisitedFirstStop = 1;

}

- (void)rerouteWithWaypoints:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)insertWaypoint:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)removeWaypointAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)updateDestination:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (id)matchedLocationForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNLocationTracker::matchedLocationForLocation:", (uint8_t *)&v17, 0xCu);

  }
  MNGetMNLocationTrackerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MatchedLocationForLocation", ", (uint8_t *)&v17, 2u);
  }

  -[MNLocationTracker _matchedLocationForLocation:](self, "_matchedLocationForLocation:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_storeStrong((id *)&self->_lastMatchedLocation, v11);
    MNGetPuckTrackingLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling didUpdateMatchedLocation:", (uint8_t *)&v17, 0xCu);

    }
    -[MNObserverHashTable locationTracker:didUpdateMatchedLocation:](self->_safeDelegate, "locationTracker:didUpdateMatchedLocation:", self, v11);
  }
  v14 = v10;
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "MatchedLocationForLocation", ", (uint8_t *)&v17, 2u);
  }

  return v11;
}

- (BOOL)shouldAllowPause
{
  return 0;
}

- (BOOL)paused
{
  return 0;
}

- (void)_setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MNObserverHashTable locationTracker:didChangeState:](self->_safeDelegate, "locationTracker:didChangeState:", self);
  }
}

- (void)_setTargetLegIndex:(unint64_t)a3
{
  NSObject *v5;
  unint64_t targetLegIndex;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_targetLegIndex != a3)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      targetLegIndex = self->_targetLegIndex;
      v7[0] = 67109376;
      v7[1] = targetLegIndex;
      v8 = 1024;
      v9 = a3;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Changing target leg index from %d to %d.", (uint8_t *)v7, 0xEu);
    }

    self->_targetLegIndex = a3;
    -[MNObserverHashTable locationTracker:didUpdateTargetLegIndex:](self->_safeDelegate, "locationTracker:didUpdateTargetLegIndex:", self, a3);
  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  return 0;
}

- (void)_updateMatchedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastMatchedLocation, a3);
}

- (void)_updateArrivalInfo:(id)a3
{
  MNArrivalInfo *v5;
  MNArrivalInfo *v6;

  v5 = (MNArrivalInfo *)a3;
  if (self->_arrivalInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_arrivalInfo, a3);
    if (-[MNArrivalInfo isInArrivalState](v6, "isInArrivalState"))
      self->_hasVisitedFirstStop = 1;
    -[MNObserverHashTable locationTracker:didUpdateArrivalInfo:](self->_safeDelegate, "locationTracker:didUpdateArrivalInfo:", self, v6);
    v5 = v6;
  }

}

- (void)_roadFeaturesForFeature:(id)a3 outRoadName:(id *)a4 outShieldText:(id *)a5 outShieldType:(int64_t *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  __CFString *v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "feature");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      if (self->_localizeRoadNames)
        GEOFeatureGetLocalizedLabel();
      else
        GEOFeatureGetNativeLabel();
      GEOFeatureGetLocalizedShield();
      objc_msgSend(v13, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isRamp");

      if (v15)
      {
        objc_msgSend(v13, "attributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "rampType");

        switch(v17)
        {
          case 2:
            objc_msgSend(v13, "attributes");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "rampDirection");

            v21 = CFSTR("Freeway Ramp");
            switch(v24)
            {
              case 0:
                GEOFindOrCreateLog();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
                  v29 = 2080;
                  v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
                  v31 = 1024;
                  v32 = 335;
                  _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
                }

                v21 = CFSTR("Freeway Ramp");
                break;
              case 1:
                v21 = CFSTR("Freeway On Ramp");
                break;
              case 2:
                v21 = CFSTR("Freeway Off Ramp");
                break;
              case 3:
                break;
              default:
                goto LABEL_27;
            }
LABEL_39:
            _MNLocalizedStringFromThisBundle(v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!a4)
              goto LABEL_29;
            goto LABEL_28;
          case 1:
            goto LABEL_19;
          case 0:
            GEOFindOrCreateLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
              v29 = 2080;
              v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
              v31 = 1024;
              v32 = 314;
              _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
            }

LABEL_19:
            objc_msgSend(v13, "attributes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "rampDirection");

            v21 = CFSTR("Ramp");
            switch(v20)
            {
              case 0:
                GEOFindOrCreateLog();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v28 = "-[MNLocationTracker _roadFeaturesForFeature:outRoadName:outShieldText:outShieldType:]";
                  v29 = 2080;
                  v30 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNLocationTracker.m";
                  v31 = 1024;
                  v32 = 319;
                  _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
                }

                v21 = CFSTR("Ramp");
                goto LABEL_39;
              case 1:
                v21 = CFSTR("On Ramp");
                goto LABEL_39;
              case 2:
                v21 = CFSTR("Off Ramp");
                goto LABEL_39;
              case 3:
                goto LABEL_39;
              default:
                goto LABEL_27;
            }
        }
      }
LABEL_27:
      v26 = 0;
      if (!a4)
      {
LABEL_29:
        if (a5)
          *a5 = objc_retainAutorelease(0);
        if (a6)
          *a6 = 0;

        goto LABEL_34;
      }
LABEL_28:
      *a4 = objc_retainAutorelease(v26);
      goto LABEL_29;
    }
  }
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
LABEL_34:

}

- (void)_updateShouldLocalizeRoadNames
{
  self->_localizeRoadNames = GEOConfigGetBOOL();
}

- (unint64_t)navigationCapabilities
{
  return self->_navigationCapabilities;
}

- (void)setNavigationCapabilities:(unint64_t)a3
{
  self->_navigationCapabilities = a3;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)state
{
  return self->_state;
}

- (MNLocation)lastMatchedLocation
{
  return self->_lastMatchedLocation;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (MNObserverHashTable)safeDelegate
{
  return self->_safeDelegate;
}

- (MNNavigationSession)navigationSession
{
  return (MNNavigationSession *)objc_loadWeakRetained((id *)&self->_navigationSession);
}

- (GEOApplicationAuditToken)_auditToken
{
  return self->_auditToken;
}

- (void)_setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_safeDelegate, 0);
}

@end
