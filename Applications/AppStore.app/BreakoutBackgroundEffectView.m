@implementation BreakoutBackgroundEffectView

- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28BreakoutBackgroundEffectView *)sub_1001A1CC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28BreakoutBackgroundEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001A2794();
}

- (void)layoutSubviews
{
  _TtC8AppStore28BreakoutBackgroundEffectView *v2;

  v2 = self;
  sub_1001A24B8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_topGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_blurGradientMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28BreakoutBackgroundEffectView_bottomGradient));
}

@end
