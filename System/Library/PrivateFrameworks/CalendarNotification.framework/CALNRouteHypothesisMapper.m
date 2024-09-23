@implementation CALNRouteHypothesisMapper

+ (id)ekTravelEngineHypothesisFromGEORouteHypothesis:(id)a3
{
  objc_class *v3;
  id v4;
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v22;

  v3 = (objc_class *)MEMORY[0x24BDC7560];
  v4 = a3;
  v22 = [v3 alloc];
  v5 = objc_msgSend(v4, "transportType");
  objc_msgSend(v4, "conservativeDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conservativeTravelTime");
  v8 = v7;
  objc_msgSend(v4, "suggestedDepartureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedTravelTime");
  v11 = v10;
  objc_msgSend(v4, "aggressiveDepartureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggressiveTravelTime");
  v14 = v13;
  objc_msgSend(v4, "routeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "supportsLiveTraffic");
  v17 = objc_msgSend(v4, "currentTrafficDensity");
  objc_msgSend(v4, "trafficDensityDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "travelState");

  v20 = (void *)objc_msgSend(v22, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", v5, v6, v9, v12, v15, v16, v8, v11, v14, v17, v18, v19);
  return v20;
}

+ (id)ekTravelEngineHypothesisFromCADRouteHypothesis:(id)a3
{
  objc_class *v3;
  id v4;
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v22;

  v3 = (objc_class *)MEMORY[0x24BDC7560];
  v4 = a3;
  v22 = [v3 alloc];
  v5 = objc_msgSend(v4, "transportType");
  objc_msgSend(v4, "conservativeDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conservativeTravelTime");
  v8 = v7;
  objc_msgSend(v4, "suggestedDepartureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedTravelTime");
  v11 = v10;
  objc_msgSend(v4, "aggressiveDepartureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggressiveTravelTime");
  v14 = v13;
  objc_msgSend(v4, "routeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "supportsLiveTraffic");
  v17 = objc_msgSend(v4, "currentTrafficDensity");
  objc_msgSend(v4, "trafficDensityDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "travelState");

  v20 = (void *)objc_msgSend(v22, "initWithTransportType:conservativeDepartureDate:conservativeTravelTime:suggestedDepartureDate:estimatedTravelTime:aggressiveDepartureDate:aggressiveTravelTime:routeName:supportsLiveTraffic:currentTrafficDensity:trafficDensityDescription:travelState:", v5, v6, v9, v12, v15, v16, v8, v11, v14, v17, v18, v19);
  return v20;
}

@end
