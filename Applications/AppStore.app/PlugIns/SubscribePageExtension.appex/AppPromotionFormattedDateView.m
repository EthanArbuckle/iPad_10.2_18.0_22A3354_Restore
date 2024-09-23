@implementation AppPromotionFormattedDateView

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)sub_1000B540C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000B9CCC();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension29AppPromotionFormattedDateView *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1000B5850();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[AppPromotionFormattedDateView dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_textLabel));
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_liveIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_liveIndicatorAnimationCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_appEventFormattedDatePresenter));
}

- (UIColor)backgroundColor
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v2)
    v2 = objc_msgSend(v2, "backgroundColor");
  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v3)
    objc_msgSend(v3, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29AppPromotionFormattedDateView *v2;

  v2 = self;
  sub_1000B7500();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC22SubscribePageExtension29AppPromotionFormattedDateView *v6;
  double v7;
  double v8;
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
  _QWORD v19[41];
  JUMeasurements result;

  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_1000B7E0C();
  swift_getObjectType();
  sub_1004606E0((uint64_t)a4, (uint64_t)v19);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  sub_1000B9BA0(v19);
  swift_unknownObjectRelease(a4);

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[AppPromotionFormattedDateView _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_1000B68DC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension29AppPromotionFormattedDateView *v6;

  v5 = a3;
  v6 = self;
  sub_1000B8618(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_textLabel));
}

@end
