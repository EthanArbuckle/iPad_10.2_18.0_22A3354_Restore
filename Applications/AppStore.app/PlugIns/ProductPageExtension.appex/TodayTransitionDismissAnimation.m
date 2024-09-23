@implementation TodayTransitionDismissAnimation

- (double)transitionDuration:(id)a3
{
  _TtC20ProductPageExtension31TodayTransitionDismissAnimation *v5;
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
  _TtC20ProductPageExtension31TodayTransitionDismissAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1005F1C44(a3);
  swift_unknownObjectRelease();

}

- (_TtC20ProductPageExtension31TodayTransitionDismissAnimation)init
{
  _TtC20ProductPageExtension31TodayTransitionDismissAnimation *result;

  result = (_TtC20ProductPageExtension31TodayTransitionDismissAnimation *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.TodayTransitionDismissAnimation", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
