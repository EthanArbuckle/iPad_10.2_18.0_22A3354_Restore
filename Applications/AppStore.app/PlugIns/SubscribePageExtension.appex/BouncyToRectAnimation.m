@implementation BouncyToRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension21BouncyToRectAnimation *v5;
  _TtC22SubscribePageExtension21BouncyToRectAnimation *v6;
  uint64_t v7;
  void *v8;
  _TtC22SubscribePageExtension21BouncyToRectAnimation *v9;
  _TtC22SubscribePageExtension21BouncyToRectAnimation *v10;

  swift_unknownObjectRetain(a3);
  v10 = self;
  sub_10044C93C(0);
  sub_100032C90(a3);
  if (*((_BYTE *)&v10->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC22SubscribePageExtension21BouncyToRectAnimation *)objc_msgSend(a3, "viewControllerForKey:", UITransitionContextToViewControllerKey)) != 0)
  {
    v6 = v5;
    v7 = objc_opt_self(UITabBarController);
    v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
    if (v8)
      sub_1003F3948(v8, a3, 0);
    swift_unknownObjectRelease(a3);

    v9 = v6;
  }
  else
  {
    swift_unknownObjectRelease(a3);
    v9 = v10;
  }

}

- (_TtC22SubscribePageExtension21BouncyToRectAnimation)init
{
  _TtC22SubscribePageExtension21BouncyToRectAnimation *result;

  result = (_TtC22SubscribePageExtension21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.BouncyToRectAnimation", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
