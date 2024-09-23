@implementation LockupMediaView

- (_TtC20ProductPageExtension15LockupMediaView)init
{
  return (_TtC20ProductPageExtension15LockupMediaView *)sub_10048D6C8();
}

- (_TtC20ProductPageExtension15LockupMediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004900B0();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension15LockupMediaView *v2;

  v2 = self;
  sub_10048DB94();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension15LockupMediaView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10048DE70(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC20ProductPageExtension15LockupMediaView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension15LockupMediaView *result;

  result = (_TtC20ProductPageExtension15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.LockupMediaView", 36, "init(frame:)", 12, 0);
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
                                     + OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_imageViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_imageViewReusePool;
  v4 = sub_10000DAF8(&qword_100825A88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_videoView);
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_metrics;
  v7 = type metadata accessor for LockupMediaLayout.Metrics(0, v6);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release();
  v8 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_screenshotsDisplayStyle;
  v9 = type metadata accessor for ScreenshotsDisplayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end
