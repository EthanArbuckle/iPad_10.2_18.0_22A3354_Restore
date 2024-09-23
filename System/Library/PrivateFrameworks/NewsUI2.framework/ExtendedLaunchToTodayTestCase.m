@implementation ExtendedLaunchToTodayTestCase

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7NewsUI229ExtendedLaunchToTodayTestCase *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1D5EA3360((uint64_t)sub_1D5FACAE0, v7);

  swift_release();
}

- (NSString)testName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 30.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI229ExtendedLaunchToTodayTestCase_aggregate);
}

- (_TtC7NewsUI229ExtendedLaunchToTodayTestCase)init
{
  _TtC7NewsUI229ExtendedLaunchToTodayTestCase *result;

  result = (_TtC7NewsUI229ExtendedLaunchToTodayTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
}

@end
