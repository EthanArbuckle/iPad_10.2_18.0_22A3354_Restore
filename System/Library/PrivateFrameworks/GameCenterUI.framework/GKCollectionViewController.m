@implementation GKCollectionViewController

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (GKCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v5;
  GKCollectionViewController *v6;
  GKLoadableContentStateMachine *v7;
  GKLoadableContentStateMachine *loadingMachine;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *batchUpdateQueue;
  id v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCollectionViewController;
  v6 = -[GKCollectionViewController initWithCollectionViewLayout:](&v15, sel_initWithCollectionViewLayout_, v5);
  if (v6)
  {
    v7 = objc_alloc_init(GKLoadableContentStateMachine);
    loadingMachine = v6->_loadingMachine;
    v6->_loadingMachine = v7;

    -[_GKStateMachine setDelegate:](v6->_loadingMachine, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_defaultLayout, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.GameKit.GKCollectionView.batchUpdateQueue", v9);
    batchUpdateQueue = v6->_batchUpdateQueue;
    v6->_batchUpdateQueue = (OS_dispatch_queue *)v10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v5;
      objc_msgSend(v12, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("ColumnDivider"));

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewController setReusableViewsIHaveSeen:](v6, "setReusableViewsIHaveSeen:", v13);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController dealloc](&v4, sel_dealloc);
}

+ (id)_initializeSafeCategoryFromValidationManager
{
  return CFSTR("WTF");
}

- (id)_gkRecursiveDescription
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  -[GKCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v12.receiver = self;
    v12.super_class = (Class)GKCollectionViewController;
    -[GKCollectionViewController description](&v12, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_gkDescriptionWithChildren:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GKCollectionViewController;
    -[GKCollectionViewController description](&v11, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)collectionView
{
  objc_super v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4.receiver = self;
  v4.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController collectionView](&v4, sel_collectionView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController loadView](&v5, sel_loadView);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  GKSwipeToEditStateMachine *v6;
  GKSwipeToEditStateMachine *swipeStateMachine;
  void *v8;
  uint64_t v9;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[GKCollectionViewController configureDataSource](self, "configureDataSource");
  -[GKCollectionViewController configureViewFactories](self, "configureViewFactories");
  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setDelegate:", self);
  -[GKCollectionViewController colorPalette](self, "colorPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v6 = -[GKSwipeToEditStateMachine initWithCollectionView:]([GKSwipeToEditStateMachine alloc], "initWithCollectionView:", v3);
  swipeStateMachine = self->_swipeStateMachine;
  self->_swipeStateMachine = v6;

  if (*MEMORY[0x1E0D253F8])
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      -[GKCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scrollIndicatorInsets");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      -[GKCollectionViewController collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setScrollIndicatorInsets:", v12, v14, v16 + 5.0, v18);

    }
  }
  if (!self->_skipLoadAfterViewDidLoad)
    -[GKCollectionViewController loadDataWithCompletionHandlerAndError:](self, "loadDataWithCompletionHandlerAndError:", 0);
  -[GKCollectionViewController setPreviousOrientation:](self, "setPreviousOrientation:", -[GKCollectionViewController interfaceOrientation](self, "interfaceOrientation"));

}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[GKCollectionViewController updateLayoutGuideOffsets](self, "updateLayoutGuideOffsets");
}

- (void)updateLayoutGuideOffsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;

  -[GKCollectionViewController defaultLayout](self, "defaultLayout");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v39;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v39;
    -[GKCollectionViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_contentMargin");
    v13 = v12;

    if (v13 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      if (v15 != 1 || (v13 = 20.0, *MEMORY[0x1E0D253F8]) && !*MEMORY[0x1E0D25B68])
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "userInterfaceIdiom");

        v13 = 15.0;
        if (!v17)
        {
          if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v18, "bounds"),
                v20 = v19,
                v22 = v21,
                v18,
                v20 >= 414.0)
            && v22 >= 736.0
            || (v22 >= 414.0 ? (v23 = v20 < 736.0) : (v23 = 1), !v23))
          {
            v13 = 20.0;
          }
        }
      }
    }
    v24 = v5 + v13;
    v25 = v7 + v13;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    if (!v27)
    {
      if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v28, "bounds"),
            v30 = v29,
            v32 = v31,
            v28,
            v30 >= 414.0)
        && v32 >= 736.0
        || v30 >= 736.0 && v32 >= 414.0)
      {
        -[GKCollectionViewController traitCollection](self, "traitCollection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "horizontalSizeClass");

        v35 = 84.0 - v13;
        if (v34 != 2)
          v35 = -0.0;
        v24 = v24 + v35;
        v25 = v25 + v35;
      }
    }
    objc_msgSend(v10, "leftLayoutGuideOffset");
    if (v24 != v36 || (objc_msgSend(v10, "rightLayoutGuideOffset"), v25 != v37))
    {
      objc_msgSend(v10, "setLeftLayoutGuideOffset:", v24);
      objc_msgSend(v10, "setRightLayoutGuideOffset:", v25);
      -[GKCollectionViewController collectionView](self, "collectionView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "performBatchUpdates:completion:", 0, 0);

    }
    v9 = v39;
  }

}

- (id)nearestSelectableIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (!v4)
    goto LABEL_13;
  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");
  if (v6 < 1)
  {

LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v7 = v6;
  v8 = 0;
  for (i = 0; i != v7; ++i)
  {
    v10 = objc_msgSend(v5, "numberOfItemsInSection:", i);
    if (v10 >= 1)
    {
      v11 = v10;
      v12 = 1;
      do
      {
        v13 = v8;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12 - 1, i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 - 1 >= objc_msgSend(v4, "item"))
          break;
      }
      while (v12++ < v11);
    }
    if (i >= objc_msgSend(v4, "section"))
      break;
  }

  if (!v8)
    goto LABEL_13;
LABEL_14:

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  double v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  CATransform3D v26;
  CATransform3D v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewWillAppear:](&v28, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    v11 = v8 < 414.0 || v10 < 736.0;
    if (!v11 || v8 >= 736.0 && v10 >= 414.0)
    {
      -[GKCollectionViewController colorPalette](self, "colorPalette");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v13);

    }
  }
  self->_didSlideIn = 0;
  -[GKCollectionViewController dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKCollectionViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionViewWillBecomeActive:", v16);

  }
  if (!self->_hasViewFactories)
    -[GKCollectionViewController configureViewFactories](self, "configureViewFactories");
  -[GKCollectionViewController setActive:](self, "setActive:", 1);
  if (-[GKCollectionViewController shouldSlideInContents](self, "shouldSlideInContents"))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
    -[GKCollectionViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    CATransform3DMakeTranslation(&v27, 0.0, 150.0, 0.0);
    v26 = v27;
    objc_msgSend(v18, "setSublayerTransform:", &v26);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v19 == CFSTR("NoContentState"))
  {
    -[GKCollectionViewController didEnterNoContentState](self, "didEnterNoContentState");
  }
  else
  {
    -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v20 == CFSTR("ErrorState"))
    {
      -[GKCollectionViewController didEnterErrorState](self, "didEnterErrorState");
    }
    else
    {
      v21 = 0.0;
      if (!-[GKCollectionViewController shouldSlideInContents](self, "shouldSlideInContents"))
      {
        v21 = 1.0;
        if (!-[GKCollectionViewController showSupplementaryViewsWhileLoading](self, "showSupplementaryViewsWhileLoading"))
        {
          if (-[GKCollectionViewController hasLoaded](self, "hasLoaded"))
            v21 = 1.0;
          else
            v21 = 0.0;
        }
      }
      -[GKCollectionViewController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", v21);

    }
  }
  if (self->_activeSearchBar)
    -[GKCollectionViewController searchBarSearchButtonClicked:](self, "searchBarSearchButtonClicked:");
  v23 = (unint64_t)(-[GKCollectionViewController interfaceOrientation](self, "interfaceOrientation") - 3) < 2;
  if (v23 != (unint64_t)(-[GKCollectionViewController previousOrientation](self, "previousOrientation") - 3) < 2)
  {
    -[GKCollectionViewController collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "collectionViewLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v25, "forceFullInvalidate");
    else
      objc_msgSend(v25, "invalidateLayout");

  }
  -[GKCollectionViewController updateLayoutGuideOffsets](self, "updateLayoutGuideOffsets");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[GKCollectionViewController startLoadingIndicator](self, "startLoadingIndicator");
  -[GKCollectionViewController invalidateSearch](self, "invalidateSearch");
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (self->_activeSearchBar)
    -[GKCollectionViewController searchBarSearchButtonClicked:](self, "searchBarSearchButtonClicked:");
  -[GKCollectionViewController setActive:](self, "setActive:", 0);
  -[GKCollectionViewController gkDataSource](self, "gkDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[GKCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionViewDidBecomeInactive:", v5);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewController;
  -[GKCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[GKCollectionViewController stopLoadingIndicatorWithoutAnimation](self, "stopLoadingIndicatorWithoutAnimation");
  -[GKSwipeToEditStateMachine viewDidDisappear:](self->_swipeStateMachine, "viewDidDisappear:", v3);
  -[GKCollectionViewController setPreviousOrientation:](self, "setPreviousOrientation:", -[GKCollectionViewController interfaceOrientation](self, "interfaceOrientation"));
  -[GKCollectionViewController hidePlaceholderAnimated:](self, "hidePlaceholderAnimated:", 0);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _QWORD v4[5];

  if (*MEMORY[0x1E0D253F8])
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __81__GKCollectionViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
    v4[3] = &unk_1E59C4148;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, a4);
  }
}

uint64_t __81__GKCollectionViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLayoutGuideOffsets");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GKCollectionViewController;
  v7 = a4;
  -[GKCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[GKCollectionViewController updateDynamicColumnCountsForViewSize:](self, "updateDynamicColumnCountsForViewSize:", width, height);
  -[GKCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateLayout");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__GKCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E59C4FB0;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __81__GKCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLayoutGuideOffsets");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewController;
  v4 = a3;
  -[GKCollectionViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[GKCollectionViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[GKCollectionViewController _systemContentSizeSettingDidChange](self, "_systemContentSizeSettingDidChange");
}

- (void)_systemContentSizeSettingDidChange
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke;
  v5[3] = &unk_1E59C4708;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBatchUpdates:completion:", v5, &__block_literal_global_127);

}

void __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "objectEnumerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      objc_msgSend(v3, "_gkEnumerateSubviewsUsingBlock:", &__block_literal_global_36);
      objc_msgSend(v6, "nextObject");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "numberOfSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "reloadSections:", v5);

}

void __64__GKCollectionViewController__systemContentSizeSettingDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC66488))
  {
    v2 = v3;
    objc_msgSend(v2, "replayAndApplyStyleWithSystemContentChange:", 1);
    objc_msgSend(v2, "_gkSetNeedsRender");

  }
}

- (BOOL)shouldSlideInContents
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  result = (v4 != 1 || (*MEMORY[0x1E0D253F8] ? (v5 = *MEMORY[0x1E0D25B68] == 0) : (v5 = 0), v5))
        && self->_shouldSlideInContents;
  return result;
}

- (void)configureViewFactories
{
  self->_hasViewFactories = 1;
}

- (void)setDataSource:(id)a3
{
  UICollectionViewDataSource *v5;
  id v6;
  uint64_t v7;
  UICollectionViewDataSource *dataSource;
  UICollectionViewDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UICollectionViewDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (UICollectionViewDataSource *)a3;
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController setDataSource:].cold.1(v7, self, v5);
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    v9 = dataSource;
    -[GKCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[GKCollectionViewController gkDataSource](self, "gkDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "collectionViewDidBecomeInactive:", v13);

    }
    objc_storeStrong((id *)&self->_dataSource, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = self->_dataSource;
      -[UICollectionViewDataSource setDelegate:](v14, "setDelegate:", self);
      -[GKCollectionViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[GKCollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewDataSource collectionViewWillBecomeActive:](v14, "collectionViewWillBecomeActive:", v17);

      }
      -[GKCollectionViewController collectionView](self, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewDataSource configureCollectionView:](v14, "configureCollectionView:", v18);

    }
    if (!self->_hasViewFactories)
      -[GKCollectionViewController configureViewFactories](self, "configureViewFactories");
    -[GKCollectionViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataSource:", v5);

    -[GKCollectionViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collectionViewLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v21, "forceFullInvalidate");
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UICollectionViewDataSource setDelegate:](v9, "setDelegate:", 0);

  }
}

- (id)gkDataSource
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[GKCollectionViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ([dataSource isKindOfClass:[GKCollectionViewDataSource class]])\n[%s (%s:%d)]"), v4, "-[GKCollectionViewController gkDataSource]", objc_msgSend(v6, "UTF8String"), 549);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
    }
  }
  return v2;
}

- (id)defaultColorPalette
{
  return (id)objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
}

- (GKColorPalette)colorPalette
{
  GKColorPalette *colorPalette;

  colorPalette = self->_colorPalette;
  if (colorPalette)
    return colorPalette;
  -[GKCollectionViewController defaultColorPalette](self, "defaultColorPalette");
  return (GKColorPalette *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  -[GKCollectionViewController setActiveSearchBar:](self, "setActiveSearchBar:", a3);
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setShowsCancelButton:animated:", 1, 0);
  objc_msgSend(v4, "_setAutoDisableCancelButton:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = v4;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "_clearButton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeTarget:action:forControlEvents:", self, sel_clearButtonPressed_, 64);
          objc_msgSend(v12, "addTarget:action:forEvents:", self, sel_clearButtonPressed_, 64);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "setClearButtonMode:", 1);
          objc_msgSend(v10, "_clearButton");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeTarget:action:forControlEvents:", self, sel_clearButtonPressed_, 64);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[GKCollectionViewController setCurrentSearchText:](self, "setCurrentSearchText:", a4);
}

- (void)clearButtonPressed:(id)a3
{
  objc_msgSend(a3, "removeTarget:action:forControlEvents:", self, sel_clearButtonPressed_, 64);
  if (self->_activeSearchBar)
    -[GKCollectionViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:");
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_setAutoDisableCancelButton:", 1);
  objc_msgSend(v4, "setShowsCancelButton:animated:", 0, 0);
  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "setText:", 0);

  -[GKCollectionViewController setCurrentSearchText:](self, "setCurrentSearchText:", 0);
  -[GKCollectionViewController setActiveSearchBar:](self, "setActiveSearchBar:", 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[GKCollectionViewController setCurrentSearchText:](self, "setCurrentSearchText:", v5);
}

- (id)currentSearchTerms
{
  void *v3;
  NSString *currentSearchText;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentSearchText = self->_currentSearchText;
  v5 = -[NSString length](currentSearchText, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__GKCollectionViewController_currentSearchTerms__block_invoke;
  v8[3] = &unk_1E59C5758;
  v6 = v3;
  v9 = v6;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](currentSearchText, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1027, v8);

  return v6;
}

uint64_t __48__GKCollectionViewController_currentSearchTerms__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)invalidateSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  -[GKCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[NSString length](self->_currentSearchText, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKCollectionViewController currentSearchTerms](self, "currentSearchTerms");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __46__GKCollectionViewController_invalidateSearch__block_invoke;
        v10[3] = &unk_1E59C77B0;
        v11 = v3;
        v12 = v7;
        v13 = v6;
        v8 = v6;
        v9 = v7;
        objc_msgSend(v11, "enumerateItemsAndIndexPathsUsingBlock:", v10);
        objc_msgSend(v5, "setVisibleIndexPathsFilter:", v8);

      }
      else
      {
        objc_msgSend(v5, "setVisibleIndexPathsFilter:", 0);
      }
    }
  }

}

void __46__GKCollectionViewController_invalidateSearch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  LODWORD(v5) = objc_msgSend(v5, "item:matchesSearchTerms:inSection:", v7, v6, objc_msgSend(v8, "section"));

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

}

- (void)setCurrentSearchText:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (-[NSString length](v5, "length"))
  {
    v4 = v5;
  }
  else
  {

    v4 = 0;
  }
  if (v4 != self->_currentSearchText)
  {
    v6 = v4;
    objc_storeStrong((id *)&self->_currentSearchText, v4);
    -[GKCollectionViewController invalidateSearch](self, "invalidateSearch");
    v4 = v6;
  }

}

- (void)setNeedsReload
{
  _QWORD block[5];

  if (-[GKCollectionViewController hasLoaded](self, "hasLoaded"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__GKCollectionViewController_setNeedsReload__block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __44__GKCollectionViewController_setNeedsReload__block_invoke()
{
  dispatch_time_t v0;

  gk_dispatch_debounce();
  v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_150);
}

uint64_t __44__GKCollectionViewController_setNeedsReload__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setCurrentState:", CFSTR("RefreshingState"));
  return objc_msgSend(*(id *)(a1 + 32), "loadDataWithCompletionHandlerAndError:", 0);
}

uint64_t __44__GKCollectionViewController_setNeedsReload__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (void)_gkSetContentsNeedUpdateWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKCollectionViewController setNeedsReload](self, "setNeedsReload");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)_finishUpdates:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __CFString **v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[GKCollectionViewController gkDataSource](self, "gkDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "numberOfSectionsInCollectionView:", v9);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (objc_msgSend(v8, "collectionView:numberOfItemsInSection:", v9, v12) < 1)
    {
      if (v11 == ++v12)
        goto LABEL_5;
    }
    v16 = GKLoadStateContentLoaded;
  }
  else
  {
LABEL_5:
    objc_msgSend(v6, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (!*MEMORY[0x1E0D25460])
        v14 = (id)GKOSLoggers();
      v15 = (void *)*MEMORY[0x1E0D25450];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
        -[GKCollectionViewController _finishUpdates:withCompletionHandler:].cold.1(v15, (uint64_t)self, (uint64_t)v6);
      v16 = &GKLoadStateError;
    }
    else
    {
      v16 = GKLoadStateNoContent;
    }
  }
  -[_GKStateMachine setCurrentState:](self->_loadingMachine, "setCurrentState:", *v16);
  if (v7)
  {
    objc_msgSend(v6, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);

  }
}

- (void)_applyUpdates:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  if (!self->_hasViewFactories)
    -[GKCollectionViewController configureViewFactories](self, "configureViewFactories");
  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("LoadingState"))
  {

  }
  else
  {
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

LABEL_9:
      -[GKCollectionViewController _finishUpdates:withCompletionHandler:](self, "_finishUpdates:withCompletionHandler:", v6, v7);
      objc_msgSend(v6, "applyUpdates");
      -[GKCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "performBatchUpdates:completion:", &__block_literal_global_151, 0);

      goto LABEL_10;
    }
    v11 = objc_msgSend(v6, "updateCount");

    if (!v11)
      goto LABEL_9;
  }
  -[GKCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E59C4148;
  v19 = v6;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E59C7818;
  v15[4] = self;
  v16 = v19;
  v17 = v7;
  objc_msgSend(v12, "performBatchUpdates:completion:", v18, v15);

LABEL_10:
}

uint64_t __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyUpdates");
}

uint64_t __66__GKCollectionViewController__applyUpdates_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishUpdates:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unsigned int v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__GKCollectionViewController_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v12[3] = &unk_1E59C6930;
  v15 = a3;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __81__GKCollectionViewController_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "gkDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewWillBecomeActive:", v3);

  objc_msgSend(*(id *)(a1 + 32), "gkDataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "currentState");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == CFSTR("Initial"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("currentState = %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (self->_loadingMachine.currentState != GKLoadStateInitial)\n[%s (%s:%d)]"), v7, "-[GKCollectionViewController refreshContentsForDataType:userInfo:updateNotifier:]_block_invoke", objc_msgSend(v9, "UTF8String"), 775);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "refreshContentsForDataType:userInfo:updateNotifier:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_loadDataWithCompletionHandlerAndError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D253F0], "updateGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke;
  v12[3] = &unk_1E59C68B8;
  v12[4] = self;
  objc_msgSend(v5, "perform:", v12);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke_2;
  v9[3] = &unk_1E59C6118;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v8, "join:", v9);

}

uint64_t __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshContentsForDataType:userInfo:updateNotifier:", 0, 0, a2);
}

uint64_t __69__GKCollectionViewController__loadDataWithCompletionHandlerAndError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyUpdates:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)loadDataWithCompletionHandlerAndError:(id)a3
{
  GKLoadableContentStateMachine *loadingMachine;
  __CFString *v5;
  __CFString **v6;
  id v7;

  loadingMachine = self->_loadingMachine;
  v7 = a3;
  -[_GKStateMachine currentState](loadingMachine, "currentState");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5 == CFSTR("Initial"))
    v6 = GKLoadStateLoadingContent;
  else
    v6 = GKLoadStateRefreshingContent;
  -[_GKStateMachine setCurrentState:](self->_loadingMachine, "setCurrentState:", *v6);

  -[GKCollectionViewController _loadDataWithCompletionHandlerAndError:](self, "_loadDataWithCompletionHandlerAndError:", v7);
}

- (void)_gkRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  unsigned int v14;

  v6 = a4;
  if (-[GKCollectionViewController hasLoaded](self, "hasLoaded"))
  {
    -[_GKStateMachine setCurrentState:](self->_loadingMachine, "setCurrentState:", CFSTR("RefreshingState"));
    objc_msgSend(MEMORY[0x1E0D253F0], "updateGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke;
    v12[3] = &unk_1E59C7840;
    v12[4] = self;
    v14 = a3;
    v13 = v6;
    objc_msgSend(v7, "perform:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke_2;
    v10[3] = &unk_1E59C4708;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    objc_msgSend(v9, "join:", v10);

  }
}

uint64_t __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshContentsForDataType:userInfo:updateNotifier:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __69__GKCollectionViewController__gkRefreshContentsForDataType_userInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyUpdates:withCompletionHandler:", *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)_gkShouldRefreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)dataSource:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:didInsertItemsAtIndexPaths:].cold.1(v9, self, v7);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertItemsAtIndexPaths:", v7);

}

- (void)dataSource:(id)a3 didRemoveItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:didRemoveItemsAtIndexPaths:].cold.1(v9, self, v7);
  -[GKSwipeToEditStateMachine trackedIndexPath](self->_swipeStateMachine, "trackedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          if (objc_msgSend(v10, "isEqual:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), (_QWORD)v17))
            -[_GKStateMachine setCurrentState:](self->_swipeStateMachine, "setCurrentState:", CFSTR("NothingState"));
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
  -[GKCollectionViewController collectionView](self, "collectionView", (_QWORD)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteItemsAtIndexPaths:", v7);

}

- (void)dataSource:(id)a3 didRefreshItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:didRefreshItemsAtIndexPaths:].cold.1(v9, self, v7);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadItemsAtIndexPaths:", v7);

}

- (void)dataSource:(id)a3 didInsertSections:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didInsertSections:].cold.1(v9, self, v7);
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    -[GKCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSections:", v7);

  }
LABEL_6:

}

- (void)dataSource:(id)a3 didRemoveSections:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  GKCollectionViewController *v18;

  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didRemoveSections:].cold.1(v9, self, v7);
    if (!v7)
      goto LABEL_8;
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  -[GKSwipeToEditStateMachine trackedIndexPath](self->_swipeStateMachine, "trackedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __59__GKCollectionViewController_dataSource_didRemoveSections___block_invoke;
    v16 = &unk_1E59C4820;
    v17 = v10;
    v18 = self;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", &v13);

  }
  -[GKCollectionViewController collectionView](self, "collectionView", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteSections:", v7);

LABEL_8:
}

uint64_t __59__GKCollectionViewController_dataSource_didRemoveSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "section");
  if (result == a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "setCurrentState:", CFSTR("NothingState"));
  return result;
}

- (void)dataSource:(id)a3 didMoveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  GKCollectionViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  v12 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    v19 = v12;
    -[GKCollectionViewController currentUpdateID](self, "currentUpdateID");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = &stru_1E59EB978;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("old: %@ \n new: %@"), v9, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v22;
    v26 = 2048;
    v27 = self;
    v28 = 2080;
    v29 = "-[GKCollectionViewController dataSource:didMoveItemAtIndexPath:toIndexPath:]";
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1AB361000, v19, OS_LOG_TYPE_DEBUG, "****** %@ - GKCVC - c:%p %s \n%@", buf, 0x2Au);

    if (!v9)
      goto LABEL_6;
  }
  else if (!v9)
  {
LABEL_6:
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (indexPath != ((void *)0) && newIndexPath != ((void *)0))\n[%s (%s:%d)]"), v14, "-[GKCollectionViewController dataSource:didMoveItemAtIndexPath:toIndexPath:]", objc_msgSend(v16, "UTF8String"), 882);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
    goto LABEL_7;
  }
  if (!v10)
    goto LABEL_6;
LABEL_7:
  -[GKCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moveItemAtIndexPath:toIndexPath:", v9, v10);

}

- (void)dataSource:(id)a3 didRefreshSections:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D25460])
    v8 = (id)GKOSLoggers();
  v9 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    -[GKCollectionViewController dataSource:didRefreshSections:].cold.1(v9, self, v7);
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    -[GKCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:", v7);

  }
LABEL_6:

}

- (void)dataSource:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  if (!*MEMORY[0x1E0D25460])
    v9 = (id)GKOSLoggers();
  v10 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:didMoveSection:toSection:].cold.1(v10, self, a4);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moveSection:toSection:", a4, a5);

}

- (void)dataSource:(id)a3 didUpdatePlaceholderVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (!*MEMORY[0x1E0D25460])
    v7 = (id)GKOSLoggers();
  v8 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:didUpdatePlaceholderVisibility:].cold.1(v8, self);
  -[GKCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setShowPlaceholder:", v4);

}

- (void)dataSourceDidReloadData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSourceDidReloadData:].cold.1(v6, self, v4);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)dataSourceDidMoveSectionsWithItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSourceDidMoveSectionsWithItems:].cold.1(v6, self, v4);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "prepareForMovingItemsCarryingSections");

}

- (void)dataSource:(id)a3 performBatchUpdate:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  GKCollectionViewController *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9 && v10)
    (*((void (**)(id))v10 + 2))(v10);
  v12 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  if (!*MEMORY[0x1E0D25460])
    v13 = (id)GKOSLoggers();
  v14 = *MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKCollectionViewController dataSource:performBatchUpdate:complete:].cold.1((uint64_t)v12, (uint64_t)self, v14);
  -[GKCollectionViewController batchUpdateQueue](self, "batchUpdateQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke;
  v19[3] = &unk_1E59C78E0;
  v20 = v12;
  v21 = self;
  v22 = v9;
  v23 = v11;
  v16 = v11;
  v17 = v9;
  v18 = v12;
  dispatch_async(v15, v19);

}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m", 937, "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchGroupWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_cold_1();
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v6 + 1120))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (self->_batchUpdateCount == 0)\n[%s (%s:%d)]"), v8, "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke", objc_msgSend(v10, "UTF8String"), 942);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
    v6 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(v6 + 1120) + 1;
  }
  else
  {
    v12 = 1;
  }
  *(_QWORD *)(v6 + 1120) = v12;
  objc_msgSend(*(id *)(a1 + 40), "setCurrentUpdateID:", *(_QWORD *)(a1 + 32));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_2;
  v14[3] = &unk_1E59C78B8;
  v13 = *(void **)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 40);
  v16 = v13;
  v15 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v4, "perform:", v14);
  objc_msgSend(v4, "wait");
  objc_msgSend(*(id *)(a1 + 40), "setCurrentUpdateID:", 0);
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120);

}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_3;
  block[3] = &unk_1E59C7890;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 56);
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_3(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a1[4], "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_4;
  v11[3] = &unk_1E59C4DA8;
  v12 = a1[6];
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5;
  v6[3] = &unk_1E59C7868;
  v4 = a1[5];
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[7];
  v10 = a1[8];
  objc_msgSend(v2, "performBatchUpdates:completion:", v11, v6);

}

uint64_t __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5_cold_1();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)didTouchShowMore:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__GKCollectionViewController_didTouchShowMore___block_invoke;
  v3[3] = &unk_1E59C5E50;
  v3[4] = self;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v3);
}

void __47__GKCollectionViewController_didTouchShowMore___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gkDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForUpdate:inDataSource:", 4, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "revealMoreForSectionIndex:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource:didRefreshItemsAtIndexPaths:", v5, v6);

  }
}

- (id)footerViewAboveShowMoreViewAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  GKCollectionViewController *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  v5 = objc_msgSend(v4, "item");
  v6 = objc_msgSend(v4, "section");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5 - 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__GKCollectionViewController_footerViewAboveShowMoreViewAtIndexPath___block_invoke;
  v17 = &unk_1E59C7908;
  v21 = &v22;
  v18 = self;
  v9 = v8;
  v19 = v9;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v9, "_gkPerformWithoutViewReuse:", &v14);
  if (objc_msgSend((id)v23[5], "isHidden", v14, v15, v16, v17, v18))
  {
    v11 = (void *)v23[5];
    v23[5] = 0;

  }
  v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __69__GKCollectionViewController_footerViewAboveShowMoreViewAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", *(_QWORD *)(a1 + 40), CFSTR("SectionFooter"), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (double)showMoreTextMarginAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxX;
  double MinX;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v4 = a3;
  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");
  v7 = objc_msgSend(v4, "section");
  v8 = 0.0;
  if (v6 < 1)
  {
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
  }
  else
  {
    v9 = v7;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    if (v7 < objc_msgSend(v5, "numberOfSections"))
    {
      -[GKCollectionViewController footerViewAboveShowMoreViewAtIndexPath:](self, "footerViewAboveShowMoreViewAtIndexPath:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_7;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_7;
      objc_msgSend(v17, "layoutIfNeeded");
      objc_msgSend(v17, "alignmentRectForText");
      v16 = v18;
      v15 = v19;
      v14 = v20;
      v13 = v21;
      objc_msgSend(v17, "bounds");
      v12 = v22;
      v11 = v23;
      v10 = v24;
      v8 = v25;
      if (v14 == 0.0)
      {
LABEL_7:
        objc_msgSend(v5, "collectionViewLayout");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "currentMaxVisibleItemCountForSection:", v9);

        if (v27 >= 1 && v27 <= objc_msgSend(v5, "numberOfItemsInSection:", v9))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v27 - 1, v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKCollectionViewController dataSource](self, "dataSource");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "collectionView:cellForItemAtIndexPath:", v5, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v30, "layoutIfNeeded");
            objc_msgSend(v30, "alignmentRectForText");
            v16 = v31;
            v15 = v32;
            v14 = v33;
            v13 = v34;
            objc_msgSend(v30, "bounds");
            v12 = v35;
            v11 = v36;
            v10 = v37;
            v8 = v38;
          }

        }
      }

    }
  }
  if (GKShouldLayoutRTL())
  {
    v42.origin.x = v12;
    v42.origin.y = v11;
    v42.size.width = v10;
    v42.size.height = v8;
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v16;
    v43.origin.y = v15;
    v43.size.width = v14;
    v43.size.height = v13;
    MinX = MaxX - CGRectGetMaxX(v43);
  }
  else
  {
    v44.origin.x = v16;
    v44.origin.y = v15;
    v44.size.width = v14;
    v44.size.height = v13;
    MinX = CGRectGetMinX(v44);
  }

  return MinX;
}

- (void)applyShowMoreLayoutAttributesForShowMoreView:(id)a3 atIndexPath:(id)a4
{
  id v6;

  v6 = a3;
  -[GKCollectionViewController showMoreTextMarginAtIndexPath:](self, "showMoreTextMarginAtIndexPath:", a4);
  objc_msgSend(v6, "setTextAlignmentOffset:");

}

- (NSString)loadingState
{
  return -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
}

- (void)stateWillChange
{
  -[GKCollectionViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("loadingState"));
}

- (void)stateDidChange
{
  -[GKCollectionViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("loadingState"));
}

- (void)didEnterNoContentState
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138412290;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_debug_impl(&dword_1AB361000, v1, OS_LOG_TYPE_DEBUG, "%@ has no content and did not override me or called super", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_11();
}

- (void)didEnterErrorState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  GKGameCenterUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController showPlaceholderWithTitle:message:buttonTitle:animated:block:](self, "showPlaceholderWithTitle:message:buttonTitle:animated:block:", v3, v5, 0, 1, 0);

}

- (void)didEnterLoadedState
{
  -[GKCollectionViewController hidePlaceholderAnimated:](self, "hidePlaceholderAnimated:", 1);
}

- (void)_reallyStartLoadingIndicator
{
  __CFString *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 == CFSTR("LoadingState"))
  {
    if (!self->_loadingIndicatorView)
    {
      -[GKCollectionViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithFrame:", v6, v8, v10, v12);
      -[GKCollectionViewController setLoadingIndicatorView:](self, "setLoadingIndicatorView:", v13);

      -[GKCollectionViewController loadingIndicatorView](self, "loadingIndicatorView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActivityIndicatorViewStyle:", 101);

      objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activityIndicatorColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionViewController loadingIndicatorView](self, "loadingIndicatorView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColor:", v16);

      -[GKCollectionViewController loadingIndicatorView](self, "loadingIndicatorView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAutoresizingMask:", 18);

      -[GKCollectionViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKCollectionViewController loadingIndicatorView](self, "loadingIndicatorView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", v20);

      -[GKCollectionViewController loadingIndicatorView](self, "loadingIndicatorView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAlpha:", 0.0);

      -[UIActivityIndicatorView startAnimating](self->_loadingIndicatorView, "startAnimating");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __58__GKCollectionViewController__reallyStartLoadingIndicator__block_invoke;
      v22[3] = &unk_1E59C4148;
      v22[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v22, 0.15);
    }
  }
  else
  {
    -[GKCollectionViewController stopLoadingIndicatorWithoutAnimation](self, "stopLoadingIndicatorWithoutAnimation");
    -[GKCollectionViewController slideInContents](self, "slideInContents");
  }
}

void __58__GKCollectionViewController__reallyStartLoadingIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingIndicatorView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (BOOL)hasLoaded
{
  __CFString *v3;
  __CFString *v4;
  BOOL v5;

  -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("Initial"))
  {
    v5 = 0;
  }
  else
  {
    -[_GKStateMachine currentState](self->_loadingMachine, "currentState");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != CFSTR("LoadingState");

  }
  return v5;
}

- (void)startLoadingIndicator
{
  if (-[GKCollectionViewController hasLoaded](self, "hasLoaded")
    || -[GKCollectionViewController showSupplementaryViewsWhileLoading](self, "showSupplementaryViewsWhileLoading"))
  {
    -[GKCollectionViewController stopLoadingIndicatorWithoutAnimation](self, "stopLoadingIndicatorWithoutAnimation");
    -[GKCollectionViewController slideInContents](self, "slideInContents");
  }
  else
  {
    -[GKCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyStartLoadingIndicator, 0, 0.15);
  }
}

- (void)stopLoadingIndicatorWithoutAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__GKCollectionViewController_stopLoadingIndicatorWithoutAnimation__block_invoke;
  v2[3] = &unk_1E59C4148;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __66__GKCollectionViewController_stopLoadingIndicatorWithoutAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 1032))
  {
    objc_msgSend((id)v2, "showCollectionView");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 1080), "stopAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingIndicatorView:", 0);
}

- (void)stopLoadingIndicator
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (self->_loadingIndicatorView)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__GKCollectionViewController_stopLoadingIndicator__block_invoke;
    v4[3] = &unk_1E59C4148;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__GKCollectionViewController_stopLoadingIndicator__block_invoke_2;
    v3[3] = &unk_1E59C4430;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.25);
  }
  else if (!self->_placeholderView)
  {
    -[GKCollectionViewController showCollectionView](self, "showCollectionView");
  }
  -[GKCollectionViewController slideInContents](self, "slideInContents");
}

_QWORD *__50__GKCollectionViewController_stopLoadingIndicator__block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAlpha:", 0.0);
  result = *(_QWORD **)(a1 + 32);
  if (!result[129])
    return (_QWORD *)objc_msgSend(result, "showCollectionView");
  return result;
}

uint64_t __50__GKCollectionViewController_stopLoadingIndicator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "stopAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingIndicatorView:", 0);
}

- (void)setIsReadyToDisplayData:(BOOL)a3
{
  if (self->_readyToDisplayData != a3)
  {
    -[GKCollectionViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("readyToDisplayData"));
    self->_readyToDisplayData = a3;
    -[GKCollectionViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("readyToDisplayData"));
  }
}

- (void)completeWhenReadyToDisplayData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (complete != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKCollectionViewController completeWhenReadyToDisplayData:]", objc_msgSend(v8, "UTF8String"), 1248);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__GKCollectionViewController_completeWhenReadyToDisplayData___block_invoke;
  v12[3] = &unk_1E59C7930;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  v11 = (id)-[GKCollectionViewController _gkAddObserverForKeyPath:options:withBlock:](self, "_gkAddObserverForKeyPath:options:withBlock:", CFSTR("readyToDisplayData"), 5, v12);

}

void __61__GKCollectionViewController_completeWhenReadyToDisplayData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_gkRemoveObserverWithBlockToken:", v8);
  }

}

- (void)slideInContents
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  int64_t appearCount;
  _OWORD v29[8];
  _QWORD v30[4];
  id v31;
  _OWORD v32[8];
  _OWORD v33[8];
  _QWORD v34[6];

  if (!self->_didSlideIn)
  {
    if (!self->_readyToDisplayData)
    {
      -[GKCollectionViewController setIsReadyToDisplayData:](self, "setIsReadyToDisplayData:", 1);
      -[GKCollectionViewController didBecomeReadyToDisplayData](self, "didBecomeReadyToDisplayData");
    }
    v3 = -[GKCollectionViewController shouldSlideInContents](self, "shouldSlideInContents");
    -[GKCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[GKCollectionViewController collectionViewLayout](self, "collectionViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enableClipView");
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v7 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __45__GKCollectionViewController_slideInContents__block_invoke;
      v34[3] = &unk_1E59C4148;
      v34[4] = self;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v34);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("sublayerTransform"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3B18];
      if (v5)
        objc_msgSend(v5, "sublayerTransform");
      else
        memset(v33, 0, sizeof(v33));
      objc_msgSend(v9, "valueWithCATransform3D:", v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFromValue:", v15);

      v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v32[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v32[5] = v16;
      v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v32[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v32[7] = v17;
      v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v32[0] = *MEMORY[0x1E0CD2610];
      v32[1] = v18;
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v32[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v32[3] = v19;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToValue:", v20);

      objc_msgSend(v8, "setDuration:", 0.75);
      v21 = objc_alloc(MEMORY[0x1E0CD27D0]);
      LODWORD(v22) = 1048743772;
      LODWORD(v23) = 1061123680;
      LODWORD(v24) = 1000807911;
      LODWORD(v25) = 1.0;
      v26 = (void *)objc_msgSend(v21, "initWithControlPoints::::", v22, v23, v24, v25);
      objc_msgSend(v8, "setTimingFunction:", v26);

      objc_msgSend(v8, "setRemovedOnCompletion:", 1);
      objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v5, "addAnimation:forKey:", v8, CFSTR("slideIn"));
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v27 = (void *)MEMORY[0x1E0DC3F10];
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __45__GKCollectionViewController_slideInContents__block_invoke_2;
      v30[3] = &unk_1E59C4148;
      v31 = v5;
      v10 = v5;
      objc_msgSend(v27, "performWithoutAnimation:", v30);

      v5 = v6;
    }
    else
    {
      objc_msgSend(v5, "modelLayer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v29[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v29[5] = v11;
      v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v29[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v29[7] = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v29[0] = *MEMORY[0x1E0CD2610];
      v29[1] = v13;
      v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v29[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v29[3] = v14;
      objc_msgSend(v10, "setSublayerTransform:", v29);
    }

    self->_shouldSlideInContents = 0;
    self->_didSlideIn = 1;
    -[GKCollectionViewController didDisplayData](self, "didDisplayData");
    appearCount = self->_appearCount;
    if (appearCount >= 1)
    {
      -[GKCollectionViewController setNeedsReload](self, "setNeedsReload");
      appearCount = self->_appearCount;
    }
    self->_appearCount = appearCount + 1;
  }
}

void __45__GKCollectionViewController_slideInContents__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "disableClipView");

}

void __45__GKCollectionViewController_slideInContents__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];

  objc_msgSend(*(id *)(a1 + 32), "modelLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v6[5] = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v6[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v6[7] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v6[0] = *MEMORY[0x1E0CD2610];
  v6[1] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v6[3] = v5;
  objc_msgSend(v1, "setSublayerTransform:", v6);

}

- (void)addPlaceholderViewToView:(id)a3
{
  objc_msgSend(a3, "addSubview:", self->_placeholderView);
}

- (void)showPlaceholderWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 animated:(BOOL)a6 block:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;

  HIDWORD(v25) = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[GKCollectionViewController placeholderView](self, "placeholderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController placeholderNavigationController](self, "placeholderNavigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v15, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", v11))
    {
      objc_msgSend(v15, "message");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToString:", v12) & 1) != 0)
      {
        objc_msgSend(v15, "buttonTitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend(v19, "isEqualToString:", v13);

        if ((v25 & 1) != 0)
          goto LABEL_15;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  -[GKCollectionViewController view](self, "view", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  +[GKPlaceholderView placeholderViewWithTitle:message:frame:](GKPlaceholderView, "placeholderViewWithTitle:message:frame:", v11, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewController setPlaceholderView:](self, "setPlaceholderView:", v21);

  -[GKPlaceholderView setAlpha:](self->_placeholderView, "setAlpha:", 0.0);
  -[GKPlaceholderView setAutoresizingMask:](self->_placeholderView, "setAutoresizingMask:", 18);
  if (v13 && v14)
  {
    -[_UIContentUnavailableView setButtonTitle:](self->_placeholderView, "setButtonTitle:", v13);
    -[_UIContentUnavailableView setButtonAction:](self->_placeholderView, "setButtonAction:", v14);
  }
  -[GKCollectionViewController addPlaceholderViewToView:](self, "addPlaceholderViewToView:", v20);
  -[GKCollectionViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 0.0);

  v23 = (void *)MEMORY[0x1E0DC3F10];
  if (v26)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke;
    v33[3] = &unk_1E59C54B8;
    v33[4] = self;
    v34 = v15;
    v35 = v16;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_2;
    v30[3] = &unk_1E59C7958;
    v31 = v34;
    v32 = v35;
    objc_msgSend(v23, "animateWithDuration:animations:completion:", v33, v30, 0.25);

    v24 = v34;
  }
  else
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_3;
    v27[3] = &unk_1E59C54B8;
    v27[4] = self;
    v28 = v15;
    v29 = v16;
    objc_msgSend(v23, "performWithoutAnimation:", v27);

    v24 = v28;
  }

LABEL_15:
}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

void __90__GKCollectionViewController_showPlaceholderWithTitle_message_buttonTitle_animated_block___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)hidePlaceholderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  GKPlaceholderView *v5;
  UINavigationController *v6;
  void *v7;
  uint64_t v8;
  GKPlaceholderView *v9;
  _QWORD v10[5];
  GKPlaceholderView *v11;
  UINavigationController *v12;
  _QWORD v13[4];
  GKPlaceholderView *v14;
  UINavigationController *v15;
  GKCollectionViewController *v16;
  _QWORD v17[4];
  GKPlaceholderView *v18;
  UINavigationController *v19;
  GKCollectionViewController *v20;

  v3 = a3;
  v5 = self->_placeholderView;
  v6 = self->_placeholderNavigationController;
  if (v5)
  {
    -[_UIContentUnavailableView setButtonAction:](v5, "setButtonAction:", 0);
    v7 = (void *)MEMORY[0x1E0DC3F10];
    if (v3)
    {
      v8 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke;
      v17[3] = &unk_1E59C54B8;
      v18 = v5;
      v19 = v6;
      v20 = self;
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_2;
      v13[3] = &unk_1E59C5AC8;
      v14 = v18;
      v15 = v19;
      v16 = self;
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v17, v13, 0.25);

      v9 = v18;
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_3;
      v10[3] = &unk_1E59C54B8;
      v10[4] = self;
      v11 = v5;
      v12 = v6;
      objc_msgSend(v7, "performWithoutAnimation:", v10);

      v9 = v11;
    }

  }
}

uint64_t __54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(a1[6], "showCollectionView");
}

_QWORD *__54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  result = *(_QWORD **)(a1 + 48);
  if (result[129] == *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(result, "setPlaceholderView:", 0);
    result = *(_QWORD **)(a1 + 48);
  }
  if (result[130] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "setPlaceholderNavigationController:", 0);
  return result;
}

_QWORD *__54__GKCollectionViewController_hidePlaceholderAnimated___block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  _QWORD *result;

  objc_msgSend(a1[4], "showCollectionView");
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  result = a1[4];
  if ((id)result[129] == a1[5])
  {
    objc_msgSend(result, "setPlaceholderView:", 0);
    result = a1[4];
  }
  if ((id)result[130] == a1[6])
    return (_QWORD *)objc_msgSend(result, "setPlaceholderNavigationController:", 0);
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[_GKStateMachine currentState](self->_swipeStateMachine, "currentState", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NothingState"));

  return v5;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[NSMapTable setObject:forKey:](self->_reusableViewsIHaveSeen, "setObject:forKey:", a4);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v9;
  NSMapTable *reusableViewsIHaveSeen;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a6;
  reusableViewsIHaveSeen = self->_reusableViewsIHaveSeen;
  v11 = a3;
  -[NSMapTable setObject:forKey:](reusableViewsIHaveSeen, "setObject:forKey:", v17, v17);
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "attributesForSupplementaryIndexPath:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "supplementaryMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "configurator"))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v14, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_4;
    objc_msgSend(v13, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "targetForAction:", objc_msgSend(v14, "configurator"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_4:
        if (objc_msgSend(v14, "configurator"))
          objc_msgSend(v15, (SEL)objc_msgSend(v14, "configurator"), v17, v9, v14);
      }
    }
    else
    {

      v15 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)clearSelectionHighlight
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[GKCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setShouldSlideInContents:(BOOL)a3
{
  self->_shouldSlideInContents = a3;
}

- (UICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)showSupplementaryViewsWhileLoading
{
  return self->_showSupplementaryViewsWhileLoading;
}

- (void)setShowSupplementaryViewsWhileLoading:(BOOL)a3
{
  self->_showSupplementaryViewsWhileLoading = a3;
}

- (BOOL)readyToDisplayData
{
  return self->_readyToDisplayData;
}

- (GKPlaceholderView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderView, a3);
}

- (UINavigationController)placeholderNavigationController
{
  return self->_placeholderNavigationController;
}

- (void)setPlaceholderNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderNavigationController, a3);
}

- (GKSearchBar)activeSearchBar
{
  return self->_activeSearchBar;
}

- (void)setActiveSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_activeSearchBar, a3);
}

- (NSString)currentSearchText
{
  return self->_currentSearchText;
}

- (GKLoadableContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMachine, a3);
}

- (UICollectionViewLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setDefaultLayout:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayout, a3);
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, a3);
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)hasViewFactories
{
  return self->_hasViewFactories;
}

- (void)setHasViewFactories:(BOOL)a3
{
  self->_hasViewFactories = a3;
}

- (BOOL)didSlideIn
{
  return self->_didSlideIn;
}

- (void)setDidSlideIn:(BOOL)a3
{
  self->_didSlideIn = a3;
}

- (int64_t)appearCount
{
  return self->_appearCount;
}

- (void)setAppearCount:(int64_t)a3
{
  self->_appearCount = a3;
}

- (NSMapTable)reusableViewsIHaveSeen
{
  return self->_reusableViewsIHaveSeen;
}

- (void)setReusableViewsIHaveSeen:(id)a3
{
  objc_storeStrong((id *)&self->_reusableViewsIHaveSeen, a3);
}

- (OS_dispatch_queue)batchUpdateQueue
{
  return self->_batchUpdateQueue;
}

- (void)setBatchUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_batchUpdateQueue, a3);
}

- (int64_t)batchUpdateCount
{
  return self->_batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->_batchUpdateCount = a3;
}

- (NSUUID)currentUpdateID
{
  return (NSUUID *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setCurrentUpdateID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (GKSwipeToEditStateMachine)swipeStateMachine
{
  return self->_swipeStateMachine;
}

- (void)setSwipeStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_swipeStateMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeStateMachine, 0);
  objc_storeStrong((id *)&self->_currentUpdateID, 0);
  objc_storeStrong((id *)&self->_batchUpdateQueue, 0);
  objc_storeStrong((id *)&self->_reusableViewsIHaveSeen, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_currentSearchText, 0);
  objc_storeStrong((id *)&self->_activeSearchBar, 0);
  objc_storeStrong((id *)&self->_placeholderNavigationController, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
}

- (void)shutActionPaneAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKCollectionViewController swipeStateMachine](self, "swipeStateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutActionPaneForEditingCellAnimated:", v3);

}

- (void)swipeToDeleteCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKCollectionViewController gkDataSource](self, "gkDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_activeSearchBar)
    {
      objc_msgSend(v6, "visibleIndexPathsFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      if (v11 >= 1)
      {
        v24 = v7;
        v25 = v6;
        v26 = v5;
        v27 = v4;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v11 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v23 = v10;
        v13 = v10;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              v19 = objc_msgSend(v18, "section");
              if (v19 == objc_msgSend(v9, "section")
                && (v20 = objc_msgSend(v18, "item"), v20 > objc_msgSend(v9, "item")))
              {
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v18, "item") - 1, objc_msgSend(v18, "section"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v21);

              }
              else if ((objc_msgSend(v18, "isEqual:", v9) & 1) == 0)
              {
                objc_msgSend(v12, "addObject:", v18);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v15);
        }

        v6 = v25;
        objc_msgSend(v25, "setVisibleIndexPathsFilter:", v12);

        v5 = v26;
        v4 = v27;
        v7 = v24;
        v10 = v23;
      }

    }
    v22 = (id)objc_msgSend(v6, "revealMoreForSectionIndex:revealCount:andDeleteItemCount:", objc_msgSend(v9, "section"), self->_activeSearchBar == 0, 1);
    objc_msgSend(v6, "prepareForUpdate:inDataSource:", 0, v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__GKCollectionViewController_GKSwipeToEditSupport__swipeToDeleteCell___block_invoke;
    v28[3] = &unk_1E59C7958;
    v28[4] = self;
    v29 = v6;
    objc_msgSend(v7, "removeItemAtIndexPath:completionHandler:", v9, v28);

  }
}

uint64_t __70__GKCollectionViewController_GKSwipeToEditSupport__swipeToDeleteCell___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "shutActionPaneAnimated:", 1);
    return objc_msgSend(*(id *)(v2 + 40), "prepareForUpdate:inDataSource:", 6, 0);
  }
  return result;
}

- (void)setSkipLoadAfterViewDidLoad:(BOOL)a3
{
  self->_skipLoadAfterViewDidLoad = a3;
}

- (BOOL)skipLoadAfterViewDidLoad
{
  return self->_skipLoadAfterViewDidLoad;
}

- (void)showCollectionView
{
  void *v3;
  id v4;

  -[GKCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[GKCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)willDismissActionSheetFromCell:(id)a3
{
  -[GKSwipeToEditStateMachine shutActionPaneForEditingCellAnimated:](self->_swipeStateMachine, "shutActionPaneForEditingCellAnimated:", 1);
}

- (void)_finishUpdates:(uint64_t)a3 withCompletionHandler:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_1AB361000, v4, OS_LOG_TYPE_ERROR, "%@ ERROR: %@", (uint8_t *)&v6, 0x16u);

}

- (void)dataSource:(void *)a1 didUpdatePlaceholderVisibility:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "currentUpdateID");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4;
  v7 = &stru_1E59EB978;
  if (v4)
    v7 = (const __CFString *)v4;
  v8 = 138412802;
  v9 = v7;
  v10 = 2048;
  v11 = a2;
  v12 = 2080;
  v13 = "-[GKCollectionViewController dataSource:didUpdatePlaceholderVisibility:]";
  OUTLINED_FUNCTION_8_1(&dword_1AB361000, v3, v5, "****** %@ - GKCVC - c:%p %s", (uint8_t *)&v8);

}

- (void)dataSource:(uint64_t)a1 performBatchUpdate:(uint64_t)a2 complete:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  v7 = 2080;
  v8 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]";
  OUTLINED_FUNCTION_8_1(&dword_1AB361000, a3, (uint64_t)a3, "****** %@ - GKCVC INIT - ds:%p %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_11();
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_1AB361000, v0, v1, "****** %@ - GKCVC START - ds:%p %s", v2);
  OUTLINED_FUNCTION_11();
}

void __69__GKCollectionViewController_dataSource_performBatchUpdate_complete___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = "-[GKCollectionViewController dataSource:performBatchUpdate:complete:]_block_invoke_5";
  OUTLINED_FUNCTION_8_1(&dword_1AB361000, v0, v1, "****** %@ - GKCVC END - ds:%p %s", v2);
  OUTLINED_FUNCTION_11();
}

@end
