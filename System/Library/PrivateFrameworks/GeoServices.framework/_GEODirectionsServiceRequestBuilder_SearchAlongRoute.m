@implementation _GEODirectionsServiceRequestBuilder_SearchAlongRoute

- (id)waypointsForRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  GEOComposedWaypoint *v15;
  void *v16;
  void *v17;
  GEOComposedWaypoint *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRoute");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "waypoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
        goto LABEL_10;
      goto LABEL_7;
    }

  }
LABEL_7:
  GEOGetDirectionsServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v13;

  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [GEOComposedWaypoint alloc];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](v15, "initWithLocation:isCurrentLocation:", v17, 1);

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "waypoints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v18);
  objc_msgSend(v14, "addObject:", v21);

  return v14;
}

- (int)directionsRequestFeedbackPurpose
{
  return 7;
}

- (int)originalWaypointRoutePurpose
{
  void *v2;
  int v3;

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "returnToOriginalDestination"))
    v3 = 4;
  else
    v3 = 3;

  return v3;
}

@end
