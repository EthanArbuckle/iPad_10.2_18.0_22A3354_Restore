@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100320730(v6, (uint64_t)v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100320D8C(v6);

}

- (_TtC8AppStore17TabChangeDelegate)init
{
  _TtC8AppStore17TabChangeDelegate *result;

  result = (_TtC8AppStore17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TabChangeDelegate", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore17TabChangeDelegate_objectGraph));
}

@end
