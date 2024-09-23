@implementation GEORouteAttributes(MNExtras)

+ (id)defaultRouteAttributesForTransportType:()MNExtras
{
  void *v4;
  uint64_t BOOL;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D274A8], "defaultRouteAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainTransportType:", a3);
  if ((_DWORD)a3 == 1)
    BOOL = 0;
  else
    BOOL = GEOConfigGetBOOL();
  objc_msgSend(v4, "setIncludeRoutingPathLeg:", BOOL);
  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentCountrySupportsNavigation");

  if (!v7)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_navigation_isNavd");

  if (v9)
    +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  else
    +[MNNavigationService sharedService](MNNavigationService, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentVoiceLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneticLocaleIdentifier:", v11);

  objc_msgSend(v4, "phoneticLocaleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "+[GEORouteAttributes(MNExtras) defaultRouteAttributesForTransportType:]";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEORouteAttributes+MNExtras.m";
      v22 = 1024;
      v23 = 80;
      v24 = 2080;
      v25 = "attributes.phoneticLocaleIdentifier != nil";
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v18, 0x26u);
    }

  }
  objc_msgSend(v4, "setIncludeContingencyRoutes:", 1);
  objc_msgSend(v4, "setIncludePhonetics:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseMetricThreshold:", objc_msgSend(v13, "_navigation_distanceUsesMetricSystem"));

  if ((a3 - 2) < 2)
  {
LABEL_12:
    objc_msgSend(v4, "addUiContext:", 4);
LABEL_13:
    switch((int)a3)
    {
      case 0:
        v14 = objc_alloc_init(MEMORY[0x1E0D26F18]);
        objc_msgSend(v14, "setIncludeHistoricTravelTime:", 1);
        objc_msgSend(v14, "setTrafficType:", 3);
        objc_msgSend(v4, "setAutomobileOptions:", v14);
        goto LABEL_21;
      case 1:
        goto LABEL_15;
      case 2:
        v14 = objc_alloc_init(MEMORY[0x1E0D276F8]);
        objc_msgSend(v14, "setAvoidHills:", 0);
        objc_msgSend(v14, "setAvoidStairs:", 0);
        objc_msgSend(v14, "setAvoidBusyRoads:", 0);
        v15 = objc_alloc_init(MEMORY[0x1E0D276F0]);
        objc_msgSend(v15, "setWalkingUserPreferences:", v14);
        objc_msgSend(v4, "setWalkingOptions:", v15);
        goto LABEL_20;
      case 3:
        v14 = objc_alloc_init(MEMORY[0x1E0D27018]);
        objc_msgSend(v14, "setAvoidStairs:", 0);
        objc_msgSend(v14, "setAvoidHills:", 0);
        objc_msgSend(v14, "setAvoidBusyRoads:", 0);
        v15 = objc_alloc_init(MEMORY[0x1E0D27010]);
        objc_msgSend(v15, "setCyclingUserPreferences:", v14);
        objc_msgSend(v4, "setCyclingOptions:", v15);
LABEL_20:

        goto LABEL_21;
      default:
        goto LABEL_22;
    }
  }
  if ((_DWORD)a3 == 1)
  {
LABEL_15:
    v14 = objc_alloc_init(MEMORY[0x1E0D27600]);
    objc_msgSend(v14, "setPrioritization:", 0);
    if (GEOConfigGetBOOL())
      objc_msgSend(v14, "setRoutingBehavior:", 1);
    objc_msgSend(v4, "setTransitOptions:", v14);
LABEL_21:

  }
  else if (!(_DWORD)a3)
  {
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v4, "setRoutePointTypeForTransportType:", a3);
  return v4;
}

- (uint64_t)supportsDirections
{
  uint64_t result;
  int v3;
  unint64_t v4;

  if (objc_msgSend(a1, "mainTransportType") == 4)
    return 0;
  if ((objc_msgSend(a1, "includeRoutingPathLeg") & 1) != 0
    || (result = objc_msgSend(a1, "includeZilchPoints"), (_DWORD)result))
  {
    result = objc_msgSend(a1, "includeManeuverIcons");
    if ((_DWORD)result)
    {
      result = objc_msgSend(a1, "uiContextsCount");
      if (result)
      {
        v3 = 0;
        v4 = 0;
        do
          v3 |= 1 << (objc_msgSend(a1, "uiContextAtIndex:", v4++) - 1);
        while (v4 < objc_msgSend(a1, "uiContextsCount"));
        return (~v3 & 3) == 0;
      }
    }
  }
  return result;
}

- (uint64_t)supportsTurnByTurnNavigation
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;

  if (!objc_msgSend(a1, "supportsDirections"))
    return 0;
  objc_msgSend(a1, "phoneticLocaleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3 || !objc_msgSend(a1, "includePhonetics"))
    return 0;
  if (!objc_msgSend(a1, "uiContextsCount"))
    return 1;
  v4 = 0;
  do
  {
    v5 = objc_msgSend(a1, "uiContextAtIndex:", v4);
    v6 = (v5 >> 2) & 1;
    if ((v5 & 4) == 0)
      break;
    ++v4;
  }
  while (v4 < objc_msgSend(a1, "uiContextsCount"));
  return v6;
}

- (id)_vehicleSpecifications
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "automobileOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D26F18]);
    objc_msgSend(a1, "setAutomobileOptions:", v3);

  }
  objc_msgSend(a1, "automobileOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vehicleSpecifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D276C0]);
    objc_msgSend(a1, "automobileOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVehicleSpecifications:", v6);

  }
  objc_msgSend(a1, "automobileOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vehicleSpecifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_userPreferences
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "automobileOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D26F18]);
    objc_msgSend(a1, "setAutomobileOptions:", v3);

  }
  objc_msgSend(a1, "automobileOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D27688]);
    objc_msgSend(a1, "automobileOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserPreferences:", v6);

  }
  objc_msgSend(a1, "automobileOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
