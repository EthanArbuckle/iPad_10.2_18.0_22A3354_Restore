@implementation MNStartNavigationDetails

- (MNStartNavigationDetails)init
{
  MNStartNavigationDetails *v2;
  MNStartNavigationDetails *v3;
  MNStartNavigationDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNStartNavigationDetails;
  v2 = -[MNStartNavigationDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_guidanceType = 0;
    v2->_simulationType = 0;
    v2->_guidanceLevelOverride = -1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)isReconnecting
{
  return -[MNStartNavigationReconnectionDetails isReconnecting](self->_reconnectionDetails, "isReconnecting");
}

- (void)setIsReconnecting:(BOOL)a3
{
  _BOOL8 v3;
  MNStartNavigationReconnectionDetails *v5;
  MNStartNavigationReconnectionDetails *reconnectionDetails;

  v3 = a3;
  if (a3 && !self->_reconnectionDetails)
  {
    v5 = objc_alloc_init(MNStartNavigationReconnectionDetails);
    reconnectionDetails = self->_reconnectionDetails;
    self->_reconnectionDetails = v5;

  }
  -[MNStartNavigationReconnectionDetails setIsReconnecting:](self->_reconnectionDetails, "setIsReconnecting:", v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MNStartNavigationDetails *v4;
  MNStartNavigationDetails *v5;
  uint64_t v6;
  MNLocation *initialUserLocation;
  uint64_t v8;
  GEOMapServiceTraits *traits;
  uint64_t v10;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  MNStartNavigationDetails *v12;

  v4 = -[MNStartNavigationDetails init](+[MNStartNavigationDetails allocWithZone:](MNStartNavigationDetails, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->_navigationType = self->_navigationType;
    v4->_guidanceType = self->_guidanceType;
    objc_storeStrong((id *)&v4->_tracePlaybackPath, self->_tracePlaybackPath);
    objc_storeStrong((id *)&v5->_traceRecordingData, self->_traceRecordingData);
    v5->_simulationType = self->_simulationType;
    objc_storeStrong((id *)&v5->_traceRecordingNameOverride, self->_traceRecordingNameOverride);
    objc_storeStrong((id *)&v5->_routeAttributes, self->_routeAttributes);
    objc_storeStrong((id *)&v5->_directionsRequest, self->_directionsRequest);
    objc_storeStrong((id *)&v5->_directionsResponse, self->_directionsResponse);
    objc_storeStrong((id *)&v5->_requestingAppIdentifier, self->_requestingAppIdentifier);
    objc_storeStrong((id *)&v5->_routes, self->_routes);
    v5->_selectedRouteIndex = self->_selectedRouteIndex;
    objc_storeStrong((id *)&v5->_traffic, self->_traffic);
    v6 = -[MNLocation copy](self->_initialUserLocation, "copy");
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v6;

    v5->_guidanceLevelOverride = self->_guidanceLevelOverride;
    v5->_isResumingMultipointRoute = self->_isResumingMultipointRoute;
    v8 = -[GEOMapServiceTraits copy](self->_traits, "copy");
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v8;

    v10 = -[MNStartNavigationReconnectionDetails copy](self->_reconnectionDetails, "copy");
    reconnectionDetails = v5->_reconnectionDetails;
    v5->_reconnectionDetails = (MNStartNavigationReconnectionDetails *)v10;

    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNStartNavigationDetails)initWithCoder:(id)a3
{
  id v4;
  MNStartNavigationDetails *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  GEORouteAttributes *routeAttributes;
  uint64_t v12;
  GEODirectionsRequest *directionsRequest;
  uint64_t v14;
  GEODirectionsResponse *directionsResponse;
  uint64_t v16;
  NSString *requestingAppIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *routes;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSDictionary *traffic;
  uint64_t v29;
  MNLocation *initialUserLocation;
  uint64_t v31;
  GEOMapServiceTraits *traits;
  uint64_t v33;
  NSString *tracePlaybackPath;
  uint64_t v35;
  MNTraceRecordingData *traceRecordingData;
  uint64_t v37;
  NSString *traceRecordingNameOverride;
  uint64_t v39;
  MNStartNavigationReconnectionDetails *reconnectionDetails;
  NSObject *v41;
  NSObject *v42;
  MNStartNavigationDetails *v43;
  uint8_t buf[16];
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MNStartNavigationDetails;
  v5 = -[MNStartNavigationDetails init](&v46, sel_init);
  if (v5)
  {
    MNGetMNNavigationDetailsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);
    v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartNavigationDetailsDecoding", ", buf, 2u);
    }

    v5->_navigationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_navigationType"));
    v5->_guidanceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_guidanceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsRequest"));
    v12 = objc_claimAutoreleasedReturnValue();
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsResponse"));
    v14 = objc_claimAutoreleasedReturnValue();
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestingAppIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    requestingAppIdentifier = v5->_requestingAppIdentifier;
    v5->_requestingAppIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_routes"));
    v21 = objc_claimAutoreleasedReturnValue();
    routes = v5->_routes;
    v5->_routes = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_traffic"));
    v27 = objc_claimAutoreleasedReturnValue();
    traffic = v5->_traffic;
    v5->_traffic = (NSDictionary *)v27;

    v5->_selectedRouteIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_selectedRouteIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialUserLocation"));
    v29 = objc_claimAutoreleasedReturnValue();
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v29;

    v5->_guidanceLevelOverride = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_guidanceLevelOverride"));
    v5->_isResumingMultipointRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isResumingMultipointRoute"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traits"));
    v31 = objc_claimAutoreleasedReturnValue();
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tracePlaybackPath"));
    v33 = objc_claimAutoreleasedReturnValue();
    tracePlaybackPath = v5->_tracePlaybackPath;
    v5->_tracePlaybackPath = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traceRecordingData"));
    v35 = objc_claimAutoreleasedReturnValue();
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v35;

    v5->_simulationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_simulationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traceRecordingNameOverride"));
    v37 = objc_claimAutoreleasedReturnValue();
    traceRecordingNameOverride = v5->_traceRecordingNameOverride;
    v5->_traceRecordingNameOverride = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_reconnectionDetails"));
    v39 = objc_claimAutoreleasedReturnValue();
    reconnectionDetails = v5->_reconnectionDetails;
    v5->_reconnectionDetails = (MNStartNavigationReconnectionDetails *)v39;

    v41 = v9;
    v42 = v41;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v42, OS_SIGNPOST_INTERVAL_END, v7, "StartNavigationDetailsDecoding", ", buf, 2u);
    }

    v43 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  MNGetMNNavigationDetailsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StartNavigationDetailsEncoding", ", buf, 2u);
  }

  objc_msgSend(v4, "encodeInteger:forKey:", self->_navigationType, CFSTR("_navigationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_guidanceType, CFSTR("_guidanceType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeAttributes, CFSTR("_routeAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_directionsRequest, CFSTR("_directionsRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_directionsResponse, CFSTR("_directionsResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestingAppIdentifier, CFSTR("_requestingAppIdentifier"));
  if (-[NSArray count](self->_routes, "count"))
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_routes, CFSTR("_routes"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_traffic, CFSTR("_traffic"));
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectedRouteIndex, CFSTR("_selectedRouteIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_initialUserLocation, CFSTR("_initialUserLocation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_guidanceLevelOverride, CFSTR("_guidanceLevelOverride"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isResumingMultipointRoute, CFSTR("_isResumingMultipointRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traits, CFSTR("_traits"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tracePlaybackPath, CFSTR("_tracePlaybackPath"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traceRecordingData, CFSTR("_traceRecordingData"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_simulationType, CFSTR("_simulationType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traceRecordingNameOverride, CFSTR("_traceRecordingNameOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reconnectionDetails, CFSTR("_reconnectionDetails"));
  v9 = v8;
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_END, v6, "StartNavigationDetailsEncoding", ", v11, 2u);
  }

}

- (id)description
{
  void *v3;
  unint64_t selectedRouteIndex;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  const __CFString *v25;
  void *v26;
  unint64_t guidanceType;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  MNLocation *initialUserLocation;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selectedRouteIndex = self->_selectedRouteIndex;
  if (selectedRouteIndex >= -[NSArray count](self->_routes, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_routes, "objectAtIndexedSubscript:", self->_selectedRouteIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51 = v5;
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v50 = v6;
  objc_msgSend(v6, "humanDescriptionWithAddressAndLatLng");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\tdestination: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = self->_routes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "name");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (__CFString *)v16;
        else
          v18 = CFSTR("(no name)");
        v19 = v18;

        objc_msgSend(v10, "addObject:", v19);
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v13);
  }

  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("\troutes: %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tselectedRouteIndex: %d"), self->_selectedRouteIndex);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = self->_navigationType - 1;
  if (v24 > 3)
    v25 = CFSTR("None");
  else
    v25 = off_1E61D2350[v24];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tnavigationType: %@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  guidanceType = self->_guidanceType;
  v28 = CFSTR("Full");
  if (guidanceType == 1)
    v28 = CFSTR("Low");
  if (guidanceType == 2)
    v29 = CFSTR("RoutePreview");
  else
    v29 = v28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tguidanceType: %@"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  initialUserLocation = self->_initialUserLocation;
  if (initialUserLocation)
  {
    v32 = (void *)MEMORY[0x1E0CB3940];
    -[MNLocation coordinate](initialUserLocation, "coordinate");
    v34 = v33;
    -[MNLocation coordinate](self->_initialUserLocation, "coordinate");
    objc_msgSend(v32, "stringWithFormat:", CFSTR("\tinitialUserLocation: %f, %f"), v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("\tinitialUserLocation: (none)"));
  }
  v37 = (void *)MEMORY[0x1E0CB3940];
  v38 = self->_guidanceLevelOverride + 1;
  if (v38 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), self->_guidanceLevelOverride);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_1E61D2370[v38];
  }
  objc_msgSend(v37, "stringWithFormat:", CFSTR("\tguidanceLevelOverride: %@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tisResumingMultipointRoute: %d"), self->_isResumingMultipointRoute);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ttracePlaybackPath: %@"), self->_tracePlaybackPath);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ttraceRecordingData: %p"), self->_traceRecordingData);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ttraceRecordingNameOverride: %@"), self->_traceRecordingNameOverride);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v44);

  v45 = self->_simulationType + 1;
  if (v45 > 5)
    v46 = CFSTR("None");
  else
    v46 = off_1E61D2390[v45];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tsimulationType: %@"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v47);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (void)setTracePlaybackPath:(id)a3
{
  objc_storeStrong((id *)&self->_tracePlaybackPath, a3);
}

- (void)setTraceRecordingData:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecordingData, a3);
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (void)setTraceRecordingNameOverride:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecordingNameOverride, a3);
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (unint64_t)guidanceType
{
  return self->_guidanceType;
}

- (void)setGuidanceType:(unint64_t)a3
{
  self->_guidanceType = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequest, a3);
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_routes, a3);
}

- (NSDictionary)traffic
{
  return self->_traffic;
}

- (void)setTraffic:(id)a3
{
  objc_storeStrong((id *)&self->_traffic, a3);
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  self->_selectedRouteIndex = a3;
}

- (MNLocation)initialUserLocation
{
  return self->_initialUserLocation;
}

- (void)setInitialUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialUserLocation, a3);
}

- (unint64_t)guidanceLevelOverride
{
  return self->_guidanceLevelOverride;
}

- (void)setGuidanceLevelOverride:(unint64_t)a3
{
  self->_guidanceLevelOverride = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (NSString)traceRecordingNameOverride
{
  return self->_traceRecordingNameOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reconnectionDetails, 0);
  objc_storeStrong((id *)&self->_initialUserLocation, 0);
  objc_storeStrong((id *)&self->_traffic, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_traceRecordingNameOverride, 0);
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
}

- (MNStartNavigationReconnectionDetails)reconnectionDetails
{
  return self->_reconnectionDetails;
}

- (void)setReconnectionDetails:(id)a3
{
  objc_storeStrong((id *)&self->_reconnectionDetails, a3);
}

@end
