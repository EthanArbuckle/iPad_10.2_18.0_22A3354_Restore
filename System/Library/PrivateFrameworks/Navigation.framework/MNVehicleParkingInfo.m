@implementation MNVehicleParkingInfo

- (void)setRemainingWalkingRoute:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *routeID;
  GEOComposedRoute *remainingWalkingRoute;

  v4 = a3;
  objc_msgSend(v4, "uniqueRouteID");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  routeID = self->_routeID;
  self->_routeID = v5;

  remainingWalkingRoute = self->_remainingWalkingRoute;
  self->_remainingWalkingRoute = (GEOComposedRoute *)v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  GEOComposedRoute *remainingWalkingRoute;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_parkingType, CFSTR("_parkingType"));
  remainingWalkingRoute = self->_remainingWalkingRoute;
  if (remainingWalkingRoute)
  {
    MNSaveRouteWithSubpath(remainingWalkingRoute, 0, 1, 0);
    objc_msgSend(v5, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_walkingRouteDisplayETAInfo, CFSTR("_walkingRouteDisplayETAInfo"));

}

- (MNVehicleParkingInfo)initWithCoder:(id)a3
{
  id v4;
  MNVehicleParkingInfo *v5;
  uint64_t v6;
  MNDisplayETAInfo *walkingRouteDisplayETAInfo;
  uint64_t v8;
  NSUUID *routeID;
  NSUUID *v10;
  uint64_t v11;
  GEOComposedRoute *remainingWalkingRoute;
  MNVehicleParkingInfo *v13;

  v4 = a3;
  v5 = -[MNVehicleParkingInfo init](self, "init");
  if (v5)
  {
    v5->_parkingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_parkingType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_walkingRouteDisplayETAInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    walkingRouteDisplayETAInfo = v5->_walkingRouteDisplayETAInfo;
    v5->_walkingRouteDisplayETAInfo = (MNDisplayETAInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v8 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;

    v10 = v5->_routeID;
    if (v10)
    {
      MNGetRouteFromSubpathWithID(v10, 0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      remainingWalkingRoute = v5->_remainingWalkingRoute;
      v5->_remainingWalkingRoute = (GEOComposedRoute *)v11;

    }
    v13 = v5;
  }

  return v5;
}

- (id)description
{
  int64_t parkingType;
  const __CFString *v3;
  const __CFString *v4;

  parkingType = self->_parkingType;
  v3 = CFSTR("None");
  if (parkingType == 1)
    v3 = CFSTR("Parked");
  if (parkingType == 2)
    v4 = CFSTR("SearchingForParking");
  else
    v4 = v3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Type: %@, remaining walking route: %@"), v4, self->_walkingRouteDisplayETAInfo);
}

- (int64_t)parkingType
{
  return self->_parkingType;
}

- (void)setParkingType:(int64_t)a3
{
  self->_parkingType = a3;
}

- (GEOComposedRoute)remainingWalkingRoute
{
  return self->_remainingWalkingRoute;
}

- (MNDisplayETAInfo)walkingRouteDisplayETAInfo
{
  return self->_walkingRouteDisplayETAInfo;
}

- (void)setWalkingRouteDisplayETAInfo:(id)a3
{
  objc_storeStrong((id *)&self->_walkingRouteDisplayETAInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingRouteDisplayETAInfo, 0);
  objc_storeStrong((id *)&self->_remainingWalkingRoute, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
