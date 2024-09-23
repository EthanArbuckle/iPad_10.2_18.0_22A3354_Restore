@implementation HUSceneHolderViewController

- (HUSceneHolderViewController)initWithBundleIdentifier:(id)a3
{
  id v4;
  HUSceneHolderViewController *v5;
  uint64_t v6;
  NSString *bundleId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSceneHolderViewController;
  v5 = -[HUSceneHolderViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  FBScene *scene;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSceneHolderViewController.m"), 52, CFSTR("must dealloc (or could be in an explicit invalidate instead) on main thread as FBScene and FBSceneManager are main thread only"));

  }
  scene = self->_scene;
  if (scene)
  {
    -[FBScene removeObserver:](scene, "removeObserver:", self);
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene identifier](self->_scene, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destroyScene:withTransitionContext:", v6, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)HUSceneHolderViewController;
  -[HUSceneHolderViewController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
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
  RBSProcessIdentity *v22;
  RBSProcessIdentity *processIdentity;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  FBSSceneIdentity *v28;
  FBSSceneIdentity *sceneIdentity;
  id v30;
  RBSProcessIdentity *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  objc_super v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)HUSceneHolderViewController;
  -[HUSceneHolderViewController viewDidLoad](&v45, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneHolderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneHolderViewController setCloseButton:](self, "setCloseButton:", v5);

  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_close_, 64);

  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.9);

  -[HUSceneHolderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneHolderViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "safeAreaLayoutGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, -40.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v38;
  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneHolderViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v11, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v12;
  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 26.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v15;
  -[HUSceneHolderViewController closeButton](self, "closeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 26.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v19);

  v20 = (void *)MEMORY[0x1E0D87D80];
  -[HUSceneHolderViewController bundleId](self, "bundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identityForEmbeddedApplicationIdentifier:", v21);
  v22 = (RBSProcessIdentity *)objc_claimAutoreleasedReturnValue();
  processIdentity = self->_processIdentity;
  self->_processIdentity = v22;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D231F0];
  -[HUSceneHolderViewController bundleId](self, "bundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identityForIdentifier:workspaceIdentifier:", v25, v27);
  v28 = (FBSSceneIdentity *)objc_claimAutoreleasedReturnValue();
  sceneIdentity = self->_sceneIdentity;
  self->_sceneIdentity = v28;

  v30 = objc_alloc(MEMORY[0x1E0D228D8]);
  v31 = self->_processIdentity;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __42__HUSceneHolderViewController_viewDidLoad__block_invoke;
  v44[3] = &unk_1E6F53D50;
  v44[4] = self;
  v32 = (void *)objc_msgSend(v30, "initWithProcessIdentity:executionContextProvider:", v31, v44);
  objc_msgSend(v32, "begin");

}

id __42__HUSceneHolderViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22918]), "initWithIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v1, "setLaunchIntent:", 3);
  return v1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSceneHolderViewController;
  -[HUSceneHolderViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_visible = 1;
  -[HUSceneHolderViewController _updateScene](self, "_updateScene");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSceneHolderViewController;
  -[HUSceneHolderViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_visible = 0;
  -[HUSceneHolderViewController _updateScene](self, "_updateScene");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HUSceneHolderViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __82__HUSceneHolderViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScene");
}

- (void)_lookupScene
{
  FBScene **p_scene;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIScenePresenter *v8;
  UIScenePresenter *scenePresenter;
  void *v10;
  void *v11;
  void *v12;
  id obj;

  p_scene = &self->_scene;
  if (!self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneIdentity identifier](self->_sceneIdentity, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneWithIdentifier:", v5);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (obj)
    {
      objc_msgSend(obj, "addObserver:", self);
      objc_storeStrong((id *)p_scene, obj);
      -[HUSceneHolderViewController _updateScene](self, "_updateScene");
      -[FBScene uiPresentationManager](*p_scene, "uiPresentationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VC-Hoster for %@"), self->_sceneIdentity);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createPresenterWithIdentifier:", v7);
      v8 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v8;

      -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_104);
      -[UIScenePresenter activate](self->_scenePresenter, "activate");
      -[HUSceneHolderViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSceneHolderViewController closeButton](self, "closeButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:below:", v11, v12);

    }
  }
}

uint64_t __43__HUSceneHolderViewController__lookupScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearanceStyle:", 0);
}

- (void)_updateScene
{
  void *v3;
  void *v4;
  void *v5;
  FBScene *scene;
  HUSceneHolderViewController *v7;
  FBScene *v8;
  id v9;
  RBSProcessIdentity *processIdentity;
  uint64_t v11;
  FBApplicationUpdateScenesTransaction *v12;
  FBApplicationUpdateScenesTransaction *transaction;
  FBApplicationUpdateScenesTransaction *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;

  if (self->_visible)
  {
    -[HUSceneHolderViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_scene)
    {
      -[HUSceneHolderViewController _screen](self, "_screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      scene = self->_scene;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __43__HUSceneHolderViewController__updateScene__block_invoke;
      v29[3] = &unk_1E6F53DB8;
      v30 = v5;
      v31 = v3;
      v7 = v5;
      -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v29);

    }
    else
    {
      if (self->_transaction)
        goto LABEL_8;
      v9 = objc_alloc(MEMORY[0x1E0D228E8]);
      processIdentity = self->_processIdentity;
      v11 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __43__HUSceneHolderViewController__updateScene__block_invoke_2;
      v28[3] = &unk_1E6F53D50;
      v28[4] = self;
      v12 = (FBApplicationUpdateScenesTransaction *)objc_msgSend(v9, "initWithProcessIdentity:executionContextProvider:", processIdentity, v28);
      transaction = self->_transaction;
      self->_transaction = v12;

      v14 = self->_transaction;
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __43__HUSceneHolderViewController__updateScene__block_invoke_3;
      v27[3] = &unk_1E6F4E300;
      v27[4] = self;
      v7 = self;
      -[FBApplicationUpdateScenesTransaction setCompletionBlock:](v14, "setCompletionBlock:", v27);
      v15 = (void *)MEMORY[0x1E0D23148];
      objc_msgSend(MEMORY[0x1E0CEA348], "specification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parametersForSpecification:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUSceneHolderViewController _screen](v7, "_screen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v11;
      v22 = 3221225472;
      v23 = __43__HUSceneHolderViewController__updateScene__block_invoke_4;
      v24 = &unk_1E6F53DE0;
      v25 = v19;
      v26 = v3;
      v20 = v19;
      objc_msgSend(v17, "updateSettingsWithBlock:", &v21);
      -[FBApplicationUpdateScenesTransaction updateSceneWithIdentity:parameters:transitionContext:](self->_transaction, "updateSceneWithIdentity:parameters:transitionContext:", v7->_sceneIdentity, v17, 0, v21, v22, v23, v24);
      -[FBApplicationUpdateScenesTransaction begin](self->_transaction, "begin");

    }
LABEL_8:

    return;
  }
  v8 = self->_scene;
  if (v8)
    -[FBScene updateSettingsWithBlock:](v8, "updateSettingsWithBlock:", &__block_literal_global_36_1);
}

void __43__HUSceneHolderViewController__updateScene__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setForeground:", 1);
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v3, "setFrame:");

}

id __43__HUSceneHolderViewController__updateScene__block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22918]), "initWithIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v1, "setLaunchIntent:", 4);
  return v1;
}

uint64_t __43__HUSceneHolderViewController__updateScene__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 992);
  *(_QWORD *)(v2 + 992) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_lookupScene");
}

void __43__HUSceneHolderViewController__updateScene__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setForeground:", 1);
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v3, "setFrame:");

}

uint64_t __43__HUSceneHolderViewController__updateScene__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

- (void)sceneDidInvalidate:(id)a3
{
  UIScenePresenter *scenePresenter;
  FBScene *scene;

  if (self->_scene == a3)
  {
    -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
    scene = self->_scene;
    self->_scene = 0;

    -[HUSceneHolderViewController _updateScene](self, "_updateScene");
  }
}

- (void)close:(id)a3
{
  -[HUSceneHolderViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
}

@end
