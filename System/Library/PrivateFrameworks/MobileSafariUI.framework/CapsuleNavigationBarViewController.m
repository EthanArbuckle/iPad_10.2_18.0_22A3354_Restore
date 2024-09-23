@implementation CapsuleNavigationBarViewController

- (SFCapsuleCollectionView)capsuleCollectionView
{
  -[CapsuleNavigationBarViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_capsuleCollectionView;
}

- (SFCapsuleNavigationBar)selectedItemNavigationBar
{
  SFCapsuleNavigationBar *v3;
  char isKindOfClass;
  SFCapsuleNavigationBar *cachedSelectedItemNavigationBar;
  SFCapsuleNavigationBar *v6;

  if (-[SFCapsuleCollectionView numberOfItems](self->_capsuleCollectionView, "numberOfItems"))
  {
    -[SFCapsuleCollectionView contentViewForItemAtIndex:](self->_capsuleCollectionView, "contentViewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex"));
    v3 = (SFCapsuleNavigationBar *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    cachedSelectedItemNavigationBar = v3;
    if ((isKindOfClass & 1) == 0)
      cachedSelectedItemNavigationBar = self->_cachedSelectedItemNavigationBar;
    v6 = cachedSelectedItemNavigationBar;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)capsuleIsFocused
{
  return self->_capsuleIsFocused;
}

- (BOOL)transitioningToNormalStateForKeyboardDismissal
{
  return self->_transitioningToNormalStateForKeyboardDismissal;
}

- (BOOL)performingWebViewTapTransition
{
  return self->_webViewTapTransitionCount != 0;
}

- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3
{
  return -[NSArray count](self->_tabs, "count", a3);
}

- (BOOL)capsuleCollectionView:(id)a3 shouldHideShadowForItemAtIndex:(int64_t)a4
{
  return objc_msgSend(a3, "layoutStyle") == 2;
}

- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *cachedSelectedItemNavigationBar;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;

  v6 = a3;
  if (objc_msgSend(v6, "selectedItemIndex") == a4 && objc_msgSend(v6, "selectedItemState") == 2)
  {
    objc_msgSend(v6, "createOrDequeueContentViewWithIdentifier:atIndex:", CFSTR("urlField"), a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CapsuleNavigationBarViewController tabAtCollectionViewIndex:](self, "tabAtCollectionViewIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarItem");
    cachedSelectedItemNavigationBar = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = self->_focusingForScribble;
    objc_msgSend(v7, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((_DWORD)v8)
    {
      objc_msgSend(v10, "setText:", 0);

      v12 = 0;
    }
    else
    {
      v17 = objc_msgSend(v10, "isFirstResponder");

      if ((v17 & 1) != 0)
        goto LABEL_9;
      objc_msgSend(cachedSelectedItemNavigationBar, "textWhenExpanded");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);

      v12 = objc_msgSend(cachedSelectedItemNavigationBar, "startIndexOfTextInExpandedText");
      objc_msgSend(cachedSelectedItemNavigationBar, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        objc_msgSend(cachedSelectedItemNavigationBar, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "characterAtIndex:", 0);

        if (v23 == 8206)
          ++v12;
        v13 = v21 - (v23 == 8206);
        goto LABEL_6;
      }
    }
    v13 = 0;
LABEL_6:
    objc_msgSend(v7, "setRangeOfKeyText:", v12, v13);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v6, "createOrDequeueContentViewWithIdentifier:atIndex:", CFSTR("navigationBar"), a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CapsuleNavigationBarViewController tabAtCollectionViewIndex:](self, "tabAtCollectionViewIndex:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBarItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItem:", v15);

  if (objc_msgSend(v6, "selectedItemIndex") == a4)
  {
    v7 = v7;
    cachedSelectedItemNavigationBar = self->_cachedSelectedItemNavigationBar;
    self->_cachedSelectedItemNavigationBar = (SFCapsuleNavigationBar *)v7;
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (double)capsuleCollectionView:(id)a3 heightForItemAtIndex:(int64_t)a4 width:(double)a5 state:(int64_t)a6
{
  void *v10;
  int *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[SFCapsuleCollectionView contentViewForItemAtIndex:](self->_capsuleCollectionView, "contentViewForItemAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &OBJC_IVAR___CapsuleNavigationBarViewController__sizingNavigationBar;
  if (a6 == 1)
    v11 = &OBJC_IVAR___CapsuleNavigationBarViewController__minimizedSizingNavigationBar;
  v12 = *(id *)((char *)&self->super.super.super.isa + *v11);
  -[CapsuleNavigationBarViewController tabAtCollectionViewIndex:](self, "tabAtCollectionViewIndex:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBarItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItem:", v14);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v12, "prepareForSizingNavigationBar:", v10);
  objc_msgSend(v12, "updateTraitsIfNeeded");
  objc_msgSend(v12, "layoutIfNeeded");
  LODWORD(v15) = 1148846080;
  LODWORD(v16) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a5, 0.0, v15, v16);
  v18 = fmax(v17, 20.0);

  return v18;
}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

  objc_msgSend(v0, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  v3 = (void *)MEMORY[0x1E0DC3870];
  SFSystemImageNameForBarItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setImage:", v5);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPreferredSymbolConfigurationForImage:", v6);

  objc_msgSend(MEMORY[0x1E0D4EF48], "buttonWithConfiguration:primaryAction:", v0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sf_applyContentSizeCategoryLimitsForToolbarButton");

  return v7;
}

- (void)_switchObservingFromTabDocument:(id)a3 toTabDocument:(id)a4
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
  objc_msgSend(v7, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_removeScrollViewScrollObserver:", self);

  objc_msgSend(v7, "readerWebView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_removeScrollViewScrollObserver:", self);

  objc_msgSend(v7, "removeNavigationObserver:", self);
  objc_msgSend(v6, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_addScrollViewScrollObserver:", self);

  objc_msgSend(v6, "readerWebView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_addScrollViewScrollObserver:", self);

  objc_msgSend(v6, "addNavigationObserver:", self);
  objc_msgSend(v6, "navigationBarItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SFCapsuleCollectionView setNavigationBarItem:](self->_capsuleCollectionView, "setNavigationBarItem:", v16);
}

- (void)viewDidLoad
{
  SFCapsuleCollectionView *capsuleCollectionView;
  uint64_t v4;
  SFCapsuleCollectionView *v5;
  void *v6;
  id v7;
  SFCapsuleNavigationBar *v8;
  SFCapsuleNavigationBar *sizingNavigationBar;
  void *v10;
  id v11;
  SFCapsuleNavigationBar *v12;
  SFCapsuleNavigationBar *minimizedSizingNavigationBar;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CapsuleNavigationBarViewController;
  -[CapsuleNavigationBarViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[CapsuleNavigationBarViewController updateAdditionalBottomObscuredInset](self, "updateAdditionalBottomObscuredInset");
  -[SFCapsuleCollectionView updateVerticalSwipeThreshold](self->_capsuleCollectionView, "updateVerticalSwipeThreshold");
  objc_initWeak(&location, self);
  capsuleCollectionView = self->_capsuleCollectionView;
  v4 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke;
  v26[3] = &unk_1E9CF2BD8;
  objc_copyWeak(&v27, &location);
  -[SFCapsuleCollectionView registerContentViewIdentifier:block:](capsuleCollectionView, "registerContentViewIdentifier:block:", CFSTR("urlField"), v26);
  v5 = self->_capsuleCollectionView;
  v21 = v4;
  v22 = 3221225472;
  v23 = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_3;
  v24 = &unk_1E9CF2BD8;
  objc_copyWeak(&v25, &location);
  -[SFCapsuleCollectionView registerContentViewIdentifier:block:](v5, "registerContentViewIdentifier:block:", CFSTR("navigationBar"), &v21);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v21, v22, v23, v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  v7 = objc_alloc(MEMORY[0x1E0D4EC10]);
  -[SFCapsuleCollectionView bounds](self->_capsuleCollectionView, "bounds");
  v8 = (SFCapsuleNavigationBar *)objc_msgSend(v7, "initForSizingWithFrame:");
  sizingNavigationBar = self->_sizingNavigationBar;
  self->_sizingNavigationBar = v8;

  -[SFCapsuleNavigationBar setIsSelected:](self->_sizingNavigationBar, "setIsSelected:", 1);
  -[SFCapsuleNavigationBar setHidden:](self->_sizingNavigationBar, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0D4EC28], "maximumContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setMaximumContentSizeCategory:](self->_sizingNavigationBar, "setMaximumContentSizeCategory:", v10);

  -[SFCapsuleNavigationBar _setHostsLayoutEngine:](self->_sizingNavigationBar, "_setHostsLayoutEngine:", 1);
  v11 = objc_alloc(MEMORY[0x1E0D4EC10]);
  -[SFCapsuleCollectionView bounds](self->_capsuleCollectionView, "bounds");
  v12 = (SFCapsuleNavigationBar *)objc_msgSend(v11, "initForSizingWithFrame:");
  minimizedSizingNavigationBar = self->_minimizedSizingNavigationBar;
  self->_minimizedSizingNavigationBar = v12;

  -[SFCapsuleNavigationBar setIsMinimized:](self->_minimizedSizingNavigationBar, "setIsMinimized:", 1);
  -[SFCapsuleNavigationBar setIsSelected:](self->_minimizedSizingNavigationBar, "setIsSelected:", 1);
  -[SFCapsuleNavigationBar setHidden:](self->_minimizedSizingNavigationBar, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0D4EC28], "maximumContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setMaximumContentSizeCategory:](self->_minimizedSizingNavigationBar, "setMaximumContentSizeCategory:", v14);

  -[SFCapsuleNavigationBar _setHostsLayoutEngine:](self->_minimizedSizingNavigationBar, "_setHostsLayoutEngine:", 1);
  __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setLeadingButtons:](self->_sizingNavigationBar, "setLeadingButtons:", v17);

  __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_4();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleNavigationBar setTrailingButtons:](self->_sizingNavigationBar, "setTrailingButtons:", v20);

  -[CapsuleNavigationBarViewController _updateSelectedItemAccessoryViews](self, "_updateSelectedItemAccessoryViews");
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)updateAdditionalBottomObscuredInset
{
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E0D4F178], 10.0);
  self->_additionalBottomObscuredInset = v3;

}

- (void)_updateSelectedItemAccessoryViews
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
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (-[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "background");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0DC3518];
    v7 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke;
    v15 = &unk_1E9CF2C28;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v3, v9, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setConfigurationUpdateHandler:", &__block_literal_global_65);
    objc_msgSend(v10, "setPointerInteractionEnabled:", 1);
    _SFAccessibilityIdentifierForBarItem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

    objc_msgSend(v10, "sf_applyContentSizeCategoryLimitsForToolbarButton");
    objc_msgSend(v10, "setNeedsLayout");
    objc_msgSend(v10, "layoutIfNeeded");
    -[SFCapsuleCollectionView setSelectedItemAccessoryView:forState:](self->_capsuleCollectionView, "setSelectedItemAccessoryView:forState:", v10, 2);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    -[SFCapsuleCollectionView setSelectedItemAccessoryView:forState:](self->_capsuleCollectionView, "setSelectedItemAccessoryView:forState:", 0, 2);
  }
}

- (id)createToolbarForCapsuleCollectionView:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "createToolbarForCapsuleNavigationBarViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __66__CapsuleNavigationBarViewController__updateTabDocumentsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

- (id)topActionForCapsuleCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CapsuleNavigationBarViewController_topActionForCapsuleCollectionView___block_invoke;
  v8[3] = &unk_1E9CF2C28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "actionWithHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)capsuleCollectionViewShouldDelayToolbarPresentation:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabOverview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scalePercentageForActiveItem");
  v6 = v5 > 0.5;

  return v6;
}

- (void)setTabController:(id)a3
{
  TabController *v5;
  TabController **p_tabController;
  TabController *tabController;
  void *v8;
  void *v9;
  TabController *v10;

  v5 = (TabController *)a3;
  p_tabController = &self->_tabController;
  tabController = self->_tabController;
  v10 = v5;
  if (tabController != v5)
  {
    -[TabController activeTabDocument](tabController, "activeTabDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController activeTabDocument](v10, "activeTabDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CapsuleNavigationBarViewController _switchObservingFromTabDocument:toTabDocument:](self, "_switchObservingFromTabDocument:toTabDocument:", v8, v9);

    -[TabController removeDocumentObserver:](*p_tabController, "removeDocumentObserver:", self);
    objc_storeStrong((id *)&self->_tabController, a3);
    -[TabController addDocumentObserver:](*p_tabController, "addDocumentObserver:", self);
    -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 0);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)loadView
{
  id v3;
  void *v4;
  SFCapsuleCollectionView *v5;
  SFCapsuleCollectionView *capsuleCollectionView;

  v3 = objc_alloc(MEMORY[0x1E0D4EC08]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (SFCapsuleCollectionView *)objc_msgSend(v3, "initWithFrame:");
  capsuleCollectionView = self->_capsuleCollectionView;
  self->_capsuleCollectionView = v5;

  -[SFCapsuleCollectionView setDataSource:](self->_capsuleCollectionView, "setDataSource:", self);
  -[SFCapsuleCollectionView setDelegate:](self->_capsuleCollectionView, "setDelegate:", self);
  -[SFCapsuleCollectionView addGestureObserver:](self->_capsuleCollectionView, "addGestureObserver:", self);
  -[CapsuleNavigationBarViewController setView:](self, "setView:", self->_capsuleCollectionView);
}

- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5
{
  TabDocument *v7;
  id v8;
  int64_t v9;
  BOOL v10;
  void *v11;
  __int128 v12;
  TabDocument *attachedTab;
  SFCapsuleCollectionView *capsuleCollectionView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TabDocument *interactivelyInsertedTabDocument;
  _OWORD v26[3];

  v7 = (TabDocument *)a5;
  v8 = a4;
  -[CapsuleNavigationBarViewController _switchObservingFromTabDocument:toTabDocument:](self, "_switchObservingFromTabDocument:toTabDocument:", v8, v7);
  v9 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:", v8);

  if (-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState"))
    v10 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v10 = 1;
  if (!v10)
  {
    -[SFCapsuleCollectionView viewForItemAtIndex:](self->_capsuleCollectionView, "viewForItemAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v26[0] = *MEMORY[0x1E0C9BAA8];
    v26[1] = v12;
    v26[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v11, "setTransform:", v26);

  }
  if (self->_interactivelyInsertedTabDocument == v7)
  {
    -[SFCapsuleCollectionView linkedPageView](self->_capsuleCollectionView, "linkedPageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "drivesCapsuleSelection");

    if ((v19 & 1) != 0)
    {
      -[TabDocument setInteractivelyInserted:](self->_interactivelyInsertedTabDocument, "setInteractivelyInserted:", 0);
      -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tabSwitcherViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNeedsApplyContentAnimated:", 1);

    }
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tabOverview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument tabOverviewItem](self->_interactivelyInsertedTabDocument, "tabOverviewItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInteractiveInsertionProgress:forItem:", v24, 1.0);

    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = 0;

    -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 1);
  }
  else
  {
    if (-[CapsuleNavigationBarViewController _showsOnlyActiveTab](self, "_showsOnlyActiveTab"))
    {
      attachedTab = self->_attachedTab;
      if (attachedTab)
        -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
      -[CapsuleNavigationBarViewController _updateTabDocumentsWithoutUpdatingCollectionView](self, "_updateTabDocumentsWithoutUpdatingCollectionView");
      capsuleCollectionView = self->_capsuleCollectionView;
      v15 = (void *)MEMORY[0x1E0CB36B8];
      -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "indexSetWithIndex:", -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:", v16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionView reloadItemsAtIndexes:](capsuleCollectionView, "reloadItemsAtIndexes:", v17);

      if (attachedTab)
        -[CapsuleNavigationBarViewController _attachSelectedCapsuleToTabOverview](self, "_attachSelectedCapsuleToTabOverview");
    }
    else
    {
      -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 1);
    }
    -[SFCapsuleCollectionView updateTrailingActionAnimated:](self->_capsuleCollectionView, "updateTrailingActionAnimated:", 1);
  }

}

- (void)capsuleCollectionViewWillReloadData:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;

  v6 = a3;
  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:", v4);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "setSelectedItemIndex:", v5);

}

- (void)_updateTabDocumentsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *tabs;
  void *v6;
  void *v7;
  SFCapsuleCollectionView *capsuleCollectionView;
  SFCapsuleCollectionView *v9;
  void *v10;
  SFCapsuleCollectionView *v11;
  void *v12;
  NSArray *v13;

  v3 = a3;
  tabs = self->_tabs;
  if (!tabs)
    tabs = (NSArray *)MEMORY[0x1E0C9AA60];
  v13 = tabs;
  -[CapsuleNavigationBarViewController _updateTabDocumentsWithoutUpdatingCollectionView](self, "_updateTabDocumentsWithoutUpdatingCollectionView");
  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray differenceFromArray:withOptions:usingEquivalenceTest:](self->_tabs, "differenceFromArray:withOptions:usingEquivalenceTest:", v13, 0, &__block_literal_global_68);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasChanges") & 1) != 0)
  {
    capsuleCollectionView = self->_capsuleCollectionView;
    if (v3)
    {
      -[SFCapsuleCollectionView beginUpdates](capsuleCollectionView, "beginUpdates");
      v9 = self->_capsuleCollectionView;
      objc_msgSend(v7, "safari_removalIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionView deleteItemsAtIndexes:animated:](v9, "deleteItemsAtIndexes:animated:", v10, 1);

      v11 = self->_capsuleCollectionView;
      objc_msgSend(v7, "safari_insertionIndexes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionView insertItemsAtIndexes:animated:](v11, "insertItemsAtIndexes:animated:", v12, 1);

      if (-[NSArray containsObject:](self->_tabs, "containsObject:", v6))
        -[SFCapsuleCollectionView setSelectedItemIndex:animated:](self->_capsuleCollectionView, "setSelectedItemIndex:animated:", -[NSArray indexOfObject:](self->_tabs, "indexOfObject:", v6), 1);
      -[SFCapsuleCollectionView endUpdates](self->_capsuleCollectionView, "endUpdates");
    }
    else
    {
      -[SFCapsuleCollectionView reloadData](capsuleCollectionView, "reloadData");
    }
  }
  else if (-[NSArray containsObject:](self->_tabs, "containsObject:", v6))
  {
    -[SFCapsuleCollectionView setSelectedItemIndex:animated:](self->_capsuleCollectionView, "setSelectedItemIndex:animated:", -[NSArray indexOfObject:](self->_tabs, "indexOfObject:", v6), v3);
  }

}

- (id)trailingActionForCapsuleCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  if (-[CapsuleNavigationBarViewController _showsOnlyActiveTab](self, "_showsOnlyActiveTab"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray lastObject](self->_tabs, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TabController canAddNewTabForCurrentBrowsingMode](self->_tabController, "canAddNewTabForCurrentBrowsingMode")
      && (!objc_msgSend(v6, "isBlank") || objc_msgSend(v6, "isLoading")))
    {
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __77__CapsuleNavigationBarViewController_trailingActionForCapsuleCollectionView___block_invoke;
      v10[3] = &unk_1E9CF2C28;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, v8, CFSTR("CapsuleNavigationBarAddTab"), v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v11);

      objc_destroyWeak(&location);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_updateTabDocumentsWithoutUpdatingCollectionView
{
  uint64_t v3;
  void *v4;
  void *v5;
  TabDocument *interactivelyInsertedTabDocument;
  void *v7;
  NSArray *v8;
  NSArray *tabs;
  NSArray *v10;
  NSArray *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[CapsuleNavigationBarViewController _showsOnlyActiveTab](self, "_showsOnlyActiveTab"))
  {
    -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v14[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_storeStrong((id *)&self->_tabs, v5);
    if (v4)

  }
  else
  {
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    -[TabController currentTabs](self->_tabController, "currentTabs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (interactivelyInsertedTabDocument)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __86__CapsuleNavigationBarViewController__updateTabDocumentsWithoutUpdatingCollectionView__block_invoke;
      v13[3] = &unk_1E9CF2C90;
      v13[4] = self;
      objc_msgSend(v7, "safari_filterObjectsUsingBlock:", v13);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      tabs = self->_tabs;
      self->_tabs = v8;

    }
    else
    {
      v10 = (NSArray *)objc_msgSend(v7, "copy");
      v11 = self->_tabs;
      self->_tabs = v10;

    }
  }
}

- (BOOL)_showsOnlyActiveTab
{
  return -[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle") == 2;
}

- (void)tabControllerDocumentCountDidChange:(id)a3
{
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 0);
}

- (UnifiedField)unifiedField
{
  void *v3;
  void *v4;

  if (-[SFCapsuleCollectionView numberOfItems](self->_capsuleCollectionView, "numberOfItems"))
  {
    -[SFCapsuleCollectionView contentViewForItemAtIndex:](self->_capsuleCollectionView, "contentViewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "textField");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (UnifiedField *)v4;
}

- (BOOL)transitionToState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  int v15;
  void *v18;
  id nextStateChangeCompletionHandler;
  BOOL v20;

  v6 = a5;
  v10 = (void (**)(_QWORD))a6;
  v11 = -[SFCapsuleCollectionView selectedItemState](self->_capsuleCollectionView, "selectedItemState");
  if (v11 != a3)
  {
    v12 = v11;
    if (v11 != 1 || a3 != 0 || !self->_keyboardIsVisible)
    {
      v15 = -[SFCapsuleCollectionView isForceHidden](self->_capsuleCollectionView, "isForceHidden");
      if (v12 != 1 || a3 == 1 || v15 == 0)
      {
        v18 = _Block_copy(v10);
        nextStateChangeCompletionHandler = self->_nextStateChangeCompletionHandler;
        self->_nextStateChangeCompletionHandler = v18;

        -[SFCapsuleCollectionView setSelectedItemState:options:animated:](self->_capsuleCollectionView, "setSelectedItemState:options:animated:", a3, a4, v6);
        v20 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      self->_unminimizeOnHideKeyboard = 1;
    }
  }
  if (v10)
    v10[2](v10);
  v20 = 0;
LABEL_22:

  return v20;
}

- (BOOL)transitionToState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  return -[CapsuleNavigationBarViewController transitionToState:options:animated:completionHandler:](self, "transitionToState:options:animated:completionHandler:", a3, 0, a4, a5);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  id WeakRetained;
  double v11;
  id v12;

  v12 = a3;
  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v6 == v12)
  {
    v8 = objc_msgSend(v12, "isTracking");
    v7 = v12;
    if ((v8 & 1) == 0)
    {
      v9 = -[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle");
      v7 = v12;
      if (v9 == 2 || !self->_keyboardIsVisible)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || objc_msgSend(WeakRetained, "capsuleNavigationBarViewController:shouldUnminimizeOnScrollForScrollView:", self, v12))
        {
          if (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized"))
          {
            -[CapsuleNavigationBarViewController capsuleCollectionView:distanceToTopEdgeIncludingDeceleration:](self, "capsuleCollectionView:distanceToTopEdgeIncludingDeceleration:", self->_capsuleCollectionView, 1);
            if (v11 <= 0.0)
              -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 0, objc_msgSend(v12, "_isAnimatingScroll"), 0);
          }
        }

        v7 = v12;
      }
    }
  }

}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D4EC10]);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", WeakRetained);
    objc_msgSend(v2, "addInteraction:", v3);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", WeakRetained);
    objc_msgSend(v2, "addInteraction:", v4);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", WeakRetained);
    v6 = (void *)*((_QWORD *)WeakRetained + 128);
    *((_QWORD *)WeakRetained + 128) = v5;

    objc_msgSend(v2, "addInteraction:", *((_QWORD *)WeakRetained + 128));
    objc_msgSend(v2, "scribbleInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setElementSource:", WeakRetained);

    v8 = objc_loadWeakRetained((id *)WeakRetained + 139);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "capsuleNavigationBarViewController:didCreateNavigationBar:", WeakRetained, v2);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)willTransitionFromTabView:(id)a3 toTabView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "removePresentationObserver:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "addPresentationObserver:", self);
  if ((SFTabGroupSwitcherEnabled() & 1) == 0)
  {
    objc_msgSend(v6, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView setAlternateToolbarContentProvider:](self->_capsuleCollectionView, "setAlternateToolbarContentProvider:", v7);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarViewController;
  -[CapsuleNavigationBarViewController viewIsAppearing:](&v6, sel_viewIsAppearing_, a3);
  -[CapsuleNavigationBarViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", self->_sizingNavigationBar);
  objc_msgSend(v5, "addSubview:", self->_minimizedSizingNavigationBar);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CapsuleNavigationBarViewController;
  -[CapsuleNavigationBarViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if ((SFEnhancedTabOverviewEnabled() & 1) == 0)
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabThumbnailCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "addPresentationObserver:", self);
    objc_msgSend(v5, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView setAlternateToolbarContentProvider:](self->_capsuleCollectionView, "setAlternateToolbarContentProvider:", v6);

    v7 = v5;
    if (objc_msgSend(v7, "presentationState") == 1)
    {

    }
    else
    {
      v8 = objc_msgSend(v7, "presentationState");

      if (v8 != 2)
      {
LABEL_9:

        return;
      }
    }
    -[CapsuleNavigationBarViewController beginHidingCapsuleAnimated:](self, "beginHidingCapsuleAnimated:", 0);
    -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", -[CapsuleNavigationBarViewController _capsuleShouldShowAlternateToolbarDuringTabViewTransition](self, "_capsuleShouldShowAlternateToolbarDuringTabViewTransition"), 0);
    if (objc_msgSend(v7, "presentationState") == 1)
      -[SFCapsuleCollectionView installAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "installAlternateToolbarContentIfNeeded");
    goto LABEL_9;
  }
}

id __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id v3;
  UnifiedField *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x1E0D4EC20]);
    v4 = objc_alloc_init(UnifiedField);
    v5 = (void *)objc_msgSend(v3, "initWithTextField:", v4);

    WBSMakeAccessibilityIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v6);

    v7 = objc_loadWeakRetained(WeakRetained + 139);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_2;
      v9[3] = &unk_1E9CF1BF8;
      objc_copyWeak(&v11, v1);
      v10 = v7;
      objc_msgSend(v5, "setVoiceSearchTappedAction:", v9);

      objc_destroyWeak(&v11);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __49__CapsuleNavigationBarViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "capsuleNavigationBarViewControllerDidTapVoiceSearch:", WeakRetained);
    WeakRetained = v3;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarViewController;
  -[CapsuleNavigationBarViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[SFCapsuleCollectionView relinquishAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "relinquishAlternateToolbarContentIfNeeded");
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabThumbnailCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "removePresentationObserver:", self);
  -[SFCapsuleNavigationBar removeFromSuperview](self->_sizingNavigationBar, "removeFromSuperview");
  -[SFCapsuleNavigationBar removeFromSuperview](self->_minimizedSizingNavigationBar, "removeFromSuperview");

}

- (id)nextResponder
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CapsuleNavigationBarViewController;
    -[CapsuleNavigationBarViewController nextResponder](&v8, sel_nextResponder);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)parentFocusEnvironment
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CapsuleNavigationBarViewController;
    -[CapsuleNavigationBarViewController parentFocusEnvironment](&v8, sel_parentFocusEnvironment);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4
{
  UIResponder **p_customNextResponder;
  id obj;

  p_customNextResponder = &self->_customNextResponder;
  obj = a4;
  objc_storeWeak((id *)p_customNextResponder, a3);
  objc_storeWeak((id *)&self->_customParentFocusEnvironment, obj);

}

- (void)beginHidingCapsuleAnimated:(BOOL)a3
{
  ++self->_hideCapsuleCount;
  -[CapsuleNavigationBarViewController _updateHidingCapsuleAnimated:](self, "_updateHidingCapsuleAnimated:", a3);
}

- (void)endHidingCapsuleAnimated:(BOOL)a3
{
  --self->_hideCapsuleCount;
  -[CapsuleNavigationBarViewController _updateHidingCapsuleAnimated:](self, "_updateHidingCapsuleAnimated:", a3);
}

- (void)_updateHidingCapsuleAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t hideCapsuleCount;
  SFCapsuleCollectionView *capsuleCollectionView;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = a3;
  hideCapsuleCount = self->_hideCapsuleCount;
  capsuleCollectionView = self->_capsuleCollectionView;
  if (hideCapsuleCount)
  {
    v7 = -[SFCapsuleCollectionView isInteractivelySelectingItem](capsuleCollectionView, "isInteractivelySelectingItem") ^ 1;
    if (-[SFCapsuleCollectionView itemsAreHidden](self->_capsuleCollectionView, "itemsAreHidden") == (_DWORD)v7)
      return;
  }
  else
  {
    if ((-[SFCapsuleCollectionView itemsAreHidden](capsuleCollectionView, "itemsAreHidden") & 1) == 0)
      return;
    v7 = 0;
  }
  -[SFCapsuleCollectionView setItemsAreHidden:](self->_capsuleCollectionView, "setItemsAreHidden:", v7);
  if (v3)
  {
    if (-[CapsuleNavigationBarViewController _shouldAttachCapsuleForTabViewTransition](self, "_shouldAttachCapsuleForTabViewTransition"))
    {
      -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tabOverview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0.0;
      if (objc_msgSend(v9, "presentationState") == 3)
      {
        if (-[CapsuleNavigationBarViewController capsuleCollectionViewShouldDelayToolbarPresentation:](self, "capsuleCollectionViewShouldDelayToolbarPresentation:", self->_capsuleCollectionView))
        {
          v10 = 0.38;
        }
        else
        {
          v10 = 0.0;
        }
      }

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke;
      v12[3] = &unk_1E9CF1900;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animated:usingFastSpringWithDelay:options:animations:completion:", 1, 2, v12, 0, v10);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke_2;
      v11[3] = &unk_1E9CF1900;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v11, 0);
    }
  }
}

uint64_t __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "layoutIfNeeded");
}

uint64_t __67__CapsuleNavigationBarViewController__updateHidingCapsuleAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "layoutIfNeeded");
}

- (BOOL)_shouldAttachCapsuleForTabViewTransition
{
  if (-[TabController isPrivateBrowsingAndLocked](self->_tabController, "isPrivateBrowsingAndLocked"))
    return 0;
  if (-[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle") == 1)
    return -[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState") != 0;
  return 1;
}

- (BOOL)_capsuleShouldShowAlternateToolbarDuringTabViewTransition
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (void)setLinkedPageView:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_linkedPageView, a3);
  v5 = a3;
  -[SFCapsuleCollectionView setLinkedPageView:](self->_capsuleCollectionView, "setLinkedPageView:", v5);
  objc_msgSend(v5, "setCapsuleIndexProvider:", self);

}

- (BOOL)capsuleIsMinimized
{
  return -[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized");
}

- (id)_dragPreviewForNavigationBar:(id)a3
{
  void *v4;
  void *v5;
  id v6;
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
  void *v17;
  void *v18;
  void *v19;

  -[SFCapsuleCollectionView viewForItemAtIndex:](self->_capsuleCollectionView, "viewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleCollectionView capsuleBackgroundCornerRadius](self->_capsuleCollectionView, "capsuleBackgroundCornerRadius");
  objc_msgSend(v4, "_setContinuousCornerRadius:");
  -[SFCapsuleCollectionView contentViewForItemAtIndex:](self->_capsuleCollectionView, "contentViewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v7 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toView:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SFCapsuleCollectionView capsuleBackgroundCornerRadius](self->_capsuleCollectionView, "capsuleBackgroundCornerRadius");
  objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisiblePath:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:", v4, v6);
  return v19;
}

- (void)updateVisibleContextMenu
{
  UIContextMenuInteraction *contextMenuInteraction;
  _QWORD v3[5];

  if (self->_showingContextMenu)
  {
    contextMenuInteraction = self->_contextMenuInteraction;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __62__CapsuleNavigationBarViewController_updateVisibleContextMenu__block_invoke;
    v3[3] = &unk_1E9CF2C00;
    v3[4] = self;
    -[UIContextMenuInteraction updateVisibleMenuWithBlock:](contextMenuInteraction, "updateVisibleMenuWithBlock:", v3);
  }
}

id __62__CapsuleNavigationBarViewController_updateVisibleContextMenu__block_invoke(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_contextMenuActionProvider");
  v1 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "unifiedField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isFirstResponder")
      && (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
    {
      objc_msgSend(v2, "resignFirstResponder");
    }
    else
    {
      objc_msgSend(v3, "transitionToState:animated:completionHandler:", 0, 1, 0);
    }

    WeakRetained = v3;
  }

}

void __71__CapsuleNavigationBarViewController__updateSelectedItemAccessoryViews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isHighlighted");
  objc_msgSend(v7, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBaseForegroundColor:", v6);

  }
  else
  {
    objc_msgSend(v2, "setBaseForegroundColor:", v4);
  }

  objc_msgSend(v7, "setConfiguration:", v2);
}

BOOL __86__CapsuleNavigationBarViewController__updateTabDocumentsWithoutUpdatingCollectionView__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) != a2;
}

- (BOOL)_activeWebViewIsFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CapsuleNavigationBarViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeWebView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isDescendantOfView:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  int v5;
  id WeakRetained;

  self->_keyboardIsVisible = 1;
  if (!self->_unminimizeOnHideKeyboard)
  {
    -[SFCapsuleCollectionView contentViewForItemAtIndex:](self->_capsuleCollectionView, "contentViewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex", a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateConstraints");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(WeakRetained, "capsuleNavigationBarViewControllerIsTrackingDropSession:", self) & 1) == 0)
    {
      v5 = objc_msgSend(WeakRetained, "capsuleNavigationBarViewControllerIsShowingFindOnPage:", self);
      if ((-[CapsuleNavigationBarViewController _activeWebViewIsFirstResponder](self, "_activeWebViewIsFirstResponder")
         || v5)
        && -[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle") != 2)
      {
        self->_unminimizeOnHideKeyboard = (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized") | v5) ^ 1;
        -[SFCapsuleCollectionView setSelectedItemState:animated:](self->_capsuleCollectionView, "setSelectedItemState:animated:", 1, 1);
      }
    }

  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  self->_keyboardIsVisible = 0;
  if (self->_unminimizeOnHideKeyboard && !self->_showingContextMenu)
  {
    self->_unminimizeOnHideKeyboard = 0;
    self->_transitioningToNormalStateForKeyboardDismissal = 1;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__CapsuleNavigationBarViewController__keyboardWillHide___block_invoke;
    v5[3] = &unk_1E9CF1900;
    v5[4] = self;
    -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 0, 1, v5);
  }

}

uint64_t __56__CapsuleNavigationBarViewController__keyboardWillHide___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1090) = 0;
  return result;
}

- (void)tabController:(id)a3 didReplaceTabDocument:(id)a4 withTabDocument:(id)a5
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;

  v6 = a5;
  -[CapsuleNavigationBarViewController _updateTabDocumentsWithoutUpdatingCollectionView](self, "_updateTabDocumentsWithoutUpdatingCollectionView");
  v7 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CapsuleNavigationBarViewController capsuleCollectionView](self, "capsuleCollectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadItemsAtIndexes:", v8);

  }
}

- (void)tabController:(id)a3 didInsertTabDocument:(id)a4
{
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 1, a4);
}

- (void)tabController:(id)a3 didCloseTabDocuments:(id)a4
{
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 1, a4);
}

- (void)tabController:(id)a3 didMoveTabDocument:(id)a4 overTabDocument:(id)a5
{
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 0, a4, a5);
}

- (void)tabControllerDidChangeCurrentTabDocuments:(id)a3
{
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 0);
}

- (void)tabControllerWillBeginUpdates:(id)a3
{
  -[SFCapsuleCollectionView beginUpdates](self->_capsuleCollectionView, "beginUpdates", a3);
}

- (void)tabControllerDidEndUpdates:(id)a3
{
  -[SFCapsuleCollectionView endUpdates](self->_capsuleCollectionView, "endUpdates", a3);
}

- (void)tabDocumentWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized", a3, a4))-[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 0, 1, 0);
}

- (void)tabDocumentDidStartLoading:(id)a3
{
  -[SFCapsuleCollectionView updateTrailingActionAnimated:](self->_capsuleCollectionView, "updateTrailingActionAnimated:", 1);
}

- (void)_attachSelectedCapsuleToTabOverview
{
  TabDocument *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  id v16;
  TabDocument *obj;
  _QWORD v18[4];
  id v19;
  id v20;
  CapsuleNavigationBarViewController *v21;
  id v22;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v3 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  if (self->_attachedTab != v3)
  {
    obj = v3;
    -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabOverview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TabDocument tabOverviewItem](obj, "tabOverviewItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SFCapsuleCollectionView selectedItemIndex](self->_capsuleCollectionView, "selectedItemIndex");
      -[SFCapsuleCollectionView viewForItemAtIndex:](self->_capsuleCollectionView, "viewForItemAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState") != 4)
        goto LABEL_7;
      objc_msgSend(v9, "presentationLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
        v10 = v9;
      objc_msgSend(v10, "opacity");
      v13 = v12;

      if (v13 != 0.0)
      {
LABEL_7:
        objc_storeStrong((id *)&self->_attachedTab, obj);
        -[SFCapsuleCollectionView detachViewForItemAtIndex:](self->_capsuleCollectionView, "detachViewForItemAtIndex:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0DC3F10];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __73__CapsuleNavigationBarViewController__attachSelectedCapsuleToTabOverview__block_invoke;
        v18[3] = &unk_1E9CF2AF8;
        v19 = v14;
        v20 = v5;
        v21 = self;
        v22 = v6;
        v16 = v14;
        objc_msgSend(v15, "performWithoutAnimation:", v18);

      }
    }

    v3 = obj;
  }

}

uint64_t __73__CapsuleNavigationBarViewController__attachSelectedCapsuleToTabOverview__block_invoke(_QWORD *a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  uint64_t v5;
  _OWORD v7[3];

  v2 = (void *)a1[4];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v7);
  v5 = a1[4];
  v4 = (void *)a1[5];
  objc_msgSend(*(id *)(a1[6] + 1008), "capsuleFrame");
  return objc_msgSend(v4, "attachView:withReferenceRect:toItem:", v5, a1[7]);
}

- (void)_reattachCapsuleToCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  TabDocument *attachedTab;
  id v7;

  if (self->_attachedTab)
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tabOverview");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[TabDocument tabOverviewItem](self->_attachedTab, "tabOverviewItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachedViewForItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachView:withReferenceRect:toItem:", 0, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SFCapsuleCollectionView reattachView:](self->_capsuleCollectionView, "reattachView:", v5);
    attachedTab = self->_attachedTab;
    self->_attachedTab = 0;

  }
}

- (void)_installDetachedCapsuleInCollectionView
{
  int64_t v3;

  if (self->_attachedTab)
  {
    v3 = -[CapsuleNavigationBarViewController collectionViewIndexOfTab:](self, "collectionViewIndexOfTab:");
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
      -[SFCapsuleCollectionView takeOwnershipOfDetachedViewForItemAtIndex:](self->_capsuleCollectionView, "takeOwnershipOfDetachedViewForItemAtIndex:", v3);
  }
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((SFTabGroupSwitcherEnabled() & 1) != 0)
  {
    objc_msgSend(v7, "tabViewContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateToolbarContentProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView setAlternateToolbarContentProvider:](self->_capsuleCollectionView, "setAlternateToolbarContentProvider:", v5);

  }
  -[SFCapsuleCollectionView installAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "installAlternateToolbarContentIfNeeded");
  -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", -[CapsuleNavigationBarViewController _capsuleShouldShowAlternateToolbarDuringTabViewTransition](self, "_capsuleShouldShowAlternateToolbarDuringTabViewTransition"), 1);
  if (!-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState")
    && (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized") & 1) == 0)
  {
    objc_msgSend(v7, "tabOverview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPresentedTabLayout:", 0);

    if (-[CapsuleNavigationBarViewController _shouldAttachCapsuleForTabViewTransition](self, "_shouldAttachCapsuleForTabViewTransition"))
    {
      -[CapsuleNavigationBarViewController _attachSelectedCapsuleToTabOverview](self, "_attachSelectedCapsuleToTabOverview");
      -[CapsuleNavigationBarViewController _installDetachedCapsuleInCollectionView](self, "_installDetachedCapsuleInCollectionView");
    }
  }
  -[CapsuleNavigationBarViewController beginHidingCapsuleAnimated:](self, "beginHidingCapsuleAnimated:", 1);

}

- (void)tabCollectionViewDidPresent:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", -[CapsuleNavigationBarViewController _capsuleShouldShowAlternateToolbarDuringTabViewTransition](self, "_capsuleShouldShowAlternateToolbarDuringTabViewTransition", a3), 0);
  -[SFCapsuleCollectionView relinquishAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "relinquishAlternateToolbarContentIfNeeded");
  if (!-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState"))
    -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 0, 0, 0);
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabOverview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "presentingInteractively");

  if ((v6 & 1) == 0)
    -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  -[SFCapsuleCollectionView installAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "installAlternateToolbarContentIfNeeded", a3);
  if (-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState")
    || (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized") & 1) != 0
    || !-[CapsuleNavigationBarViewController _shouldAttachCapsuleForTabViewTransition](self, "_shouldAttachCapsuleForTabViewTransition"))
  {
    -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
  }
  else
  {
    -[CapsuleNavigationBarViewController _attachSelectedCapsuleToTabOverview](self, "_attachSelectedCapsuleToTabOverview");
    -[CapsuleNavigationBarViewController _installDetachedCapsuleInCollectionView](self, "_installDetachedCapsuleInCollectionView");
  }
  -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", 0, 1);
  -[CapsuleNavigationBarViewController endHidingCapsuleAnimated:](self, "endHidingCapsuleAnimated:", 1);
}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  void *v4;
  void *v5;

  -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", -[CapsuleNavigationBarViewController _capsuleShouldShowAlternateToolbarDuringTabViewTransition](self, "_capsuleShouldShowAlternateToolbarDuringTabViewTransition", a3), 0);
  if (!-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState"))
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabOverview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentedTabLayout:", 0);

  }
  -[CapsuleNavigationBarViewController beginHidingCapsuleAnimated:](self, "beginHidingCapsuleAnimated:", 1);
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  void *v4;
  void *v5;

  -[SFCapsuleCollectionView setShowingAlternateToolbarContent:animated:](self->_capsuleCollectionView, "setShowingAlternateToolbarContent:animated:", 0, 0);
  -[SFCapsuleCollectionView relinquishAlternateToolbarContentIfNeeded](self->_capsuleCollectionView, "relinquishAlternateToolbarContentIfNeeded");
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabOverview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentedTabLayout:", 0);

  -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
}

- (void)tabOverviewWillBeginInteractivePresentation:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SFCapsuleCollectionView selectionGestureState](self->_capsuleCollectionView, "selectionGestureState")
    && (-[SFCapsuleCollectionView selectedItemIsMinimized](self->_capsuleCollectionView, "selectedItemIsMinimized") & 1) == 0
    && -[CapsuleNavigationBarViewController _shouldAttachCapsuleForTabViewTransition](self, "_shouldAttachCapsuleForTabViewTransition"))
  {
    -[CapsuleNavigationBarViewController _attachSelectedCapsuleToTabOverview](self, "_attachSelectedCapsuleToTabOverview");
    -[CapsuleNavigationBarViewController _installDetachedCapsuleInCollectionView](self, "_installDetachedCapsuleInCollectionView");
  }
  -[CapsuleNavigationBarViewController tabOverviewDidUpdateInteractivePresentation:](self, "tabOverviewDidUpdateInteractivePresentation:", v4);

}

- (void)tabOverviewDidUpdateInteractivePresentation:(id)a3
{
  void *v4;
  id v5;
  double Height;
  double v7;
  double v8;
  id v9;
  CGRect v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v10);
  objc_msgSend(v5, "scalePercentageForActiveItem");
  v8 = v7;

  objc_msgSend(v4, "numberWithDouble:", fmax(Height * v8 * 0.5, 0.0));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleCollectionView setToolbarOffsetForPinchTransition:](self->_capsuleCollectionView, "setToolbarOffsetForPinchTransition:", v9);

}

- (void)tabOverviewWillEndInteractivePresentation:(id)a3
{
  SFCapsuleCollectionView *capsuleCollectionView;
  id v5;
  uint64_t v6;

  capsuleCollectionView = self->_capsuleCollectionView;
  v5 = a3;
  -[SFCapsuleCollectionView setToolbarOffsetForPinchTransition:](capsuleCollectionView, "setToolbarOffsetForPinchTransition:", 0);
  v6 = objc_msgSend(v5, "presentationState");

  if (v6 == 2)
    -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
}

- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sfScribbleControllerIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScribbling") ^ 1;

  return v5;
}

- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  TabController *tabController;
  id v5;

  tabController = self->_tabController;
  -[CapsuleNavigationBarViewController tabAtCollectionViewIndex:](self, "tabAtCollectionViewIndex:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTab:](tabController, "setActiveTab:", v5);

}

- (void)capsuleCollectionView:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id nextStateChangeCompletionHandler;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  CapsuleNavigationBarViewController *v19;
  int64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (self->_nextStateChangeCompletionHandler)
  {
    objc_msgSend(v11, "addCompletion:");
    nextStateChangeCompletionHandler = self->_nextStateChangeCompletionHandler;
    self->_nextStateChangeCompletionHandler = 0;

  }
  if (a4 != 1
    && -[CapsuleNavigationBarViewController _activeWebViewIsFirstResponder](self, "_activeWebViewIsFirstResponder")
    && self->_keyboardIsVisible)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke;
    v22[3] = &unk_1E9CF2CF8;
    v22[4] = self;
    objc_msgSend(v12, "addAnimations:", v22);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((a4 == 1) == objc_msgSend(v10, "selectedItemIsMinimized")
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (a4 == 2)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_2;
      v21[3] = &unk_1E9CF2CF8;
      v21[4] = self;
      objc_msgSend(v12, "addAnimations:", v21);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "capsuleNavigationController:obscuredInsetsDidChangeWithCoordinator:", self, v12);
  }
  v15 = objc_msgSend(v10, "selectedItemState");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "capsuleNavigationBarViewController:selectedItemWillChangeToState:options:coordinator:", self, a4, a5, v12);
  if (a4 == 2 || v15 == 2)
  {
    self->_capsuleIsFocused = a4 == 2;
    if (objc_msgSend(v10, "numberOfItems"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v10, "selectedItemIndex"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadItemsAtIndexes:", v16);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_3;
    v17[3] = &unk_1E9CF2D20;
    v19 = self;
    v20 = a5;
    v18 = WeakRetained;
    objc_msgSend(v12, "addAnimations:", v17);

  }
}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "activeTabDocument");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeWebView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resignFirstResponder");

}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __110__CapsuleNavigationBarViewController_capsuleCollectionView_selectedItemWillChangeToState_options_coordinator___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (objc_msgSend(v5, "isTransition"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "capsuleNavigationBarViewControllerDidChangeCapsuleFocus:options:", *(_QWORD *)(a1 + 40), v4);
  }

}

- (unint64_t)capsuleCollectionViewBoundaryEdgesForScrollableContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CapsuleNavigationBarViewController _boundaryEdgesForScrollView:](self, "_boundaryEdgesForScrollView:", v6);
  return v7;
}

- (unint64_t)_boundaryEdgesForScrollView:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;

  v3 = a3;
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "contentInset");
  v7 = v6;
  v9 = v5 <= -v8;
  objc_msgSend(v3, "bounds");
  v10 = v5 + CGRectGetHeight(v14);
  objc_msgSend(v3, "contentSize");
  v12 = v11;

  if (v10 >= v12 - v7)
    return v9 | 4;
  else
    return v9;
}

- (double)capsuleCollectionView:(id)a3 distanceToTopEdgeIncludingDeceleration:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a4;
  -[TabController activeTabDocument](self->_tabController, "activeTabDocument", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeWebView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  objc_msgSend(v8, "_verticalVelocity");
  if (v4)
  {
    v12 = v11;
    if (v11 != 0.0)
    {
      objc_msgSend(v8, "decelerationRate");
      v14 = v13;
      v15 = dbl_1D7EA8430[v12 < 0.0];
      objc_msgSend(v8, "_verticalVelocity");
      v10 = v10 - (v16 - v15) / log(v14);
    }
  }
  objc_msgSend(v8, "contentInset");
  v18 = v10 + v17;
  -[SFCapsuleCollectionView obscuredInsetsForState:](self->_capsuleCollectionView, "obscuredInsetsForState:", 0);
  v20 = v18 - v19;
  -[SFCapsuleCollectionView obscuredInsetsForState:](self->_capsuleCollectionView, "obscuredInsetsForState:", -[SFCapsuleCollectionView selectedItemState](self->_capsuleCollectionView, "selectedItemState"));
  v22 = v20 + v21;

  return v22;
}

void __77__CapsuleNavigationBarViewController_trailingActionForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[134], "setInteractivelyInserted:", 0);
    objc_msgSend(v2[138], "setActiveTabDocument:", v2[134]);
    WeakRetained = v2;
  }

}

void __72__CapsuleNavigationBarViewController_topActionForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[138], "tabCollectionViewProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tabThumbnailCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "endInteractivePresentationAllowingDismissalToTargetItem:", 0);
      objc_msgSend(v4, "setPresentedTabLayout:", 0);

    }
    else
    {
      objc_msgSend(v3, "presentAnimated:", 1);
    }
    objc_msgSend(v5, "_updateHidingCapsuleAnimated:", 1);

    WeakRetained = v5;
  }

}

- (BOOL)capsuleCollectionViewAllowsMinimizationGesture:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  if (self->_keyboardIsVisible
    && -[SFCapsuleCollectionView layoutStyle](self->_capsuleCollectionView, "layoutStyle") != 2)
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(WeakRetained, "capsuleNavigationBarViewControllerAllowsMinimizationGesture:", self);
    else
      v6 = 1;

  }
  return v6;
}

- (double)capsuleCollectionViewMinimizedContentScale:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[SFCapsuleNavigationBar urlSize](self->_minimizedSizingNavigationBar, "urlSize", a3);
  v5 = v4;
  -[SFCapsuleNavigationBar urlSize](self->_sizingNavigationBar, "urlSize");
  return v5 / v6;
}

- (BOOL)capsuleCollectionViewContentScaleCompletesMinimization:(id)a3
{
  CGRect v5;
  CGRect v6;

  -[CapsuleNavigationBarViewController capsuleCollectionViewMinimizedContentScale:](self, "capsuleCollectionViewMinimizedContentScale:", a3);
  -[SFCapsuleNavigationBar keyContentRect](self->_sizingNavigationBar, "keyContentRect");
  CGRectGetWidth(v5);
  -[SFCapsuleNavigationBar keyContentRect](self->_minimizedSizingNavigationBar, "keyContentRect");
  CGRectGetWidth(v6);
  return _SFEqualWithEpsilon();
}

- (void)capsuleCollectionViewWillHideKeyboard:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "capsuleNavigationBarViewControllerWillHideKeyboard:", self);

}

- (void)capsuleCollectionView:(id)a3 willChangeToLayoutStyle:(int64_t)a4
{
  -[SFCapsuleNavigationBar setLayoutStyle:](self->_sizingNavigationBar, "setLayoutStyle:", a4);
  -[SFCapsuleNavigationBar setLayoutStyle:](self->_minimizedSizingNavigationBar, "setLayoutStyle:", a4);
}

- (void)capsuleCollectionViewLayoutStyleDidChange:(id)a3
{
  -[CapsuleNavigationBarViewController _updateSelectedItemAccessoryViews](self, "_updateSelectedItemAccessoryViews", a3);
  -[CapsuleNavigationBarViewController _updateTabDocumentsAnimated:](self, "_updateTabDocumentsAnimated:", 0);
}

- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  TabDocument *v9;
  void *v10;
  void *v11;
  TabDocument *v12;
  TabDocument *interactivelyInsertedTabDocument;
  TabController *tabController;
  TabDocument *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  self->_lastSwipeAxis = a4;
  -[CapsuleNavigationBarViewController _reattachCapsuleToCollectionView](self, "_reattachCapsuleToCollectionView");
  -[CapsuleNavigationBarViewController _updateHidingCapsuleAnimated:](self, "_updateHidingCapsuleAnimated:", 1);
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabOverview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPresentedTabLayout:", 1);
  objc_msgSend(v7, "beginInteractivePresentationWithOffset:scale:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  v8 = objc_msgSend(v21, "selectedItemIndex");
  if (v8 == objc_msgSend(v21, "numberOfItems") - 1
    && !self->_interactivelyInsertedTabDocument
    && objc_msgSend(v21, "hasTrailingAction"))
  {
    v9 = [TabDocument alloc];
    -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "browserController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TabDocument initWithBrowserController:](v9, "initWithBrowserController:", v11);
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = v12;

    -[TabDocument setIsBlank:](self->_interactivelyInsertedTabDocument, "setIsBlank:", 1);
    -[TabDocument setInteractivelyInserted:](self->_interactivelyInsertedTabDocument, "setInteractivelyInserted:", 1);
    -[TabDocument displayNewTabOverridePageIfNecessary](self->_interactivelyInsertedTabDocument, "displayNewTabOverridePageIfNecessary");
    tabController = self->_tabController;
    v15 = self->_interactivelyInsertedTabDocument;
    -[TabController currentTabs](tabController, "currentTabs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController insertTab:afterTab:inBackground:animated:](tabController, "insertTab:afterTab:inBackground:animated:", v15, v17, 1, 1);

    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateSnapshotIdentifiers");

    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tabSwitcherViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applyContentIfNeeded");

  }
}

- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7
{
  id v12;
  unint64_t lastSwipeAxis;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  int64_t v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v12 = a3;
  lastSwipeAxis = self->_lastSwipeAxis;
  self->_lastSwipeAxis = a7;
  objc_msgSend(v12, "linkedPageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tabOverview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "targetScaleWithTabLayout:", 0);
    v18 = (v17 + -1.0) * a6 + 1.0;
    LODWORD(v15) = objc_msgSend(v12, "_sf_usesLeftToRightLayout");
    v19 = objc_msgSend(v12, "selectedItemIndex");
    if ((_DWORD)v15)
      v20 = v19 < a5;
    else
      v20 = v19 > a5;
    objc_msgSend(v16, "frame");
    v21 = CGRectGetWidth(v37) * a4 * 1.2;
    if (v20)
      v22 = -v21;
    else
      v22 = v21;
    objc_msgSend(v16, "frame");
    v23 = (1.0 - v18) * CGRectGetWidth(v38) * 0.5;
    objc_msgSend(v12, "selectedCapsuleOffset");
    v25 = v23 + v24;
    if (a7 != 1 || a4 == 0.0)
      v27 = v25;
    else
      v27 = v22;
    objc_msgSend(v16, "frame", v25);
    v28 = (1.0 - v18) * CGRectGetHeight(v39) * 0.5;
    objc_msgSend(v12, "selectedCapsuleOffset");
    v30 = v28 + v18 * v29 * 0.5;
    if (self->_interactivelyInsertedTabDocument)
    {
      -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tabOverview");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "numberOfItems") != a5)
        a4 = 0.0;
      -[TabDocument tabOverviewItem](self->_interactivelyInsertedTabDocument, "tabOverviewItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setInteractiveInsertionProgress:forItem:", v33, a4);

    }
    objc_msgSend(v16, "updateInteractivePresentationWithOffset:scale:animated:", lastSwipeAxis != a7, v27, v30, v18);
    CGAffineTransformMakeScale(&v36, v18, v18);
    objc_msgSend(v12, "viewForItemAtIndex:", objc_msgSend(v12, "selectedItemIndex"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v36;
    objc_msgSend(v34, "setTransform:", &v35);

  }
}

- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  void *v15;
  _QWORD v16[4];
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "linkedPageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "viewForItemAtIndex:", objc_msgSend(v6, "selectedItemIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "selectionGestureState") == 4)
    {
      -[CapsuleNavigationBarViewController _attachSelectedCapsuleToTabOverview](self, "_attachSelectedCapsuleToTabOverview");
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke;
      v16[3] = &unk_1E9CF1900;
      v17 = v9;
      v11 = v9;
      objc_msgSend(v10, "performWithoutAnimation:", v16);
      v12 = v17;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2;
      v14[3] = &unk_1E9CF2CF8;
      v15 = v9;
      v13 = v9;
      objc_msgSend(v7, "addAnimations:", v14);
      v12 = v15;
    }

  }
}

uint64_t __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __99__CapsuleNavigationBarViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)capsuleCollectionViewDidEndSelectionGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TabDocument *interactivelyInsertedTabDocument;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_interactivelyInsertedTabDocument)
  {
    -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabOverview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument tabOverviewItem](self->_interactivelyInsertedTabDocument, "tabOverviewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractiveInsertionProgress:forItem:", v6, 1.0);

    -[TabController closeTab:animated:](self->_tabController, "closeTab:animated:", self->_interactivelyInsertedTabDocument, 0);
    interactivelyInsertedTabDocument = self->_interactivelyInsertedTabDocument;
    self->_interactivelyInsertedTabDocument = 0;

  }
  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabOverview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "presentingInteractively"))
  {
    objc_msgSend(v9, "endInteractivePresentationAllowingDismissalToTargetItem:", 0);
    objc_msgSend(v9, "dismissAnimated:", 1);
    -[CapsuleNavigationBarViewController _updateHidingCapsuleAnimated:](self, "_updateHidingCapsuleAnimated:", 1);
  }

}

- (id)tabAtCollectionViewIndex:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", a3);
}

- (int64_t)collectionViewIndexOfTab:(id)a3
{
  return -[NSArray indexOfObject:](self->_tabs, "indexOfObject:", a3);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  SFCapsuleCollectionView *capsuleCollectionView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  capsuleCollectionView = self->_capsuleCollectionView;
  v8 = a3;
  -[SFCapsuleCollectionView contentViewForItemAtIndex:](capsuleCollectionView, "contentViewForItemAtIndex:", -[SFCapsuleCollectionView selectedItemIndex](capsuleCollectionView, "selectedItemIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    objc_msgSend(v6, "locationInView:", v9);
    objc_msgSend(v9, "hitTest:withEvent:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingButtons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", v12))
    {

    }
    else
    {
      objc_msgSend(v9, "trailingButtons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v12);

      if ((v15 & 1) == 0)
      {
        -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "urlForSharing");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB36C8], "safari_itemProviderForTabDocument:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v18);
          objc_msgSend(v19, "setLocalObject:", v17);
          v21[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = (void *)MEMORY[0x1E0C9AA60];
        }

        goto LABEL_11;
      }
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_11:

    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_12:

  return v11;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = (void *)MEMORY[0x1E0D89B98];
  v6 = a4;
  objc_msgSend(v5, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStartDragWithDragContentType:", 2);

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalContext:", v9);

  objc_msgSend(v6, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__CapsuleNavigationBarViewController_dragInteraction_sessionWillBegin___block_invoke;
  v14[3] = &unk_1E9CF2D48;
  v15 = v12;
  v13 = v12;
  objc_msgSend(v11, "setPreviewProvider:", v14);

}

id __71__CapsuleNavigationBarViewController_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0DC3760];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previewForURL:title:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CapsuleNavigationBarViewController _dragPreviewForNavigationBar:](self, "_dragPreviewForNavigationBar:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasQuickLookContent"))
  {
    objc_msgSend(v4, "quickLookDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isURLManaged:", v7))
      v8 = 2;
    else
      v8 = 3;

  }
  else
  {
    v8 = 3;
  }

  return v8;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a4, "localDragSession", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqual:", v6))
  {

LABEL_5:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
    goto LABEL_6;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);

LABEL_6:
  return v9;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)MEMORY[0x1E0D4EF70];
  v6 = a4;
  objc_msgSend(v5, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CapsuleNavigationBarViewController_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E9CF2D70;
  v8[4] = self;
  objc_msgSend(v7, "buildNavigationIntentForDropSession:completionHandler:", v6, v8);

}

void __66__CapsuleNavigationBarViewController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
    v3 = a2;
    objc_msgSend(v2, "activeTabDocument");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dispatchNavigationIntent:", v3);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CapsuleNavigationBarViewController _contextMenuActionProvider](self, "_contextMenuActionProvider", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self->_showingContextMenu = 1;
    v6 = (void *)MEMORY[0x1E0DC36B8];
    -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextMenuActionProvider
{
  void *v3;
  void *v4;
  void *v5;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabMenuProviderDataSource](self->_tabController, "tabMenuProviderDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabMenuProvider actionProviderForTab:dataSource:options:](TabMenuProvider, "actionProviderForTab:dataSource:options:", v3, v4, 2065);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CapsuleNavigationBarViewController _dragPreviewForNavigationBar:](self, "_dragPreviewForNavigationBar:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CapsuleNavigationBarViewController _dragPreviewForNavigationBar:](self, "_dragPreviewForNavigationBar:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  SFCapsuleCollectionView *capsuleCollectionView;
  id v7;

  capsuleCollectionView = self->_capsuleCollectionView;
  v7 = a5;
  -[SFCapsuleCollectionView setIgnoresKeyboardHideEvents:](capsuleCollectionView, "setIgnoresKeyboardHideEvents:", 1);
  -[SFCapsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:animator:](self->_capsuleCollectionView, "setSelectedItemUsesLiftedPreviewAppearance:animator:", 1, v7);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  SFCapsuleCollectionView *capsuleCollectionView;
  id v7;

  self->_showingContextMenu = 0;
  capsuleCollectionView = self->_capsuleCollectionView;
  v7 = a5;
  -[SFCapsuleCollectionView setIgnoresKeyboardHideEvents:](capsuleCollectionView, "setIgnoresKeyboardHideEvents:", 0);
  -[SFCapsuleCollectionView setSelectedItemUsesLiftedPreviewAppearance:animator:](self->_capsuleCollectionView, "setSelectedItemUsesLiftedPreviewAppearance:animator:", 0, v7);

}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  (*((void (**)(id, void *, uint64_t, CGPoint, __n128, CGSize, __n128))a5 + 2))(a5, &unk_1E9D62838, 0x7FFFFFFFFFFFFFFFLL, a4.origin, *(__n128 *)&a4.origin.y, a4.size, *(__n128 *)&a4.size.height);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CapsuleNavigationBarViewController selectedItemNavigationBar](self, "selectedItemNavigationBar", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a6;
  self->_focusingForScribble = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__CapsuleNavigationBarViewController__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v9[3] = &unk_1E9CF2D98;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[CapsuleNavigationBarViewController transitionToState:animated:completionHandler:](self, "transitionToState:animated:completionHandler:", 2, 1, v9);

}

void __119__CapsuleNavigationBarViewController__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "unifiedField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1089) = 0;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (CapsuleNavigationBarViewControllerDelegate)delegate
{
  return (CapsuleNavigationBarViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIResponder)customNextResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_customNextResponder);
}

- (UIFocusEnvironment)customParentFocusEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
}

- (BOOL)focusingForScribble
{
  return self->_focusingForScribble;
}

- (CapsuleNavigationBarLinkablePageView)linkedPageView
{
  return self->_linkedPageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPageView, 0);
  objc_destroyWeak((id *)&self->_customParentFocusEnvironment);
  objc_destroyWeak((id *)&self->_customNextResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_storeStrong((id *)&self->_cachedSelectedItemNavigationBar, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_interactivelyInsertedTabDocument, 0);
  objc_storeStrong((id *)&self->_minimizedSizingNavigationBar, 0);
  objc_storeStrong((id *)&self->_sizingNavigationBar, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_capsuleCollectionView, 0);
  objc_storeStrong((id *)&self->_attachedTab, 0);
  objc_storeStrong(&self->_nextStateChangeCompletionHandler, 0);
}

@end
