@implementation GKDashboardCollectionViewController

- (GKDashboardCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  GKDashboardCollectionViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKDashboardCollectionViewController;
  v4 = -[GKLoadingViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardCollectionViewController;
  -[GKDashboardCollectionViewController dealloc](&v4, sel_dealloc);
}

- (void)setToHorizontalLayout:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;

  v3 = a3;
  v5 = (id)-[GKDashboardCollectionViewController view](self, "view");
  if (v3)
    -[GKDashboardCollectionViewController horizontalCollectionViewLayout](self, "horizontalCollectionViewLayout");
  else
    -[GKDashboardCollectionViewController verticalCollectionViewLayout](self, "verticalCollectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v6);

  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", v3 ^ 1);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", v3);
  if (self->_dataSource)
    -[GKDashboardCollectionViewController setupDataSource](self, "setupDataSource");
}

- (id)horizontalCollectionViewLayout
{
  GKCollectionHorizontalLayout *v2;

  v2 = objc_alloc_init(GKCollectionHorizontalLayout);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v2, "setMinimumLineSpacing:", 0.0);
  return v2;
}

- (id)verticalCollectionViewLayout
{
  return objc_alloc_init(GKCollectionGridLayout);
}

- (void)loadView
{
  void *v3;
  UICollectionView *collectionView;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  -[GKDashboardCollectionViewController nibName](self, "nibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)GKDashboardCollectionViewController;
    -[GKDashboardCollectionViewController loadView](&v10, sel_loadView);
    collectionView = self->_collectionView;
    if (collectionView)
      goto LABEL_6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionContainerView);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&self->_collectionContainerView);
      -[GKDashboardCollectionViewController createCollectionViewInsideView:](self, "createCollectionViewInsideView:", v6);

    }
    collectionView = self->_collectionView;
    if (collectionView)
    {
LABEL_6:
      -[UICollectionView collectionViewLayout](collectionView, "collectionViewLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[GKDashboardCollectionViewController setToHorizontalLayout:](self, "setToHorizontalLayout:", 0);
    }
    -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 0);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v9, "setBackgroundColor:", 0);
    objc_msgSend(v9, "setOpaque:", 0);
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    -[GKDashboardCollectionViewController setView:](self, "setView:", v9);
    -[GKDashboardCollectionViewController createCollectionViewInsideView:](self, "createCollectionViewInsideView:", v9);

  }
}

- (void)createCollectionViewInsideView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GKCollectionGridLayout *v9;

  v4 = a3;
  v9 = objc_alloc_init(GKCollectionGridLayout);
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[GKDashboardCollectionViewController setCollectionView:](self, "setCollectionView:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);

  -[UICollectionView setOpaque:](self->_collectionView, "setOpaque:", 0);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v4, "addSubview:", self->_collectionView);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_collectionView, v4, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", v8);

}

- (void)viewDidLoad
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardCollectionViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->_collectionView)
  {
    v8[0] = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v3);

  }
  -[GKDashboardCollectionViewController setupDataSource](self, "setupDataSource");
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
  objc_msgSend(WeakRetained, "constant");
  -[GKDashboardCollectionViewController setKeyboardConstraintDefaultConstant:](self, "setKeyboardConstraintDefaultConstant:");

  v5 = objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);
  if (!v5)
    -[GKDashboardCollectionViewController setKeyboardAdjustedView:](self, "setKeyboardAdjustedView:", self->_collectionView);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardCollectionViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v6, 15);

  -[GKDashboardCollectionViewController prepareForAutomaticTwoColumnLayout](self, "prepareForAutomaticTwoColumnLayout");
  -[GKDashboardCollectionViewController setupVisualEffect](self, "setupVisualEffect");
}

- (void)setupVisualEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundEffects:", v3);

  objc_msgSend(v7, "_setGroupName:", CFSTR("gameLayerGroup"));
  -[GKDashboardCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v7, 0);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[GKDashboardCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v7, v6);

}

- (void)prepareForAutomaticTwoColumnLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (self->_autoWidthUsesTwoColumnsWhenSpace)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
    {
      v5 = 1;
    }
    else
    {
      -[GKDashboardCollectionViewController traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "verticalSizeClass") == 1)
        v5 = 2;
      else
        v5 = 1;

    }
    -[GKDashboardCollectionViewController setAutoWidthColumns:](self, "setAutoWidthColumns:", v5);
  }
}

- (id)preferredFocusEnvironments
{
  UICollectionView *collectionView;
  UICollectionView *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  collectionView = self->_collectionView;
  if (collectionView)
  {
    v3 = collectionView;
  }
  else
  {
    -[GKDashboardCollectionViewController view](self, "view");
    v3 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return MEMORY[0x1E0C9AA60];
  }
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardCollectionViewController;
  -[GKDashboardCollectionViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKDashboardCollectionViewController prepareForAutomaticTwoColumnLayout](self, "prepareForAutomaticTwoColumnLayout");
}

- (void)setDataSource:(id)a3
{
  GKCollectionDataSource *v5;
  GKCollectionDataSource *dataSource;
  GKCollectionDataSource *v7;

  v5 = (GKCollectionDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    v7 = v5;
    -[GKCollectionDataSource setPresentationViewController:](dataSource, "setPresentationViewController:", 0);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[GKDashboardCollectionViewController setupDataSource](self, "setupDataSource");
    v5 = v7;
  }

}

- (void)setupDataSource
{
  GKCollectionDataSource *dataSource;

  dataSource = self->_dataSource;
  if (dataSource)
  {
    -[GKCollectionDataSource setupCollectionView:](dataSource, "setupCollectionView:", self->_collectionView);
    -[GKCollectionDataSource setPresentationViewController:](self->_dataSource, "setPresentationViewController:", self);
  }
  else
  {
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardCollectionViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[GKLoadingViewController loadingState](self, "loadingState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("Initial"))
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));

}

- (void)viewDidAppear:(BOOL)a3
{
  __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardCollectionViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[GKLoadingViewController loadingState](self, "loadingState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("Initial"))
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadingState"));
  -[GKDashboardCollectionViewController clearSelection](self, "clearSelection");
  -[GKDashboardCollectionViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  if (!-[GKDashboardCollectionViewController isLoading](self, "isLoading", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView reloadSections:](self->_collectionView, "reloadSections:", v4);

  }
}

- (void)setAutoWidthUsesTwoColumnsWhenSpace:(BOOL)a3
{
  self->_autoWidthUsesTwoColumnsWhenSpace = a3;
}

- (void)setAutoWidthColumns:(int64_t)a3
{
  id v5;
  id v6;

  v5 = (id)-[GKDashboardCollectionViewController view](self, "view");
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAutoWidthColumns:", a3);

}

- (BOOL)isLoading
{
  __CFString *v2;
  BOOL v3;

  -[GKLoadingViewController loadingState](self, "loadingState");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (v2)
  {
    if (v2 != CFSTR("Initial") && v2 != CFSTR("LoadingState"))
      v3 = v2 == CFSTR("RefreshingState");
  }

  return v3;
}

- (void)didEnterLoadingState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardCollectionViewController;
  -[GKLoadingViewController didEnterLoadingState](&v3, sel_didEnterLoadingState);
  -[GKDashboardCollectionViewController loadData](self, "loadData");
}

- (void)setNeedsRefresh
{
  _QWORD block[5];

  if (!-[GKDashboardCollectionViewController isLoading](self, "isLoading"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke()
{
  dispatch_time_t v0;

  gk_dispatch_debounce();
  v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_19);
}

uint64_t __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLoading");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", CFSTR("RefreshingState"));
  return result;
}

uint64_t __54__GKDashboardCollectionViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (void)loadData
{
  GKCollectionDataSource *dataSource;
  _QWORD v3[5];

  dataSource = self->_dataSource;
  if (dataSource)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__GKDashboardCollectionViewController_loadData__block_invoke;
    v3[3] = &unk_1E59C5DA0;
    v3[4] = self;
    -[GKCollectionDataSource loadDataWithCompletionHandler:](dataSource, "loadDataWithCompletionHandler:", v3);
  }
  else
  {
    -[GKDashboardCollectionViewController dataUpdated:withError:](self, "dataUpdated:withError:", 1, 0);
  }
}

uint64_t __47__GKDashboardCollectionViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataUpdated:withError:", a2, a3);
}

- (BOOL)hasData
{
  return -[GKCollectionDataSource itemCount](self->_dataSource, "itemCount") > 0;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  NSMutableIndexSet *sectionsToReload;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if (-[GKDashboardCollectionViewController hasData](self, "hasData"))
  {
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("LoadedState"));
    -[GKDashboardCollectionViewController hideNoContentPlaceholder](self, "hideNoContentPlaceholder");
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    -[GKLoadingViewController setLoadingState:](self, "setLoadingState:", CFSTR("NoContentState"));
    -[GKDashboardCollectionViewController showNoContentPlaceholderForError:](self, "showNoContentPlaceholderForError:", v8);
    if (!v4)
      goto LABEL_10;
  }
  sectionsToReload = self->_sectionsToReload;
  if (sectionsToReload && -[NSMutableIndexSet count](sectionsToReload, "count"))
  {
    -[UICollectionView reloadSections:](self->_collectionView, "reloadSections:", self->_sectionsToReload);
    -[NSMutableIndexSet removeAllIndexes](self->_sectionsToReload, "removeAllIndexes");
  }
  else
  {
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
  -[GKDashboardCollectionViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  -[GKDashboardCollectionViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsFocusUpdate");

LABEL_10:
}

- (void)showNoContentPlaceholderForError:(id)a3
{
  id v4;
  UICollectionView *collectionView;
  GKNoContentView *noContentView;
  GKNoContentView *v7;
  GKNoContentView *v8;
  void *v9;
  void *v10;
  GKNoContentView *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UICollectionView setHidden:](collectionView, "setHidden:", 1);
    noContentView = self->_noContentView;
    if (!noContentView)
    {
      v7 = [GKNoContentView alloc];
      -[UICollectionView bounds](self->_collectionView, "bounds");
      v8 = -[GKNoContentView initWithFrame:](v7, "initWithFrame:");
      -[GKDashboardCollectionViewController setNoContentView:](self, "setNoContentView:", v8);

      -[GKNoContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_noContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UICollectionView superview](self->_collectionView, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSubview:aboveSubview:", self->_noContentView, self->_collectionView);
      objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_noContentView, self->_collectionView, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addConstraints:", v10);

      v11 = self->_noContentView;
      v13[0] = self->_collectionView;
      v13[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLoadingViewController setViewsToHideWhileLoading:](self, "setViewsToHideWhileLoading:", v12);

      noContentView = self->_noContentView;
    }
    -[GKDashboardCollectionViewController setupNoContentView:withError:](self, "setupNoContentView:withError:", noContentView, v4);
    -[GKNoContentView setHidden:](self->_noContentView, "setHidden:", 0);
  }

}

- (void)hideNoContentPlaceholder
{
  -[GKNoContentView setHidden:](self->_noContentView, "setHidden:", 1);
  -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 0);
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v6);

  if (a4)
  {
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMessage:", v8);

  }
  else
  {
    objc_msgSend(v9, "setMessage:", 0);
  }

}

- (void)clearSelection
{
  -[GKDashboardCollectionViewController clearSelectionForCollectionView:](self, "clearSelectionForCollectionView:", self->_collectionView);
}

- (void)clearSelectionForCollectionView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)popoverDidClose:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObserver:name:object:", self, v7, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GKDashboardCollectionViewController_popoverDidClose___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __55__GKDashboardCollectionViewController_popoverDidClose___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearSelection");
}

- (void)windowDidEndSheet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObserver:name:object:", self, v7, 0);
  -[GKDashboardCollectionViewController clearSelection](self, "clearSelection");
}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
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
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  double MaxY;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  double v66;
  CGRect v67;
  CGRect v68;

  v4 = a3;
  -[GKDashboardCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      -[GKDashboardCollectionViewController popoverPresentationController](self, "popoverPresentationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

      }
      else
      {
        -[GKDashboardCollectionViewController navigationController](self, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "popoverPresentationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_7;
        objc_msgSend(v4, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CGRectValue");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;

        objc_msgSend(v6, "convertRect:fromWindow:", 0, v14, v16, v18, v20);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        if (*MEMORY[0x1E0D253F8])
        {
          objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "userInterfaceIdiom");

          if (v30 == 1 && v24 == v16)
          {
            objc_msgSend(v6, "screen");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "bounds");
            v33 = v32;
            objc_msgSend(v31, "bounds");
            if (v33 <= v34)
            {
              objc_msgSend(v31, "bounds");
              v40 = v39;
              objc_msgSend(v6, "bounds");
              v38 = (v40 + v41) * 0.5;
            }
            else
            {
              objc_msgSend(v6, "bounds");
              v36 = v35;
              objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v37, "isStatusBarHidden"))
              {
                v38 = v36 + 0.0;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "statusBarHeight");
                v38 = v36 + v43;

              }
            }
            objc_msgSend(v6, "bounds");
            v24 = v44 - (v38 - v16);

          }
        }
        objc_msgSend(v5, "convertRect:fromView:", 0, v22, v24, v26, v28);
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v53 = objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);
        v54 = v53;
        if (v53)
          v55 = v53;
        else
          v55 = v5;
        v56 = v55;

        objc_msgSend(v56, "frame");
        MaxY = CGRectGetMaxY(v67);
        v68.origin.x = v46;
        v68.origin.y = v48;
        v68.size.width = v50;
        v68.size.height = v52;
        v58 = MaxY - CGRectGetMinY(v68);
        if (v58 >= 0.0)
          v59 = v58;
        else
          v59 = 0.0;
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "doubleValue");
        v62 = v61;

        v63 = (void *)MEMORY[0x1E0DC3F10];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __56__GKDashboardCollectionViewController_keyboardWillShow___block_invoke;
        v64[3] = &unk_1E59C5150;
        v64[4] = self;
        v66 = v59;
        v65 = v5;
        objc_msgSend(v63, "animateWithDuration:delay:options:animations:completion:", 0x10000, v64, 0, v62, 0.0);

      }
    }
  }
LABEL_7:

}

uint64_t __56__GKDashboardCollectionViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyboardConstraintDefaultConstant");
  v3 = v2 + *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "keyboardConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (void)keyboardWillHide:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double keyboardConstraintDefaultConstant;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardConstraint);
  objc_msgSend(WeakRetained, "constant");
  v6 = v5;
  keyboardConstraintDefaultConstant = self->_keyboardConstraintDefaultConstant;

  if (v6 != keyboardConstraintDefaultConstant)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__GKDashboardCollectionViewController_keyboardWillHide___block_invoke;
    v8[3] = &unk_1E59C4148;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
  }
}

void __56__GKDashboardCollectionViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(double *)(v1 + 1056);
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 1048));
  objc_msgSend(WeakRetained, "setConstant:", v2);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  GKCollectionDataSource *dataSource;

  dataSource = self->_dataSource;
  if (dataSource)
    return -[GKCollectionDataSource numberOfSectionsInCollectionView:](dataSource, "numberOfSectionsInCollectionView:", a3);
  else
    return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result;

  result = (int64_t)self->_dataSource;
  if (result)
    return objc_msgSend((id)result, "collectionView:numberOfItemsInSection:", a3, a4);
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  GKCollectionDataSource *dataSource;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  dataSource = self->_dataSource;
  if (dataSource)
  {
    -[GKCollectionDataSource collectionView:cellForItemAtIndexPath:](dataSource, "collectionView:cellForItemAtIndexPath:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No datasource. Subclass needs to override collectionView:cellForItemAtIndexPath:"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardCollectionViewController.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v7, "-[GKDashboardCollectionViewController collectionView:cellForItemAtIndexPath:]", objc_msgSend(v9, "UTF8String"), 547);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
    v5 = 0;
  }
  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  GKCollectionDataSource *dataSource;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  dataSource = self->_dataSource;
  if (dataSource)
  {
    -[GKCollectionDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:](dataSource, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No datasource. Subclass needs to override collectionView:viewForSupplementaryElementOfKind:atIndexPath:"), a4, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardCollectionViewController.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v8, "-[GKDashboardCollectionViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v10, "UTF8String"), 559);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
    v6 = 0;
  }
  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionDataSource collectionView:layout:sizeForItemAtIndexPath:](self->_dataSource, "collectionView:layout:sizeForItemAtIndexPath:", v8, v9, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
    objc_msgSend(v9, "itemSize");
  }
  v13 = v11;
  v14 = v12;
LABEL_7:

  v15 = v13;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionDataSource collectionView:layout:referenceSizeForHeaderInSection:](self->_dataSource, "collectionView:layout:referenceSizeForHeaderInSection:", v8, v9, a5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
    objc_msgSend(v9, "headerReferenceSize");
  }
  v12 = v10;
  v13 = v11;
LABEL_7:

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GKCollectionDataSource collectionView:layout:referenceSizeForFooterInSection:](self->_dataSource, "collectionView:layout:referenceSizeForFooterInSection:", v8, v9, a5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_7;
    }
    objc_msgSend(v9, "footerReferenceSize");
  }
  v12 = v10;
  v13 = v11;
LABEL_7:

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = -[GKCollectionDataSource collectionView:shouldSelectItemAtIndexPath:](self->_dataSource, "collectionView:shouldSelectItemAtIndexPath:", v6, v7);
  else
    v8 = 1;

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = -[GKCollectionDataSource collectionView:shouldDeselectItemAtIndexPath:](self->_dataSource, "collectionView:shouldDeselectItemAtIndexPath:", v6, v7);
  else
    v8 = 1;

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[GKCollectionDataSource collectionView:didSelectItemAtIndexPath:](self->_dataSource, "collectionView:didSelectItemAtIndexPath:", a3, a4);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  -[GKCollectionDataSource collectionView:didDeselectItemAtIndexPath:](self->_dataSource, "collectionView:didDeselectItemAtIndexPath:", a3, a4);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GKCollectionDataSource collectionView:willDisplayCell:forItemAtIndexPath:](self->_dataSource, "collectionView:willDisplayCell:forItemAtIndexPath:", v10, v8, v9);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  GKCollectionDataSource *dataSource;

  dataSource = self->_dataSource;
  return !dataSource
      || -[GKCollectionDataSource collectionView:canFocusItemAtIndexPath:](dataSource, "collectionView:canFocusItemAtIndexPath:", a3, a4);
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  id v6;
  GKCollectionDataSource *dataSource;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v6 = a4;
  dataSource = self->_dataSource;
  v12 = v6;
  if (dataSource)
  {
    -[GKCollectionDataSource collectionView:didUnfocusItemAtIndexPath:](dataSource, "collectionView:didUnfocusItemAtIndexPath:", a3, v6);
  }
  else
  {
    objc_msgSend(a3, "_gkFocusingLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "focusedIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v12);

      if (v11)
        objc_msgSend(v9, "setFocusedIndexPath:", 0);
    }

  }
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  id v6;
  GKCollectionDataSource *dataSource;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v6 = a4;
  dataSource = self->_dataSource;
  v12 = v6;
  if (dataSource)
  {
    -[GKCollectionDataSource collectionView:didFocusItemAtIndexPath:](dataSource, "collectionView:didFocusItemAtIndexPath:", a3, v6);
  }
  else
  {
    objc_msgSend(a3, "_gkFocusingLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "focusedIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v12);

      if ((v11 & 1) == 0)
        objc_msgSend(v9, "setFocusedIndexPath:", v12);
    }

  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[GKDashboardCollectionViewController viewDidAppear:](self, "viewDidAppear:", 1);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (GKCollectionDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)autoWidthUsesTwoColumnsWhenSpace
{
  return self->_autoWidthUsesTwoColumnsWhenSpace;
}

- (NSMutableIndexSet)sectionsToReload
{
  return self->_sectionsToReload;
}

- (void)setSectionsToReload:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsToReload, a3);
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (UIEdgeInsets)contentInsetsBeforeKeyboard
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsetsBeforeKeyboard.top;
  left = self->_contentInsetsBeforeKeyboard.left;
  bottom = self->_contentInsetsBeforeKeyboard.bottom;
  right = self->_contentInsetsBeforeKeyboard.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_contentInsetsBeforeKeyboard = a3;
}

- (UIEdgeInsets)scrollInsetsBeforeKeyboard
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollInsetsBeforeKeyboard.top;
  left = self->_scrollInsetsBeforeKeyboard.left;
  bottom = self->_scrollInsetsBeforeKeyboard.bottom;
  right = self->_scrollInsetsBeforeKeyboard.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setScrollInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_scrollInsetsBeforeKeyboard = a3;
}

- (NSLayoutConstraint)keyboardConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_keyboardConstraint);
}

- (void)setKeyboardConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardConstraint, a3);
}

- (double)keyboardConstraintDefaultConstant
{
  return self->_keyboardConstraintDefaultConstant;
}

- (void)setKeyboardConstraintDefaultConstant:(double)a3
{
  self->_keyboardConstraintDefaultConstant = a3;
}

- (UIView)keyboardAdjustedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_keyboardAdjustedView);
}

- (void)setKeyboardAdjustedView:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardAdjustedView, a3);
}

- (UIView)collectionContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_collectionContainerView);
}

- (void)setCollectionContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionContainerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionContainerView);
  objc_destroyWeak((id *)&self->_keyboardAdjustedView);
  objc_destroyWeak((id *)&self->_keyboardConstraint);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_sectionsToReload, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
