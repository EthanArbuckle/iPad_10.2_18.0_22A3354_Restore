@implementation MNBatteryChargeInfo

- (MNBatteryChargeInfo)init
{
  MNBatteryChargeInfo *result;

  result = (MNBatteryChargeInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNBatteryChargeInfo)initWithBatteryChargeRemainingAtEndOfLeg:(double)a3 batteryChargeRemainingAtEndOfRoute:(double)a4 forLegIndex:(unint64_t)a5 forRouteID:(id)a6
{
  id v11;
  MNBatteryChargeInfo *v12;
  MNBatteryChargeInfo *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MNBatteryChargeInfo;
  v12 = -[MNBatteryChargeInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_batteryChargeRemainingAtEndOfLeg = a3;
    v12->_batteryChargeRemainingAtEndOfRoute = a4;
    v12->_legIndex = a5;
    objc_storeStrong((id *)&v12->_routeID, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNBatteryChargeInfo)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  NSUUID *v10;
  NSUUID *routeID;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_batteryChargeRemainingAtEndOfLeg"));
  v6 = v5;
  self->_batteryChargeRemainingAtEndOfLeg = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_batteryChargeRemainingAtEndOfRoute"));
  v8 = v7;
  self->_batteryChargeRemainingAtEndOfRoute = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
  self->_legIndex = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
  v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  routeID = self->_routeID;
  self->_routeID = v10;

  return -[MNBatteryChargeInfo initWithBatteryChargeRemainingAtEndOfLeg:batteryChargeRemainingAtEndOfRoute:forLegIndex:forRouteID:](self, "initWithBatteryChargeRemainingAtEndOfLeg:batteryChargeRemainingAtEndOfRoute:forLegIndex:forRouteID:", v9, v10, v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  double batteryChargeRemainingAtEndOfLeg;
  id v5;

  batteryChargeRemainingAtEndOfLeg = self->_batteryChargeRemainingAtEndOfLeg;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_batteryChargeRemainingAtEndOfLeg"), batteryChargeRemainingAtEndOfLeg);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_batteryChargeRemainingAtEndOfRoute"), self->_batteryChargeRemainingAtEndOfRoute);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));

}

- (BOOL)isEqual:(id)a3
{
  MNBatteryChargeInfo *v4;
  MNBatteryChargeInfo *v5;
  MNBatteryChargeInfo *v6;
  NSUUID *routeID;
  NSUUID *v8;
  id v9;
  void *v10;
  char v11;

  v4 = (MNBatteryChargeInfo *)a3;
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
      if (self->_batteryChargeRemainingAtEndOfLeg == v5->_batteryChargeRemainingAtEndOfLeg
        && self->_batteryChargeRemainingAtEndOfRoute == v5->_batteryChargeRemainingAtEndOfRoute
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
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("endOfLeg: %ldm, endOfRoute: %ldm"), (uint64_t)self->_batteryChargeRemainingAtEndOfLeg, (uint64_t)self->_batteryChargeRemainingAtEndOfRoute);
}

- (double)batteryChargeRemainingAtEndOfLeg
{
  return self->_batteryChargeRemainingAtEndOfLeg;
}

- (double)batteryChargeRemainingAtEndOfRoute
{
  return self->_batteryChargeRemainingAtEndOfRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
