@implementation GEORouteHypothesis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  NSString *trafficDensityDescription;
  objc_super v4;

  trafficDensityDescription = self->_trafficDensityDescription;
  self->_trafficDensityDescription = 0;

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesis;
  -[GEORouteHypothesis dealloc](&v4, sel_dealloc);
}

- (GEORouteHypothesis)initWithCoder:(id)a3
{
  id v4;
  GEORouteHypothesis *v5;
  uint64_t v6;
  NSDate *generationDate;
  uint64_t v8;
  GEOLocation *lastLocation;
  uint64_t v10;
  NSDate *suggestedDepartureDate;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSError *error;
  uint64_t v21;
  NSDate *conservativeDepartureDate;
  double v23;
  uint64_t v24;
  NSDate *aggressiveDepartureDate;
  double v26;
  void *v27;
  uint64_t v28;
  NSString *routeName;
  void *v30;
  uint64_t v31;
  NSString *trafficDensityDescription;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)GEORouteHypothesis;
  v5 = -[GEORouteHypothesis init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisGenerationDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    generationDate = v5->_generationDate;
    v5->_generationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisLastLocationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastLocation = v5->_lastLocation;
    v5->_lastLocation = (GEOLocation *)v8;

    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GEORouteHypothesisTransportTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisSuggestedDepartureDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    suggestedDepartureDate = v5->_suggestedDepartureDate;
    v5->_suggestedDepartureDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEORouteHypothesisEstimatedTravelTimeKey"));
    v5->_estimatedTravelTime = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisCurrentTrafficDensityKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentTrafficDensity = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisHistoricTrafficDensityKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_historicTrafficDensity = objc_msgSend(v14, "unsignedIntegerValue");

    v5->_travelState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GEORouteHypothesisTravelStateKey"));
    v5->_supportsLiveTraffic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("GEORouteHypothesisLiveTrafficKey"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("GEORouteHypothesisErrorKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisConservativeDepartureDateKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    conservativeDepartureDate = v5->_conservativeDepartureDate;
    v5->_conservativeDepartureDate = (NSDate *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEORouteHypothesisConservativeTravelTimeKey"));
    v5->_conservativeTravelTime = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisAggressiveDepartureDateKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    aggressiveDepartureDate = v5->_aggressiveDepartureDate;
    v5->_aggressiveDepartureDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEORouteHypothesisAggressiveTravelTimeKey"));
    v5->_aggressiveTravelTime = v26;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisRouteNameKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEORouteHypothesisTrafficDensityDescriptionKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    trafficDensityDescription = v5->_trafficDensityDescription;
    v5->_trafficDensityDescription = (NSString *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[GEORouteHypothesis generationDate](self, "generationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("GEORouteHypothesisGenerationDateKey"));

  -[GEORouteHypothesis lastLocation](self, "lastLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("GEORouteHypothesisLastLocationKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEORouteHypothesis transportType](self, "transportType"), CFSTR("GEORouteHypothesisTransportTypeKey"));
  -[GEORouteHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("GEORouteHypothesisSuggestedDepartureDateKey"));

  -[GEORouteHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("GEORouteHypothesisEstimatedTravelTimeKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEORouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("GEORouteHypothesisCurrentTrafficDensityKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEORouteHypothesis historicTrafficDensity](self, "historicTrafficDensity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("GEORouteHypothesisHistoricTrafficDensityKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEORouteHypothesis travelState](self, "travelState"), CFSTR("GEORouteHypothesisTravelStateKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[GEORouteHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"), CFSTR("GEORouteHypothesisLiveTrafficKey"));
  -[GEORouteHypothesis error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("GEORouteHypothesisErrorKey"));

  -[GEORouteHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("GEORouteHypothesisConservativeDepartureDateKey"));

  -[GEORouteHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("GEORouteHypothesisConservativeTravelTimeKey"));
  -[GEORouteHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("GEORouteHypothesisAggressiveDepartureDateKey"));

  -[GEORouteHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("GEORouteHypothesisAggressiveTravelTimeKey"));
  -[GEORouteHypothesis routeName](self, "routeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("GEORouteHypothesisRouteNameKey"));

  -[GEORouteHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("GEORouteHypothesisTrafficDensityDescriptionKey"));

}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (void)setSupportsLiveTraffic:(BOOL)a3
{
  self->_supportsLiveTraffic = a3;
}

- (void)setRouteName:(id)a3
{
  NSString *v4;
  NSString *routeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  routeName = self->_routeName;
  self->_routeName = v4;

}

- (NSString)trafficDensityDescription
{
  NSString *trafficDensityDescription;
  unint64_t currentTrafficDensity;

  trafficDensityDescription = self->_trafficDensityDescription;
  if (trafficDensityDescription)
    return trafficDensityDescription;
  currentTrafficDensity = self->_currentTrafficDensity;
  if (currentTrafficDensity > 3)
    return (NSString *)CFSTR("unknown");
  else
    return (NSString *)off_1E1C15C30[currentTrafficDensity];
}

- (void)_updateDepartureAndArrivalSuggestionsForArrivalDate:(id)a3 travelTimeWithTraffic:(double)a4 conservativeTravelTime:(double)a5 aggressiveTravelTime:(double)a6 transportType:(int)a7
{
  id v12;
  NSDate *v13;
  NSDate *generationDate;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double estimatedTravelTime;
  NSDate *suggestedDepartureDate;
  NSDate *conservativeDepartureDate;
  NSDate *aggressiveDepartureDate;
  NSDate *v35;
  NSDate *v36;
  NSDate *v37;
  NSDate *v38;
  NSDate *v39;
  NSDate *v40;
  uint8_t v41[16];
  uint8_t buf[16];

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  generationDate = self->_generationDate;
  self->_generationDate = v13;

  self->_transportType = a7;
  self->_estimatedTravelTime = a4;
  if (a4 == 0.0
    || a5 == 0.0
    || a6 == 0.0
    || (+[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "shouldUseServerSideETAs"),
        v15,
        !v16))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Server did not provide aggressive and conservative ETAs (or default overroad them), doing local calculation.", v41, 2u);
    }

    if (self->_transportType == 2)
    {
      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "averageWalkingSpeed");
      v21 = v20;
      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "slowWalkingSpeed");
      v24 = v21 / v23;

      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "averageWalkingSpeed");
      v27 = v26;
      +[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fastWalkingSpeed");
      v30 = v27 / v29;

      estimatedTravelTime = self->_estimatedTravelTime;
      self->_conservativeTravelTime = v24 * estimatedTravelTime;
      a6 = v30 * estimatedTravelTime;
    }
    else
    {
      a6 = self->_estimatedTravelTime;
      self->_conservativeTravelTime = a6;
    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Using server provided aggressive and conservative ETAs.", buf, 2u);
    }

    self->_conservativeTravelTime = a5;
  }
  self->_aggressiveTravelTime = a6;
  suggestedDepartureDate = self->_suggestedDepartureDate;
  self->_suggestedDepartureDate = 0;

  conservativeDepartureDate = self->_conservativeDepartureDate;
  self->_conservativeDepartureDate = 0;

  aggressiveDepartureDate = self->_aggressiveDepartureDate;
  self->_aggressiveDepartureDate = 0;

  if (v12)
  {
    v35 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v12, -self->_estimatedTravelTime);
    v36 = self->_suggestedDepartureDate;
    self->_suggestedDepartureDate = v35;

    v37 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v12, -self->_conservativeTravelTime);
    v38 = self->_conservativeDepartureDate;
    self->_conservativeDepartureDate = v37;

    v39 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v12, -self->_aggressiveTravelTime);
    v40 = self->_aggressiveDepartureDate;
    self->_aggressiveDepartureDate = v39;

  }
}

- (void)_updateCurrentTrafficDensity:(double)a3 staticTravelTime:(double)a4
{
  double v7;
  unint64_t v8;

  v7 = pow(a4, 1.7) * 0.000167 + 300.0;
  if (v7 + a4 <= a3)
  {
    if (a4 + v7 * 2.0 <= a3)
    {
      v8 = 3;
      if (a4 + v7 * 3.0 > a3)
        v8 = 2;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  self->_currentTrafficDensity = v8;
}

- (void)_updateHistoricTrafficDensity:(double)a3 staticTravelTime:(double)a4
{
  double v7;
  unint64_t v8;

  v7 = pow(a4, 1.7) * 0.000167 + 300.0;
  if (v7 + a4 <= a3)
  {
    if (a4 + v7 * 2.0 <= a3)
    {
      v8 = 3;
      if (a4 + v7 * 3.0 > a3)
        v8 = 2;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  self->_historicTrafficDensity = v8;
}

- (void)_updateTrafficDensityDescription:(id)a3
{
  NSString *v4;
  NSString *trafficDensityDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  trafficDensityDescription = self->_trafficDensityDescription;
  self->_trafficDensityDescription = v4;

}

- (void)_updateTravelStateHasArrived:(BOOL)a3 isTraveling:(BOOL)a4 travelScore:(double)a5 isNavigating:(BOOL)a6 isNavigatingToDestination:(BOOL)a7
{
  int64_t v8;
  uint64_t v9;

  if (a7)
  {
    v8 = 2;
LABEL_14:
    self->_travelState = v8;
    return;
  }
  if (a3)
    v8 = 5;
  else
    v8 = 0;
  if (a4 && !a3)
  {
    v9 = 4;
    if (a5 > 0.0)
      v9 = 1;
    if (a5 <= 0.6)
      v8 = v9;
    else
      v8 = 3;
  }
  if (+[GEORouteHypothesis supportsTravelState:forTransportType:](GEORouteHypothesis, "supportsTravelState:forTransportType:", v8, self->_transportType, a6, a5))
  {
    goto LABEL_14;
  }
}

+ (id)_routeHypothesisErrorWithUnderlyingError:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(v3, "code");
    v5 = (unint64_t)(v4 + 13) > 7 || ((1 << (v4 + 13)) & 0xCB) == 0;
    if (!v5 || v4 == -402)
      v6 = -1501;
    else
      v6 = -1500;
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)supportsTravelState:(int64_t)a3 forTransportType:(int)a4
{
  BOOL v5;

  v5 = a3 == 5 || a3 == 0;
  return a4 != 1 || v5;
}

- (void)_setError:(id)a3
{
  NSError *error;
  void *v5;
  void *v6;
  uint64_t v7;
  NSError *v8;
  NSError *v9;
  id v10;

  v10 = a3;
  error = self->_error;
  self->_error = 0;

  GEOErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
  {

    goto LABEL_7;
  }
  if (objc_msgSend(v10, "code") != -1501)
  {
    v7 = objc_msgSend(v10, "code");

    if (v7 == -1500)
      goto LABEL_6;
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "_routeHypothesisErrorWithUnderlyingError:", v10);
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

LABEL_6:
  v8 = (NSError *)v10;
LABEL_8:
  v9 = self->_error;
  self->_error = v8;

}

- (void)_clearHypothesisAndSetErrorWithCode:(int64_t)a3
{
  NSDate *generationDate;
  GEOLocation *lastLocation;
  NSDate *suggestedDepartureDate;
  NSDate *conservativeDepartureDate;
  NSDate *aggressiveDepartureDate;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesis _setError:](self, "_setError:", v9);
  generationDate = self->_generationDate;
  self->_generationDate = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  suggestedDepartureDate = self->_suggestedDepartureDate;
  self->_suggestedDepartureDate = 0;

  conservativeDepartureDate = self->_conservativeDepartureDate;
  self->_conservativeDepartureDate = 0;

  aggressiveDepartureDate = self->_aggressiveDepartureDate;
  self->_aggressiveDepartureDate = 0;

  self->_transportType = 4;
  self->_historicTrafficDensity = 0;
  self->_travelState = 0;
  self->_currentTrafficDensity = 0;

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  _BOOL4 v32;
  const __CFString *v33;
  void *v34;

  if (qword_1ECDBCA68 != -1)
    dispatch_once(&qword_1ECDBCA68, &__block_literal_global_190);
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[GEORouteHypothesis generationDate](self, "generationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3578];
    -[GEORouteHypothesis generationDate](self, "generationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v6, 1, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("{\n\tGeneration date: %@\n"), v7);

  }
  -[GEORouteHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3578];
    -[GEORouteHypothesis suggestedDepartureDate](self, "suggestedDepartureDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 1, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR("\tSuggested departure date: %@\n"), v11);
  }
  -[GEORouteHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3578];
    -[GEORouteHypothesis conservativeDepartureDate](self, "conservativeDepartureDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromDate:dateStyle:timeStyle:", v14, 1, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR("\tConservative departure date: %@\n"), v15);
  }
  -[GEORouteHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3578];
    -[GEORouteHypothesis aggressiveDepartureDate](self, "aggressiveDepartureDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringFromDate:dateStyle:timeStyle:", v18, 1, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendFormat:", CFSTR("\tAggressive departure date: %@\n"), v19);
  }
  v20 = (void *)qword_1ECDBCA70;
  -[GEORouteHypothesis estimatedTravelTime](self, "estimatedTravelTime");
  objc_msgSend(v20, "stringFromTimeInterval:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tEstimated travel time: %@\n"), v21);

  v22 = (void *)qword_1ECDBCA70;
  -[GEORouteHypothesis conservativeTravelTime](self, "conservativeTravelTime");
  objc_msgSend(v22, "stringFromTimeInterval:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tConservative travel time: %@\n"), v23);

  v24 = (void *)qword_1ECDBCA70;
  -[GEORouteHypothesis aggressiveTravelTime](self, "aggressiveTravelTime");
  objc_msgSend(v24, "stringFromTimeInterval:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAggressive travel time: %@\n"), v25);

  -[GEORouteHypothesis routeName](self, "routeName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tRoute Name: %@\n"), v26);

  objc_msgSend(v3, "appendFormat:", CFSTR("\tCurrent traffic density: %i | Historic traffic density: %i\n"), -[GEORouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"), -[GEORouteHypothesis historicTrafficDensity](self, "historicTrafficDensity"));
  -[GEORouteHypothesis trafficDensityDescription](self, "trafficDensityDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tTraffic description: %@\n"), v27);

  v28 = -[GEORouteHypothesis travelState](self, "travelState");
  if (v28 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), v28);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E1C15C50[v28];
  }
  v30 = -[GEORouteHypothesis transportType](self, "transportType");
  if (v30 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_1E1C15C80[(int)v30];
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\tTravel state: %@\n\tTransportType: %@\n"), v29, v31);

  v32 = -[GEORouteHypothesis supportsLiveTraffic](self, "supportsLiveTraffic");
  v33 = CFSTR("NO");
  if (v32)
    v33 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tLive Traffic Supported: %@\n"), v33);
  -[NSError description](self->_error, "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tError: %@\n"), v34);

  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

uint64_t __33__GEORouteHypothesis_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)qword_1ECDBCA70;
  qword_1ECDBCA70 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECDBCA70, "setUnitsStyle:", 2);
}

- (NSDate)generationDate
{
  return self->_generationDate;
}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)suggestedDepartureDate
{
  return self->_suggestedDepartureDate;
}

- (double)estimatedTravelTime
{
  return self->_estimatedTravelTime;
}

- (unint64_t)currentTrafficDensity
{
  return self->_currentTrafficDensity;
}

- (unint64_t)historicTrafficDensity
{
  return self->_historicTrafficDensity;
}

- (int64_t)travelState
{
  return self->_travelState;
}

- (BOOL)supportsLiveTraffic
{
  return self->_supportsLiveTraffic;
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)conservativeDepartureDate
{
  return self->_conservativeDepartureDate;
}

- (NSDate)aggressiveDepartureDate
{
  return self->_aggressiveDepartureDate;
}

- (double)conservativeTravelTime
{
  return self->_conservativeTravelTime;
}

- (double)aggressiveTravelTime
{
  return self->_aggressiveTravelTime;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_generationDate, 0);
}

@end
