@implementation NotifyMeButton

- (_TtC22SubscribePageExtension14NotifyMeButton)init
{
  return (_TtC22SubscribePageExtension14NotifyMeButton *)sub_1005BAC8C();
}

- (_TtC22SubscribePageExtension14NotifyMeButton)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension14NotifyMeButton *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_style) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellMicaPlayer) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension14NotifyMeButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/NotifyMeButton.swift", 43, 2, 196, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension14NotifyMeButton *v2;

  v2 = self;
  sub_1005BB5F8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC22SubscribePageExtension14NotifyMeButton *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1005BBB3C(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[NotifyMeButton _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_1005BA338();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_titleLabel));
}

- (_TtC22SubscribePageExtension14NotifyMeButton)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension14NotifyMeButton *result;

  result = (_TtC22SubscribePageExtension14NotifyMeButton *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.NotifyMeButton", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_backgroundTintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_backgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellMicaPlayer));
}

@end
