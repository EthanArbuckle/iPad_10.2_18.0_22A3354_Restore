@implementation ProductNoRatingsView

- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ProductNoRatingsView *)sub_1000E1984(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000E1F24();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension20ProductNoRatingsView *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ProductNoRatingsView layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel);
  v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  JUMeasurements result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel));
}

@end
