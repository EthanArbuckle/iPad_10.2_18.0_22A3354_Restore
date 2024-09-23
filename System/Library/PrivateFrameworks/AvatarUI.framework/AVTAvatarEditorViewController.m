@implementation AVTAvatarEditorViewController

+ (BOOL)shouldShowSplashScreen
{
  int v2;
  int v3;

  if ((AVTUIAlwaysShowSplashScreen_once() & 1) != 0)
    LOBYTE(v2) = 1;
  else
    v2 = AVTUIHasDisplayedSplashScreen() ^ 1;
  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || AVTDeviceIsGreenTea())
    v3 = AVTUIHasDisplayedCameraDisclosureSplashScreen() ^ 1;
  else
    LOBYTE(v3) = 0;
  return v2 | v3;
}

+ (id)defaultSessionProvider
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  AVTViewSessionProvider *v6;

  +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v3);
  v6 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v2, v3, v4, v5);

  return v6;
}

+ (id)viewControllerForEditingAvatar:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "defaultSessionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewControllerForEditingAvatar:avtViewSessionProvider:store:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)viewControllerForEditingAvatar:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v9);
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v8);
  v12 = v8;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAvatarRecord:avtViewSessionProvider:store:enviroment:isCreating:", v12, v10, v11, v13, 0);

  return v14;
}

+ (id)viewControllerForCreatingAvatarInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "defaultSessionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)viewControllerForCreatingAvatarInStore:(id)a3 avtViewSessionProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1F03E3D60) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v6);
  v8 = v6;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00850], "defaultAvatarRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAvatarRecord:avtViewSessionProvider:store:enviroment:isCreating:", v10, v7, v8, v9, 1);

  return v11;
}

- (AVTAvatarEditorViewController)initWithAvatarRecord:(id)a3 avtViewSessionProvider:(id)a4 store:(id)a5 enviroment:(id)a6 isCreating:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTAvatarEditorViewController *v17;
  AVTAvatarEditorViewController *v18;
  uint64_t v19;
  AVTUILogger *logger;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarEditorViewController;
  v17 = -[AVTAvatarEditorViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initialAvatarRecord, a3);
    objc_storeStrong((id *)&v18->_store, a5);
    objc_storeStrong((id *)&v18->_environment, a6);
    objc_msgSend(v16, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    logger = v18->_logger;
    v18->_logger = (AVTUILogger *)v19;

    objc_storeStrong((id *)&v18->_avtViewSessionProvider, a4);
    v18->_isCreating = a7;
  }

  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarEditorViewController;
  -[AVTAvatarEditorViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AVTAvatarEditorViewController setupInitialViewState](self, "setupInitialViewState");
  -[AVTAvatarEditorViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  -[AVTAvatarEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setBackgroundHidden:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarEditorViewController;
  -[AVTAvatarEditorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[AVTAvatarEditorViewController visibleLayout](self, "visibleLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorViewController updateToolBarForLayout:](self, "updateToolBarForLayout:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  AVTAvatarEditorViewController *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarEditorViewController;
  -[AVTAvatarEditorViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[AVTAvatarEditorViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVTAvatarEditorViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (AVTAvatarEditorViewController *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == self;

  }
  else
  {
    v8 = 0;
  }

  -[AVTAvatarEditorViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || !v9)
  {
    -[AVTAvatarEditorViewController appropriatePresentationController](self, "appropriatePresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v10, "setDelegate:", self);

  }
}

- (id)appropriatePresentationController
{
  AVTAvatarEditorViewController *v2;
  void *v3;
  AVTAvatarEditorViewController *v4;
  void *v5;
  void *v6;

  v2 = self;
  -[AVTAvatarEditorViewController parentViewController](v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[AVTAvatarEditorViewController parentViewController](v2, "parentViewController");
      v4 = (AVTAvatarEditorViewController *)objc_claimAutoreleasedReturnValue();

      -[AVTAvatarEditorViewController parentViewController](v4, "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  -[AVTAvatarEditorViewController presentationController](v4, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setDisableAvatarSnapshotting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisableAvatarSnapshotting:", v3);

  }
}

- (BOOL)disableAvatarSnapshotting
{
  void *v2;
  char v3;

  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAvatarSnapshotting");

  return v3;
}

- (void)prepareForAnimatedTransitionWithLayout:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTAvatarEditorViewController updateToolBarForLayout:](self, "updateToolBarForLayout:", v9);
    -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareForAnimatedTransitionWithLayout:completionBlock:", v9, v6);

  }
}

- (void)applyLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTAvatarEditorViewController updateToolBarForLayout:](self, "updateToolBarForLayout:", v6);
    -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyLayout:", v6);

  }
}

- (id)visibleLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setupInitialViewState
{
  id v3;

  if (objc_msgSend((id)objc_opt_class(), "shouldShowSplashScreen"))
  {
    -[AVTAvatarEditorViewController loadSplashScreen](self, "loadSplashScreen");
  }
  else
  {
    -[AVTAvatarEditorViewController initialAvatarRecord](self, "initialAvatarRecord");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarEditorViewController loadAttributeEditorViewWithAvatarRecord:](self, "loadAttributeEditorViewWithAvatarRecord:", v3);

  }
}

- (void)loadSplashScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTSplashScreenViewController *v12;
  AVTSplashScreenViewController *splashScreenViewController;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  AVTSplashScreenConfiguration *v27;

  v27 = objc_alloc_init(AVTSplashScreenConfiguration);
  AVTAvatarUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MEMOJI_SPLASH_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setTitleString:](v27, "setTitleString:", v4);

  LODWORD(v3) = AVTUIIsFacetrackingSupported();
  AVTAvatarUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("MEMOJI_SPLASH_SUBTITLE");
  else
    v7 = CFSTR("MEMOJI_SPLASH_SUBTITLE_NO_FACE_TRACKING");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1EA5207B8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setSubTitleString:](v27, "setSubTitleString:", v8);

  AVTAvatarUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MEMOJI_SPLASH_CREATE_YOURS"), &stru_1EA5207B8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setButtonString:](v27, "setButtonString:", v10);

  AVTAvatarEditorSplashVideo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenConfiguration setPrimaryPlayerItem:](v27, "setPrimaryPlayerItem:", v11);

  v12 = -[AVTSplashScreenViewController initWithConfiguration:]([AVTSplashScreenViewController alloc], "initWithConfiguration:", v27);
  splashScreenViewController = self->_splashScreenViewController;
  self->_splashScreenViewController = v12;

  -[AVTSplashScreenViewController setDelegate:](self->_splashScreenViewController, "setDelegate:", self);
  -[AVTAvatarEditorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[AVTSplashScreenViewController view](self->_splashScreenViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[AVTSplashScreenViewController view](self->_splashScreenViewController, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAutoresizingMask:", 18);

  -[AVTAvatarEditorViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSplashScreenViewController view](self->_splashScreenViewController, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[AVTAvatarEditorViewController addChildViewController:](self, "addChildViewController:", self->_splashScreenViewController);
  -[AVTSplashScreenViewController didMoveToParentViewController:](self->_splashScreenViewController, "didMoveToParentViewController:", self);
  -[AVTAvatarEditorViewController configureSplashNavigationItems](self, "configureSplashNavigationItems");

}

- (void)loadAttributeEditorViewWithAvatarRecord:(id)a3
{
  id v4;
  AVTAvatarAttributeEditorViewController *v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorViewController *v8;
  AVTAvatarAttributeEditorViewController *attributeEditorViewController;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = [AVTAvatarAttributeEditorViewController alloc];
  -[AVTAvatarEditorViewController avtViewSessionProvider](self, "avtViewSessionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorViewController environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarAttributeEditorViewController initWithAvatarRecord:avtViewSessionProvider:environment:isCreating:](v5, "initWithAvatarRecord:avtViewSessionProvider:environment:isCreating:", v4, v6, v7, -[AVTAvatarEditorViewController isCreating](self, "isCreating"));

  attributeEditorViewController = self->_attributeEditorViewController;
  self->_attributeEditorViewController = v8;

  -[AVTAvatarAttributeEditorViewController setDelegate:](self->_attributeEditorViewController, "setDelegate:", self);
  -[AVTAvatarAttributeEditorViewController setShouldHideUserInfoView:](self->_attributeEditorViewController, "setShouldHideUserInfoView:", -[AVTAvatarEditorViewController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  -[AVTAvatarAttributeEditorViewController setEditorPresentationContext:](self->_attributeEditorViewController, "setEditorPresentationContext:", -[AVTAvatarEditorViewController editorPresentationContext](self, "editorPresentationContext"));
  -[AVTAvatarEditorViewController addChildViewController:](self, "addChildViewController:", self->_attributeEditorViewController);
  -[AVTAvatarEditorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[AVTAvatarAttributeEditorViewController view](self->_attributeEditorViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[AVTAvatarAttributeEditorViewController view](self->_attributeEditorViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);

  -[AVTAvatarEditorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorViewController view](self->_attributeEditorViewController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[AVTAvatarAttributeEditorViewController didMoveToParentViewController:](self->_attributeEditorViewController, "didMoveToParentViewController:", self);
  -[AVTAvatarEditorViewController configureEditorNavigationItems](self, "configureEditorNavigationItems");
}

- (void)configureSplashNavigationItems
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTAvatarEditorViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsMac");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    -[AVTAvatarEditorViewController setCancelButtonItem:](self, "setCancelButtonItem:", v5);

    -[AVTAvatarEditorViewController cancelButtonItem](self, "cancelButtonItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarEditorViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v7);

  }
}

- (void)configureEditorNavigationItems
{
  void *v3;
  int v4;
  void *v5;
  AVTToolbarButton *v6;
  void *v7;
  void *v8;
  AVTToolbarButton *v9;
  AVTToolbarButton *v10;
  void *v11;
  void *v12;
  AVTToolbarButton *v13;
  AVTToolBar *v14;
  void *v15;
  AVTToolBar *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  -[AVTAvatarEditorViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsMac");

  if (v4)
  {
    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    v6 = [AVTToolbarButton alloc];
    AVTAvatarUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1EA5207B8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AVTToolbarButton initWithTitle:isDefault:](v6, "initWithTitle:isDefault:", v8, 1);

    v10 = [AVTToolbarButton alloc];
    AVTAvatarUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA5207B8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AVTToolbarButton initWithTitle:isDefault:](v10, "initWithTitle:isDefault:", v12, 0);

    v14 = [AVTToolBar alloc];
    v30[0] = v13;
    v30[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AVTToolBar initWithButtons:](v14, "initWithButtons:", v15);

    -[AVTAvatarEditorViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;

    +[AVTToolBar defaultToolBarHeight](AVTToolBar, "defaultToolBarHeight");
    -[AVTToolBar setFrame:](v16, "setFrame:", 0.0, v21 - v22, v19, v22);
    -[AVTToolBar setAutoresizingMask:](v16, "setAutoresizingMask:", 10);
    -[AVTToolBar setDelegate:](v16, "setDelegate:", self);
    -[AVTAvatarEditorViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorViewController view](self->_attributeEditorViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSubview:aboveSubview:", v16, v24);

    -[AVTAvatarEditorViewController setToolbar:](self, "setToolbar:", v16);
    -[AVTAvatarEditorViewController navigationController](self, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNavigationBarHidden:", 1);

  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    -[AVTAvatarEditorViewController setCancelButtonItem:](self, "setCancelButtonItem:", v26);

    -[AVTAvatarEditorViewController cancelButtonItem](self, "cancelButtonItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarEditorViewController navigationItem](self, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLeftBarButtonItem:", v27);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_finish_);
    -[AVTAvatarEditorViewController setDoneButtonItem:](self, "setDoneButtonItem:", v29);

    -[AVTAvatarEditorViewController doneButtonItem](self, "doneButtonItem");
    v9 = (AVTToolbarButton *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarEditorViewController navigationItem](self, "navigationItem");
    v13 = (AVTToolbarButton *)objc_claimAutoreleasedReturnValue();
    -[AVTToolbarButton setRightBarButtonItem:](v13, "setRightBarButtonItem:", v9);
  }

  -[AVTAvatarEditorViewController enableDoneButton:](self, "enableDoneButton:", -[AVTAvatarEditorViewController isCreating](self, "isCreating"));
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel_escPressed_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nonRepeatableKeyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CEA6B8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandWithInput:modifierFlags:action:", v6, 0, sel_returnPressed_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_nonRepeatableKeyCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)updateToolBarForLayout:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[AVTAvatarEditorViewController toolbar](self, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v21, "attributesContentViewFrame");
    v11 = v10;
    objc_msgSend(v21, "attributesContentViewFrame");
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
    v15 = v14 > 0.0;
    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIsAnimating:", v15);

    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v11, v7, v13, v9);

    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[AVTAvatarEditorViewController toolbar](self, "toolbar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutIfNeeded");

    }
  }

}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[AVTAvatarEditorViewController toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTAvatarEditorViewController toolbar](self, "toolbar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  else
  {
    v9 = *MEMORY[0x1E0CEB4B0];
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }

  v10 = v9;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)enableDoneButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTAvatarEditorViewController doneButtonItem](self, "doneButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[AVTAvatarEditorViewController toolbar](self, "toolbar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:forButtonAtIndex:", v3, 1);

}

- (void)escPressed:(id)a3
{
  -[AVTAvatarEditorViewController cancel:](self, "cancel:", 0);
}

- (void)cancel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[AVTAvatarEditorViewController hasChanges](self, "hasChanges"))
  {
    -[AVTAvatarEditorViewController confirmCancel:](self, "confirmCancel:", v8);
  }
  else
  {
    -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didFinishEditing");

    -[AVTAvatarEditorViewController splashScreenViewController](self, "splashScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVTAvatarEditorViewController splashScreenViewController](self, "splashScreenViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopPlayingVideos");

    }
    -[AVTAvatarEditorViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarEditorViewControllerDidCancel:", self);

  }
}

- (void)returnPressed:(id)a3
{
  if (-[AVTAvatarEditorViewController isCreating](self, "isCreating", a3)
    || -[AVTAvatarEditorViewController hasChanges](self, "hasChanges"))
  {
    -[AVTAvatarEditorViewController finish:](self, "finish:", 0);
  }
}

- (void)finish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  AVTAvatarEditorViewController *v19;
  id v20;

  -[AVTAvatarEditorViewController logger](self, "logger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishEditing");

  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AVTAvatarEditorViewController isCreating](self, "isCreating");
  -[AVTAvatarEditorViewController environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "usageTrackingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "didCreateAvatar:", v7);
  else
    objc_msgSend(v10, "didEditAvatar:", v7);

  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avatar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarEditorViewController store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__AVTAvatarEditorViewController_finish___block_invoke;
  v17[3] = &unk_1EA51D5E8;
  v18 = v4;
  v19 = self;
  v20 = v7;
  v15 = v7;
  v16 = v4;
  objc_msgSend(v14, "saveAvatarRecord:thumbnailAvatar:completionBlock:thumbnailGenerationCompletionBlock:", v15, v13, v17, 0);

}

void __40__AVTAvatarEditorViewController_finish___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "logDidFinishEditingWithSuccess");
  }
  else
  {
    objc_msgSend(a3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logDidFinishEditingWithError:", v5);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AVTAvatarEditorViewController_finish___block_invoke_2;
  v7[3] = &unk_1EA51D570;
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __40__AVTAvatarEditorViewController_finish___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarEditorViewController:didFinishWithAvatarRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)splashScreenViewControllerDidCancel:(id)a3
{
  id v4;

  -[AVTAvatarEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarEditorViewControllerDidCancel:", self);

}

- (void)splashScreenViewControllerDidConfirm:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  AVTUISetHasDisplayedSplashScreen();
  AVTUISetHasDisplayedCameraDisclosureSplashScreen();
  -[AVTAvatarEditorViewController initialAvatarRecord](self, "initialAvatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarEditorViewController loadAttributeEditorViewWithAvatarRecord:](self, "loadAttributeEditorViewWithAvatarRecord:", v4);

  -[AVTAvatarEditorViewController splashScreenViewController](self, "splashScreenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willMoveToParentViewController:", 0);

  -[AVTAvatarEditorViewController splashScreenViewController](self, "splashScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[AVTAvatarEditorViewController splashScreenViewController](self, "splashScreenViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromParentViewController");

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return !-[AVTAvatarEditorViewController hasChanges](self, "hasChanges", a3);
}

- (void)handleDiscardAttempt
{
  id v3;
  _QWORD block[5];

  if (-[AVTAvatarEditorViewController hasChanges](self, "hasChanges"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AVTAvatarEditorViewController_handleDiscardAttempt__block_invoke;
    block[3] = &unk_1EA51D188;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[AVTAvatarEditorViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avatarEditorViewControllerDidCancel:", self);

  }
}

void __53__AVTAvatarEditorViewController_handleDiscardAttempt__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "cancelButtonItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "confirmCancel:", v2);

}

- (void)confirmCancel:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];

  v4 = a3;
  v5 = -[AVTAvatarEditorViewController isCreating](self, "isCreating");
  AVTAvatarUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("EDITING_CREATE_DISCARD_CONFIRMATION_TITLE");
  else
    v8 = CFSTR("EDITING_DISCARD_CONFIRMATION_TITLE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA5207B8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVTAlertController alertControllerWithTitle:message:preferredStyle:](AVTAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CEA2E0];
  AVTAvatarUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("EDITING_DISCARD_CONFIRM"), &stru_1EA5207B8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__AVTAvatarEditorViewController_confirmCancel___block_invoke;
  v24[3] = &unk_1EA51DCA0;
  v24[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 2, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  AVTAvatarUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("EDITING_DISCARD_CANCEL"), &stru_1EA5207B8, CFSTR("Localized"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v18);

  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();
  objc_msgSend(v10, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((v18 & 1) != 0)
    objc_msgSend(v19, "setBarButtonItem:", v4);
  else
    objc_msgSend(v19, "setSourceView:", v4);

  -[AVTAvatarEditorViewController cancelButtonItem](self, "cancelButtonItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 == v4)
    v22 = 1;
  else
    v22 = 15;
  objc_msgSend(v10, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPermittedArrowDirections:", v22);

  -[AVTAvatarEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

void __47__AVTAvatarEditorViewController_confirmCancel___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attributeEditorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishEditing");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarEditorViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)attributeEditorDidMakeFirstSelection:(id)a3
{
  -[AVTAvatarEditorViewController enableDoneButton:](self, "enableDoneButton:", 1);
  -[AVTAvatarEditorViewController setHasChanges:](self, "setHasChanges:", 1);
}

- (void)attributeEditor:(id)a3 didUpdateVisibleLayout:(id)a4
{
  -[AVTAvatarEditorViewController updateToolBarForLayout:](self, "updateToolBarForLayout:", a4);
}

- (void)controllerPresentationWillObstructView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[AVTAvatarEditorViewController attributeEditorViewController](self, "attributeEditorViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);
    v4 = v5;
  }

}

- (void)toolbar:(id)a3 didSelectButton:(id)a4 atIndex:(unint64_t)a5
{
  if (a5)
    -[AVTAvatarEditorViewController finish:](self, "finish:", a4);
  else
    -[AVTAvatarEditorViewController cancel:](self, "cancel:", a4);
}

- (AVTAvatarEditorViewControllerDelegate)delegate
{
  return (AVTAvatarEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (unint64_t)editorPresentationContext
{
  return self->_editorPresentationContext;
}

- (void)setEditorPresentationContext:(unint64_t)a3
{
  self->_editorPresentationContext = a3;
}

- (AVTAvatarRecord)initialAvatarRecord
{
  return self->_initialAvatarRecord;
}

- (void)setInitialAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_initialAvatarRecord, a3);
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)isCreating
{
  return self->_isCreating;
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (AVTToolBar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (AVTSplashScreenViewController)splashScreenViewController
{
  return self->_splashScreenViewController;
}

- (AVTAvatarAttributeEditorViewController)attributeEditorViewController
{
  return self->_attributeEditorViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeEditorViewController, 0);
  objc_storeStrong((id *)&self->_splashScreenViewController, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_initialAvatarRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)prepareForPresetsScrollTestOnCategory:(id)a3 readyHandler:(id)a4
{
  -[AVTAvatarAttributeEditorViewController prepareForPresetsScrollTestOnCategory:readyHandler:](self->_attributeEditorViewController, "prepareForPresetsScrollTestOnCategory:readyHandler:", a3, a4);
}

- (void)configurePPTMemoji
{
  AVTAvatarAttributeEditorViewController *attributeEditorViewController;
  _QWORD v3[5];

  attributeEditorViewController = self->_attributeEditorViewController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__AVTAvatarEditorViewController_UIApplicationTesting__configurePPTMemoji__block_invoke;
  v3[3] = &unk_1EA51D188;
  v3[4] = self;
  -[AVTAvatarAttributeEditorViewController configurePPTMemoji:](attributeEditorViewController, "configurePPTMemoji:", v3);
}

uint64_t __73__AVTAvatarEditorViewController_UIApplicationTesting__configurePPTMemoji__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish:", 0);
}

@end
