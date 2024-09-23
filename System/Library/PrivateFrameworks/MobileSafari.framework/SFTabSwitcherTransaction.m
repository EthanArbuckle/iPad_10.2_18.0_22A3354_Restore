@implementation SFTabSwitcherTransaction

- (SFAnimationSettings)animationSettings
{
  return (SFAnimationSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings));
}

- (void)setAnimationSettings:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings) = (Class)a3;
  v3 = a3;

}

- (SFTabSwitcherItem)insertedItemToDismissTo
{
  return (SFTabSwitcherItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo));
}

- (void)setInsertedItemToDismissTo:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo) = (Class)a3;
  v3 = a3;

}

- (BOOL)prefersDetachedTransition
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition);
}

- (void)setPrefersDetachedTransition:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition) = a3;
}

- (SFTabSwitcherScrollPosition)targetScrollPosition
{
  return (SFTabSwitcherScrollPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition));
}

- (void)setTargetScrollPosition:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition) = (Class)a3;
  v3 = a3;

}

- (SFTabSwitcherTransaction)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition) = 0;
  v3.receiver = self;
  v3.super_class = (Class)SFTabSwitcherTransaction;
  return -[SFTabSwitcherTransaction init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
