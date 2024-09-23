@implementation InAppPurchaseLockupView

- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC20ProductPageExtension23InAppPurchaseLockupView *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_theme;
  v6 = enum case for InAppPurchaseTheme.infer(_:);
  v7 = type metadata accessor for InAppPurchaseTheme(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_isHeightConstrained) = 0;
  v8 = a3;

  result = (_TtC20ProductPageExtension23InAppPurchaseLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InAppPurchaseLockupView.swift", 50, 2, 162, 0);
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v2;
  _TtC20ProductPageExtension23InAppPurchaseLockupView *v3;

  v3 = self;
  sub_1000AE718((uint64_t)v3, v2);

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension23InAppPurchaseLockupView *v2;

  v2 = self;
  sub_1000AE9D0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  _TtC20ProductPageExtension23InAppPurchaseLockupView *v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = qword_1008047E0;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1008047E0, sub_1000AD59C);
  v8 = type metadata accessor for InAppPurchaseLockupViewLayout.Metrics(0, v7);
  v9 = sub_10000EFC4(v8, (uint64_t)qword_100864CE0);
  v11 = type metadata accessor for InAppPurchaseLockupViewLayout(0, v10);
  v12 = sub_10000E720(&qword_10080D178, (uint64_t (*)(uint64_t))&type metadata accessor for InAppPurchaseLockupViewLayout, (uint64_t)&protocol conformance descriptor for InAppPurchaseLockupViewLayout);
  v13 = dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)(v9, v6, v11, v12, width, height);
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_subtitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_descriptionLabel));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_offerButton));
}

- (_TtC20ProductPageExtension23InAppPurchaseLockupView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension23InAppPurchaseLockupView *result;

  result = (_TtC20ProductPageExtension23InAppPurchaseLockupView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.InAppPurchaseLockupView", 44, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_iconView));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_theme;
  v5 = type metadata accessor for InAppPurchaseTheme(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23InAppPurchaseLockupView_offerButton));
}

@end
