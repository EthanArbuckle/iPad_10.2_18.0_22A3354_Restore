@implementation CPNavigationSession

- (CPNavigationSession)initWithTrip:(id)a3 mapTemplate:(id)a4
{
  id v7;
  id v8;
  CPNavigationSession *v9;
  CPNavigationSession *v10;
  NAFuture *v11;
  NAFuture *navigationSessionManagerFuture;
  NSMutableArray *v13;
  NSMutableArray *maneuvers;
  NSMutableArray *v15;
  NSMutableArray *laneGuidances;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CPNavigationSession;
  v9 = -[CPNavigationSession init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trip, a3);
    objc_storeWeak((id *)&v10->_mapTemplate, v8);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    navigationSessionManagerFuture = v10->_navigationSessionManagerFuture;
    v10->_navigationSessionManagerFuture = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    maneuvers = v10->_maneuvers;
    v10->_maneuvers = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    laneGuidances = v10->_laneGuidances;
    v10->_laneGuidances = v15;

  }
  return v10;
}

- (id)_currentTripId
{
  void *v2;
  void *v3;

  -[CPNavigationSession trip](self, "trip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setManager:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_manager, a3);
  v5 = a3;
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v5);

}

- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description
{
  -[CPNavigationSession pauseTripForReason:description:turnCardColor:](self, "pauseTripForReason:description:turnCardColor:", reason, description, 0);
}

- (void)pauseTripForReason:(CPTripPauseReason)reason description:(NSString *)description turnCardColor:(UIColor *)turnCardColor
{
  NSString *v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;
  NSString *v12;
  id v13;
  _QWORD v14[4];
  NSString *v15;
  UIColor *v16;
  CPTripPauseReason v17;

  v8 = description;
  v9 = turnCardColor;
  -[CPNavigationSession setPauseReason:](self, "setPauseReason:", reason);
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__CPNavigationSession_pauseTripForReason_description_turnCardColor___block_invoke;
  v14[3] = &unk_24C77C918;
  v16 = v9;
  v17 = reason;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  v13 = (id)objc_msgSend(v10, "addSuccessBlock:", v14);

}

void __68__CPNavigationSession_pauseTripForReason_description_turnCardColor___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = a1[6];
  v6 = a1[4];
  v8 = v3;
  if (v4)
  {
    CPSanitizedBackgroundColor(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pauseTripForReason:description:turnCardColor:", v5, v6, v7);

  }
  else
  {
    objc_msgSend(v3, "pauseTripForReason:description:turnCardColor:", v5, v6, 0);
  }
  if (a1[6] == 4)
    objc_msgSend(v8, "startRerouting");

}

- (void)_updateManeuverIndiciesWithStartIndex:(unsigned __int16)a3 maneuvers:(id)a4
{
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4 = v10 + 1;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setIndex:", (unsigned __int16)v10++);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateLaneGuidanceIndiciesWithStartIndex:(unsigned __int16)a3 laneGuidances:(id)a4
{
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4 = v10 + 1;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setIndex:", (unsigned __int16)v10++);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)resumeTripWithUpdatedRouteInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CPNavigationSession *v19;
  id v20;

  v4 = a3;
  if (-[CPNavigationSession pauseReason](self, "pauseReason") != 4)
    -[CPNavigationSession clientTripNotPausedException](self, "clientTripNotPausedException");
  -[CPNavigationSession setPauseReason:](self, "setPauseReason:", 0);
  objc_msgSend(v4, "maneuvers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationSession _updateManeuverIndiciesWithStartIndex:maneuvers:](self, "_updateManeuverIndiciesWithStartIndex:maneuvers:", 0, v5);

  objc_msgSend(v4, "laneGuidances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationSession _updateLaneGuidanceIndiciesWithStartIndex:laneGuidances:](self, "_updateLaneGuidanceIndiciesWithStartIndex:laneGuidances:", 0, v6);

  -[CPNavigationSession trip](self, "trip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "destinationTimeZoneOffsetFromGMT");

  v9 = -[CPNavigationSession sendsNavigationMetadata](self, "sendsNavigationMetadata");
  -[CPNavigationSession currentRoadNameVariants](self, "currentRoadNameVariants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationSession destinationNameVariants](self, "destinationNameVariants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeInfoWithAccNavSupported:roadNameVariants:destinationNameVariants:timeZoneOffset:", v9, v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__CPNavigationSession_resumeTripWithUpdatedRouteInformation___block_invoke;
  v17[3] = &unk_24C77C940;
  v18 = v12;
  v19 = self;
  v20 = v4;
  v14 = v4;
  v15 = v12;
  v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v17);

}

void __61__CPNavigationSession_resumeTripWithUpdatedRouteInformation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "routeChangedWithReason:routeInfo:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "mapTemplate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "currentManeuvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "maneuverTravelEstimates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateBannerIfNecessaryForManeuver:travelEstimates:", v4, v5);

}

- (void)finishTrip
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[CPNavigationSession setPauseReason:](self, "setPauseReason:", 0);
  -[CPNavigationSession maneuvers](self, "maneuvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CPNavigationSession laneGuidances](self, "laneGuidances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addSuccessBlock:", &__block_literal_global_2);

}

uint64_t __33__CPNavigationSession_finishTrip__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishTrip");
}

- (void)cancelTrip
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[CPNavigationSession setPauseReason:](self, "setPauseReason:", 0);
  -[CPNavigationSession maneuvers](self, "maneuvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CPNavigationSession laneGuidances](self, "laneGuidances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addSuccessBlock:", &__block_literal_global_2);

}

uint64_t __33__CPNavigationSession_cancelTrip__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelTrip");
}

- (void)addManeuvers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[CPNavigationSession maneuvers](self, "maneuvers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CPNavigationSession maneuvers](self, "maneuvers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "index") + 1;

  }
  else
  {
    v8 = 0;
  }

  -[CPNavigationSession _updateManeuverIndiciesWithStartIndex:maneuvers:](self, "_updateManeuverIndiciesWithStartIndex:maneuvers:", v8, v4);
  -[CPNavigationSession maneuvers](self, "maneuvers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v4);

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __36__CPNavigationSession_addManeuvers___block_invoke;
  v13[3] = &unk_24C77C9A8;
  v14 = v4;
  v11 = v4;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v13);

}

uint64_t __36__CPNavigationSession_addManeuvers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addManeuvers:", *(_QWORD *)(a1 + 32));
}

- (void)addLaneGuidances:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[CPNavigationSession laneGuidances](self, "laneGuidances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CPNavigationSession laneGuidances](self, "laneGuidances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "index") + 1;

  }
  else
  {
    v8 = 0;
  }

  -[CPNavigationSession _updateLaneGuidanceIndiciesWithStartIndex:laneGuidances:](self, "_updateLaneGuidanceIndiciesWithStartIndex:laneGuidances:", v8, v4);
  -[CPNavigationSession laneGuidances](self, "laneGuidances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v4);

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__CPNavigationSession_addLaneGuidances___block_invoke;
  v13[3] = &unk_24C77C9A8;
  v14 = v4;
  v11 = v4;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v13);

}

uint64_t __40__CPNavigationSession_addLaneGuidances___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addLaneGuidances:", *(_QWORD *)(a1 + 32));
}

- (void)setUpcomingManeuvers:(NSArray *)upcomingManeuvers
{
  NSArray *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSArray *v18;
  id v19;
  _QWORD v20[4];
  NSArray *v21;
  id v22;
  CPNavigationSession *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = upcomingManeuvers;
  objc_storeStrong((id *)&self->_upcomingManeuvers, upcomingManeuvers);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        -[CPNavigationSession mapTemplate](self, "mapTemplate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_displayStyleForManeuver:", v12);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __44__CPNavigationSession_setUpcomingManeuvers___block_invoke;
  v20[3] = &unk_24C77C940;
  v21 = v7;
  v22 = v6;
  v23 = self;
  v17 = v6;
  v18 = v7;
  v19 = (id)objc_msgSend(v16, "addSuccessBlock:", v20);

}

void __44__CPNavigationSession_setUpcomingManeuvers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "showManeuvers:usingDisplayStyles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "mapTemplate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_postBannerIfNecessaryForManeuver:", v4);

  }
}

- (void)setCurrentLaneGuidance:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentLaneGuidance, a3);
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__CPNavigationSession_setCurrentLaneGuidance___block_invoke;
  v9[3] = &unk_24C77C9A8;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

}

uint64_t __46__CPNavigationSession_setCurrentLaneGuidance___block_invoke(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "setCurrentLaneGuidance:");
  else
    return objc_msgSend(a2, "clearCurrentLaneGuidance");
}

- (void)setCurrentRoadNameVariants:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentRoadNameVariants, a3);
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CPNavigationSession_setCurrentRoadNameVariants___block_invoke;
  v9[3] = &unk_24C77C9A8;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

}

uint64_t __50__CPNavigationSession_setCurrentRoadNameVariants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCurrentRoadNameVariants:", *(_QWORD *)(a1 + 32));
}

- (void)setManeuverState:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  self->_maneuverState = a3;
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CPNavigationSession_setManeuverState___block_invoke;
  v6[3] = &__block_descriptor_40_e39_v16__0___CPNavigationSessionManaging__8l;
  v6[4] = a3;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

uint64_t __40__CPNavigationSession_setManeuverState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setManeuverState:", *(_QWORD *)(a1 + 32));
}

- (void)updateTravelEstimates:(CPTravelEstimates *)estimates forManeuver:(CPManeuver *)maneuver
{
  CPTravelEstimates *v6;
  CPManeuver *v7;
  void *v8;
  CPManeuver *v9;
  CPTravelEstimates *v10;
  id v11;
  _QWORD v12[4];
  CPTravelEstimates *v13;
  CPManeuver *v14;
  CPNavigationSession *v15;

  v6 = estimates;
  v7 = maneuver;
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__CPNavigationSession_updateTravelEstimates_forManeuver___block_invoke;
  v12[3] = &unk_24C77C940;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v12);

}

void __57__CPNavigationSession_updateTravelEstimates_forManeuver___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "updateTravelEstimates:forManeuver:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "mapTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateBannerIfNecessaryForManeuver:travelEstimates:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  BOOL v7;

  self->_sendsNavigationMetadata = a3;
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__CPNavigationSession_setSendsNavigationMetadata___block_invoke;
  v6[3] = &__block_descriptor_33_e39_v16__0___CPNavigationSessionManaging__8l;
  v7 = a3;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v6);

}

uint64_t __50__CPNavigationSession_setSendsNavigationMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSendsNavigationMetadata:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDestinationNameVariants:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_destinationNameVariants, a3);
  -[CPNavigationSession navigationSessionManagerFuture](self, "navigationSessionManagerFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CPNavigationSession_setDestinationNameVariants___block_invoke;
  v9[3] = &unk_24C77C9A8;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

}

uint64_t __50__CPNavigationSession_setDestinationNameVariants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDestinationNameVariants:", *(_QWORD *)(a1 + 32));
}

- (void)clientTripNotPausedException
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_6);
}

void __51__CPNavigationSession_clientTripNotPausedException__block_invoke()
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Attempted to resume trip without pausing first."));
  exit(-1);
}

- (NSArray)upcomingManeuvers
{
  return self->_upcomingManeuvers;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (NSArray)currentRoadNameVariants
{
  return self->_currentRoadNameVariants;
}

- (int64_t)maneuverState
{
  return self->_maneuverState;
}

- (CPTrip)trip
{
  return self->_trip;
}

- (void)setTrip:(id)a3
{
  objc_storeStrong((id *)&self->_trip, a3);
}

- (CPMapTemplate)mapTemplate
{
  return (CPMapTemplate *)objc_loadWeakRetained((id *)&self->_mapTemplate);
}

- (void)setMapTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_mapTemplate, a3);
}

- (NAFuture)navigationSessionManagerFuture
{
  return self->_navigationSessionManagerFuture;
}

- (void)setNavigationSessionManagerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSessionManagerFuture, a3);
}

- (NSMutableArray)maneuvers
{
  return self->_maneuvers;
}

- (void)setManeuvers:(id)a3
{
  objc_storeStrong((id *)&self->_maneuvers, a3);
}

- (NSMutableArray)laneGuidances
{
  return self->_laneGuidances;
}

- (void)setLaneGuidances:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidances, a3);
}

- (unint64_t)pauseReason
{
  return self->_pauseReason;
}

- (void)setPauseReason:(unint64_t)a3
{
  self->_pauseReason = a3;
}

- (CPNavigationSessionManaging)manager
{
  return self->_manager;
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
  objc_storeStrong((id *)&self->_navigationSessionManagerFuture, 0);
  objc_destroyWeak((id *)&self->_mapTemplate);
  objc_storeStrong((id *)&self->_trip, 0);
  objc_storeStrong((id *)&self->_currentRoadNameVariants, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);
  objc_storeStrong((id *)&self->_upcomingManeuvers, 0);
}

@end
