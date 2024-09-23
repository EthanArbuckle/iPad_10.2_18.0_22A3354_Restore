@implementation BNBannerSourceListenerHostedPresentableViewController

- (BNBannerSourceListenerHostedPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 scene:(id)a5 readyCompletion:(id)a6
{
  id v11;
  BNBannerSourceListenerHostedPresentableViewController *v12;
  BNBannerSourceListenerHostedPresentableViewController *v13;
  id *p_scene;
  void *v15;
  void *v16;
  uint64_t v17;
  UITraitChangeRegistration *traitChangeRegistration;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  v12 = -[BNBannerSourceListenerPresentableViewController initWithSpecification:serviceDomain:readyCompletion:](&v20, sel_initWithSpecification_serviceDomain_readyCompletion_, a3, a4, a6);
  v13 = v12;
  if (v12)
  {
    p_scene = (id *)&v12->_scene;
    objc_storeStrong((id *)&v12->_scene, a5);
    objc_msgSend(*p_scene, "setDelegate:", v13);
    objc_msgSend(*p_scene, "addObserver:", v13);
    -[BNBannerSourceListenerHostedPresentableViewController _updatePreferredContentSizeWithScene:transitionContext:](v13, "_updatePreferredContentSizeWithScene:transitionContext:", v11, 0);
    -[BNBannerSourceListenerHostedPresentableViewController _updateBannerContentOutsetsWithScene:](v13, "_updateBannerContentOutsetsWithScene:", v11);
    -[BNBannerSourceListenerHostedPresentableViewController _updateClippingWithScene:](v13, "_updateClippingWithScene:", v11);
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerSourceListenerHostedPresentableViewController registerForTraitChanges:withAction:](v13, "registerForTraitChanges:withAction:", v16, sel__handleUserInterfaceStyleTraitChange_);
    v17 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v13->_traitChangeRegistration;
    v13->_traitChangeRegistration = (UITraitChangeRegistration *)v17;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[BNBannerSourceListenerHostedPresentableViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_traitChangeRegistration);
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isHostedContent
{
  return 1;
}

- (BOOL)isReady
{
  return -[FBScene contentState](self->_scene, "contentState") == 2;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  BNPanGestureProxy *panGestureProxy;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  -[FBScene clientSettings](self->_scene, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (objc_msgSend(v10, "isPanGestureProxySupported"))
  {
    objc_storeStrong((id *)&self->_panGestureProxy, a3);
    objc_initWeak(&location, self);
    panGestureProxy = self->_panGestureProxy;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__BNBannerSourceListenerHostedPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
    v12[3] = &unk_1E7044C88;
    objc_copyWeak(&v13, &location);
    -[BNPanGestureProxy setActionHandler:](panGestureProxy, "setActionHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __90__BNBannerSourceListenerHostedPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  BNPanGestureProxyAction *v4;
  void *v5;
  void *v6;
  BNPanGestureProxyAction *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = [BNPanGestureProxyAction alloc];
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BNPanGestureProxyAction initWithPanGestureProxy:hostSideWindow:](v4, "initWithPanGestureProxy:hostSideWindow:", v3, v6);

  objc_msgSend(WeakRetained, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, 0);
  objc_msgSend(v8, "sendActions:", v9);

}

- (id)presentableDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[FBScene identifier](self->_scene, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v7 = CFSTR("sceneID");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  BNPresentableDescription(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "preferredBackgroundActivitiesToSuppress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  BOOL isClippingEnabled;
  UIScenePresenter *v6;
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  BOOL v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[BNBannerSourceListenerHostedPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isClippingEnabled = self->_isClippingEnabled;
  objc_msgSend(v4, "createPresenterWithIdentifier:", CFSTR("default"));
  v6 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v6;

  v8 = self->_scenePresenter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__BNBannerSourceListenerHostedPresentableViewController_viewDidLoad__block_invoke;
  v11[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
  v12 = isClippingEnabled;
  -[UIScenePresenter modifyPresentationContext:](v8, "modifyPresentationContext:", v11);
  -[UIScenePresenter activate](self->_scenePresenter, "activate");
  -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSourceListenerPresentableViewController _setContentView:](self, "_setContentView:", v9);

  -[BNBannerSourceListenerPresentableViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v10);

}

void __68__BNBannerSourceListenerHostedPresentableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPresentedLayerTypes:", 26);
  objc_msgSend(v3, "setAppearanceStyle:", 2);
  objc_msgSend(v3, "setClippingDisabled:", *(_BYTE *)(a1 + 32) == 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[BNBannerSourceListenerHostedPresentableViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BNBannerSourceListenerHostedPresentableViewController _appearState](self, "_appearState") != 2
    || (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v3, "shouldFenceAnimationsForPresentable:", self))
  {
    -[FBScene updateSettingsWithTransitionBlock:](self->_scene, "updateSettingsWithTransitionBlock:", &__block_literal_global_3);
  }

}

id __79__BNBannerSourceListenerHostedPresentableViewController_viewWillLayoutSubviews__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAnimationFence:", v1);

  return v0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_26);
}

void __72__BNBannerSourceListenerHostedPresentableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setViewControllerAppearState:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_30);
}

void __71__BNBannerSourceListenerHostedPresentableViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setViewControllerAppearState:", 2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_33);
}

void __75__BNBannerSourceListenerHostedPresentableViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setViewControllerAppearState:", 3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_36);
}

void __74__BNBannerSourceListenerHostedPresentableViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setViewControllerAppearState:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)bannerContentOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bannerContentOutsets.top;
  left = self->_bannerContentOutsets.left;
  bottom = self->_bannerContentOutsets.bottom;
  right = self->_bannerContentOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)bannerSizeTransitionAnimationSettings
{
  return self->_bannerSizeTransitionAnimationSettings;
}

- (BOOL)isClippingEnabled
{
  return self->_isClippingEnabled;
}

- (void)_setReadyCompletion:(id)a3
{
  void (**v5)(id, BNBannerSourceListenerHostedPresentableViewController *, _QWORD);
  void (**v6)(id, BNBannerSourceListenerHostedPresentableViewController *, _QWORD);
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = (void (**)(id, BNBannerSourceListenerHostedPresentableViewController *, _QWORD))a3;
  -[BNBannerSourceListenerPresentableViewController readyCompletion](self, "readyCompletion");
  v6 = (void (**)(id, BNBannerSourceListenerHostedPresentableViewController *, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v7 = -[BNBannerSourceListenerHostedPresentableViewController isReady](self, "isReady");
    if (v5 && v7)
    {
      -[BNBannerSourceListenerPresentableViewController readyCompletion](self, "readyCompletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerHostedPresentableViewController.m"), 194, CFSTR("How can we be prepared and still have a ready completion?"));

      }
      v5[2](v5, self, 0);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
      -[BNBannerSourceListenerPresentableViewController _setReadyCompletion:](&v10, sel__setReadyCompletion_, v5);
    }
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  FBScene *scene;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[9];
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  objc_super v36;
  CGRect v37;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerHostedPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v36, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[FBScene settings](self->_scene, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[BNBannerSourceListenerHostedPresentableViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "interfaceOrientation");

  switch(v15)
  {
    case 1:
      v16 = 0.0;
      break;
    case 3:
      v16 = 1.57079633;
      break;
    case 4:
      v16 = -1.57079633;
      break;
    default:
      v16 = 3.14159265;
      if (v15 != 2)
        v16 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&t1, v16);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v35, &t1, &t2);
  v17 = BNInterfaceOrientationFromTransform((__int128 *)&v35);
  if (v17 != objc_msgSend(v12, "interfaceOrientation"))
  {
    objc_msgSend(v12, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    if (v7)
      objc_msgSend(v7, "targetTransform");
    else
      memset(&v32, 0, sizeof(v32));
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    CGRectApplyAffineTransform(v37, &v32);
    BSRectWithSize();
    scene = self->_scene;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __108__BNBannerSourceListenerHostedPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v31[3] = &__block_descriptor_72_e60___FBSSceneTransitionContext_16__0__FBSMutableSceneSettings_8l;
    v31[4] = v17;
    v31[5] = v27;
    v31[6] = v28;
    v31[7] = v29;
    v31[8] = v30;
    -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v31);
  }

}

id __108__BNBannerSourceListenerHostedPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnimationFence:", v9);

  return v8;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController invalidate](&v3, sel_invalidate);
  -[BNBannerSourceListenerHostedPresentableViewController _tearDownSceneInfrastructureIfNecessary](self, "_tearDownSceneInfrastructureIfNecessary");
}

- (BOOL)isDraggingDismissalEnabled
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  v3 = -[BNBannerSourceListenerPresentableViewController isDraggingDismissalEnabled](&v10, sel_isDraggingDismissalEnabled);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    -[FBScene clientSettings](self->_scene, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    v3 = objc_msgSend(v8, "isDraggingDismissalEnabled");
  }
  return v3;
}

- (BOOL)isDraggingInteractionEnabled
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  v3 = -[BNBannerSourceListenerPresentableViewController isDraggingInteractionEnabled](&v10, sel_isDraggingInteractionEnabled);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    -[FBScene clientSettings](self->_scene, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    v3 = objc_msgSend(v8, "isDraggingInteractionEnabled");
  }
  return v3;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  unsigned __int8 v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  v3 = -[BNBannerSourceListenerPresentableViewController isTouchOutsideDismissalEnabled](&v10, sel_isTouchOutsideDismissalEnabled);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    -[FBScene clientSettings](self->_scene, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    v3 = objc_msgSend(v8, "isTouchOutsideDismissalEnabled");
  }
  return v3;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController presentableWillAppearAsBanner:](&v4, sel_presentableWillAppearAsBanner_, a3);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))-[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_58);
}

void __87__BNBannerSourceListenerHostedPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setBannerAppearState:", 1);
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController presentableDidAppearAsBanner:](&v4, sel_presentableDidAppearAsBanner_, a3);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))-[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_61);
}

void __86__BNBannerSourceListenerHostedPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setBannerAppearState:", 2);
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  FBScene *scene;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController presentableWillDisappearAsBanner:withReason:](&v10, sel_presentableWillDisappearAsBanner_withReason_, a3, v6);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    scene = self->_scene;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__BNBannerSourceListenerHostedPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
    v8[3] = &unk_1E70446A8;
    v9 = v6;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v8);

  }
}

void __101__BNBannerSourceListenerHostedPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setBannerAppearState:", 3);
  objc_msgSend(v6, "setRevocationReason:", *(_QWORD *)(a1 + 32));

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  FBScene *scene;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  BNBannerSourceListenerHostedPresentableViewController *v24;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v21[3] = &unk_1E7044DD0;
  v9 = v6;
  v22 = v9;
  v10 = v7;
  v23 = v10;
  v24 = self;
  v11 = (void (**)(_QWORD))MEMORY[0x1BCCC21C4](v21);
  if (-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    v11[2](v11);
  }
  else
  {
    -[FBScene settings](self->_scene, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "setBannerAppearState:", 0);
    objc_msgSend(v17, "setRevocationReason:", v10);
    scene = self->_scene;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke_2;
    v19[3] = &unk_1E7044DF8;
    v20 = v11;
    -[FBScene updateSettings:withTransitionContext:completion:](scene, "updateSettings:withTransitionContext:completion:", v17, 0, v19);

  }
}

uint64_t __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  objc_msgSendSuper2(&v5, sel_presentableDidDisappearAsBanner_withReason_, v3, v2);
  return objc_msgSend(*(id *)(a1 + 48), "_tearDownSceneInfrastructureIfNecessary");
}

uint64_t __100__BNBannerSourceListenerHostedPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  BNBannerSourceListenerPresentableRejectionAction *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController presentableWillNotAppearAsBanner:withReason:](&v10, sel_presentableWillNotAppearAsBanner_withReason_, a3, v6);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))
  {
    v7 = -[BNBannerSourceListenerPresentableRejectionAction initWithReason:]([BNBannerSourceListenerPresentableRejectionAction alloc], "initWithReason:", v6);
    -[BNBannerSourceListenerHostedPresentableViewController scene](self, "scene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, 0);
    objc_msgSend(v8, "sendActions:", v9);

  }
  -[BNBannerSourceListenerHostedPresentableViewController _tearDownSceneInfrastructureIfNecessary](self, "_tearDownSceneInfrastructureIfNecessary");

}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController userInteractionWillBeginForBannerForPresentable:](&v4, sel_userInteractionWillBeginForBannerForPresentable_, a3);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))-[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_73);
}

void __105__BNBannerSourceListenerHostedPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setUserInteractionInProgress:", 1);
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  BNPanGestureProxy *panGestureProxy;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController userInteractionDidEndForBannerForPresentable:](&v5, sel_userInteractionDidEndForBannerForPresentable_, a3);
  if (!-[BNBannerSourceListenerPresentableViewController _isPresentableContextInterfaceAvailable](self, "_isPresentableContextInterfaceAvailable"))-[FBScene updateSettingsWithBlock:](self->_scene, "updateSettingsWithBlock:", &__block_literal_global_76);
  panGestureProxy = self->_panGestureProxy;
  self->_panGestureProxy = 0;

}

void __102__BNBannerSourceListenerHostedPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setUserInteractionInProgress:", 0);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_opt_class();
        v11 = v9;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        if (objc_msgSend(v13, "canSendResponse"))
        {
          objc_msgSend(MEMORY[0x1E0D016A8], "response");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sendResponse:", v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  id v18;

  v18 = a3;
  v8 = a6;
  -[BNBannerSourceListenerHostedPresentableViewController preferredContentSize](self, "preferredContentSize");
  v10 = v9;
  v12 = v11;
  -[BNBannerSourceListenerHostedPresentableViewController _updatePreferredContentSizeWithScene:transitionContext:](self, "_updatePreferredContentSizeWithScene:transitionContext:", v18, v8);

  v16 = *(float64x2_t *)&self->_bannerContentOutsets.bottom;
  v17 = *(float64x2_t *)&self->_bannerContentOutsets.top;
  -[BNBannerSourceListenerHostedPresentableViewController _updateBannerContentOutsetsWithScene:](self, "_updateBannerContentOutsetsWithScene:", v18);
  -[BNBannerSourceListenerHostedPresentableViewController preferredContentSize](self, "preferredContentSize");
  if (v10 == v14
    && v12 == v13
    && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v17, *(float64x2_t *)&self->_bannerContentOutsets.top), (int32x4_t)vceqq_f64(v16, *(float64x2_t *)&self->_bannerContentOutsets.bottom))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) != 0)
  {
    -[BNBannerSourceListenerHostedPresentableViewController parentViewController](self, "parentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bannerContentOutsetsDidInvalidateForPresentableViewController:", self);

  }
  -[BNBannerSourceListenerHostedPresentableViewController _updateClippingWithScene:](self, "_updateClippingWithScene:", v18);

}

- (void)sceneDidInvalidate:(id)a3
{
  FBScene *scene;
  _QWORD v5[5];

  scene = self->_scene;
  self->_scene = 0;

  -[BNBannerSourceListenerHostedPresentableViewController _tearDownScenePresenterIfNecessary](self, "_tearDownScenePresenterIfNecessary");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__BNBannerSourceListenerHostedPresentableViewController_sceneDidInvalidate___block_invoke;
  v5[3] = &unk_1E70445D0;
  v5[4] = self;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_sceneDidInvalidateForBannerSourceListenerPresentable_, v5);
}

uint64_t __76__BNBannerSourceListenerHostedPresentableViewController_sceneDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneDidInvalidateForBannerSourceListenerPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)bannerSourceListenerPresentableViewControllerViewDidChangeSize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  FBScene *scene;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[8];
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)BNBannerSourceListenerHostedPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController bannerSourceListenerPresentableViewControllerViewDidChangeSize:](&v37, sel_bannerSourceListenerPresentableViewControllerViewDidChangeSize_, a3);
  -[BNBannerSourceListenerHostedPresentableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    if (v7)
    {
      objc_msgSend(v6, "bn_convertRectToSceneReferenceSpace:", v8, v9, v10, v11);
      v12 = v16;
      v13 = v17;
      v14 = v18;
      v15 = v19;
    }

  }
  else
  {
    objc_msgSend(v4, "frame");
    v12 = v20;
    v13 = v21;
    v14 = v22;
    v15 = v23;
  }
  v24 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled");
  scene = self->_scene;
  if (v24)
  {
    -[FBScene settings](scene, "settings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    v31 = (void *)objc_msgSend(v30, "mutableCopy");
    if (v31)
    {
      objc_msgSend(v31, "setFrame:", v12, v13, v14, v15);
      v32 = objc_alloc_init(MEMORY[0x1E0CEA350]);
      -[BNBannerSourceListenerHostedPresentableViewController parentViewController](self, "parentViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v33, "sizeTransitionAnimationSettingsForPresentable:", self);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(v32, "setAnimationSettings:", v34);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && !objc_msgSend(v33, "shouldFenceAnimationsForPresentable:", self))
      {
        v35 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v32, "setAnimationFence:", v35);
      -[FBScene updateSettings:withTransitionContext:completion:](self->_scene, "updateSettings:withTransitionContext:completion:", v31, v32, 0);

    }
  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __120__BNBannerSourceListenerHostedPresentableViewController_bannerSourceListenerPresentableViewControllerViewDidChangeSize___block_invoke;
    v36[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
    *(double *)&v36[4] = v12;
    *(double *)&v36[5] = v13;
    *(double *)&v36[6] = v14;
    *(double *)&v36[7] = v15;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v36);
  }

}

void __120__BNBannerSourceListenerHostedPresentableViewController_bannerSourceListenerPresentableViewControllerViewDidChangeSize___block_invoke(double *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_handleUserInterfaceStyleTraitChange:(id)a3
{
  FBScene *scene;
  _QWORD v4[5];

  scene = self->_scene;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__BNBannerSourceListenerHostedPresentableViewController__handleUserInterfaceStyleTraitChange___block_invoke;
  v4[3] = &unk_1E7044E80;
  v4[4] = self;
  -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v4);
}

id __94__BNBannerSourceListenerHostedPresentableViewController__handleUserInterfaceStyleTraitChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  objc_msgSend(v7, "setUserInterfaceStyle:", v9);
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneTransitionContext transitionContext](BNBannerSceneTransitionContext, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "userInterfaceStyleTransitionAnimationSettingsForPresentable:forTransitionToStyle:", *(_QWORD *)(a1 + 32), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v11, "setBannerAnimationSettings:", v12);
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAnimationFence:", v13);

  return v11;
}

- (void)_updatePreferredContentSizeWithScene:(id)a3 transitionContext:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  BSAnimationSettings *v11;
  BSAnimationSettings *bannerSizeTransitionAnimationSettings;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a4;
  objc_msgSend(a3, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v19, "animationSettings");
    v11 = (BSAnimationSettings *)objc_claimAutoreleasedReturnValue();
    bannerSizeTransitionAnimationSettings = self->_bannerSizeTransitionAnimationSettings;
    self->_bannerSizeTransitionAnimationSettings = v11;

    objc_msgSend(v10, "preferredContentSize");
    v14 = v13;
    v16 = v15;
    -[BNBannerSourceListenerHostedPresentableViewController preferredContentSize](self, "preferredContentSize");
    if (v18 != v14 || v17 != v16)
      -[BNBannerSourceListenerHostedPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, v16);
  }

}

- (void)_updateBannerContentOutsetsWithScene:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v16;

  objc_msgSend(a3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v16 = v7;

  v8 = v16;
  if (v16)
  {
    objc_msgSend(v16, "bannerContentOutsets");
    v8 = v16;
    if (self->_bannerContentOutsets.left != v10
      || self->_bannerContentOutsets.top != v9
      || self->_bannerContentOutsets.right != v12
      || self->_bannerContentOutsets.bottom != v11)
    {
      self->_bannerContentOutsets.top = v9;
      self->_bannerContentOutsets.left = v10;
      self->_bannerContentOutsets.bottom = v11;
      self->_bannerContentOutsets.right = v12;
    }
  }

}

- (void)_updateClippingWithScene:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v9 = v7;

  v8 = v9;
  if (v9)
  {
    self->_isClippingEnabled = objc_msgSend(v9, "isClippingEnabled");
    v8 = v9;
  }

}

- (void)_tearDownScenePresenterIfNecessary
{
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v3;

  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    self->_scenePresenter = 0;
    v3 = scenePresenter;

    -[UIScenePresenter deactivate](v3, "deactivate");
    -[UIScenePresenter invalidate](v3, "invalidate");

  }
}

- (id)_tearDownSceneBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke;
  v7[3] = &unk_1E7044948;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1BCCC21C4](v7);

  return v5;
}

void __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "updateSettingsWithBlock:", &__block_literal_global_92);
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destroyScene:withTransitionContext:", v3, 0);

  }
}

void __77__BNBannerSourceListenerHostedPresentableViewController__tearDownSceneBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setForeground:", 0);
}

- (void)_tearDownSceneIfNecessary
{
  FBScene *scene;
  FBScene *v4;
  dispatch_block_t block;

  scene = self->_scene;
  if (scene)
  {
    self->_scene = 0;
    v4 = scene;

    -[BNBannerSourceListenerHostedPresentableViewController _tearDownSceneBlock:](self, "_tearDownSceneBlock:", v4);
    block = (dispatch_block_t)objc_claimAutoreleasedReturnValue();

    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_tearDownSceneInfrastructureIfNecessary
{
  -[BNBannerSourceListenerHostedPresentableViewController _tearDownScenePresenterIfNecessary](self, "_tearDownScenePresenterIfNecessary");
  -[BNBannerSourceListenerHostedPresentableViewController _tearDownSceneIfNecessary](self, "_tearDownSceneIfNecessary");
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_bannerSizeTransitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_panGestureProxy, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

@end
