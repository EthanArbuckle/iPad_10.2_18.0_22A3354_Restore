@implementation ExtendedLaunchToArticleTestCase

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
                             + OBJC_IVAR____TtC7NewsUI231ExtendedLaunchToArticleTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC7NewsUI231ExtendedLaunchToArticleTestCase *v10;
  uint64_t v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = qword_1ED5F9FA8;
  v9 = a3;
  v10 = self;
  if (v8 != -1)
    swift_once();
  sub_1D6E27374();
  sub_1D6E1C61C();
  sub_1D6E19FD0();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1D5FACAE0;
  *(_QWORD *)(v11 + 24) = v7;
  swift_retain();
  sub_1D6E1A5F4();

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC7NewsUI231ExtendedLaunchToArticleTestCase)init
{
  _TtC7NewsUI231ExtendedLaunchToArticleTestCase *result;

  result = (_TtC7NewsUI231ExtendedLaunchToArticleTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
