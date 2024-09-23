@implementation FPUIAuthenticationViewController

- (FPUIAuthenticationViewController)initWithServerURL:(id)a3
{
  id v4;
  FPUIAuthenticationViewController *v5;
  uint64_t v6;
  NSURL *initialConnectionURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationViewController;
  v5 = -[FPUIAuthenticationViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    initialConnectionURL = v5->_initialConnectionURL;
    v5->_initialConnectionURL = (NSURL *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  FPUIAuthenticationLandingViewController *v3;
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
  FPUIAuthenticationLandingViewController *v30;
  objc_super v31;
  _QWORD v32[6];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)FPUIAuthenticationViewController;
  -[FPUIAuthenticationViewController viewDidLoad](&v31, sel_viewDidLoad);
  v3 = -[FPUIAuthenticationLandingViewController initWithURL:]([FPUIAuthenticationLandingViewController alloc], "initWithURL:", self->_initialConnectionURL);
  -[FPUIAuthenticationViewController authenticationDelegate](self, "authenticationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setAuthenticationDelegate:](v3, "setAuthenticationDelegate:", v4);

  v30 = v3;
  objc_storeWeak((id *)&self->_landingViewController, v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v3);
  -[FPUIAuthenticationViewController addChildViewController:](self, "addChildViewController:", v5);
  -[FPUIAuthenticationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v20 = (void *)MEMORY[0x24BDD1628];
  -[FPUIAuthenticationViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v25;
  -[FPUIAuthenticationViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v19;
  -[FPUIAuthenticationViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v9;
  -[FPUIAuthenticationViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

  objc_msgSend(v5, "didMoveToParentViewController:", self);
}

- (void)setInitialConnectionURL:(id)a3
{
  id WeakRetained;
  NSURL *v6;

  v6 = (NSURL *)a3;
  if (self->_initialConnectionURL != v6)
  {
    objc_storeStrong((id *)&self->_initialConnectionURL, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_landingViewController);
    objc_msgSend(WeakRetained, "setInitialConnectionURL:", v6);

  }
}

- (FPUIAuthenticationDelegate)authenticationDelegate
{
  return (FPUIAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_authenticationDelegate);
}

- (void)setAuthenticationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationDelegate, a3);
}

- (NSURL)initialConnectionURL
{
  return self->_initialConnectionURL;
}

- (FPUIAuthenticationLandingViewController)landingViewController
{
  return (FPUIAuthenticationLandingViewController *)objc_loadWeakRetained((id *)&self->_landingViewController);
}

- (void)setLandingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_landingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_landingViewController);
  objc_storeStrong((id *)&self->_initialConnectionURL, 0);
  objc_destroyWeak((id *)&self->_authenticationDelegate);
}

@end
