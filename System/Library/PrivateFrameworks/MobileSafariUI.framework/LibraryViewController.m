@implementation LibraryViewController

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView removeObserver:forKeyPath:context:](self->_floatingCollectionView, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), kvoContext);
  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  -[LibraryViewController dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  UICollectionView *v11;
  id v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v10 = a3;
  v11 = (UICollectionView *)a4;
  v12 = a5;
  if ((void *)kvoContext == a6
    && self->_floatingCollectionView == v11
    && objc_msgSend(v10, "isEqualToString:", CFSTR("contentSize")))
  {
    -[UICollectionView contentSize](self->_floatingCollectionView, "contentSize");
    -[UICollectionView frame](self->_floatingCollectionView, "frame");
    CGRectGetHeight(v15);
    if ((_SFEqualWithEpsilon() & 1) == 0)
    {
      -[LibraryViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LibraryViewController;
    -[LibraryViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)collectionViewContentSizeDidChange:(id)a3
{
  id v3;

  -[LibraryViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  UICollectionView *v10;
  UICollectionView *collectionView;
  void *v12;
  id v13;
  UICollectionView *v14;
  UICollectionView *floatingCollectionView;
  void *v16;
  UIView *v17;
  UIView *separator;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  UICollectionViewDiffableDataSource *v23;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v25;
  UICollectionViewDiffableDataSource *floatingCollectionViewDataSource;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewDidLoad](&v40, sel_viewDidLoad);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryViewController setTitle:](self, "setTitle:", v3);

  -[LibraryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 3);
  objc_msgSend(v5, "setHeaderMode:", 0);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __36__LibraryViewController_viewDidLoad__block_invoke;
  v37[3] = &unk_1E9CF5010;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v5, "setTrailingSwipeActionsConfigurationProvider:", v37);
  v7 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __36__LibraryViewController_viewDidLoad__block_invoke_2;
  v34[3] = &unk_1E9CF5038;
  v8 = v5;
  v35 = v8;
  objc_copyWeak(&v36, &location);
  v29 = (void *)objc_msgSend(v7, "initWithSectionProvider:", v34);
  v9 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v4, "bounds");
  v10 = (UICollectionView *)objc_msgSend(v9, "initWithFrame:collectionViewLayout:", v29);
  collectionView = self->_collectionView;
  self->_collectionView = v10;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self);
  -[UICollectionView setDropDelegate:](self->_collectionView, "setDropDelegate:", self);
  -[UICollectionView setSpringLoaded:](self->_collectionView, "setSpringLoaded:", 1);
  -[UICollectionView setSelectionFollowsFocus:](self->_collectionView, "setSelectionFollowsFocus:", 1);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UICollectionView setAllowsFocus:](self->_collectionView, "setAllowsFocus:", 1);
  objc_msgSend(v4, "addSubview:", self->_collectionView);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v4, "bounds");
  v14 = (UICollectionView *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v12);
  floatingCollectionView = self->_floatingCollectionView;
  self->_floatingCollectionView = v14;

  -[UICollectionView setAlwaysBounceVertical:](self->_floatingCollectionView, "setAlwaysBounceVertical:", 0);
  -[UICollectionView panGestureRecognizer](self->_floatingCollectionView, "panGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setCanPanVertically:", 0);

  -[UICollectionView setDelegate:](self->_floatingCollectionView, "setDelegate:", self);
  -[UICollectionView addObserver:forKeyPath:options:context:](self->_floatingCollectionView, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, kvoContext);
  objc_msgSend(v4, "addSubview:", self->_floatingCollectionView);
  v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separator = self->_separator;
  self->_separator = v17;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v19);

  objc_msgSend(v4, "addSubview:", self->_separator);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__LibraryViewController_viewDidLoad__block_invoke_5;
  aBlock[3] = &unk_1E9CF60A8;
  v21 = v20;
  v33 = v21;
  v22 = _Block_copy(aBlock);
  v23 = (UICollectionViewDiffableDataSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", self->_collectionView, v22);
  dataSource = self->_dataSource;
  self->_dataSource = v23;

  v25 = (UICollectionViewDiffableDataSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", self->_floatingCollectionView, v22);
  floatingCollectionViewDataSource = self->_floatingCollectionViewDataSource;
  self->_floatingCollectionViewDataSource = v25;

  v27 = objc_alloc_init(MEMORY[0x1E0DC35F8]);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __36__LibraryViewController_viewDidLoad__block_invoke_6;
  v30[3] = &unk_1E9CF60D0;
  objc_copyWeak(&v31, &location);
  v28 = _Block_copy(v30);
  objc_msgSend(v27, "setWillExpandItemHandler:", v28);
  objc_msgSend(v27, "setWillCollapseItemHandler:", v28);
  -[UICollectionViewDiffableDataSource setSectionSnapshotHandlers:](self->_dataSource, "setSectionSnapshotHandlers:", v27);
  -[LibraryViewController _reloadFloatingSectionControllersImmediately](self, "_reloadFloatingSectionControllersImmediately");
  -[LibraryViewController _reloadSectionControllersImmediatelyAnimated:](self, "_reloadSectionControllersImmediatelyAnimated:", 0);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

id __36__LibraryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_swipeActionsConfigurationForIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __36__LibraryViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id *WeakRetained;
  id *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[122], "numberOfItemsInSection:", a2))
    {
      v12 = v7 + 5.0;
      v13 = v9 + 5.0;
      v14 = 16.0;
      v15 = 8.0;
    }
    else
    {
      v14 = *MEMORY[0x1E0DC3298];
      v12 = *(double *)(MEMORY[0x1E0DC3298] + 8);
      v15 = *(double *)(MEMORY[0x1E0DC3298] + 16);
      v13 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    }
    objc_msgSend(v5, "setContentInsets:", v14, v12, v15, v13);
    v16 = v5;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __36__LibraryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v5, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__LibraryViewController_viewDidLoad__block_invoke_4;
  v9[3] = &unk_1E9CF6080;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "setConfigurationUpdateHandler:", v9);

}

void __36__LibraryViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatedConfigurationForState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsDefaultTighteningForTruncation:", 0);

  objc_msgSend(v8, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 0);

  objc_msgSend(*(id *)(a1 + 32), "updateListContentConfiguration:", v8);
  objc_msgSend(v5, "updateConfigurationForTabIconRegistration:", v8);
  objc_msgSend(v5, "setContentConfiguration:", v8);
  if (objc_msgSend(*(id *)(a1 + 32), "hasSubitems"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DC3588]);
    objc_msgSend(v11, "setDisplayedState:", 0);
    objc_msgSend(v11, "setStyle:", 2);
    if ((objc_msgSend(v8, "safari_usesWhiteText") & 1) != 0)
    {
      objc_msgSend(v8, "textProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "color");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v12);
    }

    objc_msgSend(v11, "setReservedLayoutWidth:", 30.0);
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessories:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accessories");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessories:", v11);
  }

}

uint64_t __36__LibraryViewController_viewDidLoad__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

void __36__LibraryViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  objc_msgSend(a2, "willToggleExpansionState");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  UICollectionView *floatingCollectionView;
  double Height;
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
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  _BOOL8 v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = self;
  v26.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewDidLayoutSubviews](&v26, sel_viewDidLayoutSubviews);
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isSafariProfilesEnabled") & 1) != 0)
  {
    -[LibraryViewController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabGroupProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasMultipleProfiles");

    floatingCollectionView = self->_floatingCollectionView;
    if (v5)
    {
      -[UICollectionView setHidden:](floatingCollectionView, "setHidden:", 0);
      -[LibraryViewController _frameForFloatingCollectionView](self, "_frameForFloatingCollectionView");
      Height = CGRectGetHeight(v27);
      -[UICollectionView contentInset](self->_collectionView, "contentInset");
      if ((_SFEqualWithEpsilon() & 1) == 0)
        -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 0.0, Height, 0.0);
      if (Height == 0.0)
      {
        v24 = 1;
      }
      else
      {
        -[UICollectionView contentSize](self->_collectionView, "contentSize");
        v9 = v8;
        -[UICollectionView frame](self->_collectionView, "frame");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[UICollectionView adjustedContentInset](self->_collectionView, "adjustedContentInset");
        v19 = v13 + v18;
        v22 = v15 - (v20 + v21);
        v28.size.height = v17 - (v18 + v23);
        v28.origin.x = v11 + v20;
        v28.origin.y = v19;
        v28.size.width = v22;
        v24 = v9 <= CGRectGetHeight(v28);
      }
      -[UIView setHidden:](self->_separator, "setHidden:", v24);
      -[LibraryViewController _layOutFloatingViews](self, "_layOutFloatingViews");
    }
    else
    {
      -[UICollectionView setHidden:](floatingCollectionView, "setHidden:", 1);
      -[UIView setHidden:](self->_separator, "setHidden:", 1);
      -[UICollectionView contentInset](self->_collectionView, "contentInset");
      if (v25 != 0.0)
        -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    }
  }
  else
  {
    -[UICollectionView setHidden:](self->_floatingCollectionView, "setHidden:", 1);
    -[UIView setHidden:](self->_separator, "setHidden:", 1);
  }
}

- (CGRect)_frameForFloatingCollectionView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double Height;
  double v14;
  CGFloat Width;
  NSInteger v16;
  NSInteger v17;
  BOOL v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[LibraryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UICollectionView contentSize](self->_floatingCollectionView, "contentSize");
  if (v12 == 0.0)
  {
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    Height = CGRectGetHeight(v25);
  }
  else
  {
    Height = v12 + 0.0;
  }
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v14 = CGRectGetHeight(v26) - Height;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  Width = CGRectGetWidth(v27);
  if (-[UIView isHidden](self->_separator, "isHidden"))
  {
    v16 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections");
    v17 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v16 - 1);
    if (v16)
      v18 = v17 == 0;
    else
      v18 = 1;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17 - 1, v16 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      objc_msgSend(v3, "convertRect:fromView:", v20);
      v14 = fmax(v14, CGRectGetMaxY(v28));

    }
  }

  v21 = 0.0;
  v22 = v14;
  v23 = Width;
  v24 = Height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_layOutFloatingViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[LibraryViewController _frameForFloatingCollectionView](self, "_frameForFloatingCollectionView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UICollectionView setFrame:](self->_floatingCollectionView, "setFrame:");
  _SFOnePixel();
  -[UIView setFrame:](self->_separator, "setFrame:", v4, v6, v8, v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[LibraryViewController _reloadSectionControllersImmediatelyAnimated:](self, "_reloadSectionControllersImmediatelyAnimated:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[LibraryViewController _reloadSectionControllersImmediatelyAnimated:](self, "_reloadSectionControllersImmediatelyAnimated:", 0);
}

- (void)updateSelection
{
  -[LibraryViewController updateSelectionByIgnoringExistingSelection:](self, "updateSelectionByIgnoringExistingSelection:", 0);
}

- (void)updateSelectionByIgnoringExistingSelection:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3
    || (-[LibraryViewController selectedItemController](self, "selectedItemController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__LibraryViewController_updateSelectionByIgnoringExistingSelection___block_invoke;
    v5[3] = &unk_1E9CF60F8;
    v5[4] = self;
    -[LibraryViewController _enumerateItemControllersWithBlock:](self, "_enumerateItemControllersWithBlock:", v5);
  }
}

void __68__LibraryViewController_updateSelectionByIgnoringExistingSelection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "isSelected"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
    *a4 = 1;
  }

}

- (void)_updateSelectionIfNeeded
{
  if (self->_reloadFlags.needsUpdateSelection)
  {
    self->_reloadFlags.needsUpdateSelection = 0;
    -[LibraryViewController updateSelectionByIgnoringExistingSelection:](self, "updateSelectionByIgnoringExistingSelection:", 1);
  }
}

- (void)reloadExpansionStateForItem:(id)a3 inSection:(id)a4
{
  id v6;
  UICollectionViewDiffableDataSource *dataSource;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dataSource = self->_dataSource;
  v8 = a4;
  -[UICollectionViewDiffableDataSource snapshotForSection:](dataSource, "snapshotForSection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isExpanded"))
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expandItems:", v10);
  }
  else
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collapseItems:", v10);
  }

  -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_dataSource, "applySnapshot:toSection:animatingDifferences:", v9, v8, 1);
}

- (void)setNeedsReloadSectionControllersAnimated:(BOOL)a3
{
  id v4;

  self->_reloadFlags.needsReload = 1;
  if (self->_reloadFlags.animated)
    a3 = 1;
  self->_reloadFlags.animated = a3;
  -[LibraryViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setNeedsReloadForProfileSwitcher
{
  id v2;

  self->_reloadFlags.needsReloadForProfileSwitcher = 1;
  -[LibraryViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_reloadFloatingSectionControllersImmediately
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *profilesInSwitcherMenu;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[LibraryViewController isViewLoaded](self, "isViewLoaded")
    && -[NSArray count](self->_sectionControllers, "count"))
  {
    -[NSArray lastObject](self->_sectionControllers, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "filteredItemControllers", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v11);
          objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_floatingCollectionViewDataSource, "applySnapshot:animatingDifferences:", v5, 0);
    -[LibraryViewController configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tabGroupProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profiles");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    profilesInSwitcherMenu = self->_profilesInSwitcherMenu;
    self->_profilesInSwitcherMenu = v15;

    self->_reloadFlags.needsReloadForProfileSwitcher = 0;
    -[LibraryViewController updateSelectionByIgnoringExistingSelection:](self, "updateSelectionByIgnoringExistingSelection:", 1);

  }
}

- (void)setNeedsUpdateSelection
{
  id v2;

  self->_reloadFlags.needsUpdateSelection = 1;
  -[LibraryViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)reloadSectionControllersIfNeeded
{
  $AA292DD643D9A8210155AAEB64DCD6FF *p_reloadFlags;
  _BOOL8 animated;

  p_reloadFlags = &self->_reloadFlags;
  if (!self->_reloadFlags.needsReload)
  {
    if (!self->_reloadFlags.needsReloadForProfileSwitcher)
      return;
LABEL_5:
    self->_reloadFlags.needsReloadForProfileSwitcher = 0;
    -[LibraryViewController _reloadFloatingSectionControllersImmediately](self, "_reloadFloatingSectionControllersImmediately");
    if (!p_reloadFlags->needsReload)
      return;
    goto LABEL_6;
  }
  if (self->_reloadFlags.needsReloadForProfileSwitcher)
    goto LABEL_5;
LABEL_6:
  animated = p_reloadFlags->animated;
  p_reloadFlags->needsReload = 0;
  p_reloadFlags->animated = 0;
  -[LibraryViewController _reloadSectionControllersImmediatelyAnimated:](self, "_reloadSectionControllersImmediatelyAnimated:", animated);
}

- (void)_reloadSectionControllersImmediatelyAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[LibraryViewController isViewLoaded](self, "isViewLoaded")
    && -[NSArray count](self->_sectionControllers, "count"))
  {
    -[NSArray subarrayWithRange:](self->_sectionControllers, "subarrayWithRange:", 0, -[NSArray count](self->_sectionControllers, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[LibraryViewController _applySnapshotForSection:animated:](self, "_applySnapshotForSection:animated:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reconfigureItemsWithIdentifiers:", v11);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v10, 0);
    -[LibraryViewController updateSelectionByIgnoringExistingSelection:](self, "updateSelectionByIgnoringExistingSelection:", 1);

  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  -[UICollectionView _scrollToTopIfPossible:](self->_collectionView, "_scrollToTopIfPossible:", a3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LibraryViewController;
  -[LibraryViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[LibraryViewController reloadSectionControllersIfNeeded](self, "reloadSectionControllersIfNeeded");
  -[LibraryViewController _updateSelectionIfNeeded](self, "_updateSelectionIfNeeded");
}

- (id)_diffableDataSourceForCollectionView:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_enumerateItemControllersWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v12 = -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections");
  if (v12 >= 1)
  {
    v5 = 0;
    while (1)
    {
      v6 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v5);
      if (v6 >= 1)
        break;
LABEL_7:
      if (++v5 == v12)
        goto LABEL_8;
    }
    v7 = v6;
    v8 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v4[2](v4, v10, v9, &v13);
      v11 = v13;

      if (v11)
        break;
      if (v7 == ++v8)
        goto LABEL_7;
    }
  }
LABEL_8:

}

- (id)_swipeActionsConfigurationForIndexPath:(id)a3
{
  UICollectionView *collectionView;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  collectionView = self->_collectionView;
  v5 = a3;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", collectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "swipeActionsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setSectionControllers:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *sectionControllers;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_sectionControllers, "isEqualToArray:", v4))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_sectionControllers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v10, "setContentObserver:", 0);
          objc_msgSend(v10, "setPresentingViewController:", 0);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    v11 = (NSArray *)objc_msgSend(v4, "copy");
    sectionControllers = self->_sectionControllers;
    self->_sectionControllers = v11;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = self->_sectionControllers;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          objc_msgSend(v18, "setContentObserver:", self, (_QWORD)v19);
          objc_msgSend(v18, "setPresentingViewController:", self);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    -[LibraryViewController _reloadSectionControllersImmediatelyAnimated:](self, "_reloadSectionControllersImmediatelyAnimated:", 0);
  }

}

- (LibraryItemController)selectedItemController
{
  void *v3;
  void *v4;
  void *v5;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (LibraryItemController *)v5;
}

- (void)setSelectedItemController:(id)a3
{
  id v4;
  void *WeakRetained;
  void *v6;
  char v7;
  LibraryItemController *presentedItemController;
  void *v9;
  uint64_t v10;
  UICollectionView *collectionView;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", v4);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
    {
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", WeakRetained);

      if ((v7 & 1) == 0)
      {
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", WeakRetained, 0, 2);
        -[LibraryViewController _collectionViewDidSelectItem:atIndexPath:](self, "_collectionViewDidSelectItem:atIndexPath:", v14, WeakRetained);
      }
    }
LABEL_9:

    goto LABEL_10;
  }
  presentedItemController = self->_presentedItemController;
  self->_presentedItemController = 0;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    collectionView = self->_collectionView;
    -[UICollectionView indexPathsForSelectedItems](collectionView, "indexPathsForSelectedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView deselectItemAtIndexPath:animated:](collectionView, "deselectItemAtIndexPath:animated:", v13, 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "libraryViewControllerDidClearSelection:", self);
    -[LibraryViewController updateSelection](self, "updateSelection");
    goto LABEL_9;
  }
LABEL_10:

}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_collectionView == a3)
  {
    if (-[UIView isHidden](self->_separator, "isHidden"))
      -[LibraryViewController _layOutFloatingViews](self, "_layOutFloatingViews");
  }
}

- (void)_collectionViewDidSelectItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id WeakRetained;
  LibraryItemController *presentedItemController;
  LibraryItemController *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "libraryViewController:didSelectItem:", self, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "libraryViewController:shouldPersistSelectionForItem:", self, v10) & 1) == 0)
  {
    -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v6, 1);
    v9 = (LibraryItemController *)v10;
    presentedItemController = self->_presentedItemController;
    self->_presentedItemController = v9;
  }
  else
  {
    presentedItemController = self->_presentedItemController;
    self->_presentedItemController = 0;
  }

  -[LibraryViewController updateSelection](self, "updateSelection");
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  UICollectionViewDiffableDataSource *dataSource;
  id v7;
  id v8;

  dataSource = self->_dataSource;
  v7 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](dataSource, "itemIdentifierForIndexPath:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willDisplayCell:", v7);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTabIconRegistration:", 0);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  UICollectionView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v7 = (UICollectionView *)a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count") || self->_floatingCollectionView == v7)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__LibraryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
    v15[3] = &unk_1E9CF5A60;
    v15[4] = self;
    objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LibraryViewController configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tabGroupProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[LibraryMenuProvider contextMenuConfigurationForLibraryItems:dataSource:](LibraryMenuProvider, "contextMenuConfigurationForLibraryItems:dataSource:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v9;
  }

  return v13;
}

id __91__LibraryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[122];
  v4 = a2;
  objc_msgSend(v2, "_diffableDataSourceForCollectionView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "isSpringLoaded");
  return (char)v8;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "selectionFollowsFocus");
  return (char)v7;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  UICollectionView *collectionView;
  id v6;
  void *v7;
  id v8;

  collectionView = self->_collectionView;
  v6 = a4;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", collectionView);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[LibraryViewController _collectionViewDidSelectItem:atIndexPath:](self, "_collectionViewDidSelectItem:atIndexPath:", v8, v6);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dragItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dragItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartDragWithDragContentType:", 4);

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifierForIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "dropOperationForSession:", v9);
  v13 = objc_msgSend(v11, "dropIntentForSession:", v9);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:intent:", v12, v13);
  return v14;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "destinationIndexPath");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifierForIndex:", objc_msgSend(v16, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LibraryViewController _diffableDataSourceForCollectionView:](self, "_diffableDataSourceForCollectionView:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "itemIdentifierForIndexPath:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemControllerToHandleDropItemsFromSession:withProposedDestinationItemController:atIndex:", v12, v11, objc_msgSend(v16, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "proposal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "performDropWithProposal:session:", v14, v15);
}

- (void)librarySectionContentDidChange:(id)a3
{
  -[LibraryViewController _applySnapshotForSection:animated:](self, "_applySnapshotForSection:animated:", a3, 1);
}

- (void)_applySnapshotForSection:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "filteredItemControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItems:", v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "subitems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v6, "appendItems:intoParentItem:", v14, v13);
          if (objc_msgSend(v13, "isExpanded"))
          {
            v21 = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "expandItems:", v15);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_dataSource, "applySnapshot:toSection:animatingDifferences:", v6, v5, v16);
}

- (LibraryViewControllerDelegate)delegate
{
  return (LibraryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)sectionControllers
{
  return self->_sectionControllers;
}

- (LibraryItemController)presentedItemController
{
  return self->_presentedItemController;
}

- (void)setPresentedItemController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedItemController, a3);
}

- (NSArray)profilesInSwitcherMenu
{
  return self->_profilesInSwitcherMenu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesInSwitcherMenu, 0);
  objc_storeStrong((id *)&self->_presentedItemController, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_floatingCollectionView, 0);
  objc_storeStrong((id *)&self->_floatingCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
