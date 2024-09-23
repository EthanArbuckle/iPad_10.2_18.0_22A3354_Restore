@implementation NotifyMeButton

- (_TtC8AppStore14NotifyMeButton)init
{
  return (_TtC8AppStore14NotifyMeButton *)sub_1003EEAB0();
}

- (_TtC8AppStore14NotifyMeButton)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore14NotifyMeButton *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore14NotifyMeButton_style) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore14NotifyMeButton_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore14NotifyMeButton_bellMicaPlayer) = 0;
  v4 = a3;

  result = (_TtC8AppStore14NotifyMeButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/NotifyMeButton.swift", 29, 2, 196, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore14NotifyMeButton *v2;

  v2 = self;
  sub_1003EF41C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore14NotifyMeButton *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1003EF960(width);
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
  sub_1003EE15C();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14NotifyMeButton_titleLabel));
}

- (_TtC8AppStore14NotifyMeButton)initWithFrame:(CGRect)a3
{
  _TtC8AppStore14NotifyMeButton *result;

  result = (_TtC8AppStore14NotifyMeButton *)_swift_stdlib_reportUnimplementedInitializer("AppStore.NotifyMeButton", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14NotifyMeButton_backgroundTintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14NotifyMeButton_backgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14NotifyMeButton_bellMicaPlayer));
}

@end
