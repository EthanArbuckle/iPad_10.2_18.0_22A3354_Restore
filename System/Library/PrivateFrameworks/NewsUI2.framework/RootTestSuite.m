@implementation RootTestSuite

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC7NewsUI213RootTestSuite *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1D6DC352C(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC7NewsUI213RootTestSuite)init
{
  _TtC7NewsUI213RootTestSuite *result;

  result = (_TtC7NewsUI213RootTestSuite *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
