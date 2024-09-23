@implementation FMAVPlayerView

+ (Class)layerClass
{
  sub_23A968488(0, &qword_2569D6FF0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11FMFindingUI14FMAVPlayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A9BE4BC();
}

- (void)dealloc
{
  void *v2;
  _TtC11FMFindingUI14FMAVPlayerView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_assetManager);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FMAVPlayerView();
  -[FMAVPlayerView dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_placeholderView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playerStartedObservation));
  swift_unknownObjectRelease();
  sub_23A968C64((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playerTimeObserver);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_playingHandler));
  sub_23A98C874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_showHideHandler));
}

- (NSString)description
{
  _TtC11FMFindingUI14FMAVPlayerView *v2;
  void *v3;

  v2 = self;
  sub_23A9BA3D8();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI14FMAVPlayerView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI14FMAVPlayerView *result;

  result = (_TtC11FMFindingUI14FMAVPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)accessibilityAssetName
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_assetName))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23AA32FB4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

@end
