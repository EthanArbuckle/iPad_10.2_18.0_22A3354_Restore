@implementation CADRouteHypothesis

- (CADRouteHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CADRouteHypothesis *v28;
  CADRouteHypothesis *v29;
  uint64_t v30;
  NSDate *conservativeDepartureDate;
  uint64_t v32;
  NSDate *suggestedDepartureDate;
  uint64_t v34;
  NSDate *aggressiveDepartureDate;
  uint64_t v36;
  NSString *routeName;
  uint64_t v38;
  NSString *trafficDensityDescription;
  objc_super v41;

  v23 = a4;
  v24 = a6;
  v25 = a8;
  v26 = a10;
  v27 = a13;
  v41.receiver = self;
  v41.super_class = (Class)CADRouteHypothesis;
  v28 = -[CADRouteHypothesis init](&v41, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_transportType = a3;
    v30 = objc_msgSend(v23, "copy");
    conservativeDepartureDate = v29->_conservativeDepartureDate;
    v29->_conservativeDepartureDate = (NSDate *)v30;

    v29->_conservativeTravelTime = a5;
    v32 = objc_msgSend(v24, "copy");
    suggestedDepartureDate = v29->_suggestedDepartureDate;
    v29->_suggestedDepartureDate = (NSDate *)v32;

    v29->_estimatedTravelTime = a7;
    v34 = objc_msgSend(v25, "copy");
    aggressiveDepartureDate = v29->_aggressiveDepartureDate;
    v29->_aggressiveDepartureDate = (NSDate *)v34;

    v29->_aggressiveTravelTime = a9;
    v36 = objc_msgSend(v26, "copy");
    routeName = v29->_routeName;
    v29->_routeName = (NSString *)v36;

    v29->_supportsLiveTraffic = a11;
    v29->_currentTrafficDensity = a12;
    v38 = objc_msgSend(v27, "copy");
    trafficDensityDescription = v29->_trafficDensityDescription;
    v29->_trafficDensityDescription = (NSString *)v38;

    v29->_travelState = a14;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", -[CADRouteHypothesis transportType](self, "transportType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("transportType"));

  -[CADRouteHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("conservativeDepartureDate"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CADRouteHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("conservativeTravelTime"));

  -[CADRouteHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("suggestedDepartureDate"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CADRouteHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("estimatedTravelTime"));

  -[CADRouteHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("aggressiveDepartureDate"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CADRouteHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("aggressiveTravelTime"));

  -[CADRouteHypothesis routeName](self, "routeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("routeName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CADRouteHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("supportsLiveTraffic"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CADRouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("currentTrafficDensity"));

  -[CADRouteHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("trafficDensityDescription"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CADRouteHypothesis travelState](self, "travelState"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("travelState"));

}

- (CADRouteHypothesis)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CADRouteHypothesis *v25;
  unsigned int v27;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transportType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conservativeDepartureDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conservativeTravelTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedDepartureDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedTravelTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aggressiveDepartureDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aggressiveTravelTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsLiveTraffic"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentTrafficDensity"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trafficDensityDescription"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("travelState"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "integerValue");
  v25 = -[CADRouteHypothesis initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:](self, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", v27, v5, v9, v13, v17, v19, v8, v12, v16, v21, v22, v24);

  return v25;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)conservativeDepartureDate
{
  return self->_conservativeDepartureDate;
}

- (double)conservativeTravelTime
{
  return self->_conservativeTravelTime;
}

- (NSDate)suggestedDepartureDate
{
  return self->_suggestedDepartureDate;
}

- (double)estimatedTravelTime
{
  return self->_estimatedTravelTime;
}

- (NSDate)aggressiveDepartureDate
{
  return self->_aggressiveDepartureDate;
}

- (double)aggressiveTravelTime
{
  return self->_aggressiveTravelTime;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (BOOL)supportsLiveTraffic
{
  return self->_supportsLiveTraffic;
}

- (unint64_t)currentTrafficDensity
{
  return self->_currentTrafficDensity;
}

- (NSString)trafficDensityDescription
{
  return self->_trafficDensityDescription;
}

- (int64_t)travelState
{
  return self->_travelState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);
  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
}

@end
