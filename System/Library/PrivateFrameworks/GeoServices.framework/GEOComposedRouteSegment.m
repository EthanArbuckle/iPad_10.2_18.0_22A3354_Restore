@implementation GEOComposedRouteSegment

- (GEOComposedRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  GEOComposedRouteSegment *v13;
  GEOComposedRouteSegment *v14;
  GEOComposedRouteSegment *v15;
  objc_super v17;

  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteSegment;
  v13 = -[GEOComposedRouteSegment init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_composedRoute, v12);
    v14->_stepRange.location = v10;
    v14->_stepRange.length = v9;
    v14->_pointRange.location = location;
    v14->_pointRange.length = length;
    v14->_segmentIndex = a6;
    v15 = v14;
  }

  return v14;
}

- (GEOComposedRouteSegment)nextSegment
{
  unint64_t v3;
  GEOComposedRoute **p_composedRoute;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = self->_segmentIndex + 1;
  p_composedRoute = &self->_composedRoute;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v6, "count"))
  {
    v9 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_composedRoute);
    objc_msgSend(v7, "segments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", self->_segmentIndex + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (GEOComposedRouteSegment *)v9;
}

- (int64_t)type
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

- (int)transportType
{
  int64_t v2;

  v2 = -[GEOComposedRouteSegment type](self, "type");
  if ((unint64_t)(v2 - 1) > 5)
    return 4;
  else
    return dword_189CDE644[v2 - 1];
}

- (double)expectedTime
{
  double result;

  -[GEOComposedRouteSegment remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:](self, "remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:", -[GEOComposedRouteSegment startStepIndex](self, "startStepIndex"), 0.0);
  return result;
}

- (unsigned)startPointIndex
{
  return self->_pointRange.location;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)-[GEOComposedRouteSegment startPointIndex](self, "startPointIndex");
}

- (unsigned)endPointIndex
{
  NSUInteger length;

  length = self->_pointRange.length;
  if (length)
    return LODWORD(self->_pointRange.location) + length - 1;
  else
    return self->_pointRange.location;
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)-[GEOComposedRouteSegment endPointIndex](self, "endPointIndex");
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
  NSUInteger length;
  BOOL v3;
  NSUInteger v4;

  length = self->_stepRange.length;
  v3 = length != 0;
  v4 = length - 1;
  if (!v3)
    v4 = 0;
  return self->_stepRange.location + v4;
}

- (unint64_t)stepCount
{
  return self->_stepRange.length;
}

- (NSArray)steps
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  objc_msgSend(WeakRetained, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subarrayWithRange:", self->_stepRange.location, self->_stepRange.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v11;

  v4 = a3;
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  v8 = -[GEOComposedRouteSegment stepRange](self, "stepRange");
  v11 = v7 >= v8 && v7 - v8 < v9;

  return v11;
}

- (_NSRange)transitStepRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)numberOfTransitStops
{
  return 0;
}

- (double)remainingDistanceAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  double v7;
  unint64_t v8;
  id WeakRetained;
  void *v10;
  double v11;

  v7 = 0.0;
  if (-[GEOComposedRouteSegment endStepIndex](self, "endStepIndex") >= a3)
  {
    v8 = a3 + 1;
    if (v8 <= -[GEOComposedRouteSegment endStepIndex](self, "endStepIndex"))
    {
      v7 = a4;
      do
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
        objc_msgSend(WeakRetained, "stepAtIndex:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "distance");
        v7 = v7 + v11;

        ++v8;
      }
      while (v8 <= -[GEOComposedRouteSegment endStepIndex](self, "endStepIndex"));
    }
    else
    {
      return a4;
    }
  }
  return v7;
}

- (double)remainingTimeAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  double v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  v7 = 0.0;
  if (-[GEOComposedRouteSegment endStepIndex](self, "endStepIndex") >= a3)
  {
    v8 = 0;
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
      objc_msgSend(WeakRetained, "stepAtIndex:", a3 + v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (double)objc_msgSend(v10, "duration");
      if (!v8)
      {
        objc_msgSend(v10, "geoStep");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeCheckpoints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "distance");
        v11 = GEORemainingTimeForRemainingDistanceAlongStep(v13, a4, v11, v14);

      }
      v7 = v7 + v11;

      ++v8;
    }
    while (a3 + v8 <= -[GEOComposedRouteSegment endStepIndex](self, "endStepIndex"));
  }
  return v7;
}

- (GEOPBTransitStop)startingTransitStop
{
  return 0;
}

- (GEOPBTransitStop)endingTransitStop
{
  return 0;
}

- (id)description
{
  void *v3;
  unint64_t segmentIndex;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  unint64_t v8;
  $212C09783140BCCD23384160D545CE0D v9;
  double v10;
  void *v11;
  $212C09783140BCCD23384160D545CE0D v12;
  double v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  segmentIndex = self->_segmentIndex;
  v5 = -[GEOComposedRouteSegment type](self, "type") - 1;
  if (v5 > 5)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E1C100F0[v5];
  v7 = -[GEOComposedRouteSegment startStepIndex](self, "startStepIndex");
  v8 = -[GEOComposedRouteSegment endStepIndex](self, "endStepIndex");
  v9 = -[GEOComposedRouteSegment startRouteCoordinate](self, "startRouteCoordinate");
  GEOPolylineCoordinateAsString(*(_QWORD *)&v9, 1, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOComposedRouteSegment endRouteCoordinate](self, "endRouteCoordinate");
  GEOPolylineCoordinateAsString(*(_QWORD *)&v12, 1, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Segment %d | %@, Steps %d-%d, [%@ - %@]"), segmentIndex, v6, v7, v8, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteSegment)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteSegment *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  NSUInteger v9;
  GEOComposedRouteSegment *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteSegment;
  v5 = -[GEOComposedRouteSegment init](&v12, sel_init);
  if (v5)
  {
    v5->_segmentIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_segmentIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pointRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pointRange.location = objc_msgSend(v6, "rangeValue");
    v5->_pointRange.length = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stepRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stepRange.location = objc_msgSend(v8, "rangeValue");
    v5->_stepRange.length = v9;
    v10 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t segmentIndex;
  id v5;
  void *v6;
  id v7;

  segmentIndex = self->_segmentIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", segmentIndex, CFSTR("_segmentIndex"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_pointRange.location, self->_pointRange.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_pointRange"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_stepRange.location, self->_stepRange.length);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("_stepRange"));

}

- (GEOComposedRoute)composedRoute
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_composedRoute);
}

- (void)setComposedRoute:(id)a3
{
  objc_storeWeak((id *)&self->_composedRoute, a3);
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composedRoute);
}

@end
