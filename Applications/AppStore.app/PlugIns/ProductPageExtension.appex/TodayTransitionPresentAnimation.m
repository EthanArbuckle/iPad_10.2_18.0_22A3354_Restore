@implementation TodayTransitionPresentAnimation

- (double)transitionDuration:(id)a3
{
  _TtC20ProductPageExtension31TodayTransitionPresentAnimation *v5;
  id v6;
  id v7;
  uint64_t v8;
  __n128 v9;
  double result;

  if (!a3)
    return 0.0;
  swift_unknownObjectRetain_n(a3, 2);
  v5 = self;
  v6 = objc_msgSend(a3, "containerView");
  v7 = objc_msgSend(v6, "traitCollection");

  LOBYTE(v6) = UITraitCollection.isSizeClassCompact.getter(v8);
  swift_unknownObjectRelease_n(a3, 2, v9);

  result = 0.61;
  if ((v6 & 1) != 0)
    return 0.62;
  return result;
}

- (void)animateTransition:(id)a3
{
  _TtC20ProductPageExtension31TodayTransitionPresentAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100071FF4(0);
  if (*((_BYTE *)&v5->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_100483760(a3);
  }
  else
  {
    sub_100483378(a3);
    if ((*((_BYTE *)&v5->super.super.isa
          + OBJC_IVAR____TtC20ProductPageExtension31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_1004831E0(a3);
  }
  swift_unknownObjectRelease();

}

- (_TtC20ProductPageExtension31TodayTransitionPresentAnimation)init
{
  _TtC20ProductPageExtension31TodayTransitionPresentAnimation *result;

  result = (_TtC20ProductPageExtension31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.TodayTransitionPresentAnimation", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
