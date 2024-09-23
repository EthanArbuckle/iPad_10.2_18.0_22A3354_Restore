@implementation MNTrafficIncidentAlert

+ (id)validTrafficIncidentAlertsForMainRouteInfo:(id)a3 alternateRouteInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  char *v20;
  NSObject *v21;
  uint64_t v22;
  __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "etaRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v5;
  objc_msgSend(v5, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if ((v8 || (v10 = v9) != 0)
    && (objc_msgSend(v10, "geoTrafficBannerTexts"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = v9;
    v34 = v8;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      v35 = v7;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_msgSend(v16, "bannerStyle");
            if (v18 >= 8)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
              v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v19 = off_1E61D7F00[(int)v18];
            }
            objc_msgSend(v16, "bannerId");
            v20 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v43 = (const char *)v19;
            v44 = 2112;
            v45 = v20;
            _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_DEFAULT, "Received Dodgeball alert from server response: %@, %@", buf, 0x16u);

            v7 = v35;
          }

          switch(objc_msgSend(v16, "bannerStyle"))
          {
            case 0u:
              GEOFindOrCreateLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v43 = "+[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:]";
                v44 = 2080;
                v45 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
                v46 = 1024;
                v47 = 172;
                _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
              }

              GEOFindOrCreateLog();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_ERROR, "Dodgeball response has no banner style. This is a server error. Attempting to continue.", buf, 2u);
              }

              if (v6)
                v26 = 1;
              else
                v26 = 2;
              objc_msgSend(v16, "setBannerStyle:", v26);
              goto LABEL_33;
            case 1u:
            case 4u:
            case 7u:
              if (v6)
                goto LABEL_33;
              GEOFindOrCreateLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = objc_msgSend(v16, "bannerStyle");
                if (v22 >= 8)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
                  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v23 = off_1E61D7F00[(int)v22];
                }
                *(_DWORD *)buf = 138412290;
                v43 = (const char *)v23;
                _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Dodgeball response (%@) requires alternate route, but none was found.", buf, 0xCu);

              }
              v6 = 0;
              break;
            case 2u:
            case 5u:

              v6 = 0;
              goto LABEL_33;
            case 3u:
            case 6u:
LABEL_33:
              v21 = -[MNTrafficIncidentAlert _initWithGeoTrafficBannerText:mainRouteInfo:alternateRouteInfo:]([MNTrafficIncidentAlert alloc], "_initWithGeoTrafficBannerText:mainRouteInfo:alternateRouteInfo:", v16, v37, v6);
              objc_msgSend(v7, "addObject:", v21);
              break;
            default:
              GEOFindOrCreateLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v43 = "+[MNTrafficIncidentAlert validTrafficIncidentAlertsForMainRouteInfo:alternateRouteInfo:]";
                v44 = 2080;
                v45 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
                v46 = 1024;
                v47 = 183;
                _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
              }

              GEOFindOrCreateLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v28 = objc_msgSend(v16, "bannerStyle");
                if (v28 >= 8)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
                  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v29 = off_1E61D7F00[(int)v28];
                }
                *(_DWORD *)buf = 138412290;
                v43 = (const char *)v29;
                _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Dodgeball response returned a type that is not supported on the client yet (%@)", buf, 0xCu);

              }
              break;
          }

          ++v15;
        }
        while (v13 != v15);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        v13 = v30;
      }
      while (v30);
    }

    v31 = v7;
    v9 = v33;
    v8 = v34;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)buttonActionTitles
{
  return self->_buttonActionTitles;
}

- (NSArray)alertTitles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[GEOTrafficBannerText hasBannerLargeText](self->_geoTrafficBannerText, "hasBannerLargeText"))
    return (NSArray *)0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOTrafficBannerText bannerLargeText](self->_geoTrafficBannerText, "bannerLargeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlert _dynamicStringValues](self, "_dynamicStringValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 1, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)alertDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[GEOTrafficBannerText hasBannerSmallText](self->_geoTrafficBannerText, "hasBannerSmallText"))
    return (NSArray *)0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOTrafficBannerText bannerSmallText](self->_geoTrafficBannerText, "bannerSmallText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlert _dynamicStringValues](self, "_dynamicStringValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 1, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)spokenTexts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[GEOTrafficBannerText hasSpokenPrompt](self->_geoTrafficBannerText, "hasSpokenPrompt"))
    return (NSArray *)0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOTrafficBannerText spokenPrompt](self->_geoTrafficBannerText, "spokenPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrafficIncidentAlert _dynamicStringValues](self, "_dynamicStringValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v4, 0, 1, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (GEOComposedRoute)originalRoute
{
  return -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
}

- (GEOComposedRoute)alternateRoute
{
  return -[MNActiveRouteInfo route](self->_alternateRouteInfo, "route");
}

- (GEONavigabilityInfo)originalRouteNavigability
{
  void *v2;
  void *v3;

  -[MNActiveRouteInfo etaRoute](self->_mainRouteInfo, "etaRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigabilityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEONavigabilityInfo *)v3;
}

- (double)alertDisplayDuration
{
  double result;
  unint64_t alertType;

  result = self->_alertDisplayDuration;
  if (result <= 0.0)
  {
    alertType = self->_alertType;
    result = 978307200.0;
    if (alertType <= 7)
    {
      if (((1 << alertType) & 0x66) != 0)
      {
LABEL_5:
        GEOConfigGetDouble();
        return result;
      }
      if (((1 << alertType) & 0x90) != 0)
      {
        return 0.0;
      }
      else if (alertType == 3 && self->_isAutomaticReroute)
      {
        goto LABEL_5;
      }
    }
  }
  return result;
}

- (BOOL)defaultToNewRoute
{
  return -[GEOTrafficBannerText defaultToNewRoute](self->_geoTrafficBannerText, "defaultToNewRoute");
}

- (BOOL)isReroute
{
  return (self->_alertType > 6) | (0x18u >> self->_alertType) & 1;
}

- (int)acceptButtonDisplay
{
  return -[MNTrafficIncidentAlert _buttonDisplayForAlertAction:](self, "_buttonDisplayForAlertAction:", 2);
}

- (int)dismissButtonDisplay
{
  return -[MNTrafficIncidentAlert _buttonDisplayForAlertAction:](self, "_buttonDisplayForAlertAction:", 1);
}

- (int)_buttonDisplayForAlertAction:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MNTrafficIncidentAlert buttonActionTitles](self, "buttonActionTitles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "action") == a3)
        {
          v10 = objc_msgSend(v9, "buttonDisplay");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)acceptButtonTitle
{
  return -[MNTrafficIncidentAlert _buttonTitleForAlertAction:](self, "_buttonTitleForAlertAction:", 2);
}

- (id)dismissButtonTitle
{
  return -[MNTrafficIncidentAlert _buttonTitleForAlertAction:](self, "_buttonTitleForAlertAction:", 1);
}

- (id)_buttonTitleForAlertAction:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MNTrafficIncidentAlert buttonActionTitles](self, "buttonActionTitles", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "action") == a3)
        {
          objc_msgSend(v9, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateLocation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v4 = a3;
  if (self->_incidentCoordinate.offset >= 0.0)
  {
    v14 = v4;
    objc_msgSend(v4, "routeMatch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isGoodMatch");

    v4 = v14;
    if (v6)
    {
      objc_msgSend(v14, "routeMatch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "routeCoordinate");

      -[MNTrafficIncidentAlert originalRoute](self, "originalRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "distanceToEndFromRouteCoordinate:", v8);
      self->_distanceToDestination = v10;

      if (GEOPolylineCoordinateIsABeforeB())
      {
        -[MNTrafficIncidentAlert originalRoute](self, "originalRoute");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "routeMatch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "distanceFromPoint:toPoint:", objc_msgSend(v12, "routeCoordinate"), *(_QWORD *)&self->_incidentCoordinate);
        self->_distanceToIncident = v13;

      }
      else
      {
        self->_distanceToIncident = 0.0;
      }
      v4 = v14;
    }
  }
  else
  {
    self->_distanceToIncident = -1.0;
  }

}

- (void)updateAlertIDWithAlert:(id)a3
{
  NSData *v4;
  NSData *alertID;

  objc_msgSend(a3, "alertID");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  alertID = self->_alertID;
  self->_alertID = v4;

}

- (unint64_t)secondsSaved
{
  if (-[MNTrafficIncidentAlert isReroute](self, "isReroute")
    && -[GEOTrafficBannerText hasSecondsSaved](self->_geoTrafficBannerText, "hasSecondsSaved"))
  {
    return -[GEOTrafficBannerText secondsSaved](self->_geoTrafficBannerText, "secondsSaved");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int)previousBannerChange
{
  return -[GEOTrafficBannerText previousBannerChange](self->_geoTrafficBannerText, "previousBannerChange");
}

- (GEOPBTransitArtwork)artwork
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[GEOTrafficBannerText artworkOverride](self->_geoTrafficBannerText, "artworkOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEORouteIncident artwork](self->_incident, "artwork");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (GEOPBTransitArtwork *)v6;
}

- (id)_initWithGeoTrafficBannerText:(id)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  MNTrafficIncidentAlert *v12;
  uint64_t v13;
  NSData *alertID;
  void *v15;
  void *v16;
  uint64_t v17;
  NSData *etaResponseID;
  uint64_t v19;
  NSDate *alertDate;
  MNTrafficIncidentAlert *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MNTrafficIncidentAlert;
  v12 = -[MNTrafficIncidentAlert init](&v23, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v13 = objc_claimAutoreleasedReturnValue();
    alertID = v12->_alertID;
    v12->_alertID = (NSData *)v13;

    objc_msgSend(v10, "etaRoute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "etauResponseID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_geo_data");
    v17 = objc_claimAutoreleasedReturnValue();
    etaResponseID = v12->_etaResponseID;
    v12->_etaResponseID = (NSData *)v17;

    v12->_alertType = -[MNTrafficIncidentAlert _alertTypeForGeoBannerStyle:](v12, "_alertTypeForGeoBannerStyle:", objc_msgSend(v9, "bannerStyle"));
    objc_storeStrong((id *)&v12->_geoTrafficBannerText, a3);
    objc_storeStrong((id *)&v12->_mainRouteInfo, a4);
    objc_storeStrong((id *)&v12->_alternateRouteInfo, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    alertDate = v12->_alertDate;
    v12->_alertDate = (NSDate *)v19;

    v12->_isAutomaticReroute = GEOConfigGetBOOL();
    -[MNTrafficIncidentAlert _initRouteCoordinates](v12, "_initRouteCoordinates");
    v12->_distanceToIncident = -1.0;
    -[MNTrafficIncidentAlert _populateServerFields:](v12, "_populateServerFields:", v9);
    -[MNTrafficIncidentAlert _populateButtonActionAndTitles:](v12, "_populateButtonActionAndTitles:", v9);
    -[MNTrafficIncidentAlert _populateIncidentDetails:](v12, "_populateIncidentDetails:", v9);
    v21 = v12;
  }

  return v12;
}

- (void)_initRouteCoordinates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  double v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  MNTrafficIncidentTriggerRange *v24;
  MNTrafficIncidentTriggerRange *triggerRange;
  void *v26;
  MNTrafficIncidentTriggerRange *v27;
  MNTrafficIncidentTriggerRange *progressBarTriggerRange;
  void *v29;
  void *v30;
  char v31;
  MNRouteDivergenceFinder *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MNTrafficIncidentTriggerRange *v38;
  void *v39;
  MNTrafficIncidentTriggerPoint *v40;
  MNTrafficIncidentTriggerRange *v41;
  MNTrafficIncidentTriggerRange *v42;
  void *v43;
  void *v44;
  MNRouteDivergenceFinder *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  $604ECB7A8067A7300F159AE8ED6889F8 v50;
  MNActiveRouteInfo *alternateRouteInfo;
  void *v52;
  unsigned int v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  MNTrafficIncidentTriggerRange *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  MNTrafficIncidentTriggerRange *(*v67)(uint64_t, void *);
  void *v68;
  MNTrafficIncidentAlert *v69;
  id v70;
  uint8_t buf[16];

  -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNActiveRouteInfo etaRoute](self->_mainRouteInfo, "etaRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "legs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    -[MNActiveRouteInfo etaRoute](self->_mainRouteInfo, "etaRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9 - objc_msgSend(v11, "count");

    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "legs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v12 >= v15)
    {
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_ERROR, "Error finding leg index from which the ETAU request was made. Defaulting to first leg of route.", buf, 2u);
      }

    }
    else
    {
      -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "legs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v18;
    }
  }
  -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "distance");
  self->_distanceToDestination = v21;

  if (-[GEOTrafficBannerText hasTriggerRange](self->_geoTrafficBannerText, "hasTriggerRange"))
  {
    v65 = MEMORY[0x1E0C809B0];
    v66 = 3221225472;
    v67 = __47__MNTrafficIncidentAlert__initRouteCoordinates__block_invoke;
    v68 = &unk_1E61D7EE0;
    v69 = self;
    v70 = v5;
    v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0E364](&v65);
    -[GEOTrafficBannerText triggerRange](self->_geoTrafficBannerText, "triggerRange", v65, v66, v67, v68, v69);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v22)[2](v22, v23);
    v24 = (MNTrafficIncidentTriggerRange *)objc_claimAutoreleasedReturnValue();
    triggerRange = self->_triggerRange;
    self->_triggerRange = v24;

    -[GEOTrafficBannerText progressBarRange](self->_geoTrafficBannerText, "progressBarRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v22)[2](v22, v26);
    v27 = (MNTrafficIncidentTriggerRange *)objc_claimAutoreleasedReturnValue();
    progressBarTriggerRange = self->_progressBarTriggerRange;
    self->_progressBarTriggerRange = v27;

    self->_priority = -[GEOTrafficBannerText priority](self->_geoTrafficBannerText, "priority");
    self->_minDisplayTime = (double)-[GEOTrafficBannerText minDisplayTime](self->_geoTrafficBannerText, "minDisplayTime");
    self->_overlapDelayTime = (double)-[GEOTrafficBannerText overlapDelayTime](self->_geoTrafficBannerText, "overlapDelayTime");
    self->_persistAcrossUpdates = -[GEOTrafficBannerText preserveBannerInUpdates](self->_geoTrafficBannerText, "preserveBannerInUpdates");
    if (GEOConfigGetBOOL())
    {
      -[GEOTrafficBannerText bannerId](self->_geoTrafficBannerText, "bannerId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("MNIncidentAlert_FakeDodgeball"), "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "hasPrefix:", v30);

      if ((v31 & 1) == 0)
        self->_priority = GEOConfigGetUInteger();
    }
    -[MNTrafficIncidentTriggerRange hideTriggerPoint](self->_triggerRange, "hideTriggerPoint");
    v32 = (MNRouteDivergenceFinder *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      if (self->_progressBarTriggerRange || !-[MNTrafficIncidentAlert isReroute](self, "isReroute"))
      {
        v32 = 0;
      }
      else
      {
        if (!self->_alternateRouteInfo)
          goto LABEL_35;
        v32 = objc_alloc_init(MNRouteDivergenceFinder);
        -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNActiveRouteInfo route](self->_alternateRouteInfo, "route");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:andRoute:](v32, "findFirstDivergenceBetweenRoute:andRoute:", v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_msgSend(v36, "routeCoordinate");
        v38 = [MNTrafficIncidentTriggerRange alloc];
        -[MNTrafficIncidentTriggerRange showTriggerPoint](self->_triggerRange, "showTriggerPoint");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[MNTrafficIncidentTriggerPoint initWithReferenceCoordinate:allowsShifting:]([MNTrafficIncidentTriggerPoint alloc], "initWithReferenceCoordinate:allowsShifting:", v37, 0);
        -[MNTrafficIncidentTriggerRange displayTime](self->_triggerRange, "displayTime");
        v41 = -[MNTrafficIncidentTriggerRange initWithTriggerPointShow:hide:displayTime:](v38, "initWithTriggerPointShow:hide:displayTime:", v39, v40);
        v42 = self->_triggerRange;
        self->_triggerRange = v41;

      }
    }

LABEL_35:
    v60 = self->_progressBarTriggerRange;
    if (v60)
    {
      -[MNTrafficIncidentTriggerRange showTriggerPoint](v60, "showTriggerPoint");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "referenceCoordinate");
      -[MNTrafficIncidentTriggerRange showTriggerPoint](self->_triggerRange, "showTriggerPoint");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "referenceCoordinate");
      self->_shouldShowTimer = GEOPolylineCoordinateEqual();

      if (!self->_shouldShowTimer)
      {
LABEL_40:

        goto LABEL_41;
      }
      -[MNTrafficIncidentTriggerRange displayTime](self->_progressBarTriggerRange, "displayTime");
    }
    else
    {
      self->_shouldShowTimer = 0;
      v63 = 0.0;
    }
    self->_alertDisplayDuration = v63;
    goto LABEL_40;
  }
  self->_startValidCoordinateRange = 0;
  if (-[GEOTrafficBannerText hasShowAtDistance](self->_geoTrafficBannerText, "hasShowAtDistance"))
  {
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    self->_startValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v43, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v5, "endRouteCoordinate"), (double)-[GEOTrafficBannerText showAtDistance](self->_geoTrafficBannerText, "showAtDistance"));

  }
  -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  self->_endValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v44, "endRouteCoordinate");

  if (-[GEOTrafficBannerText hasHideAtDistance](self->_geoTrafficBannerText, "hasHideAtDistance"))
  {
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v45 = (MNRouteDivergenceFinder *)objc_claimAutoreleasedReturnValue();
    self->_endValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)-[MNRouteDivergenceFinder routeCoordinateForDistance:beforeRouteCoordinate:](v45, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v5, "endRouteCoordinate"), (double)-[GEOTrafficBannerText hideAtDistance](self->_geoTrafficBannerText, "hideAtDistance"));
LABEL_25:

    goto LABEL_26;
  }
  if (-[MNTrafficIncidentAlert isReroute](self, "isReroute") && self->_alternateRouteInfo)
  {
    v45 = objc_alloc_init(MNRouteDivergenceFinder);
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNActiveRouteInfo route](self->_alternateRouteInfo, "route");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:andRoute:](v45, "findFirstDivergenceBetweenRoute:andRoute:", v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v49, "routeCoordinate");
    if (GEOPolylineCoordinateIsValid())
      self->_endValidCoordinateRange = v50;

    goto LABEL_25;
  }
LABEL_26:
  alternateRouteInfo = self->_alternateRouteInfo;
  if (alternateRouteInfo)
  {
    -[MNActiveRouteInfo route](alternateRouteInfo, "route");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "pointCount") - 1;

  }
  else
  {
    v53 = 0;
  }
  self->_alternateEndValidCoordinateRange.index = v53;
  self->_alternateEndValidCoordinateRange.offset = 0.0;
  if (-[MNTrafficIncidentAlert isAutomaticReroute](self, "isAutomaticReroute") && self->_alternateRouteInfo)
  {
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "pointAtRouteCoordinate:", *(_QWORD *)&self->_endValidCoordinateRange);
    v56 = v55;
    v58 = v57;

    -[MNActiveRouteInfo route](self->_alternateRouteInfo, "route");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    self->_alternateEndValidCoordinateRange = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v59, "closestPointOnRoute:", v56, v58);

  }
  self->_shouldShowTimer = -[GEOTrafficBannerText shouldShowTimer](self->_geoTrafficBannerText, "shouldShowTimer");
  self->_alertDisplayDuration = (double)-[GEOTrafficBannerText alertDurationSeconds](self->_geoTrafficBannerText, "alertDurationSeconds");
LABEL_41:
  self->_incidentCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)*MEMORY[0x1E0D26A38];
  if (-[GEOTrafficBannerText hasIncidentDistance](self->_geoTrafficBannerText, "hasIncidentDistance"))
  {
    -[MNActiveRouteInfo route](self->_mainRouteInfo, "route");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    self->_incidentCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v64, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v5, "endRouteCoordinate"), (double)-[GEOTrafficBannerText incidentDistance](self->_geoTrafficBannerText, "incidentDistance"));

  }
}

MNTrafficIncidentTriggerRange *__47__MNTrafficIncidentAlert__initRouteCoordinates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MNTrafficIncidentTriggerPoint *v10;
  void *v11;
  uint64_t v12;
  MNTrafficIncidentTriggerPoint *v13;
  MNTrafficIncidentTriggerRange *v14;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "showAtPoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hideAtPoint");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "route");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(*(id *)(a1 + 40), "endRouteCoordinate"), (double)objc_msgSend(v5, "referenceOffsetCm") / 100.0);

      v10 = -[MNTrafficIncidentTriggerPoint initWithReferenceCoordinate:allowsShifting:]([MNTrafficIncidentTriggerPoint alloc], "initWithReferenceCoordinate:allowsShifting:", v9, objc_msgSend(v5, "allowsShifting"));
      if (v7)
      {
LABEL_4:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "route");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(*(id *)(a1 + 40), "endRouteCoordinate"), (double)objc_msgSend(v7, "referenceOffsetCm") / 100.0);

        v13 = -[MNTrafficIncidentTriggerPoint initWithReferenceCoordinate:allowsShifting:]([MNTrafficIncidentTriggerPoint alloc], "initWithReferenceCoordinate:allowsShifting:", v12, objc_msgSend(v7, "allowsShifting"));
LABEL_8:
        v14 = -[MNTrafficIncidentTriggerRange initWithTriggerPointShow:hide:displayTime:]([MNTrafficIncidentTriggerRange alloc], "initWithTriggerPointShow:hide:displayTime:", v10, v13, (double)objc_msgSend(v4, "displayTime"));

        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
      if (v6)
        goto LABEL_4;
    }
    v13 = 0;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)_alertTypeForGeoBannerStyle:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 < 8)
    return qword_1B0BF36A8[a3];
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[MNTrafficIncidentAlert _alertTypeForGeoBannerStyle:]";
    v10 = 2080;
    v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentAlert.m";
    v12 = 1024;
    v13 = 555;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
  }

  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "(%@) banner style not supported on client yet", buf, 0xCu);

  }
  return 0;
}

- (id)_dynamicStringValues
{
  id v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MNTrafficIncidentAlert distanceToIncident](self, "distanceToIncident");
  if (v4 >= 0.0)
  {
    -[MNTrafficIncidentAlert distanceToIncident](self, "distanceToIncident");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtpd_u64_f64(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("{distance}"));

  }
  if (-[MNTrafficIncidentAlert isReroute](self, "isReroute"))
  {
    v7 = -[MNTrafficIncidentAlert secondsSaved](self, "secondsSaved");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("{duration}"));

    }
  }
  if (objc_msgSend(v3, "count"))
    v9 = v3;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *bannerID;
  void *v18;
  void *v19;
  void *v20;

  -[MNTrafficIncidentAlert originalRoute](self, "originalRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointAtRouteCoordinate:", *(_QWORD *)&self->_startValidCoordinateRange);
  v5 = v4;
  v7 = v6;

  -[MNTrafficIncidentAlert originalRoute](self, "originalRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointAtRouteCoordinate:", *(_QWORD *)&self->_endValidCoordinateRange);
  v10 = v9;
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0CB37A0];
  if (self->_triggerRange)
  {
    -[MNTrafficIncidentAlert _stringForAlertType:](self, "_stringForAlertType:", self->_alertType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForData:", self->_alertID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@ (%@) | minDisplayTime: %lf | overlapDelayTime: %lf | priority: %d | triggerRange: %@ | progressBarTriggerRange: %@ | [%@]"), v14, v15, self->_bannerID, *(_QWORD *)&self->_minDisplayTime, *(_QWORD *)&self->_overlapDelayTime, self->_priority, self->_triggerRange, self->_progressBarTriggerRange, self->_analyticsMessage);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNTrafficIncidentAlert _stringForAlertType:](self, "_stringForAlertType:", self->_alertType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForData:", self->_alertID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    bannerID = self->_bannerID;
    GEOPolylineCoordinateAsShortString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsShortString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@ (%@) | [%@] (%f, %f) to [%@] (%f, %f) | [%@]"), v14, v15, bannerID, v18, v5, v7, v19, v10, v12, self->_analyticsMessage);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (GEOPolylineCoordinateIsValid())
  {
    GEOPolylineCoordinateAsShortString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" | Incident: [%@]"), v20);

  }
  return v16;
}

- (id)_stringForAlertType:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("None");
  else
    return off_1E61D7F40[a3 - 1];
}

- (MNTrafficIncidentAlert)initWithCoder:(id)a3
{
  id v4;
  MNTrafficIncidentAlert *v5;
  uint64_t v6;
  NSData *alertID;
  uint64_t v8;
  NSData *etaResponseID;
  uint64_t v10;
  GEOTrafficBannerText *geoTrafficBannerText;
  uint64_t v12;
  MNActiveRouteInfo *mainRouteInfo;
  uint64_t v14;
  MNActiveRouteInfo *alternateRouteInfo;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  MNTrafficIncidentTriggerRange *triggerRange;
  uint64_t v22;
  MNTrafficIncidentTriggerRange *progressBarTriggerRange;
  double v24;
  double v25;
  uint64_t v26;
  NSDate *alertDate;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *buttonActionTitles;
  uint64_t v35;
  NSString *analyticsMessage;
  double v37;
  uint64_t v38;
  NSString *bannerID;
  uint64_t v40;
  GEORouteIncident *incident;
  MNTrafficIncidentAlert *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MNTrafficIncidentAlert;
  v5 = -[MNTrafficIncidentAlert init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alertID"));
    v6 = objc_claimAutoreleasedReturnValue();
    alertID = v5->_alertID;
    v5->_alertID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_etaResponseID"));
    v8 = objc_claimAutoreleasedReturnValue();
    etaResponseID = v5->_etaResponseID;
    v5->_etaResponseID = (NSData *)v8;

    v5->_alertType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_alertType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoTrafficBannerText"));
    v10 = objc_claimAutoreleasedReturnValue();
    geoTrafficBannerText = v5->_geoTrafficBannerText;
    v5->_geoTrafficBannerText = (GEOTrafficBannerText *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mainRouteInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    mainRouteInfo = v5->_mainRouteInfo;
    v5->_mainRouteInfo = (MNActiveRouteInfo *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternateRouteInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    alternateRouteInfo = v5->_alternateRouteInfo;
    v5->_alternateRouteInfo = (MNActiveRouteInfo *)v14;

    v5->_startValidCoordinateRange.index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_startValidCoordinateRange.index"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startValidCoordinateRange.offset"));
    *(float *)&v16 = v16;
    v5->_startValidCoordinateRange.offset = *(float *)&v16;
    v5->_endValidCoordinateRange.index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_endValidCoordinateRange.index"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_endValidCoordinateRange.offset"));
    *(float *)&v17 = v17;
    v5->_endValidCoordinateRange.offset = *(float *)&v17;
    v5->_incidentCoordinate.index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_incidentCoordinate.index"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_incidentCoordinate.offset"));
    *(float *)&v18 = v18;
    v5->_incidentCoordinate.offset = *(float *)&v18;
    v5->_alternateEndValidCoordinateRange.index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_alternateEndValidCoordinateRange.index"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_alternateEndValidCoordinateRange.offset"));
    *(float *)&v19 = v19;
    v5->_alternateEndValidCoordinateRange.offset = *(float *)&v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_triggerRange"));
    v20 = objc_claimAutoreleasedReturnValue();
    triggerRange = v5->_triggerRange;
    v5->_triggerRange = (MNTrafficIncidentTriggerRange *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_progressBarTriggerRange"));
    v22 = objc_claimAutoreleasedReturnValue();
    progressBarTriggerRange = v5->_progressBarTriggerRange;
    v5->_progressBarTriggerRange = (MNTrafficIncidentTriggerRange *)v22;

    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_priority"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_minDisplayTime"));
    v5->_minDisplayTime = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_overlapDelayTime"));
    v5->_overlapDelayTime = v25;
    v5->_persistAcrossUpdates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_persistAcrossUpdates"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alertDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    alertDate = v5->_alertDate;
    v5->_alertDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceToIncident"));
    v5->_distanceToIncident = v28;
    v5->_isAutomaticReroute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAutomaticReroute"));
    v5->_shouldShowTimer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldShowTimer"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_alertDisplayDuration"));
    v5->_alertDisplayDuration = v29;
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("_buttonActionTitles"));
    v33 = objc_claimAutoreleasedReturnValue();
    buttonActionTitles = v5->_buttonActionTitles;
    v5->_buttonActionTitles = (NSArray *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_analyticsMessage"));
    v35 = objc_claimAutoreleasedReturnValue();
    analyticsMessage = v5->_analyticsMessage;
    v5->_analyticsMessage = (NSString *)v35;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_distanceToDestination"));
    v5->_distanceToDestination = v37;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bannerID"));
    v38 = objc_claimAutoreleasedReturnValue();
    bannerID = v5->_bannerID;
    v5->_bannerID = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_incident"));
    v40 = objc_claimAutoreleasedReturnValue();
    incident = v5->_incident;
    v5->_incident = (GEORouteIncident *)v40;

    v42 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *alertID;
  id v5;

  alertID = self->_alertID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alertID, CFSTR("_alertID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_etaResponseID, CFSTR("_etaResponseID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alertType, CFSTR("_alertType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoTrafficBannerText, CFSTR("_geoTrafficBannerText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainRouteInfo, CFSTR("_mainRouteInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateRouteInfo, CFSTR("_alternateRouteInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_startValidCoordinateRange.index, CFSTR("_startValidCoordinateRange.index"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_startValidCoordinateRange.offset"), self->_startValidCoordinateRange.offset);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endValidCoordinateRange.index, CFSTR("_endValidCoordinateRange.index"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_endValidCoordinateRange.offset"), self->_endValidCoordinateRange.offset);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_incidentCoordinate.index, CFSTR("_incidentCoordinate.index"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_incidentCoordinate.offset"), self->_incidentCoordinate.offset);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_alternateEndValidCoordinateRange.index, CFSTR("_alternateEndValidCoordinateRange.index"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_alternateEndValidCoordinateRange.offset"), self->_alternateEndValidCoordinateRange.offset);
  objc_msgSend(v5, "encodeObject:forKey:", self->_triggerRange, CFSTR("_triggerRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_progressBarTriggerRange, CFSTR("_progressBarTriggerRange"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("_priority"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_minDisplayTime"), self->_minDisplayTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_overlapDelayTime"), self->_overlapDelayTime);
  objc_msgSend(v5, "encodeBool:forKey:", self->_persistAcrossUpdates, CFSTR("_persistAcrossUpdates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alertDate, CFSTR("_alertDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceToIncident"), self->_distanceToIncident);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAutomaticReroute, CFSTR("_isAutomaticReroute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldShowTimer, CFSTR("_shouldShowTimer"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_alertDisplayDuration"), self->_alertDisplayDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonActionTitles, CFSTR("_buttonActionTitles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsMessage, CFSTR("_analyticsMessage"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distanceToDestination"), self->_distanceToDestination);
  objc_msgSend(v5, "encodeObject:forKey:", self->_bannerID, CFSTR("_bannerID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incident, CFSTR("_incident"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_populateServerFields:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *bannerDescription;
  NSString *v9;
  NSString *bannerID;
  NSData *v11;
  NSData *eventInfo;
  NSString *v13;
  NSString *analyticsMessage;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "bannerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_stringForServerFormattedString:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  bannerDescription = self->_bannerDescription;
  self->_bannerDescription = v7;

  objc_msgSend(v4, "bannerId");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  bannerID = self->_bannerID;
  self->_bannerID = v9;

  objc_msgSend(v4, "eventInfo");
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  eventInfo = self->_eventInfo;
  self->_eventInfo = v11;

  objc_msgSend(v4, "analyticsMessageValue");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  analyticsMessage = self->_analyticsMessage;
  self->_analyticsMessage = v13;

  if (!self->_bannerID)
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138477827;
      v17 = v4;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "Received a traffic banner text which is missing a banner ID: %{private}@", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)_populateButtonActionAndTitles:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  MNButtonActionTitle *v11;
  uint64_t v12;
  void *v13;
  MNButtonActionTitle *v14;
  uint64_t v15;
  NSArray *buttonActionTitles;
  MNTrafficIncidentAlert *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = self;
  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasAction", v17) && objc_msgSend(v10, "hasText"))
        {
          v11 = [MNButtonActionTitle alloc];
          v12 = (int)objc_msgSend(v10, "action");
          objc_msgSend(v10, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[MNButtonActionTitle initWithAction:withTitle:buttonDisplay:](v11, "initWithAction:withTitle:buttonDisplay:", v12, v13, objc_msgSend(v10, "buttonDisplay"));

          objc_msgSend(v4, "addObject:", v14);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v15 = objc_msgSend(v4, "copy");
  buttonActionTitles = v17->_buttonActionTitles;
  v17->_buttonActionTitles = (NSArray *)v15;

}

- (void)_populateIncidentDetails:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  GEORouteIncident *v7;
  GEORouteIncident *incident;
  id v9;

  if (-[GEOTrafficBannerText hasIncidentIndex](self->_geoTrafficBannerText, "hasIncidentIndex", a3))
  {
    v4 = -[GEOTrafficBannerText incidentIndex](self->_geoTrafficBannerText, "incidentIndex");
    -[MNActiveRouteInfo traffic](self->_mainRouteInfo, "traffic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeIncidents");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") > (unint64_t)v4)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "incident");
      v7 = (GEORouteIncident *)objc_claimAutoreleasedReturnValue();
      incident = self->_incident;
      self->_incident = v7;

    }
  }
}

- (NSData)alertID
{
  return self->_alertID;
}

- (NSData)etaResponseID
{
  return self->_etaResponseID;
}

- (NSString)bannerID
{
  return self->_bannerID;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (BOOL)shouldShowTimer
{
  return self->_shouldShowTimer;
}

- (void)setShouldShowTimer:(BOOL)a3
{
  self->_shouldShowTimer = a3;
}

- (NSString)bannerDescription
{
  return self->_bannerDescription;
}

- (double)distanceToIncident
{
  return self->_distanceToIncident;
}

- (void)setDistanceToIncident:(double)a3
{
  self->_distanceToIncident = a3;
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (MNActiveRouteInfo)mainRouteInfo
{
  return self->_mainRouteInfo;
}

- (MNActiveRouteInfo)alternateRouteInfo
{
  return self->_alternateRouteInfo;
}

- ($212C09783140BCCD23384160D545CE0D)incidentCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_incidentCoordinate;
}

- ($212C09783140BCCD23384160D545CE0D)startValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startValidCoordinateRange;
}

- ($212C09783140BCCD23384160D545CE0D)endValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_endValidCoordinateRange;
}

- ($212C09783140BCCD23384160D545CE0D)alternateEndValidCoordinateRange
{
  return ($212C09783140BCCD23384160D545CE0D)self->_alternateEndValidCoordinateRange;
}

- (MNTrafficIncidentTriggerRange)triggerRange
{
  return self->_triggerRange;
}

- (MNTrafficIncidentTriggerRange)progressBarTriggerRange
{
  return self->_progressBarTriggerRange;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)minDisplayTime
{
  return self->_minDisplayTime;
}

- (double)overlapDelayTime
{
  return self->_overlapDelayTime;
}

- (BOOL)persistAcrossUpdates
{
  return self->_persistAcrossUpdates;
}

- (NSDate)alertDate
{
  return self->_alertDate;
}

- (void)setAlertDisplayDuration:(double)a3
{
  self->_alertDisplayDuration = a3;
}

- (BOOL)isAutomaticReroute
{
  return self->_isAutomaticReroute;
}

- (NSString)analyticsMessage
{
  return self->_analyticsMessage;
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  self->_distanceToDestination = a3;
}

- (NSData)eventInfo
{
  return self->_eventInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_alertDate, 0);
  objc_storeStrong((id *)&self->_progressBarTriggerRange, 0);
  objc_storeStrong((id *)&self->_triggerRange, 0);
  objc_storeStrong((id *)&self->_alternateRouteInfo, 0);
  objc_storeStrong((id *)&self->_mainRouteInfo, 0);
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_bannerDescription, 0);
  objc_storeStrong((id *)&self->_bannerID, 0);
  objc_storeStrong((id *)&self->_etaResponseID, 0);
  objc_storeStrong((id *)&self->_alertID, 0);
  objc_storeStrong((id *)&self->_analyticsMessage, 0);
  objc_storeStrong((id *)&self->_buttonActionTitles, 0);
  objc_storeStrong((id *)&self->_geoTrafficBannerText, 0);
}

- (double)newEstimatedTime
{
  void *v2;
  double v3;

  -[MNActiveRouteInfo route](self->_alternateRouteInfo, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)objc_msgSend(v2, "expectedTime");

  return v3;
}

- (double)oldEstimatedTime
{
  void *v2;
  double v3;
  double v4;

  -[MNActiveRouteInfo etaRoute](self->_mainRouteInfo, "etaRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "travelDuration");
  v4 = v3;

  return v4;
}

- (double)oldHistoricTime
{
  void *v2;
  double v3;
  double v4;

  -[MNActiveRouteInfo etaRoute](self->_mainRouteInfo, "etaRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historicTravelDuration");
  v4 = v3;

  return v4;
}

- (NSMutableArray)oldRouteIncidents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MNActiveRouteInfo traffic](self->_mainRouteInfo, "traffic", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeIncidents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v7)
        {
          v11 = (void *)MEMORY[0x1E0C99DE8];
          -[MNActiveRouteInfo traffic](self->_mainRouteInfo, "traffic");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeIncidents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v10, "incident");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v10, "incident");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return (NSMutableArray *)v7;
}

+ (id)createFakeTrafficBannerTextWithType:(unint64_t)a3 mainRouteInfo:(id)a4 alternateRouteInfo:(id)a5 incidentDistance:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  void *v18;
  __CFString *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  int v24;
  uint64_t *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  int BOOL;
  unint64_t v40;
  uint64_t Integer;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v51;
  id v52;

  v6 = *(_QWORD *)&a6;
  v52 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D275E8]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MNIncidentAlert_FakeDodgeball"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBannerId:", v14);

  objc_msgSend(v10, "setIncidentDistance:", v6);
  v15 = 0x1E0D27000uLL;
  v16 = objc_alloc_init(MEMORY[0x1E0D275F0]);
  objc_msgSend(v16, "setAction:", 1);
  v17 = objc_alloc_init(MEMORY[0x1E0D270C0]);
  objc_msgSend(v16, "setText:", v17);

  objc_msgSend(v16, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addFormatString:", CFSTR("Dismiss"));

  objc_msgSend(v10, "addButton:", v16);
  v19 = 0;
  v20 = a3 - 1;
  v21 = 0;
  v22 = 0;
  switch(v20)
  {
    case 0uLL:
      if (v9)
        v19 = CFSTR("Road closed ahead. I-280 N at Hwy 84. Your route has been updated.");
      else
        v19 = CFSTR("Road closed ahead. I-280 N at Hwy 84.");
      if (v9)
        v21 = CFSTR("I-280 N at Hwy 84\nYour route has been updated (debug)");
      else
        v21 = CFSTR("I-280 N at Hwy 84 (debug)");
      objc_msgSend(v10, "setBannerStyle:", 3);
      v22 = CFSTR("Road Closed Ahead");
      break;
    case 1uLL:
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_msgSend(v10, "incidentDistance");
      v25 = &qword_1B0BF3000;
      LODWORD(v25) = llround((double)(v24 + 200) * 0.000621371192);
      objc_msgSend(v23, "stringWithFormat:", CFSTR("In about %d miles, I-280 N\nYou're still on the fastest route. (debug)"), v25);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBannerStyle:", 2);
      v22 = CFSTR("Accident Ahead");
      v19 = CFSTR("There are unexpected delays ahead in 2 miles.");
      break;
    case 2uLL:
      objc_msgSend(v52, "route");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "expectedTime");
      objc_msgSend(v9, "route");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27 - objc_msgSend(v28, "expectedTime");

      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_spokenStringWithSeconds:abbreviated:", v29, 0);
      v51 = v9;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Save %@"), v30);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v51, "route");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("Via %@ (debug)"), v33);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There are unexpected delays ahead. You can save %@ by taking a different route."), v30);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBannerStyle:", 1);
      objc_msgSend(v16, "text");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "clearFormatStrings");

      objc_msgSend(v16, "text");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addFormatString:", CFSTR("No Thanks"));

      v36 = objc_alloc_init(MEMORY[0x1E0D275F0]);
      objc_msgSend(v36, "setAction:", 2);
      v37 = objc_alloc_init(MEMORY[0x1E0D270C0]);
      objc_msgSend(v36, "setText:", v37);

      objc_msgSend(v36, "text");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addFormatString:", CFSTR("OK"));

      objc_msgSend(v10, "addButton:", v36);
      objc_msgSend(v10, "setDefaultButtonIndex:", 1);

      v15 = 0x1E0D27000;
      v9 = v51;
      break;
    case 3uLL:
      break;
    case 4uLL:
      objc_msgSend(v10, "setBannerStyle:", 6);
      v22 = CFSTR("Low battery charge");
      v21 = CFSTR("There are no charging stations nearby, you're stranded. (debug)");
      v19 = CFSTR("There are no charging stations nearby, you're stranded.");
      break;
    case 5uLL:
      objc_msgSend(v10, "setBannerStyle:", 2);
      v22 = CFSTR("Restricted Zone Ahead");
      v21 = CFSTR("Vehicles with minimum petrol standard Euro 2, Diesel 5 or a day pass are allowed. (debug)");
      v19 = CFSTR("Restricted Zone Ahead. Vehicles with minimum petrol standard Euro 2, Diesel 5 or a day pass are allowed. (debug)");
      break;
    case 6uLL:
      objc_msgSend(v10, "setBannerStyle:", 7);
      v19 = 0;
      v21 = 0;
      v22 = 0;
      break;
    default:
      v21 = 0;
      v22 = 0;
      break;
  }
  BOOL = GEOConfigGetBOOL();
  if (v20 <= 1 && BOOL)
  {
    v40 = v15;
    Integer = GEOConfigGetInteger();
    objc_msgSend(v16, "setButtonDisplay:", Integer);
    v42 = objc_alloc_init(MEMORY[0x1E0D270C0]);
    objc_msgSend(v16, "setText:", v42);

    objc_msgSend(v16, "text");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addFormatString:", CFSTR("Cleared"));

    v44 = objc_alloc_init(*(Class *)(v40 + 1520));
    objc_msgSend(v44, "setButtonDisplay:", Integer);
    objc_msgSend(v44, "setAction:", 2);
    v45 = objc_alloc_init(MEMORY[0x1E0D270C0]);
    objc_msgSend(v44, "setText:", v45);

    objc_msgSend(v44, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addFormatString:", CFSTR("Still There"));

    objc_msgSend(v10, "addButton:", v44);
    objc_msgSend(v10, "setDefaultButtonIndex:", 1);

  }
  if (v22)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0D270C0]);
    objc_msgSend(v47, "addFormatString:", v22);
    +[MNTrafficIncidentAlert _addDebugArguments:](MNTrafficIncidentAlert, "_addDebugArguments:", v47);
    objc_msgSend(v10, "setBannerLargeText:", v47);

  }
  if (v21)
  {
    v48 = objc_alloc_init(MEMORY[0x1E0D270C0]);
    objc_msgSend(v48, "addFormatString:", v21);
    +[MNTrafficIncidentAlert _addDebugArguments:](MNTrafficIncidentAlert, "_addDebugArguments:", v48);
    objc_msgSend(v10, "setBannerSmallText:", v48);

  }
  if (v19)
  {
    v49 = objc_alloc_init(MEMORY[0x1E0D270C0]);
    objc_msgSend(v49, "addFormatString:", v19);
    +[MNTrafficIncidentAlert _addDebugArguments:](MNTrafficIncidentAlert, "_addDebugArguments:", v49);
    objc_msgSend(v10, "setSpokenPrompt:", v49);

  }
  return v10;
}

+ (void)_addDebugArguments:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D270B8];
  v4 = a3;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setToken:", CFSTR("{distance}"));
  objc_msgSend(v6, "setFormat:", 1);
  objc_msgSend(v6, "setValInt1:", 5000);
  objc_msgSend(v4, "addFormatArgument:", v6);
  v5 = objc_alloc_init(MEMORY[0x1E0D270B8]);
  objc_msgSend(v5, "setToken:", CFSTR("{time}"));
  objc_msgSend(v5, "setFormat:", 2);
  objc_msgSend(v5, "setValInt1:", 5000);
  objc_msgSend(v4, "addFormatArgument:", v5);

}

@end
