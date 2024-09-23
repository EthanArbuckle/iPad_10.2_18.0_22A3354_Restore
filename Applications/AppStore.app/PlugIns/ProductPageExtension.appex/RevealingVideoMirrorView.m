@implementation RevealingVideoMirrorView

- (_TtC20ProductPageExtension24RevealingVideoMirrorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005A19F4();
}

- (void)layoutSubviews
{
  id v2;
  __n128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RevealingVideoMirrorView(0);
  v2 = v4.receiver;
  -[RevealingVideoMirrorView layoutSubviews](&v4, "layoutSubviews");
  sub_1005A14A0(v3);

}

- (_TtC20ProductPageExtension24RevealingVideoMirrorView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension24RevealingVideoMirrorView *result;

  result = (_TtC20ProductPageExtension24RevealingVideoMirrorView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.RevealingVideoMirrorView", 45, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension24RevealingVideoMirrorView_sourceVideoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24RevealingVideoMirrorView_videoMirrorView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension24RevealingVideoMirrorView_artworkLayoutWithMetrics));
  sub_100062D88((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24RevealingVideoMirrorView_pageGrid);
}

@end
