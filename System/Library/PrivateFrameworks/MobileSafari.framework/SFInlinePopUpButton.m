@implementation SFInlinePopUpButton

- (_TtC12MobileSafari19SFInlinePopUpButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC12MobileSafari19SFInlinePopUpButton *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari19SFInlinePopUpButton_valueText);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari19SFInlinePopUpButton_referenceFont) = 0;
  v5 = a3;

  result = (_TtC12MobileSafari19SFInlinePopUpButton *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)updateValueText
{
  _TtC12MobileSafari19SFInlinePopUpButton *v2;

  v2 = self;
  sub_18B92EBBC();

}

- (_TtC12MobileSafari19SFInlinePopUpButton)initWithFrame:(CGRect)a3
{
  _TtC12MobileSafari19SFInlinePopUpButton *result;

  result = (_TtC12MobileSafari19SFInlinePopUpButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari19SFInlinePopUpButton_referenceFont));
}

@end
