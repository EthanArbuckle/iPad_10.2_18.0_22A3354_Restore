@implementation _GEOTransitRouteStepInfo

- (double)distance
{
  GEOStep *walkingStep;
  float v4;

  walkingStep = self->_walkingStep;
  if (!walkingStep)
    return (double)-[GEOTransitStep distanceInMeters](self->_transitStep, "distanceInMeters");
  -[GEOStep distanceMeters](walkingStep, "distanceMeters");
  return v4;
}

- (unint64_t)numPoints
{
  NSUInteger length;
  unint64_t v4;

  if (self->_pointRange.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  length = self->_pointRange.length;
  v4 = length - 1;
  if (length == 1)
    v4 = 1;
  if (length)
    return v4;
  else
    return 0;
}

- (int64_t)routeSegmentType
{
  return self->_routeSegmentType;
}

- (void)setRouteSegmentType:(int64_t)a3
{
  self->_routeSegmentType = a3;
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

- (GEOTransitStep)transitStep
{
  return self->_transitStep;
}

- (void)setTransitStep:(id)a3
{
  objc_storeStrong((id *)&self->_transitStep, a3);
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (GEOStep)walkingStep
{
  return self->_walkingStep;
}

- (void)setWalkingStep:(id)a3
{
  objc_storeStrong((id *)&self->_walkingStep, a3);
}

- (_NSRange)maneuverPointRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_maneuverPointRange.length;
  location = self->_maneuverPointRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setManeuverPointRange:(_NSRange)a3
{
  self->_maneuverPointRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingStep, 0);
  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end
