@implementation AppPromotionFormattedDateView

- (_TtC8AppStore29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)sub_10028E518(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29AppPromotionFormattedDateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100292D24();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC8AppStore29AppPromotionFormattedDateView *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10028CE64();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[AppPromotionFormattedDateView dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_textLabel));
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_liveIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_liveIndicatorAnimationCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_appEventFormattedDatePresenter));
}

- (UIColor)backgroundColor
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_backgroundView);
  if (v2)
    v2 = objc_msgSend(v2, "backgroundColor");
  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_backgroundView);
  if (v3)
    objc_msgSend(v3, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  _TtC8AppStore29AppPromotionFormattedDateView *v2;

  v2 = self;
  sub_100290470();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC8AppStore29AppPromotionFormattedDateView *v6;
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
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v6 = self;
  v7 = sub_100292984((uint64_t)a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease(a4);

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
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
  sub_10028F84C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore29AppPromotionFormattedDateView *v6;

  v5 = a3;
  v6 = self;
  sub_100291574(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore29AppPromotionFormattedDateView_textLabel));
}

@end
