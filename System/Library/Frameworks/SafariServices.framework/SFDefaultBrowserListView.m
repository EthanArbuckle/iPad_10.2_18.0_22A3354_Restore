@implementation SFDefaultBrowserListView

- (SFDefaultBrowserListView)initWithCompletionHandler:(id)a3
{
  id v4;
  SFDefaultBrowserListView *v5;
  uint64_t v6;
  id completionHandler;
  id v8;
  void *v9;
  uint64_t v10;
  UICollectionView *collectionView;
  UICollectionView *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SFDefaultBrowserListView *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFDefaultBrowserListView;
  v5 = -[SFDefaultBrowserListView init](&v34, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A8598C40](v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

    -[SFDefaultBrowserListView _createPlaceholderLockupViews](v5, "_createPlaceholderLockupViews");
    -[SFDefaultBrowserListView _updateBrowserLockupViews](v5, "_updateBrowserLockupViews");
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:", &__block_literal_global_0);
    v8 = objc_alloc(MEMORY[0x1E0DC35B8]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v33 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v32);
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v10;

    -[UICollectionView setDelegate:](v5->_collectionView, "setDelegate:", v5);
    -[UICollectionView setDataSource:](v5->_collectionView, "setDataSource:", v5);
    -[UICollectionView setScrollEnabled:](v5->_collectionView, "setScrollEnabled:", 0);
    v12 = v5->_collectionView;
    v13 = objc_opt_class();
    +[SFDefaultBrowserAppCollectionViewCell reuseIdentifier](SFDefaultBrowserAppCollectionViewCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v12, "registerClass:forCellWithReuseIdentifier:", v13, v14);

    -[SFDefaultBrowserListView addSubview:](v5, "addSubview:", v5->_collectionView);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFDefaultBrowserListView layoutMarginsGuide](v5, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UICollectionView topAnchor](v5->_collectionView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDefaultBrowserListView topAnchor](v5, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    -[UICollectionView leadingAnchor](v5->_collectionView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v16;
    -[UICollectionView trailingAnchor](v5->_collectionView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v19;
    -[UICollectionView bottomAnchor](v5->_collectionView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDefaultBrowserListView bottomAnchor](v5, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v23);

    v4 = v33;
    v24 = v5;

  }
  return v5;
}

id __54__SFDefaultBrowserListView_initWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0DC35A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setShowsSeparators:", 0);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)SFDefaultBrowserListView;
  -[SFDefaultBrowserListView layoutSubviews](&v4, sel_layoutSubviews);
  -[SFDefaultBrowserListView bounds](self, "bounds");
  v3 = fmax((CGRectGetWidth(v5) + -500.0) * 0.5, 0.0);
  -[SFDefaultBrowserListView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v3, 0.0, v3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  UICollectionView *collectionView;
  id v6;
  void *v7;
  void *v8;
  NSArray *browserAppLockupViews;
  uint64_t v10;
  void *v11;

  collectionView = self->_collectionView;
  v6 = a4;
  +[SFDefaultBrowserAppCollectionViewCell reuseIdentifier](SFDefaultBrowserAppCollectionViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  browserAppLockupViews = self->_browserAppLockupViews;
  v10 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](browserAppLockupViews, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLockupView:", v11);

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  UICollectionView *collectionView;
  id v6;
  void *v7;
  id v8;

  collectionView = self->_collectionView;
  v6 = a4;
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockupView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentProductDetailsViewController");

  -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v6, 1);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_browserAppLockupViews, "count", a3, a4);
}

- (void)_createPlaceholderLockupViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *browserAppLockupViews;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = 6;
  do
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9BC8]), "initWithFrame:", v3, v4, v5, v6);
    objc_msgSend(v8, "setShowsPlaceholderContent:", 1);
    objc_msgSend(v11, "addObject:", v8);

    --v7;
  }
  while (v7);
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  browserAppLockupViews = self->_browserAppLockupViews;
  self->_browserAppLockupViews = v9;

  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (void)_updateBrowserLockupViews
{
  void *v3;
  _QWORD v4[5];

  +[SFBrowserASCLockupViewGenerator sharedGenerator](SFBrowserASCLockupViewGenerator, "sharedGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke;
  v4[3] = &unk_1E4ABFD00;
  v4[4] = self;
  objc_msgSend(v3, "generateLockupViewsWithDelegate:completionHandler:", self, v4);

}

uint64_t __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0DC35D0];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithSectionProvider:", &__block_literal_global_14);
    v6 = objc_msgSend(v4, "copy");

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 416);
    *(_QWORD *)(v7 + 416) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection");

    if (!v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setSemanticContentAttribute:", 3);
      objc_msgSend(v5, "setLayoutRTL:", 0);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setCollectionViewLayout:", v5);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadSections:", v14);

    objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) + 16))();
}

id __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0DC35A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setHeaderTopPadding:", 0.0);
  objc_msgSend(v5, "separatorConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBottomSeparatorInsets:", 0.0, 80.0, 0.0, 0.0);
  objc_msgSend(v5, "setSeparatorConfiguration:", v7);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  return v8;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[UICollectionView bounds](self->_collectionView, "bounds");
  v4 = v3;
  v6 = v5;
  -[SFDefaultBrowserListView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDefaultBrowserAppCollectionViewCell estimatedSizeForBounds:withTraits:](SFDefaultBrowserAppCollectionViewCell, "estimatedSizeForBounds:withTraits:", v7, v4, v6);
  v9 = v8;

  v10 = *MEMORY[0x1E0DC55F0];
  v11 = v9 * (double)-[NSArray count](self->_browserAppLockupViews, "count");
  v12 = v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "lockup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockupWithOffer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLockup:", v4);

}

- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(v22) = 138543362;
    *(_QWORD *)((char *)&v22 + 4) = v7;
    _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Received user interaction with type %{public}@", (uint8_t *)&v22, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = &v22;
  v23 = 0x2020000000;
  v10 = (_QWORD *)getASCLockupProductDetailsInteractionTypeOpenedSymbolLoc_ptr;
  v24 = getASCLockupProductDetailsInteractionTypeOpenedSymbolLoc_ptr;
  if (!getASCLockupProductDetailsInteractionTypeOpenedSymbolLoc_ptr)
  {
    v11 = (void *)AppStoreComponentsLibrary();
    v10 = dlsym(v11, "ASCLockupProductDetailsInteractionTypeOpened");
    *(_QWORD *)(*((_QWORD *)&v22 + 1) + 24) = v10;
    getASCLockupProductDetailsInteractionTypeOpenedSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v22, 8);
  if (!v10)
    goto LABEL_22;
  if (objc_msgSend(v7, "isEqualToString:", *v10, (_QWORD)v22))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SFDefaultBrowserSelectionStateKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInteger:forKey:", 1, v13);

    if (!self->_didInstallApp)
    {
      objc_msgSend(v6, "lockup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "id");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "didChangeDefaultBrowserWithIdentifier:", objc_msgSend(v21, "int64value"));

      goto LABEL_21;
    }
    goto LABEL_8;
  }
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = &v22;
  v23 = 0x2020000000;
  v14 = (_QWORD *)getASCLockupProductDetailsInteractionTypePurchasedSymbolLoc_ptr;
  v24 = getASCLockupProductDetailsInteractionTypePurchasedSymbolLoc_ptr;
  if (!getASCLockupProductDetailsInteractionTypePurchasedSymbolLoc_ptr)
  {
    v15 = (void *)AppStoreComponentsLibrary();
    v14 = dlsym(v15, "ASCLockupProductDetailsInteractionTypePurchased");
    *(_QWORD *)(*((_QWORD *)&v22 + 1) + 24) = v14;
    getASCLockupProductDetailsInteractionTypePurchasedSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v22, 8);
  if (!v14)
    goto LABEL_22;
  if (objc_msgSend(v7, "isEqualToString:", *v14, (_QWORD)v22))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SFDefaultBrowserSelectionStateKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInteger:forKey:", 1, v17);

    self->_didInstallApp = 1;
    objc_msgSend(WeakRetained, "didCommitDefaultBrowserChoice:", 0);
    goto LABEL_21;
  }
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = &v22;
  v23 = 0x2020000000;
  v18 = (_QWORD *)getASCLockupProductDetailsInteractionTypeDismissedSymbolLoc_ptr;
  v24 = getASCLockupProductDetailsInteractionTypeDismissedSymbolLoc_ptr;
  if (!getASCLockupProductDetailsInteractionTypeDismissedSymbolLoc_ptr)
  {
    v19 = (void *)AppStoreComponentsLibrary();
    v18 = dlsym(v19, "ASCLockupProductDetailsInteractionTypeDismissed");
    *(_QWORD *)(*((_QWORD *)&v22 + 1) + 24) = v18;
    getASCLockupProductDetailsInteractionTypeDismissedSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v22, 8);
  if (!v18)
  {
LABEL_22:
    -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
    __break(1u);
  }
  if (objc_msgSend(v7, "isEqualToString:", *v18, (_QWORD)v22) && self->_didInstallApp)
LABEL_8:
    objc_msgSend(WeakRetained, "didCommitDefaultBrowserChoice:", 1);
LABEL_21:

}

- (SFDefaultBrowserChangeDelegate)delegate
{
  return (SFDefaultBrowserChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_browserAppLockupViews, 0);
}

- (uint64_t)productDetailsUserDidInteractWithApp:interactionType:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SSReadingList addReadingListItemWithURL:title:previewText:error:].cold.1(v0);
}

@end
