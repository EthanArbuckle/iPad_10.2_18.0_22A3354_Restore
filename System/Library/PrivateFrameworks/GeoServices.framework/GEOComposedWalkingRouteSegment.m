@implementation GEOComposedWalkingRouteSegment

- (GEOComposedWalkingRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6 transitIncidentMessageStepIndex:(unint64_t)a7
{
  GEOComposedWalkingRouteSegment *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOComposedWalkingRouteSegment;
  result = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](&v8, sel_initWithComposedRoute_stepRange_pointRange_segmentIndex_, a3, a4.location, a4.length, a5.location, a5.length, a6);
  if (result)
    result->_transitIncidentMessageStepIndex = a7;
  return result;
}

- (int64_t)type
{
  return 2;
}

- (GEOComposedWalkingRouteStep)lastWalkingStep
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[GEOComposedRouteSegment steps](self, "steps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 < 1)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    v4 = v3 + 1;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((unint64_t)--v4 <= 1)
        goto LABEL_5;
    }
  }

  return (GEOComposedWalkingRouteStep *)v5;
}

- (GEOComposedTransitWalkingRouteStep)arrivalStep
{
  void *v2;
  void *v3;
  id v4;

  -[GEOComposedRouteSegment steps](self, "steps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v4 = v3;
  if ((objc_msgSend(v4, "isArrivalStep") & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }

  return (GEOComposedTransitWalkingRouteStep *)v4;
}

- (id)_transitIncidentMessageStep
{
  unint64_t transitIncidentMessageStepIndex;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;

  transitIncidentMessageStepIndex = self->_transitIncidentMessageStepIndex;
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stepsCount");

  if (transitIncidentMessageStepIndex <= v5)
  {
    -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stepAtIndex:", self->_transitIncidentMessageStepIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWalkingRouteSegment)initWithCoder:(id)a3
{
  id v4;
  GEOComposedWalkingRouteSegment *v5;
  GEOComposedWalkingRouteSegment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedWalkingRouteSegment;
  v5 = -[GEOComposedRouteSegment initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_transitIncidentMessageStepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_transitIncidentMessageStepIndex"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWalkingRouteSegment;
  v4 = a3;
  -[GEOComposedRouteSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitIncidentMessageStepIndex, CFSTR("_transitIncidentMessageStepIndex"), v5.receiver, v5.super_class);

}

- (unint64_t)transitIncidentMessageStepIndex
{
  return self->_transitIncidentMessageStepIndex;
}

@end
