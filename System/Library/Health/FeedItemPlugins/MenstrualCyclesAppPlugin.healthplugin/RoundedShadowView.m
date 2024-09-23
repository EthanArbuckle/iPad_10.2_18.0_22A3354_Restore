@implementation RoundedShadowView

- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView *)sub_231B8E544(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17RoundedShadowView *)sub_231B8E7F0(a3);
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin17RoundedShadowView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;

  v2 = self;
  v3 = -[RoundedShadowView layer](v2, sel_layer);
  -[RoundedShadowView bounds](v2, sel_bounds);
  v8 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRect_, v4, v5, v6, v7);
  v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17RoundedShadowView_roundedView));
}

@end
