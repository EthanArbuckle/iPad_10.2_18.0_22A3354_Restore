@implementation _UNNotificationContentExtensionVendorViewController

- (_UNNotificationContentExtensionVendorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _UNNotificationContentExtensionVendorViewController *v4;
  _UNNotificationContentExtensionVendorViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  v4 = -[_UNNotificationContentExtensionVendorViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    atomic_store(0, (unsigned __int8 *)&v4->_invalidationOnceFlag);
    UNRegisterUserNotificationsUILogging();
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UNNotificationContentExtensionVendorViewController _invalidateExtensionContext](self, "_invalidateExtensionContext");
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("title"));

  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController dealloc](&v4, sel_dealloc);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  void *v4;
  id v5;

  -[_UNNotificationContentExtensionVendorViewController notificationExtensionVendorContext](self, "notificationExtensionVendorContext", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionWantsToBecomeFirstResponder:", objc_msgSend(v4, "canBecomeFirstResponder"));

}

- (void)addChildViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController addChildViewController:](&v6, sel_addChildViewController_, v4);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254E674B0))
  {
    -[_UNNotificationContentExtensionVendorViewController _setupExtensionViewController:](self, "_setupExtensionViewController:", v4);
  }
  else
  {
    v5 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
      -[_UNNotificationContentExtensionVendorViewController addChildViewController:].cold.1(v5, (uint64_t)v4, self);
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  v4 = a3;
  -[_UNNotificationContentExtensionVendorViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);
  objc_msgSend(v4, "preferredContentSizeDidChangeForChildContentContainer:", self, v5.receiver, v5.super_class);

}

- (void)loadView
{
  _UNNotificationContentExtensionVendorViewControllerView *v3;
  void *v4;
  _UNNotificationContentExtensionVendorViewControllerView *v5;

  v3 = [_UNNotificationContentExtensionVendorViewControllerView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[_UNNotificationContentExtensionVendorViewControllerView initWithFrame:](v3, "initWithFrame:");

  -[_UNNotificationContentExtensionVendorViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  UIScrollViewDelayedTouchesBeganGestureRecognizer *v3;
  UIScrollViewDelayedTouchesBeganGestureRecognizer *touchDelayGestureRecognizer;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = (UIScrollViewDelayedTouchesBeganGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D58]), "initWithTarget:action:", self, sel_delayed_);
  touchDelayGestureRecognizer = self->_touchDelayGestureRecognizer;
  self->_touchDelayGestureRecognizer = v3;

  -[UIScrollViewDelayedTouchesBeganGestureRecognizer setDelaysTouchesBegan:](self->_touchDelayGestureRecognizer, "setDelaysTouchesBegan:", 1);
  -[_UNNotificationContentExtensionVendorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_touchDelayGestureRecognizer);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[_UNNotificationContentExtensionVendorViewController notificationExtensionVendorContext](self, "notificationExtensionVendorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_extensionWantsToUpdateMediaPlayPauseButton");

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[_UNNotificationContentExtensionVendorViewController viewWillAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_beginAppearanceTransition:animated:", 1, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[_UNNotificationContentExtensionVendorViewController viewDidAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_endAppearanceTransition:", 1);

  -[_UNNotificationContentExtensionVendorViewController notificationExtensionVendorContext](self, "notificationExtensionVendorContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_extensionWantsMessagesFromHostDelivered");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v10 = "-[_UNNotificationContentExtensionVendorViewController viewWillDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_beginAppearanceTransition:animated:", 0, v3);

  -[_UNNotificationContentExtensionVendorViewController firstResponder](self, "firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[_UNNotificationContentExtensionVendorViewController viewDidDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_endAppearanceTransition:", 0);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController preferredContentSizeDidChangeForChildContentContainer:](&v12, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[_UNNotificationContentExtensionVendorViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "preferredContentSize");
  if (v6 != v10 || v8 != v9)
  {
    objc_msgSend(v4, "preferredContentSize");
    -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

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
  v9.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  v7 = a4;
  -[_UNNotificationContentExtensionVendorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106___UNNotificationContentExtensionVendorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24D5BB318;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  double Width;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  v4 = a3;
  -[_UNNotificationContentExtensionVendorViewController systemLayoutFittingSizeDidChangeForChildContentContainer:](&v17, sel_systemLayoutFittingSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v17.receiver, v17.super_class);
  v6 = v5;
  v8 = v7;

  if (v6 == *MEMORY[0x24BDBF148] && v8 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UNNotificationContentExtensionVendorViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    Width = CGRectGetWidth(v18);

    LODWORD(v14) = 1148846080;
    LODWORD(v15) = 1112014848;
    objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v14, v15);
    if (v16 > 0.0)
      -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width);

  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController beginRequestWithExtensionContext:](&v6, sel_beginRequestWithExtensionContext_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "setNotificationExtensionContainer:", self);
  }
  else
  {
    v5 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
      -[_UNNotificationContentExtensionVendorViewController beginRequestWithExtensionContext:].cold.1(v5);
  }

}

- (void)setPreferredContentSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionVendorViewController;
  -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height);
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (void)preserveInputViews
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6C50], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_preserveInputViewsWithId:animated:", v3, 1);

}

- (void)restoreInputViews
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6C50], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_restoreInputViewsWithId:animated:", v3, 1);

}

- (id)_extensionBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1488];
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationExtensionVendorContext
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[_UNNotificationContentExtensionVendorViewController extensionContext](self, "extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_setupExtensionViewController:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_extensionViewController, a3);
  v5 = a3;
  -[_UNNotificationContentExtensionVendorViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "addSubview:", v6);
  objc_msgSend(v5, "preferredContentSize");
  -[_UNNotificationContentExtensionVendorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 1, 0);

}

- (void)_invalidateExtensionContext
{
  atomic_flag *p_invalidationOnceFlag;
  unsigned __int8 v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_invalidationOnceFlag = &self->_invalidationOnceFlag;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidationOnceFlag);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidationOnceFlag));
  if ((v4 & 1) == 0)
  {
    v5 = UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446210;
      v8 = "-[_UNNotificationContentExtensionVendorViewController _invalidateExtensionContext]";
      _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
    }
    -[_UNNotificationContentExtensionVendorViewController extensionContext](self, "extensionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completeRequestReturningItems:completionHandler:", 0, 0);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  -[_UNNotificationContentExtensionVendorViewController extensionViewController](self, "extensionViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v9)
    goto LABEL_4;
  v12 = objc_msgSend(v14, "isEqualToString:", CFSTR("title"));

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationContentExtensionVendorViewController notificationExtensionVendorContext](self, "notificationExtensionVendorContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_extensionDidUpdateTitle:", v11);

LABEL_4:
  }

}

- (UNNotificationContentExtension)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_touchDelayGestureRecognizer, 0);
}

- (void)addChildViewController:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)&unk_254E674B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_216870000, v4, OS_LOG_TYPE_ERROR, "View controller %{public}@ in extension %{public}@ does not conform to protocol %{public}@", (uint8_t *)&v9, 0x20u);

}

- (void)beginRequestWithExtensionContext:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_216870000, v1, OS_LOG_TYPE_ERROR, "Unexpected extension context class: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
