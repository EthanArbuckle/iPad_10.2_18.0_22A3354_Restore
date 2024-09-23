@implementation FadeOutDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  _TtC22SubscribePageExtension24FadeOutDismissalAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1004D06A0(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC22SubscribePageExtension24FadeOutDismissalAnimator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[FadeOutDismissalAnimator init](&v3, "init");
}

@end
