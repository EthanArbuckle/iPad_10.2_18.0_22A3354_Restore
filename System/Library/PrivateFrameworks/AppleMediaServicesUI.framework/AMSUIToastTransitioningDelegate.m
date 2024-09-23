@implementation AMSUIToastTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  AMSUIToastPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSUIToastPresentationController initWithPresentedViewController:presentingViewController:]([AMSUIToastPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)_animator
{
  _BOOL4 IsReduceMotionEnabled;
  __objc2_class **v3;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = off_24CB4DFC0;
  if (!IsReduceMotionEnabled)
    v3 = off_24CB4E030;
  return objc_alloc_init(*v3);
}

@end
