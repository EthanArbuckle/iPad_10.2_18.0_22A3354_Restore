@implementation GKRemoteUINavigationController

- (GKRemoteUINavigationController)initWithRemoteUIController:(id)a3
{
  id v5;
  GKRemoteUINavigationController *v6;
  GKRemoteUINavigationController *v7;
  GKRemoteUINavigationController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKRemoteUINavigationController;
  v6 = -[GKRemoteUINavigationController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteUIController, a3);
    -[GKRemoteUIController presentInParentNavigationController:animated:](v7->_remoteUIController, "presentInParentNavigationController:animated:", v7, 0);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKRemoteUINavigationController;
  -[GKRemoteUINavigationController loadView](&v6, sel_loadView);
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUINavigationController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  _BYTE *v2;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  v2 = (_BYTE *)MEMORY[0x1E0D253F8];
  if (*MEMORY[0x1E0D253F8])
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1 && (!*v2 || *MEMORY[0x1E0D25B68] != 0))
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8)
    return 2;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = v11 < 414.0 || v13 < 736.0;
  if (v14 && (v13 >= 414.0 ? (v15 = v11 < 736.0) : (v15 = 1), v15))
    return 2;
  else
    return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKRemoteUINavigationController;
  -[GKRemoteUINavigationController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[GKRemoteUINavigationController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUINavigationController _gkConfigureFocusGuidesForNavigationBar:](self, "_gkConfigureFocusGuidesForNavigationBar:", v4);

}

- (GKRemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIController, 0);
}

@end
