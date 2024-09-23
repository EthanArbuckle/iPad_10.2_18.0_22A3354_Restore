@implementation AppPromotionDetailPageCloseAnimation

- (double)transitionDuration:(id)a3
{
  _TtC8AppStore36AppPromotionDetailPageCloseAnimation *v5;
  double v6;
  id v7;
  _TtC8AppStore36AppPromotionDetailPageCloseAnimation *v8;
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
    v8 = (_TtC8AppStore36AppPromotionDetailPageCloseAnimation *)objc_msgSend(objc_allocWithZone((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v7, 0.0);

    -[AppPromotionDetailPageCloseAnimation duration](v8, "duration");
    v6 = v9;
    swift_unknownObjectRelease(a3);

    v5 = v8;
  }

  return v6;
}

- (void)animateTransition:(id)a3
{
  _TtC8AppStore36AppPromotionDetailPageCloseAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000C0800((char *)a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC8AppStore36AppPromotionDetailPageCloseAnimation)init
{
  _TtC8AppStore36AppPromotionDetailPageCloseAnimation *result;

  result = (_TtC8AppStore36AppPromotionDetailPageCloseAnimation *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppPromotionDetailPageCloseAnimation", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageCloseAnimation_toCardView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageCloseAnimation_toCollectionViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AppPromotionDetailPageCloseAnimation_detailPageViewController));
}

@end
