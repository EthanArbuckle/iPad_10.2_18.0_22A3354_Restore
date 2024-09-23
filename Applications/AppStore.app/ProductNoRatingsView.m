@implementation ProductNoRatingsView

- (_TtC8AppStore20ProductNoRatingsView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20ProductNoRatingsView *)sub_10020F9AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20ProductNoRatingsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10020FF4C();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore20ProductNoRatingsView *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ProductNoRatingsView layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC8AppStore20ProductNoRatingsView_statusLabel);
  *(_QWORD *)&v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  JUMeasurements result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20ProductNoRatingsView_statusLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore20ProductNoRatingsView_statusLabel));
}

- (void).cxx_destruct
{

}

@end
