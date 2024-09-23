@implementation GEOComposedRouteEVChargingStationInfo

- (GEOComposedRouteEVChargingStationInfo)init
{
  GEOComposedRouteEVChargingStationInfo *result;

  result = (GEOComposedRouteEVChargingStationInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOComposedRouteEVChargingStationInfo)initWithGeoEVChargingInfo:(id)a3 muid:(unint64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  GEOComposedRouteEVChargingStationInfo *v10;
  GEOComposedRouteEVChargingStationInfo *v11;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteEVChargingStationInfo;
  v10 = -[GEOComposedRouteEVChargingStationInfo init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_muid = a4;
    v12 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_chargingTime = (double)objc_msgSend(v8, "chargingTime");
    v11->_batteryChargeAfterCharging = (double)objc_msgSend(v8, "batteryChargeAfterCharging");
    v11->_batteryPercentageAfterCharging = (double)objc_msgSend(v8, "batteryPercentageAfterCharging");
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("muid: %llu, chargingTime: %gs, batteryChargeAfterCharging: %g, batteryPercentageAfterCharging: %g%%"), self->_muid, *(_QWORD *)&self->_chargingTime, *(_QWORD *)&self->_batteryChargeAfterCharging, *(_QWORD *)&self->_batteryPercentageAfterCharging);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteEVChargingStationInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteEVChargingStationInfo *v5;
  uint64_t v6;
  NSString *name;
  double v8;
  double v9;
  double v10;
  GEOComposedRouteEVChargingStationInfo *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedRouteEVChargingStationInfo;
  v5 = -[GEOComposedRouteEVChargingStationInfo init](&v13, sel_init);
  if (v5)
  {
    v5->_muid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_muid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_chargingTime"));
    v5->_chargingTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_batteryChargeAfterCharging"));
    v5->_batteryChargeAfterCharging = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_batteryPercentageAfterCharging"));
    v5->_batteryPercentageAfterCharging = v10;
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t muid;
  id v5;

  muid = self->_muid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", muid, CFSTR("_muid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_chargingTime"), self->_chargingTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_batteryChargeAfterCharging"), self->_batteryChargeAfterCharging);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_batteryPercentageAfterCharging"), self->_batteryPercentageAfterCharging);

}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (double)chargingTime
{
  return self->_chargingTime;
}

- (double)batteryChargeAfterCharging
{
  return self->_batteryChargeAfterCharging;
}

- (double)batteryPercentageAfterCharging
{
  return self->_batteryPercentageAfterCharging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
