@implementation GEOComposedTransitWalkingRouteStep

- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 geoStep:(id)a7 pointRange:(_NSRange)a8 maneuverPointRange:(_NSRange)a9
{
  id v14;
  GEOComposedTransitWalkingRouteStep *v15;
  GEOComposedTransitWalkingRouteStep *v16;
  GEOComposedTransitWalkingRouteStep *v17;
  id v19;
  objc_super v20;

  v14 = a4;
  v19 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v15 = -[GEOComposedWalkingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:](&v20, sel_initWithComposedRoute_geoRouteLeg_geoStep_stepIndex_pointRange_maneuverPointRange_, a3, 0, a7, a6, a8.location, a8.length, a9.location, a9.length);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transitStep, a5);
    v16->_startCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_3;
    v16->_endCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_3;
    -[GEOComposedTransitWalkingRouteStep _commonInitWithDecoderData:](v16, "_commonInitWithDecoderData:", v14);
    v17 = v16;
  }

  return v16;
}

- (GEOComposedTransitWalkingRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 transitStep:(id)a5 stepIndex:(unint64_t)a6 startCoordinate:(id)a7 endCoordinate:(id)a8 pointRange:(_NSRange)a9
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  double v13;
  double v14;
  id v19;
  id v20;
  GEOComposedTransitWalkingRouteStep *v21;
  GEOComposedTransitWalkingRouteStep *v22;
  GEOComposedTransitWalkingRouteStep *v23;
  objc_super v25;

  length = a9.length;
  location = a9.location;
  var1 = a8.var1;
  var0 = a8.var0;
  v13 = a7.var1;
  v14 = a7.var0;
  v19 = a4;
  v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v21 = -[GEOComposedRouteStep initWithComposedRoute:routeSegmentType:stepIndex:pointRange:](&v25, sel_initWithComposedRoute_routeSegmentType_stepIndex_pointRange_, a3, 2, a6, location, length);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_transitStep, a5);
    v22->_startCoordinate.latitude = v14;
    v22->_startCoordinate.longitude = v13;
    v22->_endCoordinate.latitude = var0;
    v22->_endCoordinate.longitude = var1;
    -[GEOComposedTransitWalkingRouteStep _commonInitWithDecoderData:](v22, "_commonInitWithDecoderData:", v19);
    v23 = v22;
  }

  return v22;
}

- (void)_commonInitWithDecoderData:(id)a3
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
  NSArray *v28;
  NSArray *steppingArtwork;
  NSArray *v30;
  NSArray *routeDetailsPrimaryArtwork;
  unsigned int v32;
  GEOTransitArtworkDataSource *v33;
  GEOTransitArtworkDataSource *routeDetailsSecondaryArtwork;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOTransitStep advisoriesInfo](self->_transitStep, "advisoriesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "genericAdvisorys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v37 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[GEOTransitStep advisoriesInfo](self->_transitStep, "advisoriesInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "genericAdvisorys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v38 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v38)
    {
      v36 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v12 = [GEOComposedRouteAdvisory alloc];
          objc_msgSend(v4, "transitIncidents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[GEOComposedRouteAdvisory initWithGeoAdvisoryNotice:transitIncidents:](v12, "initWithGeoAdvisoryNotice:transitIncidents:", v11, v13);
          objc_msgSend(v37, "addObject:", v14);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v11, "advisoryItems");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v4, "transitIncidents");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "transitIncidentIndex"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                v23 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", v22);
                objc_msgSend(v7, "addObject:", v23);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v17);
          }

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v38);
    }

    v24 = (NSArray *)objc_msgSend(v37, "copy");
    advisories = self->_advisories;
    self->_advisories = v24;

    v26 = (NSArray *)objc_msgSend(v7, "copy");
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v26;

  }
  objc_msgSend(v4, "artworkFromIndices:count:", -[GEOTransitStep steppingArtworkIndexs](self->_transitStep, "steppingArtworkIndexs"), -[GEOTransitStep steppingArtworkIndexsCount](self->_transitStep, "steppingArtworkIndexsCount"));
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  steppingArtwork = self->_steppingArtwork;
  self->_steppingArtwork = v28;

  objc_msgSend(v4, "artworkFromIndices:count:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexs](self->_transitStep, "routeDetailsPrimaryArtworkIndexs"), -[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self->_transitStep, "routeDetailsPrimaryArtworkIndexsCount"));
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  routeDetailsPrimaryArtwork = self->_routeDetailsPrimaryArtwork;
  self->_routeDetailsPrimaryArtwork = v30;

  v32 = -[GEOTransitStep routeDetailsSecondaryArtworkIndex](self->_transitStep, "routeDetailsSecondaryArtworkIndex");
  if (objc_msgSend(v4, "artworksCount") > (unint64_t)v32)
  {
    objc_msgSend(v4, "artworkAtIndex:", -[GEOTransitStep routeDetailsSecondaryArtworkIndex](self->_transitStep, "routeDetailsSecondaryArtworkIndex"));
    v33 = (GEOTransitArtworkDataSource *)objc_claimAutoreleasedReturnValue();
    routeDetailsSecondaryArtwork = self->_routeDetailsSecondaryArtwork;
    self->_routeDetailsSecondaryArtwork = v33;

  }
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  double longitude;
  double latitude;
  double v4;
  objc_super v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  longitude = self->_startCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (latitude = self->_startCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
    -[GEOComposedRouteStep startGeoCoordinate](&v5, sel_startGeoCoordinate);
  }
  else
  {
    v4 = 1.79769313e308;
  }
  result.var2 = v4;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  double longitude;
  double latitude;
  double v4;
  objc_super v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  longitude = self->_endCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (latitude = self->_endCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
    -[GEOComposedRouteStep endGeoCoordinate](&v5, sel_endGeoCoordinate);
  }
  else
  {
    v4 = 1.79769313e308;
  }
  result.var2 = v4;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)instructions
{
  return -[GEOTransitStep instructions](self->_transitStep, "instructions");
}

- (id)transitStep
{
  return self->_transitStep;
}

- (double)distance
{
  void *v3;
  double result;
  objc_super v5;

  -[GEOComposedRouteStep geoStep](self, "geoStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (double)-[GEOTransitStep distanceInMeters](self->_transitStep, "distanceInMeters");
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  -[GEOComposedRouteStep distance](&v5, sel_distance);
  return result;
}

- (BOOL)isStartOrResumeStep
{
  return -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType") == 1;
}

- (BOOL)isArrivalStep
{
  return -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType") == 10;
}

- (id)maneuverDescription
{
  uint64_t v2;

  v2 = -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType");
  if (v2 < 0xB)
    return off_1E1C209B8[(int)v2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)instructionDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  GEOComposedString *v6;
  void *v7;

  -[GEOTransitStep instructions](self->_transitStep, "instructions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[GEOComposedString initWithGeoFormattedString:]([GEOComposedString alloc], "initWithGeoFormattedString:", v5);
    -[GEOComposedString stringWithDefaultOptions](v6, "stringWithDefaultOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  if (qword_1EDF4FB80 != -1)
    dispatch_once(&qword_1EDF4FB80, &__block_literal_global_201);
  if (-[GEOTransitStep hasStartingTime](self->_transitStep, "hasStartingTime"))
  {
    v3 = (void *)_MergedGlobals_1_2;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOTransitStep startingTime](self->_transitStep, "startingTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("-");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  -[GEOComposedRouteStep description](&v12, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GEOTransitStep maneuverType](self->_transitStep, "maneuverType");
  if (v8 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C209B8[(int)v8];
  }
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ | %@, %@"), v7, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __49__GEOComposedTransitWalkingRouteStep_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_1_2, "setDateFormat:", CFSTR("h:mm:ss a"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitWalkingRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitWalkingRouteStep *v5;
  uint64_t v6;
  GEOTransitStep *transitStep;
  id v8;
  const void *v9;
  size_t v10;
  id v11;
  const void *v12;
  size_t v13;
  uint64_t v14;
  NSArray *steppingArtwork;
  uint64_t v16;
  NSArray *routeDetailsPrimaryArtwork;
  uint64_t v18;
  GEOTransitArtworkDataSource *routeDetailsSecondaryArtwork;
  uint64_t v20;
  NSArray *advisories;
  uint64_t v22;
  NSArray *transitIncidents;
  GEOComposedTransitWalkingRouteStep *v24;
  unint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v5 = -[GEOComposedRouteStep initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitStep"));
    v6 = objc_claimAutoreleasedReturnValue();
    transitStep = v5->_transitStep;
    v5->_transitStep = (GEOTransitStep *)v6;

    v26 = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = (const void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("_startCoordinate"), &v26);
    if (v26 && v9)
    {
      if (v26 >= 0x10)
        v10 = 16;
      else
        v10 = v26;
      memcpy(&v5->_startCoordinate, v9, v10);
    }
    v26 = 0;
    v11 = objc_retainAutorelease(v8);
    v12 = (const void *)objc_msgSend(v11, "decodeBytesForKey:returnedLength:", CFSTR("_endCoordinate"), &v26);
    if (v26 && v12)
    {
      if (v26 >= 0x10)
        v13 = 16;
      else
        v13 = v26;
      memcpy(&v5->_endCoordinate, v12, v13);
    }
    objc_msgSend(v11, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_steppingArtwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    steppingArtwork = v5->_steppingArtwork;
    v5->_steppingArtwork = (NSArray *)v14;

    objc_msgSend(v11, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_routeDetailsPrimaryArtwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    routeDetailsPrimaryArtwork = v5->_routeDetailsPrimaryArtwork;
    v5->_routeDetailsPrimaryArtwork = (NSArray *)v16;

    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeDetailsSecondaryArtwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    routeDetailsSecondaryArtwork = v5->_routeDetailsSecondaryArtwork;
    v5->_routeDetailsSecondaryArtwork = (GEOTransitArtworkDataSource *)v18;

    objc_msgSend(v11, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_advisories"));
    v20 = objc_claimAutoreleasedReturnValue();
    advisories = v5->_advisories;
    v5->_advisories = (NSArray *)v20;

    objc_msgSend(v11, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_transitIncidents"));
    v22 = objc_claimAutoreleasedReturnValue();
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitWalkingRouteStep;
  v4 = a3;
  -[GEOComposedRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitStep, CFSTR("_transitStep"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_startCoordinate, 16, CFSTR("_startCoordinate"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_endCoordinate, 16, CFSTR("_endCoordinate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_steppingArtwork, CFSTR("_steppingArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDetailsPrimaryArtwork, CFSTR("_routeDetailsPrimaryArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDetailsSecondaryArtwork, CFSTR("_routeDetailsSecondaryArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_advisories, CFSTR("_advisories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitIncidents, CFSTR("_transitIncidents"));

}

- (id)steppingArtwork
{
  return self->_steppingArtwork;
}

- (id)routeDetailsPrimaryArtwork
{
  return self->_routeDetailsPrimaryArtwork;
}

- (id)routeDetailsSecondaryArtwork
{
  return self->_routeDetailsSecondaryArtwork;
}

- (id)advisories
{
  return self->_advisories;
}

- (id)transitIncidents
{
  return self->_transitIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_advisories, 0);
  objc_storeStrong((id *)&self->_routeDetailsSecondaryArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsPrimaryArtwork, 0);
  objc_storeStrong((id *)&self->_steppingArtwork, 0);
  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end
