@implementation BorderedScreenshotView

- (_TtC8AppStore22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22BorderedScreenshotView *)sub_100044128(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8AppStore22BorderedScreenshotView *v2;

  v2 = self;
  sub_100044328();

}

- (_TtC8AppStore22BorderedScreenshotView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _TtC8AppStore22BorderedScreenshotView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_chromeBorderView) = 0;
  v4 = OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_displayConfiguration;
  v5 = qword_100828D98;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100828D98, sub_10000A960);
  v7 = (char *)self + v4;
  v8 = qword_10088FE30;
  v9 = byte_10088FE38;
  v10 = qword_10088FE40;
  v11 = byte_10088FE48;
  v12 = qword_10088FE50;
  v13 = (void *)qword_10088FE58;
  v14 = *(_OWORD *)algn_10088FE60;
  v15 = *(_OWORD *)&algn_10088FE60[16];
  *(_QWORD *)v7 = qword_10088FE28;
  *((_QWORD *)v7 + 1) = v8;
  v7[16] = v9;
  *((_QWORD *)v7 + 3) = v10;
  v7[32] = v11;
  *((_QWORD *)v7 + 5) = v12;
  *((_QWORD *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  v16 = v13;

  result = (_TtC8AppStore22BorderedScreenshotView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/BorderedScreenshotView.swift", 37, 2, 73, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_platform));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_artworkView));
  objc_release(*(id *)&self->displayConfiguration[OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_displayConfiguration
                                                + 16]);
}

@end
