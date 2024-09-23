@implementation MapsSuggestionsSignalPackEvaluator

- (MapsSuggestionsSignalPackEvaluator)initWithSignalPack:(id)a3
{
  id v5;
  MapsSuggestionsSignalPackEvaluator *v6;
  MapsSuggestionsSignalPackEvaluator *v7;
  MapsSuggestionsSignalPackEvaluator *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsSignalPackEvaluator;
    v6 = -[MapsSuggestionsSignalPackEvaluator init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_signalPack, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v14 = 1024;
      v15 = 144;
      v16 = 2082;
      v17 = "-[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]";
      v18 = 2082;
      v19 = "nil == (signalPack)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires signal pack", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)evaluatorFromSignalPack:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSignalPack:", v4);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v10 = 1024;
      v11 = 155;
      v12 = 2082;
      v13 = "+[MapsSuggestionsSignalPackEvaluator evaluatorFromSignalPack:]";
      v14 = 2082;
      v15 = "nil == (signalPack)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires signal pack", (uint8_t *)&v8, 0x26u);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)hasWeatherInfo
{
  return -[MapsSuggestionsSignalPackEvaluator hasWeatherTemperatureInfo](self, "hasWeatherTemperatureInfo")
      || -[MapsSuggestionsSignalPackEvaluator hasWeatherPrecipitationInfo](self, "hasWeatherPrecipitationInfo");
}

- (BOOL)hasWeatherTemperatureInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 6);
}

- (BOOL)isColdWeather
{
  float v2;
  double v3;
  double v4;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 6);
  v3 = v2;
  GEOConfigGetDouble();
  return v4 > v3;
}

- (BOOL)isHotWeather
{
  float v2;
  double v3;
  double v4;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 6);
  v3 = v2;
  GEOConfigGetDouble();
  return v4 < v3;
}

- (BOOL)isMildWeather
{
  if (-[MapsSuggestionsSignalPackEvaluator isHotWeather](self, "isHotWeather"))
    return 0;
  else
    return !-[MapsSuggestionsSignalPackEvaluator isHotWeather](self, "isHotWeather");
}

- (BOOL)hasWeatherPrecipitationInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 8)
      || -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 9);
}

- (BOOL)isLowChanceOfRaining
{
  float v3;
  double v4;
  double v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsSignalPackEvaluator hasWeatherPrecipitationInfo](self, "hasWeatherPrecipitationInfo"))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 8);
    v4 = v3;
    GEOConfigGetDouble();
    return v5 > v4;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v10 = 1024;
      v11 = 195;
      v12 = 2082;
      v13 = "-[MapsSuggestionsSignalPackEvaluator isLowChanceOfRaining]";
      v14 = 2082;
      v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isHighChanceOfRaining
{
  float v3;
  double v4;
  double v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsSignalPackEvaluator hasWeatherPrecipitationInfo](self, "hasWeatherPrecipitationInfo"))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 8);
    v4 = v3;
    GEOConfigGetDouble();
    return v5 < v4;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v10 = 1024;
      v11 = 201;
      v12 = 2082;
      v13 = "-[MapsSuggestionsSignalPackEvaluator isHighChanceOfRaining]";
      v14 = 2082;
      v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isLowChanceOfSnowing
{
  float v3;
  double v4;
  double v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsSignalPackEvaluator hasWeatherPrecipitationInfo](self, "hasWeatherPrecipitationInfo"))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 9);
    v4 = v3;
    GEOConfigGetDouble();
    return v5 > v4;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v10 = 1024;
      v11 = 207;
      v12 = 2082;
      v13 = "-[MapsSuggestionsSignalPackEvaluator isLowChanceOfSnowing]";
      v14 = 2082;
      v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isHighChanceOfSnowing
{
  float v3;
  double v4;
  double v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsSignalPackEvaluator hasWeatherPrecipitationInfo](self, "hasWeatherPrecipitationInfo"))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 9);
    v4 = v3;
    GEOConfigGetDouble();
    return v5 < v4;
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446978;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v10 = 1024;
      v11 = 213;
      v12 = 2082;
      v13 = "-[MapsSuggestionsSignalPackEvaluator isHighChanceOfSnowing]";
      v14 = 2082;
      v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isBadWeather
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[MapsSuggestionsSignalPackEvaluator hasWeatherTemperatureInfo](self, "hasWeatherTemperatureInfo");
  v4 = -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 8);
  v5 = -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 9);
  v6 = v5;
  if (v3 || v4 || v5)
  {
    if (v3 && -[MapsSuggestionsSignalPackEvaluator isColdWeather](self, "isColdWeather")
      || v4 && -[MapsSuggestionsSignalPackEvaluator isHighChanceOfRaining](self, "isHighChanceOfRaining")
      || v6 && -[MapsSuggestionsSignalPackEvaluator isHighChanceOfSnowing](self, "isHighChanceOfSnowing"))
    {
      return 1;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      v11 = 1024;
      v12 = 223;
      v13 = 2082;
      v14 = "-[MapsSuggestionsSignalPackEvaluator isBadWeather]";
      v15 = 2082;
      v16 = "! (hasTemperatureInfo || hasRainInfo || hasSnowInfo)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherTemperatureInfo or -hasWeatherPrecipitationInfo first!", (uint8_t *)&v9, 0x26u);
    }

  }
  return 0;
}

- (BOOL)hasUserTransportTypePreferenceInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 19);
}

- (BOOL)isUserPreferenceDriving
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 19);
  return v2 == 0.0;
}

- (BOOL)isUserPreferenceWalking
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 19);
  return v2 == 1.0;
}

- (BOOL)isUserPreferenceTransit
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 19);
  return v2 == 2.0;
}

- (BOOL)isUserPreferenceRidesharing
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 19);
  return v2 == 3.0;
}

- (BOOL)hasDistanceFromHereToDestinationInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 13);
}

- (BOOL)hasDistanceFromHereToOriginInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 14);
}

- (BOOL)hasDistanceFromOriginToDestinationInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 15);
}

- (BOOL)isEasilyWalkable
{
  float v2;
  double v3;
  double v4;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 13);
  v3 = v2;
  GEOConfigGetDouble();
  return v4 >= v3;
}

- (BOOL)isWalkable
{
  float v2;
  double v3;
  double v4;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 13);
  v3 = v2;
  GEOConfigGetDouble();
  return v4 >= v3;
}

- (BOOL)hasCarPlayInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 20);
}

- (BOOL)isCarPlayConnected
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 20);
  return v2 != 0.0;
}

- (BOOL)hasMapTypeInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 21);
}

- (BOOL)isMapTypeTransit
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 21);
  return v2 == 4.0;
}

- (BOOL)userHasAnUpcomingTrip
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 36);
  return v2 != 0.0;
}

- (BOOL)hasSignalForUpcomingTrip
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 36);
}

- (BOOL)userIsCurrentlyInATrip
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 37);
  return v2 != 0.0;
}

- (BOOL)hasSignalForIsCurrentlyInATrip
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 37);
}

- (BOOL)userHasAnExpressPaymentCard
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 34);
  return v2 != 0.0;
}

- (BOOL)userHasAPaymentCard
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 35);
  return v2 != 0.0;
}

- (BOOL)userHasATransitCard
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 28);
  return v2 != 0.0;
}

- (BOOL)hasSignalForExpressPaymentCard
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 34);
}

- (BOOL)hasSignalForPaymentCard
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 35);
}

- (BOOL)hasSignalForHasATransitCard
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 28);
}

- (BOOL)hasTransitInfo
{
  return 1;
}

- (BOOL)isTransitCurrentlyPossible
{
  return 1;
}

- (BOOL)hasRidesharingInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 24);
}

- (BOOL)isRideSharingAppsInstalled
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 24);
  return v2 != 0.0;
}

- (BOOL)hasTouristInfo
{
  return -[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 12);
}

- (BOOL)isTouristHere
{
  float v2;

  -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 12);
  return v2 > 0.0;
}

- (double)isTransitUserHereConfidence
{
  NSObject *v3;
  float v4;
  double result;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (!GEOConfigGetBOOL())
    goto LABEL_6;
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "IsTransitUser: MapsSuggestionsIsTransitAvailableHereEnabled is YES", buf, 2u);
  }

  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 33))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 33);
    if (v4 != 0.0)
    {
LABEL_6:
      -[MapsSuggestionsSignalPackEvaluator isTransitUserConfidence](self, "isTransitUserConfidence");
      return result;
    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "IsTransitUser: MapsSuggestionsSignalTypeIsTransitAvailableHere is NO", v8, 2u);
    }

    return MapsSuggestionsConfidenceDefinitelyFalse();
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "IsTransitUser: we don't have MapsSuggestionsSignalTypeIsTransitAvailableHere", v9, 2u);
    }

    return MapsSuggestionsConfidenceDontKnow();
  }
}

- (double)isTransitUserConfidence
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  float v6;
  double v7;
  NSObject *v8;
  unsigned int v9;
  float v10;
  double v11;
  NSObject *v12;
  float v13;
  double v14;
  NSObject *v15;
  float v16;
  double v17;
  NSObject *v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v31;
  double v32;
  NSObject *v33;
  double v34;
  double v35;
  uint64_t Integer;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  double v45;
  __int16 v46;
  unsigned int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 19)
    && -[MapsSuggestionsSignalPackEvaluator isUserPreferenceTransit](self, "isUserPreferenceTransit"))
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "IsTransitUser: Prefered Transport type is Transit", (uint8_t *)&v44, 2u);
    }

    return MapsSuggestionsConfidenceDefinitelyTrue();
  }
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v44 = 134217984;
    v45 = 0.0;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "IsTransitUser: startScore = %.2f", (uint8_t *)&v44, 0xCu);
  }

  v5 = 0.0;
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 28))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 28);
    if (v6 != 0.0)
    {
      GEOConfigGetDouble();
      v5 = v7 + 0.0;
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v44 = 134217984;
        v45 = v5;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasTransitPass = %.2f", (uint8_t *)&v44, 0xCu);
      }

    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 29))
  {
    ++v9;
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 29);
    if (v10 != 0.0)
    {
      GEOConfigGetDouble();
      v5 = v5 + v11;
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v44 = 134217984;
        v45 = v5;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasFavoriteTransitPOI = %.2f", (uint8_t *)&v44, 0xCu);
      }

    }
  }
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 30))
  {
    ++v9;
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 30);
    if (v13 != 0.0)
    {
      GEOConfigGetDouble();
      v5 = v5 + v14;
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v44 = 134217984;
        v45 = v5;
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasFavoriteTransitLine = %.2f", (uint8_t *)&v44, 0xCu);
      }

    }
  }
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 31))
  {
    ++v9;
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 31);
    if (v16 != 0.0)
    {
      GEOConfigGetDouble();
      v5 = v5 + v17;
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v44 = 134217984;
        v45 = v5;
        _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasRecentTransitRoute = %.2f", (uint8_t *)&v44, 0xCu);
      }

    }
  }
  if (-[MapsSuggestionsSignalPack hasType:](self->_signalPack, "hasType:", 32))
  {
    -[MapsSuggestionsSignalPack valueForSignalType:](self->_signalPack, "valueForSignalType:", 32);
    v20 = v19;
    GEOConfigGetDouble();
    if (v21 >= v20)
    {
      GEOConfigGetDouble();
    }
    else
    {
      GEOConfigGetDouble();
      v23 = v22;
      GEOConfigGetDouble();
      if (v23 + v24 <= v20 || (GEOConfigGetDouble(), v25 == 0.0))
      {
        GEOConfigGetDouble();
        v27 = v26;
        GEOConfigGetDouble();
        v29 = v27 * v28;
      }
      else
      {
        GEOConfigGetDouble();
        v38 = v20 - v37;
        GEOConfigGetDouble();
        v40 = 1.0 - v38 / v39;
        GEOConfigGetDouble();
        v42 = v41;
        GEOConfigGetDouble();
        v29 = v40 * (v42 * (1.0 - v43));
      }
    }
    ++v9;
    v5 = v5 + v29;
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v44 = 134217984;
      v45 = v5;
      _os_log_impl(&dword_1A427D000, v31, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeTimeSinceLastTransitRoute = %.2f", (uint8_t *)&v44, 0xCu);
    }

  }
  else if (!v9)
  {
    return MapsSuggestionsConfidenceDontKnow();
  }
  v32 = v5 / (double)(int)v9;
  GEOFindOrCreateLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v44 = 134218240;
    v45 = v32;
    v46 = 1024;
    v47 = v9;
    _os_log_impl(&dword_1A427D000, v33, OS_LOG_TYPE_DEBUG, "IsTransitUser: finalScore = %.2f, number of signals: %d", (uint8_t *)&v44, 0x12u);
  }

  GEOConfigGetDouble();
  v35 = v34;
  Integer = GEOConfigGetInteger();
  if (v32 >= v35)
  {
    if (Integer > v9)
      return MapsSuggestionsConfidenceLikelyTrue();
    return MapsSuggestionsConfidenceDefinitelyTrue();
  }
  if (Integer <= v9)
    return MapsSuggestionsConfidenceDefinitelyFalse();
  else
    return MapsSuggestionsConfidenceLikelyFalse();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalPack, 0);
}

@end
