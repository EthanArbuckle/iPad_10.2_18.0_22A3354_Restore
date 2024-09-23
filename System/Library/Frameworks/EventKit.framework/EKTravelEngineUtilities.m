@implementation EKTravelEngineUtilities

+ (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)formattedLocationCoordinates:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%.4f, %.4f)"), v6, v8);
}

+ (int64_t)geoRouteHypothesisTravelStateForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKTravelEngineUtilities geoRouteHypothesisTravelStateForString:].cold.1();
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotTraveling")) & 1) != 0)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Traveling")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TravelingToDestination")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TravelingTowardsDestination")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TravelingAwayFromDestination")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Arrived")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_8;
    }
    v7 = EKTravelEngineLogHandle;
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Unknown travel state given: [%@].  Will not find a corresponding travel state.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_7;
  }
  v5 = 1;
LABEL_8:

  return v5;
}

+ (id)geoTransportTypeAsString:(int)a3
{
  id result;

  switch(a3)
  {
    case 0:
      result = CFSTR("AUTOMOBILE");
      break;
    case 1:
      result = CFSTR("TRANSIT");
      break;
    case 2:
      result = CFSTR("WALKING");
      break;
    case 3:
      result = CFSTR("BICYCLE");
      break;
    case 4:
      result = CFSTR("UNKNOWN_TRANSPORT_TYPE");
      break;
    case 5:
      result = CFSTR("FERRY");
      break;
    case 6:
      if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_ERROR))
        +[EKTravelEngineUtilities geoTransportTypeAsString:].cold.1();
      result = 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (int)geoTransportTypeForString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKTravelEngineUtilities geoTransportTypeForString:].cold.1();
LABEL_6:
    v5 = 4;
    goto LABEL_13;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) == 0)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
      {
        v5 = 5;
        goto LABEL_13;
      }
      v7 = EKTravelEngineLogHandle;
      if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Unknown transport type given: [%@].  Will not find a corresponding transport type.", (uint8_t *)&v8, 0xCu);
      }
    }
    goto LABEL_6;
  }
  v5 = 0;
LABEL_13:

  return v5;
}

+ (id)geoTrafficDensityAsString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E4786D40[a3];
}

+ (unint64_t)geoTrafficDensityForString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKTravelEngineUtilities geoTrafficDensityForString:].cold.1();
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Light")) & 1) != 0)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Medium")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Heavy")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ExtremelyHeavy")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_8;
    }
    v7 = EKTravelEngineLogHandle;
    if (os_log_type_enabled((os_log_t)EKTravelEngineLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Unknown traffic density given: [%@].  Will not find a corresponding traffic density.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_7;
  }
  v5 = 1;
LABEL_8:

  return v5;
}

+ (id)authorizationStatusAsString:(int)a3
{
  if (a3 > 4)
    return CFSTR("Unknown status");
  else
    return off_1E4786D60[a3];
}

+ (int)geoTransportTypeForCalLocationRoutingMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 4;
  else
    return dword_1A244A590[a3 - 1];
}

+ (BOOL)date:(id)a3 representsApproachingDepartureDateForHypothesis:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a3;
  objc_msgSend(a4, "suggestedDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  return v8 > 120.0;
}

+ (BOOL)date:(id)a3 representsLatenessForHypothesis:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  objc_msgSend(a4, "aggressiveDepartureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "CalIsAfterDate:", v6);

  return v7;
}

+ (BOOL)date:(id)a3 representsImmediateDepartureForHypothesis:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "date:representsApproachingDepartureDateForHypothesis:", v7, v6);
  LOBYTE(a1) = objc_msgSend(a1, "date:representsLatenessForHypothesis:", v7, v6);

  return (v8 | a1) ^ 1;
}

+ (double)maximumAllowableTravelTime
{
  return 12600.0;
}

+ (double)minimumAllowableTravelTime
{
  return 240.0;
}

+ (id)cadRouteHypothesisForEKTravelEngineHypothesis:(id)a3
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

  v3 = (objc_class *)MEMORY[0x1E0D0A0F0];
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

+ (void)geoRouteHypothesisTravelStateForString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "nil 'string' given.  Will not find a corresponding travel state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)geoTransportTypeAsString:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_1A2318000, v0, OS_LOG_TYPE_ERROR, "RIDESHARE is unsupported in geoTransportTypeAsString. Returning nil.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)geoTransportTypeForString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "nil 'string' given.  Will not find a corresponding transport type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)geoTrafficDensityForString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "nil 'string' given.  Will not find a corresponding traffic density.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
