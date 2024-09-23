@implementation LockupMediaView

- (_TtC8AppStore15LockupMediaView)init
{
  return (_TtC8AppStore15LockupMediaView *)sub_1001BDB6C();
}

- (_TtC8AppStore15LockupMediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C0334();
}

- (void)layoutSubviews
{
  _TtC8AppStore15LockupMediaView *v2;

  v2 = self;
  sub_1001BE038();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore15LockupMediaView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1001BE314(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8AppStore15LockupMediaView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore15LockupMediaView *result;

  result = (_TtC8AppStore15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.LockupMediaView", 24, "init(frame:)", 12, 0);
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
                                     + OBJC_IVAR____TtC8AppStore15LockupMediaView_imageViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_imageViewReusePool;
  v4 = sub_10007B804(&qword_1008333F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_videoView);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_metrics;
  v7 = type metadata accessor for LockupMediaLayout.Metrics(0, v6);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC8AppStore15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore15LockupMediaView_platform));
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore15LockupMediaView_screenshotsDisplayStyle;
  v9 = type metadata accessor for ScreenshotsDisplayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end
