@implementation CKNoAnimationSearchController

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[CKNoAnimationSearchFieldAnimator initWithAppearing:]([CKNoAnimationSearchFieldAnimator alloc], "initWithAppearing:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[CKNoAnimationSearchFieldAnimator initWithAppearing:]([CKNoAnimationSearchFieldAnimator alloc], "initWithAppearing:", 0);
}

@end
