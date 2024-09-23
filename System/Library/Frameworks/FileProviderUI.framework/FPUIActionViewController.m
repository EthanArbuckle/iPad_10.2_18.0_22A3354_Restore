@implementation FPUIActionViewController

- (void)effectiveAppearanceDidChange:(id)a3
{
  unint64_t browserUserInterfaceStyle;
  unint64_t v5;
  id v6;

  v6 = a3;
  if (-[FPUIActionViewController displayInline](self, "displayInline"))
  {
    browserUserInterfaceStyle = self->_browserUserInterfaceStyle;
    if (browserUserInterfaceStyle != objc_msgSend(v6, "browserUserInterfaceStyle"))
    {
      v5 = objc_msgSend(v6, "browserUserInterfaceStyle");
      self->_browserUserInterfaceStyle = v5;
      -[FPUIActionExtensionViewControllerProtocol _setBrowserUserInterfaceStyle:](self->_extensionViewController, "_setBrowserUserInterfaceStyle:", v5);
    }
  }

}

- (unint64_t)browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4
{
  id v5;
  id v6;
  FPUIActionViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v7, "setProviderIdentifier:", v5);

  -[FPUIActionViewController setActionIdentifier:](v7, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setItems:](v7, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setError:](v7, "setError:", v6);

  -[FPUIActionViewController setDisplayInline:](v7, "setDisplayInline:", 1);
  return v7;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (FPUIActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FPUIActionViewController *v4;
  FPUIActionViewController *v5;
  FPUIActionViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPUIActionViewController;
  v4 = -[FPUIActionViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[FPUIActionViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
    v6 = v5;
  }

  return v5;
}

+ (id)actionControllerForActionIdentifier:(id)a3 actionTitle:(id)a4 items:(id)a5 providerIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  FPUIActionViewController *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v16, "setProviderIdentifier:", v12);

  -[FPUIActionViewController setActionIdentifier:](v16, "setActionIdentifier:", v15);
  -[FPUIActionViewController setItems:](v16, "setItems:", v13);

  -[FPUIActionViewController setActionTitle:](v16, "setActionTitle:", v14);
  -[FPUIActionViewController setDomainIdentifier:](v16, "setDomainIdentifier:", v11);

  -[FPUIActionViewController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 2);
  return v16;
}

+ (id)actionControllerForAuthenticationUsingURL:(id)a3 providerIdentifier:(id)a4
{
  id v5;
  id v6;
  FPUIActionViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v7, "setProviderIdentifier:", v5);

  -[FPUIActionViewController setActionIdentifier:](v7, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setItems:](v7, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setAuthenticationURL:](v7, "setAuthenticationURL:", v6);

  -[FPUIActionViewController setActionTitle:](v7, "setActionTitle:", CFSTR("Authenticate"));
  return v7;
}

+ (id)actionControllerForConnectingToServerURL:(id)a3 actionTitle:(id)a4 providerIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  FPUIActionViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v10, "setProviderIdentifier:", v7);

  -[FPUIActionViewController setActionIdentifier:](v10, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setItems:](v10, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setActionTitle:](v10, "setActionTitle:", v8);

  -[FPUIActionViewController setDomainIdentifier:](v10, "setDomainIdentifier:", 0);
  -[FPUIActionViewController setServerConnectionURL:](v10, "setServerConnectionURL:", v9);

  -[FPUIActionViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
  return v10;
}

+ (id)actionControllerForError:(id)a3 providerIdentifier:(id)a4
{
  id v5;
  id v6;
  FPUIActionViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v7, "setProviderIdentifier:", v5);

  -[FPUIActionViewController setActionIdentifier:](v7, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setItems:](v7, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setError:](v7, "setError:", v6);

  -[FPUIActionViewController setActionTitle:](v7, "setActionTitle:", CFSTR("Authenticate"));
  return v7;
}

+ (id)actionControllerForError:(id)a3 extensionIdentifier:(id)a4 providerDomainIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  FPUIActionViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v10, "setProviderIdentifier:", v8);

  -[FPUIActionViewController setDomainIdentifier:](v10, "setDomainIdentifier:", v7);
  -[FPUIActionViewController setActionIdentifier:](v10, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setItems:](v10, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setError:](v10, "setError:", v9);

  -[FPUIActionViewController setActionTitle:](v10, "setActionTitle:", CFSTR("Authenticate"));
  return v10;
}

+ (id)actionControllerForInlineError:(id)a3 providerIdentifier:(id)a4 providerDomainIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  FPUIActionViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FPUIActionViewController initWithNibName:bundle:]([FPUIActionViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[FPUIActionViewController setProviderIdentifier:](v10, "setProviderIdentifier:", v8);

  -[FPUIActionViewController setActionIdentifier:](v10, "setActionIdentifier:", CFSTR("com.apple.FileProviderUI.authenticate"));
  -[FPUIActionViewController setDomainIdentifier:](v10, "setDomainIdentifier:", v7);

  -[FPUIActionViewController setItems:](v10, "setItems:", MEMORY[0x24BDBD1A8]);
  -[FPUIActionViewController setError:](v10, "setError:", v9);

  -[FPUIActionViewController setDisplayInline:](v10, "setDisplayInline:", 1);
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _UIResilientRemoteViewContainerViewController *v11;
  _UIResilientRemoteViewContainerViewController *placeholderVC;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)FPUIActionViewController;
  -[FPUIActionViewController viewDidLoad](&v31, sel_viewDidLoad);
  v30 = 0;
  -[FPUIActionViewController _getExtensionWithError:](self, "_getExtensionWithError:", &v30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v30;
  v5 = v4;
  if (v3)
  {
    v6 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke;
    v28[3] = &unk_24EFEDF50;
    v28[4] = self;
    v7 = v3;
    v29 = v7;
    v8 = (void *)MEMORY[0x22E29FB2C](v28);
    v9 = (void *)MEMORY[0x24BDF7140];
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_4;
    v26[3] = &unk_24EFEDF78;
    v10 = v8;
    v26[4] = self;
    v27 = v10;
    objc_msgSend(v9, "instantiateWithExtension:completion:", v7, v26);
    v11 = (_UIResilientRemoteViewContainerViewController *)objc_claimAutoreleasedReturnValue();
    placeholderVC = self->_placeholderVC;
    self->_placeholderVC = v11;

    -[_UIResilientRemoteViewContainerViewController delayDisplayOfRemoteController](self->_placeholderVC, "delayDisplayOfRemoteController");
    -[FPUIActionViewController embedViewController:](self, "embedViewController:", self->_placeholderVC);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIActionViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    if (-[FPUIActionViewController displayInline](self, "displayInline"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[_UIResilientRemoteViewContainerViewController view](self->_placeholderVC, "view", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subviews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setBackgroundColor:", 0);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v18);
      }

    }
  }
  else if (v4)
  {
    -[FPUIActionViewController _delegateError:](self, "_delegateError:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FPUIActionViewControllerErrorDomain"), 1000, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIActionViewController _delegateError:](self, "_delegateError:", v21);

  }
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  void *v27;
  _QWORD v28[5];

  v7 = a2;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_delegateError:", a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_2;
    v28[3] = &unk_24EFEDF28;
    v28[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "serviceViewControllerProxyWithErrorHandler:", v28);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 968);
    *(_QWORD *)(v10 + 968) = v9;

    if (objc_msgSend(*(id *)(a1 + 32), "displayInline"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_setBrowserUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "browserUserInterfaceStyle"));
    objc_msgSend(*(id *)(a1 + 32), "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = dyld_program_sdk_at_least();
      v14 = *(_QWORD **)(a1 + 32);
      if (v13)
      {
        objc_msgSend(v14, "domainIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderDomainIDToDomainIdentifier(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
      }
      else
      {
        v18 = (void *)v14[121];
        objc_msgSend(v14, "domainIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
      }
      objc_msgSend(v17, "_configureWithDomainIdentifier:", v16);

    }
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.FileProviderUI.authenticate"));

    v21 = *(_QWORD **)(a1 + 32);
    if (v20)
    {
      objc_msgSend(v21, "authenticationURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serverConnectionURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_prepareAuthenticationUsingURL:", v22);
      }
      else
      {
        v25 = *(id **)(a1 + 32);
        v26 = v25[121];
        if (v23)
        {
          objc_msgSend(v25[121], "_prepareAuthenticationUsingServerURL:", v23);
        }
        else
        {
          objc_msgSend(v25, "error");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_prepareForError:", v27);

        }
      }
    }
    else
    {
      v24 = (void *)v21[121];
      objc_msgSend(v21, "actionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "items");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_prepareForActionWithIdentifier:items:", v22, v23);
    }

  }
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__FPUIActionViewController_viewDidLoad__block_invoke_3;
  v5[3] = &unk_24EFEDF00;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __39__FPUIActionViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegateError:", *(_QWORD *)(a1 + 40));
}

void __39__FPUIActionViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id *v6;
  id v7;

  v7 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  v6 = *(id **)(a1 + 32);
  if (v7)
    objc_msgSend(v6, "_delegateError:");
  else
    objc_msgSend(v6[122], "endDelayingDisplayOfRemoteController");

}

- (void)embedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  objc_msgSend(v18, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[FPUIActionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[FPUIActionViewController addChildViewController:](self, "addChildViewController:", v18);
  -[FPUIActionViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v18, "didMoveToParentViewController:", self);
}

- (id)_getExtensionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1550];
  -[FPUIActionViewController providerIdentifier](self, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "extensionWithIdentifier:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    v9 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v9 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[FPUIActionViewController _getExtensionWithError:].cold.1(v9, self);
      if (!a3)
        goto LABEL_7;
      goto LABEL_6;
    }
    if (a3)
LABEL_6:
      *a3 = objc_retainAutorelease(v8);
  }
LABEL_7:

  return v7;
}

- (void)_dismissViewController
{
  _QWORD block[5];

  if (-[FPUIActionViewController isBeingPresented](self, "isBeingPresented"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__FPUIActionViewController__dismissViewController__block_invoke;
    block[3] = &unk_24EFEDFA0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[FPUIActionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

uint64_t __50__FPUIActionViewController__dismissViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_delegateDidFinishWithUserInfo:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = fpuiLogHandle;
  if (v7)
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:].cold.1(v8, self);
  }
  else
  {
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      -[FPUIActionViewController actionIdentifier](self, "actionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_2278C8000, v9, OS_LOG_TYPE_INFO, "Action with identifier (%@) did finish.", (uint8_t *)&v15, 0xCu);

    }
  }
  -[FPUIActionViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  -[FPUIActionViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
    objc_msgSend(v13, "actionControllerDidFinishAction:userInfo:error:", self, v6, v7);
  else
    objc_msgSend(v13, "actionControllerDidFinishAction:error:", self, v7);

  -[FPUIActionViewController _dismissViewController](self, "_dismissViewController");
}

- (void)_delegateError:(id)a3
{
  -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:](self, "_delegateDidFinishWithUserInfo:error:", 0, a3);
}

- (void)remoteActionControllerDidFinishAction:(id)a3 error:(id)a4
{
  -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:](self, "_delegateDidFinishWithUserInfo:error:", 0, a4);
}

- (void)remoteActionContextDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
  -[FPUIActionViewController _delegateDidFinishWithUserInfo:error:](self, "_delegateDidFinishWithUserInfo:error:", a4, a5);
}

- (void)remoteActionContext:(id)a3 didEncounterError:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[FPUIActionViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__FPUIActionViewController_remoteActionContext_didEncounterError_completionHandler___block_invoke;
    block[3] = &unk_24EFEDFC8;
    block[4] = self;
    v13 = v7;
    v14 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v11 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v11 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_2278C8000, v11, OS_LOG_TYPE_INFO, "An error occurred on the service side, but the client won't present it: %@", buf, 0xCu);
    }
    v8[2](v8);
  }

}

void __84__FPUIActionViewController_remoteActionContext_didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionController:presentError:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (FPUIActionViewControllerDelegate)delegate
{
  return (FPUIActionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_actionTitle, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSURL)authenticationURL
{
  return self->_authenticationURL;
}

- (void)setAuthenticationURL:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationURL, a3);
}

- (BOOL)displayInline
{
  return self->_displayInline;
}

- (void)setDisplayInline:(BOOL)a3
{
  self->_displayInline = a3;
}

- (id)didLoadRemoteViewControllerCompletionHandler
{
  return self->_didLoadRemoteViewControllerCompletionHandler;
}

- (void)setDidLoadRemoteViewControllerCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifier, a3);
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSURL)serverConnectionURL
{
  return self->_serverConnectionURL;
}

- (void)setServerConnectionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_serverConnectionURL, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong(&self->_didLoadRemoteViewControllerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authenticationURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderVC, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

- (void)_getExtensionWithError:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "providerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2278C8000, v5, v6, "nil extension for provider ID (%@), error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_delegateDidFinishWithUserInfo:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2278C8000, v5, v6, "Action with identifier (%@) did finish with error (%@).", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
