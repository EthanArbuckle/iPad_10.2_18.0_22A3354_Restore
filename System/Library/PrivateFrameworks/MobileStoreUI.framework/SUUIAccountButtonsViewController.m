@implementation SUUIAccountButtonsViewController

- (SUUIAccountButtonsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIAccountButtonsViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIAccountButtonsViewController;
  v4 = -[SUUIAccountButtonsViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__accountStoreChangedNotification_, *MEMORY[0x24BEB20F0], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB20F0], 0);
  -[SUUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SUUIAccountButtonsView ECommerceButton](self->_buttonsView, "ECommerceButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SUUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SUUIAccountButtonsView termsAndConditionsButton](self->_buttonsView, "termsAndConditionsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 64);

  v8.receiver = self;
  v8.super_class = (Class)SUUIAccountButtonsViewController;
  -[SUUIAccountButtonsViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)isGiftingHidden
{
  void *v2;
  char v3;

  -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGiftingHidden");

  return v3;
}

- (BOOL)isTermsAndConditionsHidden
{
  void *v2;
  char v3;

  -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTermsAndConditionsHidden");

  return v3;
}

- (void)setECommerceLink:(id)a3
{
  void *v5;
  void *v6;
  SUUILink *v7;

  v7 = (SUUILink *)a3;
  if (self->_ecommerceLink != v7)
  {
    objc_storeStrong((id *)&self->_ecommerceLink, a3);
    -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILink title](v7, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setECommerceLinkTitle:", v6);

  }
}

- (void)setGiftingHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGiftingHidden:", v3);

}

- (void)setTermsAndConditionsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTermsAndConditionsHidden:", v3);

}

- (void)loadView
{
  void *v3;

  -[SUUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIAccountButtonsViewController setView:](self, "setView:", v3);

  -[SUUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
  -[SUUIAccountButtonsViewController _reloadRestrictions](self, "_reloadRestrictions");
}

- (void)_ecommerceLinkAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SUUIAccountButtonsViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "accountButtonsViewControllerDidTapECommerceLink:", self);
  }
  else
  {
    -[SUUILink URL](self->_ecommerceLink, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      SUUIMetricsOpenURL(v4);

  }
}

- (void)_giftAction:(id)a3
{
  SUUIGiftViewController *v4;
  SUUIGift *v5;

  v5 = -[SUUIGift initWithGiftCategory:]([SUUIGift alloc], "initWithGiftCategory:", 0);
  v4 = -[SUUIGiftViewController initWithGift:]([SUUIGiftViewController alloc], "initWithGift:", v5);
  -[SUUIGiftViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SUUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_redeemButtonAction:(id)a3
{
  SUUIRedeemViewController *v4;

  v4 = -[SUUIRedeemViewController initWithRedeemCategory:]([SUUIRedeemViewController alloc], "initWithRedeemCategory:", 0);
  -[SUUIRedeemViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SUUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_signInButtonAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x24BEB1DB8]);
  objc_msgSend(MEMORY[0x24BEB1DC0], "contextForSignIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAuthenticationContext:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SUUIAccountButtonsViewController__signInButtonAction___block_invoke;
  v8[3] = &unk_2511FA7D0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "startWithAuthenticateResponseBlock:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __56__SUUIAccountButtonsViewController__signInButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SUUIAccountButtonsViewController__signInButtonAction___block_invoke_2;
  v5[3] = &unk_2511F6220;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __56__SUUIAccountButtonsViewController__signInButtonAction___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadAccountsButton");

  if (objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType") == 4)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_sendDidSignIn");

  }
}

- (void)_termsAndConditionsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);

}

- (void)_usernameButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIClientContext *clientContext;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  SUUIClientContext *v17;
  SUUIClientContext *v18;
  void *v19;
  SUUIClientContext *v20;
  SUUIClientContext *v21;
  void *v22;
  SUUIClientContext *v23;
  SUUIClientContext *v24;
  void *v25;
  SUUIClientContext *v26;
  SUUIClientContext *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SUUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
    goto LABEL_28;
  }
  if (!-[SUUIClientContext isMultiUser](self->_clientContext, "isMultiUser")
    || !-[SUUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BEBD3B0]);
    v8 = (void *)MEMORY[0x24BE0ADF8];
    objc_msgSend(v6, "accountName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedUsernameFromUsername:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessage:", v10);

    objc_msgSend(v7, "setPreferredStyle:", 1);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_TITLE"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v12);

    v13 = -[SUUIClientContext isMultiUser](self->_clientContext, "isMultiUser");
    v14 = MEMORY[0x24BDAC760];
    if (v13)
    {
      objc_initWeak(&location, self);
    }
    else
    {
      v15 = -[SUUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID");
      objc_initWeak(&location, self);
      if (v15)
      {
        v16 = 1;
LABEL_16:
        v20 = self->_clientContext;
        v21 = v20;
        if (v20)
          -[SUUIClientContext localizedStringForKey:](v20, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_SIGN_OUT"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_SIGN_OUT"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v31[0] = v14;
        v31[1] = 3221225472;
        v31[2] = __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_2;
        v31[3] = &unk_2511F53F8;
        objc_copyWeak(&v32, &location);
        objc_msgSend(v7, "_addActionWithTitle:style:handler:", v22, 0, v31);

        if ((v16 & 1) == 0)
        {
          v23 = self->_clientContext;
          v24 = v23;
          if (v23)
            -[SUUIClientContext localizedStringForKey:](v23, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_IFORGOT"));
          else
            +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_IFORGOT"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v29[0] = v14;
          v29[1] = 3221225472;
          v29[2] = __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_3;
          v29[3] = &unk_2511F53F8;
          objc_copyWeak(&v30, &location);
          objc_msgSend(v7, "_addActionWithTitle:style:handler:", v25, 0, v29);

          objc_destroyWeak(&v30);
        }
        v26 = self->_clientContext;
        v27 = v26;
        if (v26)
          -[SUUIClientContext localizedStringForKey:](v26, "localizedStringForKey:", CFSTR("CANCEL"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANCEL"), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "_addActionWithTitle:style:handler:", v28, 1, 0);
        -[SUUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

        goto LABEL_28;
      }
    }
    v17 = self->_clientContext;
    v18 = v17;
    if (v17)
      -[SUUIClientContext localizedStringForKey:](v17, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_VIEW_APPLE_ID"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_VIEW_APPLE_ID"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke;
    v33[3] = &unk_2511F53F8;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v7, "_addActionWithTitle:style:handler:", v19, 0, v33);

    objc_destroyWeak(&v34);
    v16 = 0;
    goto LABEL_16;
  }
LABEL_28:

}

void __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewAppleID");

}

void __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signOut");

}

void __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_4;
  block[3] = &unk_2511F53F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __58__SUUIAccountButtonsViewController__usernameButtonAction___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openIForgot");

}

- (void)_accountStoreChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SUUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__SUUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAccountsButton");
}

- (void)_restrictionsChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SUUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__SUUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadRestrictions");
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  else
    return 2;
}

- (id)_buttonsView
{
  SUUIAccountButtonsView *buttonsView;
  SUUIAccountButtonsView *v4;
  SUUIAccountButtonsView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  buttonsView = self->_buttonsView;
  if (!buttonsView)
  {
    v4 = -[SUUIAccountButtonsView initWithClientContext:]([SUUIAccountButtonsView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_buttonsView;
    self->_buttonsView = v4;

    -[SUUIAccountButtonsView ECommerceButton](self->_buttonsView, "ECommerceButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__ecommerceLinkAction_, 64);

    -[SUUIAccountButtonsView giftingButton](self->_buttonsView, "giftingButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__giftAction_, 64);

    -[SUUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__redeemButtonAction_, 64);

    -[SUUIAccountButtonsView termsAndConditionsButton](self->_buttonsView, "termsAndConditionsButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__termsAndConditionsButtonAction_, 64);

    buttonsView = self->_buttonsView;
  }
  return buttonsView;
}

- (void)_openIForgot
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x24BEC8BD8]);
  v5 = (id)objc_msgSend(v2, "initWithURLBagKey:", *MEMORY[0x24BEB2AA0]);
  objc_msgSend(v5, "setITunesStoreURL:", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8BD0]), "initWithOpenURLRequest:", v5);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (void)_reloadAccountsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIClientContext *clientContext;
  SUUIClientContext *v9;
  void *v10;
  void *v11;
  SUUIAccountButtonsView *buttonsView;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v5 = (void *)MEMORY[0x24BE0ADF8];
    objc_msgSend(v15, "accountName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedUsernameFromUsername:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACCOUNT_BUTTON_APPLE_ID"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACCOUNT_BUTTON_APPLE_ID"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v11, 0);
    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__usernameButtonAction_, 64);
    buttonsView = self->_buttonsView;
    objc_msgSend(v15, "creditsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAccountButtonsView setAccountCredits:](buttonsView, "setAccountCredits:", v13);

  }
  else
  {
    v9 = self->_clientContext;
    if (v9)
      -[SUUIClientContext localizedStringForKey:](v9, "localizedStringForKey:", CFSTR("ACCOUNT_BUTTON_SIGN_IN"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACCOUNT_BUTTON_SIGN_IN"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v14, 0);

    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__signInButtonAction_, 64);
    -[SUUIAccountButtonsView setAccountCredits:](self->_buttonsView, "setAccountCredits:", 0);
  }
  -[SUUIAccountButtonsView setNeedsLayout](self->_buttonsView, "setNeedsLayout");

}

- (void)_reloadRestrictions
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]);

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningInStoreDemoMode");

  -[SUUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 == 2)
    v9 = 0;
  else
    v9 = v6 ^ 1u;
  objc_msgSend(v7, "setEnabled:", v9);

  -[SUUIAccountButtonsView giftingButton](self->_buttonsView, "giftingButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v6 ^ 1u);

  -[SUUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v6 ^ 1u);

}

- (void)_sendDidSignIn
{
  SUUIAccountButtonsDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "accountButtonsViewControllerDidSignIn:", self);

  }
}

- (void)_signOut
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "signOutAccount:", v3);
    -[SUUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "accountButtonsViewControllerDidSignOut:", self);

    }
  }

}

- (void)_viewAppleID
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDEA6A8]), "initWithAccountURL:", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v4);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  -[SUUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIAccountButtonsDelegate)delegate
{
  return (SUUIAccountButtonsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecommerceLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
}

@end
