@implementation LegacyTodayCardArcadeLockupOverlayView

- (_TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView *)sub_10044CB2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10044DC94();
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[LegacyTodayCardArcadeLockupOverlayView _continuousCornerRadius](&v3, "_continuousCornerRadius");
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
  -[LegacyTodayCardArcadeLockupOverlayView _setContinuousCornerRadius:](&v6, "_setContinuousCornerRadius:", a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_backgroundEffectView], "_setCornerRadius:continuous:maskedCorners:", 1, 12, a3, v6.receiver, v6.super_class);
  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView], "layer");
  objc_msgSend(v5, "setMaskedCorners:", 12);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView), "sizeThatFits:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView *v2;

  v2 = self;
  sub_10044D24C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_backgroundEffectView));
  swift_weakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->arcadeLockupView[OBJC_IVAR____TtC22SubscribePageExtension38LegacyTodayCardArcadeLockupOverlayView_impressionsUpdateBlock]);
}

@end
