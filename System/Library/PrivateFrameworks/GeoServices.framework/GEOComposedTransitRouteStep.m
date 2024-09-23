@implementation GEOComposedTransitRouteStep

- (GEOComposedTransitRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 routeSegmentType:(int64_t)a5 step:(id)a6 stepIndex:(unint64_t)a7 duration:(unsigned int)a8 pointRange:(_NSRange)a9
{
  id v15;
  id v16;
  GEOComposedTransitRouteStep *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  GEOPBTransitStop *originStop;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  GEOPBTransitStop *destinationStop;
  GEOPBTransitStop *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  GEOPBTransitHall *originHall;
  GEOPBTransitStop *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  GEOPBTransitHall *destinationHall;
  objc_super v37;

  v15 = a4;
  v16 = a6;
  v37.receiver = self;
  v37.super_class = (Class)GEOComposedTransitRouteStep;
  v17 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v37, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, a3, a5, a7, a9.location, a9.length);
  if (v17)
  {
    v17->_maneuver = objc_msgSend(v16, "maneuverType");
    v17->_startTime = objc_msgSend(v16, "startingTime");
    v17->_duration = a8;
    objc_storeStrong((id *)&v17->_transitStep, a6);
    -[GEOComposedTransitRouteStep _populateIncidentsWithDecoderData:](v17, "_populateIncidentsWithDecoderData:", v15);
    -[GEOComposedTransitRouteStep _populateArtworksWithDecoderData:](v17, "_populateArtworksWithDecoderData:", v15);
    if (objc_msgSend(v16, "hasStartingStopIndex"))
    {
      v18 = objc_msgSend(v16, "startingStopIndex");
      if (objc_msgSend(v15, "stopsCount") > (unint64_t)v18)
      {
        objc_msgSend(v15, "stops");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v16, "startingStopIndex"));
        v20 = objc_claimAutoreleasedReturnValue();
        originStop = v17->_originStop;
        v17->_originStop = (GEOPBTransitStop *)v20;

      }
    }
    if (objc_msgSend(v16, "hasEndingStopIndex"))
    {
      v22 = objc_msgSend(v16, "endingStopIndex");
      if (objc_msgSend(v15, "stopsCount") > (unint64_t)v22)
      {
        objc_msgSend(v15, "stops");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", objc_msgSend(v16, "endingStopIndex"));
        v24 = objc_claimAutoreleasedReturnValue();
        destinationStop = v17->_destinationStop;
        v17->_destinationStop = (GEOPBTransitStop *)v24;

      }
    }
    v26 = v17->_originStop;
    if (v26)
    {
      if (-[GEOPBTransitStop hasHallIndex](v26, "hasHallIndex"))
      {
        v27 = -[GEOPBTransitStop hallIndex](v17->_originStop, "hallIndex");
        if (objc_msgSend(v15, "hallsCount") > (unint64_t)v27)
        {
          objc_msgSend(v15, "halls");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndex:", -[GEOPBTransitStop hallIndex](v17->_originStop, "hallIndex"));
          v29 = objc_claimAutoreleasedReturnValue();
          originHall = v17->_originHall;
          v17->_originHall = (GEOPBTransitHall *)v29;

        }
      }
    }
    v31 = v17->_destinationStop;
    if (v31)
    {
      if (-[GEOPBTransitStop hasHallIndex](v31, "hasHallIndex"))
      {
        v32 = -[GEOPBTransitStop hallIndex](v17->_destinationStop, "hallIndex");
        if (objc_msgSend(v15, "hallsCount") > (unint64_t)v32)
        {
          objc_msgSend(v15, "halls");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndex:", -[GEOPBTransitStop hallIndex](v17->_destinationStop, "hallIndex"));
          v34 = objc_claimAutoreleasedReturnValue();
          destinationHall = v17->_destinationHall;
          v17->_destinationHall = (GEOPBTransitHall *)v34;

        }
      }
    }
  }

  return v17;
}

- (void)_populateIncidentsWithDecoderData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  GEOComposedRouteAdvisory *v12;
  void *v13;
  GEOComposedRouteAdvisory *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  _GEOTransitIncident *v23;
  NSArray *v24;
  NSArray *advisories;
  NSArray *v26;
  NSArray *transitIncidents;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOTransitStep advisoriesInfo](self->_transitStep, "advisoriesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "genericAdvisorys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v30 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[GEOTransitStep advisoriesInfo](self->_transitStep, "advisoriesInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "genericAdvisorys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v31 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v31)
    {
      v29 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v12 = [GEOComposedRouteAdvisory alloc];
          objc_msgSend(v4, "transitIncidents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[GEOComposedRouteAdvisory initWithGeoAdvisoryNotice:transitIncidents:](v12, "initWithGeoAdvisoryNotice:transitIncidents:", v11, v13);
          objc_msgSend(v30, "addObject:", v14);

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v11, "advisoryItems");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                objc_msgSend(v4, "transitIncidents");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "transitIncidentIndex"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", v22);
                objc_msgSend(v7, "addObject:", v23);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v17);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v31);
    }

    v24 = (NSArray *)objc_msgSend(v30, "copy");
    advisories = self->_advisories;
    self->_advisories = v24;

    v26 = (NSArray *)objc_msgSend(v7, "copy");
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v26;

  }
}

- (void)_populateArtworksWithDecoderData:(id)a3
{
  void *v4;
  void *routeDetailsSecondaryArtwork;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  GEOTransitArtworkDataSource *v11;
  NSArray *v12;
  NSArray *steppingArtwork;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "artworkFromIndices:count:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexs](self->_transitStep, "routeDetailsPrimaryArtworkIndexs"), -[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self->_transitStep, "routeDetailsPrimaryArtworkIndexsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, v4);
  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  routeDetailsSecondaryArtwork = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(routeDetailsSecondaryArtwork, "hasRouteDetailsSecondaryArtworkIndex"))
    goto LABEL_4;
  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "routeDetailsSecondaryArtworkIndex");
  v8 = objc_msgSend(v14, "artworksCount");

  if (v8 > v7)
  {
    objc_msgSend(v14, "artworks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "routeDetailsSecondaryArtworkIndex"));
    v11 = (GEOTransitArtworkDataSource *)objc_claimAutoreleasedReturnValue();

    routeDetailsSecondaryArtwork = self->_routeDetailsSecondaryArtwork;
    self->_routeDetailsSecondaryArtwork = v11;
LABEL_4:

  }
  objc_msgSend(v14, "artworkFromIndices:count:", -[GEOTransitStep steppingArtworkIndexs](self->_transitStep, "steppingArtworkIndexs"), -[GEOTransitStep steppingArtworkIndexsCount](self->_transitStep, "steppingArtworkIndexsCount"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  steppingArtwork = self->_steppingArtwork;
  self->_steppingArtwork = v12;

}

- (BOOL)hasDuration
{
  return self->_duration != 0;
}

- (unsigned)duration
{
  return self->_duration;
}

- (double)distance
{
  _BOOL4 v3;
  double result;

  v3 = -[GEOTransitStep hasDistanceInMeters](self->_transitStep, "hasDistanceInMeters");
  result = 0.0;
  if (v3)
    return (double)-[GEOTransitStep distanceInMeters](self->_transitStep, "distanceInMeters", 0.0);
  return result;
}

- (GEOTransitStep)transitStep
{
  return self->_transitStep;
}

- (id)instructions
{
  void *v2;
  void *v3;

  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOTransitVehicleEntries)vehicleEntries
{
  void *v2;
  void *v3;

  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vehiclePositionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitVehicleEntries *)v3;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  void *v2;
  void *v3;

  -[GEOComposedTransitRouteStep transitStep](self, "transitStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitScheduleInfo *)v3;
}

- (NSArray)regionAlerts
{
  return (NSArray *)-[GEOTransitStep regionAlerts](self->_transitStep, "regionAlerts");
}

- (GEOComposedTransitRouteStep)previousTransitStep
{
  void *v2;
  void *v3;
  GEOComposedTransitRouteStep *v4;

  -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "transportType") == 1)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (GEOComposedTransitRouteStep)nextTransitStep
{
  void *v2;
  void *v3;
  GEOComposedTransitRouteStep *v4;

  -[GEOComposedRouteStep getNextStep](self, "getNextStep");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "transportType") == 1)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (unsigned)startTime
{
  return self->_startTime;
}

- (id)previousStop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GEOComposedTransitRouteStep originStop](self, "originStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEOComposedTransitRouteStep originStop](self, "originStop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endingStop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "endingStop");
    else
      objc_msgSend(v7, "previousStop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)nextStop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOComposedRouteStep getNextStep](self, "getNextStep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startingStop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOComposedRouteStep getNextStep](self, "getNextStep");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "startingStop");
    else
      objc_msgSend(v7, "nextStop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)nextBoardingStep
{
  GEOComposedTransitRouteStep *v3;
  void *v4;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 3)
  {
    v3 = self;
  }
  else
  {
    -[GEOComposedRouteStep getNextStep](self, "getNextStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextBoardingStep");
    v3 = (GEOComposedTransitRouteStep *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)previousBoardingStep
{
  GEOComposedTransitRouteStep *v3;
  void *v4;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 3)
  {
    v3 = self;
  }
  else
  {
    -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousBoardingStep");
    v3 = (GEOComposedTransitRouteStep *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)nextAlightingStep
{
  GEOComposedTransitRouteStep *v3;
  void *v4;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 5)
  {
    v3 = self;
  }
  else
  {
    -[GEOComposedRouteStep getNextStep](self, "getNextStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextAlightingStep");
    v3 = (GEOComposedTransitRouteStep *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)previousAlightingStep
{
  GEOComposedTransitRouteStep *v3;
  void *v4;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 5)
  {
    v3 = self;
  }
  else
  {
    -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousAlightingStep");
    v3 = (GEOComposedTransitRouteStep *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedTransitRouteStep originHall](self, "originHall");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[GEOComposedTransitRouteStep originHall](self, "originHall"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasLocation"),
        v5,
        v4,
        v6))
  {
    -[GEOComposedTransitRouteStep originHall](self, "originHall");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOComposedTransitRouteStep startingStop](self, "startingStop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      v22.receiver = self;
      v22.super_class = (Class)GEOComposedTransitRouteStep;
      -[GEOComposedRouteStep startGeoCoordinate](&v22, sel_startGeoCoordinate);
      v12 = v16;
      v14 = v17;
      v15 = v18;
      goto LABEL_8;
    }
    objc_msgSend(v9, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "coordinate");
  v12 = v11;
  v14 = v13;
  *(double *)&v15 = 1.79769313e308;

LABEL_8:
  v19 = v12;
  v20 = v14;
  v21 = *(double *)&v15;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedTransitRouteStep destinationHall](self, "destinationHall");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[GEOComposedTransitRouteStep destinationHall](self, "destinationHall"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasLocation"),
        v5,
        v4,
        v6))
  {
    -[GEOComposedTransitRouteStep destinationHall](self, "destinationHall");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOComposedTransitRouteStep endingStop](self, "endingStop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      v22.receiver = self;
      v22.super_class = (Class)GEOComposedTransitRouteStep;
      -[GEOComposedRouteStep endGeoCoordinate](&v22, sel_endGeoCoordinate);
      v12 = v16;
      v14 = v17;
      v15 = v18;
      goto LABEL_8;
    }
    objc_msgSend(v9, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "coordinate");
  v12 = v11;
  v14 = v13;
  *(double *)&v15 = 1.79769313e308;

LABEL_8:
  v19 = v12;
  v20 = v14;
  v21 = *(double *)&v15;
  result.var2 = v21;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (BOOL)isStartOrResumeStep
{
  return -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType") == 1;
}

- (BOOL)isArrivalStep
{
  BOOL result;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 10)
    return 1;
  -[GEOComposedRouteStep getNextStep](self, "getNextStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maneuver");

  result = v5 == 10
        && (-[GEOComposedRouteStep getNextStep](self, "getNextStep"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "distance"),
            v8 = v7,
            v6,
            v8 == 0.0)
        && -[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 5;
  return result;
}

- (id)maneuverDescription
{
  uint64_t v2;

  v2 = -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType");
  if (v2 < 0xB)
    return off_1E1C09280[(int)v2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)instructionDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GEOComposedString *v7;
  void *v8;

  -[GEOTransitStep instructions](self->_transitStep, "instructions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitListInstruction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandFormatteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v6);
    -[GEOComposedString stringWithDefaultOptions](v7, "stringWithDefaultOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOComposedTransitRouteStep destinationStopIntermediateListName](self, "destinationStopIntermediateListName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)description
{
  unint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t maneuver;
  __CFString *v13;
  void *v14;
  objc_super v16;

  if (qword_1EDF4FB60 != -1)
    dispatch_once(&qword_1EDF4FB60, &__block_literal_global_68);
  v4 = (void *)_MergedGlobals_1_0;
  LODWORD(v2) = self->_startTime;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_MergedGlobals_1_0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(self->_duration + self->_startTime));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedTransitRouteStep;
  -[GEOComposedRouteStep description](&v16, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  maneuver = self->_maneuver;
  if (maneuver >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maneuver);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C09280[maneuver];
  }
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ | %@, %@ - %@"), v11, v13, v6, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __42__GEOComposedTransitRouteStep_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_1_0, "setDateFormat:", CFSTR("h:mm:ss a"));
}

- (unint64_t)originTransitEntityMuid
{
  void *v3;
  unint64_t v4;

  -[GEOComposedTransitRouteStep originStop](self, "originStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEOComposedTransitRouteStep _muidForStop:](self, "_muidForStop:", v3);

  return v4;
}

- (unint64_t)destinationTransitEntityMuid
{
  void *v3;
  unint64_t v4;

  -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEOComposedTransitRouteStep _muidForStop:](self, "_muidForStop:", v3);

  return v4;
}

- (unint64_t)_muidForStop:(id)a3
{
  void *v3;
  unint64_t v4;

  -[GEOComposedTransitRouteStep _largestEntityAtStop:passingTest:](self, "_largestEntityAtStop:passingTest:", a3, &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");

  return v4;
}

uint64_t __44__GEOComposedTransitRouteStep__muidForStop___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMuid");
}

- (id)_largestEntityAtStop:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  v6 = a3;
  v7 = a4;
  v8 = (uint64_t (**)(_QWORD, _QWORD))v7;
  v9 = 0;
  if (v6 && v7)
  {
    -[GEOComposedRouteStep composedRoute](self, "composedRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getHallForStop:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[GEOComposedRouteStep composedRoute](self, "composedRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getStationForHall:", v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if ((((uint64_t (**)(_QWORD, id))v8)[2](v8, v9) & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }

    }
    v13 = ((uint64_t (**)(_QWORD, void *))v8)[2](v8, v11);
    v14 = v11;
    if ((v13 & 1) != 0 || (v15 = ((uint64_t (**)(_QWORD, id))v8)[2](v8, v6), v14 = v6, v15))
      v9 = v14;
    else
      v9 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (NSString)originStopIntermediateListName
{
  void *v3;
  void *v4;

  -[GEOComposedTransitRouteStep originStop](self, "originStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedTransitRouteStep _intermediateListNameForStop:](self, "_intermediateListNameForStop:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)destinationStopIntermediateListName
{
  void *v3;
  void *v4;

  -[GEOComposedTransitRouteStep destinationStop](self, "destinationStop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedTransitRouteStep _intermediateListNameForStop:](self, "_intermediateListNameForStop:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_intermediateListNameForStop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[GEOComposedRouteStep composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getHallForStop:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bestName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "bestName");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitRouteStep *v5;
  uint64_t v6;
  GEOTransitStep *transitStep;
  uint64_t v8;
  NSArray *routeDetailsPrimaryArtwork;
  uint64_t v10;
  GEOTransitArtworkDataSource *routeDetailsSecondaryArtwork;
  uint64_t v12;
  NSArray *steppingArtwork;
  uint64_t v14;
  GEOPBTransitStop *originStop;
  uint64_t v16;
  GEOPBTransitStop *destinationStop;
  uint64_t v18;
  GEOPBTransitHall *originHall;
  uint64_t v20;
  GEOPBTransitHall *destinationHall;
  uint64_t v22;
  NSArray *advisories;
  uint64_t v24;
  NSArray *transitIncidents;
  GEOComposedTransitRouteStep *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedTransitRouteStep;
  v5 = -[GEOComposedRouteStep initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_maneuver = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maneuver"));
    v5->_startTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_startTime"));
    v5->_duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_duration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitStep"));
    v6 = objc_claimAutoreleasedReturnValue();
    transitStep = v5->_transitStep;
    v5->_transitStep = (GEOTransitStep *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_routeDetailsPrimaryArtwork"));
    v8 = objc_claimAutoreleasedReturnValue();
    routeDetailsPrimaryArtwork = v5->_routeDetailsPrimaryArtwork;
    v5->_routeDetailsPrimaryArtwork = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeDetailsSecondaryArtwork"));
    v10 = objc_claimAutoreleasedReturnValue();
    routeDetailsSecondaryArtwork = v5->_routeDetailsSecondaryArtwork;
    v5->_routeDetailsSecondaryArtwork = (GEOTransitArtworkDataSource *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_steppingArtwork"));
    v12 = objc_claimAutoreleasedReturnValue();
    steppingArtwork = v5->_steppingArtwork;
    v5->_steppingArtwork = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originStop"));
    v14 = objc_claimAutoreleasedReturnValue();
    originStop = v5->_originStop;
    v5->_originStop = (GEOPBTransitStop *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destinationStop"));
    v16 = objc_claimAutoreleasedReturnValue();
    destinationStop = v5->_destinationStop;
    v5->_destinationStop = (GEOPBTransitStop *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originHall"));
    v18 = objc_claimAutoreleasedReturnValue();
    originHall = v5->_originHall;
    v5->_originHall = (GEOPBTransitHall *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destinationHall"));
    v20 = objc_claimAutoreleasedReturnValue();
    destinationHall = v5->_destinationHall;
    v5->_destinationHall = (GEOPBTransitHall *)v20;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_advisories"));
    v22 = objc_claimAutoreleasedReturnValue();
    advisories = v5->_advisories;
    v5->_advisories = (NSArray *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_transitIncidents"));
    v24 = objc_claimAutoreleasedReturnValue();
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitRouteStep;
  v4 = a3;
  -[GEOComposedRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maneuver, CFSTR("_maneuver"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_startTime, CFSTR("_startTime"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_duration, CFSTR("_duration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitStep, CFSTR("_transitStep"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDetailsPrimaryArtwork, CFSTR("_routeDetailsPrimaryArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDetailsSecondaryArtwork, CFSTR("_routeDetailsSecondaryArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_steppingArtwork, CFSTR("_steppingArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originStop, CFSTR("_originStop"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationStop, CFSTR("_destinationStop"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originHall, CFSTR("_originHall"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationHall, CFSTR("_destinationHall"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_advisories, CFSTR("_advisories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitIncidents, CFSTR("_transitIncidents"));

}

- (int)maneuver
{
  return self->_maneuver;
}

- (id)routeDetailsPrimaryArtwork
{
  return self->_routeDetailsPrimaryArtwork;
}

- (id)routeDetailsSecondaryArtwork
{
  return self->_routeDetailsSecondaryArtwork;
}

- (id)steppingArtwork
{
  return self->_steppingArtwork;
}

- (GEOPBTransitStop)originStop
{
  return self->_originStop;
}

- (GEOPBTransitStop)destinationStop
{
  return self->_destinationStop;
}

- (GEOPBTransitHall)originHall
{
  return self->_originHall;
}

- (GEOPBTransitHall)destinationHall
{
  return self->_destinationHall;
}

- (id)transitIncidents
{
  return self->_transitIncidents;
}

- (id)advisories
{
  return self->_advisories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_destinationHall, 0);
  objc_storeStrong((id *)&self->_originHall, 0);
  objc_storeStrong((id *)&self->_destinationStop, 0);
  objc_storeStrong((id *)&self->_originStop, 0);
  objc_storeStrong((id *)&self->_steppingArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsSecondaryArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, 0);
  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end
