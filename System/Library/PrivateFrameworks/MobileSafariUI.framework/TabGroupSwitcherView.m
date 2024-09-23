@implementation TabGroupSwitcherView

- (void)setShowsTabGroupSwitcherToolbar:(BOOL)a3
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = !a3;
  -[SFCapsuleCollectionView setHidden:](self->_capsuleView, "setHidden:", v4);
  -[UIVisualEffectView setHidden:](self->_statusBarBackdrop, "setHidden:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[TabGroupSwitcherViewController recenterViews]((uint64_t)WeakRetained);

}

- (id)initWithTabGroupSwitcher:(id *)a1
{
  id v3;
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id from;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)TabGroupSwitcherView;
    v4 = (id *)objc_msgSendSuper2(&v27, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 52, v3);
      a1[55] = (id)0x3FF0000000000000;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE38]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      v6 = a1[57];
      a1[57] = (id)v5;

      objc_msgSend(a1[57], "setAutoresizingMask:", 18);
      objc_msgSend(a1[57], "setDataSource:", v3);
      objc_msgSend(a1, "addSubview:", a1[57]);
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4EC08]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      v8 = a1[56];
      a1[56] = (id)v7;

      objc_msgSend(a1[56], "setAutoresizingMask:", 18);
      objc_msgSend(a1[56], "setCapsuleWidth:", 0.4);
      objc_msgSend(a1[56], "setDataSource:", v3);
      objc_msgSend(a1[56], "setDelegate:", v3);
      objc_msgSend(a1[56], "setInactiveCapsuleAlpha:", 0.4);
      objc_msgSend(a1[56], "setKeepsCapsulesAboveKeyboard:", 0);
      objc_msgSend(a1[56], "setLayoutStyle:", 1);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[56], "setSelectionGestureLimit:", objc_msgSend(v9, "integerForKey:", *MEMORY[0x1E0D4F0D0]));

      objc_msgSend(a1[56], "setSelectionThreshold:", 0.5);
      objc_msgSend(a1[56], "setUsesFastDeceleration:", 1);
      objc_msgSend(a1[56], "addGestureObserver:", v3);
      objc_msgSend(a1, "addSubview:", a1[56]);
      objc_initWeak(&location, v3);
      v10 = a1[56];
      v11 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke;
      v24[3] = &unk_1E9CF2BD8;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v10, "registerContentViewIdentifier:block:", CFSTR("tab-group"), v24);
      objc_initWeak(&from, a1);
      v12 = a1[56];
      v28[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      v19 = 3221225472;
      v20 = __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke_2;
      v21 = &unk_1E9CF61E0;
      objc_copyWeak(&v22, &from);
      v14 = (id)objc_msgSend(v12, "registerForTraitChanges:withHandler:", v13, &v18);

      objc_msgSend(MEMORY[0x1E0DC3F58], "safari_statusBarGradientBlurEffectView", v18, v19, v20, v21);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = a1[53];
      a1[53] = (id)v15;

      objc_msgSend(a1, "addSubview:", a1[53]);
      objc_msgSend(a1, "updateToolbarTheme");
      a1 = a1;
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

    }
  }

  return a1;
}

- (void)updateToolbarTheme
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[SFCapsuleCollectionView traitCollection](self->_capsuleView, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleCollectionView setTheme:](self->_capsuleView, "setTheme:", v6);

}

id __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0D4EDA0]);
  objc_msgSend(v2, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", WeakRetained);
    objc_msgSend(v2, "addInteraction:", v4);

  }
  return v2;
}

void __49__TabGroupSwitcherView_initWithTabGroupSwitcher___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateToolbarTheme");

}

- (void)layoutSubviews
{
  double Width;
  double v4;
  id WeakRetained;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)TabGroupSwitcherView;
  -[TabGroupSwitcherView layoutSubviews](&v6, sel_layoutSubviews);
  -[TabGroupSwitcherView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  -[TabGroupSwitcherView safeAreaInsets](self, "safeAreaInsets");
  -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v4 * self->_tabViewPresentationProgress);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[TabGroupSwitcherViewController viewDidLayoutSubviews]((uint64_t)WeakRetained);

}

- (BOOL)showsTabGroupSwitcherToolbar
{
  return -[SFCapsuleCollectionView isHidden](self->_capsuleView, "isHidden") ^ 1;
}

- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider
{
  return self->_capsuleView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_capsuleView, 0);
  objc_destroyWeak((id *)&self->_tabGroupSwitcher);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
