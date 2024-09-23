@implementation AXUINubbitContext

- (UIView)nubbit
{
  return self->_nubbit;
}

- (void)setNubbit:(id)a3
{
  objc_storeStrong((id *)&self->_nubbit, a3);
}

- (AXUINubbitDelegate)delegate
{
  return (AXUINubbitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, a3);
}

- (AXAssertion)disableDashBoardSystemGesturesAssertion
{
  return self->_disableDashBoardSystemGesturesAssertion;
}

- (void)setDisableDashBoardSystemGesturesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_disableDashBoardSystemGesturesAssertion, a3);
}

- (UIPanGestureRecognizer)moveNubbitGestureRecognizer
{
  return self->_moveNubbitGestureRecognizer;
}

- (void)setMoveNubbitGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_moveNubbitGestureRecognizer, a3);
}

- (AXDispatchTimer)fadeTimer
{
  return self->_fadeTimer;
}

- (void)setFadeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeTimer, a3);
}

- (UIDynamicAnimator)dynamicAnimator
{
  return self->_dynamicAnimator;
}

- (void)setDynamicAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAnimator, a3);
}

- (UIGravityBehavior)gravityBehavior
{
  return self->_gravityBehavior;
}

- (void)setGravityBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_gravityBehavior, a3);
}

- (UIAttachmentBehavior)followPanBehavior
{
  return self->_followPanBehavior;
}

- (void)setFollowPanBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_followPanBehavior, a3);
}

- (UISnapBehavior)snapToBoundaryBehavior
{
  return self->_snapToBoundaryBehavior;
}

- (void)setSnapToBoundaryBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_snapToBoundaryBehavior, a3);
}

- (UICollisionBehavior)collisionBehavior
{
  return self->_collisionBehavior;
}

- (void)setCollisionBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_collisionBehavior, a3);
}

- (UIDynamicItemBehavior)dynamicItemBehavior
{
  return self->_dynamicItemBehavior;
}

- (void)setDynamicItemBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicItemBehavior, a3);
}

- (double)originalAlpha
{
  return self->_originalAlpha;
}

- (void)setOriginalAlpha:(double)a3
{
  self->_originalAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicItemBehavior, 0);
  objc_storeStrong((id *)&self->_collisionBehavior, 0);
  objc_storeStrong((id *)&self->_snapToBoundaryBehavior, 0);
  objc_storeStrong((id *)&self->_followPanBehavior, 0);
  objc_storeStrong((id *)&self->_gravityBehavior, 0);
  objc_storeStrong((id *)&self->_dynamicAnimator, 0);
  objc_storeStrong((id *)&self->_fadeTimer, 0);
  objc_storeStrong((id *)&self->_moveNubbitGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_disableDashBoardSystemGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_disableSystemGesturesAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nubbit, 0);
}

@end
