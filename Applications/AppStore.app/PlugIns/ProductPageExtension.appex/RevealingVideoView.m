@implementation RevealingVideoView

- (_TtC20ProductPageExtension18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18RevealingVideoView *)sub_1004803D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18RevealingVideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100481CC0();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC20ProductPageExtension18RevealingVideoView *v6;

  v5 = a3;
  v6 = self;
  sub_100480890((uint64_t)a3);

}

- (void)layoutSubviews
{
  id v2;
  __n128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RevealingVideoView(0);
  v2 = v4.receiver;
  -[RevealingVideoView layoutSubviews](&v4, "layoutSubviews");
  sub_100480C88(v3);
  sub_1004810B4();
  sub_1004811F8();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_artworkLayoutWithMetrics));
  sub_100062D88((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_pageGrid);
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_otherVideoViewToExchangeVideoContainerWith);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_videoView);
}

@end
