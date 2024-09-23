@implementation GEOComposedTransitStationRouteStep

- (GEOComposedTransitStationRouteStep)initWithComposedRoute:(id)a3 decoderData:(id)a4 step:(id)a5 stepIndex:(unint64_t)a6 duration:(unsigned int)a7 pointRange:(_NSRange)a8
{
  uint64_t v8;
  id v13;
  id v14;
  GEOComposedTransitStationRouteStep *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  GEOTransitEnterExitInfo *enterExitInfo;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  GEOPBTransitAccessPoint *accessPoint;
  GEOComposedTransitStationRouteStep *v24;
  objc_super v26;

  v8 = *(_QWORD *)&a7;
  v13 = a4;
  v14 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GEOComposedTransitStationRouteStep;
  v15 = -[GEOComposedTransitRouteStep initWithComposedRoute:decoderData:routeSegmentType:step:stepIndex:duration:pointRange:](&v26, sel_initWithComposedRoute_decoderData_routeSegmentType_step_stepIndex_duration_pointRange_, a3, v13, 5, v14, a6, v8, a8.location, a8.length);
  if (v15)
  {
    objc_msgSend(v14, "transferInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v15->_expectedTime = objc_msgSend(v17, "transferTime");
    if (objc_msgSend(v14, "enterExitInfosCount"))
    {
      objc_msgSend(v14, "enterExitInfoAtIndex:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      enterExitInfo = v15->_enterExitInfo;
      v15->_enterExitInfo = (GEOTransitEnterExitInfo *)v18;

      if (-[GEOTransitEnterExitInfo hasAccessPointIndex](v15->_enterExitInfo, "hasAccessPointIndex"))
      {
        v20 = -[GEOTransitEnterExitInfo accessPointIndex](v15->_enterExitInfo, "accessPointIndex");
        if (objc_msgSend(v13, "accessPointsCount") > (unint64_t)v20)
        {
          objc_msgSend(v13, "accessPoints");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", -[GEOTransitEnterExitInfo accessPointIndex](v15->_enterExitInfo, "accessPointIndex"));
          v22 = objc_claimAutoreleasedReturnValue();
          accessPoint = v15->_accessPoint;
          v15->_accessPoint = (GEOPBTransitAccessPoint *)v22;

        }
      }
      if (-[GEOTransitEnterExitInfo hasUncertainArrival](v15->_enterExitInfo, "hasUncertainArrival"))
        v15->_isArrivalUncertain = -[GEOTransitEnterExitInfo uncertainArrival](v15->_enterExitInfo, "uncertainArrival");
    }
    v24 = v15;

  }
  return v15;
}

- (NSString)exitSign
{
  return (NSString *)-[GEOPBTransitAccessPoint bestExitName](self->_accessPoint, "bestExitName");
}

- (BOOL)displayStop
{
  return -[GEOTransitEnterExitInfo displayStop](self->_enterExitInfo, "displayStop");
}

- (BOOL)hasDisplayStop
{
  return -[GEOTransitEnterExitInfo hasDisplayStop](self->_enterExitInfo, "hasDisplayStop");
}

- ($1AB5FA073B851C12C2339EC22442E995)startGeoCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 7)
  {
    -[GEOComposedTransitStationRouteStep accessPoint](self, "accessPoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[GEOComposedTransitStationRouteStep accessPoint](self, "accessPoint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinate");
      v7 = v6;
      v9 = v8;
      *(double *)&v10 = 1.79769313e308;

    }
    else
    {
      -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[GEOComposedRouteStep getPreviousStep](self, "getPreviousStep");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "endPointIndex");

      }
      else
      {
        v16 = 0;
      }

      -[GEOComposedRouteStep composedRoute](self, "composedRoute");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pointAt:", v16);
      v7 = v17;
      v9 = v18;
      v10 = v19;
    }

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)GEOComposedTransitStationRouteStep;
    -[GEOComposedTransitRouteStep startGeoCoordinate](&v23, sel_startGeoCoordinate);
    v7 = v11;
    v9 = v12;
    v10 = v13;
  }
  v20 = v7;
  v21 = v9;
  v22 = *(double *)&v10;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endGeoCoordinate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[GEOComposedTransitRouteStep maneuver](self, "maneuver") == 8)
  {
    -[GEOComposedTransitStationRouteStep accessPoint](self, "accessPoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[GEOComposedTransitStationRouteStep accessPoint](self, "accessPoint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coordinate");
      v7 = v6;
      v9 = v8;
      *(double *)&v10 = 1.79769313e308;

    }
    else
    {
      -[GEOComposedRouteStep getNextStep](self, "getNextStep");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[GEOComposedRouteStep getNextStep](self, "getNextStep");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "startPointIndex");
      }
      else
      {
        -[GEOComposedRouteStep composedRoute](self, "composedRoute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "pointCount") - 1;
      }

      -[GEOComposedRouteStep composedRoute](self, "composedRoute");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pointAt:", v16);
      v7 = v17;
      v9 = v18;
      v10 = v19;
    }

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)GEOComposedTransitStationRouteStep;
    -[GEOComposedTransitRouteStep endGeoCoordinate](&v23, sel_endGeoCoordinate);
    v7 = v11;
    v9 = v12;
    v10 = v13;
  }
  v20 = v7;
  v21 = v9;
  v22 = *(double *)&v10;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitStationRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitStationRouteStep *v5;
  uint64_t v6;
  GEOTransitTransferInfo *transitTransfer;
  uint64_t v8;
  GEOTransitEnterExitInfo *enterExitInfo;
  uint64_t v10;
  GEOPBTransitAccessPoint *accessPoint;
  GEOComposedTransitStationRouteStep *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedTransitStationRouteStep;
  v5 = -[GEOComposedTransitRouteStep initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_expectedTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_expectedTime"));
    v5->_isArrivalUncertain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isArrivalUncertain"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitTransfer"));
    v6 = objc_claimAutoreleasedReturnValue();
    transitTransfer = v5->_transitTransfer;
    v5->_transitTransfer = (GEOTransitTransferInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enterExitInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    enterExitInfo = v5->_enterExitInfo;
    v5->_enterExitInfo = (GEOTransitEnterExitInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessPoint"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessPoint = v5->_accessPoint;
    v5->_accessPoint = (GEOPBTransitAccessPoint *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitStationRouteStep;
  v4 = a3;
  -[GEOComposedTransitRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_expectedTime, CFSTR("_expectedKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isArrivalUncertain, CFSTR("_isArrivalUncertain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitTransfer, CFSTR("_transitTransfer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_enterExitInfo, CFSTR("_enterExitInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessPoint, CFSTR("_accessPoint"));

}

- (GEOPBTransitAccessPoint)accessPoint
{
  return self->_accessPoint;
}

- (GEOTransitTransferInfo)transitTransfer
{
  return self->_transitTransfer;
}

- (BOOL)isArrivalUncertain
{
  return self->_isArrivalUncertain;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_enterExitInfo, 0);
  objc_storeStrong((id *)&self->_transitTransfer, 0);
}

@end
