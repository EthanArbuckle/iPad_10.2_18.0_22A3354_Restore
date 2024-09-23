@implementation EKMutableTravelEngineHypothesis

- (void)setTransportType:(int)a3
{
  self->super._transportType = a3;
}

- (void)setConservativeDepartureDate:(id)a3
{
  NSDate *v4;
  NSDate *conservativeDepartureDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  conservativeDepartureDate = self->super._conservativeDepartureDate;
  self->super._conservativeDepartureDate = v4;

}

- (void)setConservativeTravelTime:(double)a3
{
  self->super._conservativeTravelTime = a3;
}

- (void)setSuggestedDepartureDate:(id)a3
{
  NSDate *v4;
  NSDate *suggestedDepartureDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  suggestedDepartureDate = self->super._suggestedDepartureDate;
  self->super._suggestedDepartureDate = v4;

}

- (void)setEstimatedTravelTime:(double)a3
{
  self->super._estimatedTravelTime = a3;
}

- (void)setAggressiveDepartureDate:(id)a3
{
  NSDate *v4;
  NSDate *aggressiveDepartureDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  aggressiveDepartureDate = self->super._aggressiveDepartureDate;
  self->super._aggressiveDepartureDate = v4;

}

- (void)setAggressiveTravelTime:(double)a3
{
  self->super._aggressiveTravelTime = a3;
}

- (void)setRouteName:(id)a3
{
  NSString *v4;
  NSString *routeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  routeName = self->super._routeName;
  self->super._routeName = v4;

}

- (void)setSupportsLiveTraffic:(BOOL)a3
{
  self->super._supportsLiveTraffic = a3;
}

- (void)setCurrentTrafficDensity:(unint64_t)a3
{
  self->super._currentTrafficDensity = a3;
}

- (void)setTrafficDensityDescription:(id)a3
{
  NSString *v4;
  NSString *trafficDensityDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  trafficDensityDescription = self->super._trafficDensityDescription;
  self->super._trafficDensityDescription = v4;

}

- (void)setTravelState:(int64_t)a3
{
  self->super._travelState = a3;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->super._creationDate, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKTravelEngineHypothesis *v4;
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
  EKTravelEngineHypothesis *v19;

  v4 = +[EKTravelEngineHypothesis allocWithZone:](EKTravelEngineHypothesis, "allocWithZone:", a3);
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

@end
