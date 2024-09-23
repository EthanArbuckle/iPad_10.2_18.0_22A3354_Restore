@implementation BreakoutBackgroundEffectView

- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28BreakoutBackgroundEffectView *)sub_1002B1164(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B1C38();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28BreakoutBackgroundEffectView *v2;

  v2 = self;
  sub_1002B195C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28BreakoutBackgroundEffectView_bottomGradient));
}

@end
