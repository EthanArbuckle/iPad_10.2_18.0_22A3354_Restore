@implementation MNNavigationSessionState

- (MNNavigationSessionState)initWithLocation:(id)a3 currentRouteInfo:(id)a4 alternateRouteInfos:(id)a5 targetLegIndex:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  MNNavigationSessionState *v14;
  MNNavigationSessionState *v15;
  MNNavigationSessionState *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MNNavigationSessionState;
  v14 = -[MNNavigationSessionState init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_location, a3);
    objc_storeStrong((id *)&v15->_currentRouteInfo, a4);
    v15->_targetLegIndex = a6;
    v15->_upcomingAnchorPointIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v15->_alternateRouteInfos, a5);
    v16 = v15;
  }

  return v15;
}

- (void)updateCurrentRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_currentRouteInfo, a3);
  self->_lastRerouteReason = a4;
}

- (GEOComposedWaypoint)currentWaypoint
{
  MNActiveRouteInfo *currentRouteInfo;
  unint64_t targetLegIndex;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  currentRouteInfo = self->_currentRouteInfo;
  if (currentRouteInfo)
  {
    if (self->_targetLegIndex == 0x7FFFFFFFFFFFFFFFLL)
      targetLegIndex = 0;
    else
      targetLegIndex = self->_targetLegIndex;
    -[MNActiveRouteInfo route](currentRouteInfo, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "legs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (targetLegIndex >= v7)
    {
      objc_msgSend(v8, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "legs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", targetLegIndex);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }
  return (GEOComposedWaypoint *)v12;
}

- (GEOComposedWaypoint)destination
{
  void *v2;
  void *v3;

  -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypoint *)v3;
}

- (GEOComposedRouteLeg)targetLeg
{
  MNActiveRouteInfo *currentRouteInfo;
  unint64_t targetLegIndex;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  currentRouteInfo = self->_currentRouteInfo;
  if (!currentRouteInfo)
    goto LABEL_5;
  targetLegIndex = self->_targetLegIndex;
  -[MNActiveRouteInfo route](currentRouteInfo, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (targetLegIndex < v7)
  {
    -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", self->_targetLegIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  return (GEOComposedRouteLeg *)v10;
}

- (GEOComposedRouteLeg)nextLeg
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MNNavigationSessionState isOnLastLeg](self, "isOnLastLeg"))
  {
    v5 = 0;
  }
  else
  {
    -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", self->_targetLegIndex + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRouteLeg *)v5;
}

- (BOOL)isOnLastLeg
{
  unint64_t targetLegIndex;
  BOOL v3;
  void *v4;
  void *v5;

  targetLegIndex = self->_targetLegIndex;
  if (targetLegIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = targetLegIndex >= objc_msgSend(v5, "count") - 1;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MNNavigationSessionState *v4;
  uint64_t v5;
  NSArray *alternateRouteInfos;

  v4 = +[MNNavigationSessionState allocWithZone:](MNNavigationSessionState, "allocWithZone:", a3);
  objc_storeStrong((id *)&v4->_auditToken, self->_auditToken);
  objc_storeStrong((id *)&v4->_requestingAppIdentifier, self->_requestingAppIdentifier);
  objc_storeStrong((id *)&v4->_traits, self->_traits);
  v4->_initialRouteSource = self->_initialRouteSource;
  v4->_navigationState = self->_navigationState;
  objc_storeStrong((id *)&v4->_location, self->_location);
  objc_storeStrong((id *)&v4->_currentRouteInfo, self->_currentRouteInfo);
  v4->_lastRerouteReason = self->_lastRerouteReason;
  v5 = -[NSArray copy](self->_alternateRouteInfos, "copy");
  alternateRouteInfos = v4->_alternateRouteInfos;
  v4->_alternateRouteInfos = (NSArray *)v5;

  v4->_targetLegIndex = self->_targetLegIndex;
  v4->_upcomingAnchorPointIndex = self->_upcomingAnchorPointIndex;
  v4->_hasBeenOnRouteOnce = self->_hasBeenOnRouteOnce;
  v4->_arrivalState = self->_arrivalState;
  v4->_isDisplayingNavigationTray = self->_isDisplayingNavigationTray;
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t navigationState;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t arrivalState;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  MNNavigationSessionState *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  navigationState = self->_navigationState;
  v5 = 0x1E0CB3000uLL;
  if (navigationState >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_navigationState);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E61D7248[navigationState];
  }
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MNLocation coordinate](self->_location, "coordinate");
  v9 = v8;
  -[MNLocation coordinate](self->_location, "coordinate");
  v11 = v10;
  -[MNNavigationSessionState _locationStateAsString:](self, "_locationStateAsString:", -[MNLocation state](self->_location, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Location: %f, %f | (%@)"), v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MNActiveRouteInfo route](self->_currentRouteInfo, "route");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNActiveRouteInfo routeID](self->_currentRouteInfo, "routeID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Current route: %@ (%@)"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "addObject:", v18);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_alternateRouteInfos, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = self;
  v19 = self->_alternateRouteInfos;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v25 = v5;
        v26 = *(void **)(v5 + 2368);
        objc_msgSend(v24, "route");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "routeID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ (%@)"), v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v30);

        v5 = v25;
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v21);
  }

  v31 = *(void **)(v5 + 2368);
  objc_msgSend(v43, "componentsJoinedByString:", CFSTR(" | "));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("Alternate routes: %@"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v33);

  objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("Target leg index: %d"), v41->_targetLegIndex);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v34);

  arrivalState = v41->_arrivalState;
  if (arrivalState > 6)
    v36 = CFSTR("MNArrivalState_Unknown");
  else
    v36 = off_1E61D7290[arrivalState];
  objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("Arrival state: %@"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v37);

  objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("Displaying nav tray: %d"), v41->_isDisplayingNavigationTray);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v38);

  objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)_locationStateAsString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("On route");
  if (a3 == 2)
    v3 = CFSTR("Off route, on road");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Off route, off road");
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (int)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(int)a3
{
  self->_navigationState = a3;
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (unint64_t)lastRerouteReason
{
  return self->_lastRerouteReason;
}

- (NSArray)alternateRouteInfos
{
  return self->_alternateRouteInfos;
}

- (void)setAlternateRouteInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_targetLegIndex = a3;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setArrivalState:(int64_t)a3
{
  self->_arrivalState = a3;
}

- (BOOL)isDisplayingNavigationTray
{
  return self->_isDisplayingNavigationTray;
}

- (void)setIsDisplayingNavigationTray:(BOOL)a3
{
  self->_isDisplayingNavigationTray = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (int64_t)upcomingAnchorPointIndex
{
  return self->_upcomingAnchorPointIndex;
}

- (void)setUpcomingAnchorPointIndex:(int64_t)a3
{
  self->_upcomingAnchorPointIndex = a3;
}

- (BOOL)hasBeenOnRouteOnce
{
  return self->_hasBeenOnRouteOnce;
}

- (void)setHasBeenOnRouteOnce:(BOOL)a3
{
  self->_hasBeenOnRouteOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_alternateRouteInfos, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
