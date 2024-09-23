@implementation BNBannerClientContainerViewController

- (BNBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  BNBannerClientContainerViewController *v12;
  BNBannerClientContainerViewController *v13;
  void *v14;
  id WeakRetained;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentable"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)BNBannerClientContainerViewController;
  v12 = -[BNBannerClientContainerViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_scene, v9);
    objc_storeStrong((id *)&v13->_presentable, a4);
    objc_storeStrong((id *)&v13->_presentableContext, a5);
    -[BNPresentable viewController](v13->_presentable, "viewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BNBannerClientContainerViewController.m"), 69, CFSTR("Presentable '%@' did not provide a view controller"), v10);

    }
    -[BNBannerClientContainerViewController addChildViewController:](v13, "addChildViewController:", v14);
    objc_msgSend(v14, "didMoveToParentViewController:", v13);
    WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__BNBannerClientContainerViewController_initWithScene_presentable_context___block_invoke;
    v21[3] = &unk_1E7044888;
    v16 = v14;
    v22 = v16;
    v23 = v10;
    objc_msgSend(WeakRetained, "_updateUIClientSettingsWithBlock:", v21);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BNPresentable setPresentableContext:](v13->_presentable, "setPresentableContext:", v13);
    -[BNPresentableContext setHostNeedsUpdate](v13->_presentableContext, "setHostNeedsUpdate");

  }
  return v13;
}

void __75__BNBannerClientContainerViewController_initWithScene_presentable_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_opt_class();
  v11 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v11;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "bannerContentOutsets");
  objc_msgSend(v6, "setBannerContentOutsets:");
  objc_msgSend(v6, "setClippingEnabled:", objc_msgSend(*(id *)(a1 + 32), "isClippingEnabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(*(id *)(a1 + 40), "isDraggingDismissalEnabled");
  else
    v7 = 1;
  objc_msgSend(v6, "setDraggingDismissalEnabled:", v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(*(id *)(a1 + 40), "isDraggingInteractionEnabled");
  else
    v8 = 0;
  objc_msgSend(v6, "setDraggingInteractionEnabled:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(*(id *)(a1 + 40), "isTouchOutsideDismissalEnabled");
  else
    v9 = 0;
  objc_msgSend(v6, "setTouchOutsideDismissalEnabled:", v9);
  objc_msgSend(v6, "setPanGestureProxySupported:", objc_opt_respondsToSelector() & 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "preferredBackgroundActivitiesToSuppress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredBackgroundActivitiesToSuppress:", v10);

  }
}

- (void)dealloc
{
  BSInvalidatable *deferringRule;
  BNCoordinatedSceneUpdateAction *sceneUpdateAction;
  objc_super v5;

  -[BSInvalidatable invalidate](self->_deferringRule, "invalidate");
  deferringRule = self->_deferringRule;
  self->_deferringRule = 0;

  -[BNCoordinatedSceneUpdateAction invalidate](self->_sceneUpdateAction, "invalidate");
  sceneUpdateAction = self->_sceneUpdateAction;
  self->_sceneUpdateAction = 0;

  v5.receiver = self;
  v5.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)isDeferringFocus
{
  return self->_deferringRule != 0;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (-[BNBannerClientContainerViewController isDeferringFocus](self, "isDeferringFocus"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      -[BNBannerClientContainerViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setHostNeedsUpdate
{
  BNBannerClientContainerViewController *v2;
  BNPresentable *v3;
  id WeakRetained;
  uint64_t v5;
  BNPresentable *v6;
  id v7;
  BNPresentable *v8;
  _QWORD v9[4];
  BNPresentable *v10;
  _QWORD v11[4];
  BNPresentable *v12;

  v2 = self;
  -[BNPresentableContext setHostNeedsUpdate](self->_presentableContext, "setHostNeedsUpdate");
  v3 = v2->_presentable;
  v2 = (BNBannerClientContainerViewController *)((char *)v2 + 992);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke;
  v11[3] = &unk_1E70448B0;
  v6 = v3;
  v12 = v6;
  objc_msgSend(WeakRetained, "_updateUIClientSettingsWithBlock:", v11);

  v7 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke_2;
  v9[3] = &unk_1E70448D8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "_updateUIClientSettingsWithUITransitionBlock:", v9);

}

void __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_opt_class();
  v8 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v8;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setDraggingDismissalEnabled:", objc_msgSend(*(id *)(a1 + 32), "isDraggingDismissalEnabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setDraggingInteractionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isDraggingInteractionEnabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setTouchOutsideDismissalEnabled:", objc_msgSend(*(id *)(a1 + 32), "isTouchOutsideDismissalEnabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferredBackgroundActivitiesToSuppress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredBackgroundActivitiesToSuppress:", v7);

  }
}

uint64_t __59__BNBannerClientContainerViewController_setHostNeedsUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bannerSizeTransitionAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimationSettings:", v9);

  v10 = objc_opt_class();
  v11 = v5;
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

  objc_msgSend(v8, "bannerContentOutsets");
  objc_msgSend(v13, "setBannerContentOutsets:");

  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[BNBannerClientContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 1);
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[BNPresentable viewController](self->_presentable, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bannerContentOutsets");
  v14 = v5 + v13;
  v16 = v7 + v15;
  v18 = v9 - (v13 + v17);
  v20 = v11 - (v15 + v19);
  objc_msgSend(v12, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  objc_msgSend(v3, "addSubview:", v21);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[BNBannerClientContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[BNPresentable viewController](self->_presentable, "viewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bannerContentOutsets");
  UIRectInset();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  void *v3;
  BNPresentable *presentable;
  void *v5;
  id WeakRetained;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  presentable = self->_presentable;
  if (presentable)
  {
    BNPresentableDescription(presentable, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; presentable: %@"), v5);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; sceneID: %@"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return (NSString *)v3;
}

- (void)_setPreferredContentSize:(CGSize)a3 shouldFence:(BOOL)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v16[7];
  BOOL v17;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  -[BNBannerClientContainerViewController preferredContentSize](self, "preferredContentSize");
  v9 = v8;
  v11 = v10;
  v18.receiver = self;
  v18.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController setPreferredContentSize:](&v18, sel_setPreferredContentSize_, width, height);
  if (v9 != width || v11 != height)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__BNBannerClientContainerViewController__setPreferredContentSize_shouldFence___block_invoke;
    v16[3] = &unk_1E7044900;
    v16[4] = self;
    *(double *)&v16[5] = width;
    *(double *)&v16[6] = height;
    v17 = a4;
    objc_msgSend(WeakRetained, "_updateUIClientSettingsWithUITransitionBlock:", v16);
    if (self->_sceneUpdateAction)
    {
      objc_msgSend(WeakRetained, "_FBSScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_sceneUpdateAction);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendActions:", v15);

    }
  }
}

uint64_t __78__BNBannerClientContainerViewController__setPreferredContentSize_shouldFence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  v7 = a3;
  objc_msgSend(v6, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bannerSizeTransitionAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimationSettings:", v9);

  v10 = objc_opt_class();
  v11 = v5;
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

  objc_msgSend(v13, "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v14 = *(unsigned __int8 *)(a1 + 56);

  return v14;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  -[BNBannerClientContainerViewController _setPreferredContentSize:shouldFence:](self, "_setPreferredContentSize:shouldFence:", 1, a3.width, a3.height);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v28, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "presentationSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "containerSize");
  v17 = v16;
  v19 = v18;

  v20 = objc_opt_class();
  v21 = v4;
  if (v20)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "preferredContentSizeWithPresentationSize:containerSize:", v13, v15, v17, v19);
  else
    objc_msgSend(v21, "preferredContentSize");
  v26 = v24;
  v27 = v25;

  -[BNBannerClientContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v26, v27);
}

- (void)bs_traitCollectionDidChange:(id)a3 forManagedTraitEnvironment:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  _QWORD v45[8];
  objc_super v46;

  v6 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)BNBannerClientContainerViewController;
  -[BNBannerClientContainerViewController bs_traitCollectionDidChange:forManagedTraitEnvironment:](&v46, sel_bs_traitCollectionDidChange_forManagedTraitEnvironment_, v6, v7);
  objc_msgSend(v6, "displayScale");
  v9 = v8;
  -[BNBannerClientContainerViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  if (v9 != v12)
  {
    -[BNPresentable viewController](self->_presentable, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bannerContentOutsets");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "_effectiveUIClientSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    v25 = v23;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    objc_msgSend(v27, "bannerContentOutsets");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    if (v17 != v31 || v15 != v29 || v21 != v35 || v19 != v33)
    {
      v39 = objc_loadWeakRetained((id *)&self->_scene);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __96__BNBannerClientContainerViewController_bs_traitCollectionDidChange_forManagedTraitEnvironment___block_invoke;
      v45[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
      *(double *)&v45[4] = v15;
      *(double *)&v45[5] = v17;
      *(double *)&v45[6] = v19;
      *(double *)&v45[7] = v21;
      objc_msgSend(v39, "_updateUIClientSettingsWithBlock:", v45);

    }
  }
  objc_msgSend(v6, "preferredContentSizeCategory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerClientContainerViewController traitCollection](self, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "preferredContentSizeCategory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v40, "isEqualToString:", v42) & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_23;
  }
  -[BNBannerClientContainerViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v7, "isDescendantOfView:", v43);

  if (v44)
  {
    -[BNPresentable viewController](self->_presentable, "viewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerClientContainerViewController preferredContentSizeDidChangeForChildContentContainer:](self, "preferredContentSizeDidChangeForChildContentContainer:", v40);
LABEL_23:

  }
}

void __96__BNBannerClientContainerViewController_bs_traitCollectionDidChange_forManagedTraitEnvironment___block_invoke(double *a1, void *a2)
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

  objc_msgSend(v6, "setBannerContentOutsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  _QWORD v33[5];

  v32 = a6;
  v11 = a7;
  objc_msgSend(a4, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = v12;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  if (v16)
  {
    v17 = objc_opt_class();
    v18 = v32;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v20 = v19;

    v21 = objc_msgSend(v20, "userInterfaceStyle");
    if (v21 != objc_msgSend(v16, "userInterfaceStyle"))
    {
      v22 = objc_opt_class();
      v23 = v11;
      if (v22)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;
      }
      else
      {
        v24 = 0;
      }
      v25 = v24;

      if (v25)
      {
        objc_msgSend(v25, "animationFence");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", v26);
        objc_msgSend(v25, "bannerAnimationSettings", v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __151__BNBannerClientContainerViewController__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
          v33[3] = &unk_1E7044948;
          v33[4] = self;
          objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v27, v33);
        }

      }
    }
    -[BNBannerClientContainerViewController _setPresentableViewControllerAppearState:](self, "_setPresentableViewControllerAppearState:", objc_msgSend(v16, "viewControllerAppearState", v32));
    v28 = objc_msgSend(v20, "bannerAppearState");
    if (v28 != objc_msgSend(v16, "bannerAppearState"))
    {
      v29 = objc_msgSend(v16, "bannerAppearState");
      objc_msgSend(v16, "revocationReason");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNBannerClientContainerViewController _setPresentableBannerAppearState:reason:](self, "_setPresentableBannerAppearState:reason:", v29, v30);

    }
    v31 = objc_msgSend(v20, "isUserInteractionInProgress");
    if (v31 != objc_msgSend(v16, "isUserInteractionInProgress"))
      -[BNBannerClientContainerViewController _setPresentableUserInteractionInProgress:](self, "_setPresentableUserInteractionInProgress:", objc_msgSend(v16, "isUserInteractionInProgress"));

  }
}

void __151__BNBannerClientContainerViewController__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_handlePanGestureProxyAction:(id)a3
{
  _BNPanGestureServiceProxy *v5;
  _BNPanGestureServiceProxy *panGestureProxy;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("panGestureProxyAction"));

  }
  if (!self->_panGestureProxy && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_alloc_init(_BNPanGestureServiceProxy);
    panGestureProxy = self->_panGestureProxy;
    self->_panGestureProxy = v5;

    -[BNPresentable draggingDidBeginWithGestureProxy:](self->_presentable, "draggingDidBeginWithGestureProxy:", self->_panGestureProxy);
  }
  -[BNBannerClientContainerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceSideWindow:", v8);

  -[_BNPanGestureServiceProxy _setActivePanGestureProxyAction:](self->_panGestureProxy, "_setActivePanGestureProxyAction:", v10);
  -[_BNPanGestureServiceProxy sendAction](self->_panGestureProxy, "sendAction");

}

- (void)_handleRejectionAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BNPresentable *presentable;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rejectionAction"));

  }
  objc_msgSend(v5, "rejectionReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    presentable = self->_presentable;
    v9 = v7;
    BNEffectivePresentableDescription(presentable);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Service presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BNPresentable presentableWillNotAppearAsBanner:withReason:](self->_presentable, "presentableWillNotAppearAsBanner:withReason:", self->_presentable, v6);

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v15 = objc_opt_class();
        v16 = v14;
        if (v15)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = (uint64_t)v16;
          else
            v15 = 0;
        }

        if (v15)
        {
          v17 = objc_opt_class();
          v18 = v16;
          if (v17)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
          }
          else
          {
            v19 = 0;
          }
          v25 = v19;

          -[BNBannerClientContainerViewController _handlePanGestureProxyAction:](self, "_handlePanGestureProxyAction:", v25);
LABEL_28:

          goto LABEL_29;
        }
        v20 = objc_opt_class();
        v21 = v16;
        if (v20)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = (uint64_t)v21;
          else
            v20 = 0;
        }

        if (v20)
        {
          v22 = objc_opt_class();
          v23 = v21;
          if (v22)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
          }
          else
          {
            v24 = 0;
          }
          v25 = v24;

          -[BNBannerClientContainerViewController _handleRejectionAction:](self, "_handleRejectionAction:", v25, (_QWORD)v27);
          goto LABEL_28;
        }
LABEL_29:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)performCoordinatedUpdate:(id)a3 updateResponseHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  BNCoordinatedSceneUpdateAction *v13;
  BNCoordinatedSceneUpdateAction *sceneUpdateAction;
  BNCoordinatedSceneUpdateAction *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (self->_sceneUpdateAction)
  {
    v8 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerClientContainerViewController performCoordinatedUpdate:updateResponseHandler:].cold.1(v8);
    -[BNCoordinatedSceneUpdateAction invalidate](self->_sceneUpdateAction, "invalidate");
  }
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0D016A0];
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke;
  v18[3] = &unk_1E7044970;
  v11 = v7;
  v19 = v11;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v9, "responderWithHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BNCoordinatedSceneUpdateAction initWithInfo:responder:]([BNCoordinatedSceneUpdateAction alloc], "initWithInfo:responder:", 0, v12);
  sceneUpdateAction = self->_sceneUpdateAction;
  self->_sceneUpdateAction = v13;

  v15 = self->_sceneUpdateAction;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke_67;
  v16[3] = &unk_1E7044620;
  objc_copyWeak(&v17, &location);
  -[BNCoordinatedSceneUpdateAction setNullificationHandler:](v15, "setNullificationHandler:", v16);
  if (v6)
    v6[2](v6);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "Received acknowledgement of hosted scene update", v9, 2u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 123);
    *((_QWORD *)WeakRetained + 123) = 0;

  }
}

void __88__BNBannerClientContainerViewController_performCoordinatedUpdate_updateResponseHandler___block_invoke_67(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9628000, v2, OS_LOG_TYPE_DEFAULT, "Pending scene update action nullified", v4, 2u);
  }
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[123];
    WeakRetained[123] = 0;

  }
}

- (void)_setPresentableViewControllerAppearState:(int)a3
{
  id v4;

  -[BNPresentable viewController](self->_presentable, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_appearState") != a3)
  {
    if ((a3 | 2) == 3)
      objc_msgSend(v4, "beginAppearanceTransition:animated:", a3 == 1, 1);
    else
      objc_msgSend(v4, "endAppearanceTransition");
  }

}

- (void)_acquireDeferringRuleIfNecessary
{
  id v4;
  id v5;
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
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BSInvalidatable *v28;
  BSInvalidatable *deferringRule;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "bannerClientContainerShouldDeferFocus:", self))
  {
    if (self->_deferringRule)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[BSInvalidatable reason](self->_deferringRule, "reason");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 369, CFSTR("How do we already have a deferring rule (reason: %@)?"), v34);

      }
      else
      {
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerClientContainerViewController.m"), 369, CFSTR("How do we already have a deferring rule (reason: %@)?"), CFSTR("[none]"));
      }

    }
    v4 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    v5 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v5, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0D00CF8];
    v35 = v6;
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hardwareIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayWithHardwareIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplay:", v11);

    v12 = (void *)MEMORY[0x1E0D00CB8];
    objc_msgSend(v6, "identityToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tokenForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToken:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0D00D90]);
    -[BNBannerClientContainerViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "_contextId");
    objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setToken:", v20);

    objc_msgSend(v16, "setPid:", getpid());
    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNPresentable requesterIdentifier](self->_presentable, "requesterIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNPresentable requestIdentifier](self->_presentable, "requestIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.%@.%@-%x"), v24, v25, v26, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deferEventsMatchingPredicate:toTarget:withReason:", v4, v16, v27);
    v28 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    deferringRule = self->_deferringRule;
    self->_deferringRule = v28;

    objc_msgSend(v18, "windowScene");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "focusSystem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v31, "focusedItem");

  }
}

- (void)_invalidateDeferringRule
{
  BSInvalidatable *deferringRule;
  id WeakRetained;

  -[BSInvalidatable invalidate](self->_deferringRule, "invalidate");
  deferringRule = self->_deferringRule;
  self->_deferringRule = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerClientContainerStoppedDeferringFocus:", self);

}

- (void)_setPresentableBannerAppearState:(int)a3 reason:(id)a4
{
  id v6;
  void *v7;
  BNPresentable *presentable;
  NSObject *v9;
  void *v10;
  void *v11;
  BNPresentable *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BNPresentable *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BNPresentable *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  switch(a3)
  {
    case 0:
      v7 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        presentable = self->_presentable;
        v9 = v7;
        BNEffectivePresentableDescription(presentable);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v10;
        v25 = 2114;
        v26 = v6;
        _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Service presentable did disappear as banner: %{public}@ (%{public}@)", (uint8_t *)&v23, 0x16u);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable presentableDidDisappearAsBanner:withReason:](self->_presentable, "presentableDidDisappearAsBanner:withReason:", self->_presentable, v6);
      break;
    case 1:
      -[BNBannerClientContainerViewController _acquireDeferringRuleIfNecessary](self, "_acquireDeferringRuleIfNecessary");
      v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_presentable;
        v13 = v11;
        BNEffectivePresentableDescription(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v14;
        _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "Service presentable will appear as banner: %{public}@", (uint8_t *)&v23, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable presentableWillAppearAsBanner:](self->_presentable, "presentableWillAppearAsBanner:", self->_presentable);
      break;
    case 2:
      v15 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_presentable;
        v17 = v15;
        BNEffectivePresentableDescription(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1B9628000, v17, OS_LOG_TYPE_DEFAULT, "Service presentable did appear as banner: %{public}@", (uint8_t *)&v23, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable presentableDidAppearAsBanner:](self->_presentable, "presentableDidAppearAsBanner:", self->_presentable);
      break;
    case 3:
      -[BNBannerClientContainerViewController _invalidateDeferringRule](self, "_invalidateDeferringRule");
      v19 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_presentable;
        v21 = v19;
        BNEffectivePresentableDescription(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v22;
        v25 = 2114;
        v26 = v6;
        _os_log_impl(&dword_1B9628000, v21, OS_LOG_TYPE_DEFAULT, "Service presentable will disappear as banner: %{public}@ (%{public}@)", (uint8_t *)&v23, 0x16u);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable presentableWillDisappearAsBanner:withReason:](self->_presentable, "presentableWillDisappearAsBanner:withReason:", self->_presentable, v6);
      break;
    default:
      break;
  }

}

- (void)_setPresentableUserInteractionInProgress:(BOOL)a3
{
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BNPresentable userInteractionWillBeginForBannerForPresentable:](self->_presentable, "userInteractionWillBeginForBannerForPresentable:", self->_presentable);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[BNPresentable userInteractionDidEndForBannerForPresentable:](self->_presentable, "userInteractionDidEndForBannerForPresentable:", self->_presentable);
  }
}

- (UIScene)scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (BNPresentableContext)presentableContext
{
  return self->_presentableContext;
}

- (BNBannerClientContainerDelegate)delegate
{
  return (BNBannerClientContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentableContext, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sceneUpdateAction, 0);
  objc_storeStrong((id *)&self->_panGestureProxy, 0);
  objc_storeStrong((id *)&self->_deferringRule, 0);
}

- (void)performCoordinatedUpdate:(os_log_t)log updateResponseHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9628000, log, OS_LOG_TYPE_ERROR, "Found unexpected pending scene update action, invalidating it and creating anew", v1, 2u);
}

@end
