@implementation MediaControlsTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  MediaControlsPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UIPreviewPresentationController initWithPresentedViewController:presentingViewController:]([MediaControlsPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[MediaControlsAnimationController initForPresenting:]([MediaControlsAnimationController alloc], "initForPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[MediaControlsAnimationController initForPresenting:]([MediaControlsAnimationController alloc], "initForPresenting:", 0);
}

@end
