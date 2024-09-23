@implementation GEOMapFeatureRoad(SimulationExtras)

- (double)lastCoordinate
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "coordinates3d");
  return *(double *)(v2 + 24 * objc_msgSend(a1, "coordinateCount") - 24);
}

@end
