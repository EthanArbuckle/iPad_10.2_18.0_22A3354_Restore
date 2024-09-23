@implementation GEOComposedRouteLeg

- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 legIndex:(unint64_t)a5 origin:(id)a6 destination:(id)a7 arrivalParameters:(id)a8
{
  id v14;
  GEOComposedRouteLeg *v15;
  uint64_t v16;
  GEOWaypointInfo *geoOriginWaypointInfo;
  uint64_t v18;
  GEOWaypointInfo *geoDestinationWaypointInfo;
  uint64_t v20;
  NSData *serverLegIDForAnalytics;
  GEOComposedString *v22;
  id *v23;
  void *v24;
  uint64_t v25;
  GEOComposedString *originListInstruction;
  id *v27;
  void *v28;
  uint64_t v29;
  NSArray *originListSecondaryInstructions;
  GEOComposedString *v31;
  id *v32;
  void *v33;
  uint64_t v34;
  GEOComposedString *destinationListInstruction;
  id *v36;
  void *v37;
  uint64_t v38;
  NSArray *destinationListSecondaryInstructions;
  GEOComposedRouteLeg *v40;

  v14 = a4;
  v15 = -[GEOComposedRouteLeg initWithComposedRoute:legIndex:origin:destination:arrivalParameters:](self, "initWithComposedRoute:legIndex:origin:destination:arrivalParameters:", a3, a5, a6, a7, a8);
  if (v15)
  {
    v15->_drivingSide = objc_msgSend(v14, "drivingSide");
    objc_msgSend(v14, "originWaypointInfo");
    v16 = objc_claimAutoreleasedReturnValue();
    geoOriginWaypointInfo = v15->_geoOriginWaypointInfo;
    v15->_geoOriginWaypointInfo = (GEOWaypointInfo *)v16;

    objc_msgSend(v14, "destinationWaypointInfo");
    v18 = objc_claimAutoreleasedReturnValue();
    geoDestinationWaypointInfo = v15->_geoDestinationWaypointInfo;
    v15->_geoDestinationWaypointInfo = (GEOWaypointInfo *)v18;

    objc_msgSend(v14, "routeID");
    v20 = objc_claimAutoreleasedReturnValue();
    serverLegIDForAnalytics = v15->_serverLegIDForAnalytics;
    v15->_serverLegIDForAnalytics = (NSData *)v20;

    v22 = [GEOComposedString alloc];
    objc_msgSend(v14, "originListInstruction");
    v23 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEODrivingWalkingInstruction title](v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[GEOComposedString initWithGeoFormattedString:](v22, "initWithGeoFormattedString:", v24);
    originListInstruction = v15->_originListInstruction;
    v15->_originListInstruction = (GEOComposedString *)v25;

    objc_msgSend(v14, "originListInstruction");
    v27 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEODrivingWalkingInstruction normalCommands](v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_geo_compactMap:", &__block_literal_global_100);
    v29 = objc_claimAutoreleasedReturnValue();
    originListSecondaryInstructions = v15->_originListSecondaryInstructions;
    v15->_originListSecondaryInstructions = (NSArray *)v29;

    v31 = [GEOComposedString alloc];
    objc_msgSend(v14, "destinationListInstruction");
    v32 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEODrivingWalkingInstruction title](v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[GEOComposedString initWithGeoFormattedString:](v31, "initWithGeoFormattedString:", v33);
    destinationListInstruction = v15->_destinationListInstruction;
    v15->_destinationListInstruction = (GEOComposedString *)v34;

    objc_msgSend(v14, "destinationListInstruction");
    v36 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEODrivingWalkingInstruction normalCommands](v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_geo_compactMap:", &__block_literal_global_1);
    v38 = objc_claimAutoreleasedReturnValue();
    destinationListSecondaryInstructions = v15->_destinationListSecondaryInstructions;
    v15->_destinationListSecondaryInstructions = (NSArray *)v38;

    v40 = v15;
  }

  return v15;
}

GEOComposedString *__103__GEOComposedRouteLeg_initWithComposedRoute_geoRouteLeg_legIndex_origin_destination_arrivalParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

GEOComposedString *__103__GEOComposedRouteLeg_initWithComposedRoute_geoRouteLeg_legIndex_origin_destination_arrivalParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedString *v3;

  v2 = a2;
  v3 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v2);

  return v3;
}

- (GEOComposedRouteLeg)initWithComposedRoute:(id)a3 legIndex:(unint64_t)a4 origin:(id)a5 destination:(id)a6 arrivalParameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GEOComposedRouteLeg *v16;
  GEOComposedRouteLeg *v17;
  GEOComposedRouteLeg *v18;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedRouteLeg;
  v16 = -[GEOComposedRouteLeg init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_route, v12);
    v17->_legIndex = a4;
    objc_storeStrong((id *)&v17->_origin, a5);
    objc_storeStrong((id *)&v17->_destination, a6);
    objc_storeStrong((id *)&v17->_arrivalParameters, a7);
    v18 = v17;
  }

  return v17;
}

- (GEOComposedRouteLeg)nextLeg
{
  unint64_t v3;
  GEOComposedRoute **p_route;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = self->_legIndex + 1;
  p_route = &self->_route;
  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_route);
    objc_msgSend(v7, "legs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", self->_legIndex + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRouteLeg *)v9;
}

- (double)travelDuration
{
  unint64_t v3;
  double i;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = -[GEOComposedRouteLeg startStepIndex](self, "startStepIndex");
  for (i = 0.0; v3 <= -[GEOComposedRouteLeg endStepIndex](self, "endStepIndex"); ++v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_route);
    objc_msgSend(WeakRetained, "steps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    i = i + (double)objc_msgSend(v7, "duration");
  }
  return i;
}

- (unsigned)startPointIndex
{
  return self->_pointRange.location;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)-[GEOComposedRouteLeg startPointIndex](self, "startPointIndex");
}

- (unsigned)endPointIndex
{
  return LODWORD(self->_pointRange.length) + LODWORD(self->_pointRange.location) - 1;
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)-[GEOComposedRouteLeg endPointIndex](self, "endPointIndex");
}

- (unint64_t)pointCount
{
  return self->_pointRange.length;
}

- (unint64_t)startStepIndex
{
  return self->_stepRange.location;
}

- (unint64_t)endStepIndex
{
  return self->_stepRange.location + self->_stepRange.length - 1;
}

- (unint64_t)stepCount
{
  return self->_stepRange.length;
}

- (NSArray)segments
{
  NSUInteger v3;
  GEOComposedRoute **p_route;
  id WeakRetained;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v3 = self->_segmentRange.length + self->_segmentRange.location;
  p_route = &self->_route;
  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v3 > v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: NSMaxRange(_segmentRange) <= _route.segments.count", v12, 2u);
    }
    return (NSArray *)0;
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)p_route);
    objc_msgSend(v8, "segments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subarrayWithRange:", self->_segmentRange.location, self->_segmentRange.length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v10;
  }
}

- (void)setServerLegIDForAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_serverLegIDForAnalytics, a3);
}

- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "mutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chargingStationInfoForLegIndex:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[GEOComposedWaypoint chargingInfo](self->_destination, "chargingInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (GEOComposedRouteEVChargingStationInfo *)v7;
}

- (GEOComposedWaypointDisplayInfo)originDisplayInfo
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "mutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originDisplayInfoForLeg:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypointDisplayInfo *)v5;
}

- (GEOComposedWaypointDisplayInfo)destinationDisplayInfo
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "mutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationDisplayInfoForLeg:", -[GEOComposedRouteLeg legIndex](self, "legIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedWaypointDisplayInfo *)v5;
}

- (double)chargingDuration
{
  void *v2;
  double v3;
  double v4;

  -[GEOComposedRouteLeg chargingStationInfo](self, "chargingStationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chargingTime");
  v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLeg)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteLeg *v5;
  uint64_t v6;
  GEOComposedWaypoint *origin;
  uint64_t v8;
  GEOComposedWaypoint *destination;
  uint64_t v10;
  GEOComposedString *originListInstruction;
  uint64_t v12;
  NSArray *originListSecondaryInstructions;
  uint64_t v14;
  GEOComposedString *destinationListInstruction;
  uint64_t v16;
  NSArray *destinationListSecondaryInstructions;
  uint64_t v18;
  GEOArrivalParameters *arrivalParameters;
  id v20;
  const void *v21;
  size_t v22;
  id v23;
  const void *v24;
  size_t v25;
  id v26;
  const void *v27;
  size_t v28;
  double v29;
  uint64_t v30;
  GEOWaypointInfo *geoOriginWaypointInfo;
  uint64_t v32;
  GEOWaypointInfo *geoDestinationWaypointInfo;
  uint64_t v34;
  NSData *serverLegIDForAnalytics;
  GEOComposedRouteLeg *v36;
  unint64_t v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)GEOComposedRouteLeg;
  v5 = -[GEOComposedRouteLeg init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_origin"));
    v6 = objc_claimAutoreleasedReturnValue();
    origin = v5->_origin;
    v5->_origin = (GEOComposedWaypoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originListInstruction"));
    v10 = objc_claimAutoreleasedReturnValue();
    originListInstruction = v5->_originListInstruction;
    v5->_originListInstruction = (GEOComposedString *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_originListSecondaryInstructions"));
    v12 = objc_claimAutoreleasedReturnValue();
    originListSecondaryInstructions = v5->_originListSecondaryInstructions;
    v5->_originListSecondaryInstructions = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destinationListInstruction"));
    v14 = objc_claimAutoreleasedReturnValue();
    destinationListInstruction = v5->_destinationListInstruction;
    v5->_destinationListInstruction = (GEOComposedString *)v14;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_destinationListSecondaryInstructions"));
    v16 = objc_claimAutoreleasedReturnValue();
    destinationListSecondaryInstructions = v5->_destinationListSecondaryInstructions;
    v5->_destinationListSecondaryInstructions = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalParameters"));
    v18 = objc_claimAutoreleasedReturnValue();
    arrivalParameters = v5->_arrivalParameters;
    v5->_arrivalParameters = (GEOArrivalParameters *)v18;

    v38 = 0;
    v20 = objc_retainAutorelease(v4);
    v21 = (const void *)objc_msgSend(v20, "decodeBytesForKey:returnedLength:", CFSTR("_pointRange"), &v38);
    if (v38 && v21)
    {
      if (v38 >= 0x10)
        v22 = 16;
      else
        v22 = v38;
      memcpy(&v5->_pointRange, v21, v22);
    }
    v38 = 0;
    v23 = objc_retainAutorelease(v20);
    v24 = (const void *)objc_msgSend(v23, "decodeBytesForKey:returnedLength:", CFSTR("_stepRange"), &v38);
    if (v38 && v24)
    {
      if (v38 >= 0x10)
        v25 = 16;
      else
        v25 = v38;
      memcpy(&v5->_stepRange, v24, v25);
    }
    v38 = 0;
    v26 = objc_retainAutorelease(v23);
    v27 = (const void *)objc_msgSend(v26, "decodeBytesForKey:returnedLength:", CFSTR("_segmentRange"), &v38);
    if (v38 && v27)
    {
      if (v38 >= 0x10)
        v28 = 16;
      else
        v28 = v38;
      memcpy(&v5->_segmentRange, v27, v28);
    }
    v5->_legIndex = objc_msgSend(v26, "decodeIntegerForKey:", CFSTR("_legIndex"));
    objc_msgSend(v26, "decodeDoubleForKey:", CFSTR("_distance"));
    v5->_distance = v29;
    v5->_drivingSide = objc_msgSend(v26, "decodeIntegerForKey:", CFSTR("_drivingSide"));
    objc_msgSend(v26, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoOriginWaypointInfo"));
    v30 = objc_claimAutoreleasedReturnValue();
    geoOriginWaypointInfo = v5->_geoOriginWaypointInfo;
    v5->_geoOriginWaypointInfo = (GEOWaypointInfo *)v30;

    objc_msgSend(v26, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_geoDestinationWaypointInfo"));
    v32 = objc_claimAutoreleasedReturnValue();
    geoDestinationWaypointInfo = v5->_geoDestinationWaypointInfo;
    v5->_geoDestinationWaypointInfo = (GEOWaypointInfo *)v32;

    objc_msgSend(v26, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverLegIDForAnalytics"));
    v34 = objc_claimAutoreleasedReturnValue();
    serverLegIDForAnalytics = v5->_serverLegIDForAnalytics;
    v5->_serverLegIDForAnalytics = (NSData *)v34;

    v36 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOComposedWaypoint *origin;
  id v5;

  origin = self->_origin;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", origin, CFSTR("_origin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("_destination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originListInstruction, CFSTR("_originListInstruction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originListSecondaryInstructions, CFSTR("_originListSecondaryInstructions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationListInstruction, CFSTR("_destinationListInstruction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationListSecondaryInstructions, CFSTR("_destinationListSecondaryInstructions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalParameters, CFSTR("_arrivalParameters"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_pointRange, 16, CFSTR("_pointRange"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_stepRange, 16, CFSTR("_stepRange"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_segmentRange, 16, CFSTR("_segmentRange"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_distance"), self->_distance);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_drivingSide, CFSTR("_drivingSide"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoOriginWaypointInfo, CFSTR("_geoOriginWaypointInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoDestinationWaypointInfo, CFSTR("_geoDestinationWaypointInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverLegIDForAnalytics, CFSTR("_serverLegIDForAnalytics"));

}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  $212C09783140BCCD23384160D545CE0D v7;
  double v8;
  void *v9;
  $212C09783140BCCD23384160D545CE0D v10;
  double v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[GEOComposedRouteLeg legIndex](self, "legIndex");
  v5 = -[GEOComposedRouteLeg startStepIndex](self, "startStepIndex");
  v6 = -[GEOComposedRouteLeg endStepIndex](self, "endStepIndex");
  v7 = -[GEOComposedRouteLeg startRouteCoordinate](self, "startRouteCoordinate");
  GEOPolylineCoordinateAsString(*(_QWORD *)&v7, 1, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOComposedRouteLeg endRouteCoordinate](self, "endRouteCoordinate");
  GEOPolylineCoordinateAsString(*(_QWORD *)&v10, 1, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Leg %d | Steps %d-%d, [%@ - %@]"), v4, v5, v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_route);
}

- (void)setRoute:(id)a3
{
  objc_storeWeak((id *)&self->_route, a3);
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (_NSRange)pointRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_pointRange.length;
  location = self->_pointRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPointRange:(_NSRange)a3
{
  self->_pointRange = a3;
}

- (_NSRange)stepRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_stepRange.length;
  location = self->_stepRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStepRange:(_NSRange)a3
{
  self->_stepRange = a3;
}

- (_NSRange)segmentRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_segmentRange.length;
  location = self->_segmentRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSegmentRange:(_NSRange)a3
{
  self->_segmentRange = a3;
}

- (GEOComposedWaypoint)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (GEOArrivalParameters)arrivalParameters
{
  return self->_arrivalParameters;
}

- (GEOComposedString)originListInstruction
{
  return self->_originListInstruction;
}

- (NSArray)originListSecondaryInstructions
{
  return self->_originListSecondaryInstructions;
}

- (GEOComposedString)destinationListInstruction
{
  return self->_destinationListInstruction;
}

- (NSArray)destinationListSecondaryInstructions
{
  return self->_destinationListSecondaryInstructions;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (GEOWaypointInfo)geoOriginWaypointInfo
{
  return self->_geoOriginWaypointInfo;
}

- (GEOWaypointInfo)geoDestinationWaypointInfo
{
  return self->_geoDestinationWaypointInfo;
}

- (NSData)serverLegIDForAnalytics
{
  return self->_serverLegIDForAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLegIDForAnalytics, 0);
  objc_storeStrong((id *)&self->_geoDestinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_geoOriginWaypointInfo, 0);
  objc_storeStrong((id *)&self->_destinationListSecondaryInstructions, 0);
  objc_storeStrong((id *)&self->_destinationListInstruction, 0);
  objc_storeStrong((id *)&self->_originListSecondaryInstructions, 0);
  objc_storeStrong((id *)&self->_originListInstruction, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_destroyWeak((id *)&self->_route);
}

@end
