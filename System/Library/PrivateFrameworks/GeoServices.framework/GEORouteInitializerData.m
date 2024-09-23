@implementation GEORouteInitializerData

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEORouteInitializerData *v12;
  GEORouteInitializerData *v13;
  uint64_t v14;
  GEOStyleAttributes *styleAttributes;
  GEORouteInitializerData *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEORouteInitializerData;
  v12 = -[GEORouteInitializerData init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_waypoints, a3);
    objc_storeStrong((id *)&v13->_routeAttributes, a4);
    objc_storeStrong((id *)&v13->_directionsResponse, a5);
    objc_msgSend(v11, "styleAttributes");
    v14 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v13->_styleAttributes;
    v13->_styleAttributes = (GEOStyleAttributes *)v14;

    v16 = v13;
  }

  return v13;
}

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 etauResponse:(id)a5 styleAttributes:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GEORouteInitializerData *v15;
  GEORouteInitializerData *v16;
  GEORouteInitializerData *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEORouteInitializerData;
  v15 = -[GEORouteInitializerData init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_waypoints, a3);
    objc_storeStrong((id *)&v16->_routeAttributes, a4);
    objc_storeStrong((id *)&v16->_etaTrafficUpdateResponse, a5);
    objc_storeStrong((id *)&v16->_styleAttributes, a6);
    v17 = v16;
  }

  return v16;
}

- (GEORouteInitializerData)initWithWaypoints:(id)a3 routeAttributes:(id)a4 directionsResponse:(id)a5 directionsRequest:(id)a6
{
  id v11;
  GEORouteInitializerData *v12;
  GEORouteInitializerData *v13;

  v11 = a6;
  v12 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:](self, "initWithWaypoints:routeAttributes:directionsResponse:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_directionsRequest, a6);

  return v13;
}

- (id)allRoutes
{
  return -[GEORouteInitializerData _allRoutesWithTypes:](self, "_allRoutesWithTypes:", 3);
}

- (id)mainRoute
{
  void *v2;
  void *v3;

  -[GEORouteInitializerData _allRoutesWithTypes:](self, "_allRoutesWithTypes:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allETAUAlternateRoutes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[GEOETATrafficUpdateResponse waypointRoute](self->_etaTrafficUpdateResponse, "waypointRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = (void *)objc_msgSend(v3, "newWaypointRoutes"), v6 = objc_msgSend(v5, "count"), v5, v6))
  {
    v7 = (void *)objc_msgSend(v4, "newWaypointRoutes");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__GEORouteInitializerData_allETAUAlternateRoutes__block_invoke;
    v10[3] = &unk_1E1C21E48;
    v10[4] = self;
    objc_msgSend(v7, "_geo_compactMap:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

GEOComposedRoute *__49__GEORouteInitializerData_allETAUAlternateRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOComposedRoute *v4;

  v3 = a2;
  v4 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:]([GEOComposedRoute alloc], "initWithGeoWaypointRoute:initializerData:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)nonRecommendedRoutes
{
  return -[GEORouteInitializerData _allRoutesWithTypes:](self, "_allRoutesWithTypes:", 48);
}

- (id)_allRoutesWithTypes:(int)a3
{
  GEODirectionsResponse *directionsResponse;
  void *v6;
  uint64_t v7;
  GEODirectionsResponse *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GEOComposedRoute *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  uint8_t buf[16];
  _QWORD v25[5];
  int v26;

  directionsResponse = self->_directionsResponse;
  if (!directionsResponse)
    return 0;
  -[GEODirectionsResponse suggestedRoutes](directionsResponse, "suggestedRoutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = self->_directionsResponse;
  if (v7)
  {
    -[GEODirectionsResponse suggestedRoutes](v8, "suggestedRoutes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = 0;
    goto LABEL_8;
  }
  -[GEODirectionsResponse waypointRoutes](v8, "waypointRoutes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v12, "count");

  if (!v9)
    goto LABEL_4;
  -[GEODirectionsResponse waypointRoutes](self->_directionsResponse, "waypointRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
LABEL_8:
  if (objc_msgSend(v10, "count") || objc_msgSend(v9, "count"))
  {
    if (v10)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__GEORouteInitializerData__allRoutesWithTypes___block_invoke;
      v25[3] = &unk_1E1C21E70;
      v26 = a3;
      v25[4] = self;
      objc_msgSend(v10, "_geo_compactMap:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      if (objc_msgSend(v9, "count"))
      {
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", *(_QWORD *)buf);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEORouteInitializerData directionsRequest](self, "directionsRequest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEORouteInitializerData directionsResponse](self, "directionsResponse");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOTransitRouteUpdateRequest transitRouteUpdateRequestWithDirectionsRequest:directionsResponse:](GEOTransitRouteUpdateRequest, "transitRouteUpdateRequestWithDirectionsRequest:directionsResponse:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = -[GEOComposedRoute initWithSuggestedRoute:initializerData:updateRequest:]([GEOComposedRoute alloc], "initWithSuggestedRoute:initializerData:updateRequest:", v14, self, v17);
          if (v18)
          {
            -[GEODirectionsResponse transitRouteUpdateConfiguration](self->_directionsResponse, "transitRouteUpdateConfiguration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOComposedRoute setTransitUpdateInitialDelay:](v18, "setTransitUpdateInitialDelay:", (double)(unint64_t)objc_msgSend(v19, "ttlSeconds"));

            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOComposedRoute setServerRouteID:](v18, "setServerRouteID:", v20);

            objc_msgSend(v13, "addObject:", v18);
          }

          v21 = ++*(_QWORD *)buf;
        }
        while (v21 < objc_msgSend(v9, "count"));
      }
      v10 = 0;
    }
  }
  else
  {
    -[GEODirectionsResponse routes](self->_directionsResponse, "routes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v22, "count");

    if (v13)
    {
      if (qword_1ECDBCD48 != -1)
        dispatch_once(&qword_1ECDBCD48, &__block_literal_global_215);
      v23 = _MergedGlobals_347;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_347, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Attempting to load route from a directions response using deprecated Routing protocol. This is no longer supported.", buf, 2u);
      }
      v13 = 0;
    }
  }

  return v13;
}

GEOComposedRoute *__47__GEORouteInitializerData__allRoutesWithTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOComposedRoute *v4;

  v3 = a2;
  if (((*(_DWORD *)(a1 + 40) >> objc_msgSend(v3, "type")) & 1) != 0)
    v4 = -[GEOComposedRoute initWithGeoWaypointRoute:initializerData:]([GEOComposedRoute alloc], "initWithGeoWaypointRoute:initializerData:", v3, *(_QWORD *)(a1 + 32));
  else
    v4 = 0;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteInitializerData)initWithCoder:(id)a3
{
  id v4;
  GEORouteInitializerData *v5;
  uint64_t v6;
  NSArray *waypoints;
  uint64_t v8;
  GEODirectionsRequest *directionsRequest;
  uint64_t v10;
  GEODirectionsResponse *directionsResponse;
  uint64_t v12;
  GEOETATrafficUpdateResponse *etaTrafficUpdateResponse;
  uint64_t v14;
  GEORouteAttributes *routeAttributes;
  uint64_t v16;
  GEOStyleAttributes *styleAttributes;
  uint64_t v18;
  GEOComposedRouteAnchorPointList *anchorPoints;
  uint64_t v20;
  GEOAddressObject *address;
  GEORouteInitializerData *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEORouteInitializerData;
  v5 = -[GEORouteInitializerData init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_waypoints"));
    v6 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsRequest"));
    v8 = objc_claimAutoreleasedReturnValue();
    directionsRequest = v5->_directionsRequest;
    v5->_directionsRequest = (GEODirectionsRequest *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsResponse"));
    v10 = objc_claimAutoreleasedReturnValue();
    directionsResponse = v5->_directionsResponse;
    v5->_directionsResponse = (GEODirectionsResponse *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etaTrafficUpdateResponse"));
    v12 = objc_claimAutoreleasedReturnValue();
    etaTrafficUpdateResponse = v5->_etaTrafficUpdateResponse;
    v5->_etaTrafficUpdateResponse = (GEOETATrafficUpdateResponse *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeAttributes"));
    v14 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_styleAttributes"));
    v16 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPoints"));
    v18 = objc_claimAutoreleasedReturnValue();
    anchorPoints = v5->_anchorPoints;
    v5->_anchorPoints = (GEOComposedRouteAnchorPointList *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address"));
    v20 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (GEOAddressObject *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *waypoints;
  id v5;

  waypoints = self->_waypoints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", waypoints, CFSTR("_waypoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsRequest, CFSTR("_directionsRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsResponse, CFSTR("_directionsResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etaTrafficUpdateResponse, CFSTR("_etaTrafficUpdateResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeAttributes, CFSTR("_routeAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("_styleAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchorPoints, CFSTR("_anchorPoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("_address"));

}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (GEOETATrafficUpdateResponse)etaTrafficUpdateResponse
{
  return self->_etaTrafficUpdateResponse;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponse, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
