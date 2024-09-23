@implementation CPRouteInformation

- (CPRouteInformation)initWithManeuvers:(id)a3 laneGuidances:(id)a4 currentManeuvers:(id)a5 currentLaneGuidance:(id)a6 tripTravelEstimates:(id)a7 maneuverTravelEstimates:(id)a8
{
  id v15;
  id v16;
  id v17;
  CPRouteInformation *v18;
  CPRouteInformation *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CPRouteInformation;
  v18 = -[CPRouteInformation init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_maneuvers, a3);
    objc_storeStrong((id *)&v19->_laneGuidances, a4);
    objc_storeStrong((id *)&v19->_currentManeuvers, a5);
    objc_storeStrong((id *)&v19->_currentLaneGuidance, a6);
    objc_storeStrong((id *)&v19->_tripTravelEstimates, a7);
    objc_storeStrong((id *)&v19->_maneuverTravelEstimates, a8);
  }

  return v19;
}

- (id)routeInfoWithAccNavSupported:(BOOL)a3 roadNameVariants:(id)a4 destinationNameVariants:(id)a5 timeZoneOffset:(signed __int16)a6
{
  uint64_t v6;
  _BOOL4 v8;
  id v10;
  id v11;
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
  CPRouteInfo *v28;
  void *v29;
  void *v30;
  CPRouteInfo *v31;

  v6 = a6;
  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  -[CPRouteInformation currentManeuvers](self, "currentManeuvers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentManeuvers:", v13);

  -[CPRouteInformation currentLaneGuidance](self, "currentLaneGuidance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentLaneGuidance:", v14);

  if (v8)
  {
    objc_msgSend(v12, "setGuidanceState:", 1);
    -[CPRouteInformation tripTravelEstimates](self, "tripTravelEstimates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "distanceRemaining");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistanceRemaining:", v16);

    -[CPRouteInformation tripTravelEstimates](self, "tripTravelEstimates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "distanceRemainingToDisplay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistanceRemainingDisplay:", v18);

    -[CPRouteInformation tripTravelEstimates](self, "tripTravelEstimates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeRemaining");
    objc_msgSend(v12, "setTimeRemaining:");

    v20 = (void *)MEMORY[0x24BDBCE60];
    -[CPRouteInformation tripTravelEstimates](self, "tripTravelEstimates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeRemaining");
    objc_msgSend(v20, "dateWithTimeIntervalSinceNow:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEstimatedTimeOfArrival:", v22);

    -[CPRouteInformation maneuverTravelEstimates](self, "maneuverTravelEstimates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "distanceRemaining");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistanceRemainingToNextManeuver:", v24);

    -[CPRouteInformation maneuverTravelEstimates](self, "maneuverTravelEstimates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "distanceRemainingToDisplay");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistanceRemainingToNextManeuverDisplay:", v26);

    objc_msgSend(v12, "setCurrentRoadNameVariants:", v10);
    objc_msgSend(v12, "setDestinationNameVariants:", v11);
    objc_msgSend(v12, "setSourceSupportsRouteGuidance:", 1);
    objc_msgSend(v12, "setDestinationTimeZoneOffsetMinutes:", v6);
    -[CPRouteInformation currentLaneGuidance](self, "currentLaneGuidance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLaneGuidanceShowing:", v27 != 0);

  }
  v28 = [CPRouteInfo alloc];
  -[CPRouteInformation maneuvers](self, "maneuvers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPRouteInformation laneGuidances](self, "laneGuidances");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CPRouteInfo initWithRouteGuidance:maneuvers:laneGuidances:](v28, "initWithRouteGuidance:maneuvers:laneGuidances:", v12, v29, v30);

  return v31;
}

- (NSArray)maneuvers
{
  return self->_maneuvers;
}

- (NSArray)laneGuidances
{
  return self->_laneGuidances;
}

- (NSArray)currentManeuvers
{
  return self->_currentManeuvers;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (CPTravelEstimates)tripTravelEstimates
{
  return self->_tripTravelEstimates;
}

- (CPTravelEstimates)maneuverTravelEstimates
{
  return self->_maneuverTravelEstimates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverTravelEstimates, 0);
  objc_storeStrong((id *)&self->_tripTravelEstimates, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);
  objc_storeStrong((id *)&self->_currentManeuvers, 0);
  objc_storeStrong((id *)&self->_laneGuidances, 0);
  objc_storeStrong((id *)&self->_maneuvers, 0);
}

@end
