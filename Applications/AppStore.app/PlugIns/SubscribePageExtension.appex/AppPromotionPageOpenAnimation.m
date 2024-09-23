@implementation AppPromotionPageOpenAnimation

- (double)transitionDuration:(id)a3
{
  _TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *v5;
  double v6;
  id v7;
  _TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *v8;
  double v9;

  swift_unknownObjectRetain(a3);
  v5 = self;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    swift_unknownObjectRelease(a3);
    v6 = 0.3;
  }
  else
  {
    v7 = objc_msgSend(objc_allocWithZone((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 180.0, 22.0, 0.0, 0.0);
    v8 = (_TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *)objc_msgSend(objc_allocWithZone((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v7, 0.0);

    -[AppPromotionPageOpenAnimation duration](v8, "duration");
    v6 = v9;
    swift_unknownObjectRelease(a3);

    v5 = v8;
  }

  return v6;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1005F98FC((char *)a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC22SubscribePageExtension29AppPromotionPageOpenAnimation)init
{
  _TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *result;

  result = (_TtC22SubscribePageExtension29AppPromotionPageOpenAnimation *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppPromotionPageOpenAnimation", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCardView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCollectionViewController));
}

@end
