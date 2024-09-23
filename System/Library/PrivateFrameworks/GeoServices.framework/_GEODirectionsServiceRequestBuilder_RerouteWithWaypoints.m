@implementation _GEODirectionsServiceRequestBuilder_RerouteWithWaypoints

- (id)waypointsForRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOComposedWaypoint *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
    v8 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:]([GEOComposedWaypoint alloc], "initWithLocation:isCurrentLocation:", v4, 1);
    objc_msgSend(v7, "addObject:", v8);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    GEOGetDirectionsServiceLog();
    v8 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
    {
      GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v14;

    }
    v7 = 0;
  }

  return v7;
}

- (int)directionsRequestFeedbackPurpose
{
  return 7;
}

- (int)originalWaypointRoutePurpose
{
  return 5;
}

@end
