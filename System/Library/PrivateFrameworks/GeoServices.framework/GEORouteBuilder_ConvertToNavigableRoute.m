@implementation GEORouteBuilder_ConvertToNavigableRoute

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
  GEOComposedRoute *v9;

  v3 = [GEORouteInitializerData alloc];
  waypoints = self->_waypoints;
  -[GEODirectionsRequest routeAttributes](self->_directionsRequest, "routeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:](v3, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", waypoints, v5, self->_directionsResponse, self->_directionsRequest);

  -[GEODirectionsResponse waypointRoutes](self->_directionsResponse, "waypointRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:]([GEOComposedRoute alloc], "initWithGeoWaypointRoute:initializerData:", v8, v6);
  return v9;
}

- (BOOL)_setMiscInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute uniqueRouteID](self->_sourceRoute, "uniqueRouteID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueRouteID:", v4);

  -[GEOComposedRoute address](self->_sourceRoute, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddress:", v5);

  -[GEOComposedRoute anchorPoints](self->_sourceRoute, "anchorPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPoints:", v6);

  objc_msgSend(v3, "setSource:", -[GEOComposedRoute source](self->_sourceRoute, "source"));
  -[GEOComposedRoute storageID](self->_sourceRoute, "storageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStorageID:", v7);

  -[GEOComposedRoute tourIdentifier](self->_sourceRoute, "tourIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTourIdentifier:", v8);

  objc_msgSend(v3, "setTourMuid:", -[GEOComposedRoute tourMuid](self->_sourceRoute, "tourMuid"));
  -[GEOComposedRoute userProvidedName](self->_sourceRoute, "userProvidedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserProvidedName:", v9);

  -[GEOComposedRoute userProvidedNotes](self->_sourceRoute, "userProvidedNotes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserProvidedNotes:", v10);

  -[GEOComposedRoute disclaimerText](self->_sourceRoute, "disclaimerText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerText:", v11);

  -[GEOComposedRoute disclaimerURL](self->_sourceRoute, "disclaimerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerURL:", v12);

  return 1;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (GEOComposedRoute)sourceRoute
{
  return self->_sourceRoute;
}

- (void)setSourceRoute:(id)a3
{
  objc_storeStrong((id *)&self->_sourceRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRoute, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
