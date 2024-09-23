@implementation MNTrafficIncidentAlertUpdater

- (MNTrafficIncidentAlertUpdater)init
{
  MNTrafficIncidentAlertUpdater *v2;
  uint64_t v3;
  NSMutableSet *pendingAlerts;
  uint64_t v5;
  NSMutableSet *displayedBannerIds;
  uint64_t v7;
  NSDate *nextAlertDisplayTime;
  MNTrafficIncidentAlertUpdater *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MNTrafficIncidentAlertUpdater;
  v2 = -[MNTrafficIncidentAlertUpdater init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pendingAlerts = v2->_pendingAlerts;
    v2->_pendingAlerts = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    displayedBannerIds = v2->_displayedBannerIds;
    v2->_displayedBannerIds = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    nextAlertDisplayTime = v2->_nextAlertDisplayTime;
    v2->_nextAlertDisplayTime = (NSDate *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNTrafficIncidentAlertUpdater clearAlerts](self, "clearAlerts");
  v3.receiver = self;
  v3.super_class = (Class)MNTrafficIncidentAlertUpdater;
  -[MNTrafficIncidentAlertUpdater dealloc](&v3, sel_dealloc);
}

- (void)setUseTriggerPointRangeBannerQueuing:(BOOL)a3
{
  if (self->_useTriggerPointRangeBannerQueuing != a3)
  {
    self->_useTriggerPointRangeBannerQueuing = a3;
    -[MNTrafficIncidentAlertUpdater clearAlerts](self, "clearAlerts");
  }
}

- (MNTrafficIncidentAlert)activeAlert
{
  return self->_activeAlert;
}

- (void)setActiveAlert:(id)a3
{
  MNTrafficIncidentAlert *v5;
  NSDate *v6;
  NSDate *activeAlertDisplayedTime;
  NSDate *v8;
  NSDate *nextAlertDisplayTime;
  MNTrafficIncidentAlert *v10;

  v5 = (MNTrafficIncidentAlert *)a3;
  if (self->_activeAlert != v5)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      activeAlertDisplayedTime = self->_activeAlertDisplayedTime;
      self->_activeAlertDisplayedTime = v6;
    }
    else
    {
      -[MNTrafficIncidentAlert overlapDelayTime](self->_activeAlert, "overlapDelayTime");
      -[NSDate dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      nextAlertDisplayTime = self->_nextAlertDisplayTime;
      self->_nextAlertDisplayTime = v8;

      activeAlertDisplayedTime = self->_activeAlertDisplayedTime;
      self->_activeAlertDisplayedTime = 0;
    }

    objc_storeStrong((id *)&self->_activeAlert, a3);
    v5 = v10;
  }

}

- (void)updateForLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  NSObject *v38;
  int v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    if (self->_useTriggerPointRangeBannerQueuing)
    {
      -[MNTrafficIncidentAlertUpdater _nextAlert](self, "_nextAlert");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "previousBannerChange");
        -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v10 = v8;
        else
          v10 = 0;
        -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "priority");
        v13 = objc_msgSend(v7, "priority");

        -[NSDate timeIntervalSinceNow](self->_activeAlertDisplayedTime, "timeIntervalSinceNow");
        v15 = v14;
        -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minDisplayTime");
        v18 = v17;

        switch(v10)
        {
          case 0:
            -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19 || (v19, v12 < v13) && v18 < -v15)
            {
              objc_msgSend(v7, "triggerRange");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "showTriggerPoint");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v20) = objc_msgSend(v21, "shouldActivateForLocation:", v5);
              if ((_DWORD)v20)
                goto LABEL_16;
            }
            break;
          case 1:
            if (v12 >= v13)
              break;
            objc_msgSend(v7, "triggerRange");
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v22, "showTriggerPoint");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v22) = objc_msgSend(v23, "shouldActivateForLocation:", v5);
            if ((v22 & 1) == 0)
              break;
LABEL_16:
            objc_msgSend(v7, "incident");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
              goto LABEL_19;
            -[MNLocation routeMatch](self->_lastLocation, "routeMatch");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "route");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "triggerRange");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "showTriggerPoint");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "referenceCoordinate");

            objc_msgSend(v26, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, objc_msgSend(v25, "routeCoordinate"));
            v31 = v30;
            objc_msgSend(v26, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, objc_msgSend(v7, "incidentCoordinate"));
            v33 = v32;
            if (v32 <= 2.22044605e-16)
            {

            }
            else
            {
              GEOConfigGetDouble();
              v35 = v34;

              if (v31 / v33 <= v35)
              {
LABEL_19:
                self->_trafficIncidentStatus = 0;
                -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
                -[MNTrafficIncidentAlertUpdater _activateAlert:forLocation:](self, "_activateAlert:forLocation:", v7, v5);
                break;
              }
            }
            GEOFindOrCreateLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = 134218240;
              v40 = v31;
              v41 = 2048;
              v42 = v33;
              _os_log_impl(&dword_1B0AD7000, v38, OS_LOG_TYPE_DEFAULT, "Dropping dodgeball since user is too close to the incident. distanceFromAlertStartToCurrentLocation: %0.1fm | distanceFromAlertStartToIncident: %0.1fm", (uint8_t *)&v39, 0x16u);
            }

            -[NSMutableSet removeObject:](self->_pendingAlerts, "removeObject:", v7);
            break;
          case 2:
            -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              -[MNTrafficIncidentAlertUpdater activeAlert](self, "activeAlert");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "updateAlertIDWithAlert:", v37);

              -[MNTrafficIncidentAlertUpdater setActiveAlert:](self, "setActiveAlert:", v7);
            }
            break;
          case 3:
            -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
            break;
          default:
            break;
        }
      }
      -[MNTrafficIncidentAlertUpdater _updateActiveAlertForLocation:](self, "_updateActiveAlertForLocation:", v5);

      goto LABEL_28;
    }
    -[MNTrafficIncidentAlertUpdater _updateForLocationUsingDistancePoints:](self, "_updateForLocationUsingDistancePoints:", v5);
  }
LABEL_28:

}

- (void)updateForReroute:(id)a3
{
  id v4;
  MNTrafficIncidentAlert *activeAlert;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  activeAlert = self->_activeAlert;
  if (!activeAlert
    || (-[MNTrafficIncidentAlert alternateRoute](activeAlert, "alternateRoute"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v4))
  {
    self->_trafficIncidentStatus = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Clearing traffic incident alerts because of a reroute.", v8, 2u);
    }

    -[MNTrafficIncidentAlertUpdater clearAlerts](self, "clearAlerts");
  }
  -[NSMutableSet removeAllObjects](self->_pendingAlerts, "removeAllObjects");

}

- (void)updateIncidentResultForETARequest:(id)a3
{
  objc_msgSend(a3, "setRerouteStatus:", self->_trafficIncidentStatus);
  if ((self->_trafficIncidentStatus - 2) <= 2)
    self->_trafficIncidentStatus = 0;
}

- (void)updateIncidentResultForRerouteRequest:(id)a3
{
  NSMutableSet *displayedBannerIds;
  id v4;
  void *v5;
  id v6;

  displayedBannerIds = self->_displayedBannerIds;
  v4 = a3;
  -[NSMutableSet allObjects](displayedBannerIds, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setDisplayedBannerIds:", v5);

}

- (void)updateForAlertsFromResponse:(id)a3 updatedLocation:(id)a4
{
  id v6;
  MNLocation *v7;
  NSObject *v8;
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  MNTrafficIncidentAlert *activeAlert;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableSet *v30;
  NSMutableSet *pendingAlerts;
  MNLocation *lastLocation;
  NSObject *v33;
  MNLocation *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (MNLocation *)a4;
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v6;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "MNTrafficIncidentAlertUpdater received alerts: %@", buf, 0xCu);
  }

  if ((GEOConfigGetBOOL() & 1) != 0)
  {
    if (self->_useTriggerPointRangeBannerQueuing)
    {
      v34 = v7;
      v9 = (void *)objc_opt_new();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v10 = self->_pendingAlerts;
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v41 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if (objc_msgSend(v15, "persistAcrossUpdates", v34))
            {
              objc_msgSend(v15, "bannerID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

            }
          }
          v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v12);
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v35 = v6;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
            activeAlert = self->_activeAlert;
            if (activeAlert)
            {
              -[MNTrafficIncidentAlert bannerID](activeAlert, "bannerID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "bannerID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "isEqualToString:", v25);

              if ((v26 & 1) != 0)
                continue;
            }
            objc_msgSend(v22, "bannerID", v34);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v27);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v19);
      }

      v28 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v9, "allValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      pendingAlerts = self->_pendingAlerts;
      self->_pendingAlerts = v30;

      v7 = v34;
      lastLocation = v34;
      if (!v34)
        lastLocation = self->_lastLocation;
      -[MNTrafficIncidentAlertUpdater updateForLocation:](self, "updateForLocation:", lastLocation, v34);

      v6 = v35;
    }
    else
    {
      -[MNTrafficIncidentAlertUpdater _updateForAlertsFromResponseUsingDistancePoints:](self, "_updateForAlertsFromResponseUsingDistancePoints:", v6);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v6;
      _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_DEFAULT, "Dodgeball alert was found in response but EnableDodgeball is off. Ignoring %@", buf, 0xCu);
    }

  }
}

- (void)clearAlerts
{
  -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
  -[NSMutableSet removeAllObjects](self->_pendingAlerts, "removeAllObjects");
}

- (id)_nextAlert
{
  void *v3;
  uint64_t v4;
  NSMutableSet *pendingAlerts;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t j;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  MNTrafficIncidentAlertUpdater *v64;
  id obj;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  _QWORD v78[6];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  -[MNLocation routeMatch](self->_lastLocation, "routeMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "routeCoordinate");

  pendingAlerts = self->_pendingAlerts;
  v6 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke;
  v78[3] = &unk_1E61D35D0;
  v78[4] = self;
  v78[5] = v4;
  -[NSMutableSet _geo_filtered:](pendingAlerts, "_geo_filtered:", v78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)-[NSMutableSet count](self->_pendingAlerts, "count") < 2)
    goto LABEL_33;
  v61 = v7;
  v11 = (void *)objc_opt_new();
  v77[0] = v6;
  v77[1] = 3221225472;
  v77[2] = __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_3;
  v77[3] = &unk_1E61D3618;
  v77[4] = self;
  v12 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1B5E0E364](v77);
  v13 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v10);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v64 = self;
  v14 = self->_pendingAlerts;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v74 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (v19 != v10)
        {
          v12[2](v12, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
          if (GEOPolylineCoordinateRangeIntersectsRange())
            objc_msgSend(v11, "addObject:", v19);
        }
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    }
    while (v16);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v11;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (!v68)
    goto LABEL_32;
  v67 = *(_QWORD *)v70;
  while (2)
  {
    for (j = 0; j != v68; ++j)
    {
      if (*(_QWORD *)v70 != v67)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
      v22 = objc_msgSend(v21, "priority");
      if (v22 > objc_msgSend(v10, "priority"))
      {
        v23 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v21);
        v63 = v24;
        objc_msgSend(v10, "minDisplayTime");
        v26 = v25;
        objc_msgSend(v10, "overlapDelayTime");
        v28 = v26 + v27;
        -[MNLocation routeMatch](v64->_lastLocation, "routeMatch");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "route");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "mainRouteInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "etaRoute");
        v66 = v21;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "coordinateAtTimeInterval:afterCoordinate:etaRoute:", v13, v32, v28);

        v62 = v23;
        if (GEOPolylineCoordinateIsABeforeB())
        {
          objc_msgSend(v10, "triggerRange");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "showTriggerPoint");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "allowsShifting");

          objc_msgSend(v10, "triggerRange");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "hideTriggerPoint");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          if (v35)
          {
            if (v37)
            {
              objc_msgSend(v10, "triggerRange");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "hideTriggerPoint");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "allowsShifting");

              if (v41)
              {
                objc_msgSend(v10, "triggerRange");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "showTriggerPoint");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setReferenceCoordinate:", v63);

                -[MNLocation routeMatch](v64->_lastLocation, "routeMatch");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "route");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "mainRouteInfo");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "etaRoute");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = v53;
                v57 = v28;
                v58 = v63;
LABEL_34:
                v59 = objc_msgSend(v56, "coordinateAtTimeInterval:afterCoordinate:etaRoute:", v58, v55, v57);

                v7 = v61;
                if (!GEOPolylineCoordinateIsABeforeB())
                {
LABEL_37:

                  v47 = 0;
                  goto LABEL_38;
                }
                objc_msgSend(v10, "triggerRange");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "hideTriggerPoint");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setReferenceCoordinate:", v59);
LABEL_36:

                goto LABEL_37;
              }
            }
            else
            {

            }
            objc_msgSend(v10, "triggerRange");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "hideTriggerPoint");
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v46)
            {
              objc_msgSend(v10, "triggerRange");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "showTriggerPoint");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setReferenceCoordinate:", v62);
              v7 = v61;
              goto LABEL_36;
            }
          }
          else if (v37)
          {
            objc_msgSend(v10, "triggerRange");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "hideTriggerPoint");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "allowsShifting");

            if (v44)
            {
              -[MNLocation routeMatch](v64->_lastLocation, "routeMatch");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "route");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "mainRouteInfo");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "etaRoute");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v53;
              v57 = v28;
              v58 = v63;
              goto LABEL_34;
            }
          }
          else
          {

          }
        }
      }
    }
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v68)
      continue;
    break;
  }
LABEL_32:

  v7 = v61;
LABEL_33:
  v47 = v10;
LABEL_38:

  return v47;
}

uint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "routeMatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "triggerRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showTriggerPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "referenceCoordinate");
  if ((GEOPolylineCoordinateIsABeforeOrEqualToB() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "distanceFromPoint:toPoint:", *(_QWORD *)(a1 + 40), objc_msgSend(v7, "referenceCoordinate"));
    v8 = v9 < 50.0;
  }
  objc_msgSend(v3, "triggerRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideTriggerPoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "minDisplayTime");
    v13 = v12;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "routeMatch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "routeCoordinate");
    objc_msgSend(v3, "mainRouteInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "etaRoute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinateAtTimeInterval:afterCoordinate:etaRoute:", v15, v17, v13);

    objc_msgSend(v11, "referenceCoordinate");
    v8 = v8 & GEOPolylineCoordinateIsABeforeOrEqualToB();
  }

  return v8;
}

uint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "priority");
  if (v6 > objc_msgSend(v5, "priority"))
    goto LABEL_2;
  v8 = objc_msgSend(v4, "priority");
  if (v8 < objc_msgSend(v5, "priority"))
  {
LABEL_4:
    v7 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v4, "triggerRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hideTriggerPoint");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v5, "triggerRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hideTriggerPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "triggerRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hideTriggerPoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "referenceCoordinate");

      objc_msgSend(v5, "triggerRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hideTriggerPoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "referenceCoordinate");

      if (GEOPolylineCoordinateIsABeforeOrEqualToB())
        v7 = -1;
      else
        v7 = 1;
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "triggerRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hideTriggerPoint");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v5, "triggerRange");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hideTriggerPoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_2:
      v7 = -1;
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "triggerRange");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hideTriggerPoint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

  }
  else
  {
    objc_msgSend(v5, "triggerRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hideTriggerPoint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      goto LABEL_4;
  }
  objc_msgSend(v4, "triggerRange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayTime");
  v29 = v28;
  objc_msgSend(v4, "triggerRange");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayTime");
  if (v29 > v31)
    v7 = 1;
  else
    v7 = -1;

LABEL_22:
  return v7;
}

unint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unsigned int v14;
  float v15;

  v3 = a2;
  objc_msgSend(v3, "triggerRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showTriggerPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "referenceCoordinate");

  objc_msgSend(v4, "hideTriggerPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "hideTriggerPoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "referenceCoordinate");
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "routeMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayTime");
    v11 = v10;
    objc_msgSend(v3, "mainRouteInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "etaRoute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinateAtTimeInterval:afterCoordinate:etaRoute:", v6, v13, v11);

  }
  if (GEOPolylineCoordinateIsInvalid())
  {
    v14 = *MEMORY[0x1E0D26A38];
    v15 = *(float *)(MEMORY[0x1E0D26A38] + 4);
  }
  else
  {
    v15 = *((float *)&v6 + 1) - floorf(*((float *)&v6 + 1));
    v14 = vcvtms_u32_f32(*((float *)&v6 + 1)) + v6;
  }
  GEOPolylineCoordinateIsInvalid();

  return v14 | ((unint64_t)LODWORD(v15) << 32);
}

- (void)_updateForAlertsFromResponseUsingDistancePoints:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  NSString *previousBannerID;
  int v12;
  int v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  void *activeAlert;
  NSMutableSet *v18;
  NSMutableSet *pendingAlerts;
  MNTrafficIncidentAlert *v20;
  id v21;

  v4 = a3;
  v21 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[NSMutableSet count](self->_pendingAlerts, "count"))
    v6 = 1;
  else
    v6 = self->_activeAlert != 0;
  objc_msgSend(v5, "bannerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && -[NSString length](self->_previousBannerID, "length"))
  {
    objc_msgSend(v5, "bannerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", self->_previousBannerID);

  }
  else
  {
    v9 = 0;
  }

  if (v5)
    v10 = 1;
  else
    v10 = v6;
  if (v10 == 1 && (v9 & 1) == 0)
  {
    previousBannerID = self->_previousBannerID;
    self->_previousBannerID = 0;

    v12 = objc_msgSend(v5, "previousBannerChange");
    if (v12 == 3)
    {

LABEL_26:
      -[NSMutableSet removeAllObjects](self->_pendingAlerts, "removeAllObjects");
      v5 = 0;
      goto LABEL_27;
    }
    if (!v5)
      goto LABEL_26;
    v13 = v12;
    if (!-[NSMutableSet count](self->_pendingAlerts, "count") && !self->_activeAlert)
      goto LABEL_25;
    if (v13 != 2)
    {
      if (v13 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
        v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        pendingAlerts = self->_pendingAlerts;
        self->_pendingAlerts = v18;

        -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
        goto LABEL_31;
      }
      if (v13)
        goto LABEL_27;
LABEL_25:
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
      v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v15 = self->_pendingAlerts;
      self->_pendingAlerts = v14;

LABEL_31:
      self->_trafficIncidentStatus = 0;
      goto LABEL_35;
    }
    if (self->_pendingAlerts)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
      v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      activeAlert = self->_pendingAlerts;
      self->_pendingAlerts = v16;
    }
    else
    {
      if (!self->_activeAlert)
        goto LABEL_35;
      objc_msgSend(v5, "updateAlertIDWithAlert:");
      v20 = v5;
      activeAlert = self->_activeAlert;
      self->_activeAlert = v20;
    }

LABEL_35:
    if (self->_lastLocation)
      -[MNTrafficIncidentAlertUpdater _updateForLocationUsingDistancePoints:](self, "_updateForLocationUsingDistancePoints:");
  }
LABEL_27:

}

- (void)_updateForLocationUsingDistancePoints:(id)a3
{
  id v4;
  NSMutableSet *pendingAlerts;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MNTrafficIncidentAlert *activeAlert;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  char *v17;
  char *v18;
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
  v4 = a3;
  pendingAlerts = self->_pendingAlerts;
  if (pendingAlerts && -[NSMutableSet count](pendingAlerts, "count"))
  {
    -[NSMutableSet anyObject](self->_pendingAlerts, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "routeMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeCoordinate");

  if (v6)
  {
    if (!self->_activeAlert)
    {
      objc_msgSend(v6, "startValidCoordinateRange");
      objc_msgSend(v6, "endValidCoordinateRange");
      if (GEOPolylineCoordinateWithinRange())
        -[MNTrafficIncidentAlertUpdater _activateAlert:forLocation:](self, "_activateAlert:forLocation:", v6, v4);
    }
  }
  if (self->_activeAlert)
  {
    objc_msgSend(v4, "routeMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNTrafficIncidentAlert alternateRoute](self->_activeAlert, "alternateRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    activeAlert = self->_activeAlert;
    if (v9 == v10)
    {
      -[MNTrafficIncidentAlert alternateEndValidCoordinateRange](activeAlert, "alternateEndValidCoordinateRange");
    }
    else
    {
      -[MNTrafficIncidentAlert originalRoute](activeAlert, "originalRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected route from route match."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = "-[MNTrafficIncidentAlertUpdater _updateForLocationUsingDistancePoints:]";
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTrafficIncidentAlertUpdater.m";
          v23 = 1024;
          v24 = 528;
          v25 = 2080;
          v26 = "NO";
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
        }

        -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
LABEL_25:

        goto LABEL_26;
      }
      -[MNTrafficIncidentAlert endValidCoordinateRange](self->_activeAlert, "endValidCoordinateRange");
    }
    if (GEOPolylineCoordinateCompare() == 1)
    {
      if (-[MNTrafficIncidentAlert isReroute](self->_activeAlert, "isReroute"))
        v15 = 2;
      else
        v15 = 0;
      self->_trafficIncidentStatus = v15;
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        GEOPolylineCoordinateAsShortString();
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        GEOPolylineCoordinateAsShortString();
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Removing traffic incident alert because the route coordinate %@ is past the valid end coordinate %@", (uint8_t *)&v19, 0x16u);

      }
      -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
    }
    -[MNTrafficIncidentAlertUpdater _updateAlertDistanceAndETAForLocation:](self, "_updateAlertDistanceAndETAForLocation:", v4);
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_activateAlert:(id)a3 forLocation:(id)a4
{
  id v6;
  id v7;
  double v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSMutableSet *displayedBannerIds;
  void *previousBannerID;
  NSString *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSDate timeIntervalSinceNow](self->_nextAlertDisplayTime, "timeIntervalSinceNow");
  if (v8 <= 0.0)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "Activating traffic incident alert.", buf, 2u);
    }

    if (!-[MNTrafficIncidentAlertUpdater useTriggerPointRangeBannerQueuing](self, "useTriggerPointRangeBannerQueuing")
      || (objc_msgSend(v6, "bannerID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = v10 == 0,
          v10,
          v11))
    {
      objc_msgSend(v6, "bannerID");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      previousBannerID = self->_previousBannerID;
      self->_previousBannerID = v14;
    }
    else
    {
      displayedBannerIds = self->_displayedBannerIds;
      objc_msgSend(v6, "bannerID");
      previousBannerID = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](displayedBannerIds, "addObject:", previousBannerID);
    }

    objc_msgSend(v6, "updateLocation:", v7);
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "bannerID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v16;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_DEFAULT, "Activating alert: %@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    switch(objc_msgSend(v6, "alertType"))
    {
      case 1:
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke;
        v35[3] = &unk_1E61D1AE8;
        v18 = &v37;
        objc_copyWeak(&v37, (id *)buf);
        v19 = &v36;
        v36 = v6;
        v23 = MEMORY[0x1E0C80D38];
        v24 = v35;
        goto LABEL_15;
      case 2:
      case 5:
      case 6:
        -[NSMutableSet removeObject:](self->_pendingAlerts, "removeObject:", v6);
        -[MNTrafficIncidentAlertUpdater setActiveAlert:](self, "setActiveAlert:", v6);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_4;
        v29[3] = &unk_1E61D3640;
        v18 = &v31;
        objc_copyWeak(&v31, (id *)buf);
        v30 = v6;
        objc_msgSend(WeakRetained, "trafficIncidentAlertUpdater:receivedAlert:responseCallback:", self, v30, v29);

        v19 = &v30;
        goto LABEL_16;
      case 3:
      case 4:
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_3;
        v32[3] = &unk_1E61D3640;
        v18 = &v34;
        objc_copyWeak(&v34, (id *)buf);
        v20 = v6;
        v33 = v20;
        v21 = (void *)MEMORY[0x1B5E0E364](v32);
        -[NSMutableSet removeObject:](self->_pendingAlerts, "removeObject:", v20);
        -[MNTrafficIncidentAlertUpdater setActiveAlert:](self, "setActiveAlert:", v20);
        self->_trafficIncidentStatus = 1;
        v22 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v22, "trafficIncidentAlertUpdater:receivedAlert:responseCallback:", self, self->_activeAlert, v21);

        v19 = &v33;
        goto LABEL_16;
      case 7:
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_5;
        v26[3] = &unk_1E61D1AE8;
        v18 = &v28;
        objc_copyWeak(&v28, (id *)buf);
        v19 = &v27;
        v27 = v6;
        v23 = MEMORY[0x1E0C80D38];
        v24 = v26;
LABEL_15:
        dispatch_async(v23, v24);
LABEL_16:

        objc_destroyWeak(v18);
        break;
      default:
        break;
    }
    if (self->_activeAlert)
    {
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v25, "trafficIncidentAlertUpdater:updatedAlert:", self, self->_activeAlert);

    }
    objc_destroyWeak((id *)buf);
  }

}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id *v12;
  id v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setActiveAlert:", *(_QWORD *)(a1 + 32));
    v4 = objc_loadWeakRetained(v3 + 1);
    v5 = *(void **)(a1 + 32);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_2;
    v11 = &unk_1E61D2B78;
    v12 = v3;
    v13 = v5;
    objc_msgSend(v4, "trafficIncidentAlertUpdater:receivedAlert:responseCallback:", v3, v13, &v8);

    objc_msgSend(*(id *)(a1 + 32), "alternateRoute", v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_loadWeakRetained(v3 + 1);
      objc_msgSend(v7, "trafficIncidentAlertUpdater:didSwitchToNewRoute:forAlert:", v3, v6, *(_QWORD *)(a1 + 32));

    }
  }

}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setActiveAlert:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "trafficIncidentAlertUpdater:didDismissAlert:withReroute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);

}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id *v11;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v21 = WeakRetained;
    objc_msgSend(WeakRetained, "activeAlert");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v21;
    if (v5)
    {
      objc_msgSend(v21, "activeAlert");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "defaultToNewRoute");

      if (v7)
      {
        if ((_DWORD)a2)
        {
          *((_DWORD *)v21 + 14) = 4;
          objc_msgSend(v21, "activeAlert");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "alternateRoute");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v10 = objc_loadWeakRetained(v21 + 1);
            objc_msgSend(v10, "trafficIncidentAlertUpdater:didSwitchToNewRoute:forAlert:", v21, v9, *(_QWORD *)(a1 + 32));

          }
          v11 = v21;
        }
        else
        {
          v11 = v21;
          *((_DWORD *)v21 + 14) = 3;
        }
        objc_msgSend(v11, "setActiveAlert:", 0);
        v13 = objc_loadWeakRetained(v21 + 1);
        v14 = v13;
        v15 = *(_QWORD *)(a1 + 32);
        v16 = v21;
        v17 = a2;
      }
      else
      {
        if ((_DWORD)a2)
        {
          v12 = v21;
          *((_DWORD *)v21 + 14) = 4;
        }
        else
        {
          *((_DWORD *)v21 + 14) = 3;
          objc_msgSend(v21, "activeAlert");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "alternateRoute");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_loadWeakRetained(v21 + 1);
            objc_msgSend(v20, "trafficIncidentAlertUpdater:didSwitchToNewRoute:forAlert:", v21, v19, *(_QWORD *)(a1 + 32));

          }
          v12 = v21;
        }
        objc_msgSend(v12, "setActiveAlert:", 0);
        v13 = objc_loadWeakRetained(v21 + 1);
        v14 = v13;
        v15 = *(_QWORD *)(a1 + 32);
        v17 = a2 ^ 1;
        v16 = v21;
      }
      objc_msgSend(v13, "trafficIncidentAlertUpdater:didDismissAlert:withReroute:", v16, v15, v17);

      WeakRetained = v21;
    }
  }

}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "setActiveAlert:", 0);
    v5 = objc_loadWeakRetained(v6 + 1);
    objc_msgSend(v5, "trafficIncidentAlertUpdater:didDismissAlert:withReroute:", v6, *(_QWORD *)(a1 + 32), a2);

    WeakRetained = v6;
  }

}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "alternateRoute");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v3, "trafficIncidentAlertUpdater:didSwitchToNewRoute:forAlert:", WeakRetained, v2, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(WeakRetained, "setActiveAlert:", 0);

  }
}

- (void)_removeActiveAlert
{
  MNTrafficIncidentAlert *activeAlert;
  MNTrafficIncidentAlert *v4;
  int v5;
  id WeakRetained;

  activeAlert = self->_activeAlert;
  if (activeAlert)
  {
    v4 = activeAlert;
    if (-[MNTrafficIncidentAlert isReroute](v4, "isReroute"))
    {
      if (self->_trafficIncidentStatus != 1)
      {
LABEL_8:
        -[MNTrafficIncidentAlertUpdater setActiveAlert:](self, "setActiveAlert:", 0);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "trafficIncidentAlertUpdater:invalidatedAlert:", self, v4);

        return;
      }
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
    self->_trafficIncidentStatus = v5;
    goto LABEL_8;
  }
}

- (void)_updateActiveAlertForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activeAlert)
  {
    objc_msgSend(v4, "routeMatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNTrafficIncidentAlert originalRoute](self->_activeAlert, "originalRoute");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((void *)v8 == v7)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[MNTrafficIncidentAlert alternateRoute](self->_activeAlert, "alternateRoute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v7)
      {
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uniqueRouteID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTrafficIncidentAlert originalRoute](self->_activeAlert, "originalRoute");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTrafficIncidentAlert originalRoute](self->_activeAlert, "originalRoute");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "uniqueRouteID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTrafficIncidentAlert alternateRoute](self->_activeAlert, "alternateRoute");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTrafficIncidentAlert alternateRoute](self->_activeAlert, "alternateRoute");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueRouteID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138479107;
          v36 = v32;
          v37 = 2112;
          v38 = v30;
          v39 = 2113;
          v40 = v12;
          v41 = 2112;
          v42 = v13;
          v43 = 2113;
          v44 = v14;
          v45 = 2112;
          v46 = v16;
          _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Location was matched to a route that matches neither of the alert's routes! Invalidating alert.\nRoute for location: %{private}@ - %@\nAlert original route: %{private}@ - %@\nAlert new route: %{private}@ - %@", buf, 0x3Eu);

        }
        -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
        goto LABEL_32;
      }
    }
    -[MNTrafficIncidentAlert progressBarTriggerRange](self->_activeAlert, "progressBarTriggerRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showTriggerPoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18
      && !-[MNTrafficIncidentAlert shouldShowTimer](self->_activeAlert, "shouldShowTimer")
      && objc_msgSend(v18, "shouldActivateForLocation:", v5))
    {
      -[MNTrafficIncidentAlert setShouldShowTimer:](self->_activeAlert, "setShouldShowTimer:", 1);
      -[MNTrafficIncidentAlert progressBarTriggerRange](self->_activeAlert, "progressBarTriggerRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayTime");
      -[MNTrafficIncidentAlert setAlertDisplayDuration:](self->_activeAlert, "setAlertDisplayDuration:");
    }
    else
    {
      if (-[MNTrafficIncidentAlert shouldShowTimer](self->_activeAlert, "shouldShowTimer"))
      {
LABEL_31:
        -[MNTrafficIncidentAlertUpdater _updateAlertDistanceAndETAForLocation:](self, "_updateAlertDistanceAndETAForLocation:", v5);

LABEL_32:
        goto LABEL_33;
      }
      -[MNTrafficIncidentAlert triggerRange](self->_activeAlert, "triggerRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hideTriggerPoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v21 = objc_msgSend(v19, "shouldActivateForLocation:", v5);
      else
        v21 = 0;
      -[NSDate timeIntervalSinceNow](self->_activeAlertDisplayedTime, "timeIntervalSinceNow");
      v23 = -v22;
      -[MNTrafficIncidentAlert triggerRange](self->_activeAlert, "triggerRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "displayTime");
      v26 = v25;

      if ((v21 & 1) != 0 || v26 < v23)
      {
        if (v21)
        {
          GEOFindOrCreateLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_DEFAULT, "Active incident alert's hide trigger point has been passed.", buf, 2u);
          }

        }
        if (v26 < v23)
        {
          GEOFindOrCreateLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_DEFAULT, "Active incident alert has timed out.", buf, 2u);
          }

        }
        if (-[MNTrafficIncidentAlert isReroute](self->_activeAlert, "isReroute"))
          v29 = 2;
        else
          v29 = 0;
        self->_trafficIncidentStatus = v29;
        -[MNTrafficIncidentAlertUpdater _removeActiveAlert](self, "_removeActiveAlert");
      }
    }

    goto LABEL_31;
  }
LABEL_33:

}

- (void)_updateAlertDistanceAndETAForLocation:(id)a3
{
  MNTrafficIncidentAlert *activeAlert;
  id WeakRetained;

  activeAlert = self->_activeAlert;
  if (activeAlert)
  {
    -[MNTrafficIncidentAlert updateLocation:](activeAlert, "updateLocation:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "trafficIncidentAlertUpdater:updatedAlert:", self, self->_activeAlert);

  }
}

- (MNTrafficIncidentAlertUpdaterDelegate)delegate
{
  return (MNTrafficIncidentAlertUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useTriggerPointRangeBannerQueuing
{
  return self->_useTriggerPointRangeBannerQueuing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_previousBannerID, 0);
  objc_storeStrong((id *)&self->_nextAlertDisplayTime, 0);
  objc_storeStrong((id *)&self->_activeAlertDisplayedTime, 0);
  objc_storeStrong((id *)&self->_activeAlert, 0);
  objc_storeStrong((id *)&self->_pendingAlerts, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
