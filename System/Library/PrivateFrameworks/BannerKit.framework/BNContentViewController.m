@implementation BNContentViewController

- (NSArray)presentedPresentables
{
  void *v3;
  void *v4;
  void *v5;

  -[BNTieredArray allObjects](self->_presentables, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSMutableSet allObjects](self->_dismissingPresentables, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsInArray:", v5);

  return (NSArray *)v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (NSArray)topPresentables
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v3 = 0;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = MEMORY[0x1E0C809B0];
  while (v3 < -[BNTieredArray tierCount](self->_presentables, "tierCount"))
  {
    -[BNTieredArray tierAtIndex:](self->_presentables, "tierAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __42__BNContentViewController_topPresentables__block_invoke;
    v8[3] = &unk_1E70449C8;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

    ++v3;
  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __42__BNContentViewController_topPresentables__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "insertObject:atIndex:", v6, 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "_isPresentableNotice:", v6) & 1) == 0)
    *a4 = 1;

}

- (NSArray)allPresentables
{
  return -[BNTieredArray allObjects](self->_presentables, "allObjects");
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BNContentViewController topPresentables](self, "topPresentables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "canBecomeFirstResponder");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BNContentViewController topPresentables](self, "topPresentables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "becomeFirstResponder");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BNContentViewController topPresentables](self, "topPresentables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "resignFirstResponder");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)loadView
{
  BNContentViewControllerView *v3;
  BNContentViewControllerView *v4;
  id v5;

  v3 = [BNContentViewControllerView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v4 = -[BNContentViewControllerView initWithFrame:](v3, "initWithFrame:");
  -[BNContentViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  id WeakRetained;
  char v5;
  void *v6;
  UIPanGestureRecognizer **p_panGesture;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[BNContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "panGestureRecognizerForPresenter:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  p_panGesture = &self->_panGesture;
  objc_storeStrong((id *)&self->_panGesture, v6);
  if ((v5 & 1) != 0)

  -[UIPanGestureRecognizer addTarget:action:](*p_panGesture, "addTarget:action:", self, sel__handlePan_);
  -[UIPanGestureRecognizer setDelegate:](*p_panGesture, "setDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  BNTieredArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_presentables;
  v6 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_beginAppearanceTransition:animated:", 1, v3, (_QWORD)v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  BNTieredArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[UIPanGestureRecognizer setEnabled:](self->_panGesture, "setEnabled:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_presentables;
  v5 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bs_endAppearanceTransition", (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  BNTieredArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_presentables;
  v6 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_beginAppearanceTransition:animated:", 0, v3, (_QWORD)v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  BNTieredArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  -[UIPanGestureRecognizer setEnabled:](self->_panGesture, "setEnabled:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_presentables;
  v5 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bs_endAppearanceTransition", (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BNContentViewController topPresentables](self, "topPresentables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v11 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "shouldAutorotate");

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[BNContentViewController _topPresentable](self, "_topPresentable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIViewControllerFromPresentable(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");
  if (v4)
    v5 = v4;
  else
    v5 = 30;

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (void)bannerContentOutsetsDidInvalidateForPresentableViewController:(id)a3
{
  void *v4;
  void *v5;

  UIViewControllerFromPresentable(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[BNContentViewController _updateFrameForChildContentContainer:minimumTopInsetUpdate:](self, "_updateFrameForChildContentContainer:minimumTopInsetUpdate:", v4, 0);
    v4 = v5;
  }

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BNContentViewController;
  v4 = a3;
  -[BNContentViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[BNContentViewController _updateFrameForChildContentContainer:minimumTopInsetUpdate:](self, "_updateFrameForChildContentContainer:minimumTopInsetUpdate:", v4, 0, v5.receiver, v5.super_class);

}

- (void)_updateFrameForChildContentContainer:(id)a3 minimumTopInsetUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  char v39;
  void *v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  BNBannerAnimator *v53;
  void *v54;
  BNBannerAnimator *v55;
  BNBannerAnimator *v56;
  void *v57;
  BNBannerAnimator *v58;
  id v59;
  void *v60;
  id WeakRetained;
  void *v62;
  id *location;
  id *locationa;
  void *v65;
  _QWORD v66[4];
  BNBannerAnimator *v67;
  id v68;
  id v69;
  id v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v4 = a4;
  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[BNContentViewController allPresentables](self, "allPresentables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v72;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v72 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v10);
      UIViewControllerFromPresentable(v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 == v6;

      if (v13)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_43;
    v15 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      BNEffectivePresentableDescription(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v17;
      _os_log_impl(&dword_1B9628000, v16, OS_LOG_TYPE_DEFAULT, "Preferred content size did change for presentable: %{public}@", buf, 0xCu);

    }
    UIViewControllerFromPresentable(v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[BNContentViewController transitionCoordinator](self, "transitionCoordinator");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 || v18 != v6)
      goto LABEL_40;
    if (!objc_msgSend(v6, "bs_isAppearingOrAppeared"))
    {
LABEL_41:

      goto LABEL_42;
    }
    v20 = BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v76 = v6;
      _os_log_impl(&dword_1B9628000, v20, OS_LOG_TYPE_DEFAULT, "Animating preferred content size change of child container: %{public}@", buf, 0xCu);
    }
    -[BNContentViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    if (objc_msgSend(v6, "bs_isAppearingOrAppeared"))
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", v14, v23, v25, v27, v29);
    else
      -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:", v6, v23, v25, v27, v29);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    v37 = v33;
    if (v4)
    {
      objc_msgSend(v6, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = objc_msgSend(v6, "bn_shouldAnimateViewTransitionToSize:", v32, v33);
      objc_msgSend(v6, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v40;
      if ((v39 & 1) == 0)
      {
        objc_msgSend(v40, "_removeAllRetargetableAnimations:", 1);
        v41 = 0;
        goto LABEL_26;
      }
    }
    v41 = 1;
LABEL_26:
    objc_msgSend(v38, "frame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    -[BNContentViewController view](self, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[BNTransitionContext transitionContextForTransitionOfViewController:fromFrame:toFrame:inContainerView:](BNTransitionContext, "transitionContextForTransitionOfViewController:fromFrame:toFrame:inContainerView:", v6, v50, v43, v45, v47, v49, *(double *)&v34, *(double *)&v35, v36, v37);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      v52 = -[BNContentViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    else
      v52 = 0;
    objc_msgSend(v51, "setAnimated:", v52);
    objc_msgSend(v6, "transitioningDelegate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      if (v4)
      {
        v53 = [BNBannerAnimator alloc];
        +[BNBannerAnimator defaultResizeAnimationSettings](BNBannerAnimator, "defaultResizeAnimationSettings");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[BNBannerAnimator initWithAnimationSettings:](v53, "initWithAnimationSettings:", v54);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v65, "animationControllerForResizingController:userInfo:", v6, 0);
          v56 = (BNBannerAnimator *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = objc_alloc_init(BNBannerAnimator);
        }
        v55 = v56;
      }
    }
    else
    {
      v55 = 0;
    }
    objc_initWeak((id *)buf, self);
    objc_msgSend(v51, "transitionCoordinator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __86__BNContentViewController__updateFrameForChildContentContainer_minimumTopInsetUpdate___block_invoke;
    v66[3] = &unk_1E70449F0;
    location = v70;
    objc_copyWeak(v70, (id *)buf);
    v58 = v55;
    v67 = v58;
    v19 = v38;
    v68 = v19;
    v70[1] = v34;
    v70[2] = v35;
    v70[3] = *(id *)&v36;
    v70[4] = *(id *)&v37;
    v59 = v14;
    v69 = v59;
    objc_msgSend(v57, "animateAlongsideTransition:completion:", v66, 0);

    objc_msgSend(v51, "transitionCoordinator");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewWillTransitionToSize:withTransitionCoordinator:", v60, v36, v37);

    objc_msgSend(v19, "_removeAllRetargetableAnimations:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v51, "transitionCoordinator", v70);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "presenter:presentable:willTransitionToSize:withTransitionCoordinator:", self, v59, v62, v36, v37);

    }
    objc_msgSend(v51, "performTransitionWithAnimator:", v58, location);

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);

LABEL_40:
    goto LABEL_41;
  }
LABEL_9:
  v14 = v7;
LABEL_42:

LABEL_43:
}

void __86__BNContentViewController__updateFrameForChildContentContainer_minimumTopInsetUpdate___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  __int128 v3;
  char *v4;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    if (!WeakRetained)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    objc_msgSend(v4, "_postLayoutChangeForVisibleNotifications");
    WeakRetained = v4;
    if (!v4)
      goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 48) == *((_QWORD *)WeakRetained + 126))
  {
    v3 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(WeakRetained + 1016) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(WeakRetained + 1032) = v3;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  -[BNContentViewController _layoutManager](self, "_layoutManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSRectWithSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[BNContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "_bn_isRotating"))
    v16 = objc_msgSend(v15, "_toWindowOrientation");
  else
    v16 = objc_msgSend(v15, "interfaceOrientation");
  v17 = v16;
  objc_msgSend(v15, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v18, v17, v7, v9, v11, v13);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[BNContentViewController traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayScale");
  objc_msgSend(v5, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v24, v26, v20, v22, v24, v26, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, v28);
  v30 = v29;
  v32 = v31;

  v33 = v30;
  v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  BNTransitionContext *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  BNTransitionContext *v22;
  id v23;
  _QWORD v24[4];
  BNTransitionContext *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30[3];
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGSize v37;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37.width = width;
    v37.height = height;
    NSStringFromCGSize(v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v11;
    v34 = 2114;
    v35 = v12;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ view will transition to size: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presenter:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  v14 = self->_activeBannerTransitionContext;
  -[BNTransitionContext transitionCoordinator](v14, "transitionCoordinator");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v7;
  v18 = v17;

  objc_msgSend((id)objc_opt_class(), "_retargetableBannerTransitionAnimatorForAnimator:", self->_activeBannerTransitionAnimator);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)BNContentViewController;
  -[BNContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v31, sel_viewWillTransitionToSize_withTransitionCoordinator_, v18, width, height);
  objc_initWeak((id *)buf, self);
  v20 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v28[3] = &unk_1E7044A18;
  v30[1] = *(id *)&width;
  v30[2] = *(id *)&height;
  objc_copyWeak(v30, (id *)buf);
  v21 = v7;
  v29 = v21;
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_40;
  v24[3] = &unk_1E7044A40;
  objc_copyWeak(&v27, (id *)buf);
  v22 = v14;
  v25 = v22;
  v23 = v19;
  v26 = v23;
  objc_msgSend(v18, "animateAlongsideTransition:completion:", v28, v24);
  objc_msgSend(v23, "retargetTransition:", self->_activeBannerTransitionContext);

  objc_destroyWeak(&v27);
  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);

}

void __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  NSObject *v7;
  void *v8;
  _QWORD *WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  _OWORD v38[3];
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;
  CGSize v48;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(double *)(a1 + 48);
    v6 = *(double *)(a1 + 56);
    v7 = v4;
    v48.width = v5;
    v48.height = v6;
    NSStringFromCGSize(v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = v8;
    _os_log_impl(&dword_1B9628000, v7, OS_LOG_TYPE_DEFAULT, "Animating layout of top presentables for transition to size: %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v37 = v3;
    BSRectWithSize();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(WeakRetained, "topPresentables");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          UIViewControllerFromPresentable(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "bs_isAppearingOrAppeared");
          v26 = *(void **)(a1 + 32);
          if (v25)
          {
            if (v26)
              objc_msgSend(v26, "targetTransform");
            else
              memset(v39, 0, sizeof(v39));
            objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContainerBounds:targetTransform:", v24, v39, v11, v13, v15, v17);
          }
          else
          {
            if (v26)
              objc_msgSend(v26, "targetTransform");
            else
              memset(v38, 0, sizeof(v38));
            objc_msgSend(WeakRetained, "_dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:", v24, v38, v11, v13, v15, v17);
          }
          v31 = v27;
          v32 = v28;
          v33 = v29;
          v34 = v30;
          objc_msgSend(v24, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setFrame:", v31, v32, v33, v34);

          objc_msgSend(WeakRetained, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setNeedsLayout");
          objc_msgSend(v36, "layoutIfNeeded");
          if (v23 == (void *)WeakRetained[126])
          {
            *((double *)WeakRetained + 127) = v31;
            *((double *)WeakRetained + 128) = v32;
            *((double *)WeakRetained + 129) = v33;
            *((double *)WeakRetained + 130) = v34;
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v20);
    }

    objc_msgSend(WeakRetained, "_postLayoutChangeForVisibleNotifications");
    v3 = v37;
  }

}

void __78__BNContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_40(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_resetActiveBannerTransitionContextIfComplete:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "_resetActiveBannerTransitionAnimator:", *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

- (BNContentViewController)initWithAuthority:(id)a3
{
  id v5;
  BNContentViewController *v6;
  BNContentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BNContentViewController;
  v6 = -[BNContentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authority, a3);

  return v7;
}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  char v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableSet *presentingPresentables;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  _BOOL8 v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  BNDefaultBannerTransitioningDelegate *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  __int128 *p_buf;
  id v87;
  char v88;
  id location;
  _QWORD v90[4];
  id v91;
  id v92;
  BNContentViewController *v93;
  _BYTE v94[128];
  _BYTE v95[16];
  __int128 buf;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;

  v6 = a4;
  v101 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v69 = a5;
  v9 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    BNEffectivePresentableDescription(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1B9628000, v10, OS_LOG_TYPE_DEFAULT, "Asked to present presentable: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  if (v8 && (-[NSMutableSet containsObject:](self->_presentingPresentables, "containsObject:", v8) & 1) == 0)
  {
    v12 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      BNEffectivePresentableDescription(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "Presenting presentable %{public}@", (uint8_t *)&buf, 0xCu);

    }
    presentingPresentables = self->_presentingPresentables;
    if (!presentingPresentables)
    {
      v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = self->_presentingPresentables;
      self->_presentingPresentables = v16;

      presentingPresentables = self->_presentingPresentables;
    }
    -[NSMutableSet addObject:](presentingPresentables, "addObject:", v8);
    -[NSMutableSet removeObject:](self->_dismissingPresentables, "removeObject:", v8);
    v65 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__0;
    v99 = __Block_byref_object_dispose__0;
    v100 = 0;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "requesterIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNTieredArray allObjects](self->_presentables, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3880];
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke;
      v90[3] = &unk_1E7044A68;
      v91 = v8;
      v21 = v18;
      v92 = v21;
      v93 = self;
      objc_msgSend(v20, "predicateWithBlock:", v90);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredArrayUsingPredicate:", v22);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v23;

    }
    UIViewControllerFromPresentable(v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transitioningDelegate");
    v68 = (BNDefaultBannerTransitioningDelegate *)objc_claimAutoreleasedReturnValue();
    if (!v68)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "defaultTransitioningDelegateForPresenter:", self);
        v68 = (BNDefaultBannerTransitioningDelegate *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = objc_alloc_init(BNDefaultBannerTransitioningDelegate);
      }
      objc_msgSend(v25, "setTransitioningDelegate:", v68);

    }
    -[BNContentViewController _presentablesWithIdentification:requiringUniqueMatch:](self, "_presentablesWithIdentification:requiringUniqueMatch:", v8, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (!v28)
    {
      -[BNContentViewController _topPresentable](self, "_topPresentable");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[BNContentViewController shouldOverlapPresentable:withPresentable:](self, "shouldOverlapPresentable:withPresentable:", v29, v8);
      v31 = -[BNContentViewController shouldNewTierBeAddedToTopForPresentable:withPresentable:](self, "shouldNewTierBeAddedToTopForPresentable:withPresentable:", v29, v8);
      if (v30
        && !-[BNContentViewController _isPresentableNotice:](self, "_isPresentableNotice:", v8)
        && -[BNContentViewController _isPresentableNotice:](self, "_isPresentableNotice:", v29))
      {
        -[BNContentViewController _insertPresentable:beneathPresentable:withTransitioningDelegate:](self, "_insertPresentable:beneathPresentable:withTransitioningDelegate:", v8, v29, v68);
        v32 = 1;
      }
      else
      {
        -[BNContentViewController _addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:](self, "_addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:", v8, v68, !v30, v31);
        v32 = 0;
      }
      -[BNContentViewController addChildViewController:](self, "addChildViewController:", v25);
      objc_msgSend(v25, "didMoveToParentViewController:", self);
      objc_msgSend(v25, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNContentViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v32)
      {
        UIViewControllerFromPresentable(v29);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "insertSubview:belowSubview:", v33, v37);

      }
      else
      {
        objc_msgSend(v34, "addSubview:", v33);
      }

    }
    v38 = -[BNContentViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    v39 = -[BNContentViewController _newBannerTransitionContextForPresenting:viewController:animated:](self, "_newBannerTransitionContextForPresenting:viewController:animated:", 1, v25, v38);
    objc_storeStrong((id *)&self->_activeBannerTransitionContext, v39);
    if (!v28)
      goto LABEL_30;
    UIViewControllerFromPresentable(v8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNTransitionContext viewControllerForKey:](self->_activeBannerTransitionContext, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = BSEqualObjects();

    if (!v42)
      goto LABEL_30;
    objc_msgSend((id)objc_opt_class(), "_retargetableBannerTransitionAnimatorForAnimator:", self->_activeBannerTransitionAnimator);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = 0;
      v46 = v44;
    }
    else
    {
LABEL_30:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNDefaultBannerTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:userInfo:](v68, "animationControllerForPresentedController:presentingController:sourceController:userInfo:", v25, self, self, v69);
      else
        -[BNDefaultBannerTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:](v68, "animationControllerForPresentedController:presentingController:sourceController:", v25, self, self);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, v46);
      v44 = 0;
      v45 = 1;
    }
    v64 = v44;
    objc_msgSend(v39, "transitionCoordinator");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_2;
    v80[3] = &unk_1E7044A90;
    objc_copyWeak(&v87, &location);
    v47 = v8;
    v81 = v47;
    v48 = v25;
    v82 = v48;
    v88 = v38;
    v49 = v39;
    v83 = v49;
    v61 = v65;
    v84 = v61;
    v50 = v69;
    v85 = v50;
    p_buf = &buf;
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_53;
    v74[3] = &unk_1E7044AB8;
    objc_copyWeak(&v79, &location);
    v66 = v49;
    v75 = v66;
    v63 = v46;
    v76 = v63;
    v51 = v47;
    v77 = v51;
    v62 = v48;
    v78 = v62;
    objc_msgSend(v67, "animateAlongsideTransition:completion:", v80, v74);
    v52 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v52, "presenter:willPresentPresentable:withTransitionCoordinator:userInfo:", self, v51, v67, v50, v61);
    if ((v45 & 1) != 0)
    {
      objc_msgSend(v66, "performTransitionWithAnimator:", v63);
    }
    else
    {
      v53 = (id)BNLogPresenting;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        BNEffectivePresentableDescription(v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[BNContentViewController presentPresentable:withOptions:userInfo:].cold.1(v54, (uint64_t)v95, v53);
      }

      objc_msgSend(v64, "retargetTransition:", v66);
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v55 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v71 != v57)
            objc_enumerationMutation(v55);
          v59 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          v60 = objc_loadWeakRetained(&location);
          objc_msgSend(v60, "_dismissPresentable:withReason:animated:userInfo:", v59, CFSTR("BNBannerRevocationReasonReplaceExisting"), 1, v50);

        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
      }
      while (v56);
    }

    objc_destroyWeak(&v79);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }

}

uint64_t __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((BNIsPresentableIdentifiedByIdentification(v3, *(void **)(a1 + 32), 1) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "requesterIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      v4 = objc_msgSend(*(id *)(a1 + 48), "shouldOverlapPresentable:withPresentable:", v3, *(_QWORD *)(a1 + 32));
    else
      v4 = 0;

  }
  return v4;
}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  CGFloat width;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double obj;
  id obja;
  double v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v65 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v3 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      BNEffectivePresentableDescription(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v6;
      _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", buf, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "presentableWillAppearAsBanner:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "beginAppearanceTransition:animated:", 1, *(unsigned __int8 *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 48), "finalFrameForViewController:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_insetFrame:forViewController:", *(_QWORD *)(a1 + 40));
    obj = v8;
    v51 = v7;
    v47 = v10;
    v48 = v9;
    v11 = 968;
    if ((unint64_t)objc_msgSend(WeakRetained[121], "tierCount") >= 2)
    {
      v45 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v46 = *MEMORY[0x1E0C9D648];
      v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v44 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = 1;
      do
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(WeakRetained[121], "tierAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        height = v43;
        width = v44;
        y = v45;
        x = v46;
        if (v14)
        {
          v19 = v14;
          v20 = *(_QWORD *)v58;
          height = v43;
          width = v44;
          y = v45;
          x = v46;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v58 != v20)
                objc_enumerationMutation(v13);
              UIViewControllerFromPresentable(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "view");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "frame");
              objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v22);
              v25 = v24;
              v27 = v26;
              v29 = v28;
              v31 = v30;
              v66.origin.x = x;
              v66.origin.y = y;
              v66.size.width = width;
              v66.size.height = height;
              v68.origin.x = v25;
              v68.origin.y = v27;
              v68.size.width = v29;
              v68.size.height = v31;
              v67 = CGRectUnion(v66, v68);
              x = v67.origin.x;
              y = v67.origin.y;
              width = v67.size.width;
              height = v67.size.height;
              objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContentFrame:afterContentWithFrame:", v22, v25, v27, v29, v31, v51, obj, v48, v47);
              objc_msgSend(v23, "setFrame:");

            }
            v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
          }
          while (v19);
        }

        ++v12;
        obj = y;
        v51 = x;
        v47 = height;
        v48 = width;
      }
      while (v12 < objc_msgSend(WeakRetained[121], "tierCount"));
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v32 = a1;
    obja = *(id *)(a1 + 56);
    v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v33)
    {
      v34 = v33;
      v52 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v54 != v52)
            objc_enumerationMutation(obja);
          v36 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(*(id *)((char *)WeakRetained + v11), "indexPathForObject:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "tier");
          v39 = v11;
          objc_msgSend(*(id *)((char *)WeakRetained + v11), "indexPathForObject:", *(_QWORD *)(v32 + 32));
          v40 = v32;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "tier");

          if (v38 == v42)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v40 + 72) + 8) + 40), "addObject:", v36);
          else
            objc_msgSend(WeakRetained, "_dismissPresentable:withReason:animated:userInfo:", v36, CFSTR("BNBannerRevocationReasonReplaceExisting"), 1, *(_QWORD *)(v40 + 64));
          v32 = v40;
          v11 = v39;
        }
        v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v34);
    }

    objc_msgSend(WeakRetained, "_postLayoutChangeForVisibleNotifications");
  }

}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_53(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_resetActiveBannerTransitionContextIfComplete:", *(_QWORD *)(a1 + 32)))objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(_QWORD *)(a1 + 40));
    v4 = (id *)(a1 + 48);
    if ((objc_msgSend(v3[123], "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG))
        __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_53_cold_1((uint64_t)v4, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "endAppearanceTransition");
      v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *v4;
        v8 = v6;
        BNEffectivePresentableDescription(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", (uint8_t *)&v10, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*v4, "presentableDidAppearAsBanner:", *v4);
    }
    objc_msgSend(v3[122], "removeObject:", *v4);
  }

}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    BNPresentableIdentificationDescription(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v13;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1B9628000, v12, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presentables with identification %{public}@ with reason '%{public}@'", (uint8_t *)&v16, 0x16u);

  }
  -[BNContentViewController _dismissPresentablesWithIdentification:reason:animated:userInfo:](self, "_dismissPresentablesWithIdentification:reason:animated:userInfo:", v8, v9, -[BNContentViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    BNPresentableIdentificationDescription(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v15;
    v27 = 2114;
    v28 = v11;
    v29 = 2114;
    v30 = v16;
    _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presentables with identification %{public}@ with reason '%{public}@' (animated=%{public}@)", (uint8_t *)&v25, 0x20u);

  }
  if (!v7)
    goto LABEL_8;
  if ((-[BNContentViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared") & 1) == 0)
  {
    v18 = (void *)BNLogPresenting;
    v19 = os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT);
    v17 = 0;
    if (!v19)
      goto LABEL_9;
    v20 = v18;
    NSStringFromBOOL();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    BNPresentableIdentificationDescription(v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v21;
    v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_1B9628000, v20, OS_LOG_TYPE_DEFAULT, "Overriding 'animated=%{public}@' for presentables with identification %{public}@ due to appearance state", (uint8_t *)&v25, 0x16u);

LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  v17 = 1;
LABEL_9:
  -[BNContentViewController _dismissPresentablesWithIdentification:reason:animated:userInfo:](self, "_dismissPresentablesWithIdentification:reason:animated:userInfo:", v10, v11, v17, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a6;
  UIViewControllerFromPresentable(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && (v13 = -[NSMutableSet containsObject:](self->_dismissingPresentables, "containsObject:", v16), v10)
    && (v13 & 1) == 0
    && (-[NSMutableSet containsObject:](self->_presentingPresentables, "containsObject:", v10) & 1) == 0
    && (-[BNContentViewController childViewControllers](self, "childViewControllers"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v12),
        v14,
        v15))
  {
    -[BNContentViewController _morphFromPresentable:toPresentable:withOptions:userInfo:](self, "_morphFromPresentable:toPresentable:withOptions:userInfo:", v16, v10, a5, v11);
  }
  else
  {
    -[BNContentViewController presentPresentable:withOptions:userInfo:](self, "presentPresentable:withOptions:userInfo:", v10, a5, v11);
  }

}

- (void)_morphFromPresentable:(id)a3 toPresentable:(id)a4 withOptions:(unint64_t)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  NSMutableSet *presentingPresentables;
  NSMutableSet *dismissingPresentables;
  NSMutableSet *v18;
  NSMutableSet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  BNDefaultBannerTransitioningDelegate *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id *location;
  id *locationa;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v50 = a6;
  v11 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    BNEffectivePresentableDescription(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    BNEffectivePresentableDescription(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v66 = v13;
    v67 = 2114;
    v68 = v14;
    _os_log_impl(&dword_1B9628000, v12, OS_LOG_TYPE_DEFAULT, "Asked to morph from presentable: %{public}@ to presentable  %{public}@", buf, 0x16u);

  }
  if (!self->_presentingPresentables)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    presentingPresentables = self->_presentingPresentables;
    self->_presentingPresentables = v15;

  }
  dismissingPresentables = self->_dismissingPresentables;
  if (!dismissingPresentables)
  {
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v19 = self->_dismissingPresentables;
    self->_dismissingPresentables = v18;

    dismissingPresentables = self->_dismissingPresentables;
  }
  -[NSMutableSet addObject:](dismissingPresentables, "addObject:", v9);
  -[NSMutableSet removeObject:](self->_presentingPresentables, "removeObject:", v9);
  -[NSMutableSet addObject:](self->_presentingPresentables, "addObject:", v10);
  -[NSMutableSet removeObject:](self->_dismissingPresentables, "removeObject:", v10);
  UIViewControllerFromPresentable(v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIViewControllerFromPresentable(v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transitioningDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = v22;
    goto LABEL_15;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "defaultTransitioningDelegateForPresenter:", self);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_respondsToSelector();
    v27 = (void *)v25;
    if ((v26 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    v27 = v22;
  }
  v28 = v27;
  v29 = objc_alloc_init(BNDefaultBannerTransitioningDelegate);

  v27 = v29;
LABEL_14:
  v30 = v27;
  objc_msgSend(v21, "setTransitioningDelegate:");

  v23 = v30;
LABEL_15:
  v48 = v23;
  -[BNContentViewController _addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:](self, "_addPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:", v10);
  -[BNContentViewController bs_addChildViewController:](self, "bs_addChildViewController:", v21);
  v31 = -[BNContentViewController _newBannerTransitionContextForMorphFromViewController:toViewController:animated:](self, "_newBannerTransitionContextForMorphFromViewController:toViewController:animated:", v20, v21, 1);
  objc_storeStrong((id *)&self->_activeBannerTransitionContext, v31);
  objc_msgSend(v48, "animationControllerMorphFromPresentedController:presentingController:sourceController:userInfo:", v20, v21, self, v50);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, v32);
  objc_msgSend(v31, "transitionCoordinator");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v33 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke;
  v59[3] = &unk_1E7044AB8;
  location = &v64;
  objc_copyWeak(&v64, (id *)buf);
  v34 = v10;
  v60 = v34;
  v35 = v9;
  v61 = v35;
  v36 = v20;
  v62 = v36;
  v37 = v21;
  v63 = v37;
  v51[0] = v33;
  v51[1] = 3221225472;
  v51[2] = __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke_64;
  v51[3] = &unk_1E7044AE0;
  objc_copyWeak(&v58, (id *)buf);
  v38 = v31;
  v52 = v38;
  v39 = v32;
  v53 = v39;
  v40 = v34;
  v54 = v40;
  v41 = v37;
  v55 = v41;
  v42 = v35;
  v56 = v42;
  v43 = v36;
  v57 = v43;
  objc_msgSend(v49, "animateAlongsideTransition:completion:", v59, v51);
  v44 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v44, "presenter:willPresentPresentable:withTransitionCoordinator:userInfo:", self, v40, v49, v50, &v64);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v38, "transitionCoordinator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "presenter:willDismissPresentable:withTransitionCoordinator:userInfo:", self, v42, v45, v50);

  }
  objc_msgSend(v38, "performTransitionWithAnimator:", v39, location);

  objc_destroyWeak(&v58);
  objc_destroyWeak(locationa);
  objc_destroyWeak((id *)buf);

}

void __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v3 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v5 = v3;
      BNEffectivePresentableDescription(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a1[4], "presentableWillAppearAsBanner:", a1[4]);
    v7 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = v7;
      BNEffectivePresentableDescription(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a1[5], "presentableWillDisappearAsBanner:withReason:", a1[5], CFSTR("swap"));
    objc_msgSend(a1[6], "beginAppearanceTransition:animated:", 0, 1);
    objc_msgSend(a1[7], "beginAppearanceTransition:animated:", 1, 1);
    objc_msgSend(WeakRetained, "_postLayoutChangeForVisibleNotifications");
  }

}

void __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke_64(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_resetActiveBannerTransitionContextIfComplete:", *(_QWORD *)(a1 + 32)))objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(_QWORD *)(a1 + 40));
    v4 = (id *)(a1 + 48);
    if ((objc_msgSend(v3[123], "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG))
        __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_53_cold_1(a1 + 48, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "endAppearanceTransition");
      v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *v4;
        v8 = v6;
        BNEffectivePresentableDescription(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v9;
        _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*v4, "presentableDidAppearAsBanner:", *v4);
    }
    objc_msgSend(v3[122], "removeObject:", *(_QWORD *)(a1 + 48));
    v10 = (id *)(a1 + 64);
    if ((objc_msgSend(v3[122], "containsObject:", *(_QWORD *)(a1 + 64)) & 1) != 0)
    {
      v11 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG))
        __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke_64_cold_1((uint64_t)v10, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "endAppearanceTransition");
      v12 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *v10;
        v14 = v12;
        BNEffectivePresentableDescription(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*v10, "presentableDidDisappearAsBanner:withReason:", *v10, CFSTR("BNBannerRevocationReasonMorph"));
      objc_msgSend(v3, "bs_removeChildViewController:", *(_QWORD *)(a1 + 72));
      objc_msgSend(v3, "_removePresentable:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v3, "_resetPresentableForActiveGesture:", *(_QWORD *)(a1 + 64));
    }
    objc_msgSend(v3[123], "removeObject:", *v10);
  }

}

- (void)preferredMinimumTopInsetDidInvalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[BNContentViewController _topPresentable](self, "_topPresentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIViewControllerFromPresentable(v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BNContentViewController transitionCoordinator](self, "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAnimated"))
    {

    }
    else
    {
      -[BNContentViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_bn_isRotating");

      if ((v7 & 1) == 0)
        -[BNContentViewController _updateFrameForChildContentContainer:minimumTopInsetUpdate:](self, "_updateFrameForChildContentContainer:minimumTopInsetUpdate:", v8, 1);
    }
  }

}

- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  UIViewControllerFromPresentable(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitioningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "sizeTransitionAnimationSettingsForPresentable:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "userInterfaceStyleTransitionAnimationSettingsForPresentable:forTransitionToStyle:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldFenceAnimationsForPresentable:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "shouldFenceAnimationsForPresentable:", v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BNPresentable *presentableForActiveGesture;
  NSObject *v11;
  void *v12;
  BNPresentable *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[BNContentViewController _presentableForTouch:](self, "_presentableForTouch:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeStrong((id *)&self->_presentableForActiveGesture, v5);
    -[BNContentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIViewControllerFromPresentable(self->_presentableForActiveGesture);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v8);

    v9 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      presentableForActiveGesture = self->_presentableForActiveGesture;
      v11 = v9;
      BNEffectivePresentableDescription(presentableForActiveGesture);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "Updated presentable for active gesture: %{public}@ ", buf, 0xCu);

    }
  }
  v13 = self->_presentableForActiveGesture;
  if (!v13)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[BNContentViewController topPresentables](self, "topPresentables", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[BNContentViewController _isTouchOutsideDismissalEnabledForPresentable:](self, "_isTouchOutsideDismissalEnabledForPresentable:", v19))
          {
            -[BNContentViewController _dismissPresentable:withReason:animated:userInfo:](self, "_dismissPresentable:withReason:animated:userInfo:", v19, CFSTR("BNBannerRevocationReasonTouchOutsideDismissal"), 1, 0);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    v13 = self->_presentableForActiveGesture;
  }
  v20 = v13 != 0;

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v5;
  void *v6;
  void **p_presentableForActiveGesture;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "type") == 10)
  {
    -[BNContentViewController _presentableForScrollEvent:](self, "_presentableForScrollEvent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      p_presentableForActiveGesture = (void **)&self->_presentableForActiveGesture;
      objc_storeStrong((id *)&self->_presentableForActiveGesture, v6);
      -[BNContentViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      UIViewControllerFromPresentable(*p_presentableForActiveGesture);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bringSubviewToFront:", v10);

      v11 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_presentableForActiveGesture;
        v13 = v11;
        BNEffectivePresentableDescription(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "Updated presentable on scroll event for active gesture: %{public}@ ", (uint8_t *)&v16, 0xCu);

      }
    }

  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BNPresentable *presentableForActiveGesture;
  char v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  presentableForActiveGesture = self->_presentableForActiveGesture;
  if (presentableForActiveGesture)
    v6 = -[NSMutableSet containsObject:](self->_dismissingPresentables, "containsObject:", self->_presentableForActiveGesture);
  else
    v6 = 0;
  if (presentableForActiveGesture)
    v7 = v6 ^ 1;
  else
    v7 = 0;
  v8 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Banner gesture should begin: %{public}@ (presentableForActiveGestureExists=%{public}@, presentableForActiveGestureIsDismissing=%{public}@", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (-[BNContentViewController _isLocalDraggingEnabledForPresentable:](self, "_isLocalDraggingEnabledForPresentable:", self->_presentableForActiveGesture))
  {
    -[BNContentViewController _resetPresentableForActiveGesture:](self, "_resetPresentableForActiveGesture:", self->_presentableForActiveGesture);
  }
}

- (CGPoint)gestureRecognizerProxy:(id)a3 locationForTouch:(id)a4 inCoordinateSpace:(id)a5
{
  id v7;
  id v8;
  void *v9;
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
  CGPoint result;

  v7 = a5;
  v8 = a4;
  -[BNContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNContentViewController _locationOfTouch:inContainerViewForGesture:](self, "_locationOfTouch:inContainerViewForGesture:", v8, self->_panGesture);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v7, v11, v13);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 velocityInCoordinateSpace:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a4;
  -[BNContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNContentViewController _velocityInContainerViewForGesture:](self, "_velocityInContainerViewForGesture:", self->_panGesture);
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 translationInCoordinateSpace:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a4;
  -[BNContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNContentViewController _translationInContainerViewForGesture:](self, "_translationInContainerViewForGesture:", self->_panGesture);
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)gestureRecognizerProxy:(id)a3 visualTranslationInCoordinateSpace:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a4;
  -[BNContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNContentViewController _translationInContainerViewForGesture:](self, "_translationInContainerViewForGesture:", self->_panGesture);
  _RubberBandedTranslationInContainerView(v6);
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (id)_retargetableBannerTransitionAnimatorForAnimator:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "isRetargetable"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)_layoutManager
{
  BNLayoutManaging *layoutManager;
  BNBannerLayoutManager *v4;
  BNLayoutManaging *v5;

  layoutManager = self->_layoutManager;
  if (!layoutManager)
  {
    v4 = objc_alloc_init(BNBannerLayoutManager);
    v5 = self->_layoutManager;
    self->_layoutManager = (BNLayoutManaging *)v4;

    layoutManager = self->_layoutManager;
  }
  return layoutManager;
}

- (BOOL)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  BNConsidering *authority;

  authority = self->_authority;
  return !authority
      || -[BNConsidering shouldOverlapPresentable:withPresentable:](authority, "shouldOverlapPresentable:withPresentable:", a3, a4) == 1;
}

- (BOOL)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = (objc_opt_respondsToSelector() & 1) == 0
    || -[BNConsidering shouldNewTierBeAddedToTopForPresentable:withPresentable:](self->_authority, "shouldNewTierBeAddedToTopForPresentable:withPresentable:", v6, v7) == 1;

  return v8;
}

- (BOOL)_isPresentableNotice:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "presentableBehavior") == 1;

  return v4;
}

- (CGRect)_insetFrame:(CGRect)a3 forViewController:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a4, "bannerContentOutsets");
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_outsetFrame:(CGRect)a3 forViewController:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a4, "bannerContentOutsets");
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_presentedFrame:(BOOL)a3 forViewController:(id)a4 withContainerBounds:(CGRect)a5 overshoot:(BOOL)a6 targetTransform:(CGAffineTransform *)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v13;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  id WeakRetained;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat MinY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  CGAffineTransform v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect result;
  CGRect v101;

  v8 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v15 = a4;
  -[BNContentViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_OWORD *)&a7->c;
  *(_OWORD *)&v96.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&v96.c = v18;
  *(_OWORD *)&v96.tx = *(_OWORD *)&a7->tx;
  if (CGAffineTransformIsIdentity(&v96))
    v19 = objc_msgSend(v17, "interfaceOrientation");
  else
    v19 = objc_msgSend(v17, "_toWindowOrientation");
  v20 = v19;
  -[BNContentViewController _layoutManager](self, "_layoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "useableContainerFrameInContainerBounds:onScreen:interfaceOrientation:", v22, v20, x, y, width, height);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v93 = width;
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "preferredContentSize");
    v90 = height;
    v33 = v32;
    v97.origin.x = v24;
    v97.origin.y = v26;
    v97.size.width = v28;
    v97.size.height = v30;
    v34 = v30;
    v35 = x;
    v36 = y;
    v37 = CGRectGetHeight(v97) - v33;
    objc_msgSend(WeakRetained, "presenterMinimumPreferredTopEdgeInset:", self);
    v39 = v38;
    v98.origin.x = v24;
    v98.origin.y = v26;
    v98.size.width = v28;
    v98.size.height = v34;
    MinY = CGRectGetMinY(v98);
    v41 = fmax(v37 - MinY, 0.0);
    v42 = v39 - MinY;
    v43 = v90;
    v44 = v93;
    v45 = fmax(v42, 0.0);
    if (v45 >= v41)
      v45 = v41;
    v94 = v24 + 0.0;
    v95 = v26 + v45;
    v46 = v34 - v45;
  }
  else
  {
    v47 = y;
    v44 = width;
    v43 = height;
    v46 = v30;
    v35 = x;
    v36 = v47;
    v94 = v24;
    v95 = v26;
  }
  objc_msgSend(v17, "traitCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "displayScale");
  v50 = v49;

  v92 = v35;
  objc_msgSend(v21, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v28, v46, v94, v95, v28, v46, *(_QWORD *)&v35, *(_QWORD *)&v36, *(_QWORD *)&v44, *(_QWORD *)&v43, v50);
  objc_msgSend(v15, "preferredContentSizeWithPresentationSize:containerSize:", v51, v52, v44, v43);
  v55 = v43;
  v56 = v53;
  v57 = v54;
  if (v13)
  {
    v58 = v55;
    v91 = v55;
    -[BNContentViewController layoutManager](self, "layoutManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v56, v57, v94, v95, v28, v46, *(_QWORD *)&v92, *(_QWORD *)&v36, *(_QWORD *)&v44, *(_QWORD *)&v58, v50);
    v60 = v92;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v69 = v91;
  }
  else
  {
    v88 = v53;
    v89 = v54;
    v69 = v55;
    -[BNContentViewController _layoutManager](self, "_layoutManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dismissedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:overshoot:scale:", v8, v88, v89, v94, v95, v28, v46, *(_QWORD *)&v92, *(_QWORD *)&v36, *(_QWORD *)&v44, *(_QWORD *)&v69, v50);
    v60 = v92;
    v62 = v70;
    v64 = v71;
    v66 = v72;
    v68 = v73;
  }
  v74 = v36;
  v75 = v60;

  v99.origin.x = v62;
  v99.origin.y = v64;
  v99.size.width = v66;
  v99.size.height = v68;
  v101.origin.x = v75;
  v101.origin.y = v74;
  v101.size.width = v93;
  v101.size.height = v69;
  if (!CGRectEqualToRect(v99, v101))
    -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v15, v62, v64, v66, v68);
  UIRectIntegralWithScale();
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;

  v84 = v77;
  v85 = v79;
  v86 = v81;
  v87 = v83;
  result.size.height = v87;
  result.size.width = v86;
  result.origin.y = v85;
  result.origin.x = v84;
  return result;
}

- (CGRect)_dismissedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD v9[3];
  CGRect result;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 0, a3, 0, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v10[3];
  CGRect result;

  v5 = *(_OWORD *)&a5->c;
  v10[0] = *(_OWORD *)&a5->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a5->tx;
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 0, a3, 1, v10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_dismissedFrameWithPaddingForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD v9[3];
  CGRect result;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:targetTransform:", a3, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4 targetTransform:(CGAffineTransform *)a5
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _OWORD v10[3];
  CGRect result;

  v5 = *(_OWORD *)&a5->c;
  v10[0] = *(_OWORD *)&a5->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a5->tx;
  -[BNContentViewController _presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:](self, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 1, a3, 0, v10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContainerBounds:(CGRect)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD v9[3];
  CGRect result;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v4;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:targetTransform:](self, "_presentedFrameForViewController:withContainerBounds:targetTransform:", a3, v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)_effectTierForPresentable:(id)a3
{
  void *v4;
  int64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[BNTieredArray indexPathForObject:](self->_presentables, "indexPathForObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tier");

  if ((unint64_t)(v5 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    v6 = v5 + 1;
    do
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      -[BNTieredArray tierAtIndex:](self->_presentables, "tierAtIndex:", v6 - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isSubsetOfSet:", self->_dismissingPresentables);

      if (v10)
        v5 = v6 - 2;
      --v6;
    }
    while (v6 > 1);
  }
  return v5;
}

- (CGRect)_presentedFrameForPresentable:(id)a3 withContainerBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  UIViewControllerFromPresentable(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = width;
  v71 = height;
  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[BNContentViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;

  if (v21 != v16 || v23 != v18)
  {
    v25 = -[BNContentViewController _effectTierForPresentable:](self, "_effectTierForPresentable:", v9);
    v26 = v25 - 1;
    if (v25 >= 1)
    {
      -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v10, v12, v14, v16, v18);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      -[BNTieredArray topObjectInTier:](self->_presentables, "topObjectInTier:", v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", v35, x, y, v70, v71);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      UIViewControllerFromPresentable(v35);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v44, v37, v39, v41, v43);
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;

      -[BNContentViewController layoutManager](self, "layoutManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "presentedFrameForContentWithFrame:afterContentWithFrame:", v28, v30, v32, v34, v46, v48, v50, v52);
      v55 = v54;
      v57 = v56;
      v59 = v58;
      v61 = v60;

      -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v10, v55, v57, v59, v61);
      v12 = v62;
      v14 = v63;
      v16 = v64;
      v18 = v65;

    }
  }

  v66 = v12;
  v67 = v14;
  v68 = v16;
  v69 = v18;
  result.size.height = v69;
  result.size.width = v68;
  result.origin.y = v67;
  result.origin.x = v66;
  return result;
}

- (CGRect)_presentedFrameForViewController:(id)a3 withContentFrame:(CGRect)a4 afterContentWithFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  -[BNContentViewController _layoutManager](self, "_layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedFrameForContentWithFrame:afterContentWithFrame:", v12, v11, v10, v9, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[BNContentViewController _outsetFrame:forViewController:](self, "_outsetFrame:forViewController:", v14, v17, v19, v21, v23);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (id)_newBannerTransitionContextForPresenting:(BOOL)a3 viewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  v9 = v8;
  if (v6)
    v10 = 0;
  else
    v10 = v8;
  if (v6)
    v11 = v8;
  else
    v11 = 0;
  -[BNContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BNTransitionContext transitionContextForTransitionFromViewController:toViewController:inContainerView:](BNTransitionContext, "transitionContextForTransitionFromViewController:toViewController:inContainerView:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAnimated:", v5);
  -[BNContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (v6)
  {
    -[BNContentViewController _dismissedFrameForViewController:withContainerBounds:](self, "_dismissedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setToStartFrame:");
    -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setToEndFrame:");
  }
  else
  {
    -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setFromStartFrame:");
    -[BNContentViewController _dismissedFrameWithPaddingForViewController:withContainerBounds:](self, "_dismissedFrameWithPaddingForViewController:withContainerBounds:", v9, v16, v18, v20, v22);
    objc_msgSend(v13, "setFromEndFrame:");
  }

  return v13;
}

- (id)_newBannerTransitionContextForMorphFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[BNContentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BNTransitionContext transitionContextForTransitionFromViewController:toViewController:inContainerView:](BNTransitionContext, "transitionContextForTransitionFromViewController:toViewController:inContainerView:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAnimated:", v5);
  -[BNContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v9, v14, v16, v18, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[BNContentViewController _presentedFrameForViewController:withContainerBounds:](self, "_presentedFrameForViewController:withContainerBounds:", v8, v14, v16, v18, v20);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v11, "setToStartFrame:", v22, v24, v26, v28);
  objc_msgSend(v11, "setToEndFrame:", v30, v32, v34, v36);
  objc_msgSend(v11, "setFromStartFrame:", v22, v24, v26, v28);
  objc_msgSend(v11, "setFromEndFrame:", v30, v32, v34, v36);
  objc_msgSend(v11, "setRevocationReason:", CFSTR("BNBannerRevocationReasonMorph"));
  return v11;
}

- (BOOL)_resetActiveBannerTransitionAnimator:(id)a3
{
  UIViewControllerAnimatedTransitioning *v4;
  UIViewControllerAnimatedTransitioning *v5;
  UIViewControllerAnimatedTransitioning *activeBannerTransitionAnimator;

  v4 = (UIViewControllerAnimatedTransitioning *)a3;
  v5 = v4;
  activeBannerTransitionAnimator = self->_activeBannerTransitionAnimator;
  if (activeBannerTransitionAnimator == v4)
  {
    self->_activeBannerTransitionAnimator = 0;

  }
  return activeBannerTransitionAnimator == v5;
}

- (BOOL)_resetActiveBannerTransitionContextIfComplete:(id)a3
{
  int v3;
  BNTransitionContext *activeBannerTransitionContext;

  if (self->_activeBannerTransitionContext == a3)
  {
    v3 = objc_msgSend(a3, "isComplete");
    if (v3)
    {
      activeBannerTransitionContext = self->_activeBannerTransitionContext;
      self->_activeBannerTransitionContext = 0;

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5 incrementingTier:(BOOL)a6 addTierToTop:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  BNTieredArray *v14;
  BNTieredArray *presentables;
  NSMutableSet *transitioningDelegates;
  NSMutableSet *v17;
  NSMutableSet *v18;
  id WeakRetained;
  BNTieredArray *v20;
  id v21;

  v7 = a7;
  v8 = a6;
  v21 = a3;
  v12 = a4;
  v13 = a5;
  if (v21)
  {
    if (!self->_presentables)
    {
      v14 = objc_alloc_init(BNTieredArray);
      presentables = self->_presentables;
      self->_presentables = v14;

    }
    if (v13)
    {
      transitioningDelegates = self->_transitioningDelegates;
      if (!transitioningDelegates)
      {
        v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v18 = self->_transitioningDelegates;
        self->_transitioningDelegates = v17;

        transitioningDelegates = self->_transitioningDelegates;
      }
      -[NSMutableSet addObject:](transitioningDelegates, "addObject:", v13);
    }
    if (!-[BNTieredArray count](self->_presentables, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "presenterRequestsVisibility:", self);

    }
    v20 = self->_presentables;
    if (v12)
      -[BNTieredArray insertObject:beneathObject:](v20, "insertObject:beneathObject:", v21, v12);
    else
      -[BNTieredArray addObject:incrementingTier:addTierToTop:](v20, "addObject:incrementingTier:addTierToTop:", v21, v8, v7);
  }

}

- (void)_addPresentable:(id)a3 withTransitioningDelegate:(id)a4 incrementingTier:(BOOL)a5 addTierToTop:(BOOL)a6
{
  -[BNContentViewController _insertPresentable:beneathPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:](self, "_insertPresentable:beneathPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:", a3, 0, a4, a5, a6);
}

- (void)_insertPresentable:(id)a3 beneathPresentable:(id)a4 withTransitioningDelegate:(id)a5
{
  -[BNContentViewController _insertPresentable:beneathPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:](self, "_insertPresentable:beneathPresentable:withTransitioningDelegate:incrementingTier:addTierToTop:", a3, a4, a5, 0, 1);
}

- (void)_removePresentable:(id)a3
{
  BNTieredArray *presentables;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  if (a3)
  {
    presentables = self->_presentables;
    v5 = a3;
    -[BNTieredArray removeObject:](presentables, "removeObject:", v5);
    UIViewControllerFromPresentable(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "transitioningDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NSMutableSet removeObject:](self->_transitioningDelegates, "removeObject:", v8);
    if (!-[BNTieredArray count](self->_presentables, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "presenterRelinquishesVisibility:", self);

    }
  }
}

- (void)_dismissPresentable:(id)a3 withReason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  NSMutableSet *dismissingPresentables;
  NSMutableSet *v20;
  NSMutableSet *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id WeakRetained;
  void *v41;
  NSObject *v42;
  void *v43;
  id *v44;
  id *v45;
  char v46;
  void *v47;
  void *v48;
  id obj;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  BNContentViewController *v62;
  id v63;
  BOOL v64;
  id location;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const __CFString *v71;
  uint64_t v72;

  v7 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10 && (-[NSMutableSet containsObject:](self->_dismissingPresentables, "containsObject:", v10) & 1) == 0)
  {
    UIViewControllerFromPresentable(v10);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNContentViewController childViewControllers](self, "childViewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v50);

    if (v14)
    {
      v15 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        BNEffectivePresentableDescription(v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("without");
        *(_DWORD *)buf = 138543874;
        v67 = v17;
        v68 = 2114;
        if (v7)
          v18 = CFSTR("with");
        v69 = v11;
        v70 = 2114;
        v71 = v18;
        _os_log_impl(&dword_1B9628000, v16, OS_LOG_TYPE_DEFAULT, "Dismissing presentable %{public}@ with reason '%{public}@' %{public}@ animation ", buf, 0x20u);

      }
      dismissingPresentables = self->_dismissingPresentables;
      if (!dismissingPresentables)
      {
        v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v21 = self->_dismissingPresentables;
        self->_dismissingPresentables = v20;

        dismissingPresentables = self->_dismissingPresentables;
      }
      -[NSMutableSet addObject:](dismissingPresentables, "addObject:", v10);
      -[NSMutableSet removeObject:](self->_presentingPresentables, "removeObject:", v10);
      -[BNContentViewController _presentablesWithIdentification:requiringUniqueMatch:](self, "_presentablesWithIdentification:requiringUniqueMatch:", v10, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count") == 0;

      obj = -[BNContentViewController _newBannerTransitionContextForPresenting:viewController:animated:](self, "_newBannerTransitionContextForPresenting:viewController:animated:", 0, v50, v7);
      objc_storeStrong((id *)&self->_activeBannerTransitionContext, obj);
      objc_msgSend(obj, "setRevocationReason:", v11);
      if (v23)
        goto LABEL_14;
      UIViewControllerFromPresentable(v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNTransitionContext viewControllerForKey:](self->_activeBannerTransitionContext, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = BSEqualObjects();

      if (!v26)
        goto LABEL_14;
      objc_msgSend((id)objc_opt_class(), "_retargetableBannerTransitionAnimatorForAnimator:", self->_activeBannerTransitionAnimator);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v46 = 0;
        v47 = v28;
        v29 = v28;
      }
      else
      {
LABEL_14:
        objc_msgSend(v50, "transitioningDelegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("BNBannerRevocationReasonReplaceExisting")))
          {
            if (v12)
              v31 = (id)objc_msgSend(v12, "mutableCopy");
            else
              v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v32 = v31;
            objc_msgSend(v31, "setObject:forKey:", &unk_1E70579D8, CFSTR("BNBannerTransitionAnimationStyle"));

          }
          else
          {
            v32 = v12;
          }
          objc_msgSend(v30, "animationControllerForDismissedController:userInfo:", v50, v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v30, "animationControllerForDismissedController:", v50);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v12;
        }
        objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, v29);

        v47 = 0;
        v46 = 1;
        v12 = v32;
      }
      objc_msgSend(obj, "transitionCoordinator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v33 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke;
      v58[3] = &unk_1E7044B08;
      v34 = v10;
      v59 = v34;
      v35 = v11;
      v60 = v35;
      v36 = v50;
      v61 = v36;
      v64 = v7;
      v44 = &v63;
      objc_copyWeak(&v63, &location);
      v62 = self;
      v51[0] = v33;
      v51[1] = 3221225472;
      v51[2] = __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke_96;
      v51[3] = &unk_1E7044B30;
      v45 = &v57;
      objc_copyWeak(&v57, &location);
      v37 = obj;
      v52 = v37;
      v38 = v29;
      v53 = v38;
      v39 = v34;
      v54 = v39;
      v55 = v36;
      v56 = v35;
      objc_msgSend(v48, "animateAlongsideTransition:completion:", v58, v51);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v37, "transitionCoordinator", &v63, &v57);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "presenter:willDismissPresentable:withTransitionCoordinator:userInfo:", self, v39, v41, v12);

      }
      if ((v46 & 1) != 0)
      {
        objc_msgSend(v37, "performTransitionWithAnimator:", v38);
      }
      else
      {
        v42 = (id)BNLogPresenting;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          BNEffectivePresentableDescription(v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[BNContentViewController _dismissPresentable:withReason:animated:userInfo:].cold.1(v43, (uint64_t)buf, v42);
        }

        objc_msgSend(v47, "retargetTransition:", v37);
      }

      objc_destroyWeak(v45);
      objc_destroyWeak(v44);

      objc_destroyWeak(&location);
    }

  }
}

void __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id *WeakRetained;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  unint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v69 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v3 = (void *)BNLogPresenting;
  if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    BNEffectivePresentableDescription(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v45);
  objc_msgSend(*(id *)(a1 + 48), "beginAppearanceTransition:animated:", 0, *(unsigned __int8 *)(a1 + 72), v45);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained[121], "indexPathForObject:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tier");

  objc_msgSend(*(id *)(a1 + 56), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v53 = v12;
  v54 = v11;
  v51 = v14;
  v52 = v13;

  if (v9 < objc_msgSend(WeakRetained[121], "tierCount"))
  {
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v50 = *MEMORY[0x1E0C9D648];
    x = *MEMORY[0x1E0C9D648];
    y = v49;
    v47 = height;
    v48 = width;
    for (i = v9; i < objc_msgSend(WeakRetained[121], "tierCount"); ++i)
    {
      v55 = height;
      v56 = width;
      v57 = y;
      v58 = x;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(WeakRetained[121], "tierAtIndex:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      height = v47;
      width = v48;
      y = v49;
      x = v50;
      if (!v21)
        goto LABEL_23;
      v22 = v21;
      v23 = *(_QWORD *)v62;
      height = v47;
      width = v48;
      y = v49;
      x = v50;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          if (v25 != *(void **)(a1 + 32))
          {
            UIViewControllerFromPresentable(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "bs_isAppearingOrAppeared"))
            {
              v59 = width;
              v60 = height;
              objc_msgSend(v26, "view");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "frame");
              v29 = v28;
              v31 = v30;
              v33 = v32;
              v35 = v34;
              v70.origin.x = v58;
              v70.origin.y = v57;
              v70.size.width = v56;
              v70.size.height = v55;
              if (CGRectIsEmpty(v70))
              {
                if (i != v9)
                {
                  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
                  *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
                  v66 = v36;
                  v67 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
                  objc_msgSend(WeakRetained, "_presentedFrame:forViewController:withContainerBounds:overshoot:targetTransform:", 1, v26, 0, buf, v54, v53, v52, v51);
                  goto LABEL_18;
                }
              }
              else
              {
                objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v26, v29, v31, v33, v35);
                objc_msgSend(WeakRetained, "_presentedFrameForViewController:withContentFrame:afterContentWithFrame:", v26);
LABEL_18:
                v29 = v37;
                v31 = v38;
                v33 = v39;
                v35 = v40;
              }
              objc_msgSend(v27, "setFrame:", v29, v31, v33, v35);
              objc_msgSend(WeakRetained, "_insetFrame:forViewController:", v26, v29, v31, v33, v35);
              v73.origin.x = v41;
              v73.origin.y = v42;
              v73.size.width = v43;
              v73.size.height = v44;
              v71.origin.x = x;
              v71.origin.y = y;
              v71.size.width = v59;
              v71.size.height = v60;
              v72 = CGRectUnion(v71, v73);
              x = v72.origin.x;
              y = v72.origin.y;
              width = v72.size.width;
              height = v72.size.height;

            }
            continue;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v22);
LABEL_23:

    }
  }
  objc_msgSend(WeakRetained, "_postLayoutChangeForVisibleNotifications");

}

void __76__BNContentViewController__dismissPresentable_withReason_animated_userInfo___block_invoke_96(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_resetActiveBannerTransitionContextIfComplete:", *(_QWORD *)(a1 + 32)))objc_msgSend(v3, "_resetActiveBannerTransitionAnimator:", *(_QWORD *)(a1 + 40));
    v4 = (_QWORD *)(a1 + 48);
    if ((objc_msgSend(v3[122], "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v5 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEBUG))
        __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke_64_cold_1((uint64_t)v4, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "endAppearanceTransition");
      v6 = (void *)BNLogPresenting;
      if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)*v4;
        v8 = v6;
        BNEffectivePresentableDescription(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@", (uint8_t *)&v11, 0xCu);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 48), "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 56), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 56), "willMoveToParentViewController:", 0);
      objc_msgSend(*(id *)(a1 + 56), "removeFromParentViewController");
      objc_msgSend(v3, "_removePresentable:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v3, "_resetPresentableForActiveGesture:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(v3[123], "removeObject:", *v4);
  }

}

- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  id v6;
  BNTieredArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_presentables;
  v8 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (BNIsPresentableIdentifiedByIdentification(v13, v6, a4))
        {
          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v10, "addObject:", v13, (_QWORD)v15);
        }
      }
      v9 = -[BNTieredArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dismissPresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v7 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  -[BNContentViewController _presentablesWithIdentification:requiringUniqueMatch:](self, "_presentablesWithIdentification:requiringUniqueMatch:", a3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[BNContentViewController _dismissPresentable:withReason:animated:userInfo:](self, "_dismissPresentable:withReason:animated:userInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), v10, v7, v11);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  return v12;
}

- (BOOL)_isDraggingDismissalEnabledForPresentable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isDraggingDismissalEnabled");
  else
    v4 = 1;

  return v4;
}

- (BOOL)_isDraggingInteractionEnabledForPresentable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isDraggingInteractionEnabled");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isDraggingEnabledForPresentable:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[BNContentViewController _isDraggingDismissalEnabledForPresentable:](self, "_isDraggingDismissalEnabledForPresentable:", v4)|| -[BNContentViewController _isDraggingInteractionEnabledForPresentable:](self, "_isDraggingInteractionEnabledForPresentable:", v4);

  return v5;
}

- (BOOL)_isLocalDraggingEnabledForPresentable:(id)a3
{
  BOOL v3;
  CGRect *p_presentedFrameForPresentableForActiveGesture;
  void *v5;
  double v6;
  double v7;

  if (self->_presentableForActiveGesture != a3)
    return 1;
  p_presentedFrameForPresentableForActiveGesture = &self->_presentedFrameForPresentableForActiveGesture;
  -[BNContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v3 = p_presentedFrameForPresentableForActiveGesture->size.height != v7
    || p_presentedFrameForPresentableForActiveGesture->size.width != v6;

  return v3;
}

- (BOOL)_isTouchOutsideDismissalEnabledForPresentable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isTouchOutsideDismissalEnabled");
  else
    v4 = 0;

  return v4;
}

- (CGPoint)_locationOfTouch:(id)a3 inContainerViewForGesture:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BNContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presenter:gestureRecognizer:locationForTouch:inView:", self, v7, v6, v9);
  }
  else
  {
    if (v6)
      v12 = v6;
    else
      v12 = v7;
    objc_msgSend(v12, "locationInView:", v9);
  }
  v13 = v10;
  v14 = v11;

  v15 = v13;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)_locationOfScrollEvent:(id)a3 inContainerViewForGesture:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BNContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presenter:gestureRecognizer:locationForEvent:inView:", self, v6, v7, v9);
  else
    objc_msgSend(v7, "locationInView:", v9);
  v12 = v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)_topPresentable
{
  return -[BNTieredArray topObject](self->_presentables, "topObject");
}

- (id)_presentableForGestureInView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[BNContentViewController topPresentables](self, "topPresentables", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        UIViewControllerFromPresentable(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isDescendantOfView:", v11);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_presentableForTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  -[BNContentViewController _locationOfTouch:inContainerViewForGesture:](self, "_locationOfTouch:inContainerViewForGesture:", a3, self->_panGesture);
  v5 = v4;
  v7 = v6;
  -[BNContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", 0, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BNContentViewController _presentableForGestureInView:](self, "_presentableForGestureInView:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_presentableForScrollEvent:(id)a3
{
  UIPanGestureRecognizer *panGesture;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  panGesture = self->_panGesture;
  v5 = a3;
  -[BNContentViewController _locationOfScrollEvent:inContainerViewForGesture:](self, "_locationOfScrollEvent:inContainerViewForGesture:", v5, panGesture);
  v7 = v6;
  v9 = v8;
  -[BNContentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hitTest:withEvent:", v5, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BNContentViewController _presentableForGestureInView:](self, "_presentableForGestureInView:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_resetPresentableForActiveGesture:(id)a3
{
  BNPresentable *v4;
  BNPresentable *v5;
  BNPresentable *presentableForActiveGesture;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BNPresentable *v11;
  CGSize v12;
  BNPanGestureProxyPrivate *panGestureProxyForActivePresentable;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (BNPresentable *)a3;
  v5 = v4;
  presentableForActiveGesture = self->_presentableForActiveGesture;
  if (presentableForActiveGesture)
    v7 = presentableForActiveGesture == v4;
  else
    v7 = 0;
  if (v7)
  {
    v8 = (void *)BNLogPresenting;
    if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      BNEffectivePresentableDescription(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Resetting presentable for active gesture: %{public}@ ", (uint8_t *)&v14, 0xCu);

    }
    -[UIPanGestureRecognizer setEnabled:](self->_panGesture, "setEnabled:", 0);
    -[UIPanGestureRecognizer setEnabled:](self->_panGesture, "setEnabled:", 1);
    v11 = self->_presentableForActiveGesture;
    self->_presentableForActiveGesture = 0;

    v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_presentedFrameForPresentableForActiveGesture.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_presentedFrameForPresentableForActiveGesture.size = v12;
    panGestureProxyForActivePresentable = self->_panGestureProxyForActivePresentable;
    self->_panGestureProxyForActivePresentable = 0;

  }
}

- (CGPoint)_translationInContainerViewForGesture:(id)a3
{
  BNPresentingDelegate **p_delegate;
  id v5;
  id WeakRetained;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();
  -[BNContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
    objc_msgSend(WeakRetained, "presenter:gestureRecognizer:translationInView:", self, v5, v8);
  else
    objc_msgSend(v5, "translationInView:", v8);
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_velocityInContainerViewForGesture:(id)a3
{
  BNPresentingDelegate **p_delegate;
  id v5;
  id WeakRetained;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();
  -[BNContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
    objc_msgSend(WeakRetained, "presenter:gestureRecognizer:velocityInView:", self, v5, v8);
  else
    objc_msgSend(v5, "velocityInView:", v8);
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_handlePan:(id)a3
{
  id v5;
  BNPresentable *presentableForActiveGesture;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BNPanGestureLocalProxy *v12;
  UIPanGestureRecognizer *panGesture;
  void *v14;
  BNPanGestureProxyPrivate *v15;
  BNPanGestureProxyPrivate *panGestureProxyForActivePresentable;
  CGFloat x;
  double y;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  BNPresentable **p_presentableForActiveGesture;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  id WeakRetained;
  char v34;
  void *v35;
  id *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  CGSize v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  CGPoint v48;
  CGSize v49;
  id location;
  CGPoint size;
  CGSize v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  BNContentViewController *v57;
  CGFloat v58;
  double v59;
  CGPoint v60;

  v5 = a3;
  switch(objc_msgSend(v5, "state"))
  {
    case 1:
      presentableForActiveGesture = self->_presentableForActiveGesture;
      if (!presentableForActiveGesture)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNContentViewController.m"), 1134, CFSTR("Pan gesture began, but there's no presentable associated with the gesture."));

        presentableForActiveGesture = self->_presentableForActiveGesture;
      }
      -[BNContentViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      -[BNContentViewController _presentedFrameForPresentable:withContainerBounds:](self, "_presentedFrameForPresentable:withContainerBounds:", presentableForActiveGesture);
      self->_presentedFrameForPresentableForActiveGesture.origin.x = v8;
      self->_presentedFrameForPresentableForActiveGesture.origin.y = v9;
      self->_presentedFrameForPresentableForActiveGesture.size.width = v10;
      self->_presentedFrameForPresentableForActiveGesture.size.height = v11;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable userInteractionWillBeginForBannerForPresentable:](self->_presentableForActiveGesture, "userInteractionWillBeginForBannerForPresentable:", self->_presentableForActiveGesture);
      if (-[BNContentViewController _isDraggingEnabledForPresentable:](self, "_isDraggingEnabledForPresentable:", self->_presentableForActiveGesture)&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = [BNPanGestureLocalProxy alloc];
        panGesture = self->_panGesture;
        -[BNContentViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[BNPanGestureLocalProxy initWithPanGestureRecognizer:containerView:](v12, "initWithPanGestureRecognizer:containerView:", panGesture, v14);
        panGestureProxyForActivePresentable = self->_panGestureProxyForActivePresentable;
        self->_panGestureProxyForActivePresentable = v15;

        -[BNPanGestureProxyPrivate setDelegate:](self->_panGestureProxyForActivePresentable, "setDelegate:", self);
        -[BNPresentable draggingDidBeginWithGestureProxy:](self->_presentableForActiveGesture, "draggingDidBeginWithGestureProxy:", self->_panGestureProxyForActivePresentable);
        -[BNPanGestureProxyPrivate sendAction](self->_panGestureProxyForActivePresentable, "sendAction");
      }
      break;
    case 2:
      if (-[BNContentViewController _isLocalDraggingEnabledForPresentable:](self, "_isLocalDraggingEnabledForPresentable:", self->_presentableForActiveGesture))
      {
        x = self->_presentedFrameForPresentableForActiveGesture.origin.x;
        y = self->_presentedFrameForPresentableForActiveGesture.origin.y;
        size = (CGPoint)self->_presentedFrameForPresentableForActiveGesture.size;
        -[BNContentViewController view](self, "view");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        -[BNContentViewController _translationInContainerViewForGesture:](self, "_translationInContainerViewForGesture:", v5);
        v21 = v20;
        if (v20 < 0.0
          && -[BNContentViewController _isDraggingDismissalEnabledForPresentable:](self, "_isDraggingDismissalEnabledForPresentable:", self->_presentableForActiveGesture)|| v21 >= 0.0&& -[BNContentViewController _isDraggingInteractionEnabledForPresentable:](self, "_isDraggingInteractionEnabledForPresentable:", self->_presentableForActiveGesture))
        {
          _RubberBandedTranslationInContainerView(v19);
          v23 = y + v22;
          UIViewControllerFromPresentable(self->_presentableForActiveGesture);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __38__BNContentViewController__handlePan___block_invoke;
          v55[3] = &unk_1E7044B58;
          v58 = x;
          v59 = v23;
          v60 = size;
          v56 = v25;
          v57 = self;
          v26 = v25;
          +[BNBannerTransitionAnimator animateInteractive:animations:completion:](BNBannerTransitionAnimator, "animateInteractive:animations:completion:", 1, v55, 0);

        }
        goto LABEL_28;
      }
      break;
    case 3:
      p_presentableForActiveGesture = &self->_presentableForActiveGesture;
      if (!-[BNContentViewController _isLocalDraggingEnabledForPresentable:](self, "_isLocalDraggingEnabledForPresentable:", self->_presentableForActiveGesture))goto LABEL_24;
      -[BNContentViewController _translationInContainerViewForGesture:](self, "_translationInContainerViewForGesture:", v5);
      v29 = v28;
      if (!-[BNContentViewController _isDraggingDismissalEnabledForPresentable:](self, "_isDraggingDismissalEnabledForPresentable:", *p_presentableForActiveGesture))goto LABEL_24;
      if (CGRectGetHeight(self->_presentedFrameForPresentableForActiveGesture) * 0.5 >= -v29)
      {
        -[BNContentViewController view](self, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "velocityInView:", v30);
        v32 = v31;

        if (v32 >= -100.0)
          goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable userInteractionDidEndForBannerForPresentable:](*p_presentableForActiveGesture, "userInteractionDidEndForBannerForPresentable:", *p_presentableForActiveGesture);
      WeakRetained = objc_loadWeakRetained((id *)&self->_poster);
      if (WeakRetained)
      {
        v34 = objc_opt_respondsToSelector();
        +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", *p_presentableForActiveGesture);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v34 & 1) != 0)
        {
          v54 = 0;
          v36 = (id *)&v54;
          objc_msgSend(WeakRetained, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v35, CFSTR("BNBannerRevocationReasonDragDismissal"), 0, 1, 0, &v54);
          v37 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v53 = 0;
          v36 = (id *)&v53;
          objc_msgSend(WeakRetained, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v35, CFSTR("BNBannerRevocationReasonDragDismissal"), 0, 0, &v53);
          v37 = objc_claimAutoreleasedReturnValue();
        }
        v41 = (void *)v37;
        v42 = *v36;

        if (!v41)
        {
          v43 = (void *)BNLogPresenting;
          if (os_log_type_enabled((os_log_t)BNLogPresenting, OS_LOG_TYPE_ERROR))
            -[BNContentViewController _handlePan:].cold.1((void **)p_presentableForActiveGesture, v43, (uint64_t)v42);
        }

      }
      else
      {
        -[BNContentViewController _dismissPresentable:withReason:animated:userInfo:](self, "_dismissPresentable:withReason:animated:userInfo:", *p_presentableForActiveGesture, CFSTR("BNBannerRevocationReasonDragDismissal"), 1, 0);
      }

      break;
    case 4:
LABEL_24:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable userInteractionDidEndForBannerForPresentable:](self->_presentableForActiveGesture, "userInteractionDidEndForBannerForPresentable:", self->_presentableForActiveGesture);
      if (-[BNContentViewController _isLocalDraggingEnabledForPresentable:](self, "_isLocalDraggingEnabledForPresentable:", self->_presentableForActiveGesture))
      {
        UIViewControllerFromPresentable(self->_presentableForActiveGesture);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = self->_presentedFrameForPresentableForActiveGesture.size;
        size = self->_presentedFrameForPresentableForActiveGesture.origin;
        v52 = v40;
        objc_initWeak(&location, self);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __38__BNContentViewController__handlePan___block_invoke_128;
        v45[3] = &unk_1E7044B80;
        v19 = v39;
        v46 = v19;
        v48 = size;
        v49 = v52;
        objc_copyWeak(&v47, &location);
        +[BNBannerTransitionAnimator animateInteractive:animations:completion:](BNBannerTransitionAnimator, "animateInteractive:animations:completion:", 0, v45, 0);
        -[BNPanGestureProxyPrivate sendAction](self->_panGestureProxyForActivePresentable, "sendAction");
        -[BNContentViewController _resetPresentableForActiveGesture:](self, "_resetPresentableForActiveGesture:", self->_presentableForActiveGesture);
        objc_destroyWeak(&v47);

        objc_destroyWeak(&location);
LABEL_28:

      }
      break;
    default:
      break;
  }

}

uint64_t __38__BNContentViewController__handlePan___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "_postLayoutChangeForVisibleNotifications");
}

void __38__BNContentViewController__handlePan___block_invoke_128(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_postLayoutChangeForVisibleNotifications");

}

- (void)_postLayoutChangeForVisibleNotifications
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BNContentViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v5;
  objc_msgSend(v5, "screen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[BNTieredArray allObjects](self->_presentables, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        UIViewControllerFromPresentable(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isViewLoaded"))
        {
          objc_msgSend(v12, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "superview");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "frame");
          -[BNContentViewController _insetFrame:forViewController:](self, "_insetFrame:forViewController:", v12);
          objc_msgSend(v14, "convertRect:toView:", 0);
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;

          objc_msgSend(v32, "convertRect:toWindow:", 0, v16, v18, v20, v22);
          v33[0] = v23;
          v33[1] = v24;
          v33[2] = v25;
          v33[3] = v26;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v33, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[BNPresentableIdentification genericIdentificationForPresentable:](BNPresentableIdentification, "genericIdentificationForPresentable:", v11);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v27, v28);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = CFSTR("BNPresentableIdentificationsToFrames");
  v39 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "postNotificationName:object:userInfo:", CFSTR("BNPresentableLayoutDidChange"), v31, v30);

}

- (BNConsidering)authority
{
  return self->_authority;
}

- (BNPosting)poster
{
  return (BNPosting *)objc_loadWeakRetained((id *)&self->_poster);
}

- (void)setPoster:(id)a3
{
  objc_storeWeak((id *)&self->_poster, a3);
}

- (BNPresentingDelegate)delegate
{
  return (BNPresentingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_poster);
  objc_storeStrong((id *)&self->_authority, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_activeBannerTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_activeBannerTransitionContext, 0);
  objc_storeStrong((id *)&self->_panGestureProxyForActivePresentable, 0);
  objc_storeStrong((id *)&self->_presentableForActiveGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_transitioningDelegates, 0);
  objc_storeStrong((id *)&self->_dismissingPresentables, 0);
  objc_storeStrong((id *)&self->_presentingPresentables, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
}

- (void)presentPresentable:(void *)a1 withOptions:(uint64_t)a2 userInfo:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_1B9628000, a3, (uint64_t)a3, "Retargeting animation of presentable for presentation: %{public}@", (uint8_t *)a2);

}

void __67__BNContentViewController_presentPresentable_withOptions_userInfo___block_invoke_53_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_5_1();
  BNEffectivePresentableDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1B9628000, v5, v6, "Presentable _would_ appear as banner, but appears to be dismissing: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5();
}

void __84__BNContentViewController__morphFromPresentable_toPresentable_withOptions_userInfo___block_invoke_64_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_5_1();
  BNEffectivePresentableDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1B9628000, v5, v6, "Presentable _would_ disappear as banner, but appears to be presenting: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5();
}

- (void)_dismissPresentable:(NSObject *)a3 withReason:animated:userInfo:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_1B9628000, a3, (uint64_t)a3, "Retargeting animation of presentable for dismissal: %{public}@", (uint8_t *)a2);

}

- (void)_handlePan:(uint64_t)a3 .cold.1(void **a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  BNEffectivePresentableDescription(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v8 = 2114;
  v9 = a3;
  _os_log_error_impl(&dword_1B9628000, v5, OS_LOG_TYPE_ERROR, "Encountered error attempting to revoke presentable for active gesture '%{public}@': %{public}@", v7, 0x16u);

}

@end
