@implementation MNNavigationSessionLogger

- (MNNavigationSessionLogger)init
{
  MNNavigationSessionLogger *v2;
  MNNavigationSessionLogger *v3;
  MNNavigationSessionLogger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNNavigationSessionLogger;
  v2 = -[MNNavigationSessionLogger init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)navigationSession:(id)a3 didStartWithRoute:(id)a4 navigationType:(int64_t)a5 isResumingMultipointRoute:(BOOL)a6 isReconnecting:(BOOL)a7
{
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    objc_msgSend(v9, "route");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a7)
    {
      if (v15)
      {
        objc_msgSend(v13, "humanDescriptionWithAddressAndLatLng");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "routeID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v12, "transportType");
        if (v18 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E61D8058[(int)v18];
        }
        -[__CFString capitalizedString](v19, "capitalizedString");
        v22 = objc_claimAutoreleasedReturnValue();
        v21 = (__CFString *)v22;
        if ((unint64_t)(a5 - 1) > 3)
          v23 = CFSTR("None");
        else
          v23 = off_1E61D7FC0[a5 - 1];
        *(_DWORD *)buf = 138478595;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        v31 = 2112;
        v32 = v22;
        v33 = 2112;
        v34 = (uint64_t)v23;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Restarted navigation session to [%{private}@] (%@) | %@ %@", buf, 0x2Au);
LABEL_19:

      }
    }
    else if (v15)
    {
      objc_msgSend(v13, "humanDescriptionWithAddressAndLatLng");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeID");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v12, "transportType");
      if (v20 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E61D8058[(int)v20];
      }
      -[__CFString capitalizedString](v21, "capitalizedString");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if ((unint64_t)(a5 - 1) > 3)
        v26 = CFSTR("None");
      else
        v26 = off_1E61D7FC0[a5 - 1];
      *(_DWORD *)buf = 138478851;
      v28 = v16;
      v29 = 2113;
      v30 = v17;
      v31 = 2112;
      v32 = (uint64_t)v19;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Started navigation session to [%{private}@] via %{private}@ (%@) | %@ %@", buf, 0x34u);

      goto LABEL_19;
    }

  }
}

- (void)navigationSession:(id)a3 didChangeNavigationState:(int)a4
{
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  uint8_t buf[4];
  __CFString *v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v9 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E61D7FE0[(int)v4];
    }
    *(_DWORD *)buf = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Changed navigation state to '%@'", buf, 0xCu);

  }
}

- (void)navigationSession:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSError *previousSuppressedRerouteError;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  const __CFString *v31;
  __CFString *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MNGetPuckTrackingLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "[MN] [%@] - Processing - in MNNavigationSessionLogger::navigationSession:didUpdateMatchedLocation:", buf, 0xCu);

  }
  if (objc_msgSend(v5, "state") == 1)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    self->_previousSuppressedRerouteError = 0;

  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "coordinate");
    v14 = v13;
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("(%.6f, %.6f)"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

    if (objc_msgSend(v5, "state") == 1)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "routeMatch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "routeCoordinate");
      objc_msgSend(v5, "routeMatch");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("[%u, %0.2f]"), v19, COERCE_FLOAT((unint64_t)objc_msgSend(v20, "routeCoordinate") >> 32));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v21);

    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "course");
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%0.1f°"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v24);

    objc_msgSend(v5, "roadName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      objc_msgSend(v5, "roadName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v27);

    }
    if (objc_msgSend(v5, "state"))
    {
      if (objc_msgSend(v5, "speedLimit"))
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = objc_msgSend(v5, "speedLimit");
        v30 = objc_msgSend(v5, "speedLimitIsMPH");
        v31 = CFSTR("km/h");
        if (v30)
          v31 = CFSTR("mph");
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%d %@"), v29, v31);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = CFSTR("No speed limit");
      }
      objc_msgSend(v11, "addObject:", v32);

    }
    -[MNNavigationSessionLogger _stringForLocationType:](self, "_stringForLocationType:", objc_msgSend(v5, "state"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v33);

    GEOFindOrCreateLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" | "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v37 = v35;
      _os_log_impl(&dword_1B0AD7000, v34, OS_LOG_TYPE_INFO, "Location update: %{private}@", buf, 0xCu);

    }
  }
  -[MNNavigationSessionLogger _updateCameraStyleAttributesForLocation:](self, "_updateCameraStyleAttributesForLocation:", v5);

}

- (void)navigationSession:(id)a3 matchedToStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  -[MNNavigationSessionState currentRouteInfo](self->_navigationSessionState, "currentRouteInfo", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "steps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") <= a4)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v8, "steps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "maneuverAndInstructionDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E61D9090;
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  GEOFindOrCreateLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109634;
    v17[1] = a4;
    v18 = 2112;
    v19 = v15;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Changed step index: %d %@| segment index: %d", (uint8_t *)v17, 0x18u);
  }

}

- (void)navigationSession:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v5 = a5;
  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Entered pre-arrival state for leg: %d", (uint8_t *)v7, 8u);
  }

}

- (void)navigationSession:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v5 = a5;
  v8 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Arrived at end of leg: %d", (uint8_t *)v7, 8u);
  }

}

- (void)navigationSession:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  int v7;
  NSObject *v8;
  const __CFString *v9;
  _DWORD v10[2];
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v7 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a6 - 1 > 5)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E61D8028[a6 - 1];
    v10[0] = 67109378;
    v10[1] = v7;
    v11 = 2112;
    v12 = v9;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Resumed navigating from leg: %d reason: %@", (uint8_t *)v10, 0x12u);
  }

}

- (void)navigationSession:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v4 = a4;
  v7 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Updated target leg index: %d", (uint8_t *)v6, 8u);
  }

}

- (void)navigationSessionDidEnterPreArrivalState:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Entered pre-arrival state", v4, 2u);
  }

}

- (void)navigationSessionDidArrive:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Arrived", v4, 2u);
  }

}

- (void)navigationSession:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *displayETALookup;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

  if (v13)
  {
    if (!self->_displayETALookup)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      displayETALookup = self->_displayETALookup;
      self->_displayETALookup = v14;

    }
    objc_msgSend(v9, "routeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_displayETALookup, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if ((objc_msgSend(v17, "isEqual:", v9) & 1) == 0)
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 138413058;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_INFO, "Updated display ETA %@ | %@ | %@ | %@", (uint8_t *)&v19, 0x2Au);
      }

      if (v16)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_displayETALookup, "setObject:forKeyedSubscript:", v9, v16);
    }

  }
}

- (void)navigationSession:(id)a3 didUpdateETAResponseForRoute:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a4;
  objc_msgSend(a3, "routeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentRouteInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "routeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v5)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "Received ETA update from server", v11, 2u);
    }

  }
}

- (void)navigationSessionWillReroute:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Will reroute", v4, 2u);
  }

}

- (void)navigationSession:(id)a3 didSuppressReroute:(id)a4
{
  id v6;
  id v7;
  NSError *v8;
  NSError **p_previousSuppressedRerouteError;
  NSError *previousSuppressedRerouteError;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
    p_previousSuppressedRerouteError = &self->_previousSuppressedRerouteError;
    v8 = previousSuppressedRerouteError;
    if (!previousSuppressedRerouteError || (v11 = -[NSError code](v8, "code"), v11 != objc_msgSend(v7, "code")))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v15, 0xCu);

      }
      objc_storeStrong((id *)p_previousSuppressedRerouteError, a4);
    }
  }

}

- (void)navigationSessionDidCancelReroute:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "Cancelled reroute", v4, 2u);
  }

}

- (void)navigationSession:(id)a3 didReroute:(id)a4 withLocation:(id)a5 withAlternateRoutes:(id)a6 rerouteReason:(unint64_t)a7
{
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  NSError *previousSuppressedRerouteError;
  NSMutableDictionary *displayETALookup;
  int v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    objc_msgSend(v9, "route");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a7 - 1 > 0xE)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E61D8090[a7 - 1];
      objc_msgSend(v12, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412803;
      v20 = v14;
      v21 = 2113;
      v22 = v15;
      v23 = 2112;
      v24 = v16;

    }
  }
  previousSuppressedRerouteError = self->_previousSuppressedRerouteError;
  self->_previousSuppressedRerouteError = 0;

  displayETALookup = self->_displayETALookup;
  self->_displayETALookup = 0;

}

- (void)navigationSession:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 rerouteReason:(unint64_t)a6
{
  uint64_t v7;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *displayETALookup;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v7 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  GEOFindOrCreateLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E61D8058[(int)v7];
    }
    -[__CFString capitalizedString](v11, "capitalizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6 - 1 > 0xE)
      v13 = CFSTR("Unknown");
    else
      v13 = off_1E61D8090[a6 - 1];
    objc_msgSend(v9, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2113;
    v23 = v15;
    v24 = 2112;
    v25 = v16;

  }
  displayETALookup = self->_displayETALookup;
  self->_displayETALookup = 0;

}

- (void)navigationSession:(id)a3 didFailRerouteWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "Reroute error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)navigationSession:(id)a3 didUpdateAlternateRoutes:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v21 = v4;
      obj = v4;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v12, "route");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "route");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uniqueRouteID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%@)"), v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "addObject:", v18);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v9);
      }

      v4 = v21;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "Updated alternate routes: %@", buf, 0xCu);
    }

  }
}

- (void)navigationSession:(id)a3 didUpdateDestination:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "humanDescriptionWithAddressAndLatLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Updated destination: %{private}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)navigationSession:(id)a3 didRerouteWithWaypoints:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_49);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" | "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138477827;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Modified waypoints: %{private}@", (uint8_t *)&v8, 0xCu);

  }
}

uint64_t __71__MNNavigationSessionLogger_navigationSession_didRerouteWithWaypoints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bestDisplayName:", 0);
}

- (void)navigationSession:(id)a3 didInsertWaypoint:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "humanDescriptionWithAddressAndLatLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Inserted waypoint: %{private}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)navigationSession:(id)a3 didRemoveWaypoint:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "humanDescriptionWithAddressAndLatLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Removed waypoint: %{private}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)navigationSession:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSUUID *lastGuidanceSignID;
  void *v9;
  void *v10;
  void *v11;
  NSUUID *v12;
  NSUUID *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    lastGuidanceSignID = self->_lastGuidanceSignID;
    objc_msgSend(v5, "primarySign");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(lastGuidanceSignID) = -[NSUUID isEqual:](lastGuidanceSignID, "isEqual:", v10);

    if ((lastGuidanceSignID & 1) == 0)
    {
      objc_msgSend(v5, "primarySign");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueID");
      v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v13 = self->_lastGuidanceSignID;
      self->_lastGuidanceSignID = v12;

      GEOFindOrCreateLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Updated sign: %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }

}

- (void)navigationSession:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSArray **p_lastARInfos;
  NSArray *lastARInfos;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    lastARInfos = self->_lastARInfos;
    p_lastARInfos = &self->_lastARInfos;
    if (!+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", lastARInfos, v6))
    {
      objc_storeStrong((id *)p_lastARInfos, a4);
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\t"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "Updated AR events:\n\t%@", (uint8_t *)&v13, 0xCu);

      }
    }
  }

}

- (void)navigationSession:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Received Dodgeball alert: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)navigationSession:(id)a3 didSendNavigationServiceCallback:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if (objc_msgSend(v4, "type") == 2)
  {
    v5 = v4;
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "reason");
      if ((unint64_t)(v7 - 1) > 9)
        v8 = CFSTR("Unknown");
      else
        v8 = off_1E61D8108[v7 - 1];
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "Navigation session stopped with reason: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (id)_stringForLocationType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E61D8158[a3];
}

- (void)_updateCameraStyleAttributesForLocation:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  const __CFString *v32;
  BOOL v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  uint64_t v46;
  const __CFString *v47;
  BOOL v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id *location;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  const __CFString *v73;
  __int16 v74;
  int v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    objc_msgSend(v4, "routeMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v4;
    objc_msgSend(v4, "routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routeCoordinate");

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v8, "cameraInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v69 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v16, "routeCoordinateRange");
          if (GEOPolylineCoordinateInRange())
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v13);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v8, "mutableData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateableCameraInfos");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v65 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          objc_msgSend(v23, "routeCoordinateRange");
          if (GEOPolylineCoordinateInRange())
            objc_msgSend(v10, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      }
      while (v20);
    }
    v51 = v8;

    location = (id *)&self->_activeCameraInfos;
    v24 = (void *)-[NSHashTable copy](self->_activeCameraInfos, "copy");
    v53 = v10;
    objc_msgSend(v24, "minusHashTable:", v10);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v24;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v61 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          GEOFindOrCreateLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = objc_msgSend(v29, "type", v51);
            if (v31 > 0x20000)
            {
              if (v31 == 131073)
              {
                v32 = CFSTR("Exit Number");
              }
              else
              {
                v33 = v31 == 131074;
                v32 = CFSTR("Significant Road Name");
LABEL_32:
                if (!v33)
                  v32 = CFSTR("None");
              }
            }
            else
            {
              v32 = CFSTR("None");
              switch(v31)
              {
                case 65630:
                  v32 = CFSTR("Traffic State");
                  break;
                case 65631:
                case 65632:
                case 65633:
                case 65634:
                case 65635:
                case 65637:
                case 65643:
                case 65644:
                case 65645:
                case 65646:
                  break;
                case 65636:
                  v32 = CFSTR("Windshield Mode");
                  break;
                case 65638:
                  v32 = CFSTR("Bridge");
                  break;
                case 65639:
                  v32 = CFSTR("Tunnel");
                  break;
                case 65640:
                  v32 = CFSTR("Urban Canyon");
                  break;
                case 65641:
                  v32 = CFSTR("Complex Overpass");
                  break;
                case 65642:
                  v32 = CFSTR("Complex Intersection");
                  break;
                case 65647:
                  v32 = CFSTR("Covered");
                  break;
                default:
                  v33 = v31 == 191;
                  v32 = CFSTR("Travel Direction Arrow");
                  goto LABEL_32;
              }
            }
            *(_DWORD *)buf = 138412290;
            v73 = v32;
            _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_DEFAULT, "Removing camera style attribute: { %@ }", buf, 0xCu);
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
      }
      while (v26);
    }

    v34 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v34, "minusHashTable:", *location);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v35 = v34;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v57 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * m);
          objc_msgSend(v40, "styleAttributes", v51);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "attributes");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "value");

          GEOFindOrCreateLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = objc_msgSend(v40, "type");
            if (v46 > 0x20000)
            {
              v47 = CFSTR("None");
              if (v46 == 131074)
                v47 = CFSTR("Significant Road Name");
              v48 = v46 == 131073;
              v49 = CFSTR("Exit Number");
LABEL_59:
              if (v48)
                v47 = v49;
            }
            else
            {
              v47 = CFSTR("None");
              switch(v46)
              {
                case 65630:
                  v47 = CFSTR("Traffic State");
                  break;
                case 65631:
                case 65632:
                case 65633:
                case 65634:
                case 65635:
                case 65637:
                case 65643:
                case 65644:
                case 65645:
                case 65646:
                  break;
                case 65636:
                  v47 = CFSTR("Windshield Mode");
                  break;
                case 65638:
                  v47 = CFSTR("Bridge");
                  break;
                case 65639:
                  v47 = CFSTR("Tunnel");
                  break;
                case 65640:
                  v47 = CFSTR("Urban Canyon");
                  break;
                case 65641:
                  v47 = CFSTR("Complex Overpass");
                  break;
                case 65642:
                  v47 = CFSTR("Complex Intersection");
                  break;
                case 65647:
                  v47 = CFSTR("Covered");
                  break;
                default:
                  v48 = v46 == 191;
                  v47 = CFSTR("None");
                  v49 = CFSTR("Travel Direction Arrow");
                  goto LABEL_59;
              }
            }
            *(_DWORD *)buf = 138412546;
            v73 = v47;
            v74 = 1024;
            v75 = v44;
            _os_log_impl(&dword_1B0AD7000, v45, OS_LOG_TYPE_DEFAULT, "Activating camera style attribute: { %@: %u }", buf, 0x12u);
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
      }
      while (v37);
    }

    if (objc_msgSend(v53, "count"))
      v50 = v53;
    else
      v50 = 0;
    objc_storeStrong(location, v50);

    v4 = v52;
  }

}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_storeStrong((id *)&self->_activeCameraInfos, 0);
  objc_storeStrong((id *)&self->_displayETALookup, 0);
  objc_storeStrong((id *)&self->_previousSuppressedRerouteError, 0);
  objc_storeStrong((id *)&self->_lastARInfos, 0);
  objc_storeStrong((id *)&self->_lastGuidanceSignID, 0);
}

@end
