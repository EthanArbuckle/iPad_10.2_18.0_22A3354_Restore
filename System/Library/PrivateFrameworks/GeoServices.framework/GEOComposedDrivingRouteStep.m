@implementation GEOComposedDrivingRouteStep

- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9
{
  id v15;
  GEOComposedDrivingRouteStep *v16;
  void *v17;
  GEOComposedRouteEVStepInfo *v18;
  void *v19;
  uint64_t v20;
  GEOComposedRouteEVStepInfo *evInfo;
  GEOComposedDrivingRouteStep *v22;
  objc_super v24;

  v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEOComposedDrivingRouteStep;
  v16 = -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](&v24, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_startRouteCoordinate_endRouteCoordinate_maneuverStartRouteCoordinate_, a3, a4, v15, 1, a6, a7, a8, a9);
  if (v16)
  {
    objc_msgSend(v15, "evStateInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [GEOComposedRouteEVStepInfo alloc];
      objc_msgSend(v15, "evStateInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[GEOComposedRouteEVStepInfo initWithEVStateInfo:](v18, "initWithEVStateInfo:", v19);
      evInfo = v16->_evInfo;
      v16->_evInfo = (GEOComposedRouteEVStepInfo *)v20;

    }
    v22 = v16;
  }

  return v16;
}

- (GEOComposedDrivingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  GEOComposedDrivingRouteStep *v15;
  void *v16;
  GEOComposedRouteEVStepInfo *v17;
  void *v18;
  uint64_t v19;
  GEOComposedRouteEVStepInfo *evInfo;
  GEOComposedDrivingRouteStep *v21;
  objc_super v23;

  length = a7.length;
  location = a7.location;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedDrivingRouteStep;
  v15 = -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](&v23, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_pointRange_maneuverPointRange_, a3, a4, v14, 1, a6, location, length, a8.location, a8.length);
  if (v15)
  {
    objc_msgSend(v14, "evStateInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [GEOComposedRouteEVStepInfo alloc];
      objc_msgSend(v14, "evStateInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[GEOComposedRouteEVStepInfo initWithEVStateInfo:](v17, "initWithEVStateInfo:", v18);
      evInfo = v15->_evInfo;
      v15->_evInfo = (GEOComposedRouteEVStepInfo *)v19;

    }
    v21 = v15;
  }

  return v15;
}

- (id)evInfo
{
  void *v3;
  void *v4;
  GEOComposedRouteEVStepInfo *v5;
  GEOComposedRouteEVStepInfo *evInfo;
  GEOComposedRouteEVStepInfo *v7;

  -[GEOComposedRouteStep composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evInfoForStepID:", -[GEOComposedRouteStep stepID](self, "stepID"));
  v5 = (GEOComposedRouteEVStepInfo *)objc_claimAutoreleasedReturnValue();

  evInfo = v5;
  if (!v5)
    evInfo = self->_evInfo;
  v7 = evInfo;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedDrivingRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedDrivingRouteStep *v5;
  uint64_t v6;
  GEOComposedRouteEVStepInfo *evInfo;
  GEOComposedDrivingRouteStep *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedDrivingRouteStep;
  v5 = -[GEOComposedRouteStep initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_evInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    evInfo = v5->_evInfo;
    v5->_evInfo = (GEOComposedRouteEVStepInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedDrivingRouteStep;
  v4 = a3;
  -[GEOComposedRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_evInfo, CFSTR("_evInfo"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)GEOComposedDrivingRouteStep;
  -[GEOComposedRouteStep description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_evInfo)
    objc_msgSend(v5, "appendFormat:", CFSTR(" | %@"), self->_evInfo);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evInfo, 0);
}

@end
