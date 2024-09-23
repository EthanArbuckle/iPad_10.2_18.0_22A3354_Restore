@implementation RevealingVideoView

- (_TtC22SubscribePageExtension18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18RevealingVideoView *)sub_1001CB984(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18RevealingVideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CD3E0();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension18RevealingVideoView *v6;

  v5 = a3;
  v6 = self;
  sub_1001CBE40((uint64_t)a3);

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
  sub_1001CC238(v3);
  sub_1001CC664();
  sub_1001CC7A8();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_artworkLayoutWithMetrics));
  sub_1000D2798((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_pageGrid);
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_otherVideoViewToExchangeVideoContainerWith);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_videoView);
}

@end
