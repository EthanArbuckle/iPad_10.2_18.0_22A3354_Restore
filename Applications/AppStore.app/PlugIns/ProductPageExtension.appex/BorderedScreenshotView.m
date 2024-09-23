@implementation BorderedScreenshotView

- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension22BorderedScreenshotView *)sub_1000F3440(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension22BorderedScreenshotView)initWithCoder:(id)a3
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
  _TtC20ProductPageExtension22BorderedScreenshotView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_chromeBorderView) = 0;
  v4 = OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_displayConfiguration;
  v5 = qword_1008046E0;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1008046E0, sub_100078A50);
  v7 = (char *)self + v4;
  v8 = qword_100864AE0;
  v9 = byte_100864AE8;
  v10 = qword_100864AF0;
  v11 = byte_100864AF8;
  v12 = qword_100864B00;
  v13 = (void *)qword_100864B08;
  v14 = unk_100864B10;
  v15 = unk_100864B20;
  *(_QWORD *)v7 = qword_100864AD8;
  *((_QWORD *)v7 + 1) = v8;
  v7[16] = v9;
  *((_QWORD *)v7 + 3) = v10;
  v7[32] = v11;
  *((_QWORD *)v7 + 5) = v12;
  *((_QWORD *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  v16 = v13;

  result = (_TtC20ProductPageExtension22BorderedScreenshotView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/BorderedScreenshotView.swift", 49, 2, 73, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension22BorderedScreenshotView *v2;

  v2 = self;
  sub_1000F3714();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_platform));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_artworkView));
  objc_release(*(id *)&self->displayConfiguration[OBJC_IVAR____TtC20ProductPageExtension22BorderedScreenshotView_displayConfiguration
                                                + 16]);
}

@end
