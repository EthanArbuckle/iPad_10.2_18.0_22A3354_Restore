@implementation MOMapAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double *v2;
  double v3;
  double v4;
  _BYTE v5[24];
  CLLocationCoordinate2D result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate, v5, 0, 0);
  v3 = *v2;
  v4 = v2[1];
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees *v5;
  _BYTE v6[24];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (CLLocationDegrees *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_coordinate, v6, 1, 0);
  *v5 = latitude;
  v5[1] = longitude;
}

- (NSString)title
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return (NSString *)0;
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (_TtC16MomentsUIService15MOMapAnnotation)init
{
  _TtC16MomentsUIService15MOMapAnnotation *result;

  result = (_TtC16MomentsUIService15MOMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOMapAnnotation", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->coordinate[OBJC_IVAR____TtC16MomentsUIService15MOMapAnnotation_title]);
}

@end
