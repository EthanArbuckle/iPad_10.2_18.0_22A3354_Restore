@implementation SLSheetNavigationController

- (SLSheetNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  SLSheetNavigationController *v4;
  SLSheetNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLSheetNavigationController;
  v4 = -[SLSheetNavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SLSheetNavigationController _setPreferredNavigationBarPosition:](v4, "_setPreferredNavigationBarPosition:", 2);
  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SLSheetNavigationController;
  -[SLSheetNavigationController loadView](&v20, sel_loadView);
  -[SLSheetNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetNavigationController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[SLSheetNavigationController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasksToBounds:", 1);

  -[SLSheetNavigationController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 7.0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithStyle:", 2);
  v11 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v11, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v13);

  -[SLSheetNavigationController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v11, "setFrame:");

  objc_msgSend(v11, "setAutoresizingMask:", 18);
  -[SLSheetNavigationController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v11);

  -[SLSheetNavigationController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendSubviewToBack:", v11);

  -[SLSheetNavigationController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v10, "setFrame:");

  objc_msgSend(v10, "setAutoresizingMask:", 18);
  -[SLSheetNavigationController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v10);

  -[SLSheetNavigationController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendSubviewToBack:", v10);

  -[SLSheetNavigationController setSheetNavigationBarStyle](self, "setSheetNavigationBarStyle");
}

- (void)setSheetNavigationBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "socialFrameworkImageNamed:", CFSTR("SLSheetNavBarBackgroundDefault"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v4, 0);

  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "socialFrameworkImageNamed:", CFSTR("SLSheetNavBarBackgroundLandscapeiPhone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 1);

  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslucent:", 1);

  v11 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleTextAttributes:", v9);

}

- (void)setDefaultNavigationBarStyle
{
  void *v3;
  id v4;

  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", 0, 0);

  -[SLSheetNavigationController navigationBar](self, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", 0, 1);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SLSheetNavigationController;
  -[SLSheetNavigationController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SLSheetNavigationController;
  -[SLSheetNavigationController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
