@implementation MapBridgingUserAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate);
  v3 = *(double *)&self->coordinate[OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate) = a3;
}

- (_TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation)init
{
  objc_super v3;

  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI25MapBridgingUserAnnotation_coordinate) = *MEMORY[0x24BDBFB70];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapBridgingUserAnnotation();
  return -[MapBridgingUserAnnotation init](&v3, sel_init);
}

@end
