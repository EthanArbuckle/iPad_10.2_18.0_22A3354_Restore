@implementation GEORouteBuilder_UserCreated

- (int)_transportType
{
  void *v2;
  int v3;

  -[GEODirectionsRequest routeAttributes](self->_directionsRequest, "routeAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mainTransportType");

  return v3;
}

- (id)_newRouteInstance
{
  GEORouteInitializerData *v3;
  NSArray *waypoints;
  void *v5;
  GEORouteInitializerData *v6;
  void *v7;
  void *v8;
  GEOComposedGeometryRoute *v9;

  v3 = [GEORouteInitializerData alloc];
  waypoints = self->_waypoints;
  -[GEODirectionsRequest routeAttributes](self->_directionsRequest, "routeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:](v3, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", waypoints, v5, self->_directionsResponse, self->_directionsRequest);

  -[GEODirectionsResponse waypointRoutes](self->_directionsResponse, "waypointRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:]([GEOComposedGeometryRoute alloc], "initWithGeoWaypointRoute:initializerData:", v8, v6);
  return v9;
}

- (BOOL)_setMiscInfo
{
  void *v3;
  id *v4;
  int v5;

  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)-[GEOComposedRouteAnchorPointList copy](self->_anchorPoints, "copy");
  v5 = -[GEOComposedRouteAnchorPointList updateWithRoute:](v4, v3);
  if (v5)
  {
    objc_msgSend(v3, "setAnchorPoints:", v4);
    objc_msgSend(v3, "setSource:", 3);
  }

  return v5;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
}

@end
