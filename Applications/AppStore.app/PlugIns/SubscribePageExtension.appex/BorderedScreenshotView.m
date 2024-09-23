@implementation BorderedScreenshotView

- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22BorderedScreenshotView *)sub_10022ECE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22BorderedScreenshotView)initWithCoder:(id)a3
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
  _TtC22SubscribePageExtension22BorderedScreenshotView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_chromeBorderView) = 0;
  v4 = OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_displayConfiguration;
  v5 = qword_1007F17F8;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1007F17F8, sub_10022F838);
  v7 = (char *)self + v4;
  v8 = qword_100852C90;
  v9 = byte_100852C98;
  v10 = qword_100852CA0;
  v11 = byte_100852CA8;
  v12 = qword_100852CB0;
  v13 = (void *)qword_100852CB8;
  v14 = unk_100852CC0;
  v15 = unk_100852CD0;
  *(_QWORD *)v7 = qword_100852C88;
  *((_QWORD *)v7 + 1) = v8;
  v7[16] = v9;
  *((_QWORD *)v7 + 3) = v10;
  v7[32] = v11;
  *((_QWORD *)v7 + 5) = v12;
  *((_QWORD *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  v16 = v13;

  result = (_TtC22SubscribePageExtension22BorderedScreenshotView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/BorderedScreenshotView.swift", 51, 2, 73, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension22BorderedScreenshotView *v2;

  v2 = self;
  sub_10022EFB8();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_platform));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_artworkView));
  objc_release(*(id *)&self->displayConfiguration[OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_displayConfiguration
                                                + 16]);
}

@end
