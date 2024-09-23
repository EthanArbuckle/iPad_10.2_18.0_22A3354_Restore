@implementation B389MapAnnotation

- (_TtC18SharingViewService17B389MapAnnotation)init
{
  _TtC18SharingViewService17B389MapAnnotation *result;

  result = (_TtC18SharingViewService17B389MapAnnotation *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.B389MapAnnotation", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->roleEmoji[OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji]);

}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_region);
  v3 = *(double *)&self->roleEmoji[OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_region];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->roleEmoji[OBJC_IVAR____TtC18SharingViewService17B389MapAnnotation_roleEmoji];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

@end
