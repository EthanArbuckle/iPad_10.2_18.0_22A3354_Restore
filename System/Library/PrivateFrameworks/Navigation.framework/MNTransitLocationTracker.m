@implementation MNTransitLocationTracker

- (MNTransitLocationTracker)initWithNavigationSession:(id)a3
{
  id v4;
  MNTransitLocationTracker *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  GEOTransitRouteMatcher *transitRouteMatcher;
  uint64_t v13;
  NSDate *startDate;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  MNTransitLocationTracker *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  MNTransitLocationTracker *v32;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MNTransitLocationTracker;
  v5 = -[MNSteppingLocationTracker initWithNavigationSession:](&v41, sel_initWithNavigationSession_, v4);
  if (v5)
  {
    objc_msgSend(v4, "routeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "motionContext");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D27608]);
    objc_msgSend(v4, "auditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v8;
    v11 = objc_msgSend(v9, "initWithRoute:motionContext:auditToken:", v7, v8, v10);
    transitRouteMatcher = v5->_transitRouteMatcher;
    v5->_transitRouteMatcher = (GEOTransitRouteMatcher *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v13;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = v7;
    objc_msgSend(v7, "steps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      v19 = 0x1ED0BF000uLL;
      v36 = v4;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v21, "transportType") == 1)
          {
            v22 = v21;
            v23 = v22;
            v24 = *(int *)(v19 + 888);
            if (!*(Class *)((char *)&v5->super.super.super.isa + v24) && objc_msgSend(v22, "routeSegmentType") == 6)
            {
              v25 = v23;
              if (objc_msgSend(v25, "isBus"))
              {
                v26 = v5;
                v27 = objc_alloc(MEMORY[0x1E0D27498]);
                objc_msgSend(v4, "auditToken");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v27;
                v5 = v26;
                v19 = 0x1ED0BF000;
                v30 = objc_msgSend(v29, "initWithAuditToken:", v28);
                v31 = *(Class *)((char *)&v5->super.super.super.isa + v24);
                *(Class *)((char *)&v5->super.super.super.isa + v24) = (Class)v30;

                v4 = v36;
              }

            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v17);
    }

    -[MNTransitLocationTracker _initRegionAlertsForRoute:](v5, "_initRegionAlertsForRoute:", v35);
    v32 = v5;

  }
  return v5;
}

- (int)transportType
{
  return 1;
}

- (void)startTrackingWithInitialLocation:(id)a3 targetLegIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNTransitLocationTracker;
  -[MNSteppingLocationTracker startTrackingWithInitialLocation:targetLegIndex:](&v7, sel_startTrackingWithInitialLocation_targetLegIndex_, a3, a4);
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addLocationListener:", self);

  -[MNTransitLocationTracker _startMonitoringTransitAlerts](self, "_startMonitoringTransitAlerts");
  if (GEOConfigGetBOOL())
  {
    -[MNLocationTracker safeDelegate](self, "safeDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationTracker:didReceiveRouteSignalStrength:", self, 2);

  }
}

- (void)stopTracking
{
  void *v3;
  objc_super v4;

  -[MNTransitLocationTracker _stopMonitoringAllRegions](self, "_stopMonitoringAllRegions");
  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLocationListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)MNTransitLocationTracker;
  -[MNSteppingLocationTracker stopTracking](&v4, sel_stopTracking);
}

- (void)reroute:(id)a3 reason:(unint64_t)a4
{
  id v6;
  void *v7;
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
  v6 = a3;
  if (a4 != 14)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315906;
      v10 = "-[MNTransitLocationTracker reroute:reason:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTransitLocationTracker.m";
      v13 = 1024;
      v14 = 121;
      v15 = 2080;
      v16 = "rerouteReason == MNRerouteReason_UserSwitchedRideIndex";
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }

  }
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitLocationTracker _initRegionAlertsForRoute:](self, "_initRegionAlertsForRoute:", v7);

  -[MNTransitLocationTracker _startMonitoringTransitAlerts](self, "_startMonitoringTransitAlerts");
}

- (void)_initRegionAlertsForRoute:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *transitRegions;
  NSMutableDictionary *v7;
  NSMutableDictionary *transitAlerts;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_opt_new();
  transitRegions = self->_transitRegions;
  self->_transitRegions = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  transitAlerts = self->_transitAlerts;
  self->_transitAlerts = v7;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v41 = v4;
  objc_msgSend(v4, "steps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v60;
    v42 = *(_QWORD *)v60;
    v43 = v9;
    do
    {
      v13 = 0;
      v44 = v11;
      do
      {
        if (*(_QWORD *)v60 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v13);
        if (objc_msgSend(v14, "transportType") == 1)
        {
          v15 = v14;
          objc_msgSend(v15, "regionAlerts");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v15, "regionAlerts");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            if (v19)
            {
              v45 = v15;
              v46 = v13;
              v57 = 0u;
              v58 = 0u;
              v55 = 0u;
              v56 = 0u;
              objc_msgSend(v15, "regionAlerts");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v56;
                v47 = *(_QWORD *)v56;
                v48 = v20;
                do
                {
                  v24 = 0;
                  v49 = v22;
                  do
                  {
                    if (*(_QWORD *)v56 != v23)
                      objc_enumerationMutation(v20);
                    v50 = v24;
                    v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v24);
                    objc_msgSend(v25, "triggerRegions");
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (v26
                      && (v27 = (void *)v26,
                          objc_msgSend(v25, "triggerRegions"),
                          v28 = (void *)objc_claimAutoreleasedReturnValue(),
                          v29 = objc_msgSend(v28, "count"),
                          v28,
                          v27,
                          v29))
                    {
                      v53 = 0u;
                      v54 = 0u;
                      v51 = 0u;
                      v52 = 0u;
                      objc_msgSend(v25, "triggerRegions");
                      v30 = objc_claimAutoreleasedReturnValue();
                      v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
                      if (v31)
                      {
                        v32 = v31;
                        v33 = *(_QWORD *)v52;
                        do
                        {
                          for (i = 0; i != v32; ++i)
                          {
                            if (*(_QWORD *)v52 != v33)
                              objc_enumerationMutation(v30);
                            v35 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
                            v36 = (void *)MEMORY[0x1E0CB3940];
                            v37 = (void *)objc_opt_new();
                            objc_msgSend(v37, "UUIDString");
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v36, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("Maps_Transit"), v38);
                            v39 = (void *)objc_claimAutoreleasedReturnValue();

                            -[NSMutableDictionary setValue:forKey:](self->_transitAlerts, "setValue:forKey:", v25, v39);
                            -[NSMutableDictionary setValue:forKey:](self->_transitRegions, "setValue:forKey:", v35, v39);

                          }
                          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
                        }
                        while (v32);
                        v23 = v47;
                        v20 = v48;
                        v22 = v49;
                      }
                    }
                    else
                    {
                      GEOFindOrCreateLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v64 = v25;
                        _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_ERROR, "Found a transit alert with no corresponding region: %@", buf, 0xCu);
                      }
                    }

                    v24 = v50 + 1;
                  }
                  while (v50 + 1 != v22);
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
                }
                while (v22);
              }

              v12 = v42;
              v9 = v43;
              v11 = v44;
              v15 = v45;
              v13 = v46;
            }
          }

        }
        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v11);
  }

  if (!-[NSMutableDictionary count](self->_transitAlerts, "count"))
  {
    GEOFindOrCreateLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v40, OS_LOG_TYPE_INFO, "No region alerts found for route.", buf, 2u);
    }

  }
}

- (id)_matchedLocationForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSDate *lastLocationTimestamp;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSDate *v11;
  NSDate *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412290;
    v35 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNTransitLocationTracker::_matchedLocationForLocation:", (uint8_t *)&v34, 0xCu);

  }
  lastLocationTimestamp = self->_lastLocationTimestamp;
  if (lastLocationTimestamp)
  {
    objc_msgSend(v4, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSDate compare:](lastLocationTimestamp, "compare:", v8);

    if (v9 == 1)
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "Dropping location because it has an older timestamp.", (uint8_t *)&v34, 2u);
      }

      goto LABEL_15;
    }
  }
  objc_msgSend(v4, "timestamp");
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v12 = self->_lastLocationTimestamp;
  self->_lastLocationTimestamp = v11;

  if (!-[MNTransitLocationTracker _isInaccurateLocation:](self, "_isInaccurateLocation:", v4))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v4);
    MNGetPuckTrackingLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v24;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - calling _correctedLocationForLocation:", (uint8_t *)&v34, 0xCu);

    }
    objc_msgSend(v4, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTransitLocationTracker _correctedLocationForLocation:](self, "_correctedLocationForLocation:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    MNGetPuckTrackingLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412546;
      v35 = v25;
      v36 = 2112;
      v37 = v27;
      _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - MUTATED to corrected location => %@", (uint8_t *)&v34, 0x16u);

    }
    objc_storeStrong((id *)&self->_lastAccurateLocationDate, self->_lastLocationTimestamp);
    objc_msgSend(v17, "timestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v30;

    -[MNTransitLocationTracker _timeToDisplayStaleGPSLocation](self, "_timeToDisplayStaleGPSLocation");
    objc_msgSend(v31, "dateByAddingTimeInterval:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExpirationDate:", v32);

    goto LABEL_26;
  }
  if (!self->_lastAccurateLocationDate
    || (objc_msgSend(v4, "timestamp"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "timeIntervalSinceDate:", self->_lastAccurateLocationDate),
        v15 = v14,
        v13,
        v15 >= 60.0))
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEBUG, "Using an inaccurate location.", (uint8_t *)&v34, 2u);
    }

    -[MNTransitLocationTracker _locationForInaccurateLocation:](self, "_locationForInaccurateLocation:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "timestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v20;

    -[MNTransitLocationTracker _timeToDisplayStaleGPSLocation](self, "_timeToDisplayStaleGPSLocation");
    objc_msgSend(v22, "dateByAddingTimeInterval:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExpirationDate:", v25);
LABEL_26:

    v4 = v17;
    v21 = v4;
    goto LABEL_27;
  }
LABEL_15:
  v21 = 0;
LABEL_27:

  return v21;
}

- (id)_correctedLocationForLocation:(id)a3
{
  id v4;
  MNLocation **p_lastMatchedLocation;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  MNLocation *v51;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  uint64_t v61;
  int v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;

  v4 = a3;
  p_lastMatchedLocation = &self->_lastMatchedLocation;
  -[MNLocation routeMatch](self->_lastMatchedLocation, "routeMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteMatcher matchToRouteWithLocation:previousRouteMatch:](self->_transitRouteMatcher, "matchToRouteWithLocation:previousRouteMatch:", v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  objc_msgSend(v4, "coordinate");
  v12 = v11;
  objc_msgSend(v4, "coordinate");
  v14 = v13;
  v15 = -1.0;
  if (objc_msgSend(v4, "hasCourse"))
  {
    objc_msgSend(v4, "course");
    v15 = v16;
  }
  v17 = 0;
  if (objc_msgSend(v4, "hasSpeed"))
  {
    objc_msgSend(v4, "speed");
    v17 = v18;
  }
  objc_msgSend(v4, "horizontalAccuracy");
  v20 = v19;
  v21 = -1.0;
  v22 = -1.0;
  if (objc_msgSend(v4, "hasCourseAccuracy"))
  {
    objc_msgSend(v4, "courseAccuracy");
    v22 = v23;
  }
  if (objc_msgSend(v4, "hasSpeedAccuracy"))
  {
    objc_msgSend(v4, "speedAccuracy");
    v21 = v24;
  }
  objc_msgSend(v4, "timestamp");
  v59 = v21;
  v60 = v15;
  v58 = v25;
  if (self->_debugSnapToTransitLines)
  {
    objc_msgSend(v10, "transitTripStep");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v61 = 0;
    v56 = v22;
    v57 = v17;
    if (!v26)
    {
      v35 = v20;
      v36 = 0;
      goto LABEL_36;
    }
    if (objc_msgSend(v26, "maneuver") != 4 && objc_msgSend(v27, "maneuver") != 5)
      goto LABEL_24;
    if (objc_msgSend(v27, "isRail") && objc_msgSend(v10, "isGoodMatch"))
    {
      objc_msgSend(v10, "locationCoordinate3D");
      v29 = v28;
      v31 = v30;
      v54 = v32;
      objc_msgSend(v10, "matchedCourse");
      v34 = v54;
      goto LABEL_30;
    }
    if (!objc_msgSend(v27, "isBus"))
    {
LABEL_24:
      v33 = -1.0;
      v31 = -180.0;
      v34 = 0x7FEFFFFFFFFFFFFFLL;
      v29 = -180.0;
      goto LABEL_30;
    }
    -[MNTransitLocationTracker _roadMatchForOffRouteLocation:routeMatch:](self, "_roadMatchForOffRouteLocation:routeMatch:", v4, v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      objc_msgSend(v40, "coordinateOnRoad");
      v29 = v42;
      v31 = v43;
      v55 = v44;
      objc_msgSend(v41, "courseOnRoad");
    }
    else
    {
      if (!objc_msgSend(v10, "isGoodMatch"))
      {
        v53 = -1.0;
        v31 = -180.0;
        v55 = 0x7FEFFFFFFFFFFFFFLL;
        v29 = -180.0;
        goto LABEL_29;
      }
      objc_msgSend(v10, "locationCoordinate3D");
      v29 = v46;
      v31 = v47;
      v55 = v48;
      objc_msgSend(v10, "matchedCourse");
    }
    v53 = v45;
LABEL_29:

    v33 = v53;
    v34 = v55;
LABEL_30:
    v36 = 0;
    if (v31 >= -180.0 && v31 <= 180.0 && v29 >= -90.0)
    {
      v35 = v20;
      v37 = v14;
      v38 = v14;
      v39 = v12;
      if (v29 <= 90.0)
      {
        v36 = 1;
        v15 = v33;
        v61 = v34;
        v38 = v31;
        v12 = v29;
      }
      goto LABEL_37;
    }
    v35 = v20;
LABEL_36:
    v37 = v14;
    v38 = v14;
    v39 = v12;
LABEL_37:

    v22 = v56;
    v17 = v57;
    goto LABEL_38;
  }
  v35 = v20;
  v36 = 0;
  v61 = 0;
  v37 = v14;
  v38 = v14;
  v39 = v12;
LABEL_38:
  if (objc_msgSend(v10, "transitID", *(_QWORD *)&v53) && objc_msgSend(v4, "hasTransitID"))
  {
    objc_msgSend(v10, "modifiedHorizontalAccuracy");
    v35 = v49;
  }
  v62 = 0;
  v63 = v12;
  v64 = v38;
  v65 = v35;
  v66 = v61;
  v67 = 0;
  v68 = v17;
  v69 = v59;
  v70 = v15;
  v71 = v22;
  v72 = v58;
  v73 = 0;
  v74 = 0;
  v75 = v39;
  v76 = v37;
  v77 = v60;
  v78 = 0u;
  v79 = 0u;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithClientLocation:", &v62);
  if (v10 && objc_msgSend(v10, "isGoodMatch"))
  {
    v51 = -[MNLocation initWithRouteMatch:rawLocation:locationMatchType:]([MNLocation alloc], "initWithRouteMatch:rawLocation:locationMatchType:", v10, v50, 0);
  }
  else
  {
    v51 = -[MNLocation initWithRawLocation:]([MNLocation alloc], "initWithRawLocation:", v50);
    -[MNLocation setRouteMatch:](v51, "setRouteMatch:", v10);
  }
  -[MNLocation setIsDirectional:](v51, "setIsDirectional:", v36);
  objc_storeStrong((id *)p_lastMatchedLocation, v51);

  return v51;
}

- (id)_locationForInaccurateLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MNLocation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MNLocation *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MNLocation *v28;
  void *v29;
  _OWORD v31[8];
  _OWORD v32[2];
  uint8_t buf[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetPuckTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in _locationForInaccurateLocation:", buf, 0xCu);

  }
  v7 = (MNLocation *)v4;
  -[MNLocation routeMatch](self->_lastMatchedLocation, "routeMatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (objc_msgSend(v8, "isGoodMatch"))
  {
    objc_msgSend(v8, "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7;
    if (v13 == v11)
    {
      v14 = objc_alloc(MEMORY[0x1E0D274E8]);
      -[MNLocationTracker navigationSession](self, "navigationSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "auditToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithRoute:auditToken:", v11, v16);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithCLLocation:", v7);
      objc_msgSend(v17, "matchToRouteWithLocation:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v12 = v7;
      if (v19)
      {
        objc_msgSend(v19, "distanceFromRoute");
        v22 = v21;
        -[MNLocation horizontalAccuracy](v7, "horizontalAccuracy");
        v12 = v7;
        if (v22 < v23)
        {
          objc_msgSend(v11, "segmentForPointIndex:", objc_msgSend(v20, "routeCoordinate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v7;
          if (objc_msgSend(v24, "type") == 6)
          {
            v39 = 0u;
            memset(v40, 0, 28);
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v34 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v7)
              -[MNLocation clientLocation](v7, "clientLocation");
            objc_msgSend(v20, "locationCoordinate");
            v26 = v25;
            objc_msgSend(v20, "locationCoordinate");
            *(_QWORD *)&buf[4] = v26;
            *(_QWORD *)&buf[12] = v27;
            v28 = [MNLocation alloc];
            v31[6] = v38;
            v31[7] = v39;
            v32[0] = v40[0];
            *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)v40 + 12);
            v31[2] = v34;
            v31[3] = v35;
            v31[4] = v36;
            v31[5] = v37;
            v31[0] = *(_OWORD *)buf;
            v31[1] = *(_OWORD *)&buf[16];
            v12 = -[MNLocation initWithClientLocation:](v28, "initWithClientLocation:", v31);

            if (GEOConfigGetBOOL())
            {
              -[MNLocation uuid](v7, "uuid");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[MNLocation setUuid:](v12, "setUuid:", v29);

            }
          }

        }
      }

    }
  }

  return v12;
}

- (id)_roadMatchForOffRouteLocation:(id)a3 routeMatch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = a3;
  v7 = a4;
  -[GEORoadMatcher matchLocation:forTransportType:](self->_roadMatcher, "matchLocation:forTransportType:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  if (!objc_msgSend(v7, "isGoodMatch"))
    goto LABEL_4;
  objc_msgSend(v7, "distanceFromRoute");
  v10 = v9;
  objc_msgSend(v8, "distanceFromRoad");
  v12 = v11;
  objc_msgSend(v6, "horizontalAccuracy");
  if (v10 > v12 + v13)
    goto LABEL_4;
  if (!objc_msgSend(v6, "hasAccurateCourse"))
    goto LABEL_9;
  objc_msgSend(v6, "speedAccuracy");
  if (v15 < 0.0)
    goto LABEL_9;
  objc_msgSend(v6, "speed");
  if (v16 <= 3.0)
    goto LABEL_9;
  objc_msgSend(v6, "course");
  objc_msgSend(v7, "matchedCourse");
  GEOAngleDifferenceDegrees();
  v18 = fabs(v17);
  objc_msgSend(v6, "course");
  objc_msgSend(v8, "courseOnRoad");
  GEOAngleDifferenceDegrees();
  v20 = fabs(v19);
  objc_msgSend(v6, "courseAccuracy");
  if (v18 > v20 + v21)
LABEL_4:
    v14 = v8;
  else
LABEL_9:
    v14 = 0;

  return v14;
}

- (double)_timeToDisplayStaleGPSLocation
{
  void *v2;
  double v3;
  double v4;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeScale");
  v4 = 15.0 / v3;

  return v4;
}

- (BOOL)_isInaccurateLocation:(id)a3
{
  return !a3 || objc_msgSend(a3, "type") - 6 < 3;
}

- (void)_startMonitoringTransitAlerts
{
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *monitoredRegions;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MNTransitLocationTracker _startMonitoringTransitAlerts]";
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (self->_monitoredRegions)
    -[MNTransitLocationTracker _stopMonitoringAllRegions](self, "_stopMonitoringAllRegions");
  v4 = (NSMutableDictionary *)objc_opt_new();
  monitoredRegions = self->_monitoredRegions;
  self->_monitoredRegions = v4;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_transitRegions, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_transitRegions, "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTransitLocationTracker _clRegionWithCenter:identifier:signalStrength:](self, "_clRegionWithCenter:identifier:signalStrength:", v13, v11, objc_msgSend(v12, "signalStrength"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startMonitoringForRegion:", v14);

        -[NSMutableDictionary setValue:forKey:](self->_monitoredRegions, "setValue:forKey:", v14, v11);
        if (objc_msgSend(v12, "signalStrength") == 2 || v9 == 2)
        {
          v9 = 2;
        }
        else if (!objc_msgSend(v12, "signalStrength"))
        {
          v9 = 0;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  -[MNLocationTracker safeDelegate](self, "safeDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationTracker:didReceiveRouteSignalStrength:", self, v9);

}

- (id)_clRegionWithCenter:(id)a3 identifier:(id)a4 signalStrength:(int)a5
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C9E368];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend(v6, "lat");
  v11 = v10;
  objc_msgSend(v6, "lng");
  v13 = CLLocationCoordinate2DMake(v11, v12);
  GEOConfigGetDouble();
  v15 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", v8, v13.latitude, v13.longitude, v14);

  v16 = (void *)MEMORY[0x1E0D27178];
  objc_msgSend(v6, "lat");
  v18 = v17;
  objc_msgSend(v6, "lng");
  if (objc_msgSend(v16, "isLocationShiftRequiredForCoordinate:", v18, v19))
    objc_msgSend(v15, "setGeoReferenceFrame:", 2);

  return v15;
}

- (void)_stopMonitoringAllRegions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *monitoredRegions;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_monitoredRegions, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[MNTransitLocationTracker _stopMonitoringForRegionWithIdentifier:](self, "_stopMonitoringForRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  monitoredRegions = self->_monitoredRegions;
  self->_monitoredRegions = 0;

}

- (void)_stopMonitoringForRegionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[MNTransitLocationTracker _stopMonitoringForRegionWithIdentifier:]";
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v8, 0xCu);
  }

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](self->_monitoredRegions, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopMonitoringForRegion:", v7);

  -[NSMutableDictionary removeObjectForKey:](self->_monitoredRegions, "removeObjectForKey:", v4);
}

- (id)_stepForRegionAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;

  v4 = a3;
  -[MNLocationTracker navigationSession](self, "navigationSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "steps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    do
    {
      if (objc_msgSend(v9, "transportType") == 1)
      {
        v10 = v9;
        objc_msgSend(v10, "regionAlerts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if ((v12 & 1) != 0)
          break;

      }
      objc_msgSend(v9, "getNextStep");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v10;
    }
    while (v10);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_triggerAlertForRegionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id location[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary valueForKey:](self->_transitAlerts, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitLocationTracker _stepForRegionAlert:](self, "_stepForRegionAlert:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](self->_transitRegions, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeysForObject:](self->_transitAlerts, "allKeysForObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        -[MNTransitLocationTracker _stopMonitoringForRegionWithIdentifier:](self, "_stopMonitoringForRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v9);
  }

  if (v6)
  {
    objc_initWeak(location, self);
    v12 = objc_msgSend(v7, "hasDelaySeconds");
    if (v12)
      v12 = objc_msgSend(v7, "delaySeconds");
    v13 = dispatch_time(0, (uint64_t)((double)v12 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MNTransitLocationTracker__triggerAlertForRegionId___block_invoke;
    block[3] = &unk_1E61D7AF0;
    objc_copyWeak(&v18, location);
    v16 = v5;
    v17 = v6;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "No transit step found for transit alert: %@", (uint8_t *)location, 0xCu);
    }

  }
}

void __53__MNTransitLocationTracker__triggerAlertForRegionId___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  MNTransitAlert *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MNTransitAlert *v12;
  id WeakRetained;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "safeDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  v5 = [MNTransitAlert alloc];
  objc_msgSend(*(id *)(a1 + 32), "banner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "navigationSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentRouteInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MNTransitAlert initWithTransitBanner:transitStep:activeRoute:](v5, "initWithTransitBanner:transitStep:activeRoute:", v6, v7, v11);
  objc_msgSend(v3, "locationTracker:didReceiveTransitAlert:", v4, v12);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MNTransitLocationTracker locationManager:didExitRegion:]";
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(CFSTR("Maps_Transit"), "copy");
  v9 = objc_msgSend(v7, "hasPrefix:", v8);

  if (v9)
  {
    -[NSMutableDictionary valueForKey:](self->_transitRegions, "valueForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = (const char *)v5;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "No transit trigger region found for region: %@", (uint8_t *)&v13, 0xCu);
      }

      +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopMonitoringForRegion:", v5);

    }
    if (!objc_msgSend(v10, "transition") || objc_msgSend(v10, "transition") == 2)
      -[MNTransitLocationTracker _triggerAlertForRegionId:](self, "_triggerAlertForRegionId:", v7);

  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MNTransitLocationTracker locationManager:didEnterRegion:]";
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(CFSTR("Maps_Transit"), "copy");
  v9 = objc_msgSend(v7, "hasPrefix:", v8);

  if (v9)
  {
    -[NSMutableDictionary valueForKey:](self->_transitRegions, "valueForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = (const char *)v5;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "No transit trigger region found for region: %@", (uint8_t *)&v13, 0xCu);
      }

      +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopMonitoringForRegion:", v5);

    }
    if (!objc_msgSend(v10, "transition") || objc_msgSend(v10, "transition") == 1)
      -[MNTransitLocationTracker _triggerAlertForRegionId:](self, "_triggerAlertForRegionId:", v7);

  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Failed to track region with region=%@ error=%@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTransitLocationTracker _stopMonitoringForRegionWithIdentifier:](self, "_stopMonitoringForRegionWithIdentifier:", v10);

}

- (BOOL)debugSnapToTransitLines
{
  return self->_debugSnapToTransitLines;
}

- (void)setDebugSnapToTransitLines:(BOOL)a3
{
  self->_debugSnapToTransitLines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitAlerts, 0);
  objc_storeStrong((id *)&self->_transitRegions, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_lastMatchedLocation, 0);
  objc_storeStrong((id *)&self->_lastAccurateLocationDate, 0);
  objc_storeStrong((id *)&self->_lastLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
  objc_storeStrong((id *)&self->_transitRouteMatcher, 0);
}

@end
