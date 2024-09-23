@implementation MapBridgingMarker

- (NSString)title
{
  return (NSString *)sub_21C57BA94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_title);
}

- (void)setTitle:(id)a3
{
  sub_21C57BAF8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_21C57BA94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_21C57BAF8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_subtitle);
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate);
  v3 = *(double *)&self->title[OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_coordinate) = a3;
}

- (id)_representedMapItem
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_mapItem));
}

- (_TtC15_MapKit_SwiftUI17MapBridgingMarker)init
{
  _TtC15_MapKit_SwiftUI17MapBridgingMarker *result;

  result = (_TtC15_MapKit_SwiftUI17MapBridgingMarker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C57BBD0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_title, (uint64_t)&OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_subtitle, &OBJC_IVAR____TtC15_MapKit_SwiftUI17MapBridgingMarker_mapItem);
}

@end
