@implementation GEONavigationMatchInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GEONavigationMatchInfo:\n\trouteMatchScore: %0.2f\n\tdistanceFromRoute: %0.2f\n\tmaxDistance: %0.2f\n\tdistanceMatchScore: %0.2f\n\tdistanceWeight: %0.2f\n\tcourseDelta: %0.2f\n\tmaxCourseDelta: %0.2f\n\tcourseMatchScore: %0.2f\n\tcourseWeight: %0.2f\n\troadWidthOnRoute: %0.2f\n\tdistanceFromRoad: %0.2f\n\troadCourseDelta: %0.2f\n\tdistanceFromNearestJunction: %0.2f"), *(_QWORD *)&self->routeMatchScore, *(_QWORD *)&self->distanceFromRoute, *(_QWORD *)&self->maxDistance, *(_QWORD *)&self->distanceMatchScore, *(_QWORD *)&self->distanceWeight, *(_QWORD *)&self->courseDelta, *(_QWORD *)&self->maxCourseDelta, *(_QWORD *)&self->courseMatchScore, *(_QWORD *)&self->courseWeight, *(_QWORD *)&self->roadWidthOnRoute, *(_QWORD *)&self->distanceFromRoad, *(_QWORD *)&self->roadCourseDelta, *(_QWORD *)&self->distanceFromNearestJunction);
}

- (double)routeMatchScore
{
  return self->routeMatchScore;
}

- (void)setRouteMatchScore:(double)a3
{
  self->routeMatchScore = a3;
}

- (double)distanceFromRoute
{
  return self->distanceFromRoute;
}

- (void)setDistanceFromRoute:(double)a3
{
  self->distanceFromRoute = a3;
}

- (double)maxDistance
{
  return self->maxDistance;
}

- (void)setMaxDistance:(double)a3
{
  self->maxDistance = a3;
}

- (double)distanceMatchScore
{
  return self->distanceMatchScore;
}

- (void)setDistanceMatchScore:(double)a3
{
  self->distanceMatchScore = a3;
}

- (double)distanceWeight
{
  return self->distanceWeight;
}

- (void)setDistanceWeight:(double)a3
{
  self->distanceWeight = a3;
}

- (double)courseDelta
{
  return self->courseDelta;
}

- (void)setCourseDelta:(double)a3
{
  self->courseDelta = a3;
}

- (double)maxCourseDelta
{
  return self->maxCourseDelta;
}

- (void)setMaxCourseDelta:(double)a3
{
  self->maxCourseDelta = a3;
}

- (double)courseMatchScore
{
  return self->courseMatchScore;
}

- (void)setCourseMatchScore:(double)a3
{
  self->courseMatchScore = a3;
}

- (double)courseWeight
{
  return self->courseWeight;
}

- (void)setCourseWeight:(double)a3
{
  self->courseWeight = a3;
}

- (double)roadWidthOnRoute
{
  return self->roadWidthOnRoute;
}

- (void)setRoadWidthOnRoute:(double)a3
{
  self->roadWidthOnRoute = a3;
}

- (double)distanceFromRoad
{
  return self->distanceFromRoad;
}

- (void)setDistanceFromRoad:(double)a3
{
  self->distanceFromRoad = a3;
}

- (double)roadCourseDelta
{
  return self->roadCourseDelta;
}

- (void)setRoadCourseDelta:(double)a3
{
  self->roadCourseDelta = a3;
}

- (double)distanceFromNearestJunction
{
  return self->distanceFromNearestJunction;
}

- (void)setDistanceFromNearestJunction:(double)a3
{
  self->distanceFromNearestJunction = a3;
}

@end
