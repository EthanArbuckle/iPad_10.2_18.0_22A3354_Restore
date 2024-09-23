@implementation LogKey

- (id)description
{
  uint64_t v1;
  NSString v2;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue + 8);
  swift_bridgeObjectRetain(v1);
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

- (_TtC26AppDistributionLaunchAngel6LogKey)init
{
  _TtC26AppDistributionLaunchAngel6LogKey *result;

  result = (_TtC26AppDistributionLaunchAngel6LogKey *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.LogKey", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->stringValue[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue]);
}

@end
