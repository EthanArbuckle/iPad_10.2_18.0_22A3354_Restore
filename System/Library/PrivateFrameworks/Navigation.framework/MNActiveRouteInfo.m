@implementation MNActiveRouteInfo

- (MNActiveRouteInfo)initWithRoute:(id)a3
{
  id v5;
  MNActiveRouteInfo *v6;
  MNActiveRouteInfo *v7;
  MNActiveRouteInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNActiveRouteInfo;
  v6 = -[MNActiveRouteInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v7->_alternateRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    v8 = v7;
  }

  return v7;
}

- (MNActiveRouteInfo)initWithRoute:(id)a3 trafficRoute:(id)a4 routeInitalizerData:(id)a5
{
  MNActiveRouteInfo *v5;
  MNActiveRouteInfo *v6;
  MNActiveRouteInfo *v7;

  v5 = -[MNActiveRouteInfo initWithRoute:](self, "initWithRoute:", a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (NSUUID)routeID
{
  void *v2;
  void *v3;

  -[MNActiveRouteInfo route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueRouteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)setEtaRoute:(id)a3
{
  void *v5;
  GEOComposedETARoute *v6;

  v6 = (GEOComposedETARoute *)a3;
  if (self->_etaRoute != v6)
  {
    -[GEOComposedRoute mutableData](self->_route, "mutableData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateForRoute:etaRoute:", self->_route, v6);

    objc_storeStrong((id *)&self->_etaRoute, a3);
  }

}

- (GEOComposedRouteTraffic)traffic
{
  void *v2;
  void *v3;

  -[MNActiveRouteInfo route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traffic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRouteTraffic *)v3;
}

- (GEOTransitRouteUpdateRequest)transitRouteUpdateRequest
{
  void *v2;
  void *v3;

  -[MNActiveRouteInfo route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitRouteUpdateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitRouteUpdateRequest *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNActiveRouteInfo)initWithCoder:(id)a3
{
  id v4;
  MNActiveRouteInfo *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  GEOComposedETARoute *etaRoute;
  uint64_t v12;
  GEOETATrafficUpdateResponse *etaResponse;
  uint64_t v14;
  MNDisplayETAInfo *displayETAInfo;
  uint64_t v16;
  MNRouteDistanceInfo *remainingDistanceInfo;
  uint64_t v18;
  MNBatteryChargeInfo *batteryChargeInfo;
  void *v20;
  uint64_t v21;
  GEOComposedRoute *route;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  MNActiveRouteInfo *v27;
  uint8_t v29[16];
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MNActiveRouteInfo;
  v5 = -[MNActiveRouteInfo init](&v30, sel_init);
  if (v5)
  {
    MNGetMNRouteStorageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    MNGetMNRouteStorageLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ActiveRouteInfoDecoding", ", v29, 2u);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etaRoute"));
    v10 = objc_claimAutoreleasedReturnValue();
    etaRoute = v5->_etaRoute;
    v5->_etaRoute = (GEOComposedETARoute *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etaResponse"));
    v12 = objc_claimAutoreleasedReturnValue();
    etaResponse = v5->_etaResponse;
    v5->_etaResponse = (GEOETATrafficUpdateResponse *)v12;

    v5->_alternateRouteIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_alternateRouteIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayETAInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayETAInfo = v5->_displayETAInfo;
    v5->_displayETAInfo = (MNDisplayETAInfo *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_remainingDistanceInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    remainingDistanceInfo = v5->_remainingDistanceInfo;
    v5->_remainingDistanceInfo = (MNRouteDistanceInfo *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_batteryChargeInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    batteryChargeInfo = v5->_batteryChargeInfo;
    v5->_batteryChargeInfo = (MNBatteryChargeInfo *)v18;

    if (GEOConfigGetBOOL())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      MNGetRouteFromSubpathWithID(v20, 0, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      route = v5->_route;
      v5->_route = (GEOComposedRoute *)v21;

    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_route"));
      v23 = objc_claimAutoreleasedReturnValue();
      v20 = v5->_route;
      v5->_route = (GEOComposedRoute *)v23;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_route.mutableData"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute setMutableData:](v5->_route, "setMutableData:", v24);
    -[GEOComposedRoute setMutableData:](v5->_route, "setMutableData:", v24);

    MNGetMNRouteStorageLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v26, OS_SIGNPOST_INTERVAL_END, v7, "ActiveRouteInfoDecoding", ", v29, 2u);
    }

    v27 = v5;
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
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  MNGetMNRouteStorageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  MNGetMNRouteStorageLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ActiveRouteInfoEncoding", ", buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    -[MNActiveRouteInfo routeID](self, "routeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("routeID"));
    MNSaveRouteWithSubpath(self->_route, 0, 0, 0);

  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_route, CFSTR("_route"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_etaRoute, CFSTR("_etaRoute"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_etaResponse, CFSTR("_etaResponse"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_alternateRouteIndex, CFSTR("_alternateRouteIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayETAInfo, CFSTR("_displayETAInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_remainingDistanceInfo, CFSTR("_remainingDistanceInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryChargeInfo, CFSTR("_batteryChargeInfo"));
  -[GEOComposedRoute mutableData](self->_route, "mutableData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_route.mutableData"));

  MNGetMNRouteStorageLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v12, OS_SIGNPOST_INTERVAL_END, v6, "ActiveRouteInfoEncoding", ", v13, 2u);
  }

}

- (id)description
{
  void *v3;
  GEOComposedRoute *route;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  route = self->_route;
  -[GEOComposedRoute name](route, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MNActiveRouteInfo: %p (GEOComposedRoute: %p) - %@"), self, route, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (GEOComposedETARoute)etaRoute
{
  return self->_etaRoute;
}

- (GEOETATrafficUpdateResponse)etaResponse
{
  return self->_etaResponse;
}

- (void)setEtaResponse:(id)a3
{
  objc_storeStrong((id *)&self->_etaResponse, a3);
}

- (MNDisplayETAInfo)displayETAInfo
{
  return self->_displayETAInfo;
}

- (void)setDisplayETAInfo:(id)a3
{
  objc_storeStrong((id *)&self->_displayETAInfo, a3);
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  return self->_remainingDistanceInfo;
}

- (void)setRemainingDistanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_remainingDistanceInfo, a3);
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return self->_batteryChargeInfo;
}

- (void)setBatteryChargeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_batteryChargeInfo, a3);
}

- (unint64_t)alternateRouteIndex
{
  return self->_alternateRouteIndex;
}

- (void)setAlternateRouteIndex:(unint64_t)a3
{
  self->_alternateRouteIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryChargeInfo, 0);
  objc_storeStrong((id *)&self->_remainingDistanceInfo, 0);
  objc_storeStrong((id *)&self->_displayETAInfo, 0);
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_etaRoute, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
