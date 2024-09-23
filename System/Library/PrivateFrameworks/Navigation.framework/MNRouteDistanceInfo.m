@implementation MNRouteDistanceInfo

- (MNRouteDistanceInfo)init
{
  MNRouteDistanceInfo *result;

  result = (MNRouteDistanceInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNRouteDistanceInfo)initWithDistanceRemainingToEndOfLeg:(double)a3 distanceRemainingToEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6
{
  id v11;
  MNRouteDistanceInfo *v12;
  MNRouteDistanceInfo *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MNRouteDistanceInfo;
  v12 = -[MNRouteDistanceInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_distanceRemainingToEndOfLeg = a3;
    v12->_distanceRemainingToEndOfRoute = a4;
    v12->_legIndex = a5;
    objc_storeStrong((id *)&v12->_routeID, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNRouteDistanceInfo)initWithCoder:(id)a3
{
  id v4;
  MNRouteDistanceInfo *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSUUID *routeID;

  v4 = a3;
  v5 = -[MNRouteDistanceInfo initWithDistanceRemainingToEndOfLeg:distanceRemainingToEndOfRoute:forLegIndex:forRouteID:](self, "initWithDistanceRemainingToEndOfLeg:distanceRemainingToEndOfRoute:forLegIndex:forRouteID:", 0, 0, 0.0, 0.0);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceRemainingToEndOfLeg"));
    v5->_distanceRemainingToEndOfLeg = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceRemainingToEndOfRoute"));
    v5->_distanceRemainingToEndOfRoute = v7;
    v5->_legIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v8 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double distanceRemainingToEndOfLeg;
  id v5;

  distanceRemainingToEndOfLeg = self->_distanceRemainingToEndOfLeg;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceRemainingToEndOfLeg"), distanceRemainingToEndOfLeg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceRemainingToEndOfRoute"), self->_distanceRemainingToEndOfRoute);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));

}

- (BOOL)isEqual:(id)a3
{
  MNRouteDistanceInfo *v4;
  MNRouteDistanceInfo *v5;
  MNRouteDistanceInfo *v6;
  NSUUID *routeID;
  NSUUID *v8;
  id v9;
  void *v10;
  char v11;

  v4 = (MNRouteDistanceInfo *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_distanceRemainingToEndOfLeg == v5->_distanceRemainingToEndOfLeg
        && self->_distanceRemainingToEndOfRoute == v5->_distanceRemainingToEndOfRoute
        && self->_legIndex == v5->_legIndex)
      {
        routeID = self->_routeID;
        v8 = v5->_routeID;
        v9 = routeID;
        v10 = v9;
        if ((unint64_t)v9 | (unint64_t)v8)
          v11 = objc_msgSend(v9, "isEqual:", v8);
        else
          v11 = 1;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endOfLeg: %ldm, endOfRoute: %ldm"), (uint64_t)self->_distanceRemainingToEndOfLeg, (uint64_t)self->_distanceRemainingToEndOfRoute);
}

- (double)distanceRemainingToEndOfLeg
{
  return self->_distanceRemainingToEndOfLeg;
}

- (double)distanceRemainingToEndOfRoute
{
  return self->_distanceRemainingToEndOfRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
