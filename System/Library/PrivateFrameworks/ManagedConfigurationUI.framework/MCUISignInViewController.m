@implementation MCUISignInViewController

- (MCUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MCUISignInViewController *v4;
  uint64_t v5;
  MCSignInPageTitleSectionController *titleSectionController;
  uint64_t v7;
  MCSignInPageAuthenticationSectionController *authSectionController;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)MCUISignInViewController;
  v4 = -[MCUISignInViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    titleSectionController = v4->_titleSectionController;
    v4->_titleSectionController = (MCSignInPageTitleSectionController *)v5;

    v7 = objc_opt_new();
    authSectionController = v4->_authSectionController;
    v4->_authSectionController = (MCSignInPageAuthenticationSectionController *)v7;

    -[MCSignInPageAuthenticationSectionController inlineSignInViewController](v4->_authSectionController, "inlineSignInViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v4);

    v13[0] = v4->_titleSectionController;
    v13[1] = v4->_authSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCSectionBasedTableViewController setSectionControllers:](v4, "setSectionControllers:", v10);

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCUISignInViewController;
  -[MCSectionBasedTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MCUISignInViewController authSectionController](self, "authSectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineSignInViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISignInViewController addChildViewController:](self, "addChildViewController:", v4);

  -[MCUISignInViewController authSectionController](self, "authSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineSignInViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MCUISignInViewController;
  -[MCUISignInViewController viewWillAppear:](&v17, sel_viewWillAppear_, a3);
  v4 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MCUIImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCUISignInViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:forBarMetrics:", v6, 0);

  -[MCUISignInViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "setShadowImage:", v11);

  -[MCUISignInViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslucent:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISignInViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[MCUISignInViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", &stru_1EA2B7FD8);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCUISignInViewController;
  -[MCUISignInViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!-[MCUISignInViewController signInButtonTapped](self, "signInButtonTapped"))
  {
    -[MCUISignInViewController authSectionController](self, "authSectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inlineSignInViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signInButtonWasTapped:", 0);

    -[MCUISignInViewController setSignInButtonTapped:](self, "setSignInButtonTapped:", 1);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCUISignInViewController;
  -[MCUISignInViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[MCUISignInViewController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && !-[MCUISignInViewController authenticationFinished](self, "authenticationFinished"))
  {
    -[MCUISignInViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    -[MCUISignInViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signInViewControllerDidCancelAuthentication:", self);
  }

}

- (AKAppleIDAuthenticationInAppContext)context
{
  void *v2;
  void *v3;
  void *v4;

  -[MCUISignInViewController authSectionController](self, "authSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineSignInViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AKAppleIDAuthenticationInAppContext *)v4;
}

- (void)setContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MCUISignInViewController authSectionController](self, "authSectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inlineSignInViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContext:", v4);

}

- (void)setOrgName:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  -[MCUISignInViewController titleSectionController](self, "titleSectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrgName:", v5);

}

- (NSString)orgName
{
  void *v2;
  void *v3;

  -[MCUISignInViewController titleSectionController](self, "titleSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orgName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)signInViewController:(id)a3 willPerformAuthenticationWithContext:(id)a4 completionHandler:(id)a5
{
  void *v6;
  char v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a5;
  -[MCUISignInViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MCUISignInViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "signInViewController:willAuthenticateWithCompletionHandler:", self, v9);

  }
  else
  {
    v9[2]();
  }

}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MCUISignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  block[3] = &unk_1EA2B6060;
  block[4] = self;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__MCUISignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isBeingDismissed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      if (!*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "setAuthenticationFinished:", 1);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_opt_respondsToSelector();

        if ((v4 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v5 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "signInViewController:didAuthenticateWithResults:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

        }
      }
    }
  }
}

- (MCUISignInViewControllerDelegate)delegate
{
  return (MCUISignInViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)signInButtonTapped
{
  return self->_signInButtonTapped;
}

- (void)setSignInButtonTapped:(BOOL)a3
{
  self->_signInButtonTapped = a3;
}

- (BOOL)authenticationFinished
{
  return self->_authenticationFinished;
}

- (void)setAuthenticationFinished:(BOOL)a3
{
  self->_authenticationFinished = a3;
}

- (MCSignInPageTitleSectionController)titleSectionController
{
  return self->_titleSectionController;
}

- (void)setTitleSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_titleSectionController, a3);
}

- (MCSignInPageAuthenticationSectionController)authSectionController
{
  return self->_authSectionController;
}

- (void)setAuthSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_authSectionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authSectionController, 0);
  objc_storeStrong((id *)&self->_titleSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
