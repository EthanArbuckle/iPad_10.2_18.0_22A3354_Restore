@implementation TodayTransitionPresentAnimation

- (double)transitionDuration:(id)a3
{
  _TtC22SubscribePageExtension31TodayTransitionPresentAnimation *v5;
  id v6;
  id v7;
  double result;

  if (!a3)
    return 0.0;
  swift_unknownObjectRetain_n(a3, 2);
  v5 = self;
  v6 = objc_msgSend(a3, "containerView");
  v7 = objc_msgSend(v6, "traitCollection");

  LOBYTE(v6) = UITraitCollection.isSizeClassCompact.getter();
  swift_unknownObjectRelease_n(a3, 2);

  result = 0.61;
  if ((v6 & 1) != 0)
    return 0.62;
  return result;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension31TodayTransitionPresentAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10044C93C(0);
  if (*((_BYTE *)&v5->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_100111E7C(a3);
  }
  else
  {
    sub_100111A94(a3);
    if ((*((_BYTE *)&v5->super.super.isa
          + OBJC_IVAR____TtC22SubscribePageExtension31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_1001118FC(a3);
  }
  swift_unknownObjectRelease(a3);

}

- (_TtC22SubscribePageExtension31TodayTransitionPresentAnimation)init
{
  _TtC22SubscribePageExtension31TodayTransitionPresentAnimation *result;

  result = (_TtC22SubscribePageExtension31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.TodayTransitionPresentAnimation", 54, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
