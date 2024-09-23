@implementation BreakoutBackgroundEffectView

- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView *)sub_100294C54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100295728();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28BreakoutBackgroundEffectView *v2;

  v2 = self;
  sub_10029544C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28BreakoutBackgroundEffectView_bottomGradient));
}

@end
