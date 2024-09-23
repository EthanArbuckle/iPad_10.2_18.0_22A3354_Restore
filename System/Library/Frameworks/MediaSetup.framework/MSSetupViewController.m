@implementation MSSetupViewController

- (MSSetupViewController)initWithServiceAccount:(id)a3
{
  return -[MSSetupViewController initWithServiceAccount:testFlags:](self, "initWithServiceAccount:testFlags:", a3, 0);
}

- (MSSetupViewController)initWithServiceAccount:(id)a3 testFlags:(unint64_t)a4
{
  id v7;
  MSSetupViewController *v8;
  uint64_t v9;
  NSExtension *extension;
  void *v11;
  NSExtension *v12;
  void *v13;
  MSSetupViewController *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MSSetupViewController;
  v8 = -[MSSetupViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    NSLog(CFSTR("Creating MSViewController..."));
    objc_storeStrong((id *)&v8->_serviceAccount, a3);
    v8->_testFlags = a4;
    -[MSSetupViewController _beginDelayingPresentation:cancellationHandler:](v8, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
    -[MSSetupViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
    -[MSSetupViewController createExtension](v8, "createExtension");
    v9 = objc_claimAutoreleasedReturnValue();
    extension = v8->_extension;
    v8->_extension = (NSExtension *)v9;

    -[MSSetupViewController createExtensionItemWithServiceAccount:](v8, "createExtensionItemWithServiceAccount:", v8->_serviceAccount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_initWeak(&location, v8);
      v12 = v8->_extension;
      v20[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __58__MSSetupViewController_initWithServiceAccount_testFlags___block_invoke;
      v16[3] = &unk_24DBD5880;
      objc_copyWeak(&v17, &location);
      -[NSExtension instantiateViewControllerWithInputItems:connectionHandler:](v12, "instantiateViewControllerWithInputItems:connectionHandler:", v13, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    v14 = v8;

  }
  return v8;
}

void __58__MSSetupViewController_initWithServiceAccount_testFlags___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "extensionHandleConnection:viewController:error:", v9, v8, v7);

}

- (void)dealloc
{
  objc_super v3;

  if (self->_extensionRequest)
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
  v3.receiver = self;
  v3.super_class = (Class)MSSetupViewController;
  -[MSSetupViewController dealloc](&v3, sel_dealloc);
}

- (void)requestDismiss
{
  -[MSSetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)extensionHandleConnection:(id)a3 viewController:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id extensionRequest;
  id v10;

  v7 = a3;
  v8 = a4;
  NSLog(CFSTR("Handling extension connection"));
  v10 = v8;
  -[MSSetupViewController _setChildViewController:](self, "_setChildViewController:", v10);
  extensionRequest = self->_extensionRequest;
  self->_extensionRequest = v7;

  objc_msgSend(v10, "setHost:", self);
  -[MSSetupViewController _endDelayingPresentation](self, "_endDelayingPresentation");

}

- (id)createExtension
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.mediaservicesbroker.ViewService"), &v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__MSSetupViewController_createExtension__block_invoke;
  v8[3] = &unk_24DBD58D0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "setRequestCancellationBlock:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __40__MSSetupViewController_createExtension__block_invoke_3;
  v6[3] = &unk_24DBD58F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "setRequestInterruptionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v2;
}

void __40__MSSetupViewController_createExtension__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MSSetupViewController_createExtension__block_invoke_2;
  block[3] = &unk_24DBD58A8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __40__MSSetupViewController_createExtension__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __40__MSSetupViewController_createExtension__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MSSetupViewController_createExtension__block_invoke_4;
  block[3] = &unk_24DBD58A8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __40__MSSetupViewController_createExtension__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)createExtensionItemWithServiceAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1560]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("Create extension item with test flags: %lu"), self->_testFlags);
    v16[0] = CFSTR("bundleID");
    v16[1] = CFSTR("mediaService");
    v11 = &stru_24DBD5D08;
    if (v10)
      v11 = v10;
    v17[0] = v11;
    v17[1] = v4;
    v16[2] = CFSTR("testUIFlags");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_testFlags);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v13);

  }
  else
  {
    NSLog(CFSTR("No context data. Error = %@"), v5);
    v8 = 0;
  }

  return v8;
}

- (void)_setChildViewController:(id)a3
{
  id v5;
  _MSRemoteViewController **p_childViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_childViewController = &self->_childViewController;
  -[_MSRemoteViewController view](self->_childViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[_MSRemoteViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    -[_MSRemoteViewController willMoveToParentViewController:](self->_childViewController, "willMoveToParentViewController:", self);
    objc_msgSend(v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSetupViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v8, "setFrame:");

    -[MSSetupViewController addChildViewController:](self, "addChildViewController:", *p_childViewController);
    -[MSSetupViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v8);

    objc_msgSend(v8, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSetupViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    objc_msgSend(v8, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSetupViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    objc_msgSend(v8, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSetupViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v12;
    objc_msgSend(v8, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSetupViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
    -[_UIRemoteViewController didMoveToParentViewController:](*p_childViewController, "didMoveToParentViewController:", self);

  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_childViewController;
}

- (MSServiceAccount)serviceAccount
{
  return self->_serviceAccount;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAccount, 0);
  objc_storeStrong(&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
