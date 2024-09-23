@implementation CNFSettingsViewController

- (CNFSettingsViewController)init
{
  CNFSettingsViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFSettingsViewController;
  v2 = -[CNFSettingsViewController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFSettingsViewController name](v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addListenerID:capabilities:", v4, *MEMORY[0x24BE509E8]);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_containerViewControllerShouldUpdate_, CFSTR("CNFSettingsViewControllerNeedsContainerUpdate"), 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNFSettingsViewController;
  -[CNFSettingsViewController viewDidLoad](&v10, sel_viewDidLoad);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Container – viewDidLoad", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConnected");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockUntilConnected");

  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    CNFRegSetGlobalAppearanceStyle(2);
    CNFRegSetSupportsAutoRotation(1);
  }
  -[CNFSettingsViewController _loadChildViewController](self, "_loadChildViewController");
}

- (void)_loadChildViewController
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[CNFSettingsViewController serviceType](self, "serviceType");
  CNFRegSetStringTableForServiceType(v3);
  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 0:
LABEL_4:
      objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;
      goto LABEL_8;
  }
  v5 = 0;
LABEL_8:
  if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:](CNFRegAppleIDSplashViewController, "shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:", v5, 0))
  {
    v6 = (objc_class *)objc_opt_class();
  }
  else
  {
    -[CNFSettingsViewController settingsClassName](self, "settingsClassName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSClassFromString(v7);

  }
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Container view controller choosing to show initialChildViewControllerClass %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    NSStringFromClass(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  v10 = (void *)MEMORY[0x24BE75590];
  -[CNFSettingsViewController specifierTitle](self, "specifierTitle", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFSettingsViewController settingsClassName](self, "settingsClassName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v13, CFSTR("cnf-completionclass"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("ft-serviceType"));

  objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("cnf-hideLearnMoreButton"));
  CreateDetailControllerInstanceWithClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    if ((objc_msgSend(v16, "isConnected") & 1) == 0)
      objc_msgSend(v16, "connect:", 1);

  }
  objc_msgSend(v15, "setSpecifier:", v12);
  -[CNFSettingsViewController set_currentChildViewController:](self, "set_currentChildViewController:", v15);
  if (-[CNFSettingsViewController _hasPendingDeepLink](self, "_hasPendingDeepLink"))
    -[CNFSettingsViewController _invokePendingDeepLink](self, "_invokePendingDeepLink");

}

- (void)set_currentChildViewController:(id)a3
{
  PSController *v5;
  PSController **p_currentChildViewController;
  PSController *currentChildViewController;
  void *v8;
  PSController *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PSController *v25;

  v5 = (PSController *)a3;
  p_currentChildViewController = &self->__currentChildViewController;
  currentChildViewController = self->__currentChildViewController;
  if (currentChildViewController != v5)
  {
    v25 = v5;
    if (currentChildViewController)
    {
      -[PSController willMoveToParentViewController:](currentChildViewController, "willMoveToParentViewController:", 0);
      -[PSController view](*p_currentChildViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[PSController removeFromParentViewController](*p_currentChildViewController, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->__currentChildViewController, a3);
    v9 = *p_currentChildViewController;
    -[CNFSettingsViewController rootController](self, "rootController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSController setRootController:](v9, "setRootController:", v10);

    v5 = v25;
    if (v25)
    {
      -[CNFSettingsViewController addChildViewController:](self, "addChildViewController:", v25);
      -[CNFSettingsViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[PSController view](v25, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

      -[CNFSettingsViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSController view](v25, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[PSController didMoveToParentViewController:](v25, "didMoveToParentViewController:", self);
      -[PSController specifier](v25, "specifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFSettingsViewController setTitle:](self, "setTitle:", v24);

      v5 = v25;
    }
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)CNFSettingsViewController;
  -[CNFSettingsViewController viewDidLayoutSubviews](&v30, sel_viewDidLayoutSubviews);
  -[CNFSettingsViewController _currentChildViewController](self, "_currentChildViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CNFSettingsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v32.origin.x = v14;
  v32.origin.y = v15;
  v32.size.width = v16;
  v32.size.height = v17;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  v18 = CGRectEqualToRect(v31, v32);

  if (!v18)
  {
    -[CNFSettingsViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[CNFSettingsViewController _currentChildViewController](self, "_currentChildViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

  }
}

- (void)applicationDidResume
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFSettingsViewController;
  -[CNFSettingsViewController applicationDidResume](&v3, sel_applicationDidResume);
  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetCacheSubscriptionInfo");

}

- (void)containerViewControllerShouldUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  CNFSettingsViewController *v11;
  CNFSettingsViewController *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  CNFSettingsViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Container received notification to re-determine child view controller.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFSettingsViewController _loadChildViewController](self, "_loadChildViewController");
  -[CNFSettingsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFSettingsViewController parentViewController](self, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (-[CNFSettingsViewController parentViewController](self, "parentViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "containsObject:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[CNFSettingsViewController parentViewController](self, "parentViewController");
    v11 = (CNFSettingsViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = self;
  }
  v12 = v11;
  -[CNFSettingsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "popToViewController:animated:", v12, 0);

  OSLogHandleForIDSCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Container view controller attempted to pop to {%@}.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  CNFPendingDeepLinkRepresentation *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CNFPendingDeepLinkRepresentation);
  -[CNFPendingDeepLinkRepresentation setResourceDictionary:](v8, "setResourceDictionary:", v6);
  -[CNFPendingDeepLinkRepresentation setCompletion:](v8, "setCompletion:", v7);
  -[CNFSettingsViewController setPendingDeepLinkRepresentation:](self, "setPendingDeepLinkRepresentation:", v8);
  -[CNFSettingsViewController _currentChildViewController](self, "_currentChildViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNFSettingsViewController _invokePendingDeepLink](self, "_invokePendingDeepLink");
  }
  else
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to route a prefs link because we have no contained child controller to forward to. Will try again after the childViewController is configured.", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (BOOL)_hasPendingDeepLink
{
  return self->_pendingDeepLinkRepresentation != 0;
}

- (void)_invokePendingDeepLink
{
  NSObject *v3;
  void *v4;
  void *v5;
  CNFPendingDeepLinkRepresentation *pendingDeepLinkRepresentation;
  void *v7;
  uint8_t v8[16];

  if (self->_pendingDeepLinkRepresentation)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Forwarding pending prefs deep link now that child controller is configured.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    -[CNFPendingDeepLinkRepresentation resourceDictionary](self->_pendingDeepLinkRepresentation, "resourceDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFPendingDeepLinkRepresentation completion](self->_pendingDeepLinkRepresentation, "completion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pendingDeepLinkRepresentation = self->_pendingDeepLinkRepresentation;
    self->_pendingDeepLinkRepresentation = 0;

    -[CNFSettingsViewController _currentChildViewController](self, "_currentChildViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleURL:withCompletion:", v4, v5);

  }
}

- (id)specifierTitle
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFSettingsViewController.m"), 254, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (int64_t)serviceType
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFSettingsViewController.m"), 259, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (id)settingsClassName
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFSettingsViewController.m"), 264, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (id)name
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFSettingsViewController.m"), 269, CFSTR("Call to abstract method (%@) on %@"), v5, objc_opt_class());

  return 0;
}

- (PSController)_currentChildViewController
{
  return self->__currentChildViewController;
}

- (CNFPendingDeepLinkRepresentation)pendingDeepLinkRepresentation
{
  return self->_pendingDeepLinkRepresentation;
}

- (void)setPendingDeepLinkRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDeepLinkRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeepLinkRepresentation, 0);
  objc_storeStrong((id *)&self->__currentChildViewController, 0);
}

@end
