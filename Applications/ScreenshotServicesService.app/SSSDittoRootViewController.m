@implementation SSSDittoRootViewController

- (SSSDittoRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SSSDittoRootViewController *v4;
  SSSDittoDismissTimer *v5;
  SSSDittoDismissTimer *dismissTimer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSDittoRootViewController;
  v4 = -[SSSDittoRootViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = objc_alloc_init(SSSDittoDismissTimer);
  dismissTimer = v4->_dismissTimer;
  v4->_dismissTimer = v5;

  -[SSSDittoDismissTimer setDelegate:](v4->_dismissTimer, "setDelegate:", v4);
  return v4;
}

- (void)screenshotReceived:(id)a3 completion:(id)a4
{
  SSSDittoDismissTimer *dismissTimer;
  id v7;
  id v8;

  dismissTimer = self->_dismissTimer;
  v7 = a4;
  v8 = a3;
  -[SSSDittoDismissTimer newScreenshotReceived](dismissTimer, "newScreenshotReceived");
  -[SSSDittoRootViewController _createAndParentContainerViewControllerIfPossible](self, "_createAndParentContainerViewControllerIfPossible");
  -[SSSContainerViewController addScreenshot:completion:](self->_containerViewController, "addScreenshot:completion:", v8, v7);

}

- (void)_createContainerViewControllerIfNecessary
{
  SSSContainerViewController *v3;
  SSSContainerViewController *containerViewController;

  if (!self->_containerViewController)
  {
    v3 = objc_alloc_init(SSSContainerViewController);
    containerViewController = self->_containerViewController;
    self->_containerViewController = v3;

    -[SSSContainerViewController setDelegate:](self->_containerViewController, "setDelegate:", self);
    -[SSSDittoRootViewController _updateForCurrentSize](self, "_updateForCurrentSize");
  }
}

- (void)_createAndParentContainerViewControllerIfPossible
{
  SSSDittoRootViewController *v3;

  -[SSSDittoRootViewController _createContainerViewControllerIfNecessary](self, "_createContainerViewControllerIfNecessary");
  v3 = (SSSDittoRootViewController *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController parentViewController](self->_containerViewController, "parentViewController"));

  if (v3 != self)
    -[SSSDittoRootViewController _addContainerViewController:](self, "_addContainerViewController:", self->_containerViewController);
}

- (void)_addContainerViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SSSDittoRootViewController addChildViewController:](self, "addChildViewController:", self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self->_containerViewController, "view"));
  objc_msgSend(v4, "addSubview:", v5);

  -[SSSContainerViewController didMoveToParentViewController:](self->_containerViewController, "didMoveToParentViewController:", self);
  -[SSSDittoDismissTimer setUserInterfaceHidden:](self->_dismissTimer, "setUserInterfaceHidden:", 0);
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_containerViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_containerViewController;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (void)performInteractiveGesturePresentationCompleteAnimations
{
  -[SSSContainerViewController performInteractiveGesturePresentationCompleteAnimations](self->_containerViewController, "performInteractiveGesturePresentationCompleteAnimations");
}

- (void)containerViewController:(id)a3 willTransitionToState:(unint64_t)a4 animated:(BOOL)a5 changeBlock:(id)a6
{
  id v9;
  id v10;
  void ***v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SSSDittoRootViewController *v17;
  id v18;
  unint64_t v19;
  BOOL v20;

  v9 = a6;
  if (a4 == 1)
    -[SSSDittoDismissTimer setViewState:](self->_dismissTimer, "setViewState:", 1);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10001DCB0;
  v16 = &unk_100091F10;
  v18 = v9;
  v19 = a4;
  v20 = a5;
  v17 = self;
  v10 = v9;
  v11 = objc_retainBlock(&v13);
  self->_containerViewControllerTargetState = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate", v13, v14, v15, v16, v17));
  objc_msgSend(v12, "dittoRootViewController:willTransitionToState:changeBlock:", self, a4, v11);

  -[SSSDittoRootViewController _postNotificationForWillChangeToState:](self, "_postNotificationForWillChangeToState:", a4);
}

- (void)containerViewController:(id)a3 didTransitionToState:(unint64_t)a4
{
  void *v6;

  if (!a4)
    -[SSSDittoDismissTimer setViewState:](self->_dismissTimer, "setViewState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate", a3));
  objc_msgSend(v6, "dittoRootViewController:didTransitionToState:", self, a4);

  -[SSSDittoRootViewController _postNotificationForDidChangeToState:](self, "_postNotificationForDidChangeToState:", a4);
}

- (void)containerViewControllerHadGestureInteraction:(id)a3
{
  -[SSSDittoDismissTimer userInteractionOccurred](self->_dismissTimer, "userInteractionOccurred", a3);
}

- (void)containerViewControllerBeganDragAndDrop:(id)a3
{
  self->_isInDragAndDrop = 1;
  -[SSSDittoDismissTimer setInDragAndDrop:](self->_dismissTimer, "setInDragAndDrop:", 1);
}

- (void)containerViewControllerEndedDragAndDrop:(id)a3 shouldDismiss:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  self->_isInDragAndDrop = 0;
  -[SSSDittoDismissTimer setInDragAndDrop:](self->_dismissTimer, "setInDragAndDrop:", 0);
  if (v4)
    -[SSSDittoRootViewController _dismissAnimated:](self, "_dismissAnimated:", 0);
}

- (void)containerViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  SSSDittoDismissTimer *dismissTimer;
  id v6;
  id v7;

  dismissTimer = self->_dismissTimer;
  v6 = a4;
  -[SSSDittoDismissTimer setShowingSharingUI:](dismissTimer, "setShowingSharingUI:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
  objc_msgSend(v7, "dittoRootViewController:willShowTestFlightUIWithBlock:", self, v6);

}

- (void)containerViewController:(id)a3 willShowSharingUIWithBlock:(id)a4
{
  SSSDittoDismissTimer *dismissTimer;
  id v6;
  id v7;

  dismissTimer = self->_dismissTimer;
  v6 = a4;
  -[SSSDittoDismissTimer setShowingSharingUI:](dismissTimer, "setShowingSharingUI:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
  objc_msgSend(v7, "dittoRootViewController:willShowShowSharingUIWithBlock:", self, v6);

}

- (void)containerViewControllerEndedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SSSDittoDismissTimer setShowingSharingUI:](self->_dismissTimer, "setShowingSharingUI:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
  objc_msgSend(v6, "dittoRootViewControllerFinishedShowingSharingUI:inStateTransition:", self, v4);

}

- (void)containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:(id)a3
{
  -[SSSDittoDismissTimer setShowingWaitingForImageIdentifierUpdatesUI:](self->_dismissTimer, "setShowingWaitingForImageIdentifierUpdatesUI:", 1);
}

- (void)containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:(id)a3
{
  -[SSSDittoDismissTimer setShowingWaitingForImageIdentifierUpdatesUI:](self->_dismissTimer, "setShowingWaitingForImageIdentifierUpdatesUI:", 0);
}

- (void)_postNotificationName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", v3, 0);

}

- (void)_postNotificationForWillChangeToState:(unint64_t)a3
{
  _QWORD *v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = &SSScreenshotsDisplayModeWillChangeToFullscreenNotificationName;
  }
  else
  {
    v3 = &SSScreenshotsDisplayModeWillChangeToPictureInPictureNotificationName;
  }
  -[SSSDittoRootViewController _postNotificationName:](self, "_postNotificationName:", *v3);
}

- (void)_postNotificationForDidChangeToState:(unint64_t)a3
{
  _QWORD *v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = &SSScreenshotsDisplayModeDidChangeToFullscreenNotificationName;
  }
  else
  {
    v3 = &SSScreenshotsDisplayModeDidChangeToPictureInPictureNotificationName;
  }
  -[SSSDittoRootViewController _postNotificationName:](self, "_postNotificationName:", *v3);
}

- (void)_updateForCurrentSize
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[SSSDittoRootViewController _updateForSize:](self, "_updateForSize:", v3, v4);

}

- (void)_updateForSize:(CGSize)a3
{
  double height;
  double width;
  double y;
  id v6;

  height = a3.height;
  width = a3.width;
  y = CGRectZero.origin.y;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self->_containerViewController, "view"));
  objc_msgSend(v6, "setFrame:", CGRectZero.origin.x, y, width, height);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSDittoRootViewController;
  v7 = a4;
  -[SSSDittoRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E1A0;
  v8[3] = &unk_100091F38;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController parentViewController](self, "parentViewController"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (void)pipify
{
  -[SSSDittoRootViewController pipifyWithCompletion:](self, "pipifyWithCompletion:", 0);
}

- (void)pipifyWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  SSSContainerViewController *containerViewController;
  void *v6;
  NSObject *v7;
  unint64_t v8;

  v4 = (void (**)(_QWORD))a3;
  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController hostingViewController](self, "hostingViewController"));
    objc_msgSend(v6, "stopBeingParentOfDittoRootViewController:", self);
    objc_msgSend(v6, "cleanupRootViewController");
    v7 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100057E28(v7);

    containerViewController = self->_containerViewController;
  }
  if (self->_containerViewControllerTargetState
    && (v8 = -[SSSContainerViewController state](containerViewController, "state"),
        containerViewController = self->_containerViewController,
        v8))
  {
    -[SSSContainerViewController commitInflightEditsIfNecessary](containerViewController, "commitInflightEditsIfNecessary");
    -[SSSContainerViewController setState:animated:completion:](self->_containerViewController, "setState:animated:completion:", 0, 1, v4);
  }
  else
  {
    -[SSSContainerViewController removeDescendantViewControllers](containerViewController, "removeDescendantViewControllers");
    if (v4)
      v4[2](v4);
  }

}

- (void)fullscreenify
{
  -[SSSDittoRootViewController fullscreenifyWithCompletion:](self, "fullscreenifyWithCompletion:", 0);
}

- (void)fullscreenifyWithCompletion:(id)a3
{
  -[SSSContainerViewController setState:animated:completion:](self->_containerViewController, "setState:animated:completion:", 1, 1, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRootViewController;
  -[SSSDittoRootViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setTintColor:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRootViewController;
  -[SSSDittoRootViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SSSDittoRootViewController _createAndParentContainerViewControllerIfPossible](self, "_createAndParentContainerViewControllerIfPossible");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRootViewController;
  -[SSSDittoRootViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[SSSContainerViewController viewDidDisappear:](self->_containerViewController, "viewDidDisappear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRootViewController;
  -[SSSDittoRootViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SSSDittoRootViewController resignFirstResponder](self, "resignFirstResponder");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dittoDismissTimerFired:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager", a3));
  objc_msgSend(v4, "pipSlidOffscreenDueToTimeout");

  -[SSSDittoRootViewController _dismissAnimated:](self, "_dismissAnimated:", 1);
}

- (void)containerViewController:(id)a3 willBeginDismissAnimationWithSettings:(id)a4
{
  id v6;
  void *v7;
  SSSContainerViewController *v8;

  v8 = (SSSContainerViewController *)a3;
  v6 = a4;
  if (self->_containerViewController == v8)
  {
    self->_containerViewController = 0;

  }
  -[SSSDittoDismissTimer setPerformingDismissAnimation:](self->_dismissTimer, "setPerformingDismissAnimation:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
  objc_msgSend(v6, "duration");
  objc_msgSend(v7, "dittoRootViewController:wantsBackground:duration:", self, 0);

}

- (void)containerViewControllerDidEndDismissAnimation:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  SSSContainerViewController *v8;

  v8 = (SSSContainerViewController *)a3;
  -[SSSDittoDismissTimer setPerformingDismissAnimation:](self->_dismissTimer, "setPerformingDismissAnimation:", 0);
  -[SSSContainerViewController willMoveToParentViewController:](v8, "willMoveToParentViewController:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](v8, "view"));
  objc_msgSend(v4, "removeFromSuperview");

  -[SSSContainerViewController setDelegate:](v8, "setDelegate:", 0);
  -[SSSContainerViewController removeFromParentViewController](v8, "removeFromParentViewController");
  if (self->_containerViewController == v8)
  {
    self->_containerViewController = 0;

    -[SSSDittoDismissTimer setUserInterfaceHidden:](self->_dismissTimer, "setUserInterfaceHidden:", 1);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "dittoRootViewControllerDidDismiss:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoRootViewController delegate](self, "delegate"));
    objc_msgSend(v7, "dittoRootViewControllerDidDismiss:", self);

  }
}

- (void)_dismissAnimated:(BOOL)a3
{
  -[SSSDittoRootViewController _dismissAnimated:completion:](self, "_dismissAnimated:completion:", a3, 0);
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  -[SSSContainerViewController dismissScreenshotsAnimated:completion:](self->_containerViewController, "dismissScreenshotsAnimated:completion:", a3, a4);
}

- (void)performProgrammaticDismiss
{
  -[SSSDittoRootViewController _dismissAnimated:](self, "_dismissAnimated:", 1);
}

- (void)performProgrammaticDismissWithCompletion:(id)a3
{
  -[SSSDittoRootViewController _dismissAnimated:completion:](self, "_dismissAnimated:completion:", 1, a3);
}

- (unint64_t)state
{
  return -[SSSContainerViewController state](self->_containerViewController, "state");
}

- (BOOL)shouldAnimateDragCancel
{
  return self->_isInDragAndDrop;
}

- (SSSDittoRootViewControllerDelegate)delegate
{
  return (SSSDittoRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSSDittoViewController)hostingViewController
{
  return (SSSDittoViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void)setHostingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewController, a3);
}

- (SSSViewControllerManager)viewControllerManager
{
  return (SSSViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end
