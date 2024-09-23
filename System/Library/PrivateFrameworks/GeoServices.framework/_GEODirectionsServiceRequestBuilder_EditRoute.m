@implementation _GEODirectionsServiceRequestBuilder_EditRoute

- (id)waypointsForRoute
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[8];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "copy");

    objc_msgSend(v3, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v11[0] = v4;
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
    }
    v5 = 0;
  }

  return v5;
}

- (id)typedWaypointsForDirectionsRequest
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v3, "anchorPoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_geo_map:", &__block_literal_global_143);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetDirectionsServiceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
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
  return 11;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOOriginalWaypointRoute *v8;

  v3 = -[_GEODirectionsServiceRequestBuilder_EditRoute originalWaypointRoutePurpose](self, "originalWaypointRoutePurpose");
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEODirectionsServiceRequestBuilder _waypoints](self, "_waypoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:userPosition:origin:startPathSegment:", 0, v3, 0, v7, 0);
    v8 = (GEOOriginalWaypointRoute *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(GEOOriginalWaypointRoute);
    -[GEOOriginalWaypointRoute setPurpose:](v8, "setPurpose:", v3);
  }

  return v8;
}

@end
