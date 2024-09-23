@implementation AKAuthorizationContaineriPadViewController

- (AKAuthorizationContaineriPadViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  AKAuthorizationContaineriPadViewController *v4;
  AKAuthorizationContaineriPadViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContaineriPadViewController;
  v4 = -[AKAuthorizationContainerViewController initWithRootViewController:authorizationContext:](&v8, sel_initWithRootViewController_authorizationContext_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AKAuthorizationContaineriPadViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 5);
    -[AKAuthorizationContainerViewController rootViewController](v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModalPresentationStyle:", 2);

  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationContaineriPadViewController;
  -[AKAuthorizationContaineriPadViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[AKAuthorizationContaineriPadViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[AKAuthorizationContainerViewController rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContaineriPadViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationContaineriPadViewController;
  -[AKAuthorizationContaineriPadViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[AKAuthorizationContaineriPadViewController isBeingDismissed](self, "isBeingDismissed"))
    -[AKAuthorizationContaineriPadViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
