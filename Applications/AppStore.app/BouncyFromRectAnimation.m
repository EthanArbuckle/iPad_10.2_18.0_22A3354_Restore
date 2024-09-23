@implementation BouncyFromRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  _TtC8AppStore23BouncyFromRectAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10018E340(a3);
  if (*((_BYTE *)&v5->super.super.isa + OBJC_IVAR____TtC8AppStore23BouncyFromRectAnimation_shouldAnimateTabBar) == 1)
    sub_10018E1AC(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC8AppStore23BouncyFromRectAnimation)init
{
  _TtC8AppStore23BouncyFromRectAnimation *result;

  result = (_TtC8AppStore23BouncyFromRectAnimation *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BouncyFromRectAnimation", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
