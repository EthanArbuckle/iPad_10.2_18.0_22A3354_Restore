@implementation SSSDittoRemoteAlertViewController

- (SSSDittoRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SSSDittoRemoteAlertViewController *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backgroundView;
  UIVisualEffectView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSDittoRemoteAlertViewController;
  v4 = -[SSSDittoRemoteAlertViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", a3, a4);
  v5 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
  backgroundView = v4->_backgroundView;
  v4->_backgroundView = v5;

  v7 = v4->_backgroundView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", +[SSChromeHelper backgroundBlurEffectStyle](SSChromeHelper, "backgroundBlurEffectStyle")));
  -[UIVisualEffectView setEffect:](v7, "setEffect:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v4->_backgroundView, "layer"));
  objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

  -[UIVisualEffectView setUserInteractionEnabled:](v4->_backgroundView, "setUserInteractionEnabled:", 0);
  -[UIVisualEffectView setAlpha:](v4->_backgroundView, "setAlpha:", 0.0);
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_addRootViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SSSDittoRemoteAlertViewController addChildViewController:](self, "addChildViewController:", self->_rootViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  objc_msgSend(v3, "addSubview:", v4);

  -[SSSDittoRootViewController didMoveToParentViewController:](self->_rootViewController, "didMoveToParentViewController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self->_rootViewController, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  objc_msgSend(v6, "setFrame:");

}

- (void)_performDismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

}

- (void)viewWillLayoutSubviews
{
  UIVisualEffectView *backgroundView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  -[SSSDittoRemoteAlertViewController viewWillLayoutSubviews](&v5, "viewWillLayoutSubviews");
  backgroundView = self->_backgroundView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");

}

- (void)setIsTransitioningStates:(BOOL)a3
{
  if (-[SSSDittoRemoteAlertViewController isTransitioningStates](self, "isTransitioningStates") != a3)
  {
    self->_isTransitioningStates = a3;
    -[SSSDittoRemoteAlertViewController _updateReachabilityEnabled](self, "_updateReachabilityEnabled");
  }
}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
  void (**v6)(void);

  v6 = (void (**)(void))a5;
  -[SSSDittoRemoteAlertViewController setIsTransitioningStates:](self, "setIsTransitioningStates:", 1);
  v6[2]();

}

- (void)dittoRootViewController:(id)a3 didTransitionToState:(unint64_t)a4
{
  void *v5;

  if (!a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController viewControllerManager](self, "viewControllerManager", a3));
    objc_msgSend(v5, "moveFromRemoteAlertViewControllerToRemoteViewController");

  }
  -[SSSDittoRemoteAlertViewController setIsTransitioningStates:](self, "setIsTransitioningStates:", 0);
}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)dittoRootViewControllerFinishedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4
{
  id v6;

  if (!objc_msgSend(a3, "state") && !a4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v6, "moveFromRemoteAlertViewControllerToRemoteViewController");

  }
}

- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5
{
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];

  v6 = 1.0;
  if (!a4)
    v6 = 0.0;
  if (a5 <= 0.00000011920929)
  {
    -[UIVisualEffectView setAlpha:](self->_backgroundView, "setAlpha:", a3, v6);
  }
  else
  {
    v7 = a5 * 0.6;
    v8 = a5 * 0.4;
    if (!a4)
      v8 = 0.0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000FA04;
    v9[3] = &unk_1000919E0;
    v9[4] = self;
    *(double *)&v9[5] = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, v7, v8);
  }
}

- (void)becomeParentOfDittoRootViewController:(id)a3
{
  SSSDittoRootViewController **p_rootViewController;
  id v6;
  void *v7;

  p_rootViewController = &self->_rootViewController;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  v6 = a3;
  -[SSSDittoRootViewController setDelegate:](*p_rootViewController, "setDelegate:", self);
  -[SSSDittoRemoteAlertViewController _addRootViewController](self, "_addRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController view](self, "view"));
  objc_msgSend(v7, "insertSubview:atIndex:", self->_backgroundView, 0);

  -[SSSDittoRemoteAlertViewController _updateReachabilityEnabled](self, "_updateReachabilityEnabled");
}

- (void)stopBeingParentOfDittoRootViewController:(id)a3
{
  UIVisualEffectView *backgroundView;
  void *v4;
  id v5;

  backgroundView = self->_backgroundView;
  v5 = a3;
  -[UIVisualEffectView removeFromSuperview](backgroundView, "removeFromSuperview");
  objc_msgSend(v5, "willMoveToParentViewController:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v5, "removeFromParentViewController");
}

- (void)cleanupRootViewController
{
  SSSDittoRootViewController *rootViewController;

  -[SSSDittoRootViewController setDelegate:](self->_rootViewController, "setDelegate:", 0);
  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  -[SSSDittoRemoteAlertViewController _performDismiss](self, "_performDismiss");
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)handleButtonActions:(id)a3
{
  int v4;
  SSSDittoRootViewController *rootViewController;

  v4 = _SSShouldHomeButtonDismiss(self, a2, a3);
  rootViewController = self->_rootViewController;
  if (v4)
    -[SSSDittoRootViewController performProgrammaticDismiss](rootViewController, "performProgrammaticDismiss");
  else
    -[SSSDittoRootViewController pipify](rootViewController, "pipify");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRemoteAlertViewController;
  -[SSSDittoRemoteAlertViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SSSDittoRootViewController performInteractiveGesturePresentationCompleteAnimations](self->_rootViewController, "performInteractiveGesturePresentationCompleteAnimations");
}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  -[SSSDittoRemoteAlertViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dittoRemoteAlertDelegate);
  objc_msgSend(WeakRetained, "dittoRemoteAlertViewControllerViewWillAppear:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  -[SSSDittoRemoteAlertViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  SSApplyDebuggingCustomizationsToViewIfAppropriate(v3, v4, 30.0);

}

- (id)childViewControllerForStatusBarStyle
{
  return -[SSSDittoRootViewController childViewControllerForStatusBarStyle](self->_rootViewController, "childViewControllerForStatusBarStyle");
}

- (id)childViewControllerForStatusBarHidden
{
  return -[SSSDittoRootViewController childViewControllerForStatusBarHidden](self->_rootViewController, "childViewControllerForStatusBarHidden");
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSDittoRemoteAlertViewController;
  v5 = (void (**)(_QWORD))a4;
  -[SSSDittoRemoteAlertViewController prepareForActivationWithContext:completion:](&v6, "prepareForActivationWithContext:completion:", a3, v5);
  v5[2](v5);

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setDesiredHardwareButtonEvents:", 16);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "setOrientationChangedEventsEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v7, "setLaunchingInterfaceOrientation:", objc_msgSend(v8, "activeInterfaceOrientation"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "setAllowsAlertItems:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setAllowsAlertStacking:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setReachabilityDisabled:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SSSDittoRemoteAlertViewControllerIsReadyForViewControllerManagerNotificationName"), self);

  v13[2]();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)_updateReachabilityEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = -[SSSDittoRemoteAlertViewController isTransitioningStates](self, "isTransitioningStates");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "setReachabilityDisabled:", v3);

}

- (BOOL)_shouldForceLayoutForHostedAnimation
{
  return 0;
}

- (SSSViewControllerManager)viewControllerManager
{
  return (SSSViewControllerManager *)objc_loadWeakRetained((id *)&self->viewControllerManager);
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->viewControllerManager, a3);
}

- (SSSDittoRemoteAlertViewControllerDelegate)dittoRemoteAlertDelegate
{
  return (SSSDittoRemoteAlertViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_dittoRemoteAlertDelegate);
}

- (void)setDittoRemoteAlertDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dittoRemoteAlertDelegate, a3);
}

- (BOOL)isTransitioningStates
{
  return self->_isTransitioningStates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dittoRemoteAlertDelegate);
  objc_destroyWeak((id *)&self->viewControllerManager);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
