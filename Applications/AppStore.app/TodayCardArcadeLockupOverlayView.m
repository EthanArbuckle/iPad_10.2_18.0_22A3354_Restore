@implementation TodayCardArcadeLockupOverlayView

- (_TtC8AppStore32TodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32TodayCardArcadeLockupOverlayView *)sub_100590CE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32TodayCardArcadeLockupOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100592124();
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[TodayCardArcadeLockupOverlayView _continuousCornerRadius](&v3, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  char *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[TodayCardArcadeLockupOverlayView _setContinuousCornerRadius:](&v6, "_setContinuousCornerRadius:", a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_backgroundEffectView], "_setCornerRadius:continuous:maskedCorners:", 1, 12, a3, v6.receiver, v6.super_class);
  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_arcadeLockupView], "layer");
  objc_msgSend(v5, "setMaskedCorners:", 12);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_arcadeLockupView), "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore32TodayCardArcadeLockupOverlayView *v2;

  v2 = self;
  sub_100591408();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_arcadeLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_backgroundEffectView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->arcadeLockupView[OBJC_IVAR____TtC8AppStore32TodayCardArcadeLockupOverlayView_impressionsUpdateBlock]);
}

@end
