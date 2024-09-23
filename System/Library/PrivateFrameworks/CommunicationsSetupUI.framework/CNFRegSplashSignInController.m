@implementation CNFRegSplashSignInController

- (id)_controllerToPresentOn
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    objc_msgSend(v6, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[AKTapToSignInViewController setDelegate:](self->_akSignInVC, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegSignInController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  CNFRegSigninLearnMoreView *signInView;
  void *v6;
  objc_super v7;

  v3 = a3;
  signInView = self->_signInView;
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSigninLearnMoreView setSigningIn:](signInView, "setSigningIn:", objc_msgSend(v6, "accountIsAuthenticating"));

  v7.receiver = self;
  v7.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegSignInController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidX;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegSignInController viewDidLoad](&v18, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BEBD640];
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("splash-top-glow"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v5);
    objc_msgSend(v6, "setAutoresizingMask:", 5);
    -[CNFRegSplashSignInController table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "bounds");
    MidX = CGRectGetMidX(v19);
    v20.origin.x = v10;
    v20.origin.y = v12;
    v20.size.width = v14;
    v20.size.height = v16;
    objc_msgSend(v6, "setFrame:", floor(MidX + CGRectGetWidth(v20) * -0.5), 0.0, v14, v16);
    objc_msgSend(v8, "addSubview:", v6);

  }
}

- (id)specifierList
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshSystemAccount");

    -[CNFRegListController regController](self, "regController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSystemAccount");

    if (v7)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "We have a system account available, using it", v15, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      self->super._useSystemAccount = 1;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v11, *MEMORY[0x24BE75AA0]);
    if (v12)
      objc_msgSend(v9, "insertObject:atIndex:", v12, 0);
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = (Class)v9;

    -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_handleTimeout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegSignInController _handleTimeout](&v3, sel__handleTimeout);
  -[CNFRegSigninLearnMoreView setSigningIn:](self->_signInView, "setSigningIn:", 0);
}

- (id)_existingLearnMoreViewForSpecifier:(id)a3
{
  char *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (char *)a3;
  v4 = v3;
  if (v3 && !*(_QWORD *)&v3[*MEMORY[0x24BE75738]])
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = v6;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_existingLearnMoreViewForSection:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = -[CNFRegSplashSignInController indexOfGroup:](self, "indexOfGroup:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSplashSignInController _existingLearnMoreViewForSpecifier:](self, "_existingLearnMoreViewForSpecifier:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  id *p_signInView;
  AKTapToSignInViewController *v11;
  AKTapToSignInViewController *akSignInVC;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  void *v20;
  id v21;
  objc_super v22;
  objc_super v23;

  v6 = a3;
  -[CNFRegSplashSignInController _existingLearnMoreViewForSection:](self, "_existingLearnMoreViewForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegListController tableView:heightForHeaderInSection:](&v23, sel_tableView_heightForHeaderInSection_, v6, a4);
  if (!v7)
  {
    -[CNFRegSplashSignInController _existingLearnMoreViewForSection:](self, "_existingLearnMoreViewForSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setServiceType:", objc_msgSend(v9, "serviceType"));

    p_signInView = (id *)&self->_signInView;
    objc_storeStrong((id *)&self->_signInView, v7);
    if (!self->_akSignInVC)
    {
      v11 = (AKTapToSignInViewController *)objc_alloc_init(MEMORY[0x24BE0AE58]);
      akSignInVC = self->_akSignInVC;
      self->_akSignInVC = v11;

      -[AKTapToSignInViewController setUsesDarkMode:](self->_akSignInVC, "setUsesDarkMode:", 1);
      -[AKTapToSignInViewController setDelegate:](self->_akSignInVC, "setDelegate:", self);
      v13 = objc_alloc_init(MEMORY[0x24BE0AE28]);
      -[CNFRegSplashSignInController _controllerToPresentOn](self, "_controllerToPresentOn");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPresentingViewController:", v14);

      v21 = objc_alloc_init((Class)CUTWeakLinkClass());
      objc_msgSend(v21, "aa_primaryAppleAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "username");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(v13, "setUsername:", v15);
        objc_msgSend(v13, "setReason:", v15);
      }
      -[AKTapToSignInViewController setContext:](self->_akSignInVC, "setContext:", v13);
      v16 = *p_signInView;
      -[AKTapToSignInViewController view](self->_akSignInVC, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAuthKitSignInView:", v17);

    }
    objc_msgSend(*p_signInView, "setController:", self);
    v22.receiver = self;
    v22.super_class = (Class)CNFRegSplashSignInController;
    -[CNFRegListController tableView:heightForHeaderInSection:](&v22, sel_tableView_heightForHeaderInSection_, v6, a4);
  }
  v18 = v8;

  return v18;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegSplashSignInController;
  -[CNFRegListController tableView:viewForHeaderInSection:](&v9, sel_tableView_viewForHeaderInSection_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[CNFRegListController regController](self, "regController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setServiceType:", objc_msgSend(v7, "serviceType"));

    }
  }
  return v5;
}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[CNFRegSigninLearnMoreView setSigningIn:](self->_signInView, "setSigningIn:", 0);
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Could not authenticate: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE0ABF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE0ABD0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {
      -[CNFRegSigninLearnMoreView setSigningIn:](self->_signInView, "setSigningIn:", 0);
      OSLogHandleForIDSCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "Authentication handler: Missing either username or password", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    else
    {
      -[CNFRegSignInController signInWithUsername:password:](self, "signInWithUsername:password:", v12, v13);
      -[CNFRegSigninLearnMoreView setSigningIn:](self->_signInView, "setSigningIn:", 1);
      -[CNFRegSigninLearnMoreView setNeedsDisplay](self->_signInView, "setNeedsDisplay");
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_akSignInVC, 0);
  objc_storeStrong((id *)&self->_signInView, 0);
}

@end
