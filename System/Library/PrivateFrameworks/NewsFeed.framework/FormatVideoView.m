@implementation FormatVideoView

+ (Class)layerClass
{
  sub_1BB5BAE5C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8NewsFeed15FormatVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed15FormatVideoView *)sub_1BB5BA7EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed15FormatVideoView)initWithCoder:(id)a3
{
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _OWORD *v10;
  _TtC8NewsFeed15FormatVideoView *result;

  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_identifier);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (char *)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_assets;
  v7 = type metadata accessor for FormatVideoData.Assets(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = OBJC_IVAR____TtC8NewsFeed15FormatVideoView_displayStateCoordinator;
  type metadata accessor for LayeredMediaViewDisplayStateCoordinator();
  swift_allocObject();
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)LayeredMediaViewDisplayStateCoordinator.init()();
  v10 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties);
  v10[1] = 0u;
  v10[2] = 0u;
  *v10 = 0u;

  result = (_TtC8NewsFeed15FormatVideoView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[FormatVideoView didMoveToWindow](&v3, sel_didMoveToWindow);
  LayeredMediaViewDisplayStateCoordinator.updateDisplay()();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BB5BAE98((uint64_t)self + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_assets);
  swift_release();
  sub_1BA929E14(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties), *(void **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC8NewsFeed15FormatVideoView_playerProperties));
}

@end
