@implementation RevealingVideoMirrorView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoMirrorView(0);
  v2 = v3.receiver;
  -[RevealingVideoMirrorView layoutSubviews](&v3, "layoutSubviews");
  sub_10004C41C();

}

- (_TtC8AppStore24RevealingVideoMirrorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100568D80();
}

- (_TtC8AppStore24RevealingVideoMirrorView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore24RevealingVideoMirrorView *result;

  result = (_TtC8AppStore24RevealingVideoMirrorView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.RevealingVideoMirrorView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_sourceVideoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_videoMirrorView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_artworkLayoutWithMetrics));
  sub_1000C8090((uint64_t)self + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_pageGrid);
}

@end
