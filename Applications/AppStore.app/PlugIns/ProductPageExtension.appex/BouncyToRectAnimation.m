@implementation BouncyToRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  _TtC20ProductPageExtension21BouncyToRectAnimation *v5;
  _TtC20ProductPageExtension21BouncyToRectAnimation *v6;
  uint64_t v7;
  void *v8;
  _TtC20ProductPageExtension21BouncyToRectAnimation *v9;
  _TtC20ProductPageExtension21BouncyToRectAnimation *v10;

  swift_unknownObjectRetain(a3);
  v10 = self;
  sub_100071FF4(0);
  sub_1004D28D0(a3);
  if (*((_BYTE *)&v10->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC20ProductPageExtension21BouncyToRectAnimation *)objc_msgSend(a3, "viewControllerForKey:", UITransitionContextToViewControllerKey)) != 0)
  {
    v6 = v5;
    v7 = objc_opt_self(UITabBarController);
    v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
    if (v8)
      sub_1005BF310(v8, a3, 0);
    swift_unknownObjectRelease();

    v9 = v6;
  }
  else
  {
    swift_unknownObjectRelease();
    v9 = v10;
  }

}

- (_TtC20ProductPageExtension21BouncyToRectAnimation)init
{
  _TtC20ProductPageExtension21BouncyToRectAnimation *result;

  result = (_TtC20ProductPageExtension21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.BouncyToRectAnimation", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
