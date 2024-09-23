@implementation PHPTTFullScreenContainerViewController

- (PHPTTFullScreenContainerViewController)initWithBannerPresentationManager:(id)a3
{
  id v4;
  PHPTTFullScreenContainerViewController *v5;
  PHPTTFullScreenContainerViewController *v6;
  void *v7;
  uint64_t v8;
  UIViewController *pttFullScreenViewController;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHPTTFullScreenContainerViewController;
  v5 = -[PHPTTFullScreenContainerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    -[PHPTTFullScreenContainerViewController obtainDismissalAssertion](v5, "obtainDismissalAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "callStateChangedNotification:", TUBargeCallStatusChangedNotification, 0);

    v8 = objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController pttViewControllerWithBannerPresentationManager:](v6, "pttViewControllerWithBannerPresentationManager:", v4));
    pttFullScreenViewController = v6->_pttFullScreenViewController;
    v6->_pttFullScreenViewController = (UIViewController *)v8;

    if (v6->_pttFullScreenViewController)
    {
      -[PHPTTFullScreenContainerViewController addChildViewController:](v6, "addChildViewController:");
      -[UIViewController didMoveToParentViewController:](v6->_pttFullScreenViewController, "didMoveToParentViewController:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController view](v6, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v6->_pttFullScreenViewController, "view"));
      objc_msgSend(v10, "addSubview:", v11);

      -[PHPTTFullScreenContainerViewController setupConstraints](v6, "setupConstraints");
    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHPTTFullScreenContainerViewController;
  -[PHPTTFullScreenContainerViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHPTTFullScreenContainerViewController;
  -[PHPTTFullScreenContainerViewController viewDidLoad](&v2, "viewDidLoad");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupConstraints
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  id firstValue;

  firstValue = (id)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_pttFullScreenViewController, "view"));
  objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController view](self, "view"));
  v4 = _NSDictionaryOfVariableBindings(CFSTR("pttFullScreenView"), firstValue, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[pttFullScreenView]|"), 0, 0, v5));
  objc_msgSend(v3, "addConstraints:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPTTFullScreenContainerViewController view](self, "view"));
  v8 = _NSDictionaryOfVariableBindings(CFSTR("pttFullScreenView"), firstValue, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[pttFullScreenView]|"), 0, 0, v9));
  objc_msgSend(v7, "addConstraints:", v10);

}

- (void)callStateChangedNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "isPTT") && objc_msgSend(v4, "status") - 5 <= 1)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Releasing PTT dismissal assertion.", v7, 2u);
    }

    -[PHPTTFullScreenContainerViewController releaseDismissalAssertion](self, "releaseDismissalAssertion");
  }

}

- (void)releaseDismissalAssertion
{
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason"));
}

- (void)obtainDismissalAssertion
{
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHInitialPTTFullScreenPresentationAssertionReason"));
}

- (UIViewController)pttFullScreenViewController
{
  return self->_pttFullScreenViewController;
}

- (void)setPttFullScreenViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pttFullScreenViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pttFullScreenViewController, 0);
}

- (id)pttViewControllerWithBannerPresentationManager:(id)a3
{
  id v4;
  PHPTTFullScreenContainerViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)PHPTTFullScreenContainerViewController.pttViewController(bannnerPresentationManager:)();

  return v6;
}

@end
