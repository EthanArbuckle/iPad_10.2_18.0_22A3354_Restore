@implementation InAppPurchaseLockupView

- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension23InAppPurchaseLockupView *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_theme;
  v6 = enum case for InAppPurchaseTheme.infer(_:);
  v7 = type metadata accessor for InAppPurchaseTheme(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_isHeightConstrained) = 0;
  v8 = a3;

  result = (_TtC22SubscribePageExtension23InAppPurchaseLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/InAppPurchaseLockupView.swift", 52, 2, 162, 0);
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  _TtC22SubscribePageExtension23InAppPurchaseLockupView *v2;

  v2 = self;
  sub_1004C2DE0();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension23InAppPurchaseLockupView *v2;

  v2 = self;
  sub_1004C3098();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  _TtC22SubscribePageExtension23InAppPurchaseLockupView *v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = qword_1007F2D58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1007F2D58, sub_1004C1C64);
  v8 = type metadata accessor for InAppPurchaseLockupViewLayout.Metrics(0, v7);
  v9 = sub_1000117A8(v8, (uint64_t)qword_100856978);
  v10 = type metadata accessor for InAppPurchaseLockupViewLayout(0);
  v11 = sub_10000E99C(&qword_1008057B0, (uint64_t (*)(uint64_t))&type metadata accessor for InAppPurchaseLockupViewLayout, (uint64_t)&protocol conformance descriptor for InAppPurchaseLockupViewLayout);
  v12 = dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)(v9, v6, v10, v11, width, height);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_subtitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_descriptionLabel));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_offerButton));
}

- (_TtC22SubscribePageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension23InAppPurchaseLockupView *result;

  result = (_TtC22SubscribePageExtension23InAppPurchaseLockupView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.InAppPurchaseLockupView", 46, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_iconView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_theme;
  v4 = type metadata accessor for InAppPurchaseTheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23InAppPurchaseLockupView_offerButton));
}

@end
