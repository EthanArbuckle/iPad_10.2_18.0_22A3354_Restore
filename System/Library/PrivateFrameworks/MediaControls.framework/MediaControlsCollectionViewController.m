@implementation MediaControlsCollectionViewController

- (MediaControlsCollectionViewController)init
{
  MediaControlsCollectionViewController *v2;
  MediaControlsCollectionViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  v2 = -[MediaControlsCollectionViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MediaControlsCollectionViewController _commonInit](v2, "_commonInit");
  return v3;
}

- (MediaControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MediaControlsCollectionViewController *v4;
  MediaControlsCollectionViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsCollectionViewController;
  v4 = -[MediaControlsCollectionViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[MediaControlsCollectionViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *activeViewControllers;
  NSMutableSet *v5;
  NSMutableSet *inactiveViewControllers;
  NSMutableArray *v7;
  NSMutableArray *pendingUpdates;

  self->_displayMode = 0;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  activeViewControllers = self->_activeViewControllers;
  self->_activeViewControllers = v3;

  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  inactiveViewControllers = self->_inactiveViewControllers;
  self->_inactiveViewControllers = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pendingUpdates = self->_pendingUpdates;
  self->_pendingUpdates = v7;

  self->_selectedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_highlightedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_lastKnownEnvironmentSize = (CGSize)*MEMORY[0x1E0C9D820];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void (**dismissalBlock)(id, id);
  objc_super v5;

  dismissalBlock = (void (**)(id, id))self->_dismissalBlock;
  if (dismissalBlock)
  {
    dismissalBlock[2](self->_dismissalBlock, a4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsCollectionViewController;
    -[MediaControlsCollectionViewController dismissViewControllerAnimated:completion:](&v5, sel_dismissViewControllerAnimated_completion_, a3, a4);
  }
}

- (void)viewDidLoad
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  void *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _MediaControlsTapHoldGestureRecognizer *v15;
  _MediaControlsTapHoldGestureRecognizer *tapGestureRecognizer;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewDidLoad](&v18, sel_viewDidLoad);
  CCUIExpandedModuleEdgeInsets();
  self->_controlCenterEdgeInsets.top = v3;
  self->_controlCenterEdgeInsets.left = v4;
  self->_controlCenterEdgeInsets.bottom = v5;
  self->_controlCenterEdgeInsets.right = v6;
  v7 = objc_alloc(MEMORY[0x1E0DC3C28]);
  -[MediaControlsCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = (UIScrollView *)objc_msgSend(v7, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v9;

  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setAutoresizingMask:](self->_scrollView, "setAutoresizingMask:", 18);
  -[UIScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView layer](self->_scrollView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHitTestsAsOpaque:", 1);

  -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_hysteresis");
  objc_msgSend(v12, "_setHysteresis:", v14 + v14);

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v15 = -[_MediaControlsTapHoldGestureRecognizer initWithTarget:action:]([_MediaControlsTapHoldGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleScrollViewTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  -[_MediaControlsTapHoldGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[_MediaControlsTapHoldGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", -[MediaControlsCollectionViewController _wantsTapGestureRecognizer](self, "_wantsTapGestureRecognizer"));
  -[UIScrollView addGestureRecognizer:](self->_scrollView, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[MediaControlsCollectionViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_scrollView);

  -[MediaControlsCollectionViewController updateContentInsets](self, "updateContentInsets");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  self->_appeared = 1;
  -[MediaControlsCollectionViewController _beginAppearanceTransitionForChildViewControllers:animated:](self, "_beginAppearanceTransitionForChildViewControllers:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllers](self, "_endAppearanceTransitionForChildViewControllers");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[MediaControlsCollectionViewController _beginAppearanceTransitionForChildViewControllers:animated:](self, "_beginAppearanceTransitionForChildViewControllers:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllers](self, "_endAppearanceTransitionForChildViewControllers");
  self->_appeared = 0;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsCollectionViewController;
  -[MediaControlsCollectionViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[MediaControlsCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[MediaControlsCollectionViewController _adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:](self, "_adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:", 0, v4, v5);

}

- (void)viewWillTransitionToSize:(CGSize)a3
{
  -[MediaControlsCollectionViewController _adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:](self, "_adjustForEnvironmentChangeIfNeededWithSize:transitionCoordinator:", 0, a3.width, a3.height);
}

- (id)dequeueReusableViewControllerForItemAtIndex:(int64_t)a3
{
  MediaControlsCollectionItemViewController *v4;
  MediaControlsCollectionItemViewController *v5;
  MediaControlsCollectionItemViewController *inactiveSelectedViewController;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v12[3];

  if (self->_selectedItemIndex == a3 && (v4 = self->_inactiveSelectedViewController) != 0)
  {
    v5 = v4;
    inactiveSelectedViewController = self->_inactiveSelectedViewController;
    self->_inactiveSelectedViewController = 0;

  }
  else
  {
    -[NSMutableSet anyObject](self->_inactiveViewControllers, "anyObject");
    v5 = (MediaControlsCollectionItemViewController *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMutableSet removeObject:](self->_inactiveViewControllers, "removeObject:", v5);
  }
  if (-[MediaControlsCollectionItemViewController isViewLoaded](v5, "isViewLoaded"))
  {
    -[MediaControlsCollectionItemViewController view](v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[MediaControlsCollectionItemViewController view](v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    -[MediaControlsCollectionItemViewController view](v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12[0] = *MEMORY[0x1E0C9BAA8];
    v12[1] = v10;
    v12[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v9, "setTransform:", v12);

  }
  return v5;
}

- (id)viewControllerForItemAtPoint:(CGPoint)a3
{
  return -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:", a3.x, a3.y));
}

- (id)viewControllerForItemAtIndex:(int64_t)a3
{
  void *v3;
  NSMutableDictionary *activeViewControllers;
  void *v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    activeViewControllers = self->_activeViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](activeViewControllers, "objectForKey:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)viewControllerForSelectedItem
{
  void *inactiveSelectedViewController;
  void *v4;
  id v5;

  -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", self->_selectedItemIndex);
  inactiveSelectedViewController = (void *)objc_claimAutoreleasedReturnValue();
  v4 = inactiveSelectedViewController;
  if (!inactiveSelectedViewController)
    inactiveSelectedViewController = self->_inactiveSelectedViewController;
  v5 = inactiveSelectedViewController;

  return v5;
}

- (NSArray)visibleViewControllers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  MediaControlsCollectionViewController *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController visibleIndexes](self, "visibleIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __63__MediaControlsCollectionViewController_visibleViewControllers__block_invoke;
  v11 = &unk_1E581ACF8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSArray *)v6;
}

void __63__MediaControlsCollectionViewController_visibleViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerForItemAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (NSArray)visibleTopViewControllers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, _BYTE *);
  void *v11;
  MediaControlsCollectionViewController *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController visibleIndexes](self, "visibleIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __66__MediaControlsCollectionViewController_visibleTopViewControllers__block_invoke;
  v11 = &unk_1E581ACF8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSArray *)v6;
}

void __66__MediaControlsCollectionViewController_visibleTopViewControllers__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4[141] == a2)
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v4, "viewControllerForItemAtIndex:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v5 = v6;
    }

  }
}

- (NSArray)visibleBottomViewControllers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, unint64_t);
  void *v11;
  MediaControlsCollectionViewController *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController visibleIndexes](self, "visibleIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__MediaControlsCollectionViewController_visibleBottomViewControllers__block_invoke;
  v11 = &unk_1E581ACF8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSArray *)v6;
}

void __69__MediaControlsCollectionViewController_visibleBottomViewControllers__block_invoke(uint64_t a1, unint64_t a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3[141] < a2)
  {
    objc_msgSend(v3, "viewControllerForItemAtIndex:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
      v4 = v5;
    }

  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
    self->_displayMode = a3;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  -[MediaControlsCollectionViewController setSelectedItemIndex:animated:shouldScroll:](self, "setSelectedItemIndex:animated:shouldScroll:", a3, 1, 0);
}

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5
{
  -[MediaControlsCollectionViewController _setSelectedItemIndex:animated:shouldScroll:shouldNotifyDelegate:withReason:](self, "_setSelectedItemIndex:animated:shouldScroll:shouldNotifyDelegate:withReason:", a3, a4, a5, 0, 0);
}

- (void)setScrollViewInsets:(UIEdgeInsets)a3
{
  void *v7;
  double v8;
  double v9;
  MediaControlsStyleCoordinator *v10;

  if (self->_scrollViewInsets.left != a3.left
    || self->_scrollViewInsets.top != a3.top
    || self->_scrollViewInsets.right != a3.right
    || self->_scrollViewInsets.bottom != a3.bottom)
  {
    self->_scrollViewInsets = a3;
    -[MediaControlsCollectionViewController _tileViews](self, "_tileViews");
    v10 = objc_alloc_init(MediaControlsStyleCoordinator);
    -[MediaControlsCollectionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v10, v8, v9);

    -[MediaControlsStyleCoordinator performAnimations](v10, "performAnimations");
    -[MediaControlsStyleCoordinator performCompletions](v10, "performCompletions");

  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[MediaControlsCollectionViewController _reloadDataIfNeeded](self, "_reloadDataIfNeeded");
    v5 = obj;
  }

}

- (void)insertItemAtIndex:(int64_t)a3
{
  -[MediaControlsCollectionViewCountData insertItemAtIndex:](self->_countData, "insertItemAtIndex:", a3);
}

- (void)insertItemsAtIndexes:(id)a3
{
  -[MediaControlsCollectionViewCountData insertItemsAtIndexes:](self->_countData, "insertItemsAtIndexes:", a3);
}

- (void)deleteItemAtIndex:(int64_t)a3
{
  -[MediaControlsCollectionViewCountData deleteItemAtIndex:](self->_countData, "deleteItemAtIndex:", a3);
}

- (void)deleteItemsAtIndexes:(id)a3
{
  -[MediaControlsCollectionViewCountData deleteItemsAtIndexes:](self->_countData, "deleteItemsAtIndexes:", a3);
}

- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  -[MediaControlsCollectionViewCountData moveItemAtIndex:toIndex:](self->_countData, "moveItemAtIndex:toIndex:", a3, a4);
}

- (void)reloadItemAtIndex:(int64_t)a3
{
  -[MediaControlsCollectionViewCountData reloadItemAtIndex:](self->_countData, "reloadItemAtIndex:", a3);
}

- (void)reloadItemsAtIndexes:(id)a3
{
  -[MediaControlsCollectionViewCountData reloadItemsAtIndexes:](self->_countData, "reloadItemsAtIndexes:", a3);
}

- (void)performBatchUpdates:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t selectedItemIndex;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  MediaControlsStyleCoordinator *v33;
  void *v34;
  MediaControlsStyleCoordinator *v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  NSMutableArray *pendingUpdates;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  int64_t v49;
  id v50;
  id v51;
  MediaControlsStyleCoordinator *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  __int128 v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  MediaControlsCollectionViewController *v72;
  _QWORD v73[5];
  id v74;
  MediaControlsStyleCoordinator *v75;
  _QWORD *v76;
  int64_t v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  id v84;
  MediaControlsStyleCoordinator *v85;
  id v86;
  _QWORD *v87;
  int64_t v88;
  _QWORD aBlock[4];
  id v90;
  CGAffineTransform v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  MediaControlsCollectionViewController *v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  CGAffineTransform v104;
  _QWORD v105[9];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[5];
  id v109;
  id v110;
  _QWORD *v111;
  CGAffineTransform v112;
  int64_t v113;
  _QWORD v114[4];
  id v115;
  MediaControlsCollectionViewController *v116;
  _QWORD *v117;
  uint64_t *v118;
  _QWORD v119[4];
  _QWORD v120[4];
  id v121;
  MediaControlsCollectionViewController *v122;
  id v123;
  _QWORD *v124;
  _QWORD *v125;
  uint64_t *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  int64_t v130;
  _QWORD v131[4];
  CGAffineTransform v132;
  CGAffineTransform v133;
  _QWORD v134[4];
  uint64_t v135;
  double *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;

  v4 = (void (**)(_QWORD))a3;
  if (-[MediaControlsCollectionViewController _canPerformBatchUpdates](self, "_canPerformBatchUpdates"))
  {
    self->_isPerformingBatchUpdates = 1;
    self->_shouldIgnoreScrollNotifications = 1;
    v4[2](v4);
    if (-[MediaControlsCollectionViewCountData hasPendingChanges](self->_countData, "hasPendingChanges"))
    {
      -[MediaControlsCollectionViewController dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MediaControlsCollectionViewCountData validateCountForNumberOfItems:](self->_countData, "validateCountForNumberOfItems:", objc_msgSend(v5, "numberOfItemsInCollectionViewController:", self))&& self->_displayMode == 1)
      {
        -[MediaControlsCollectionViewController _setHighlighted:forViewControllerAtIndex:](self, "_setHighlighted:forViewControllerAtIndex:", 0, self->_highlightedItemIndex);
        -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
        v135 = 0;
        v136 = (double *)&v135;
        v137 = 0x3010000000;
        v138 = &unk_1AAAECF9F;
        v139 = v6;
        v140 = v7;
        selectedItemIndex = self->_selectedItemIndex;
        v134[0] = 0;
        v134[1] = v134;
        v134[2] = 0x2020000000;
        v134[3] = selectedItemIndex;
        -[MediaControlsCollectionViewController visibleIndexes](self, "visibleIndexes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsCollectionViewCountData insertedIndexes](self->_countData, "insertedIndexes");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsCollectionViewCountData deletedIndexes](self->_countData, "deletedIndexes");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsCollectionViewCountData updatedIndexes](self->_countData, "updatedIndexes");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v5;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v133, 0, sizeof(v133));
        CGAffineTransformMakeScale(&v133, 0.32, 0.32);
        memset(&v132, 0, sizeof(v132));
        CGAffineTransformMakeScale(&v132, 0.32, 0.32);
        v131[0] = 0;
        v131[1] = v131;
        v131[2] = 0x2020000000;
        v131[3] = 0;
        v120[0] = MEMORY[0x1E0C809B0];
        v120[1] = 3221225472;
        v120[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke;
        v120[3] = &unk_1E581AD20;
        v124 = v131;
        v51 = v9;
        v121 = v51;
        v122 = self;
        v12 = v10;
        v58 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v127 = *MEMORY[0x1E0C9BAA8];
        v60 = v127;
        v128 = v58;
        v129 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v57 = v129;
        v130 = selectedItemIndex;
        v123 = v12;
        v125 = v134;
        v126 = &v135;
        objc_msgSend(v63, "enumerateIndexesUsingBlock:", v120);
        -[MediaControlsCollectionViewCountData applyChanges](self->_countData, "applyChanges");
        -[MediaControlsCollectionViewController _updateContentSize](self, "_updateContentSize");
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v136[4], v136[5]);
        self->_selectedItemIndex = objc_msgSend(v62, "defaultSelectedItemIndexForCollectionViewController:", self);
        -[UIScrollView bounds](self->_scrollView, "bounds");
        -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = 0;
        v119[1] = v119;
        v119[2] = 0x2020000000;
        v119[3] = 0;
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_2;
        v114[3] = &unk_1E581AD48;
        v14 = v13;
        v117 = v119;
        v118 = &v135;
        v115 = v14;
        v116 = self;
        objc_msgSend(v65, "enumerateIndexesUsingBlock:", v114);
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v136[4], v136[5]);
        -[UIScrollView bounds](self->_scrollView, "bounds");
        -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_3;
        v108[3] = &unk_1E581AD70;
        v108[4] = self;
        v16 = v15;
        v109 = v16;
        v112 = v133;
        v17 = v11;
        v113 = selectedItemIndex;
        v110 = v17;
        v111 = v134;
        objc_msgSend(v65, "enumerateIndexesUsingBlock:", v108);
        v18 = MEMORY[0x1E0C809B0];
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_4;
        v107[3] = &unk_1E581AD98;
        v107[4] = self;
        v19 = objc_msgSend(v16, "indexPassingTest:", v107);
        v106[0] = v18;
        v106[1] = 3221225472;
        v106[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_5;
        v106[3] = &unk_1E581AD98;
        v106[4] = self;
        v20 = objc_msgSend(v16, "indexWithOptions:passingTest:", 2, v106);
        v21 = objc_msgSend(v16, "firstIndex");
        v22 = objc_msgSend(v16, "lastIndex");
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_6;
        v105[3] = &unk_1E581ADC0;
        v105[6] = v19 - v21;
        v105[7] = v20;
        v105[8] = v22 - v20;
        v105[5] = v19;
        v105[4] = self;
        objc_msgSend(v16, "enumerateIndexesUsingBlock:", v105);
        v96[0] = MEMORY[0x1E0C809B0];
        v96[1] = 3221225472;
        v96[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_7;
        v96[3] = &unk_1E581ADE8;
        v50 = v16;
        v97 = v50;
        v98 = self;
        v101 = v60;
        v102 = v58;
        v103 = v57;
        v23 = v12;
        v99 = v23;
        v104 = v133;
        v24 = v17;
        v100 = v24;
        objc_msgSend(v56, "enumerateIndexesUsingBlock:", v96);
        v49 = self->_selectedItemIndex;
        v52 = objc_alloc_init(MediaControlsStyleCoordinator);
        objc_msgSend((id)objc_opt_class(), "frameAnimator");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "frameAnimator");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "frameAnimator");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_opt_class();
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_8;
        v94[3] = &unk_1E5818C88;
        v26 = v23;
        v95 = v26;
        objc_msgSend(v25, "alphaAnimatorWithAnimations:", v94);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_class();
        v28 = MEMORY[0x1E0C809B0];
        v29 = (void *)v27;
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_9;
        v92[3] = &unk_1E5818C88;
        v30 = v24;
        v93 = v30;
        objc_msgSend(v29, "alphaAnimatorWithAnimations:", v92);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = v28;
        aBlock[1] = 3221225472;
        aBlock[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_10;
        aBlock[3] = &unk_1E581AE10;
        v47 = v26;
        v90 = v47;
        v91 = v132;
        v31 = _Block_copy(aBlock);
        v83[0] = v28;
        v83[1] = 3221225472;
        v83[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_11;
        v83[3] = &unk_1E581AE60;
        v83[4] = self;
        v32 = v30;
        v84 = v32;
        v87 = v134;
        v88 = v49;
        v33 = v52;
        v85 = v33;
        v45 = v65;
        v86 = v45;
        v66 = _Block_copy(v83);
        v78[0] = v28;
        v78[1] = 3221225472;
        v78[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_13;
        v78[3] = &unk_1E581AE10;
        v53 = v32;
        v79 = v53;
        v80 = v60;
        v81 = v58;
        v82 = v57;
        v34 = _Block_copy(v78);
        v73[0] = v28;
        v73[1] = 3221225472;
        v73[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_14;
        v73[3] = &unk_1E581AE88;
        v73[4] = self;
        v76 = v134;
        v77 = v49;
        v61 = v50;
        v74 = v61;
        v35 = v33;
        v75 = v35;
        v36 = _Block_copy(v73);
        v59 = v31;
        objc_msgSend(v48, "addAnimations:", v31);
        objc_msgSend(v64, "addAnimations:", v66);
        objc_msgSend(v67, "addAnimations:", v34);
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_15;
        v70[3] = &unk_1E581AEB0;
        v37 = v47;
        v71 = v37;
        v72 = self;
        objc_msgSend(v48, "addCompletion:", v70);
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_16;
        v68[3] = &unk_1E58192C8;
        v38 = v36;
        v69 = v38;
        objc_msgSend(v67, "addCompletion:", v68);
        if (objc_msgSend(v37, "count"))
        {
          objc_msgSend(v48, "startAnimation", v45);
          v39 = 0.1;
          objc_msgSend(v54, "startAnimationAfterDelay:", 0.1);
        }
        else
        {
          v39 = 0.0;
        }
        if (objc_msgSend(v37, "count", v45) || objc_msgSend(v53, "count"))
        {
          objc_msgSend(v64, "startAnimationAfterDelay:", v39);
          v39 = v39 + 0.1;
        }
        else
        {
          -[MediaControlsCollectionViewController view](self, "view");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "bounds");
          -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v43, v44);

          -[MediaControlsStyleCoordinator performAnimations](v35, "performAnimations");
        }
        objc_msgSend(v67, "startAnimationAfterDelay:", v39);
        objc_msgSend(v55, "startAnimationAfterDelay:", v39 + 0.1);
        self->_shouldIgnoreScrollNotifications = 0;

        _Block_object_dispose(v119, 8);
        _Block_object_dispose(v131, 8);

        _Block_object_dispose(v134, 8);
        _Block_object_dispose(&v135, 8);
        v5 = v62;
      }
      else
      {
        self->_isPerformingBatchUpdates = 0;
        self->_shouldIgnoreScrollNotifications = 0;
        -[MediaControlsCollectionViewController reloadData](self, "reloadData");
      }

    }
    else
    {
      self->_isPerformingBatchUpdates = 0;
      self->_shouldIgnoreScrollNotifications = 0;
      -[MediaControlsCollectionViewController _dequeueAndPerformBatchUpdatesIfNeeded](self, "_dequeueAndPerformBatchUpdatesIfNeeded");
    }
  }
  else
  {
    pendingUpdates = self->_pendingUpdates;
    v41 = _Block_copy(v4);
    -[NSMutableArray addObject:](pendingUpdates, "addObject:", v41);

  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double Height;
  double v35;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[3];
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;

  v3 = a1;
  v45 = *MEMORY[0x1E0C80C00];
  v4 = a2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v5 = 968;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(v3 + 40) + 968);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(v3 + 48), "addObject:", v8);
      v9 = *(void **)(*(_QWORD *)(v3 + 40) + 968);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v10);

      objc_msgSend(v8, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 1.0);

      objc_msgSend(v8, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_OWORD *)(v3 + 96);
      v43[0] = *(_OWORD *)(v3 + 80);
      v43[1] = v13;
      v43[2] = *(_OWORD *)(v3 + 112);
      objc_msgSend(v12, "setTransform:", v43);

    }
    v14 = *(_QWORD *)(v3 + 128);
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    if (v14 <= a2)
    {
      if (v14 != a2)
      {
LABEL_10:

        goto LABEL_11;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 8);
    }
    else
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 8);
      v15 = *(_QWORD *)(v16 + 24) - 1;
    }
    *(_QWORD *)(v16 + 24) = v15;
    goto LABEL_10;
  }
LABEL_11:
  v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + 968), "copy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v37 = v17;
  objc_msgSend(v17, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "integerValue");
        if (v25 > v4)
        {
          v26 = v25;
          v27 = v4;
          v28 = v3;
          v29 = *(void **)(*(_QWORD *)(v3 + 40) + v5);
          objc_msgSend(v37, "objectForKey:", v24);
          v30 = v5;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26 - 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v29;
          v3 = v28;
          v4 = v27;
          objc_msgSend(v33, "setObject:forKey:", v31, v32);

          v5 = v30;
          objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + v30), "removeObjectForKey:", v24);
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v21);
  }

  if (objc_msgSend(*(id *)(v3 + 32), "firstIndex") > a2)
  {
    objc_msgSend(*(id *)(v3 + 40), "_frameForViewAtIndex:");
    Height = CGRectGetHeight(v46);
    objc_msgSend(*(id *)(v3 + 40), "_verticalSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8)
                                                                            + 40)
                                                                - (Height
                                                                 + v35);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24);

}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_2(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  double Height;
  double v5;
  CGRect v6;

  if (a2)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 32), "firstIndex");
    if (result)
    {
      result = objc_msgSend(*(id *)(v3 + 32), "firstIndex");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) + result >= a2)
      {
        objc_msgSend(*(id *)(v3 + 40), "_frameForViewAtIndex:", a2);
        Height = CGRectGetHeight(v6);
        result = objc_msgSend(*(id *)(v3 + 40), "_verticalSpacing");
        *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 40) = Height
                                                                    + v5
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8)
                                                                                + 40);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24);
      }
    }
  }
  return result;
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  unint64_t v24;
  void *v25;
  id obj;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "copy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v4;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "integerValue");
        if (v13 >= a2)
        {
          v14 = v13;
          v15 = v3;
          v16 = *(void **)(*(_QWORD *)(v3 + 32) + 968);
          objc_msgSend(v25, "objectForKey:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14 + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v16;
          v3 = v15;
          objc_msgSend(v19, "setObject:forKey:", v17, v18);

          objc_msgSend(*(id *)(*(_QWORD *)(v15 + 32) + 968), "removeObjectForKey:", v12);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  if (objc_msgSend(*(id *)(v3 + 40), "containsIndex:", a2))
  {
    objc_msgSend(*(id *)(v3 + 32), "_insertViewControllerForIndex:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 0.0);

    objc_msgSend(v20, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_OWORD *)(v3 + 80);
    v27[0] = *(_OWORD *)(v3 + 64);
    v27[1] = v23;
    v27[2] = *(_OWORD *)(v3 + 96);
    objc_msgSend(v22, "setTransform:", v27);

    objc_msgSend(*(id *)(v3 + 48), "addObject:", v20);
  }
  v24 = *(_QWORD *)(v3 + 112);
  if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 >= a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24);

}

BOOL __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

BOOL __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_6(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = result;
  if (*(_QWORD *)(result + 40) <= a2)
  {
    if (*(_QWORD *)(result + 56) >= a2)
      return result;
    v4 = *(_QWORD *)(result + 64) + a2;
  }
  else
  {
    v4 = a2 - *(_QWORD *)(result + 48);
  }
  objc_msgSend(*(id *)(result + 32), "_frameForViewAtIndex:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(v3 + 32), "_frameForViewAtIndex:", a2);
  v10 = v9;
  v12 = v11;
  v13 = (id)objc_msgSend(*(id *)(v3 + 32), "_insertViewControllerForIndex:", a2);
  return objc_msgSend(*(id *)(v3 + 32), "_setFrame:forVisibleViewAtIndex:", a2, v6, v8, v10, v12);
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      objc_msgSend(v6, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_OWORD *)(a1 + 80);
      v14 = *(_OWORD *)(a1 + 64);
      v15 = v9;
      v16 = *(_OWORD *)(a1 + 96);
      objc_msgSend(v8, "setTransform:", &v14);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }
    objc_msgSend(*(id *)(a1 + 40), "_insertViewControllerForIndex:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

    objc_msgSend(v10, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)(a1 + 128);
    v14 = *(_OWORD *)(a1 + 112);
    v15 = v13;
    v16 = *(_OWORD *)(a1 + 144);
    objc_msgSend(v12, "setTransform:", &v14);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  }
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_8(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "view", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 0.0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_9(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "view", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 1.0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_10(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  _OWORD v10[3];
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = (_OWORD *)(a1 + 40);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v6[1];
        v10[0] = *v6;
        v10[1] = v9;
        v10[2] = v6[2];
        objc_msgSend(v8, "setTransform:", v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_11(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  uint64_t v25;

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_12;
  v23 = &unk_1E581AE38;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v24 = v3;
  v25 = v4;
  objc_msgSend(v2, "_enumerateActiveViewControllers:", &v20);
  if (*(_QWORD *)(a1 + 72) != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForItemAtIndex:", v20, v21, v22, v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForItemAtIndex:", *(_QWORD *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", 0);
    objc_msgSend(v6, "setSelected:", 1);
    if (v5)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v7, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v7, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v5, v8, v9, v11, v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaControlsCollectionViewController:willSelectItemAtIndex:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), 1);

    if (v6 && (objc_msgSend(*(id *)(a1 + 56), "containsIndex:", *(_QWORD *)(a1 + 72)) & 1) == 0)
    {
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 72);
      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v14, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      objc_msgSend(v14, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v6, v15, v16, v18, v19);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "performAnimations", v20, v21, v22, v23);

}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MidX;
  double MidY;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_frameForViewAtIndex:", a2);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v23, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "position");
    v15 = v14;
    v17 = v16;

    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    MidX = CGRectGetMidX(v24);
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    MidY = CGRectGetMidY(v25);
    if (v15 != MidX || v17 != MidY)
    {
      v21 = MidY;
      objc_msgSend(v23, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPosition:", MidX, v21);

    }
  }

}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_13(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  _OWORD v10[3];
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = (_OWORD *)(a1 + 40);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v6[1];
        v10[0] = *v6;
        v10[1] = v9;
        v10[2] = v6[2];
        objc_msgSend(v8, "setTransform:", v10);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v7, "integerValue")) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "_reapViewAtIndex:", objc_msgSend(v7, "integerValue"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1067) = 0;
  v8 = *(id **)(a1 + 32);
  objc_msgSend(v8[139], "bounds");
  objc_msgSend(v8, "_populateViewsInFrame:");
  objc_msgSend(*(id *)(a1 + 32), "_dequeueAndPerformBatchUpdatesIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "contentOffset");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "contentSize");
  v14 = v13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "bounds");
  v16 = v14 - v15;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "contentInset");
  if (v16 + v17 > 0.0 && v12 > v16 + v17)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setContentOffset:animated:", 1, v10);
  if (*(_QWORD *)(a1 + 64) != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mediaControlsCollectionViewController:didSelectItemAtIndex:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 1);

  }
  return objc_msgSend(*(id *)(a1 + 48), "performCompletions");
}

void __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_15(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_removeViewController:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __61__MediaControlsCollectionViewController_performBatchUpdates___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadData
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *activeViewControllers;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *pendingUpdates;
  MediaControlsCollectionViewCountData *v14;
  MediaControlsCollectionViewCountData *v15;
  MediaControlsCollectionViewCountData *countData;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MediaControlsCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MediaControlsCollectionViewController _setHighlighted:forViewControllerAtIndex:](self, "_setHighlighted:forViewControllerAtIndex:", 0, self->_highlightedItemIndex);
    -[MediaControlsCollectionViewController _reapActiveViews](self, "_reapActiveViews");
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeViewControllers = self->_activeViewControllers;
    self->_activeViewControllers = v4;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_pendingUpdates;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          self->_isPerformingBatchUpdates = 1;
          (*(void (**)(uint64_t))(v11 + 16))(v11);
          self->_isPerformingBatchUpdates = 0;
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingUpdates = self->_pendingUpdates;
    self->_pendingUpdates = v12;

    v14 = [MediaControlsCollectionViewCountData alloc];
    v15 = -[MediaControlsCollectionViewCountData initWithNumberOfItems:](v14, "initWithNumberOfItems:", objc_msgSend(v3, "numberOfItemsInCollectionViewController:", self, (_QWORD)v17));
    countData = self->_countData;
    self->_countData = v15;

    self->_selectedItemIndex = objc_msgSend(v3, "defaultSelectedItemIndexForCollectionViewController:", self);
    -[MediaControlsCollectionViewController _tileViews](self, "_tileViews");
    self->_needsReloadData = 0;
    -[MediaControlsCollectionViewController _removeInactiveViewControllersFromHierarchy](self, "_removeInactiveViewControllersFromHierarchy");
  }
  else
  {
    self->_needsReloadData = 1;
  }

}

- (int64_t)itemAtPoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  int64_t selectedItemIndex;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  selectedItemIndex = self->_selectedItemIndex;
  -[MediaControlsCollectionViewController _preferredSelectedItemHeight](self, "_preferredSelectedItemHeight");
  v8 = v7;
  if (self->_displayMode)
    -[MediaControlsCollectionViewController _regularItemHeight](self, "_regularItemHeight");
  v9 = v7;
  -[MediaControlsCollectionViewController _verticalSpacing](self, "_verticalSpacing");
  v11 = v9 + v10;
  v12 = y / (v9 + v10);
  if (v12 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v13 = (uint64_t)v12;
  if (selectedItemIndex <= (uint64_t)v12)
  {
    v13 = selectedItemIndex;
    if (selectedItemIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v17 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[MediaControlsCollectionViewController _frameForViewAtIndex:](self, "_frameForViewAtIndex:", selectedItemIndex);
    }
    v19.x = x;
    v19.y = y;
    if (!CGRectContainsPoint(*(CGRect *)&v14, v19))
    {
      v13 = (uint64_t)((y - (v8 - v9)) / v11);
      if (-[MediaControlsCollectionViewCountData numberOfItems](self->_countData, "numberOfItems") < v13)
        return 0x7FFFFFFFFFFFFFFFLL;
      -[MediaControlsCollectionViewController _frameForViewAtIndex:](self, "_frameForViewAtIndex:", v13);
      v20.x = x;
      v20.y = y;
      if (!CGRectContainsPoint(v21, v20))
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v13;
}

- (NSIndexSet)visibleIndexes
{
  -[UIScrollView bounds](self->_scrollView, "bounds");
  return (NSIndexSet *)-[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:");
}

- (BOOL)_canPerformBatchUpdates
{
  return !self->_isPerformingBatchUpdates
      && !-[MediaControlsCollectionViewController _isScrollViewAnimatingScroll](self, "_isScrollViewAnimatingScroll")
      && !self->_appearanceTransitionCount
      && !self->_isAnimatingSelection;
}

- (void)_dequeueAndPerformBatchUpdatesIfNeeded
{
  id v3;

  if (-[NSMutableArray count](self->_pendingUpdates, "count"))
  {
    if (-[MediaControlsCollectionViewController _canPerformBatchUpdates](self, "_canPerformBatchUpdates"))
    {
      -[NSMutableArray firstObject](self->_pendingUpdates, "firstObject");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_pendingUpdates, "removeObjectAtIndex:", 0);
      -[MediaControlsCollectionViewController performBatchUpdates:](self, "performBatchUpdates:", v3);

    }
  }
}

- (int64_t)_closestItemAtPoint:(CGPoint)a3
{
  double y;
  int64_t selectedItemIndex;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  y = a3.y;
  selectedItemIndex = self->_selectedItemIndex;
  -[MediaControlsCollectionViewController _preferredSelectedItemHeight](self, "_preferredSelectedItemHeight", a3.x);
  v7 = v6;
  if (self->_displayMode)
    -[MediaControlsCollectionViewController _regularItemHeight](self, "_regularItemHeight");
  v8 = v6;
  -[MediaControlsCollectionViewController _verticalSpacing](self, "_verticalSpacing");
  v10 = v8 + v9;
  v11 = y / (v8 + v9);
  if (v11 < 0.0)
    return 0;
  v12 = (uint64_t)v11;
  if (selectedItemIndex <= (uint64_t)v11)
  {
    v12 = selectedItemIndex;
    if (selectedItemIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
      v15 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
      v16 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[MediaControlsCollectionViewController _frameForViewAtIndex:](self, "_frameForViewAtIndex:", selectedItemIndex);
    }
    if (y > CGRectGetMaxY(*(CGRect *)&v13))
      return (uint64_t)((y - (v7 - v8)) / v10);
  }
  return v12;
}

- (double)_regularItemHeight
{
  return 108.0;
}

- (double)_preferredSelectedItemHeight
{
  double result;

  -[MediaControlsCollectionViewController _selectedItemHeightInSize:](self, "_selectedItemHeightInSize:", self->_lastKnownEnvironmentSize.width, self->_lastKnownEnvironmentSize.height);
  return result;
}

- (double)_selectedItemHeightInSize:(CGSize)a3
{
  double result;

  -[MediaControlsCollectionViewController _selectedItemHeightInSize:shouldIgnoreInsets:](self, "_selectedItemHeightInSize:shouldIgnoreInsets:", self->_displayMode == 0, a3.width, a3.height);
  return result;
}

- (double)_selectedItemHeightInSize:(CGSize)a3 shouldIgnoreInsets:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[MediaControlsCollectionViewController preferredItemHeightGivenWidth:](self, "preferredItemHeightGivenWidth:");
  v9 = v8;
  if (v4)
  {
    v9 = v8 + self->_controlCenterEdgeInsets.top + self->_controlCenterEdgeInsets.bottom;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    UIRectInset();
    width = v12;
    height = v13;
  }
  v14 = width;
  v15 = height;
  result = CGRectGetHeight(*(CGRect *)&v11);
  if (v9 < result)
    return v9;
  return result;
}

- (id)_indexesOfItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc(MEMORY[0x1E0CB36B8]);
  v9 = -[MediaControlsCollectionViewController _rangeOfItemsInRect:](self, "_rangeOfItemsInRect:", x, y, width, height);
  return (id)objc_msgSend(v8, "initWithIndexesInRange:", v9, v10);
}

- (_NSRange)_rangeOfItemsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double MidX;
  int64_t v12;
  int64_t v13;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[MediaControlsCollectionViewCountData numberOfItems](self->_countData, "numberOfItems");
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v9 = -[MediaControlsCollectionViewController _closestItemAtPoint:](self, "_closestItemAtPoint:", CGRectGetMidX(v20), y);
  v10 = v9 & ~(v9 >> 63);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v12 = -[MediaControlsCollectionViewController _closestItemAtPoint:](self, "_closestItemAtPoint:", MidX, CGRectGetMaxY(v22));
  v13 = v8 - 1;
  if (v12 < v8 - 1)
    v13 = v12;
  if (v8 > 0 && v10 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = v10;
  v16 = v13 - v15;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = v15;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0;
  else
    v18 = v16 + 1;
  result.length = v18;
  result.location = v17;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[MediaControlsCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[MediaControlsCollectionViewController _frameForViewAtIndex:size:](self, "_frameForViewAtIndex:size:", a3, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3 size:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[MediaControlsCollectionViewController _frameForViewAtIndex:displayMode:size:](self, "_frameForViewAtIndex:displayMode:size:", a3, self->_displayMode, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_frameForViewAtIndex:(int64_t)a3 displayMode:(int64_t)a4 size:(CGSize)a5
{
  double width;
  int64_t selectedItemIndex;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double left;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  width = a5.width;
  selectedItemIndex = self->_selectedItemIndex;
  -[MediaControlsCollectionViewController _selectedItemHeightInSize:shouldIgnoreInsets:](self, "_selectedItemHeightInSize:shouldIgnoreInsets:", a4 == 0, a5.width, a5.height);
  v11 = v10;
  if (a4)
  {
    -[MediaControlsCollectionViewController _regularItemHeight](self, "_regularItemHeight");
    v13 = v12;
    -[MediaControlsCollectionViewController _verticalSpacing](self, "_verticalSpacing");
    v15 = v14;
    left = self->_scrollViewInsets.left;
    width = width - (left + self->_scrollViewInsets.right);
  }
  else
  {
    -[MediaControlsCollectionViewController _verticalSpacing](self, "_verticalSpacing");
    v15 = v17;
    left = 0.0;
    v13 = v11;
  }
  v18 = (v13 + v15) * (double)a3;
  v19 = v11 - v13;
  if (selectedItemIndex >= a3)
    v19 = -0.0;
  v20 = v19 + v18;
  if (selectedItemIndex == a3)
    v21 = v11;
  else
    v21 = v13;
  v22 = width;
  result.size.height = v21;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = left;
  return result;
}

- (void)_populateViewsInFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  MediaControlsCollectionViewController *v10;

  -[MediaControlsCollectionViewController _indexesOfItemsInRect:](self, "_indexesOfItemsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = MEMORY[0x1E0C809B0];
  if (!self->_shouldDisableAutoReaping)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke;
    v8[3] = &unk_1E581AE38;
    v9 = v5;
    v10 = self;
    -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v8);

  }
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke_2;
  v7[3] = &unk_1E581AED8;
  v7[4] = self;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

}

uint64_t __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke(uint64_t a1, unint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "firstIndex") <= a2 && objc_msgSend(*(id *)(a1 + 32), "lastIndex") >= a2)
    return objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a2);
  else
    return objc_msgSend(*(id *)(a1 + 40), "_reapViewAtIndex:", a2);
}

void __63__MediaControlsCollectionViewController__populateViewsInFrame___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_insertViewControllerForIndex:", a2);
}

- (void)_reloadDataIfNeeded
{
  if (self->_needsReloadData)
  {
    self->_needsReloadData = 0;
    -[MediaControlsCollectionViewController reloadData](self, "reloadData");
  }
}

- (void)_scrollToSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  _QWORD aBlock[5];

  if (self->_selectedItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a3;
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke;
    aBlock[3] = &unk_1E581AA88;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v7 = v6;
    if (v3 && !self->_displayMode)
    {
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_2;
      v14[3] = &unk_1E581AF28;
      v14[4] = self;
      v8 = _Block_copy(v14);
      -[MediaControlsCollectionViewController visibleViewControllers](self, "visibleViewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v7;
      v11 = (void (*)(void))v8[2];
      v12 = v8;
      v11();

    }
    else
    {
      (*((void (**)(void *, _BOOL8))v6 + 2))(v6, v3);
    }

  }
}

uint64_t __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[139];
  objc_msgSend(v3, "_frameForViewAtIndex:", v3[141]);
  return objc_msgSend(v4, "scrollRectToVisible:animated:", a2);
}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  double v23;

  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (a3)
      v9 = 0.0;
    else
      v9 = 1.0;
    objc_msgSend(v6, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

    v11 = (void *)objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_3;
    v21[3] = &unk_1E5819110;
    v13 = v6;
    v22 = v13;
    v23 = 1.0 - v9;
    objc_msgSend(v11, "alphaAnimatorWithAnimations:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = 3221225472;
    v17 = __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_4;
    v18 = &unk_1E581AF00;
    v20 = v8;
    v19 = v13;
    objc_msgSend(v14, "addCompletion:", &v15);
    objc_msgSend(v14, "startAnimation", v15, v16, v17, v18);

  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __71__MediaControlsCollectionViewController__scrollToSelectedItemAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForSelectedItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v2 + 16))(v2, v3, 1, 0);

}

- (void)_setFrame:(CGRect)a3 forVisibleViewAtIndex:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  NSMutableDictionary *activeViewControllers;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  activeViewControllers = self->_activeViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeViewControllers, "objectForKey:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController _backgroundCornerRadius](self, "_backgroundCornerRadius");
  objc_msgSend(v11, "_setContinuousCornerRadius:");

  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaControls_untransformedFrame:", x, y, width, height);
  objc_msgSend(v12, "layoutIfNeeded");

}

- (void)_tileViews
{
  BOOL shouldIgnoreScrollNotifications;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  shouldIgnoreScrollNotifications = self->_shouldIgnoreScrollNotifications;
  self->_shouldIgnoreScrollNotifications = 1;
  -[MediaControlsCollectionViewController updateContentInsets](self, "updateContentInsets");
  -[MediaControlsCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v6, v8, v10, v12);
  -[MediaControlsCollectionViewController _updateContentSize](self, "_updateContentSize");
  if (!self->_displayMode)
    -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
  self->_shouldIgnoreScrollNotifications = shouldIgnoreScrollNotifications;
}

- (double)_totalHeight
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[MediaControlsCollectionViewController _preferredSelectedItemHeight](self, "_preferredSelectedItemHeight");
  v4 = v3;
  if (self->_displayMode)
    -[MediaControlsCollectionViewController _regularItemHeight](self, "_regularItemHeight");
  v5 = v3;
  -[MediaControlsCollectionViewController _verticalSpacing](self, "_verticalSpacing");
  return v4
       + (double)(-[MediaControlsCollectionViewCountData numberOfItems](self->_countData, "numberOfItems") - 1)
       * (v5 + v6);
}

- (void)updateContentInsets
{
  void *v3;
  double Height;
  double v5;
  double v6;
  UIScrollView *scrollView;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  if (self->_displayMode == 1)
  {
    -[MediaControlsCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v12);
    -[MediaControlsCollectionViewController _preferredSelectedItemHeight](self, "_preferredSelectedItemHeight");
    v6 = (Height - v5) * 0.5;

    scrollView = self->_scrollView;
    v8 = 0.0;
    v9 = 0.0;
    v10 = v6;
    v11 = v6;
  }
  else
  {
    scrollView = self->_scrollView;
    v10 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  -[UIScrollView setContentInset:](scrollView, "setContentInset:", v10, v8, v11, v9);
}

- (void)_updateContentSize
{
  double Width;
  double v4;
  CGRect v5;

  -[UIScrollView frame](self->_scrollView, "frame");
  Width = CGRectGetWidth(v5);
  -[MediaControlsCollectionViewController _totalHeight](self, "_totalHeight");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", Width - (self->_scrollViewInsets.left + self->_scrollViewInsets.right), v4);
}

- (void)_updateFramesForActiveViewControllersWithCoordinator:(id)a3 assumingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  CGFloat v11;
  CGFloat v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __107__MediaControlsCollectionViewController__updateFramesForActiveViewControllersWithCoordinator_assumingSize___block_invoke;
  v9[3] = &unk_1E581AF78;
  v9[4] = self;
  v10 = v7;
  v11 = width;
  v12 = height;
  v8 = v7;
  -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v9);

}

uint64_t __107__MediaControlsCollectionViewController__updateFramesForActiveViewControllersWithCoordinator_assumingSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", a3, a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_updateFrameForViewController:(id)a3 atIndex:(int64_t)a4 withCoordinator:(id)a5 assumingSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[10];

  height = a6.height;
  width = a6.width;
  v11 = a5;
  v12 = a3;
  -[MediaControlsCollectionViewController _frameForViewAtIndex:size:](self, "_frameForViewAtIndex:size:", a4, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "willTransitionToSize:withCoordinator:", v11, v17, v19);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__MediaControlsCollectionViewController__updateFrameForViewController_atIndex_withCoordinator_assumingSize___block_invoke;
  v21[3] = &unk_1E581AFA0;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  *(double *)&v21[7] = v18;
  *(double *)&v21[8] = v20;
  v21[9] = a4;
  objc_msgSend(v11, "animateAlongsideTransition:completion:", v21, 0);

}

uint64_t __108__MediaControlsCollectionViewController__updateFrameForViewController_atIndex_withCoordinator_assumingSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)_verticalSpacing
{
  return 14.0;
}

- (void)_adjustForEnvironmentChangeIfNeededWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  UIEdgeInsets *p_controlCenterEdgeInsets;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  height = a3.height;
  width = a3.width;
  if (self->_lastKnownEnvironmentSize.width != a3.width || self->_lastKnownEnvironmentSize.height != a3.height)
  {
    p_controlCenterEdgeInsets = &self->_controlCenterEdgeInsets;
    v13 = a4;
    CCUIExpandedModuleEdgeInsets();
    p_controlCenterEdgeInsets->top = v9;
    p_controlCenterEdgeInsets->left = v10;
    p_controlCenterEdgeInsets->bottom = v11;
    p_controlCenterEdgeInsets->right = v12;
    -[MediaControlsCollectionViewController _adjustForEnvironmentChangeWithSize:transitionCoordinator:](self, "_adjustForEnvironmentChangeWithSize:transitionCoordinator:", v13, width, height);

  }
}

- (void)_adjustForEnvironmentChangeWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  int64_t displayMode;
  _BOOL4 v11;
  int64_t v12;
  uint64_t v13;
  MediaControlsStyleCoordinator *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  MediaControlsStyleCoordinator *v19;
  _QWORD v20[5];
  MediaControlsStyleCoordinator *v21;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = self->_lastKnownEnvironmentSize.width;
  v9 = self->_lastKnownEnvironmentSize.height;
  self->_lastKnownEnvironmentSize.width = width;
  self->_lastKnownEnvironmentSize.height = height;
  displayMode = self->_displayMode;
  if (displayMode)
    v11 = width > 200.0;
  else
    v11 = 1;
  if (v11)
    v12 = self->_displayMode;
  else
    v12 = 0;
  if (width > 200.0 && displayMode != 1)
    v13 = 1;
  else
    v13 = v12;
  if (v13 == displayMode)
  {
    if (v8 != width || v9 != height)
    {
      v15 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v15, width, height);
      if (v7)
      {
        v16 = MEMORY[0x1E0C809B0];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke;
        v20[3] = &unk_1E581AFC8;
        v20[4] = self;
        v21 = v15;
        v18[0] = v16;
        v18[1] = 3221225472;
        v18[2] = __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke_2;
        v18[3] = &unk_1E5819C40;
        v19 = v21;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", v20, v18);

      }
      else
      {
        -[MediaControlsCollectionViewController _tileViews](self, "_tileViews");
        -[MediaControlsStyleCoordinator performAnimations](v15, "performAnimations");
        -[MediaControlsStyleCoordinator performCompletions](v15, "performCompletions");
      }

    }
  }
  else
  {
    -[MediaControlsCollectionViewController _transitionToDisplayMode:usingTransitionCoordinator:assumingSize:](self, "_transitionToDisplayMode:usingTransitionCoordinator:assumingSize:", v13, v7, width, height);
  }
  -[MediaControlsCollectionViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScrollEnabled:", self->_displayMode == 1);

}

uint64_t __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_tileViews");
  return objc_msgSend(*(id *)(a1 + 40), "performAnimations");
}

uint64_t __99__MediaControlsCollectionViewController__adjustForEnvironmentChangeWithSize_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCompletions");
}

- (void)_transitionToDisplayMode:(int64_t)a3 usingTransitionCoordinator:(id)a4 assumingSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  MediaControlsStyleCoordinator *v11;
  int64_t selectedItemIndex;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  MediaControlsStyleCoordinator *v16;
  _QWORD v17[4];
  MediaControlsStyleCoordinator *v18;
  _QWORD v19[6];
  _QWORD v20[6];

  height = a5.height;
  width = a5.width;
  v9 = a4;
  -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController setDisplayMode:](self, "setDisplayMode:", a3);
  self->_shouldDisableAutoReaping = a3 == 0;
  v11 = objc_alloc_init(MediaControlsStyleCoordinator);
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    selectedItemIndex = self->_selectedItemIndex;
    v13 = v9;
    -[MediaControlsCollectionViewController _updateFrameForViewController:atIndex:withCoordinator:assumingSize:](self, "_updateFrameForViewController:atIndex:withCoordinator:assumingSize:", v10, selectedItemIndex, v13, width, height);
    v14 = MEMORY[0x1E0C809B0];
    v19[5] = a3;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke;
    v20[3] = &unk_1E5819110;
    v20[4] = self;
    v20[5] = a3;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_3;
    v19[3] = &unk_1E5819110;
    v19[4] = self;
    -[MediaControlsStyleCoordinator animateAlongsideTransition:completion:](v11, "animateAlongsideTransition:completion:", v20, v19);
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v11, width, height);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_4;
    v17[3] = &unk_1E5819C40;
    v18 = v11;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_5;
    v15[3] = &unk_1E5819C40;
    v16 = v18;
    objc_msgSend(v13, "animateAlongsideTransition:completion:", v17, v15);

  }
  else
  {
    self->_shouldDisableAutoReaping = 0;
    -[MediaControlsCollectionViewController _tileViews](self, "_tileViews");
    -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
    -[_MediaControlsTapHoldGestureRecognizer setEnabled:](self->_tapGestureRecognizer, "setEnabled:", -[MediaControlsCollectionViewController _wantsTapGestureRecognizer](self, "_wantsTapGestureRecognizer"));
    -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v11, width, height);
    -[MediaControlsStyleCoordinator performAnimations](v11, "performAnimations");
    -[MediaControlsStyleCoordinator performCompletions](v11, "performCompletions");
  }

}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_tileViews");
  objc_msgSend(*(id *)(a1 + 32), "_scrollToSelectedItemAnimated:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_2;
  v4[3] = &unk_1E581AFF0;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  return objc_msgSend(v5, "_enumerateActiveViewControllers:", v4);
}

void __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL IsReduceMotionEnabled;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) != a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (!v7)
    {
      v10 = v5;
      objc_msgSend(v5, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", 0.0);
      goto LABEL_7;
    }
    if (v7 == 1)
    {
      v10 = v5;
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v6 = v10;
      if (!IsReduceMotionEnabled)
      {
        objc_msgSend(v10, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 1);
LABEL_7:

        v6 = v10;
      }
    }
  }

}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1064) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_tileViews");
  objc_msgSend(*(id *)(a1 + 32), "_scrollToSelectedItemAnimated:", 0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "_wantsTapGestureRecognizer"));
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    result = UIAccessibilityIsReduceMotionEnabled();
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_transitionTopAndBottomViewControllersToVisible:completion:", 1, 0);
  }
  return result;
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAnimations");
}

uint64_t __106__MediaControlsCollectionViewController__transitionToDisplayMode_usingTransitionCoordinator_assumingSize___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCompletions");
}

- (void)_transitionToVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  double v25;
  _QWORD v26[4];
  id v27;
  MediaControlsCollectionViewController *v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  CGAffineTransform v32;
  _QWORD v33[5];
  CGAffineTransform v34;
  _QWORD v35[5];
  _QWORD v36[6];
  _QWORD v37[5];
  CGAffineTransform v38;
  CGAffineTransform v39;

  v3 = a3;
  if (a3)
  {
    -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
    v5 = 0.0;
    v6 = 1.0;
  }
  else
  {
    v5 = 1.0;
    v6 = 0.0;
  }
  -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v39, 0, sizeof(v39));
  if (v3)
  {
    CGAffineTransformMakeScale(&v39, 1.92, 1.92);
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v38.c = v8;
    *(_OWORD *)&v38.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    v9 = *MEMORY[0x1E0C9BAA8];
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v39.c = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v39.tx = v10;
    *(_OWORD *)&v39.a = v9;
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeScale(&v38, 1.92, 1.92);
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v11 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke;
    v37[3] = &__block_descriptor_40_e76_v32__0q8__UIViewController_MediaControlsCollectionItemViewController__16_B24l;
    *(double *)&v37[4] = v5;
    -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v37);
    v36[0] = v11;
    v36[1] = 3221225472;
    v36[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_2;
    v36[3] = &unk_1E5819110;
    v36[4] = self;
    *(double *)&v36[5] = v6;
    objc_msgSend((id)objc_opt_class(), "alphaAnimatorWithAnimations:", v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_4;
    v35[3] = &unk_1E5819AA0;
    v35[4] = self;
    objc_msgSend(v12, "addCompletion:", v35);
    objc_msgSend(v12, "startAnimation");

  }
  else
  {
    ++self->_appearanceTransitionCount;
    objc_msgSend(v7, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v5);

    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      objc_msgSend(v7, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v39;
      objc_msgSend(v15, "setTransform:", &v34);

    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 0.1;
    if (v3)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_6;
      v33[3] = &unk_1E581B078;
      v33[4] = self;
      -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v33);
      v17 = 0.0;
    }
    objc_msgSend((id)objc_opt_class(), "frameAnimator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_7;
    v30[3] = &unk_1E581AE10;
    v19 = v7;
    v31 = v19;
    v32 = v38;
    objc_msgSend(v18, "addAnimations:", v30);
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_8;
    v26[3] = &unk_1E581B0A0;
    v20 = v19;
    v29 = v3;
    v27 = v20;
    v28 = self;
    objc_msgSend(v18, "addCompletion:", v26);
    v21 = (void *)objc_opt_class();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_11;
    v23[3] = &unk_1E5819110;
    v24 = v20;
    v25 = v6;
    objc_msgSend(v21, "alphaAnimatorWithAnimations:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startAnimationAfterDelay:", v17);
    objc_msgSend(v22, "startAnimationAfterDelay:", v17 + 0.1);
    if (!v3)
      -[MediaControlsCollectionViewController _transitionTopAndBottomViewControllersToVisible:completion:](self, "_transitionTopAndBottomViewControllersToVisible:completion:", 0, 0);

  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 32));

}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_3;
  v3[3] = &__block_descriptor_40_e76_v32__0q8__UIViewController_MediaControlsCollectionItemViewController__16_B24l;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "_enumerateActiveViewControllers:", v3);
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 32));

}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateActiveViewControllers:", &__block_literal_global_29);
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) != a2)
  {
    objc_msgSend(a3, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_7(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v4);

}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_8(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v6[5];
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v7);

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_9;
    v6[3] = &unk_1E5818C88;
    v6[4] = v4;
    objc_msgSend(v4, "_transitionTopAndBottomViewControllersToVisible:completion:", 1, v6);
  }
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056);
  return objc_msgSend(*(id *)(a1 + 40), "_dequeueAndPerformBatchUpdatesIfNeeded");
}

uint64_t __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_9(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_10;
  v3[3] = &unk_1E581B078;
  v3[4] = v1;
  return objc_msgSend(v1, "_enumerateActiveViewControllers:", v3);
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128) != a2)
  {
    objc_msgSend(a3, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

  }
}

void __62__MediaControlsCollectionViewController__transitionToVisible___block_invoke_11(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

- (void)_transitionTopAndBottomViewControllersToVisible:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t k;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  double MinY;
  double v68;
  double MaxY;
  void *v70;
  double v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void (**v82)(_QWORD);
  id obj;
  id obja;
  id v85;
  void *v86;
  _QWORD v87[4];
  void (**v88)(_QWORD);
  _QWORD v89[4];
  void *v90;
  BOOL v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  void (**v97)(_QWORD);
  _QWORD v98[4];
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  double v104;
  double v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  MediaControlsCollectionViewController *v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[4];
  id v119;
  MediaControlsCollectionViewController *v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  MediaControlsCollectionViewController *v128;
  uint64_t v129;
  _QWORD v130[4];
  id v131;
  MediaControlsCollectionViewController *v132;
  uint64_t v133;
  _QWORD aBlock[5];
  id v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v4 = a3;
  v139 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ++self->_appearanceTransitionCount;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke;
  aBlock[3] = &unk_1E5819B40;
  aBlock[4] = self;
  v7 = v6;
  v135 = v7;
  v82 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !UIAccessibilityIsReduceMotionEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController _visibleTopViewControllers](self, "_visibleTopViewControllers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController _visibleBottomViewControllers](self, "_visibleBottomViewControllers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v81 = v26;
    if (v4)
    {
      v80 = v7;
      objc_msgSend(v27, "setHidden:", 0);

      v79 = v8;
      objc_msgSend(v8, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 1.0);

      objc_msgSend(v25, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_2;
      v130[3] = &unk_1E581B0C8;
      v78 = v25;
      v32 = v25;
      v131 = v32;
      v132 = self;
      v133 = 0x4056000000000000;
      objc_msgSend(v30, "enumerateObjectsUsingBlock:", v130);

      objc_msgSend(v26, "allKeys");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v31;
      v126[1] = 3221225472;
      v126[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_3;
      v126[3] = &unk_1E581B0C8;
      v85 = v26;
      v127 = v85;
      v128 = self;
      v129 = 0x4056000000000000;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v126);

      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      objc_msgSend(v32, "allKeys");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sortedArrayUsingSelector:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "reverseObjectEnumerator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v36;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
      v38 = v21;
      if (v37)
      {
        v39 = v37;
        v40 = *(_QWORD *)v123;
        v41 = 0.0;
        v42 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v123 != v40)
              objc_enumerationMutation(obj);
            v44 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
            objc_msgSend(v32, "objectForKey:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "frameAnimator");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v118[0] = v42;
            v118[1] = 3221225472;
            v118[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_4;
            v118[3] = &unk_1E5819160;
            v47 = v45;
            v119 = v47;
            v120 = self;
            v121 = v44;
            objc_msgSend(v46, "addAnimations:", v118);
            v48 = (void *)objc_opt_class();
            v116[0] = v42;
            v116[1] = 3221225472;
            v116[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_5;
            v116[3] = &unk_1E5818C88;
            v117 = v47;
            v49 = v47;
            objc_msgSend(v48, "alphaAnimatorWithAnimations:", v116);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "startAnimationAfterDelay:", v41);
            v41 = v41 + 0.1;
            objc_msgSend(v50, "startAnimationAfterDelay:", v41);
            objc_msgSend(v38, "addObject:", v46);
            objc_msgSend(v86, "addObject:", v50);

          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
        }
        while (v39);
      }

      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      objc_msgSend(v85, "allKeys");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "sortedArrayUsingSelector:", sel_compare_);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      obja = v52;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v112, v137, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v113;
        v56 = 0.0;
        v57 = MEMORY[0x1E0C809B0];
        do
        {
          for (j = 0; j != v54; ++j)
          {
            if (*(_QWORD *)v113 != v55)
              objc_enumerationMutation(obja);
            v59 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j);
            objc_msgSend(v85, "objectForKey:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "frameAnimator");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v108[0] = v57;
            v108[1] = 3221225472;
            v108[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_6;
            v108[3] = &unk_1E5819160;
            v62 = v60;
            v109 = v62;
            v110 = self;
            v111 = v59;
            objc_msgSend(v61, "addAnimations:", v108);
            v63 = (void *)objc_opt_class();
            v106[0] = v57;
            v106[1] = 3221225472;
            v106[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_7;
            v106[3] = &unk_1E5818C88;
            v107 = v62;
            v64 = v62;
            objc_msgSend(v63, "alphaAnimatorWithAnimations:", v106);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "startAnimationAfterDelay:", v56);
            v56 = v56 + 0.1;
            objc_msgSend(v65, "startAnimationAfterDelay:", v56);
            objc_msgSend(v38, "addObject:", v61);
            objc_msgSend(v86, "addObject:", v65);

          }
          v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v112, v137, 16);
        }
        while (v54);
      }

      v66 = v131;
      v8 = v79;
      v7 = v80;
      v23 = v82;
      v21 = v38;
      v25 = v78;
    }
    else
    {
      objc_msgSend(v27, "frame");
      MinY = CGRectGetMinY(v140);
      -[UIScrollView bounds](self->_scrollView, "bounds");
      v68 = MinY - CGRectGetMinY(v141);

      -[UIScrollView bounds](self->_scrollView, "bounds");
      MaxY = CGRectGetMaxY(v142);
      objc_msgSend(v8, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "frame");
      v71 = MaxY - CGRectGetMaxY(v143);

      objc_msgSend((id)objc_opt_class(), "frameAnimator");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = MEMORY[0x1E0C809B0];
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_8;
      v101[3] = &unk_1E581B118;
      v73 = v25;
      v102 = v73;
      v104 = v68;
      v74 = v26;
      v103 = v74;
      v105 = v71;
      objc_msgSend(v66, "addAnimations:", v101);
      v75 = (void *)objc_opt_class();
      v98[0] = v72;
      v98[1] = 3221225472;
      v98[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_11;
      v98[3] = &unk_1E5818CB0;
      v99 = v73;
      v100 = v74;
      objc_msgSend(v75, "alphaAnimatorWithAnimations:", v98);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "startAnimationAfterDelay:", 0.0);
      objc_msgSend(v76, "startAnimationAfterDelay:", 0.1);

      v23 = v82;
    }

    v24 = v86;
    if (objc_msgSend(v86, "count"))
    {
      objc_msgSend(v86, "lastObject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_14;
      v96[3] = &unk_1E58192C8;
      v97 = v23;
      objc_msgSend(v77, "addCompletion:", v96);

    }
    else
    {
      v23[2](v23);
    }

  }
  else
  {
    v9 = v8;
    -[MediaControlsCollectionViewController visibleViewControllers](self, "visibleViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v93;
      if (v4)
        v14 = 0.0;
      else
        v14 = 1.0;
      do
      {
        for (k = 0; k != v12; ++k)
        {
          if (*(_QWORD *)v93 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
          objc_msgSend(v16, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setHidden:", 0);

          objc_msgSend(v16, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setAlpha:", v14);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v92, v136, 16);
      }
      while (v12);
    }
    v19 = (void *)objc_opt_class();
    v20 = MEMORY[0x1E0C809B0];
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_15;
    v89[3] = &unk_1E5818D00;
    v90 = v10;
    v91 = v4;
    v21 = v10;
    objc_msgSend(v19, "alphaAnimatorWithAnimations:", v89);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v20;
    v87[1] = 3221225472;
    v87[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_16;
    v87[3] = &unk_1E58192C8;
    v23 = v82;
    v88 = v82;
    objc_msgSend(v22, "addCompletion:", v87);
    objc_msgSend(v22, "startAnimation");

    v24 = v90;
    v8 = v9;
  }

}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(*(id *)(a1 + 32), "_removeInactiveViewControllersFromHierarchy");
  objc_msgSend(*(id *)(a1 + 32), "_dequeueAndPerformBatchUpdatesIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MinY;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "bounds");
  MinY = CGRectGetMinY(v21);
  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  v15 = MinY - CGRectGetHeight(v22);
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  v16 = v15 - (double)a3 * (CGRectGetHeight(v23) - *(double *)(a1 + 48));
  objc_msgSend(v20, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMediaControls_untransformedFrame:", v7, v16, v11, v13);

  objc_msgSend(v20, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);

  objc_msgSend(v20, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 0);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxY;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "bounds");
  MaxY = CGRectGetMaxY(v20);
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v15 = MaxY + (double)a3 * (CGRectGetHeight(v21) - *(double *)(a1 + 48));
  objc_msgSend(v19, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMediaControls_untransformedFrame:", v7, v15, v11, v13);

  objc_msgSend(v19, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 0.0);

  objc_msgSend(v19, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 0);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_4(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_frameForViewAtIndex:", objc_msgSend(a1[6], "integerValue"));
  objc_msgSend(v2, "setMediaControls_untransformedFrame:");

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_6(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_frameForViewAtIndex:", objc_msgSend(a1[6], "integerValue"));
  objc_msgSend(v2, "setMediaControls_untransformedFrame:");

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_9;
  v8[3] = &unk_1E581B0F0;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_10;
  v5[3] = &unk_1E581B0F0;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;

  v8 = v7 - *(double *)(a1 + 40);
  objc_msgSend(v10, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v5, v8);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;

  v8 = v7 + *(double *)(a1 + 40);
  objc_msgSend(v10, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v5, v8);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_11(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_38_0);

  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_39);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_15(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "view", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (*(_BYTE *)(a1 + 40))
          v9 = 1.0;
        else
          v9 = 0.0;
        objc_msgSend(v7, "setAlpha:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __100__MediaControlsCollectionViewController__transitionTopAndBottomViewControllersToVisible_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_insertViewControllerForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *activeViewControllers;
  void *v8;
  void *v9;
  MediaControlsMaterialView *v10;
  MediaControlsMaterialView *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  MediaControlsStyleCoordinator *v20;
  void *v21;
  void *v22;
  MediaControlsCollectionViewController *v23;
  UIScrollView *v24;
  UIScrollView *scrollView;
  _QWORD v27[10];

  -[MediaControlsCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaControlsCollectionViewController:viewControllerForItemAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSelected:", self->_selectedItemIndex == a3);
  activeViewControllers = self->_activeViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](activeViewControllers, "setObject:forKey:", v6, v8);

  objc_msgSend(v6, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = [MediaControlsMaterialView alloc];
    v11 = -[MediaControlsMaterialView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setBackgroundView:", v11);

  }
  -[MediaControlsCollectionViewController _frameForViewAtIndex:](self, "_frameForViewAtIndex:", a3);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_alloc_init(MediaControlsStyleCoordinator);
  objc_msgSend(v6, "willTransitionToSize:withCoordinator:", v20, v17, v19);
  objc_msgSend(v6, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__MediaControlsCollectionViewController__insertViewControllerForIndex___block_invoke;
  v27[3] = &unk_1E581AFA0;
  v27[4] = self;
  v27[5] = v13;
  v27[6] = v15;
  *(double *)&v27[7] = v17;
  *(double *)&v27[8] = v19;
  v27[9] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v27);
  -[MediaControlsStyleCoordinator performAnimations](v20, "performAnimations");
  -[MediaControlsStyleCoordinator performCompletions](v20, "performCompletions");
  -[MediaControlsCollectionViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mediaControlsCollectionViewController:willDisplayViewController:forItemAtIndex:", self, v6, a3);
  objc_msgSend(v6, "parentViewController");
  v23 = (MediaControlsCollectionViewController *)objc_claimAutoreleasedReturnValue();

  if (v23 == self)
  {
    -[MediaControlsCollectionViewController _beginAppearanceTransitionIfNeeded:forChildViewController:animated:](self, "_beginAppearanceTransitionIfNeeded:forChildViewController:animated:", 1, v6, 0);
    -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllerIfNeeded:](self, "_endAppearanceTransitionForChildViewControllerIfNeeded:", v6);
  }
  else
  {
    -[MediaControlsCollectionViewController addChildViewController:](self, "addChildViewController:", v6);
    -[MediaControlsCollectionViewController _beginAppearanceTransitionIfNeeded:forChildViewController:animated:](self, "_beginAppearanceTransitionIfNeeded:forChildViewController:animated:", 1, v6, 0);
    objc_msgSend(v21, "superview");
    v24 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    scrollView = self->_scrollView;

    if (v24 != scrollView)
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v21);
    -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllerIfNeeded:](self, "_endAppearanceTransitionForChildViewControllerIfNeeded:", v6);
    objc_msgSend(v6, "didMoveToParentViewController:", self);
  }
  objc_msgSend(v21, "setHidden:", 0);
  objc_msgSend(v21, "setAlpha:", 1.0);
  objc_msgSend(v22, "mediaControlsCollectionViewController:didDisplayViewController:forItemAtIndex:", self, v6, a3);

  return v6;
}

uint64_t __71__MediaControlsCollectionViewController__insertViewControllerForIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_reapViewAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_activeViewControllers, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MediaControlsCollectionViewController _beginAppearanceTransitionIfNeeded:forChildViewController:animated:](self, "_beginAppearanceTransitionIfNeeded:forChildViewController:animated:", 0, v5, 0);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllerIfNeeded:](self, "_endAppearanceTransitionForChildViewControllerIfNeeded:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_activeViewControllers, "removeObjectForKey:", v8);
    if (self->_selectedItemIndex == a3)
      objc_storeStrong((id *)&self->_inactiveSelectedViewController, v5);
    else
      -[NSMutableSet addObject:](self->_inactiveViewControllers, "addObject:", v5);
    -[MediaControlsCollectionViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaControlsCollectionViewController:didEndDisplayingViewController:forItemAtIndex:", self, v5, a3);

  }
}

- (void)_reapActiveViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__MediaControlsCollectionViewController__reapActiveViews__block_invoke;
  v2[3] = &unk_1E581B078;
  v2[4] = self;
  -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v2);
}

uint64_t __57__MediaControlsCollectionViewController__reapActiveViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reapViewAtIndex:", a2);
}

- (void)_removeInactiveViewControllersFromHierarchy
{
  NSMutableSet *inactiveViewControllers;
  _QWORD v4[5];

  inactiveViewControllers = self->_inactiveViewControllers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__MediaControlsCollectionViewController__removeInactiveViewControllersFromHierarchy__block_invoke;
  v4[3] = &unk_1E581B1A0;
  v4[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](inactiveViewControllers, "enumerateObjectsUsingBlock:", v4);
  if (self->_inactiveSelectedViewController)
    -[MediaControlsCollectionViewController _removeViewController:](self, "_removeViewController:");
}

uint64_t __84__MediaControlsCollectionViewController__removeInactiveViewControllersFromHierarchy__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeViewController:", a2);
}

- (void)_removeViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "willMoveToParentViewController:", 0);
  if (objc_msgSend(v5, "isViewLoaded"))
  {
    -[MediaControlsCollectionViewController _beginAppearanceTransitionIfNeeded:forChildViewController:animated:](self, "_beginAppearanceTransitionIfNeeded:forChildViewController:animated:", 0, v5, 0);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[MediaControlsCollectionViewController _endAppearanceTransitionForChildViewControllerIfNeeded:](self, "_endAppearanceTransitionForChildViewControllerIfNeeded:", v5);
  }
  objc_msgSend(v5, "removeFromParentViewController");

}

- (void)_setHighlighted:(BOOL)a3 forViewControllerAtIndex:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  if (self->_highlightedItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController _setHighlighted:forViewController:](self, "_setHighlighted:forViewController:", 0, v7);

  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController _setHighlighted:forViewController:](self, "_setHighlighted:forViewController:", v5, v8);

  }
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
    v9 = a4;
  self->_highlightedItemIndex = v9;
}

- (void)_setHighlighted:(BOOL)a3 forViewController:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  objc_msgSend(a4, "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setHighlighted:", v4);

}

- (void)_beginAppearanceTransitionIfNeeded:(BOOL)a3 forChildViewController:(id)a4 animated:(BOOL)a5
{
  if (self->_appeared)
    objc_msgSend(a4, "beginAppearanceTransition:animated:", a3, a5);
}

- (void)_endAppearanceTransitionForChildViewControllerIfNeeded:(id)a3
{
  if (self->_appeared)
    objc_msgSend(a3, "endAppearanceTransition");
}

- (void)_beginAppearanceTransitionForChildViewControllers:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MediaControlsCollectionViewController visibleViewControllers](self, "visibleViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "beginAppearanceTransition:animated:", v5, v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_endAppearanceTransitionForChildViewControllers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MediaControlsCollectionViewController visibleViewControllers](self, "visibleViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "endAppearanceTransition");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  if (!self->_shouldIgnoreScrollNotifications)
  {
    -[UIScrollView bounds](self->_scrollView, "bounds", a3);
    -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int64_t v6;

  if (self->_tapGestureRecognizer != a3)
    return 1;
  objc_msgSend(a4, "locationInView:", self->_scrollView);
  v6 = -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:");
  return v6 == 0x7FFFFFFFFFFFFFFFLL || v6 != self->_selectedItemIndex;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIScrollView *scrollView;
  id v6;
  void *v7;
  char v8;

  if (self->_tapGestureRecognizer != a3)
    return 0;
  scrollView = self->_scrollView;
  v6 = a4;
  -[UIScrollView gestureRecognizers](scrollView, "gestureRecognizers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

- (void)_handleScrollViewTap:(id)a3
{
  double v4;
  double v5;
  int64_t v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL8 v10;
  void *v11;
  int64_t appearanceTransitionCount;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "locationInView:", self->_scrollView);
  v5 = v4;
  v6 = -[MediaControlsCollectionViewController itemAtPoint:](self, "itemAtPoint:");
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v8 = v7;
  v9 = v6 < 0 || v6 >= -[MediaControlsCollectionViewCountData numberOfItems](self->_countData, "numberOfItems");
  if (v5 < self->_scrollViewInsets.left)
    goto LABEL_8;
  if (v5 > v8 - self->_scrollViewInsets.right)
    v9 = 1;
  if (v9)
LABEL_8:
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = objc_msgSend(v13, "state") == 1 || objc_msgSend(v13, "state") == 2;
  -[MediaControlsCollectionViewController _setHighlighted:forViewControllerAtIndex:](self, "_setHighlighted:forViewControllerAtIndex:", v10, v6);
  if (objc_msgSend(v13, "state") == 3)
  {
    -[MediaControlsCollectionViewController _setHighlighted:forViewControllerAtIndex:](self, "_setHighlighted:forViewControllerAtIndex:", 0, v6);
    -[MediaControlsCollectionViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "mediaControlsCollectionViewController:canSelectItemAtIndex:", self, v6))
    {
      appearanceTransitionCount = self->_appearanceTransitionCount;

      if (!appearanceTransitionCount)
        -[MediaControlsCollectionViewController _setSelectedItemIndex:animated:shouldScroll:shouldNotifyDelegate:withReason:](self, "_setSelectedItemIndex:animated:shouldScroll:shouldNotifyDelegate:withReason:", v6, 1, 1, 1, 0);
    }
    else
    {

    }
  }

}

- (void)_setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4 shouldScroll:(BOOL)a5 shouldNotifyDelegate:(BOOL)a6 withReason:(int64_t)a7
{
  _BOOL4 v10;
  _BOOL4 v12;
  void *v13;
  int64_t displayMode;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  MediaControlsStyleCoordinator *v35;
  MediaControlsStyleCoordinator *v36;
  MediaControlsStyleCoordinator *v37;
  void *v38;
  void *v39;
  MediaControlsStyleCoordinator *v40;
  id v41;
  id v42;
  uint64_t v43;
  MediaControlsStyleCoordinator *v44;
  MediaControlsStyleCoordinator *v45;
  MediaControlsStyleCoordinator *v46;
  void *v47;
  MediaControlsStyleCoordinator *v48;
  MediaControlsStyleCoordinator *v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  MediaControlsStyleCoordinator *v57;
  int64_t v58;
  int64_t v59;
  BOOL v60;
  _QWORD v61[4];
  MediaControlsStyleCoordinator *v62;
  _QWORD v63[4];
  MediaControlsStyleCoordinator *v64;
  MediaControlsCollectionViewController *v65;
  BOOL v66;
  BOOL v67;
  _QWORD v68[4];
  MediaControlsStyleCoordinator *v69;
  _QWORD v70[5];
  id v71;
  MediaControlsStyleCoordinator *v72;
  id v73;
  MediaControlsStyleCoordinator *v74;
  double v75;
  double v76;
  int64_t v77;
  CGRect v78;
  CGRect v79;

  if (!self->_isPerformingBatchUpdates && self->_selectedItemIndex != a3)
  {
    v10 = a6;
    v12 = a4;
    -[MediaControlsCollectionViewController visibleIndexes](self, "visibleIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", self->_selectedItemIndex);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsIndex:", a3) & 1) != 0
      || (objc_msgSend(v13, "containsIndex:", self->_selectedItemIndex) & 1) != 0)
    {
      displayMode = self->_displayMode;
      v15 = displayMode == 1;
    }
    else
    {
      v15 = 0;
      displayMode = self->_displayMode;
    }
    v53 = displayMode == 0;
    objc_msgSend(v54, "setSelected:", 0);
    self->_selectedItemIndex = a3;
    -[MediaControlsCollectionViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v10)
      objc_msgSend(v16, "mediaControlsCollectionViewController:willSelectItemAtIndex:withReason:", self, a3, a7);
    if (!v15)
    {
      if (a5 || !displayMode)
        -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 1);
      if (v10)
        objc_msgSend(v17, "mediaControlsCollectionViewController:didSelectItemAtIndex:withReason:", self, a3, a7);
      goto LABEL_25;
    }
    v51 = v17;
    v52 = v13;
    -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSelected");
    v50 = v18;
    objc_msgSend(v18, "setSelected:", 1);
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[MediaControlsCollectionViewController _preferredSelectedItemHeight](self, "_preferredSelectedItemHeight");
    v29 = -v28;
    v78.origin.x = v21;
    v78.origin.y = v23;
    v78.size.width = v25;
    v78.size.height = v27;
    v79 = CGRectInset(v78, 0.0, v29);
    -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:", v79.origin.x, v79.origin.y, v79.size.width, v79.size.height);
    -[MediaControlsCollectionViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;

    if (v19)
    {
      v17 = v51;
      if (a5 || !displayMode)
        -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 1);
      v35 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v32, v34);
      -[MediaControlsStyleCoordinator performAnimations](v35, "performAnimations");
      -[MediaControlsStyleCoordinator performCompletions](v35, "performCompletions");
      if (!v10)
        goto LABEL_16;
    }
    else
    {
      if (v12)
      {
        v36 = objc_alloc_init(MediaControlsStyleCoordinator);
        v37 = objc_alloc_init(MediaControlsStyleCoordinator);
        objc_msgSend((id)objc_opt_class(), "frameAnimator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "frameAnimator");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke;
        v70[3] = &unk_1E581B1C8;
        v75 = v32;
        v76 = v34;
        v77 = a3;
        v70[4] = self;
        v71 = v39;
        v49 = v37;
        v72 = v49;
        v73 = v38;
        v40 = v36;
        v74 = v40;
        v41 = v38;
        v42 = v39;
        -[MediaControlsCollectionViewController _enumerateActiveViewControllers:](self, "_enumerateActiveViewControllers:", v70);
        v43 = MEMORY[0x1E0C809B0];
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_3;
        v68[3] = &unk_1E5818C88;
        v44 = v40;
        v69 = v44;
        objc_msgSend(v41, "addAnimations:", v68);
        v63[0] = v43;
        v63[1] = 3221225472;
        v63[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_4;
        v63[3] = &unk_1E581B1F0;
        v45 = v49;
        v66 = a5;
        v67 = v53;
        v64 = v45;
        v65 = self;
        objc_msgSend(v42, "addAnimations:", v63);
        v61[0] = v43;
        v61[1] = 3221225472;
        v61[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_5;
        v61[3] = &unk_1E5819AA0;
        v62 = v44;
        v46 = v44;
        v47 = v41;
        objc_msgSend(v41, "addCompletion:", v61);
        v55[0] = v43;
        v55[1] = 3221225472;
        v55[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_6;
        v55[3] = &unk_1E581B218;
        v55[4] = self;
        v60 = v10;
        v17 = v51;
        v58 = a3;
        v59 = a7;
        v56 = v51;
        v57 = v45;
        v48 = v45;
        objc_msgSend(v42, "addCompletion:", v55);
        ++self->_animatedSelectionCount;
        self->_isAnimatingSelection = 1;
        self->_shouldDisableAutoReaping = 1;
        objc_msgSend(v47, "startAnimation");
        objc_msgSend(v42, "startAnimationAfterDelay:", 0.1);

        goto LABEL_24;
      }
      if (a5 || !displayMode)
        -[MediaControlsCollectionViewController _scrollToSelectedItemAnimated:](self, "_scrollToSelectedItemAnimated:", 0);
      v35 = objc_alloc_init(MediaControlsStyleCoordinator);
      -[MediaControlsCollectionViewController _updateFramesForActiveViewControllersWithCoordinator:assumingSize:](self, "_updateFramesForActiveViewControllersWithCoordinator:assumingSize:", v35, v32, v34);
      -[MediaControlsStyleCoordinator performAnimations](v35, "performAnimations");
      -[MediaControlsStyleCoordinator performCompletions](v35, "performCompletions");
      -[UIScrollView bounds](self->_scrollView, "bounds");
      -[MediaControlsCollectionViewController _populateViewsInFrame:](self, "_populateViewsInFrame:");
      v17 = v51;
      if (!v10)
      {
LABEL_16:

LABEL_24:
        v13 = v52;

LABEL_25:
        return;
      }
    }
    objc_msgSend(v17, "mediaControlsCollectionViewController:didSelectItemAtIndex:withReason:", self, a3, a7);
    goto LABEL_16;
  }
}

void __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id *v18;
  id v19;
  _QWORD v20[10];

  v5 = *(void **)(a1 + 32);
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 80);
  v8 = a3;
  objc_msgSend(v5, "_frameForViewAtIndex:size:", a2, v6, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (*(_QWORD *)(a1 + 88) == a2)
  {
    v17 = *(id *)(a1 + 40);
    v18 = (id *)(a1 + 48);
  }
  else
  {
    v17 = *(id *)(a1 + 56);
    v18 = (id *)(a1 + 64);
  }
  v19 = *v18;
  objc_msgSend(v8, "willTransitionToSize:withCoordinator:", v19, v14, v16);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_2;
  v20[3] = &unk_1E581AFA0;
  v20[4] = *(_QWORD *)(a1 + 32);
  v20[5] = v10;
  v20[6] = v12;
  *(double *)&v20[7] = v14;
  *(double *)&v20[8] = v16;
  v20[9] = a2;
  objc_msgSend(v17, "addAnimations:", v20);

}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFrame:forVisibleViewAtIndex:", *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAnimations");
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "performAnimations");
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
    return objc_msgSend(*(id *)(a1 + 40), "_scrollToSelectedItemAnimated:", 0);
  return result;
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performCompletions");
}

uint64_t __117__MediaControlsCollectionViewController__setSelectedItemIndex_animated_shouldScroll_shouldNotifyDelegate_withReason___block_invoke_6(uint64_t a1)
{
  uint64_t v2;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 1048))
  {
    *(_BYTE *)(v2 + 1066) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1064) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 1112), "bounds");
  objc_msgSend((id)v2, "_populateViewsInFrame:");
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 40), "mediaControlsCollectionViewController:didSelectItemAtIndex:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "performCompletions");
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueAndPerformBatchUpdatesIfNeeded");
}

- (BOOL)_wantsTapGestureRecognizer
{
  return self->_displayMode == 1;
}

- (void)_enumerateActiveViewControllers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)-[NSMutableDictionary copy](self->_activeViewControllers, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MediaControlsCollectionViewController__enumerateActiveViewControllers___block_invoke;
  v7[3] = &unk_1E581B240;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __73__MediaControlsCollectionViewController__enumerateActiveViewControllers___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, objc_msgSend(a2, "integerValue"), v7, a4);

}

- (id)_visibleTopViewControllers
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_activeViewControllers, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_activeViewControllers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "integerValue", (_QWORD)v11) >= self->_selectedItemIndex)
          objc_msgSend(v3, "removeObjectForKey:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleBottomViewControllers
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_activeViewControllers, "mutableCopy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_activeViewControllers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "integerValue", (_QWORD)v11) <= self->_selectedItemIndex)
          objc_msgSend(v3, "removeObjectForKey:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_isScrollViewAnimatingScroll
{
  return -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating")
      || -[UIScrollView isDragging](self->_scrollView, "isDragging");
}

- (double)_backgroundCornerRadius
{
  double result;

  CCUIExpandedModuleContinuousCornerRadius();
  if (!self->_displayMode)
    return 20.0;
  return result;
}

+ (id)frameAnimator
{
  id v2;

  if (frameAnimator_onceToken != -1)
    dispatch_once(&frameAnimator_onceToken, &__block_literal_global_44);
  v2 = objc_alloc(MEMORY[0x1E0CC2368]);
  return (id)objc_msgSend(v2, "initWithDuration:timingParameters:", frameAnimator_timing, 1.0);
}

void __54__MediaControlsCollectionViewController_frameAnimator__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2370]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 38.0, 0.0, 0.0);
  v1 = (void *)frameAnimator_timing;
  frameAnimator_timing = v0;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  objc_msgSend((id)frameAnimator_timing, "setSpringCubicTimingParameters:", v2);

}

+ (id)alphaAnimatorWithAnimations:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3F38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDuration:controlPoint1:controlPoint2:animations:", v4, 0.4, 0.25, 0.1, 0.25, 1.0);

  return v5;
}

- (MediaControlsCollectionViewDataSource)dataSource
{
  return (MediaControlsCollectionViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (MediaControlsCollectionViewDelegate)delegate
{
  return (MediaControlsCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)scrollViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollViewInsets.top;
  left = self->_scrollViewInsets.left;
  bottom = self->_scrollViewInsets.bottom;
  right = self->_scrollViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (_MediaControlsTapHoldGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (double)preferredItemHeight
{
  return self->_preferredItemHeight;
}

- (void)setPreferredItemHeight:(double)a3
{
  self->_preferredItemHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_countData, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_inactiveViewControllers, 0);
  objc_storeStrong((id *)&self->_inactiveSelectedViewController, 0);
  objc_storeStrong((id *)&self->_activeViewControllers, 0);
}

@end
