@implementation CPRouteGuidance

- (CPRouteGuidance)init
{
  CPRouteGuidance *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPRouteGuidance;
  v2 = -[CPRouteGuidance init](&v4, sel_init);
  if (v2)
    +[CPAccNavUpdate resetUpdate:](CPAccNavUpdate, "resetUpdate:", v2);
  return v2;
}

- (CPRouteGuidance)initWithCoder:(id)a3
{
  id v4;
  CPRouteGuidance *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPRouteGuidance;
  v5 = -[CPRouteGuidance init](&v8, sel_init);
  if (v5)
  {
    +[CPAccNavUpdate decodeUpdate:withCoder:](CPAccNavUpdate, "decodeUpdate:withCoder:", v5, v4);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCPRouteGuidanceTimeRemainingToNextManeuver"));
    v5->_timeRemainingToNextManeuver = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  +[CPAccNavUpdate encodeUpdate:withCoder:](CPAccNavUpdate, "encodeUpdate:withCoder:", self, v4);
  -[CPRouteGuidance timeRemainingToNextManeuver](self, "timeRemainingToNextManeuver");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kCPRouteGuidanceTimeRemainingToNextManeuver"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CPAccNavUpdate copyUpdate:](CPAccNavUpdate, "copyUpdate:", self);
}

- (BOOL)isEqual:(id)a3
{
  return +[CPAccNavUpdate isUpdate:equalTo:](CPAccNavUpdate, "isUpdate:equalTo:", self, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CPRouteGuidance;
  -[CPRouteGuidance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavUpdate description:](CPAccNavUpdate, "description:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setCurrentManeuvers:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *currentManeuverIndexes;
  NSArray *currentManeuvers;

  v4 = (NSArray *)a3;
  -[NSArray valueForKey:](v4, "valueForKey:", CFSTR("index"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  currentManeuverIndexes = self->_currentManeuverIndexes;
  self->_currentManeuverIndexes = v5;

  currentManeuvers = self->_currentManeuvers;
  self->_currentManeuvers = v4;

}

- (void)setCurrentManeuverIndexes:(id)a3
{
  NSArray *currentManeuvers;
  id v6;

  objc_storeStrong((id *)&self->_currentManeuverIndexes, a3);
  v6 = a3;
  currentManeuvers = self->_currentManeuvers;
  self->_currentManeuvers = 0;

}

- (void)setCurrentLaneGuidance:(id)a3
{
  CPLaneGuidance *v4;
  CPLaneGuidance *currentLaneGuidance;

  v4 = (CPLaneGuidance *)a3;
  self->_currentLaneGuidanceIndex = -[CPLaneGuidance index](v4, "index");
  currentLaneGuidance = self->_currentLaneGuidance;
  self->_currentLaneGuidance = v4;

}

- (void)setCurrentLaneGuidanceIndex:(unsigned __int16)a3
{
  CPLaneGuidance *currentLaneGuidance;

  self->_currentLaneGuidanceIndex = a3;
  currentLaneGuidance = self->_currentLaneGuidance;
  self->_currentLaneGuidance = 0;

}

- (CPTravelEstimates)maneuverTravelEstimates
{
  CPTravelEstimates *v3;
  void *v4;
  void *v5;
  CPTravelEstimates *v6;

  v3 = [CPTravelEstimates alloc];
  -[CPRouteGuidance distanceRemainingToNextManeuver](self, "distanceRemainingToNextManeuver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPRouteGuidance distanceRemainingToNextManeuverDisplay](self, "distanceRemainingToNextManeuverDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPRouteGuidance timeRemainingToNextManeuver](self, "timeRemainingToNextManeuver");
  v6 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v3, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v5);

  return v6;
}

- (CPTravelEstimates)tripTravelEstimates
{
  CPTravelEstimates *v3;
  void *v4;
  void *v5;
  CPTravelEstimates *v6;

  v3 = [CPTravelEstimates alloc];
  -[CPRouteGuidance distanceRemaining](self, "distanceRemaining");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPRouteGuidance distanceRemainingDisplay](self, "distanceRemainingDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPRouteGuidance timeRemaining](self, "timeRemaining");
  v6 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v3, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v5);

  return v6;
}

- (unsigned)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(unsigned __int8)a3
{
  self->_guidanceState = a3;
}

- (int64_t)maneuverState
{
  return self->_maneuverState;
}

- (void)setManeuverState:(int64_t)a3
{
  self->_maneuverState = a3;
}

- (NSArray)currentRoadNameVariants
{
  return self->_currentRoadNameVariants;
}

- (void)setCurrentRoadNameVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void)setDestinationNameVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)estimatedTimeOfArrival
{
  return self->_estimatedTimeOfArrival;
}

- (void)setEstimatedTimeOfArrival:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedTimeOfArrival, a3);
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSMeasurement)distanceRemaining
{
  return self->_distanceRemaining;
}

- (void)setDistanceRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemaining, a3);
}

- (NSMeasurement)distanceRemainingDisplay
{
  return self->_distanceRemainingDisplay;
}

- (void)setDistanceRemainingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingDisplay, a3);
}

- (double)timeRemainingToNextManeuver
{
  return self->_timeRemainingToNextManeuver;
}

- (void)setTimeRemainingToNextManeuver:(double)a3
{
  self->_timeRemainingToNextManeuver = a3;
}

- (NSMeasurement)distanceRemainingToNextManeuver
{
  return self->_distanceRemainingToNextManeuver;
}

- (void)setDistanceRemainingToNextManeuver:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuver, a3);
}

- (NSMeasurement)distanceRemainingToNextManeuverDisplay
{
  return self->_distanceRemainingToNextManeuverDisplay;
}

- (void)setDistanceRemainingToNextManeuverDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuverDisplay, a3);
}

- (NSArray)currentManeuvers
{
  return self->_currentManeuvers;
}

- (unsigned)totalManeuverCount
{
  return self->_totalManeuverCount;
}

- (void)setTotalManeuverCount:(unsigned __int16)a3
{
  self->_totalManeuverCount = a3;
}

- (BOOL)beingShownInApp
{
  return self->_beingShownInApp;
}

- (void)setBeingShownInApp:(BOOL)a3
{
  self->_beingShownInApp = a3;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (unsigned)totalLaneGuidanceCount
{
  return self->_totalLaneGuidanceCount;
}

- (void)setTotalLaneGuidanceCount:(unsigned __int16)a3
{
  self->_totalLaneGuidanceCount = a3;
}

- (BOOL)laneGuidanceShowing
{
  return self->_laneGuidanceShowing;
}

- (void)setLaneGuidanceShowing:(BOOL)a3
{
  self->_laneGuidanceShowing = a3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)sourceSupportsRouteGuidance
{
  return self->_sourceSupportsRouteGuidance;
}

- (void)setSourceSupportsRouteGuidance:(BOOL)a3
{
  self->_sourceSupportsRouteGuidance = a3;
}

- (signed)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  self->_destinationTimeZoneOffsetMinutes = a3;
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
}

- (NSArray)currentManeuverIndexes
{
  return self->_currentManeuverIndexes;
}

- (unsigned)currentLaneGuidanceIndex
{
  return self->_currentLaneGuidanceIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentManeuverIndexes, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);
  objc_storeStrong((id *)&self->_currentManeuvers, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuverDisplay, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuver, 0);
  objc_storeStrong((id *)&self->_distanceRemainingDisplay, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_estimatedTimeOfArrival, 0);
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);
  objc_storeStrong((id *)&self->_currentRoadNameVariants, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_1 != -1)
    dispatch_once(&accNavParameters_onceToken_1, &__block_literal_global_13);
  return (NSArray *)(id)accNavParameters__accNavParameters_1;
}

void __51__CPRouteGuidance_CPAccNavUpdate__accNavParameters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[2];
  void *v117;
  _QWORD v118[2];
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[22];

  v127[20] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_componentID);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v106, "copySettingIsIntegerValue:", 1);
  v126 = v105;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v104, v103);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v102;
  NSStringFromSelector(sel_guidanceState);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v101, "copySettingEnumType:", 6);
  v125 = v100;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v125, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v99, v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v97;
  NSStringFromSelector(sel_maneuverState);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)objc_msgSend(v96, "copySettingEnumType:", 7);
  v124 = v95;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v94, v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v92;
  NSStringFromSelector(sel_currentRoadNameVariants);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 3);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v91, "copySettingHasVariants:", 1);
  v123 = v90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v89, v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v87, "copySettingCollectionGeneric:", objc_opt_class());
  v127[3] = v86;
  NSStringFromSelector(sel_destinationNameVariants);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v85, "copySettingHasVariants:", 1);
  v122 = v84;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v122, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v83, v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v81, "copySettingCollectionGeneric:", objc_opt_class());
  v127[4] = v80;
  NSStringFromSelector(sel_estimatedTimeOfArrival);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v79;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v121, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v78, v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v127[5] = v76;
  NSStringFromSelector(sel_timeRemaining);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 6);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v75, "copySettingIsTimeIntervalValue:", 1);
  v120 = v74;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v73, v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v127[6] = v71;
  NSStringFromSelector(sel_distanceRemaining);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 7);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1928], "meters");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v70, "copySettingDimension:", v69);
  v119 = v67;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v68, v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v127[7] = v65;
  NSStringFromSelector(sel_distanceRemainingDisplay);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v64;
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v63, "copySettingEnumType:", 5);
  v118[1] = v62;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v61, v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v127[8] = v59;
  NSStringFromSelector(sel_distanceRemainingToNextManeuver);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 10);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1928], "meters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v58, "copySettingDimension:", v57);
  v117 = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v117, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v56, v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v127[9] = v53;
  NSStringFromSelector(sel_distanceRemainingToNextManeuverDisplay);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v52;
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v51, "copySettingEnumType:", 5);
  v116[1] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v50, v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v127[10] = v47;
  NSStringFromSelector(sel_currentManeuverIndexes);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v46, "copySettingAccNavType:", 9);
  v115 = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v44, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v42, "copySettingCollectionGeneric:", objc_opt_class());
  v127[11] = v41;
  NSStringFromSelector(sel_totalManeuverCount);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v40, "copySettingIsIntegerValue:", 1);
  v114 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v38, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v127[12] = v36;
  NSStringFromSelector(sel_beingShownInApp);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v35, "copySettingIsBoolValue:", 1);
  v113 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v113, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v33, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v127[13] = v31;
  NSStringFromSelector(sel_currentLaneGuidanceIndex);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v30, "copySettingIsIntegerValue:", 1);
  v112 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v112, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v28, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v127[14] = v26;
  NSStringFromSelector(sel_totalLaneGuidanceCount);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v25, "copySettingIsIntegerValue:", 1);
  v111 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v111, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v23, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v127[15] = v21;
  NSStringFromSelector(sel_laneGuidanceShowing);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v20, "copySettingIsBoolValue:", 1);
  v110 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v110, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v18, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v127[16] = v16;
  NSStringFromSelector(sel_sourceName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v109, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v14, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v127[17] = v12;
  NSStringFromSelector(sel_sourceSupportsRouteGuidance);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 20);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "copySettingIsBoolValue:", 1);
  v108 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v11, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v127[18] = v3;
  NSStringFromSelector(sel_destinationTimeZoneOffsetMinutes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParamKey paramKey:](CPAccNavParamKey, "paramKey:", 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copySettingIsIntegerValue:", 1);
  v107 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v107, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavParam paramWithProperty:keys:](CPAccNavParam, "paramWithProperty:keys:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v127[19] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v127, 20);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)accNavParameters__accNavParameters_1;
  accNavParameters__accNavParameters_1 = v9;

}

+ (NSDictionary)accNavParametersIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPRouteGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_1 != -1)
    dispatch_once(&accNavParametersIndexed_onceToken_1, block);
  return (NSDictionary *)(id)accNavParametersIndexed__accNavParametersIndexed_1;
}

void __58__CPRouteGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParametersIndexedForUpdate:](CPAccNavUpdate, "accNavParametersIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_1;
  accNavParametersIndexed__accNavParametersIndexed_1 = v1;

}

+ (NSDictionary)accNavParameterKeysIndexed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CPRouteGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_1 != -1)
    dispatch_once(&accNavParameterKeysIndexed_onceToken_1, block);
  return (NSDictionary *)(id)accNavParameterKeysIndexed__accNavParameterKeysIndexed_1;
}

void __61__CPRouteGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:](CPAccNavUpdate, "accNavParameterKeysIndexedForUpdate:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_1;
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_1 = v1;

}

- (void)clearValueForKey:(id)a3
{
  +[CPAccNavUpdate update:resetValueForProperty:](CPAccNavUpdate, "update:resetValueForProperty:", self, a3);
}

- (CPRouteGuidance)routeGuidanceWithComponent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BE00BD8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRouteGuidance:component:", self, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE152B0]), "initWithComponent:accNavInfo:", v5, v8);
  return (CPRouteGuidance *)v9;
}

@end
