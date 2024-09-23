@implementation CSBackgroundContentViewController

- (CSBackgroundContentViewController)initWithScene:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CSBackgroundContentViewController *v11;
  CSBackgroundContentViewController *v12;
  id *p_scene;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSBackgroundContentViewController;
  v11 = -[CSBackgroundContentViewController init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    p_scene = (id *)&v11->_scene;
    objc_storeStrong((id *)&v11->_scene, a3);
    v37[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[CSBackgroundContentViewController registerForTraitChanges:withAction:](v12, "registerForTraitChanges:withAction:", v14, sel_backlightLuminanceChangedForEnvironment_previousTraitCollection_);

    v36 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[CSBackgroundContentViewController registerForTraitChanges:withAction:](v12, "registerForTraitChanges:withAction:", v16, sel_userInterfaceStyleChangedForEnvironment_previousTraitCollection_);

    v18 = *p_scene;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke;
    v29 = &unk_1E8E2F530;
    v19 = v12;
    v30 = v19;
    v31 = x;
    v32 = y;
    v33 = width;
    v34 = height;
    objc_msgSend(v18, "updateSettingsWithBlock:", &v26);
    objc_msgSend(*p_scene, "uiPresentationManager", v26, v27, v28, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createPresenterWithIdentifier:priority:", v22, 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v19[131];
    v19[131] = (id)v23;

    objc_msgSend(v19[131], "modifyPresentationContext:", &__block_literal_global_11);
    objc_msgSend(v19[131], "activate");
    objc_msgSend(*p_scene, "activateWithTransitionContext:", 0);

  }
  return v12;
}

void __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D228F8];
  v4 = a2;
  objc_msgSend(v3, "mainConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v6);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __57__CSBackgroundContentViewController_initWithScene_frame___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (void)dealloc
{
  objc_super v3;

  -[FBScene invalidate](self->_scene, "invalidate");
  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSBackgroundContentViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  CSBackgroundContentView *v4;
  id v5;

  -[CSBackgroundContentViewController scenePresenter](self, "scenePresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[CSBackgroundContentView initWithPresentationView:]([CSBackgroundContentView alloc], "initWithPresentationView:", v5);
  -[CSBackgroundContentView bs_setHitTestingDisabled:](v4, "bs_setHitTestingDisabled:", 1);
  -[CSBackgroundContentViewController setView:](self, "setView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundContentViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSBackgroundContentViewController _updateForegroundState](self, "_updateForegroundState");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSBackgroundContentViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSBackgroundContentViewController _updateForegroundState](self, "_updateForegroundState");
}

- (void)tapGestureRecognizerAction:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CSBackgroundContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC580]), "initWithLocation:", v7, v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v11, 0);
  -[FBScene sendActions:](self->_scene, "sendActions:", v10);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FBScene clientHandle](self->_scene, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBScene backlightSceneHostEnvironment](self->_scene, "backlightSceneHostEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9DB0], "entryWithSceneHostEnvironment:bundleIdentifier:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  FBScene *scene;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)CSBackgroundContentViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v16 = 0;
  v17 = 0;
  v8 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(v7, "transitionDuration");
  v10 = v9;

  objc_msgSend(v8, "settingsWithDuration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__CSBackgroundContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E8E2F598;
  v15 = v11;
  v18 = width;
  v19 = height;
  v13 = v11;
  -[FBScene performUpdate:](scene, "performUpdate:", v14);

}

void __88__CSBackgroundContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CEA918];
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "_synchronizedDrawingFence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationFence:", v7);

  objc_msgSend(v6, "setAnimationSettings:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)backlightLuminanceChangedForEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  _BOOL4 v5;

  v5 = objc_msgSend(a4, "_backlightLuminance", a3) != 0;
  if (((v5 ^ -[CSBackgroundContentViewController isScreenOff](self, "isScreenOff")) & 1) == 0)
    -[CSBackgroundContentViewController _updateForegroundState](self, "_updateForegroundState");
}

- (BOOL)isScreenOff
{
  void *v2;
  BOOL v3;

  -[CSBackgroundContentViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_backlightLuminance") == 0;

  return v3;
}

- (void)_updateForegroundState
{
  BOOL v3;
  char v4;
  FBScene *scene;
  _QWORD v6[4];
  char v7;

  v3 = -[CSBackgroundContentViewController _appearState](self, "_appearState") != 0;
  v4 = -[CSBackgroundContentViewController isScreenOff](self, "isScreenOff");
  scene = self->_scene;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CSBackgroundContentViewController__updateForegroundState__block_invoke;
  v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  v7 = v3 & ~v4;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v6);
}

uint64_t __59__CSBackgroundContentViewController__updateForegroundState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateUserInterfaceStyle
{
  void *v3;
  uint64_t v4;
  FBScene *scene;
  _QWORD v6[5];

  -[CSBackgroundContentViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  scene = self->_scene;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CSBackgroundContentViewController__updateUserInterfaceStyle__block_invoke;
  v6[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
  v6[4] = v4;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v6);
}

uint64_t __62__CSBackgroundContentViewController__updateUserInterfaceStyle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIScenePresentation)presentationView
{
  return self->_presentationView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
