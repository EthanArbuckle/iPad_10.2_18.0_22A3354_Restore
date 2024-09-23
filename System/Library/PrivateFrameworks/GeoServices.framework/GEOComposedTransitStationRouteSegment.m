@implementation GEOComposedTransitStationRouteSegment

- (GEOComposedTransitStationRouteSegment)initWithComposedRoute:(id)a3 decoderData:(id)a4 stepRange:(_NSRange)a5 transitStepRange:(_NSRange)a6 pointRange:(_NSRange)a7 segmentIndex:(unint64_t)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOComposedTransitStationRouteSegment;
  return -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:](&v9, sel_initWithComposedRoute_stepRange_transitStepRange_pointRange_segmentIndex_, a3, a5.location, a5.length, a6.location, a6.length, a7.location, a7.length, a8);
}

- (int64_t)type
{
  return 5;
}

- (BOOL)isTransfer
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  v5 = v3 + v4;
  v6 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  if (v6 >= v5)
  {
    return 1;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "steps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "maneuver") == 7 || objc_msgSend(v11, "maneuver") == 8)
        break;

      v8 = ++v7 >= v5;
      if (v5 == v7)
        return 1;
    }

  }
  return v8;
}

- (BOOL)hasEnterStationManeuver
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  v5 = v3 + v4;
  v6 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  if (v6 >= v5)
  {
    return 0;
  }
  else
  {
    v7 = v6;
    v8 = 1;
    do
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "steps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v9) = objc_msgSend(v11, "maneuver");
      if ((_DWORD)v9 == 7)
        break;
      v8 = ++v7 < v5;
    }
    while (v5 != v7);
  }
  return v8;
}

- (BOOL)hasExitStationManeuver
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  v5 = v3 + v4;
  v6 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  if (v6 >= v5)
  {
    return 0;
  }
  else
  {
    v7 = v6;
    v8 = 1;
    do
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "steps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v9) = objc_msgSend(v11, "maneuver");
      if ((_DWORD)v9 == 8)
        break;
      v8 = ++v7 < v5;
    }
    while (v5 != v7);
  }
  return v8;
}

@end
