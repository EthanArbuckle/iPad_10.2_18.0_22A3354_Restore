@implementation QLRemoteItemViewController

- (QLRemoteItemViewController)init
{
  QLRemoteItemViewController *v2;
  QLRemoteItemViewController *v3;
  void *v4;
  uint64_t v5;
  QLCustomItemViewControllerHostProxy *hostViewControllerProxy;
  QLRemoteItemViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLRemoteItemViewController;
  v2 = -[QLItemViewController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[QLRemoteItemViewController view](v2, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("QLRemoteItemViewControllerHostViewAccessibilityIdentifier"));

    v5 = objc_opt_new();
    hostViewControllerProxy = v3->_hostViewControllerProxy;
    v3->_hostViewControllerProxy = (QLCustomItemViewControllerHostProxy *)v5;

    -[QLCustomItemViewControllerHostProxy setDelegate:](v3->_hostViewControllerProxy, "setDelegate:", v3);
    v3->_needsSetup = 1;
    v3->_readyToLoad = 0;
    v7 = v3;
  }

  return v3;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)QLRemoteItemViewController;
  v6 = a3;
  -[QLItemViewController setAppearance:animated:](&v10, sel_setAppearance_animated_, v6, v4);
  -[QLPreviewExtensionHostContext setAppearance:animated:](self->_hostContext, "setAppearance:animated:", v6, v4);

  if ((-[NSExtension ql_isPreviewExtensionThatHaveCustomPresentationView](self->_extension, "ql_isPreviewExtensionThatHaveCustomPresentationView") & 1) == 0)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__QLRemoteItemViewController_setAppearance_animated___block_invoke;
    aBlock[3] = &unk_24C724B00;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v7, 0.2);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

void __53__QLRemoteItemViewController_setAppearance_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topInset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setConstant:");

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomInset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setConstant:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_isAppearing = 1;
  -[QLPreviewExtensionHostContext previewWillAppear:](self->_hostContext, "previewWillAppear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  -[QLItemViewController previewWillAppear:](&v5, sel_previewWillAppear_, v3);
}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_isVisible = 1;
  -[QLPreviewExtensionHostContext previewDidAppear:](self->_hostContext, "previewDidAppear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  -[QLItemViewController previewDidAppear:](&v5, sel_previewDidAppear_, v3);
}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_isAppearing = 0;
  self->_isVisible = 0;
  -[QLPreviewExtensionHostContext previewWillDisappear:](self->_hostContext, "previewWillDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  -[QLItemViewController previewWillDisappear:](&v5, sel_previewWillDisappear_, v3);
}

- (void)previewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[QLPreviewExtensionHostContext previewDidDisappear:](self->_hostContext, "previewDidDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)QLRemoteItemViewController;
  -[QLItemViewController previewDidDisappear:](&v5, sel_previewDidDisappear_, v3);
}

- (BOOL)canEnterFullScreen
{
  return 1;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canShowNavBar
{
  NSExtension *extension;

  extension = self->_extension;
  if (extension)
    return -[NSExtension ql_isPreviewExtensionThatHaveCustomPresentationView](extension, "ql_isPreviewExtensionThatHaveCustomPresentationView") ^ 1;
  else
    return 1;
}

- (BOOL)canShowToolBar
{
  NSExtension *extension;

  extension = self->_extension;
  if (extension)
    return -[NSExtension ql_isPreviewExtensionThatHaveCustomPresentationView](extension, "ql_isPreviewExtensionThatHaveCustomPresentationView") ^ 1;
  else
    return 1;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;

  v7 = a4;
  -[QLRemoteItemViewController _registerLoadingHandler:](self, "_registerLoadingHandler:", a5);
  -[QLRemoteItemViewController _loadRemoteViewControllerForContext:](self, "_loadRemoteViewControllerForContext:", v7);

}

- (void)_loadRemoteViewControllerForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_needsSetup)
  {
    self->_needsSetup = 0;
    objc_msgSend(v4, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE7BED0], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applicationBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke;
      v16[3] = &unk_24C726E08;
      v13 = &v17;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v10, "remoteViewControllerForContentType:applicationBundleIdentifier:extensionType:generatonType:withCompletionHandler:", 0, v12, 0, 2, v16);

    }
    else
    {
      objc_msgSend(v5, "contentType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke_2;
      v14[3] = &unk_24C726E08;
      v13 = &v15;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v10, "remoteViewControllerForContentType:applicationBundleIdentifier:extensionType:generatonType:withCompletionHandler:", v11, 0, 0, 1, v14);
    }

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);

  }
}

void __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_performSetUpWithRemoteViewController:extension:request:hostContext:", v11, v12, v10, v9);

}

void __66__QLRemoteItemViewController__loadRemoteViewControllerForContext___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_performSetUpWithRemoteViewController:extension:request:hostContext:", v11, v12, v10, v9);

}

- (void)_performSetUpWithRemoteViewController:(id)a3 extension:(id)a4 request:(id)a5 hostContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  QLRemotePreviewHostViewController **p_remoteViewController;
  QLPreviewExtensionHostContext **p_hostContext;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *topConstraint;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *bottomConstraint;
  void *v42;
  NSLayoutConstraint *v43;
  void *v44;
  void (**readyToDisplay)(void);
  id v46;
  id v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_storeStrong((id *)&self->_extension, a4);
  v14 = a5;
  p_remoteViewController = &self->_remoteViewController;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  p_hostContext = &self->_hostContext;
  objc_storeStrong((id *)&self->_hostContext, a6);
  -[QLPreviewExtensionHostContext setRemoteItemViewController:](self->_hostContext, "setRemoteItemViewController:", self);
  -[QLRemotePreviewHostViewController setRemoteItemViewController:](self->_remoteViewController, "setRemoteItemViewController:", self);
  -[QLRemotePreviewHostViewController setExtension:](self->_remoteViewController, "setExtension:", v12);
  -[QLRemotePreviewHostViewController setRequest:](self->_remoteViewController, "setRequest:", v14);

  if (self->_remoteViewController && *p_hostContext)
  {
    v47 = v11;
    -[QLRemotePreviewHostViewController parentViewController](self->_remoteViewController, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[QLRemotePreviewHostViewController willMoveToParentViewController:](*p_remoteViewController, "willMoveToParentViewController:", 0);
      -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperview");

      -[QLRemotePreviewHostViewController removeFromParentViewController](*p_remoteViewController, "removeFromParentViewController");
    }
    -[QLRemoteItemViewController addChildViewController:](self, "addChildViewController:", *p_remoteViewController);
    -[QLRemoteItemViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[_UIRemoteViewController didMoveToParentViewController:](*p_remoteViewController, "didMoveToParentViewController:", self);
    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leftAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemoteItemViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemoteItemViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    v32 = (void *)MEMORY[0x24BDD1628];
    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemoteItemViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 3, 0, v34, 3, 1.0, 0.0);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topConstraint = self->_topConstraint;
    self->_topConstraint = v35;

    v37 = (void *)MEMORY[0x24BDD1628];
    -[QLRemoteItemViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemotePreviewHostViewController view](*p_remoteViewController, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 4, 0, v39, 4, 1.0, 0.0);
    v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomConstraint = self->_bottomConstraint;
    self->_bottomConstraint = v40;

    -[QLRemoteItemViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = self->_bottomConstraint;
    v48[0] = self->_topConstraint;
    v48[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addConstraints:", v44);

    -[QLPreviewExtensionHostContext setHostViewControllerProxy:](*p_hostContext, "setHostViewControllerProxy:", self->_hostViewControllerProxy);
    if (self->_isAppearing)
      -[QLPreviewExtensionHostContext previewWillAppear:](*p_hostContext, "previewWillAppear:", 0);
    v11 = v47;
    if (self->_isVisible)
      -[QLPreviewExtensionHostContext previewDidAppear:](*p_hostContext, "previewDidAppear:", 0);
  }
  readyToDisplay = (void (**)(void))self->_readyToDisplay;
  if (readyToDisplay)
  {
    readyToDisplay[2]();
    v46 = self->_readyToDisplay;
    self->_readyToDisplay = 0;

  }
  self->_readyToLoad = 1;
  -[QLRemoteItemViewController _performLoadHandlerIfNeeded](self, "_performLoadHandlerIfNeeded");

}

- (void)_performLoadHandlerIfNeeded
{
  void (**loadHandler)(id, SEL);
  id v4;

  if (self->_readyToLoad)
  {
    loadHandler = (void (**)(id, SEL))self->_loadHandler;
    if (loadHandler)
    {
      loadHandler[2](loadHandler, a2);
      v4 = self->_loadHandler;
      self->_loadHandler = 0;

    }
  }
}

- (void)_registerLoadingHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id loadHandler;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke;
  aBlock[3] = &unk_24C726AB0;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  loadHandler = self->_loadHandler;
  self->_loadHandler = v6;

  -[QLRemoteItemViewController _performLoadHandlerIfNeeded](self, "_performLoadHandlerIfNeeded");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[149] && (v4 = (void *)WeakRetained[139]) != 0)
    {
      objc_msgSend(WeakRetained, "contents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_296;
      v14[3] = &unk_24C726E58;
      v15 = v3;
      v16 = *(id *)(a1 + 32);
      objc_msgSend(v4, "loadPreviewControllerWithContents:context:completionHandler:", v5, v6, v14);

      v7 = v15;
    }
    else
    {
      v8 = (NSObject **)MEMORY[0x24BE7BF48];
      v9 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v10 = v9;
        objc_msgSend(v3, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_FAULT, "Failed to get an extension for QuickLook (contentType %@) #Remote", buf, 0xCu);

      }
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLRemoteItemViewController"), 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
    }

  }
}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  _QWORD *v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[139];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_2;
  v11[3] = &unk_24C726E30;
  v12 = v7;
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 40);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "getPrinterProxyWithCompletionHandler:", v11);

}

void __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_2(id *a1, void *a2)
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)a1[4] + 143, a2);
  if (a1[5])
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Error while trying to get printer proxy: %@ #Remote", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)a1[4] + 140, a1[6]);
  }
  objc_msgSend(*((id *)a1[4] + 140), "objectForKeyedSubscript:", CFSTR("preferredContentSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGSizeValue");
  objc_msgSend(a1[4], "setPreferredContentSize:");

  objc_msgSend(*((id *)a1[4] + 140), "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTitle:", v9);

  v11 = a1[7];
  v10 = a1[5];
  QLRunInMainThread();

}

uint64_t __54__QLRemoteItemViewController__registerLoadingHandler___block_invoke_297(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[QLPreviewExtensionHostContext invalidateServiceWithCompletionHandler:](self->_hostContext, "invalidateServiceWithCompletionHandler:", &__block_literal_global_298);
  v3.receiver = self;
  v3.super_class = (Class)QLRemoteItemViewController;
  -[QLRemoteItemViewController dealloc](&v3, sel_dealloc);
}

- (id)printer
{
  if (!self->_printer)
    self = 0;
  return self;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  NSExtension *extension;
  QLRemotePreviewHostViewController *remoteViewController;
  QLPreviewExtensionHostContext *hostContext;
  void *v9;
  uint64_t v10;
  NSObject **v11;
  NSObject *v12;
  NSObject **v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[QLRemotePreviewHostViewController willMoveToParentViewController:](self->_remoteViewController, "willMoveToParentViewController:", 0);
  -[QLRemotePreviewHostViewController view](self->_remoteViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[QLRemotePreviewHostViewController removeFromParentViewController](self->_remoteViewController, "removeFromParentViewController");
  extension = self->_extension;
  self->_extension = 0;

  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  hostContext = self->_hostContext;
  self->_hostContext = 0;

  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEBEC00]))
  {
    v10 = objc_msgSend(v4, "code");

    if (v10 == 1)
    {
      v11 = (NSObject **)MEMORY[0x24BE7BF48];
      v12 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v4;
        _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_INFO, "Quick Look extension view service did terminate normally (error: %@). #Remote", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
  v13 = (NSObject **)MEMORY[0x24BE7BF48];
  v14 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_20D4F5000, v14, OS_LOG_TYPE_ERROR, "Quick Look extension view service did terminate with error: %@ #Remote", (uint8_t *)&v16, 0xCu);
  }
  -[QLItemViewController notifyDelegatesDidFailWithError:](self, "notifyDelegatesDidFailWithError:", v4);
  -[QLItemViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "previewItemViewControllerWantsUpdateOverlay:animated:", self, 1);

LABEL_13:
}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  id v4;

  -[QLRemoteItemViewController setTitle:](self, "setTitle:", a3);
  -[QLItemViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemViewControllerDidUpdateTitle:", self);

}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  id v4;

  objc_msgSend(a3, "CGSizeValue");
  -[QLRemoteItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[QLItemViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemViewControllerDidUpdatePreferredContentSize:", self);

}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewController:wantsFullScreen:", self, v3);

}

- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4
{
  void (**v6)(_QWORD);
  int v7;
  char v8;
  void *v9;
  id readyToDisplay;

  v6 = (void (**)(_QWORD))a4;
  v7 = objc_msgSend(MEMORY[0x24BE7BED0], "ql_isPreviewExtensionThatHaveCustomPresentationViewForItem:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    if (self->_remoteViewController)
    {
      v6[2](v6);
    }
    else
    {
      v9 = _Block_copy(v6);
      readyToDisplay = self->_readyToDisplay;
      self->_readyToDisplay = v9;

    }
  }

  return v8 ^ 1;
}

- (id)fullscreenBackgroundColor
{
  void *v3;
  objc_super v5;

  if (-[NSExtension ql_isPreviewExtensionThatHaveCustomPresentationView](self->_extension, "ql_isPreviewExtensionThatHaveCustomPresentationView"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLRemoteItemViewController;
    -[QLItemViewController fullscreenBackgroundColor](&v5, sel_fullscreenBackgroundColor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  -[QLPrintingProtocol numberOfPagesWithSize:completionHandler:](self->_printer, "numberOfPagesWithSize:completionHandler:", a4, a3.width, a3.height);
}

- (void)prepareForDrawingPages:(_NSRange)a3 ofSize:(CGSize)a4
{
  -[QLPrintingProtocol prepareForDrawingPages:ofSize:](self->_printer, "prepareForDrawingPages:ofSize:", a3.location, a3.length, a4.width, a4.height);
}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  -[QLPrintingProtocol pdfDataForPageAtIndex:withCompletionHandler:](self->_printer, "pdfDataForPageAtIndex:withCompletionHandler:", a3, a4);
}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
  -[QLPrintingProtocol provideCurrentPageAndVisibleRectWithCompletionHandler:](self->_printer, "provideCurrentPageAndVisibleRectWithCompletionHandler:", a3);
}

- (void)presentShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;

  objc_storeStrong((id *)&self->_popoverTracker, a3);
  v8 = a5;
  v9 = a4;
  -[QLItemViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewItemViewController:wantsToShowShareSheetWithPopoverTracker:customSharedURL:dismissCompletion:", self, self, v9, v8);

}

- (void)dismissQuickLook
{
  id v3;

  -[QLItemViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItemViewControllerWantsToDismissQuickLook:", self);

}

- (void)forwardMessageToHostOfCustomViewController:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  QLRunInMainThread();

}

void __91__QLRemoteItemViewController_forwardMessageToHostOfCustomViewController_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewItemViewController:wantsToForwardMessageToHost:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getFrameWithCompletionBlock:(id)a3
{
  id v4;
  QLRemotePopoverTracker *popoverTracker;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  popoverTracker = self->_popoverTracker;
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke;
  v13[3] = &unk_24C7256F8;
  v7 = v4;
  v14 = v7;
  -[QLRemotePopoverTracker synchronousRemoteObjectProxyWithErrorHandler:](popoverTracker, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke_2;
  v10[3] = &unk_24C726EA0;
  v9 = v7;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "getFrameWithCompletionBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

uint64_t __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

void __58__QLRemoteItemViewController_getFrameWithCompletionBlock___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v10);
  objc_msgSend(v12, "remoteViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", v14, a2, a3, a4, a5);
  (*(void (**)(uint64_t))(v9 + 16))(v9);

}

- (QLRemotePreviewHostViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong(&self->_readyToDisplay, 0);
  objc_storeStrong((id *)&self->_hostViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_popoverTracker, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
