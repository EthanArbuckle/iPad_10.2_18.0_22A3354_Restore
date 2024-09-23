@implementation CKFullScreenCardAppViewController

- (CKFullScreenCardAppViewController)initWithConversation:(id)a3 plugin:(id)a4
{
  id v5;
  CKFullScreenCardAppViewController *v6;
  CKFullScreenCardAppViewController *v7;
  void *v8;

  v5 = a3;
  v6 = -[CKFullScreenCardAppViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[CKFullScreenCardAppViewController setConversation:](v6, "setConversation:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleRemoteConnectionInterrupted_, *MEMORY[0x1E0D37E88], 0);

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenCardAppViewController;
  -[CKFullScreenCardAppViewController loadView](&v5, sel_loadView);
  -[CKFullScreenCardAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenCardAppViewController setLastKnownDeviceOrientation:](self, "setLastKnownDeviceOrientation:", objc_msgSend(v4, "orientation"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKFullScreenCardAppViewController;
  -[CKFullScreenCardAppViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[CKFullScreenCardAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKFullScreenCardAppViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CKFullScreenCardAppViewController dismissView](self, "dismissView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[CKFullScreenCardAppViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[CKFullScreenCardAppViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenCardAppViewController contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenCardAppViewController;
  -[CKFullScreenCardAppViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKFullScreenCardAppViewController;
  -[CKFullScreenCardAppViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[CKFullScreenCardAppViewController setEditing:](self, "setEditing:", 0);
  -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDismissing");

  if ((v5 & 1) == 0)
  {
    -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismiss");

  }
}

- (void)setContentViewController:(id)a3
{
  CKBrowserViewControllerProtocol *v5;
  CKBrowserViewControllerProtocol **p_contentViewController;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  CKBrowserViewControllerProtocol *v11;

  v5 = (CKBrowserViewControllerProtocol *)a3;
  p_contentViewController = &self->_contentViewController;
  if (self->_contentViewController != v5)
  {
    v11 = v5;
    -[CKFullScreenCardAppViewController removeChildViewController:](self, "removeChildViewController:");
    -[CKBrowserViewControllerProtocol view](*p_contentViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[CKBrowserViewControllerProtocol didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", 0);
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[CKBrowserViewControllerProtocol browserScrolledOnScreen](v11, "browserScrolledOnScreen");
      -[CKFullScreenCardAppViewController addChildViewController:](self, "addChildViewController:", *p_contentViewController);
      -[CKBrowserViewControllerProtocol view](*p_contentViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenCardAppViewController setContentView:](self, "setContentView:", v8);

      -[CKBrowserViewControllerProtocol didMoveToParentViewController:](*p_contentViewController, "didMoveToParentViewController:", self);
      if (CKIsRunningInMessages())
      {
        v9 = -[CKFullScreenCardAppViewController _currentPluginIsJellyfish](self, "_currentPluginIsJellyfish");
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIdleTimerDisabled:", v9);

      }
    }
    -[CKFullScreenCardAppViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[CKFullScreenCardAppViewController reloadInputViews](self, "reloadInputViews");
    v5 = v11;
  }

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v9 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[CKFullScreenCardAppViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[CKFullScreenCardAppViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (CGRect)finalContentViewFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[CKFullScreenCardAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKFullScreenCardAppViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v5 + v13;

  -[CKFullScreenCardAppViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v16;
  -[CKFullScreenCardAppViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v9 - (v17 + v19);

  v21 = v14;
  v22 = v7;
  v23 = v20;
  v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  CKDismissView *dismissView;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

  dismissView = self->_dismissView;
  if (dismissView)
    -[CKDismissView setDelegate:](dismissView, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CKFullScreenCardAppViewController;
  -[CKFullScreenCardAppViewController dealloc](&v6, sel_dealloc);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setNavigationBarHidden:animated:", 1, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  CKBrowserViewControllerProtocol *contentViewController;
  void *v4;
  unint64_t v5;

  contentViewController = self->_contentViewController;
  if (contentViewController)
    return -[CKBrowserViewControllerProtocol supportedInterfaceOrientations](contentViewController, "supportedInterfaceOrientations");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

  return v5;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  objc_super v7;

  -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredStatusBarStyle");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKFullScreenCardAppViewController;
    return -[CKFullScreenCardAppViewController preferredStatusBarStyle](&v7, sel_preferredStatusBarStyle);
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 2 * (objc_msgSend(v4, "horizontalSizeClass") != 1);
  else
    v7 = 0;

  return v7;
}

- (id)inputAccessoryView
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowChatChrome");

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKFullScreenCardAppViewController;
  v7 = a4;
  -[CKFullScreenCardAppViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__CKFullScreenCardAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E27502E0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __88__CKFullScreenCardAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  result = objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation");
  if (result != v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expandedAppViewControllerDidTransitionFromOrientation:toOrientation:", objc_msgSend(*(id *)(a1 + 32), "lastKnownDeviceOrientation"), v3);

    }
    objc_msgSend(*(id *)(a1 + 32), "setLastKnownDeviceOrientation:", v3);
    return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  }
  return result;
}

- (BOOL)_currentPluginIsJellyfish
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKFullScreenCardAppViewController balloonPlugin](self, "balloonPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_updateDimmingViewAlpha
{
  double v3;
  id v4;

  if (-[CKFullScreenCardAppViewController _shouldShowDimmingView](self, "_shouldShowDimmingView"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[CKFullScreenCardAppViewController dismissView](self, "dismissView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (BOOL)_shouldShowDimmingView
{
  return 0;
}

- (CKBrowserViewControllerProtocol)contentViewController
{
  return self->_contentViewController;
}

- (CKExpandedAppViewControllerDelegate)delegate
{
  return (CKExpandedAppViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void)setShouldDisableSnapshotView:(BOOL)a3
{
  self->_shouldDisableSnapshotView = a3;
}

- (UIViewControllerTransitioningDelegate)parentTransitioningDelegate
{
  return (UIViewControllerTransitioningDelegate *)objc_loadWeakRetained((id *)&self->_parentTransitioningDelegate);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CKDismissView)dismissView
{
  return self->_dismissView;
}

- (void)setDismissView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissView, a3);
}

- (BOOL)inTransition
{
  return self->_inTransition;
}

- (void)setInTransition:(BOOL)a3
{
  self->_inTransition = a3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (int64_t)lastKnownDeviceOrientation
{
  return self->_lastKnownDeviceOrientation;
}

- (void)setLastKnownDeviceOrientation:(int64_t)a3
{
  self->_lastKnownDeviceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_dismissView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_parentTransitioningDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return 0;
}

- (BOOL)shouldDisableInsetsForGrabber
{
  return 0;
}

- (BOOL)isDismissing
{
  return 0;
}

- (BOOL)isPrimaryViewController
{
  return -[CKBrowserViewControllerProtocol isPrimaryViewController](self->_contentViewController, "isPrimaryViewController");
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  -[CKBrowserViewControllerProtocol setIsPrimaryViewController:](self->_contentViewController, "setIsPrimaryViewController:", a3);
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)-[CKBrowserViewControllerProtocol presentationViewController](self->_contentViewController, "presentationViewController");
}

- (void)setPresentationViewController:(id)a3
{
  -[CKBrowserViewControllerProtocol setPresentationViewController:](self->_contentViewController, "setPresentationViewController:", a3);
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  return (CKBrowserViewControllerSendDelegate *)-[CKBrowserViewControllerProtocol sendDelegate](self->_contentViewController, "sendDelegate");
}

- (void)setSendDelegate:(id)a3
{
  -[CKBrowserViewControllerProtocol setSendDelegate:](self->_contentViewController, "setSendDelegate:", a3);
}

- (IMBalloonPlugin)balloonPlugin
{
  return (IMBalloonPlugin *)-[CKBrowserViewControllerProtocol balloonPlugin](self->_contentViewController, "balloonPlugin");
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return (IMBalloonPluginDataSource *)-[CKBrowserViewControllerProtocol balloonPluginDataSource](self->_contentViewController, "balloonPluginDataSource");
}

- (void)setBalloonPluginDataSource:(id)a3
{
  -[CKBrowserViewControllerProtocol setBalloonPluginDataSource:](self->_contentViewController, "setBalloonPluginDataSource:", a3);
}

- (BOOL)shouldShowChatChrome
{
  return -[CKBrowserViewControllerProtocol shouldShowChatChrome](self->_contentViewController, "shouldShowChatChrome");
}

- (BOOL)isiMessage
{
  return -[CKBrowserViewControllerProtocol isiMessage](self->_contentViewController, "isiMessage");
}

- (void)setIsiMessage:(BOOL)a3
{
  -[CKBrowserViewControllerProtocol setIsiMessage:](self->_contentViewController, "setIsiMessage:", a3);
}

- (BOOL)isBusiness
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CKBrowserViewControllerProtocol isBusiness](self->_contentViewController, "isBusiness");
  else
    return 0;
}

- (void)setIsBusiness:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKBrowserViewControllerProtocol setIsBusiness:](self->_contentViewController, "setIsBusiness:", v3);
}

- (NSString)conversationID
{
  return (NSString *)-[CKBrowserViewControllerProtocol conversationID](self->_contentViewController, "conversationID");
}

- (void)setConversationID:(id)a3
{
  -[CKBrowserViewControllerProtocol setConversationID:](self->_contentViewController, "setConversationID:", a3);
}

- (int64_t)browserPresentationStyle
{
  return -[CKBrowserViewControllerProtocol browserPresentationStyle](self->_contentViewController, "browserPresentationStyle");
}

- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CKFullScreenCardAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:dataSource:]", "CKFullScreenCardAppViewController.m", 360, "false");
}

- (CKFullScreenCardAppViewController)initWithBalloonPlugin:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CKFullScreenCardAppViewController(CKBrowserViewControllerProtocol) initWithBalloonPlugin:]", "CKFullScreenCardAppViewController.m", 364, "false");
}

- (BOOL)isLoaded
{
  return 0;
}

- (BOOL)inExpandedPresentation
{
  return 0;
}

- (BOOL)inFullScreenModalPresentation
{
  return 1;
}

- (void)_handleRemoteConnectionInterrupted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D37E80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKFullScreenCardAppViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonPlugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToIgnoringCase:", v4))
    {
      if (_IMWillLog())
      {
        v11 = v7;
        _IMAlwaysLog();
      }
      -[CKFullScreenCardAppViewController sendDelegate](self, "sendDelegate", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKFullScreenCardAppViewController balloonPlugin](self, "balloonPlugin");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissAndReloadInputViews:forPlugin:", 1, v10);

    }
  }

}

@end
