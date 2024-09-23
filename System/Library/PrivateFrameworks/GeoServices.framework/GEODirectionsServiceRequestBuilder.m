@implementation GEODirectionsServiceRequestBuilder

- (GEODirectionsServiceRequestBuilder)initWithType:(unint64_t)a3
{
  GEODirectionsServiceRequestBuilder *v4;
  GEODirectionsServiceRequestBuilder *v5;
  GEODirectionsServiceRequestBuilder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsServiceRequestBuilder;
  v4 = -[GEODirectionsServiceRequestBuilder init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)builderForRequestType:(unint64_t)a3
{
  objc_class *v4;
  void *v5;
  NSObject *v7;
  const char *v8;
  uint8_t *i;
  __int16 v10;
  __int16 v11;

  if (a3 - 1 > 0xF)
    goto LABEL_9;
  v4 = (objc_class *)objc_opt_class();
  if (!v4)
    goto LABEL_9;
  v5 = (void *)objc_msgSend([v4 alloc], "initWithType:", a3);
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v10 = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "Assertion failed: builder != nil";
    for (i = (uint8_t *)&v10; ; i = (uint8_t *)&v11)
    {
      _os_log_fault_impl(&dword_1885A9000, v7, OS_LOG_TYPE_FAULT, v8, i, 2u);
      do
      {
LABEL_8:
        __break(1u);
LABEL_9:
        ;
      }
      while (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT));
      v11 = 0;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Assertion failed: class != nil";
    }
  }
  return v5;
}

- (id)buildDirectionsRequestWithParameters:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GEODirectionsRequestFeedback *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  GEODirectionsRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v26[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_parameters, a3);
  -[GEODirectionsServiceRequestBuilder waypointsForRoute](self, "waypointsForRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_waypoints, v6);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "feedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = -[GEODirectionsRequestFeedback initWithPurpose:]([GEODirectionsRequestFeedback alloc], "initWithPurpose:", -[GEODirectionsServiceRequestBuilder directionsRequestFeedbackPurpose](self, "directionsRequestFeedbackPurpose"));
    v11 = v9;

    objc_msgSend(v5, "requestingAppIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "setRequestingAppId:", v13);
    }
    else
    {
      objc_msgSend(v11, "requestingAppId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRequestingAppId:", v14);

    }
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mapsUserSessionEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "sessionID");
    v19 = v18;

    v20 = -[GEODirectionsRequest initWithFeedback:sessionID:]([GEODirectionsRequest alloc], "initWithFeedback:sessionID:", v11, v17, v19);
    objc_msgSend(v5, "commonOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setCommonOptions:](v20, "setCommonOptions:", v21);

    -[GEODirectionsRequest setMainTransportTypeMaxRouteCount:](v20, "setMainTransportTypeMaxRouteCount:", objc_msgSend(v5, "maxRouteCount"));
    objc_msgSend(v5, "currentLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setCurrentUserLocation:](v20, "setCurrentUserLocation:", v22);

    objc_msgSend(v5, "visibleRegion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setCurrentMapRegion:](v20, "setCurrentMapRegion:", v23);

    objc_msgSend(v5, "recentLocationHistory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setRecentLocationHistory:](v20, "setRecentLocationHistory:", v24);

    -[GEODirectionsServiceRequestBuilder _populateRouteAttributesInDirectionsRequest:](self, "_populateRouteAttributesInDirectionsRequest:", v20);
    -[GEODirectionsServiceRequestBuilder _populateWaypointTypedInDirectionsRequest:](self, "_populateWaypointTypedInDirectionsRequest:", v20);
    -[GEODirectionsServiceRequestBuilder _populateOriginalWaypointRouteInDirectionsRequest:](self, "_populateOriginalWaypointRouteInDirectionsRequest:", v20);
    -[GEODirectionsServiceRequestBuilder _populateMiscFieldsInDirectionsRequest:](self, "_populateMiscFieldsInDirectionsRequest:", v20);
    -[GEODirectionsServiceRequestBuilder verifyWaypointsForDirectionsRequest:](self, "verifyWaypointsForDirectionsRequest:", v20);
    -[GEODirectionsServiceRequestBuilder _logBuiltDirectionsRequest:](self, "_logBuiltDirectionsRequest:", v20);
    +[GEODirectionsServiceRequestBuilderResult resultWithWaypoints:directionsRequest:](GEODirectionsServiceRequestBuilderResult, "resultWithWaypoints:directionsRequest:", v6, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetDirectionsServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Error: Invalid waypoints on GEODirectionsServiceRequestParameters.", v26, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Invalid waypoints on GEODirectionsServiceRequestParameters."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEODirectionsServiceRequestBuilderResult resultWithError:](GEODirectionsServiceRequestBuilderResult, "resultWithError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_populateRouteAttributesInDirectionsRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v4 = a3;
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (!-[GEODirectionsServiceRequestBuilder shouldAllowTimepoint](self, "shouldAllowTimepoint"))
  {
    memset(v9, 0, sizeof(v9));
    objc_msgSend(v7, "setTimepoint:", v9);
    objc_msgSend(v7, "setHasTimepoint:", 0);
  }
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMainTransportType:", objc_msgSend(v8, "transportType"));

  objc_msgSend(v4, "setRouteAttributes:", v7);
}

- (void)_populateWaypointTypedInDirectionsRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GEODirectionsServiceRequestBuilder typedWaypointsForDirectionsRequest](self, "typedWaypointsForDirectionsRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "setWaypointTypeds:", v5);

}

- (void)_populateOriginalWaypointRouteInDirectionsRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsServiceRequestBuilder geoOriginalWaypointRoute](self, "geoOriginalWaypointRoute");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalWaypointRoute:", v5);

}

- (void)_populateMiscFieldsInDirectionsRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasVisitedFirstStop:", objc_msgSend(v5, "hasVisitedFirstStop"));

  objc_msgSend(v4, "setTripInfo:", v6);
  -[GEODirectionsServiceRequestBuilder setMiscFieldsInDirectionsRequest:](self, "setMiscFieldsInDirectionsRequest:", v4);

}

- (id)_geoWaypointTypedForWaypoint:(id)a3 voiceLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  GEOWaypointNameProperties *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "geoWaypointTyped");
    a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapItemStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(GEOWaypointNameProperties);
      objc_msgSend(v7, "contactName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
        goto LABEL_7;
      if (objc_msgSend(v7, "_hasTransit"))
      {
        objc_msgSend(v7, "_transitInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
          goto LABEL_7;
      }
      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
LABEL_7:
        -[GEOWaypointNameProperties setHasDisplayName:](v8, "setHasDisplayName:", 1);
      objc_msgSend(v7, "addressObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
        -[GEOWaypointNameProperties setHasDisplayAddress:](v8, "setHasDisplayAddress:", 1);
      if (objc_msgSend(v5, "length"))
      {
        objc_msgSend(v7, "contactSpokenName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
          goto LABEL_13;
        objc_msgSend(v7, "spokenNameForLocale:", v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22
          || +[GEODirectionsService canSpeakWrittenPlaceNames](GEODirectionsService, "canSpeakWrittenPlaceNames")&& (objc_msgSend(v7, "name"), v29 = (void *)objc_claimAutoreleasedReturnValue(), v30 = objc_msgSend(v29, "length"), v29, v30))
        {
LABEL_13:
          -[GEOWaypointNameProperties setHasSpokenName:](v8, "setHasSpokenName:", 1);
        }
        objc_msgSend(v7, "_spokenAddressForLocale:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24
          || +[GEODirectionsService canSpeakWrittenAddresses](GEODirectionsService, "canSpeakWrittenAddresses")&& (objc_msgSend(v7, "addressObject"), v25 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v25, "shortAddress"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v27 = objc_msgSend(v26, "length"), v26, v25, v27))
        {
          -[GEOWaypointNameProperties setHasSpokenAddress:](v8, "setHasSpokenAddress:", 1);
        }
      }
      objc_msgSend(a3, "setWaypointNameProperties:", v8);

    }
  }

  return a3;
}

- (void)_logBuiltDirectionsRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "waypointTypeds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "waypointTypeds", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "loggingDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  GEOGetDirectionsServiceLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "waypointTypeds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\t"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEFAULT, "Built directions request with %d waypoints:\n\t%@", buf, 0x12u);

  }
}

- (id)waypointsForRoute
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v3 = 138412290;
    v4 = objc_opt_class();
  }
  return 0;
}

- (id)typedWaypointsForDirectionsRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEODirectionsServiceRequestBuilder _waypoints](self, "_waypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__GEODirectionsServiceRequestBuilder_typedWaypointsForDirectionsRequest__block_invoke;
  v10[3] = &unk_1E1C11CE0;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "_geo_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __72__GEODirectionsServiceRequestBuilder_typedWaypointsForDirectionsRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isServerProvidedWaypoint"))
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Not adding server waypoint \"%@\" to directions request.", (uint8_t *)&v10, 0xCu);

    }
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "_geoWaypointTypedForWaypoint:voiceLanguage:", v3, *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Error getting waypointTyped from GEOComposedWaypoint. Ignoring waypoint: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_13;
  }
  v7 = (void *)v6;
  if (objc_msgSend(*(id *)(a1 + 32), "_type") == 7 && (objc_msgSend(v7, "hasWaypointStatus") & 1) == 0)
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(v10) = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_type") != 7 && objc_msgSend(v7, "hasWaypointStatus"))
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_15;
    }
    LOWORD(v10) = 0;
LABEL_18:
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 2u);
    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

- (int)directionsRequestFeedbackPurpose
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v3 = 138412290;
    v4 = objc_opt_class();
  }
  return 0;
}

- (BOOL)shouldAllowTimepoint
{
  return 0;
}

- (int)originalWaypointRoutePurpose
{
  return 0;
}

- (BOOL)shouldUseFullLegForOriginalWaypointRoute
{
  return 1;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t v32[16];

  v3 = -[GEODirectionsServiceRequestBuilder originalWaypointRoutePurpose](self, "originalWaypointRoutePurpose");
  if (!(_DWORD)v3)
    return 0;
  v4 = v3;
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v30 = 0;
    goto LABEL_24;
  }
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "routeCoordinate");

  LODWORD(v9) = HIDWORD(v8);
  if (*((float *)&v8 + 1) < 0.0)
  {
    GEOGetDirectionsServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
    }

    v8 = 0;
  }
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "startingLegIndex");

  v13 = -[GEODirectionsServiceRequestBuilder shouldUseFullLegForOriginalWaypointRoute](self, "shouldUseFullLegForOriginalWaypointRoute");
  objc_msgSend(v6, "legs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v13)
  {
    if (v12 >= v15)
      goto LABEL_18;
    objc_msgSend(v6, "legs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v16, "startRouteCoordinate");
    v18 = v20;
    if ((_DWORD)v20 == (_DWORD)v8)
    {
      LODWORD(v21) = HIDWORD(v20);
      if (*((float *)&v20 + 1) == *((float *)&v8 + 1) || *((float *)&v20 + 1) >= *((float *)&v8 + 1))
        goto LABEL_21;
    }
    else if (v20 >= v8)
    {
LABEL_21:
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pathSegment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v18;
      goto LABEL_22;
    }
    v18 = v8;
    goto LABEL_21;
  }
  if (v12 < v15)
  {
    objc_msgSend(v6, "legs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "startRouteCoordinate");

LABEL_17:
    v26 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v22 = objc_msgSend(v6, "legIndexForRouteCoordinate:", v8);
  objc_msgSend(v6, "legs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v22 < v24)
  {
    objc_msgSend(v6, "legs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v16, "startRouteCoordinate");
    goto LABEL_17;
  }
LABEL_18:
  v26 = 0;
  v18 = v8;
LABEL_23:
  -[GEODirectionsServiceRequestBuilder _waypoints](self, "_waypoints");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:userPosition:origin:startPathSegment:", v18, v4, v8, v29, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v30;
}

- (unint64_t)_type
{
  return self->_type;
}

- (id)_parameters
{
  return self->_parameters;
}

- (id)_waypoints
{
  return self->_waypoints;
}

- (id)_waypointsFromRequestParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  GEOComposedWaypoint *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waypoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
    GEOGetDirectionsServiceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;

    }
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      GEOGetDirectionsServiceLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
      }

    }
    v8 = [GEOComposedWaypoint alloc];
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](v8, "initWithLocation:isCurrentLocation:", v10, 1);

    objc_msgSend(v4, "firstObject", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
LABEL_10:

  }
  return v4;
}

- (id)_waypointsFromCurrentLocationAndRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  GEOComposedWaypoint *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !v6)
  {
    GEOGetDirectionsServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v8;

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v4, 1);
    objc_msgSend(v9, "addObject:", v10);
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "startingLegIndex");

    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "waypointsFromRouteCoordinate:", objc_msgSend(v13, "routeCoordinate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v15);

    }
    else
    {
      v17 = objc_msgSend(v13, "startingLegIndex");

      while (1)
      {
        objc_msgSend(v6, "legs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v17 >= v19)
          break;
        objc_msgSend(v6, "legs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "destination");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v22);

        ++v17;
      }
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __83___GEODirectionsServiceRequestBuilder_EditRoute_typedWaypointsForDirectionsRequest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "geoWaypointTyped");
}

@end
