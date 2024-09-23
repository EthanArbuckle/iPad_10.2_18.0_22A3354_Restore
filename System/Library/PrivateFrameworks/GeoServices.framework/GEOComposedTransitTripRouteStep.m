@implementation GEOComposedTransitTripRouteStep

- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8
{
  uint64_t v8;
  id v13;
  id v14;
  GEOComposedTransitTripRouteStep *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  GEOPBTransitStop *originStop;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  GEOPBTransitStop *destinationStop;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  NSArray *arrivalTimesAtOrigin;
  uint64_t v44;
  NSArray *departureTimes;
  uint64_t v46;
  NSArray *arrivalTimes;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  void *v51;
  _GEOTransitSystem *v52;
  char v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  GEOTransitLine *transitLine;
  _GEOTransitLine *v60;
  uint64_t v61;
  void *routeLineArtwork;
  unsigned int v63;
  void *v64;
  uint64_t v65;
  NSArray *v66;
  GEOComposedTransitTripRouteStep *v67;
  void *v69;
  id v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];
  uint64_t v79;

  v8 = *(_QWORD *)&a7;
  v79 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v77.receiver = self;
  v77.super_class = (Class)GEOComposedTransitTripRouteStep;
  v15 = -[GEOComposedTransitRouteStep initWithComposedRoute:decoderData:routeSegmentType:step:stepIndex:duration:pointRange:](&v77, sel_initWithComposedRoute_decoderData_routeSegmentType_step_stepIndex_duration_pointRange_, a3, v13, 6, v14, a6, v8, a8.location, a8.length);
  if (v15)
  {
    if (objc_msgSend(v14, "hasStartingStopIndex"))
    {
      v16 = objc_msgSend(v14, "startingStopIndex");
      if (objc_msgSend(v13, "stopsCount") > (unint64_t)v16)
      {
        objc_msgSend(v13, "stops");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v14, "startingStopIndex"));
        v18 = objc_claimAutoreleasedReturnValue();
        originStop = v15->super._originStop;
        v15->super._originStop = (GEOPBTransitStop *)v18;

      }
    }
    if (objc_msgSend(v14, "hasEndingStopIndex"))
    {
      v20 = objc_msgSend(v14, "endingStopIndex");
      if (objc_msgSend(v13, "stopsCount") > (unint64_t)v20)
      {
        objc_msgSend(v13, "stops");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v14, "endingStopIndex"));
        v22 = objc_claimAutoreleasedReturnValue();
        destinationStop = v15->super._destinationStop;
        v15->super._destinationStop = (GEOPBTransitStop *)v22;

      }
    }
    objc_msgSend(v14, "vehicleInfos");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v15->_transitVehicle, v25);
    if (objc_msgSend(v25, "hasDepartureFrequencyMin"))
      v15->_departureTimeIntervalMin = (double)objc_msgSend(v25, "departureFrequencyMin");
    if (objc_msgSend(v25, "hasDepartureFrequencyMax"))
      v15->_departureTimeIntervalMax = (double)objc_msgSend(v25, "departureFrequencyMax");
    if (objc_msgSend(v14, "vehicleInfosCount"))
    {
      v69 = v25;
      v71 = v13;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "vehicleInfosCount"));
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v70 = v14;
      objc_msgSend(v14, "vehicleInfos");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v74 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
            if (objc_msgSend(v33, "hasDepartureTime"))
            {
              objc_msgSend(v33, "departureTime");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (double)objc_msgSend(v34, "absTime");

              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v36);

              v37 = (double)(-[GEOTransitStep startingTime](v15->super._transitStep, "startingTime") + v8);
              if (v37 > v35)
                v35 = (double)(-[GEOTransitStep startingTime](v15->super._transitStep, "startingTime", v37)
                             + v8);
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObject:", v38);

            }
            if (objc_msgSend(v33, "hasArrivalTime"))
            {
              objc_msgSend(v33, "arrivalTime");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (double)objc_msgSend(v39, "absTime");

              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v41);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        }
        while (v30);
      }

      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v26);
      arrivalTimesAtOrigin = v15->_arrivalTimesAtOrigin;
      v15->_arrivalTimesAtOrigin = (NSArray *)v42;

      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v27);
      departureTimes = v15->_departureTimes;
      v15->_departureTimes = (NSArray *)v44;

      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v72);
      arrivalTimes = v15->_arrivalTimes;
      v15->_arrivalTimes = (NSArray *)v46;

      v14 = v70;
      v13 = v71;
      v25 = v69;
    }
    if (objc_msgSend(v25, "hasLineIndex")
      && (v48 = objc_msgSend(v25, "lineIndex"), objc_msgSend(v13, "linesCount") > (unint64_t)v48))
    {
      objc_msgSend(v13, "lineAtIndex:", objc_msgSend(v25, "lineIndex"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
    if (objc_msgSend(v49, "hasSystemIndex")
      && (v50 = objc_msgSend(v49, "systemIndex"), objc_msgSend(v13, "systemsCount") > (unint64_t)v50))
    {
      objc_msgSend(v13, "systemAtIndex:", objc_msgSend(v49, "systemIndex"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v52 = -[_GEOTransitSystem initWithSystem:]([_GEOTransitSystem alloc], "initWithSystem:", v51);
        v53 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v51 = 0;
    }
    v52 = 0;
    v53 = 1;
LABEL_37:
    objc_storeStrong((id *)&v15->_transitSystem, v52);
    if ((v53 & 1) == 0)

    if (v49)
    {
      if (objc_msgSend(v14, "hasLocation"))
      {
        objc_msgSend(v14, "location");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "coordinate");
        v56 = v55;
        v58 = v57;

      }
      else
      {
        v58 = -180.0;
        v56 = -180.0;
      }
      v60 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v49, v15->_transitSystem, v56, v58);
      transitLine = v15->_transitLine;
      v15->_transitLine = (GEOTransitLine *)v60;
    }
    else
    {
      transitLine = v15->_transitLine;
      v15->_transitLine = 0;
    }

    if (objc_msgSend(v25, "clusteredRouteLineArtworkIndexsCount"))
    {
      objc_msgSend(v13, "artworkFromIndices:count:", objc_msgSend(v25, "clusteredRouteLineArtworkIndexs"), objc_msgSend(v25, "clusteredRouteLineArtworkIndexsCount"));
      v61 = objc_claimAutoreleasedReturnValue();
      routeLineArtwork = v15->_routeLineArtwork;
      v15->_routeLineArtwork = (NSArray *)v61;
    }
    else
    {
      if (!objc_msgSend(v25, "hasRouteLineArtworkIndex"))
        goto LABEL_51;
      v63 = objc_msgSend(v25, "routeLineArtworkIndex");
      if (objc_msgSend(v13, "artworksCount") <= (unint64_t)v63)
        goto LABEL_51;
      objc_msgSend(v13, "artworks");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", objc_msgSend(v25, "routeLineArtworkIndex"));
      routeLineArtwork = (void *)objc_claimAutoreleasedReturnValue();

      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", routeLineArtwork, 0);
      v66 = v15->_routeLineArtwork;
      v15->_routeLineArtwork = (NSArray *)v65;

    }
LABEL_51:
    v15->_isBus = objc_msgSend(v49, "guidanceSnappingType") == 1;
    v15->_isRail = objc_msgSend(v49, "guidanceSnappingType") == 2;
    v15->_canPreloadTiles = objc_msgSend(v14, "prioritizeTilesPreloading");
    v67 = v15;

  }
  return v15;
}

- (GEOComposedTransitTripRouteStep)initWithComposedRoute:(id)a3 routeSegmentType:(int64_t)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 line:(id)a7 maneuverType:(int)a8 significance:(int)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  GEOComposedTransitTripRouteStep *v17;
  void *v18;
  uint64_t v19;
  GEOPBTransitStop *originStop;
  void *v21;
  uint64_t v22;
  GEOPBTransitStop *destinationStop;
  GEOTransitStep *v24;
  GEOTransitStep *transitStep;
  _GEOTransitLine *v26;
  GEOTransitLine *transitLine;
  GEOComposedTransitTripRouteStep *v28;
  objc_super v30;

  length = a6.length;
  location = a6.location;
  v15 = a3;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)GEOComposedTransitTripRouteStep;
  v17 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v30, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, v15, a4, a5, location, length);
  if (v17)
  {
    objc_msgSend(v15, "stops");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", a5);
    v19 = objc_claimAutoreleasedReturnValue();
    originStop = v17->super._originStop;
    v17->super._originStop = (GEOPBTransitStop *)v19;

    objc_msgSend(v15, "stops");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", a5);
    v22 = objc_claimAutoreleasedReturnValue();
    destinationStop = v17->super._destinationStop;
    v17->super._destinationStop = (GEOPBTransitStop *)v22;

    v24 = objc_alloc_init(GEOTransitStep);
    transitStep = v17->super._transitStep;
    v17->super._transitStep = v24;

    -[GEOTransitStep setManeuverType:](v17->super._transitStep, "setManeuverType:", a8);
    -[GEOTransitStep setSignificanceForEndNode:](v17->super._transitStep, "setSignificanceForEndNode:", a9);
    v26 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v16, 0, -180.0, -180.0);
    transitLine = v17->_transitLine;
    v17->_transitLine = (GEOTransitLine *)v26;

    v17->super._maneuver = a8;
    v28 = v17;
  }

  return v17;
}

- (NSTimeZone)departureTimeZone
{
  void *v3;
  void *v4;
  void *v5;

  if (-[GEOPBTransitStop hasTimezone](self->super._originStop, "hasTimezone"))
  {
    v3 = (void *)MEMORY[0x1E0C99E80];
    -[GEOPBTransitStop timezone](self->super._originStop, "timezone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeZoneWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSTimeZone *)v5;
}

- (NSTimeZone)arrivalTimeZone
{
  void *v3;
  void *v4;
  void *v5;

  if (-[GEOPBTransitStop hasTimezone](self->super._destinationStop, "hasTimezone"))
  {
    v3 = (void *)MEMORY[0x1E0C99E80];
    -[GEOPBTransitStop timezone](self->super._destinationStop, "timezone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeZoneWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSTimeZone *)v5;
}

- (NSDate)arrivalTimeAtOrigin
{
  void *v2;
  void *v3;
  NSDate *v4;

  -[NSArray firstObject](self->_arrivalTimesAtOrigin, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (NSDate)departureTime
{
  void *v2;
  void *v3;
  NSDate *v4;

  -[NSArray firstObject](self->_departureTimes, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (NSDate)arrivalTime
{
  void *v2;
  void *v3;
  NSDate *v4;

  -[NSArray firstObject](self->_arrivalTimes, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (BOOL)hasDuration
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  unsigned __int8 v7;
  objc_super v9;

  -[GEOComposedTransitTripRouteStep arrivalTime](self, "arrivalTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedTransitTripRouteStep departureTime](self, "departureTime");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v7 = v6 > 0.0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GEOComposedTransitTripRouteStep;
    v7 = -[GEOComposedTransitRouteStep hasDuration](&v9, sel_hasDuration);
  }

  return v7;
}

- (unsigned)duration
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  unsigned int v8;
  objc_super v10;

  -[GEOComposedTransitTripRouteStep arrivalTime](self, "arrivalTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedTransitTripRouteStep departureTime](self, "departureTime");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    if (v6 < 0.0)
      NSLog(CFSTR("Arrival time should not be before departure time!"));
    objc_msgSend(v3, "timeIntervalSinceDate:", v5);
    v8 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOComposedTransitTripRouteStep;
    v8 = -[GEOComposedTransitRouteStep duration](&v10, sel_duration);
  }

  return v8;
}

- (BOOL)canPreloadTilesForThisStep
{
  return self->_canPreloadTiles;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  void *v2;
  void *v3;

  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boardingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitBoardingInfo *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedTransitRouteStep originStopIntermediateListName](self, "originStopIntermediateListName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOComposedTransitRouteStep originStop](self, "originStop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v8, "muid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[GEOComposedTransitRouteStep originStop](self, "originStop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GEOComposedTransitRouteStep destinationStopIntermediateListName](self, "destinationStopIntermediateListName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithUnsignedLongLong:", objc_msgSend(v11, "muid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %@"), v6, v14);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {

    }
    v6 = (void *)v16;
  }
  -[GEOComposedTransitTripRouteStep transitVehicle](self, "transitVehicle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "pickupDropoffType");

  if (v18 == 100)
    v19 = CFSTR(" SKIPPED");
  else
    v19 = &stru_1E1C241D0;
  v20 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedTransitTripRouteStep;
  -[GEOComposedTransitRouteStep description](&v24, sel_description);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ | [%@]%@"), v21, v6, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitTripRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitTripRouteStep *v5;
  uint64_t v6;
  NSArray *arrivalTimesAtOrigin;
  uint64_t v8;
  NSArray *departureTimes;
  uint64_t v10;
  NSArray *arrivalTimes;
  double v12;
  double v13;
  uint64_t v14;
  GEOTransitVehicleInfo *transitVehicle;
  uint64_t v16;
  GEOTransitLine *transitLine;
  uint64_t v18;
  GEOTransitSystem *transitSystem;
  uint64_t v20;
  NSArray *routeLineArtwork;
  GEOComposedTransitTripRouteStep *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedTransitTripRouteStep;
  v5 = -[GEOComposedTransitRouteStep initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalTimesAtOrigin"));
    v6 = objc_claimAutoreleasedReturnValue();
    arrivalTimesAtOrigin = v5->_arrivalTimesAtOrigin;
    v5->_arrivalTimesAtOrigin = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_departureTimes"));
    v8 = objc_claimAutoreleasedReturnValue();
    departureTimes = v5->_departureTimes;
    v5->_departureTimes = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalTimes"));
    v10 = objc_claimAutoreleasedReturnValue();
    arrivalTimes = v5->_arrivalTimes;
    v5->_arrivalTimes = (NSArray *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_departureTimeIntervalMin"));
    v5->_departureTimeIntervalMin = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_departureTimeIntervalMax"));
    v5->_departureTimeIntervalMax = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitVehicle"));
    v14 = objc_claimAutoreleasedReturnValue();
    transitVehicle = v5->_transitVehicle;
    v5->_transitVehicle = (GEOTransitVehicleInfo *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitLine"));
    v16 = objc_claimAutoreleasedReturnValue();
    transitLine = v5->_transitLine;
    v5->_transitLine = (GEOTransitLine *)v16;

    -[GEOTransitLine system](v5->_transitLine, "system");
    v18 = objc_claimAutoreleasedReturnValue();
    transitSystem = v5->_transitSystem;
    v5->_transitSystem = (GEOTransitSystem *)v18;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_routeLineArtwork"));
    v20 = objc_claimAutoreleasedReturnValue();
    routeLineArtwork = v5->_routeLineArtwork;
    v5->_routeLineArtwork = (NSArray *)v20;

    v5->_isRail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRail"));
    v5->_isBus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isBus"));
    v5->_canPreloadTiles = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canPreloadTiles"));
    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitTripRouteStep;
  v4 = a3;
  -[GEOComposedTransitRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalTimesAtOrigin, CFSTR("_arrivalTimesAtOrigin"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_departureTimes, CFSTR("_departureTimes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalTimes, CFSTR("_arrivalTimes"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_departureTimeIntervalMin"), self->_departureTimeIntervalMin);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_departureTimeIntervalMax"), self->_departureTimeIntervalMax);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitVehicle, CFSTR("_transitVehicle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitLine, CFSTR("_transitLine"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeLineArtwork, CFSTR("_routeLineArtwork"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRail, CFSTR("_isRail"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBus, CFSTR("_isBus"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canPreloadTiles, CFSTR("_canPreloadTiles"));

}

- (NSArray)arrivalTimesAtOrigin
{
  return self->_arrivalTimesAtOrigin;
}

- (NSArray)departureTimes
{
  return self->_departureTimes;
}

- (NSArray)arrivalTimes
{
  return self->_arrivalTimes;
}

- (double)departureTimeIntervalMin
{
  return self->_departureTimeIntervalMin;
}

- (double)departureTimeIntervalMax
{
  return self->_departureTimeIntervalMax;
}

- (GEOTransitVehicleInfo)transitVehicle
{
  return self->_transitVehicle;
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (GEOTransitSystem)transitSystem
{
  return self->_transitSystem;
}

- (NSArray)routeLineArtwork
{
  return self->_routeLineArtwork;
}

- (BOOL)isRail
{
  return self->_isRail;
}

- (BOOL)isBus
{
  return self->_isBus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeLineArtwork, 0);
  objc_storeStrong((id *)&self->_transitSystem, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_storeStrong((id *)&self->_transitVehicle, 0);
  objc_storeStrong((id *)&self->_arrivalTimes, 0);
  objc_storeStrong((id *)&self->_departureTimes, 0);
  objc_storeStrong((id *)&self->_arrivalTimesAtOrigin, 0);
}

@end
