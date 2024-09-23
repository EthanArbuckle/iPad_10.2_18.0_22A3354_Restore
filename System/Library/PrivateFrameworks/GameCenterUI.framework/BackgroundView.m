@implementation BackgroundView

- (_TtC12GameCenterUI14BackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI14BackgroundView *)sub_1AB4C6DAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI14BackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4C6FFC();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI14BackgroundView *v2;

  v2 = self;
  sub_1AB4C7190();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC12GameCenterUI14BackgroundView *v2;

  v2 = self;
  sub_1AB4C7288();

}

- (void).cxx_destruct
{
  sub_1AB4C73EC(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *(uint64_t *)((char *)&self->super._animationInfo + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle), *((_BYTE *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundStyle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundVisualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundHighlightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14BackgroundView_backgroundGradientLayer));
}

@end
