@implementation _GEODirectionsServiceRequestBuilder_ConvertToNavigableRoute

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 12;
}

- (id)geoOriginalWaypointRoute
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[_GEODirectionsServiceRequestBuilder_ConvertToNavigableRoute originalWaypointRoutePurpose](self, "originalWaypointRoutePurpose");
    -[GEODirectionsServiceRequestBuilder _waypoints](self, "_waypoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:userPosition:origin:startPathSegment:", 0, v5, 0, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetDirectionsServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;

    }
    v8 = 0;
  }

  return v8;
}

@end
