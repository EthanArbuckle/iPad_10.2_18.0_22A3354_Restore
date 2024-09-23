@implementation NewsActivityManager

- (void)registerCurrentActivityWithData:(id)a3
{
  id v4;
  _TtC7NewsUI219NewsActivityManager *v5;

  v4 = a3;
  v5 = self;
  NewsActivityManager.registerCurrentActivity(with:)((uint64_t)v4);

}

- (void)deregisterActivityWithData:(id)a3
{
  id v4;
  _TtC7NewsUI219NewsActivityManager *v5;

  v4 = a3;
  v5 = self;
  NewsActivityManager.deregisterActivity(with:)((uint64_t)v4);

}

- (void)clearAllSavedUserActivities
{
  _TtC7NewsUI219NewsActivityManager *v2;

  v2 = self;
  swift_retain();
  sub_1D6E1DFCC();

  swift_release();
}

- (_TtC7NewsUI219NewsActivityManager)init
{
  _TtC7NewsUI219NewsActivityManager *result;

  result = (_TtC7NewsUI219NewsActivityManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
