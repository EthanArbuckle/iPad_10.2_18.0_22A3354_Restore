@implementation BorderView

- (_TtC11AppStoreKit10BorderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11AppStoreKit10BorderView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[BorderView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[BorderView setUserInteractionEnabled:](v7, sel_setUserInteractionEnabled_, 0);
  return v7;
}

- (_TtC11AppStoreKit10BorderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[BorderView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_self(), sel_clearColor);
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC11AppStoreKit10BorderView *v6;

  v5 = a3;
  v6 = self;
  BorderView.backgroundColor.setter(a3);

}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _TtC11AppStoreKit10BorderView *v3;

  v3 = self;
  _s11AppStoreKit10BorderViewC13clipsToBoundsSbvs_0();

}

@end
