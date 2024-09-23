@implementation GEOComposedWalkingRouteStep

- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 startRouteCoordinate:(id)a7 endRouteCoordinate:(id)a8 maneuverStartRouteCoordinate:(id)a9
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOComposedWalkingRouteStep;
  return -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:startRouteCoordinate:endRouteCoordinate:maneuverStartRouteCoordinate:](&v10, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_startRouteCoordinate_endRouteCoordinate_maneuverStartRouteCoordinate_, a3, a4, a5, 2, a6, a7, a8, a9);
}

- (GEOComposedWalkingRouteStep)initWithComposedRoute:(id)a3 geoRouteLeg:(id)a4 geoStep:(id)a5 stepIndex:(unint64_t)a6 pointRange:(_NSRange)a7 maneuverPointRange:(_NSRange)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOComposedWalkingRouteStep;
  return -[GEOComposedRouteStep initWithComposedRoute:geoRouteLeg:geoStep:routeSegmentType:stepIndex:pointRange:maneuverPointRange:](&v9, sel_initWithComposedRoute_geoRouteLeg_geoStep_routeSegmentType_stepIndex_pointRange_maneuverPointRange_, a3, a4, a5, 2, a6, a7.location, a7.length, a8.location, a8.length);
}

@end
