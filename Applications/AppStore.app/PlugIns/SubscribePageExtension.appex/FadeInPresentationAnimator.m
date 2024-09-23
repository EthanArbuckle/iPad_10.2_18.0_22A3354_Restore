@implementation FadeInPresentationAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension26FadeInPresentationAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1003D8390(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC22SubscribePageExtension26FadeInPresentationAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[FadeInPresentationAnimator init](&v3, "init");
}

@end
