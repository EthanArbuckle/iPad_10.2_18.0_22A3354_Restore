@implementation _GEODirectionsServiceRequestBuilder_RouteFromRoute

- (id)waypointsForRoute
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "waypoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOGetDirectionsServiceLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;

    }
    v5 = 0;
  }

  return v5;
}

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 2;
}

@end
