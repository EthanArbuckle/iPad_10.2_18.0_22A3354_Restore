@implementation BouncyFromRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension23BouncyFromRectAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1005B95E4(a3);
  if (*((_BYTE *)&v5->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension23BouncyFromRectAnimation_shouldAnimateTabBar) == 1)
    sub_1005B9450(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC22SubscribePageExtension23BouncyFromRectAnimation)init
{
  _TtC22SubscribePageExtension23BouncyFromRectAnimation *result;

  result = (_TtC22SubscribePageExtension23BouncyFromRectAnimation *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.BouncyFromRectAnimation", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
