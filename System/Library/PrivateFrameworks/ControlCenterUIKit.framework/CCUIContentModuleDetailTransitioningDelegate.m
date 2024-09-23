@implementation CCUIContentModuleDetailTransitioningDelegate

- (CCUIContentModuleDetailTransitioningDelegate)initWithAnchoringViewController:(id)a3
{
  id v5;
  CCUIContentModuleDetailTransitioningDelegate *v6;
  CCUIContentModuleDetailTransitioningDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIContentModuleDetailTransitioningDelegate;
  v6 = -[CCUIContentModuleDetailTransitioningDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_anchoringViewController, a3);

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  CCUIContentModuleDetailPresentationController *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CCUIContentModuleDetailPresentationController initWithPresentedViewController:presentingViewController:anchoringViewController:]([CCUIContentModuleDetailPresentationController alloc], "initWithPresentedViewController:presentingViewController:anchoringViewController:", v8, v7, self->_anchoringViewController);

  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[CCUIContentModuleDetailAnimationController initForPresenting:anchoringViewController:]([CCUIContentModuleDetailAnimationController alloc], "initForPresenting:anchoringViewController:", 1, self->_anchoringViewController);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[CCUIContentModuleDetailAnimationController initForPresenting:anchoringViewController:]([CCUIContentModuleDetailAnimationController alloc], "initForPresenting:anchoringViewController:", 0, self->_anchoringViewController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchoringViewController, 0);
}

@end
