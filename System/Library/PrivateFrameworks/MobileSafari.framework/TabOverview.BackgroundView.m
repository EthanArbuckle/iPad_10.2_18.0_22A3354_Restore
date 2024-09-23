@implementation TabOverview.BackgroundView

- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview14BackgroundView *)sub_18BA923BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabOverview14BackgroundView *)sub_18BA924C4(a3);
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_s14BackgroundViewCMa();
  -[TabOverview.BackgroundView _continuousCornerRadius](&v3, sel__continuousCornerRadius);
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  char *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_s14BackgroundViewCMa();
  v4 = (char *)v7.receiver;
  -[TabOverview.BackgroundView _setContinuousCornerRadius:](&v7, sel__setContinuousCornerRadius_, a3);
  v5 = *(void **)&v4[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView];
  objc_msgSend(v4, sel__continuousCornerRadius, v7.receiver, v7.super_class);
  objc_msgSend(v5, sel__setContinuousCornerRadius_);
  v6 = *(void **)&v4[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView];
  objc_msgSend(v4, sel__continuousCornerRadius);
  objc_msgSend(v6, sel__setContinuousCornerRadius_);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_s14BackgroundViewCMa();
  v2 = (char *)v5.receiver;
  -[TabOverview.BackgroundView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView));
}

@end
