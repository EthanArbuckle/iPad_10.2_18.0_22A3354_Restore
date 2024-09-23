@implementation RevealingVideoView

- (_TtC8AppStore18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18RevealingVideoView *)sub_1000406EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoView(0);
  v2 = v3.receiver;
  -[RevealingVideoView layoutSubviews](&v3, "layoutSubviews");
  sub_10004BFF0();
  sub_10004BEAC();
  sub_10004BD9C();

}

- (_TtC8AppStore18RevealingVideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100568954();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC8AppStore18RevealingVideoView *v6;

  v5 = a3;
  v6 = self;
  sub_100567CAC((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore18RevealingVideoView_artworkLayoutWithMetrics));
  sub_1000C8090((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_pageGrid);
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_otherVideoViewToExchangeVideoContainerWith);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore18RevealingVideoView_videoView);
}

@end
