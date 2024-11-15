@implementation MNSuggestedNavigationModeFinder

- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4
{
  return -[MNSuggestedNavigationModeFinder initWithRoute:context:ignoreDeviceNavigability:](self, "initWithRoute:context:ignoreDeviceNavigability:", a3, a4, 0);
}

- (MNSuggestedNavigationModeFinder)initWithRoute:(id)a3 context:(unint64_t)a4 ignoreDeviceNavigability:(BOOL)a5
{
  id v9;
  MNSuggestedNavigationModeFinder *v10;
  MNSuggestedNavigationModeFinder *v11;
  uint64_t v12;
  GEOCountryConfiguration *countryConfiguration;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNSuggestedNavigationModeFinder;
  v10 = -[MNSuggestedNavigationModeFinder init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_route, a3);
    v11->_context = a4;
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    countryConfiguration = v11->_countryConfiguration;
    v11->_countryConfiguration = (GEOCountryConfiguration *)v12;

    v11->_ignoreDeviceNavigability = a5;
  }

  return v11;
}

- (unint64_t)suggestedNavigationModeForLocation:(id)a3
{
  id v4;
  GEOComposedRoute *route;
  void *v6;
  NSObject *v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  unint64_t context;
  unsigned int v14;
  char v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  uint64_t v35;
  __CFString *v36;
  NSObject *v37;
  double v38;
  unsigned int v39;
  uint64_t v40;
  const char *v41;
  uint8_t buf[4];
  _BYTE v44[10];
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  route = self->_route;
  if (route)
  {
    -[GEOComposedRoute origin](route, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      MNGetMNSuggestedNavigationModeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v10 = "Returning \"None\" because route has no origin.";
        v11 = v7;
        v12 = 2;
LABEL_29:
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
LABEL_30:
      v9 = 0;
      goto LABEL_70;
    }
    if (-[GEOComposedRoute transportType](self->_route, "transportType") == 1)
    {
      MNGetMNSuggestedNavigationModeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Returning \"Stepping\" because route's transport type is transit.";
LABEL_6:
        v9 = 2;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_70:

        goto LABEL_71;
      }
      goto LABEL_69;
    }
    context = self->_context;
    if (context != 1)
    {
      if (!context)
      {
        if ((objc_msgSend(v6, "isCurrentLocation") & 1) == 0)
        {
          MNGetMNSuggestedNavigationModeLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Returning \"SteppingNoTracking\" because route's origin is not the current location for \"FastestRoute\" context.", buf, 2u);
          }
          v9 = 3;
          goto LABEL_70;
        }
        v14 = -[GEOComposedRoute transportType](self->_route, "transportType");
        if (v14 <= 3 && v14 != 1)
        {
          if ((-[GEOComposedRoute isNavigable](self->_route, "isNavigable") & 1) == 0)
          {
            MNGetMNSuggestedNavigationModeLog();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v8 = "Returning \"Stepping\" because route is not navigable for \"FastestRoute\" context.";
              goto LABEL_6;
            }
            goto LABEL_69;
          }
          v15 = -[GEOCountryConfiguration currentCountrySupportsNavigation](self->_countryConfiguration, "currentCountrySupportsNavigation");
          MNGetMNSuggestedNavigationModeLog();
          v7 = objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          if ((v15 & 1) == 0)
          {
            if (v16)
            {
              *(_WORD *)buf = 0;
              v8 = "Returning \"Stepping\" because the current device or country does not support navigation for \"Fastes"
                   "tRoute\" context.";
              goto LABEL_6;
            }
            goto LABEL_69;
          }
          if (v16)
          {
            *(_WORD *)buf = 0;
            v17 = "Returning \"TurnByTurn\" because route's origin is the current location for \"FastestRoute\" context.";
            v18 = v7;
            v19 = 2;
LABEL_52:
            _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
            goto LABEL_53;
          }
          goto LABEL_53;
        }
        MNGetMNSuggestedNavigationModeLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_69;
        v35 = -[GEOComposedRoute transportType](self->_route, "transportType");
        if (v35 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E61D84B8[(int)v35];
        }
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v44 = v36;
        v41 = "Returning \"Stepping\" because transport type \"%@\" does not support turn by turn for \"FastestRoute\" context.";
        goto LABEL_68;
      }
      MNGetMNSuggestedNavigationModeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v34 = self->_context;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v44 = v34;
        v10 = "Returning \"None\" because unknown context (%d) was specified.";
        v11 = v7;
        v12 = 8;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (!v4)
    {
      MNGetMNSuggestedNavigationModeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Returning \"Stepping\" because location is nil for \"CuratedOrCustomRoute\" context.";
        goto LABEL_6;
      }
LABEL_69:
      v9 = 2;
      goto LABEL_70;
    }
    objc_msgSend(v4, "coordinate");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v6, "coordinate");
    GEOCalculateDistance();
    v25 = v24;
    GEOConfigGetDouble();
    v27 = v26;
    if (v25 > v26)
    {
      if (!GEOConfigGetBOOL())
      {
LABEL_24:
        MNGetMNSuggestedNavigationModeLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v44 = (int)v25;
          *(_WORD *)&v44[4] = 1024;
          *(_DWORD *)&v44[6] = (int)v27;
          _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Returning \"NavigateToRoute\" because location exceeds distance threshold (%dm / %dm) to route origin for \"CuratedOrCustomRoute\" context.", buf, 0xEu);
        }
        v9 = 4;
        goto LABEL_70;
      }
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D274E8]), "initWithRoute:auditToken:", self->_route, 0);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:", v21, v23);
      objc_msgSend(v28, "matchToRouteWithLocation:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      GEOConfigGetDouble();
      if (!v30 || (v32 = v31, objc_msgSend(v30, "distanceFromRoute"), v33 > v32))
      {

        goto LABEL_24;
      }
      MNGetMNSuggestedNavigationModeLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v30, "distanceFromRoute");
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v44 = (int)v25;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = (int)v27;
        v45 = 1024;
        v46 = (int)v38;
        v47 = 1024;
        v48 = (int)v32;
        _os_log_impl(&dword_1B0AD7000, v37, OS_LOG_TYPE_DEFAULT, "Location exceeds distance threshold (%dm / %dm) from route origin, but still within threshold of custom route (%dm / %dm) to allow mid-route start.", buf, 0x1Au);
      }

    }
    v39 = -[GEOComposedRoute transportType](self->_route, "transportType");
    if (v39 <= 3 && v39 != 1)
    {
      if (self->_ignoreDeviceNavigability)
        goto LABEL_49;
      if ((-[GEOCountryConfiguration currentCountrySupportsNavigation](self->_countryConfiguration, "currentCountrySupportsNavigation") & 1) == 0)
      {
        MNGetMNSuggestedNavigationModeLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v8 = "Returning \"Stepping\" because the current device or country does not support navigation for \"CuratedOrC"
               "ustomRoute\" context.";
          goto LABEL_6;
        }
        goto LABEL_69;
      }
      if (self->_ignoreDeviceNavigability)
      {
LABEL_49:
        if ((-[GEOCountryConfiguration currentCountrySupportsNavigationIgnoringDevice](self->_countryConfiguration, "currentCountrySupportsNavigationIgnoringDevice") & 1) == 0)
        {
          MNGetMNSuggestedNavigationModeLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v8 = "Returning \"Stepping\" because the current country does not support navigation for \"CuratedOrCustomRoute\" context.";
            goto LABEL_6;
          }
          goto LABEL_69;
        }
      }
      MNGetMNSuggestedNavigationModeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v44 = (int)v25;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = (int)v27;
        v17 = "Returning \"TurnByTurn\" because location is within distance threshold (%dm / %dm) to route origin for \"C"
              "uratedOrCustomRoute\" context.";
        v18 = v7;
        v19 = 14;
        goto LABEL_52;
      }
LABEL_53:
      v9 = 1;
      goto LABEL_70;
    }
    MNGetMNSuggestedNavigationModeLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    v40 = -[GEOComposedRoute transportType](self->_route, "transportType");
    if (v40 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v40);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E61D84B8[(int)v40];
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v44 = v36;
    v41 = "Returning \"Stepping\" because transport type \"%@\" does not support turn by turn for \"CuratedOrCustomRoute\" context";
LABEL_68:
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);

    goto LABEL_69;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _route != ((void *)0)", buf, 2u);
  }
  v9 = 0;
LABEL_71:

  return v9;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (BOOL)ignoreDeviceNavigability
{
  return self->_ignoreDeviceNavigability;
}

- (void)setIgnoreDeviceNavigability:(BOOL)a3
{
  self->_ignoreDeviceNavigability = a3;
}

- (GEOCountryConfiguration)countryConfiguration
{
  return self->_countryConfiguration;
}

- (void)setCountryConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_countryConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
