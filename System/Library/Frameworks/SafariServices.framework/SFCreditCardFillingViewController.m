@implementation SFCreditCardFillingViewController

- (SFCreditCardFillingViewController)initWithFormAutocompleteState:(id)a3
{
  id v4;
  SFCreditCardFillingViewController *v5;
  SFCreditCardFillingViewController *v6;
  void *v7;
  SFCreditCardFillingViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCreditCardFillingViewController;
  v5 = -[SFCreditCardFillingViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_formAutocompleteState, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__cardDataChanged_, *MEMORY[0x1E0DC4860], 0);

    v8 = v6;
  }

  return v6;
}

- (double)_calculateCellWidthForCollectionViewWidth:(double)a3
{
  double v3;
  int v4;

  if (self->_lastLayoutWidth == a3)
    return self->_cachedCellWidth;
  self->_lastLayoutWidth = a3;
  v4 = 30;
  while (v4 != 5)
  {
    v3 = floor((a3 - (double)v4) / floor((a3 - (double)v4) / 180.0));
    v4 -= 5;
    if (v3 <= 285.0)
      goto LABEL_8;
  }
  v3 = 180.0;
LABEL_8:
  self->_cachedCellWidth = v3;
  return v3;
}

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  UICollectionView *v6;
  UICollectionView *collectionView;
  void *v8;
  UICollectionView *v9;
  uint64_t v10;
  void *v11;
  UICollectionView *v12;
  uint64_t v13;
  void *v14;
  UICollectionView *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  UIImageView *v20;
  UIImageView *leftShadowView;
  id v22;
  void *v23;
  UIImageView *v24;
  UIImageView *rightShadowView;
  void *v26;
  _QWORD v27[5];

  v3 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  objc_msgSend(v3, "setScrollDirection:", 1);
  v4 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __45__SFCreditCardFillingViewController_loadView__block_invoke;
  v27[3] = &unk_1E4AC0DC0;
  v27[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:configuration:", v27, v3);
  v6 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v5, 0.0, 0.0, 320.0, 47.0);
  collectionView = self->_collectionView;
  self->_collectionView = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v8);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 1);
  -[UICollectionView setDelaysContentTouches:](self->_collectionView, "setDelaysContentTouches:", 0);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 0);
  v9 = self->_collectionView;
  v10 = objc_opt_class();
  +[SFCreditCardCollectionViewCell reuseIdentifier](SFCreditCardCollectionViewCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v9, "registerClass:forCellWithReuseIdentifier:", v10, v11);

  v12 = self->_collectionView;
  v13 = objc_opt_class();
  +[SFScanningCreditCardCollectionViewCell reuseIdentifier](SFScanningCreditCardCollectionViewCell, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v12, "registerClass:forCellWithReuseIdentifier:", v13, v14);

  v15 = self->_collectionView;
  v16 = objc_opt_class();
  +[SFCreditCardSeparator reuseIdentifier](SFCreditCardSeparator, "reuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v15, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v16, CFSTR("SFCreditCardSeparator"), v17);

  v18 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("CreditCardShadowLeft"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v19);
  leftShadowView = self->_leftShadowView;
  self->_leftShadowView = v20;

  -[UICollectionView addSubview:](self->_collectionView, "addSubview:", self->_leftShadowView);
  v22 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("CreditCardShadowRight"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (UIImageView *)objc_msgSend(v22, "initWithImage:", v23);
  rightShadowView = self->_rightShadowView;
  self->_rightShadowView = v24;

  -[UICollectionView addSubview:](self->_collectionView, "addSubview:", self->_rightShadowView);
  -[SFCreditCardFillingViewController setView:](self, "setView:", self->_collectionView);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__cardDataChanged_, *MEMORY[0x1E0D8AF78], 0);

}

id __45__SFCreditCardFillingViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
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
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 1)
  {
    +[SFScanningCreditCardCollectionViewCell desiredCellWidth](SFScanningCreditCardCollectionViewCell, "desiredCellWidth", v5);
    v7 = fmax(v6, *(double *)(*(_QWORD *)(a1 + 32) + 1008));
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "container", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentSize");
    objc_msgSend(v8, "_calculateCellWidthForCollectionViewWidth:");
    v7 = v10;

  }
  v11 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeWithWidthDimension:heightDimension:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3350];
  v34[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "horizontalGroupWithLayoutSize:subitems:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "count");
  if (a2 == 1 && v24)
  {
    v25 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 24.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v28, CFSTR("SFCreditCardSeparator"), 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBoundarySupplementaryItems:", v30);

  }
  return v23;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFCreditCardFillingViewController;
  -[SFCreditCardFillingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFCreditCardFillingViewController _loadCardData](self, "_loadCardData");
}

- (void)_loadCardData
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SFCreditCardFillingViewController__loadCardData__block_invoke;
  v3[3] = &unk_1E4AC03A0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "getCreditCardDataWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__SFCreditCardFillingViewController__loadCardData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SFCreditCardFillingViewController__loadCardData__block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __50__SFCreditCardFillingViewController__loadCardData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_filterObjectsUsingBlock:", &__block_literal_global_19);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = (void *)v2;
    else
      v4 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong(WeakRetained + 121, v4);
    objc_msgSend(WeakRetained[122], "reloadData");
    objc_msgSend(WeakRetained, "_scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased");

  }
}

uint64_t __50__SFCreditCardFillingViewController__loadCardData__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldHide") ^ 1;
}

- (void)_scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased
{
  void *v3;
  void *v4;
  NSArray *creditCards;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  -[SFCreditCardFillingViewController formAutocompleteState](self, "formAutocompleteState");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    creditCards = self->_creditCards;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__SFCreditCardFillingViewController__scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased__block_invoke;
    v12[3] = &unk_1E4AC2830;
    v13 = v3;
    v6 = -[NSArray indexOfObjectPassingTest:](creditCards, "indexOfObjectPassingTest:", v12);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:", 0);
    }
    else
    {
      v7 = v6;
      -[NSArray objectAtIndexedSubscript:](self->_creditCards, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isCardBalanceZeroOrNegative");

      if ((v9 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 16, 1);
        objc_msgSend(v11, "setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:", 0);

      }
    }

  }
}

uint64_t __98__SFCreditCardFillingViewController__scrollToPreviouslySelectedEmptyVirtualCardIfBalanceIncreased__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "balance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v3, "hasSameCreditCardInformationAs:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

- (void)viewDidLayoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UICollectionView *collectionView;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v31.receiver = self;
  v31.super_class = (Class)SFCreditCardFillingViewController;
  -[SFCreditCardFillingViewController viewDidLayoutSubviews](&v31, sel_viewDidLayoutSubviews);
  -[UICollectionView contentSize](self->_collectionView, "contentSize");
  v4 = v3;
  -[UICollectionView bounds](self->_collectionView, "bounds");
  v6 = v5;
  -[UICollectionView superview](self->_collectionView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v10 = -2.0;
  if (v9 >= 52.0)
    v10 = 5.0;
  v11 = 0.0;
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", 0.0, v10, v6, 47.0);
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (v4 <= v6)
  {
    _SFRoundFloatToPixels();
    v11 = v18;
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v13, v11, v15, v17);
  collectionView = self->_collectionView;
  if (v6 <= 450.0)
  {
    -[UICollectionView _setContinuousCornerRadius:](collectionView, "_setContinuousCornerRadius:", 0.0);
    -[UIImageView setAlpha:](self->_leftShadowView, "setAlpha:", 0.0);
    -[UIImageView setAlpha:](self->_rightShadowView, "setAlpha:", 0.0);
  }
  else
  {
    -[UICollectionView _setContinuousCornerRadius:](collectionView, "_setContinuousCornerRadius:", 12.0);
    -[UIImageView image](self->_leftShadowView, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;
    v24 = v23;

    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    SFChromeVisibilityForScrollDistance();
    -[UIImageView setAlpha:](self->_leftShadowView, "setAlpha:");
    -[UICollectionView bounds](self->_collectionView, "bounds");
    -[UIImageView setFrame:](self->_leftShadowView, "setFrame:", CGRectGetMinX(v32), 0.0, v22, v24);
    -[UIImageView image](self->_rightShadowView, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v27 = v26;
    v29 = v28;

    -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
    SFChromeVisibilityForScrollDistance();
    -[UIImageView setAlpha:](self->_rightShadowView, "setAlpha:", 1.0 - v30);
    -[UICollectionView bounds](self->_collectionView, "bounds");
    -[UIImageView setFrame:](self->_rightShadowView, "setFrame:", v6 + CGRectGetMinX(v33) - v27, 0.0, v27, v29);
  }
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return 52.0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  if (v9 == 1)
  {
    +[SFScanningCreditCardCollectionViewCell reuseIdentifier](SFScanningCreditCardCollectionViewCell, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v9)
  {
    +[SFCreditCardCollectionViewCell reuseIdentifier](SFCreditCardCollectionViewCell, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_creditCards, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureViewWithCardData:", v11);
LABEL_5:

  }
  return v4;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SFCreditCardSeparator reuseIdentifier](SFCreditCardSeparator, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  NSArray *creditCards;
  _BOOL4 v4;
  int64_t v5;

  creditCards = self->_creditCards;
  v4 = +[_SFCreditCardCaptureViewController canCapture](_SFCreditCardCaptureViewController, "canCapture", a3);
  v5 = 1;
  if (creditCards)
    v5 = 2;
  if (v4)
    return v5;
  else
    return creditCards != 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[NSArray count](self->_creditCards, "count", a3);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_formAutocompleteState);
  v6 = objc_msgSend(v9, "section");
  if (v6 == 1)
  {
    objc_msgSend(WeakRetained, "captureCreditCardDataWithCameraAndFill");
  }
  else if (!v6)
  {
    -[NSArray objectAtIndexedSubscript:](self->_creditCards, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFTextSuggestion textSuggestionWithCreditCardData:](_SFTextSuggestion, "textSuggestionWithCreditCardData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "autoFillTextSuggestion:", v8);
  }

}

- (void)_cardDataChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SFCreditCardFillingViewController__cardDataChanged___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__SFCreditCardFillingViewController__cardDataChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadCardData");
}

- (SFFormAutocompleteState)formAutocompleteState
{
  return (SFFormAutocompleteState *)objc_loadWeakRetained((id *)&self->_formAutocompleteState);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_formAutocompleteState);
  objc_storeStrong((id *)&self->_rightShadowView, 0);
  objc_storeStrong((id *)&self->_leftShadowView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_creditCards, 0);
}

@end
