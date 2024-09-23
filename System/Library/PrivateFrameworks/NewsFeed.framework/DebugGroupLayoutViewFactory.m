@implementation DebugGroupLayoutViewFactory

- (_TtC8NewsFeed27DebugGroupLayoutViewFactory)init
{
  _TtC8NewsFeed27DebugGroupLayoutViewFactory *result;

  result = (_TtC8NewsFeed27DebugGroupLayoutViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed27DebugGroupLayoutViewFactory_colorPaletteProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  _TtC8NewsFeed27DebugGroupLayoutViewFactory *v6;
  void *v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1BB6DBFE0();

  swift_unknownObjectRelease();
  sub_1BA49A224(0, &qword_1EF2CAB40);
  v7 = (void *)sub_1BB872D9C();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  _TtC8NewsFeed27DebugGroupLayoutViewFactory *v9;
  char *v10;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1BB6DC178(v7);

  swift_unknownObjectRelease();
  return v10;
}

@end
