@implementation HUAccessoryControlAnimator

- (HUAccessoryControlAnimator)init
{
  objc_super v4;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DashboardAccessoryControlAnimator();
  return -[HUAccessoryControlAnimator init](&v4, sel_init);
}

- (double)transitionDuration:(id)a3
{
  return 0.5181;
}

- (void)animateTransition:(id)a3
{
  char v5;
  HUAccessoryControlAnimator *v6;

  v5 = *((_BYTE *)&self->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType);
  swift_unknownObjectRetain();
  v6 = self;
  if ((v5 & 1) != 0)
    sub_1B8FC2550(a3);
  else
    sub_1B8FC1F54(a3);
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
