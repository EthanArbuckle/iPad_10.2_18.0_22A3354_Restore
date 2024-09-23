@implementation LockupMediaView

- (_TtC22SubscribePageExtension15LockupMediaView)init
{
  return (_TtC22SubscribePageExtension15LockupMediaView *)sub_10052CBB4();
}

- (_TtC22SubscribePageExtension15LockupMediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10053058C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension15LockupMediaView *v2;

  v2 = self;
  sub_10052D080();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension15LockupMediaView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10052D37C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC22SubscribePageExtension15LockupMediaView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension15LockupMediaView *result;

  result = (_TtC22SubscribePageExtension15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.LockupMediaView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_imageViews));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_imageViewReusePool;
  v4 = sub_10000DF3C(&qword_100816570);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_videoView);
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_metrics;
  v7 = type metadata accessor for LockupMediaLayout.Metrics(0, v6);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_platform));
  v8 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_screenshotsDisplayStyle;
  v9 = type metadata accessor for ScreenshotsDisplayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end
