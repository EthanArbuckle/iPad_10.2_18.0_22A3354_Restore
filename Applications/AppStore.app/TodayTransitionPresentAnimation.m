@implementation TodayTransitionPresentAnimation

- (double)transitionDuration:(id)a3
{
  _TtC8AppStore31TodayTransitionPresentAnimation *v5;
  id v6;
  id v7;
  uint64_t v8;
  double result;

  if (!a3)
    return 0.0;
  swift_unknownObjectRetain_n(a3, 2);
  v5 = self;
  v6 = objc_msgSend(a3, "containerView");
  v7 = objc_msgSend(v6, "traitCollection");

  LOBYTE(v6) = UITraitCollection.isSizeClassCompact.getter(v8);
  swift_unknownObjectRelease_n(a3, 2);

  result = 0.61;
  if ((v6 & 1) != 0)
    return 0.62;
  return result;
}

- (void)animateTransition:(id)a3
{
  _TtC8AppStore31TodayTransitionPresentAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10050C8DC(0);
  if (*((_BYTE *)&v5->super.super.isa
       + OBJC_IVAR____TtC8AppStore31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_10019E5B0(a3);
  }
  else
  {
    sub_10019E1C8(a3);
    if ((*((_BYTE *)&v5->super.super.isa
          + OBJC_IVAR____TtC8AppStore31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_10019E030(a3);
  }
  swift_unknownObjectRelease(a3);

}

- (_TtC8AppStore31TodayTransitionPresentAnimation)init
{
  _TtC8AppStore31TodayTransitionPresentAnimation *result;

  result = (_TtC8AppStore31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TodayTransitionPresentAnimation", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
