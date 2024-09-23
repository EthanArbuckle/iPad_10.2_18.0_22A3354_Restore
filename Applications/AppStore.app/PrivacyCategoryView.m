@implementation PrivacyCategoryView

- (_TtC8AppStore19PrivacyCategoryView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19PrivacyCategoryView *)sub_10030AE9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore19PrivacyCategoryView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore19PrivacyCategoryView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_category) = 0;
  v4 = a3;

  result = (_TtC8AppStore19PrivacyCategoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PrivacyCategoryView.swift", 34, 2, 92, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore19PrivacyCategoryView *v2;

  v2 = self;
  sub_10030B7E8();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore19PrivacyCategoryView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10030C090((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease(a4);

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDataTypesLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel));
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_category));
}

@end
