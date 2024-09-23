@implementation EKTravelEngineHypothesis

- (EKTravelEngineHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  EKTravelEngineHypothesis *v28;
  EKTravelEngineHypothesis *v29;
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
  uint64_t v40;
  NSDate *creationDate;
  objc_super v43;

  v23 = a4;
  v24 = a6;
  v25 = a8;
  v26 = a10;
  v27 = a13;
  v43.receiver = self;
  v43.super_class = (Class)EKTravelEngineHypothesis;
  v28 = -[EKTravelEngineHypothesis init](&v43, sel_init);
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
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = objc_claimAutoreleasedReturnValue();
    creationDate = v29->_creationDate;
    v29->_creationDate = (NSDate *)v40;

  }
  return v29;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v18 = objc_opt_class();
  v3 = -[EKTravelEngineHypothesis transportType](self, "transportType");
  if (v3 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E4786A58[(int)v3];
  }
  -[EKTravelEngineHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v4, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v5, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v7, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis routeName](self, "routeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKTravelEngineUtilities geoTrafficDensityAsString:](EKTravelEngineUtilities, "geoTrafficDensityAsString:", -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKTravelEngineHypothesis travelState](self, "travelState");
  if (v12 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E4786A90[v12];
  }
  -[EKTravelEngineHypothesis creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>(transportType = %@, conservativeDepartureDate = %@, conservativeTravelTime = %@, suggestedDepartureDate = %@, estimatedTravelTime = %@, aggressiveDepartureDate = %@, aggressiveTravelTime = %@, routeName = %@, supportsLiveTraffic = %@, currentTrafficDensity = %@, trafficDensityDescription = %@, travelState = %@, creationDate = %@)"), v18, self, v20, v24, v23, v22, v21, v6, v17, v8, v9, v10, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[EKTravelEngineHypothesis isEqualToHypothesis:](self, "isEqualToHypothesis:", v4);

  return v5;
}

- (BOOL)isEqualToHypothesis:(id)a3
{
  EKTravelEngineHypothesis *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int64_t v32;
  BOOL v33;

  v4 = (EKTravelEngineHypothesis *)a3;
  if (self == v4)
  {
    v33 = 1;
  }
  else
  {
    v5 = -[EKTravelEngineHypothesis transportType](self, "transportType");
    if (v5 != -[EKTravelEngineHypothesis transportType](v4, "transportType"))
      goto LABEL_14;
    -[EKTravelEngineHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis conservativeDepartureDate](v4, "conservativeDepartureDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CalEqualObjects();

    if (!v8)
      goto LABEL_14;
    -[EKTravelEngineHypothesis conservativeTravelTime](self, "conservativeTravelTime");
    v10 = v9;
    -[EKTravelEngineHypothesis conservativeTravelTime](v4, "conservativeTravelTime");
    if (v10 != v11)
      goto LABEL_14;
    -[EKTravelEngineHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis suggestedDepartureDate](v4, "suggestedDepartureDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CalEqualObjects();

    if (!v14)
      goto LABEL_14;
    -[EKTravelEngineHypothesis estimatedTravelTime](self, "estimatedTravelTime");
    v16 = v15;
    -[EKTravelEngineHypothesis estimatedTravelTime](v4, "estimatedTravelTime");
    if (v16 != v17)
      goto LABEL_14;
    -[EKTravelEngineHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis aggressiveDepartureDate](v4, "aggressiveDepartureDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CalEqualObjects();

    if (!v20)
      goto LABEL_14;
    -[EKTravelEngineHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
    v22 = v21;
    -[EKTravelEngineHypothesis aggressiveTravelTime](v4, "aggressiveTravelTime");
    if (v22 != v23)
      goto LABEL_14;
    -[EKTravelEngineHypothesis routeName](self, "routeName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis routeName](v4, "routeName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CalEqualStrings();

    if (!v26)
      goto LABEL_14;
    v27 = -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic");
    if (v27 != -[EKTravelEngineHypothesis supportsLiveTraffic](v4, "supportsLiveTraffic"))
      goto LABEL_14;
    v28 = -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity");
    if (v28 != -[EKTravelEngineHypothesis currentTrafficDensity](v4, "currentTrafficDensity"))
      goto LABEL_14;
    -[EKTravelEngineHypothesis trafficDensityDescription](self, "trafficDensityDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis trafficDensityDescription](v4, "trafficDensityDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CalEqualStrings();

    if (v31)
    {
      v32 = -[EKTravelEngineHypothesis travelState](self, "travelState");
      v33 = v32 == -[EKTravelEngineHypothesis travelState](v4, "travelState");
    }
    else
    {
LABEL_14:
      v33 = 0;
    }
  }

  return v33;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;

  v3 = -[EKTravelEngineHypothesis transportType](self, "transportType");
  -[EKTravelEngineHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[EKTravelEngineHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5 ^ objc_msgSend(v9, "hash") ^ v8;

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  -[EKTravelEngineHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[EKTravelEngineHypothesis routeName](self, "routeName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  v21 = v15 ^ v20 ^ -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic");
  v22 = -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity");
  -[EKTravelEngineHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");

  return v21 ^ v24 ^ -[EKTravelEngineHypothesis travelState](self, "travelState");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  EKMutableTravelEngineHypothesis *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  _BOOL8 v16;
  unint64_t v17;
  void *v18;
  EKMutableTravelEngineHypothesis *v19;

  v4 = +[EKMutableTravelEngineHypothesis allocWithZone:](EKMutableTravelEngineHypothesis, "allocWithZone:", a3);
  v5 = -[EKTravelEngineHypothesis transportType](self, "transportType");
  -[EKTravelEngineHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  v8 = v7;
  -[EKTravelEngineHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  v11 = v10;
  -[EKTravelEngineHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  v14 = v13;
  -[EKTravelEngineHypothesis routeName](self, "routeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic");
  v17 = -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity");
  -[EKTravelEngineHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[EKTravelEngineHypothesis initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:](v4, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", v5, v6, v9, v12, v15, v16, v8, v11, v14, v17, v18, -[EKTravelEngineHypothesis travelState](self, "travelState"));

  return v19;
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
  objc_msgSend(v4, "numberWithInt:", -[EKTravelEngineHypothesis transportType](self, "transportType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("transportType"));

  -[EKTravelEngineHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("conservativeDepartureDate"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("conservativeTravelTime"));

  -[EKTravelEngineHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("suggestedDepartureDate"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("estimatedTravelTime"));

  -[EKTravelEngineHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("aggressiveDepartureDate"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[EKTravelEngineHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("aggressiveTravelTime"));

  -[EKTravelEngineHypothesis routeName](self, "routeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("routeName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("supportsLiveTraffic"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("currentTrafficDensity"));

  -[EKTravelEngineHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("trafficDensityDescription"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EKTravelEngineHypothesis travelState](self, "travelState"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("travelState"));

}

- (EKTravelEngineHypothesis)initWithCoder:(id)a3
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
  EKTravelEngineHypothesis *v25;
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
  v25 = -[EKTravelEngineHypothesis initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:](self, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", v27, v5, v9, v13, v17, v19, v8, v12, v16, v21, v22, v24);

  return v25;
}

+ (id)syntheticHypothesisWithStartDate:(id)a3 conservativeTravelTime:(double)a4 estimatedTravelTime:(double)a5 aggressiveTravelTime:(double)a6
{
  id v9;
  EKTravelEngineHypothesis *v10;
  void *v11;
  void *v12;
  void *v13;
  EKTravelEngineHypothesis *v14;

  v9 = a3;
  v10 = [EKTravelEngineHypothesis alloc];
  objc_msgSend(v9, "dateByAddingTimeInterval:", -a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", -a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", -a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[EKTravelEngineHypothesis initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:](v10, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", 4, v11, v12, v13, 0, 0, a4, a5, a6, 0, 0, 0);
  return v14;
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

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);
  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
}

@end
