@implementation BouncyFromRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  _TtC20ProductPageExtension23BouncyFromRectAnimation *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1004E360C(a3);
  if (*((_BYTE *)&v5->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension23BouncyFromRectAnimation_shouldAnimateTabBar) == 1)
    sub_1004E3478(a3);
  swift_unknownObjectRelease();

}

- (_TtC20ProductPageExtension23BouncyFromRectAnimation)init
{
  _TtC20ProductPageExtension23BouncyFromRectAnimation *result;

  result = (_TtC20ProductPageExtension23BouncyFromRectAnimation *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.BouncyFromRectAnimation", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
