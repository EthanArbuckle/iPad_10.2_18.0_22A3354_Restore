@implementation HUCCDashboardContainerViewController

- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3
{
  id v4;
  HUCCDashboardContainerViewController *v5;
  HUCCDashboardContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCDashboardContainerViewController;
  v5 = -[HUCCDashboardContainerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[HUCCDashboardContainerViewController expandedContentFrame](self, "expandedContentFrame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[HUCCDashboardContainerViewController setView:](self, "setView:", v4);

  objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HUCCDashboardContainerViewController _requestRemoteViewControllerForHome:](self, "_requestRemoteViewControllerForHome:", v6);
}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    -[HUCCDashboardContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

  }
  -[HUCCDashboardContainerViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willBeginTransition:forCompactModule:", v5, v4);

}

- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  void *v4;
  id v5;

  if (!a3)
  {
    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
}

- (id)serviceViewControllerProxy
{
  void *v2;
  void *v3;

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)expandedContentFrame
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[HUCCDashboardContainerViewController preferredExpandedSize](self, "preferredExpandedSize");
  v6 = v5;
  if (v4 == 1)
  {
    CCUIExpandedModuleEdgeInsets();
    v6 = v6 + v7 * 2.0;
    -[HUCCDashboardContainerViewController preferredExpandedSize](self, "preferredExpandedSize");
    v9 = v8;
    CCUIExpandedModuleEdgeInsets();
    v11 = v9 + v10 * -4.0;
  }
  else
  {
    -[HUCCDashboardContainerViewController preferredExpandedSize](self, "preferredExpandedSize");
    v11 = v12;
  }
  v13 = 0.0;
  v14 = 0.0;
  v15 = v6;
  result.size.height = v11;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)preferredExpandedSize
{
  void *v2;
  uint64_t v3;
  double v4;
  CGFloat Width;
  double Height;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    CCUIDefaultExpandedContentModuleWidth();
    Width = v4;
    CCUIMaximumExpandedContentModuleHeight();
  }
  else
  {
    CCUIScreenBounds();
    Width = CGRectGetWidth(v10);
    CCUIScreenBounds();
    Height = CGRectGetHeight(v11);
  }
  v7 = Height;
  v8 = Width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_requestRemoteViewControllerForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[HUCCDashboardContainerViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &unk_24FFD58F8, 5.0);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FD7808;
  v7[3] = &unk_24FFD5920;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  +[HUCCRemoteDashboardViewController requestViewControllerWithConnectionHandler:](HUCCRemoteDashboardViewController, "requestViewControllerWithConnectionHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCDashboardContainerViewController setCancelServiceInvocation:](self, "setCancelServiceInvocation:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HUCCDashboardContainerViewController _addNewRemoteViewController:](self, "_addNewRemoteViewController:", v10);
    -[HUCCDashboardContainerViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureHomeControlServiceWithHomeUUID:", v13);

    objc_initWeak(&location, self);
    -[HUCCDashboardContainerViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_230FD7A40;
    v15[3] = &unk_24FFD5948;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v14, "getTransitionSubviewFramesWithCompletion:", v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(CFSTR("Unexpected remote view controller: %@"), v8);
  }

}

- (void)_stopAndRemoveRemoteViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginAppearanceTransition:animated:", 0, 0);

    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);

    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "disconnect");

    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

    -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAppearanceTransition");

    -[HUCCDashboardContainerViewController setRemoteDashboardViewController:](self, "setRemoteDashboardViewController:", 0);
  }
}

- (void)_addNewRemoteViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  -[HUCCDashboardContainerViewController _stopAndRemoveRemoteViewController](self, "_stopAndRemoveRemoteViewController");
  -[HUCCDashboardContainerViewController setRemoteDashboardViewController:](self, "setRemoteDashboardViewController:", v4);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCDashboardContainerViewController addChildViewController:](self, "addChildViewController:", v7);

  -[HUCCDashboardContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "didMoveToParentViewController:", self);

  -[HUCCDashboardContainerViewController remoteDashboardViewController](self, "remoteDashboardViewController");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "endAppearanceTransition");

}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_230FD861C((uint64_t)v5, v6);

  -[HUCCDashboardContainerViewController setRemoteDashboardViewController:](self, "setRemoteDashboardViewController:", 0);
}

- (void)requestDismissal
{
  id v2;

  -[HUCCDashboardContainerViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDismissal");

}

- (void)requestLockAuthenticationForRemoteDashboard:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[HUCCDashboardContainerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FD7E08;
  v5[3] = &unk_24FFD57C8;
  v5[4] = self;
  objc_msgSend(v4, "requestAuthenticationIfLockedWithCompletionHandler:", v5);

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUCCDashboardContainerViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickControlsPresentationDidUpdate:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSubviewFrames, a3);
}

- (HUCCRemoteDashboardViewController)remoteDashboardViewController
{
  return self->_remoteDashboardViewController;
}

- (void)setRemoteDashboardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDashboardViewController, a3);
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_cancelServiceInvocation, a3);
}

- (HUCCDashboardContainerViewControllerDelegate)delegate
{
  return (HUCCDashboardContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong((id *)&self->_remoteDashboardViewController, 0);
  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
}

@end
