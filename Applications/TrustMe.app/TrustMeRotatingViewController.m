@implementation TrustMeRotatingViewController

- (void)viewDidLoad
{
  unsigned __int8 v2;
  UIApplication *v3;
  id v4;
  objc_super v5;
  SEL v6;
  TrustMeRotatingViewController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)TrustMeRotatingViewController;
  -[TrustMeRotatingViewController viewDidLoad](&v5, "viewDidLoad");
  v2 = objc_msgSend(UIApp, "_getSpringBoardOrientation");
  v7->_mask = 1 << v2;
  v3 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v4 = -[UIApplication delegate](v3, "delegate");

  objc_msgSend(v4, "setCurrentRemoteAlertController:", v7);
  objc_storeStrong(&v4, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_mask;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  UIApplication *v3;
  id v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  TrustMeRotatingViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TrustMeRotatingViewController;
  -[TrustMeRotatingViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v3 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v5 = -[UIApplication delegate](v3, "delegate");

  v4 = objc_msgSend(v5, "trustControllerToBePresentedByRemoteAlertViewController");
  if (sub_100005280() == UIUserInterfaceIdiomPad)
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[TrustMeRotatingViewController presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v4, 1);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
}

- (void)handleHomeButtonPressed
{
  UIApplication *v2;
  id v3[3];

  v3[2] = self;
  v3[1] = (id)a2;
  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3[0] = -[UIApplication delegate](v2, "delegate");

  objc_msgSend(v3[0], "homeButtonWasPressed");
  objc_storeStrong(v3, 0);
}

- (void)_willAppearInRemoteViewController
{
  id v2;
  objc_super v3;
  SEL v4;
  TrustMeRotatingViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)TrustMeRotatingViewController;
  -[TrustMeRotatingViewController _willAppearInRemoteViewController](&v3, "_willAppearInRemoteViewController");
  v2 = -[TrustMeRotatingViewController _remoteViewControllerProxy](v5, "_remoteViewControllerProxy");
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v2, "setSupportedInterfaceOrientationOverride:", v5->_mask);
  objc_msgSend(v2, "setShouldDisableFadeInAnimation:", 1);
  objc_storeStrong(&v2, 0);
}

- (void)dismissSheetAndDismissAlert
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100005528;
  v7 = &unk_1000081A8;
  v8[0] = self;
  -[TrustMeRotatingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

@end
