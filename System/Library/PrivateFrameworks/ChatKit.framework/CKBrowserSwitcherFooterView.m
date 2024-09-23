@implementation CKBrowserSwitcherFooterView

- (void)dealloc
{
  NSTimer *minificationTimer;
  UICollectionView *appStripCollectionView;
  CKAppStripLayout *appStripLayout;
  void *v6;
  objc_super v7;

  -[NSTimer invalidate](self->_minificationTimer, "invalidate");
  minificationTimer = self->_minificationTimer;
  self->_minificationTimer = 0;

  -[UICollectionView setDelegate:](self->_appStripCollectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_appStripCollectionView, "setDataSource:", 0);
  appStripCollectionView = self->_appStripCollectionView;
  self->_appStripCollectionView = 0;

  appStripLayout = self->_appStripLayout;
  self->_appStripLayout = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView dealloc](&v7, sel_dealloc);
}

- (CKBrowserSwitcherFooterView)initWithFrame:(CGRect)a3 toggleBordersOnInterfaceStyle:(BOOL)a4
{
  CKBrowserSwitcherFooterView *v5;
  CKBrowserSwitcherFooterView *v6;
  void *v7;
  uint64_t v8;
  double *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKAppStripLayout *v17;
  CKAppStripLayout *appStripLayout;
  void *v19;
  uint64_t i;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CKAppStripPredictiveTypeSimpleFadeTransition *v27;
  CKAppStripPredictiveTypeTransition *animator;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CKBrowserSwitcherFooterView;
  v5 = -[CKBrowserSwitcherFooterView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[CKBrowserSwitcherFooterView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    v6->_scrollsLastUsedAppIconIntoView = 1;
    v6->_minifiesOnSelection = 1;
    v6->_hideShinyStatus = 1;
    v6->_toggleBordersOnInterfaceStyle = a4;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = (double *)MEMORY[0x1E0C9D648];
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "browserSwitcherBorderColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", *v9, v9[1], v9[2], v9[3]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "theme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "browserSwitcherBorderColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundColor:", v16);

        -[CKBrowserSwitcherFooterView setGrayLine:](v6, "setGrayLine:", v13);
        -[CKBrowserSwitcherFooterView addSubview:](v6, "addSubview:", v13);

      }
    }
    v17 = objc_alloc_init(CKAppStripLayout);
    appStripLayout = v6->_appStripLayout;
    v6->_appStripLayout = v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v6->_appStripLayout, *v9, v9[1], v9[2], v9[3]);
    for (i = 0; i != 3; ++i)
    {
      v21 = +[CKBrowserCell classForItemType:](CKBrowserCell, "classForItemType:", i);
      -[objc_class reuseIdentifier](v21, "reuseIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "registerClass:forCellWithReuseIdentifier:", v21, v22);

    }
    v23 = objc_opt_class();
    +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBrowserSwitcherFooterAccessoryCell reuseIdentifier](CKBrowserSwitcherFooterAccessoryCell, "reuseIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v23, v24, v25);

    objc_msgSend(v19, "setClipsToBounds:", 0);
    objc_msgSend(v19, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v26);

    objc_msgSend(v19, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v19, "setAlwaysBounceHorizontal:", 1);
    objc_msgSend(v19, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v19, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("appSelectionBrowserIdentifier"));
    objc_msgSend(v19, "setDelegate:", v6);
    objc_msgSend(v19, "setDataSource:", v6);
    objc_msgSend(v19, "setContentInset:", v6->_minifiedContentInsets.top, v6->_minifiedContentInsets.left, v6->_minifiedContentInsets.bottom, v6->_minifiedContentInsets.right);
    objc_storeStrong((id *)&v6->_appStripCollectionView, v19);
    -[CKBrowserSwitcherFooterView addSubview:](v6, "addSubview:", v19);
    objc_storeStrong((id *)&v6->_visibleView, v6->_appStripCollectionView);
    v27 = objc_alloc_init(CKAppStripPredictiveTypeSimpleFadeTransition);
    animator = v6->_animator;
    v6->_animator = (CKAppStripPredictiveTypeTransition *)v27;

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v6, sel_appsLongPressed_);
    objc_msgSend(v29, "setMinimumPressDuration:", 0.2);
    objc_msgSend(v29, "setDelegate:", v6);
    objc_msgSend(v29, "_setRequiresSystemGesturesToFail:", 1);
    objc_storeStrong((id *)&v6->_longPressRecognizer, v29);
    -[UICollectionView addGestureRecognizer:](v6->_appStripCollectionView, "addGestureRecognizer:", v29);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v6, sel_touchTrackerTrackedTouches_);
    objc_msgSend(v30, "setCancelsTouchesInView:", 0);
    objc_msgSend(v30, "setDelaysTouchesEnded:", 0);
    objc_msgSend(v30, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v30, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_touchTracker, v30);
    -[UICollectionView addGestureRecognizer:](v6->_appStripCollectionView, "addGestureRecognizer:", v30);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceIdiom");

    if ((v32 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[CKBrowserSwitcherFooterView grayLine](v6, "grayLine");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherFooterView bringSubviewToFront:](v6, "bringSubviewToFront:", v33);

    }
    v6->_isMagnificationEnabled = 0;
    if (v6->_toggleBordersOnInterfaceStyle)
    {
      -[CKBrowserSwitcherFooterView traitCollection](v6, "traitCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherFooterView setShowBorders:](v6, "setShowBorders:", objc_msgSend(v34, "userInterfaceStyle") == 2);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v6, sel_visibleAppsChanges_, CFSTR("CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v6, sel_updateCollectionView_, CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v6, sel_installedAppsChanged_, CFSTR("CKBrowserSelectionControllerInstallationsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v6, sel_updateBrowserCell_, *MEMORY[0x1E0D352C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v6, sel_transcriptCollectionStartedScrolling_, CFSTR("transcriptCollectionViewWillBeginDragging"), 0);

  }
  return v6;
}

- (CKBrowserSwitcherFooterView)init
{
  return -[CKBrowserSwitcherFooterView initWithFrame:toggleBordersOnInterfaceStyle:](self, "initWithFrame:toggleBordersOnInterfaceStyle:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[CKBrowserSwitcherFooterView reloadData](self, "reloadData");
}

- (void)willMoveToWindow:(id)a3
{
  NSTimer *minificationTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    -[NSTimer invalidate](self->_minificationTimer, "invalidate");
    minificationTimer = self->_minificationTimer;
    self->_minificationTimer = 0;

  }
}

- (void)willMoveToSuperview:(id)a3
{
  NSTimer *minificationTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    -[NSTimer invalidate](self->_minificationTimer, "invalidate");
    minificationTimer = self->_minificationTimer;
    self->_minificationTimer = 0;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView layoutSubviews](&v17, sel_layoutSubviews);
  -[CKBrowserSwitcherFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CKBrowserSwitcherFooterView insetsForAppStrip](self, "insetsForAppStrip");
  self->_minifiedContentInsets.top = v9;
  self->_minifiedContentInsets.left = v10;
  self->_minifiedContentInsets.bottom = v11;
  self->_minifiedContentInsets.right = v12;
  -[UICollectionView setContentInset:](self->_appStripCollectionView, "setContentInset:");
  -[CKBrowserSwitcherFooterView contentHeight](self, "contentHeight");
  -[UICollectionView setFrame:](self->_appStripCollectionView, "setFrame:", v4, v6, v8, v13);
  -[UICollectionView _setVisibleRectEdgeInsets:](self->_appStripCollectionView, "_setVisibleRectEdgeInsets:", 0.0, v8 * -0.8, 0.0, v8 * -0.8);
  -[CKBrowserSwitcherFooterView grayLine](self, "grayLine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherFooterView bounds](self, "bounds");
  v16 = v15;
  if (CKPixelWidth_once_4 != -1)
    dispatch_once(&CKPixelWidth_once_4, &__block_literal_global_87);
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v16, *(double *)&CKPixelWidth_sPixel_4);

  self->_isMagnificationEnabled = 1;
}

- (UIEdgeInsets)insetsForAppStrip
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar")
    && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isAppStripInKeyboard"),
        v2,
        (v3 & 1) != 0))
  {
    v4 = 7.0;
    v5 = 2.0;
  }
  else
  {
    v4 = 7.0;
    v5 = 3.0;
  }
  v6 = v5;
  v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (BOOL)isMagnified
{
  return self->_isMagnified;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;

  if (self->_toggleBordersOnInterfaceStyle)
  {
    -[CKBrowserSwitcherFooterView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserSwitcherFooterView setShowBorders:](self, "setShowBorders:", objc_msgSend(v3, "userInterfaceStyle") == 2);

  }
  -[CKBrowserSwitcherFooterView reloadData](self, "reloadData");
}

- (void)setShowBorders:(BOOL)a3
{
  -[CKAppStripLayout setShouldShowCellBorders:](self->_appStripLayout, "setShouldShowCellBorders:", a3);
}

- (BOOL)showBorders
{
  return -[CKAppStripLayout shouldShowCellBorders](self->_appStripLayout, "shouldShowCellBorders");
}

- (void)setInitiallySelectedPluginIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[CKBrowserSwitcherFooterView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UICollectionView indexPathsForSelectedItems](self->_appStripCollectionView, "indexPathsForSelectedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[CKBrowserSwitcherFooterView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathOfCurrentlySelectedPluginInSwitcherView:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherFooterView selectPluginAtIndexPath:](self, "selectPluginAtIndexPath:", v7);

    }
  }
}

- (void)selectPluginAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double MaxX;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  CGRect v19;

  v18 = a3;
  -[UICollectionView indexPathsForSelectedItems](self->_appStripCollectionView, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionView indexPathsForVisibleItems](self->_appStripCollectionView, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v18))
  {
    -[UICollectionView cellForItemAtIndexPath:](self->_appStripCollectionView, "cellForItemAtIndexPath:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    -[UICollectionView contentOffset](self->_appStripCollectionView, "contentOffset");
    if (v9 >= v10
      && (objc_msgSend(v7, "frame"),
          MaxX = CGRectGetMaxX(v19),
          -[UICollectionView contentOffset](self->_appStripCollectionView, "contentOffset"),
          v13 = v12,
          -[UICollectionView bounds](self->_appStripCollectionView, "bounds"),
          MaxX <= v13 + v14))
    {
      v16 = 0;
    }
    else
    {
      v15 = objc_msgSend(v18, "item");
      if (v15 <= objc_msgSend(v5, "item"))
        v16 = 8;
      else
        v16 = 32;
    }

  }
  else
  {
    v17 = objc_msgSend(v18, "item");
    if (v17 <= objc_msgSend(v5, "item"))
      v16 = 8;
    else
      v16 = 32;
  }
  if (v18)
  {
    self->_isMagnificationEnabled = 0;
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_appStripCollectionView, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, v16);
    self->_isMagnificationEnabled = 1;
  }

}

- (void)resetScrollPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[CKBrowserSwitcherFooterView appStripCollectionView](self, "appStripCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = v4;
  v7 = v6;

  -[CKBrowserSwitcherFooterView appStripCollectionView](self, "appStripCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentOffset:", -v7, -v5);

  -[CKBrowserSwitcherFooterView clearSelection](self, "clearSelection");
}

- (void)clearSelection
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CKBrowserSwitcherFooterView appStripCollectionView](self, "appStripCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
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
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          -[CKBrowserSwitcherFooterView appStripCollectionView](self, "appStripCollectionView", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (double)contentHeightForCameraApps
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = -[CKBrowserSwitcherFooterView isMagnified](self, "isMagnified");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "chatMagnifiedChromeBottomInset");
  else
    objc_msgSend(v3, "cameraAppsMinimizedDockHeight");
  v6 = v5;

  return v6;
}

- (double)contentHeight
{
  double result;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  char v10;

  if (CKIsRunningInCameraAppsClient())
  {
    -[CKBrowserSwitcherFooterView contentHeightForCameraApps](self, "contentHeightForCameraApps");
    return result;
  }
  if (-[CKBrowserSwitcherFooterView isMagnified](self, "isMagnified"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatMagnifiedChromeBottomInset");
LABEL_7:
    v8 = v5;

    return v8;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatChromeBottomInset");
    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "__ck_isUsingCompactHeightPredictionBar"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAppStripInKeyboard");

    if ((v10 & 1) != 0)
      return 37.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA6C8], "predictionViewHeightForCurrentInputMode");
  return result;
}

- (UICollectionView)appStripCollectionView
{
  return self->_appStripCollectionView;
}

- (void)appsLongPressed:(id)a3
{
  void *v4;
  void *appStripCollectionView;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UICollectionView *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "state") == 1)
  {
    if (!self->_isMagnified)
    {
      v4 = v15;
      appStripCollectionView = self;
LABEL_15:
      objc_msgSend(v4, "locationInView:", appStripCollectionView);
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 0);
      goto LABEL_16;
    }
  }
  else if (!self->_isMagnified)
  {
    goto LABEL_16;
  }
  objc_msgSend(v15, "locationInView:", self->_appStripCollectionView);
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v15, "state");
  if (v10 == 3)
  {
    -[UICollectionView endInteractiveMovement](self->_appStripCollectionView, "endInteractiveMovement");
LABEL_14:
    -[UICollectionView setEditing:](self->_appStripCollectionView, "setEditing:", 0);
    -[UICollectionView panGestureRecognizer](self->_appStripCollectionView, "panGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", 1);

    appStripCollectionView = self->_appStripCollectionView;
    v4 = v15;
    goto LABEL_15;
  }
  if (v10 == 2)
  {
    -[UICollectionView updateInteractiveMovementTargetPosition:](self->_appStripCollectionView, "updateInteractiveMovementTargetPosition:", v7, v9);
    goto LABEL_16;
  }
  if (v10 != 1)
  {
    -[UICollectionView cancelInteractiveMovement](self->_appStripCollectionView, "cancelInteractiveMovement");
    goto LABEL_14;
  }
  v11 = self->_appStripCollectionView;
  objc_msgSend(v15, "locationInView:", v11);
  -[UICollectionView indexPathForItemAtPoint:](v11, "indexPathForItemAtPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UICollectionView setEditing:](self->_appStripCollectionView, "setEditing:", 1);
    -[UICollectionView beginInteractiveMovementForItemAtIndexPath:](self->_appStripCollectionView, "beginInteractiveMovementForItemAtIndexPath:", v12);
    -[UICollectionView panGestureRecognizer](self->_appStripCollectionView, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

  }
LABEL_16:

}

- (void)touchTrackerTrackedTouches:(id)a3
{
  uint64_t v4;
  CKBrowserSwitcherFooterView *v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 4) < 2)
  {
    v5 = self;
    v6 = 1;
LABEL_8:
    -[CKBrowserSwitcherFooterView minifyImmediately:](v5, "minifyImmediately:", v6);
    return;
  }
  if (v4 == 3)
  {
    v5 = self;
    v6 = 0;
    goto LABEL_8;
  }
  if (v4 == 1)
    self->_hasTouches = 1;
}

- (void)minifyImmediately:(BOOL)a3
{
  _BOOL8 v3;

  self->_hasTouches = 0;
  if (self->_isMagnified)
  {
    v3 = a3;
    -[UILongPressGestureRecognizer locationInView:](self->_longPressRecognizer, "locationInView:", self->_appStripCollectionView);
    -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (CGPoint)targetContentOffsetForFocusPoint:(CGPoint)a3 initialLayoutMode:(unint64_t)a4 finalLayoutMode:(unint64_t)a5
{
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  x = a3.x;
  -[UICollectionView contentOffset](self->_appStripCollectionView, "contentOffset", a3.x, a3.y);
  v10 = v9;
  v12 = v11;
  if (a4 != 1 || v9 != -self->_minifiedContentInsets.left)
  {
    -[CKAppStripLayout collectionViewContentSizeForLayoutMode:](self->_appStripLayout, "collectionViewContentSizeForLayoutMode:", a4);
    v14 = v13;
    -[CKAppStripLayout collectionViewContentSizeForLayoutMode:](self->_appStripLayout, "collectionViewContentSizeForLayoutMode:", a5);
    v10 = (x + v10) / v14 * v15 - x;
  }
  v16 = v10;
  v17 = v12;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  double v8;
  uint64_t v9;
  void *v10;
  NSTimer *v11;
  NSTimer *minificationTimer;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  CKBrowserSwitcherFooterView *v18;
  id v19[3];
  BOOL v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[7];

  if (self->_isMagnificationEnabled)
  {
    y = a3.y;
    x = a3.x;
    if (!-[UICollectionView isEditing](self->_appStripCollectionView, "isEditing"))
    {
      v8 = 0.0;
      v9 = MEMORY[0x1E0C809B0];
      if (!a4)
      {
        v8 = 1.5;
        if (!self->_isMagnified)
        {
          self->_isDoingMagnificationAnimation = 1;
          -[CKAppStripLayout prepareForLayoutModeTransition](self->_appStripLayout, "prepareForLayoutModeTransition");
          -[CKAppStripLayout invalidateLayout](self->_appStripLayout, "invalidateLayout");
          v22[4] = self;
          v23[0] = v9;
          v23[1] = 3221225472;
          v23[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke;
          v23[3] = &unk_1E27506B0;
          v23[4] = self;
          *(CGFloat *)&v23[5] = x;
          *(CGFloat *)&v23[6] = y;
          v22[0] = v9;
          v22[1] = 3221225472;
          v22[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_2;
          v22[3] = &unk_1E274A1B8;
          objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v23, v22, 0.4, 0.0, 0.75, 0.0);
        }
      }
      -[NSTimer invalidate](self->_minificationTimer, "invalidate");
      location = 0;
      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x1E0C99E88];
      v14 = v9;
      v15 = 3221225472;
      v16 = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_3;
      v17 = &unk_1E2750728;
      objc_copyWeak(v19, &location);
      v20 = a4;
      v19[1] = *(id *)&x;
      v19[2] = *(id *)&y;
      v18 = self;
      objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v14, v8);
      v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      minificationTimer = self->_minificationTimer;
      self->_minificationTimer = v11;

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v14, v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addTimer:forMode:", self->_minificationTimer, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 488) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setMinimumPressDuration:", 0.5);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherView:didMagnify:", *(_QWORD *)(a1 + 32), 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setLayoutMode:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "collectionViewContentSizeForLayoutMode:", 1);
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "setContentSize:", v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "targetContentOffsetForFocusPoint:initialLayoutMode:finalLayoutMode:", 0, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setContentOffset:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "performBatchUpdates:completion:", 0, 0);
}

uint64_t __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "finishLayoutModeTransition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 489) = 0;
  return result;
}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  char v14;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 488) && (objc_msgSend(WeakRetained[53], "isEditing") & 1) == 0)
  {
    if (*((_BYTE *)v5 + 520))
      v6 = 0;
    else
      v6 = __CurrentTestName == 0;
    if (v6)
    {
      *((_BYTE *)v5 + 489) = 1;
      objc_msgSend(v5[52], "prepareForLayoutModeTransition");
      objc_msgSend(v5[52], "invalidateLayout");
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v8 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_4;
      v11[3] = &unk_1E27506D8;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      v14 = *(_BYTE *)(a1 + 64);
      v13 = *(_OWORD *)(a1 + 48);
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_5;
      v9[3] = &unk_1E2750700;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v11, v9, 0.4, 0.0, 0.75, 0.0);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
    }
  }

}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
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
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v16 = WeakRetained;
    v3 = WeakRetained[53];
    v4 = v16[52];
    *((_BYTE *)v16 + 488) = 0;
    objc_msgSend(v16, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switcherView:didMagnify:", v16, 0);

    objc_msgSend(v4, "setLayoutMode:", 0);
    if (*(_BYTE *)(a1 + 56))
    {
      v6 = *(double *)(a1 + 40);
    }
    else
    {
      objc_msgSend(v3, "contentOffset");
      v7 = *((double *)v16 + 58);
      if (v8 >= 1.0 - v7)
      {
        objc_msgSend(v3, "contentOffset");
        v10 = v9;
        objc_msgSend(v3, "contentSize");
        v12 = v11;
        objc_msgSend(v3, "bounds");
        v14 = v12 - v13 + -1.0;
        objc_msgSend(v3, "bounds");
        v6 = v15;
        if (v10 <= v14)
          v6 = v15 * 0.5;
      }
      else
      {
        v6 = -v7;
      }
    }
    objc_msgSend(v16, "targetContentOffsetForFocusPoint:initialLayoutMode:finalLayoutMode:", 1, 0, v6, 0.0);
    objc_msgSend(v3, "setContentOffset:");
    objc_msgSend(v3, "performBatchUpdates:completion:", 0, 0);

    WeakRetained = v16;
  }

}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[52], "finishLayoutModeTransition");
    *((_BYTE *)v4 + 489) = 0;
    objc_msgSend(v4[63], "setMinimumPressDuration:", 0.2);
    WeakRetained = v4;
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 525))
      *(_BYTE *)(v3 + 525) = 0;
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  if (self->_isMagnificationEnabled && !self->_isDoingMagnificationAnimation)
  {
    v8 = v4;
    v5 = -[UICollectionView isEditing](self->_appStripCollectionView, "isEditing");
    v4 = v8;
    if (!v5)
    {
      if (__CurrentTestName)
      {
        v6 = *MEMORY[0x1E0C9D538];
        v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }
      else
      {
        -[UILongPressGestureRecognizer locationInView:](self->_longPressRecognizer, "locationInView:", self);
      }
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 0, v6, v7);
      v4 = v8;
    }
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->_isMagnificationEnabled = 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    objc_msgSend(v8, "convertPoint:toView:", self);
    v10 = v9;
    v12 = v11;

    -[CKBrowserSwitcherFooterView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[CKBrowserSwitcherFooterView delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "indexPathOfCurrentlySelectedPluginInSwitcherView:", self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && objc_msgSend(v6, "isEqual:", v16))
      {
        -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", self->_isMagnified, v10, v12);
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v16 = 0;
    }
    if (objc_msgSend(v6, "section") == 1)
    {
      v17 = objc_msgSend(v6, "row");
      v18 = v17 == objc_msgSend(v25, "numberOfItemsInSection:", 1) - 1;
    }
    else
    {
      v18 = 0;
    }
    if (self->_minifiesOnSelection || v18)
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 1, v10, v12);
    self->_ignoreDataSourceChanges = 1;
    if (objc_msgSend(v6, "section") == 1)
    {
      v19 = objc_msgSend(v6, "row");
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "visibleFavoriteAppStripPlugins");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count") + v19;

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v22, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v23;
    }
    -[CKBrowserSwitcherFooterView delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "switcherView:didSelectPluginAtIndex:", self, v6);

    self->_ignoreDataSourceChanges = 0;
    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a5;
  if (objc_msgSend(v6, "section") == 1 && objc_msgSend(v7, "section") == 1)
    goto LABEL_12;
  if (!objc_msgSend(v6, "section") && objc_msgSend(v7, "section") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "section"))
  {
LABEL_12:
    v8 = v6;
    goto LABEL_14;
  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAppStoreEnabled");

  if (v10)
    v11 = 2;
  else
    v11 = 1;
  if (objc_msgSend(v7, "item") <= v11)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
LABEL_14:
  v12 = v8;

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;

  -[CKBrowserSwitcherFooterView dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfPluginsInSwitcherView:forSection:", self, a4);

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v22;

  v22 = 0;
  v6 = a4;
  v7 = a3;
  -[CKBrowserSwitcherFooterView dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherView:modelAtIndexPath:type:", self, v6, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class reuseIdentifier](+[CKBrowserCell classForItemType:](CKBrowserCell, "classForItemType:", v22), "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v22)
  {
    case 2:
      objc_msgSend(v11, "setInstallation:", v9);
      break;
    case 1:
      v12 = v11;
      objc_msgSend(v12, "setPlugin:hideShinyStatus:", v9, -[CKBrowserSwitcherFooterView hideShinyStatus](self, "hideShinyStatus"));
      objc_msgSend(v12, "browserImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserSwitcherFooterView appStripLayout](self, "appStripLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "shouldDimPluginCells");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "theme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v16 & 1) != 0)
        objc_msgSend(v18, "browserAppStripDimmedPluginCellOpacity");
      else
        objc_msgSend(v18, "browserAppStripLightPluginCellOpacity");
      *(float *)&v20 = v20;
      objc_msgSend(v14, "setOpacity:", v20);

      break;
    case 0:
      _IMWarn();
      break;
  }
  objc_msgSend(v11, "setShouldShowLabel:", self->_isMagnified);

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  v7 = a3;
  +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBrowserSwitcherFooterAccessoryCell reuseIdentifier](CKBrowserSwitcherFooterAccessoryCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAppStripLayout maxHeight](CKAppStripLayout, "maxHeight");
  objc_msgSend(v10, "setMaxHeight:");
  +[CKAppStripLayout minHeight](CKAppStripLayout, "minHeight");
  objc_msgSend(v10, "setMinHeight:");
  return v10;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v15;

  v5 = a4;
  if (CKIsRunningInCameraAppsClient())
    goto LABEL_13;
  v6 = !objc_msgSend(v5, "section") && objc_msgSend(v5, "item") == 0;
  if (objc_msgSend(v5, "section") || objc_msgSend(v5, "item") != 1)
  {
    v8 = 0;
  }
  else
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAppStoreEnabled");

  }
  if (objc_msgSend(v5, "section") == 1)
  {
    v9 = objc_msgSend(v5, "item");
    v10 = v9 != -[UICollectionView numberOfItemsInSection:](self->_appStripCollectionView, "numberOfItemsInSection:", 1)- 1;
  }
  else
  {
    v10 = 1;
  }
  v15 = 0;
  -[CKBrowserSwitcherFooterView dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "switcherView:modelAtIndexPath:type:", self, v5, &v15);

  if (((v6 | v8) & 1) != 0)
LABEL_13:
    v13 = 0;
  else
    v13 = v15 == 1 && v10;

  return v13;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a5;
  v12 = 0;
  v8 = a4;
  -[CKBrowserSwitcherFooterView dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "switcherView:modelAtIndexPath:type:", self, v8, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == 1)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateIndexPath:forPlugin:isDrawerPluginPath:", v7, v10, 1);

  }
}

- (void)visibleAppsChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKBrowserSwitcherFooterView scrollsLastUsedAppIconIntoView](self, "scrollsLastUsedAppIconIntoView"))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("CKBrowserSelectionControllerInstalledPluginsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
            -[CKBrowserSwitcherFooterView dataSource](self, "dataSource");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "switcherView:indexPathOfModelWithIdentifier:", self, v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v7, "item") == 0x7FFFFFFFFFFFFFFFLL
              || (v16 = objc_msgSend(v15, "item"), v16 > objc_msgSend(v7, "item")))
            {
              v17 = v15;

              v7 = v17;
            }

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v7, "item") == 0x7FFFFFFFFFFFFFFFLL
        || (v18 = objc_msgSend(v7, "section"),
            v18 >= -[UICollectionView numberOfSections](self->_appStripCollectionView, "numberOfSections"))
        || (v19 = objc_msgSend(v7, "item"),
            v19 >= -[UICollectionView numberOfItemsInSection:](self->_appStripCollectionView, "numberOfItemsInSection:", objc_msgSend(v7, "section"))))
      {
        _IMWarn();
      }
      else
      {
        -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_appStripCollectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 8, 1);
      }
      v6 = v20;

    }
  }

}

- (void)updateCollectionView:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CKBrowserSwitcherFooterView_updateCollectionView___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__CKBrowserSwitcherFooterView_updateCollectionView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)installedAppsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CKBrowserSwitcherFooterView_installedAppsChanged___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__CKBrowserSwitcherFooterView_installedAppsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)reloadData
{
  void *v3;
  NSInteger v4;
  void *v5;
  uint64_t v6;
  BOOL isMagnificationEnabled;
  id v8;
  id v9;

  if (!self->_ignoreDataSourceChanges)
  {
    -[UICollectionView indexPathsForSelectedItems](self->_appStripCollectionView, "indexPathsForSelectedItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CKAppStripLayout invalidateCachedLayout](self->_appStripLayout, "invalidateCachedLayout");
    -[UICollectionView reloadData](self->_appStripCollectionView, "reloadData");
    v4 = -[UICollectionView numberOfItemsInSection:](self->_appStripCollectionView, "numberOfItemsInSection:", 0);
    if (objc_msgSend(v8, "item") >= v4 - 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4 - 2, 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
      {
LABEL_7:

        return;
      }
    }
    else
    {
      v5 = v8;
      if (!v8)
        goto LABEL_7;
    }
    isMagnificationEnabled = self->_isMagnificationEnabled;
    v9 = v5;
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_appStripCollectionView, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);
    v5 = v9;
    self->_isMagnificationEnabled = isMagnificationEnabled;
    goto LABEL_7;
  }
}

- (void)updateBrowserCell:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CKBrowserSwitcherFooterView *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CKBrowserSwitcherFooterView_updateBrowserCell___block_invoke;
  v6[3] = &unk_1E274A108;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__CKBrowserSwitcherFooterView_updateBrowserCell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("IMBalloonPluginIdentifierKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("UpdatedIMBalloonPluginIconKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherView:indexPathOfModelWithIdentifier:", *(_QWORD *)(a1 + 40), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "browserImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v4);

  }
}

- (void)transcriptCollectionStartedScrolling:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_isMagnified && !self->_isMinifyingOnTranscriptScroll)
  {
    self->_isMinifyingOnTranscriptScroll = 1;
    v5 = v4;
    -[CKBrowserSwitcherFooterView minifyImmediately:](self, "minifyImmediately:", 1);
    v4 = v5;
  }

}

- (void)updatePredictiveTypeSnapshot:(id)a3
{
  id v5;

  v5 = a3;
  -[UIView removeFromSuperview](self->_predictiveTypeSnapshotView, "removeFromSuperview");
  if (v5)
  {
    objc_storeStrong((id *)&self->_predictiveTypeSnapshotView, a3);
    if (!self->_visibleView)
      objc_storeStrong((id *)&self->_visibleView, a3);
    -[CKBrowserSwitcherFooterView addSubview:](self, "addSubview:", v5);
  }
  -[CKBrowserSwitcherFooterView _updateVisibilityState](self, "_updateVisibilityState");

}

- (void)animateAppStripVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  UICollectionView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *visibleView;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  uint64_t v20;
  void (**v21)(id, uint64_t);

  v5 = a4;
  v6 = a3;
  v21 = (void (**)(id, uint64_t))a5;
  if (v6)
    v8 = self->_appStripCollectionView;
  else
    v8 = self->_predictiveTypeSnapshotView;
  -[UIView frame](self->_predictiveTypeSnapshotView, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CKBrowserSwitcherFooterView snapshotVerticalOffset](self, "snapshotVerticalOffset");
  -[UIView setFrame:](self->_predictiveTypeSnapshotView, "setFrame:", v10, v15, v12, v14);
  visibleView = self->_visibleView;
  if (visibleView != (UIView *)v8)
  {
    v17 = v8;
    v18 = self->_visibleView;
    self->_visibleView = v17;
    v19 = visibleView;

    -[UIView setHidden:](v17, "setHidden:", 0);
    -[UIView setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", 1);
    if (v5)
    {
      if (v19 == self->_predictiveTypeSnapshotView)
        v20 = 1;
      else
        v20 = -1;
      -[CKAppStripPredictiveTypeTransition transitionFromView:toView:withDirection:completion:](self->_animator, "transitionFromView:toView:withDirection:completion:", v19, v17, v20, v21);

      goto LABEL_13;
    }
    -[CKBrowserSwitcherFooterView _updateVisibilityState](self, "_updateVisibilityState");

  }
  if (v21)
    v21[2](v21, 1);
LABEL_13:

}

- (void)_updateVisibilityState
{
  UIView *visibleView;
  double v4;

  visibleView = self->_visibleView;
  if (visibleView == self->_predictiveTypeSnapshotView)
  {
    -[UIView setAlpha:](visibleView, "setAlpha:", 1.0);
    v4 = 0.0;
  }
  else
  {
    -[UIView setAlpha:](self->_predictiveTypeSnapshotView, "setAlpha:", 0.0);
    v4 = 1.0;
  }
  -[UICollectionView setAlpha:](self->_appStripCollectionView, "setAlpha:", v4);
}

- (CKBrowserSwitcherFooterViewDelegate)delegate
{
  return (CKBrowserSwitcherFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKBrowserSwitcherFooterViewDataSource)dataSource
{
  return (CKBrowserSwitcherFooterViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setIsMagnified:(BOOL)a3
{
  self->_isMagnified = a3;
}

- (BOOL)scrollsLastUsedAppIconIntoView
{
  return self->_scrollsLastUsedAppIconIntoView;
}

- (void)setScrollsLastUsedAppIconIntoView:(BOOL)a3
{
  self->_scrollsLastUsedAppIconIntoView = a3;
}

- (BOOL)hideShinyStatus
{
  return self->_hideShinyStatus;
}

- (void)setHideShinyStatus:(BOOL)a3
{
  self->_hideShinyStatus = a3;
}

- (BOOL)toggleBordersOnInterfaceStyle
{
  return self->_toggleBordersOnInterfaceStyle;
}

- (void)setToggleBordersOnInterfaceStyle:(BOOL)a3
{
  self->_toggleBordersOnInterfaceStyle = a3;
}

- (CKAppStripLayout)appStripLayout
{
  return self->_appStripLayout;
}

- (void)setAppStripLayout:(id)a3
{
  objc_storeStrong((id *)&self->_appStripLayout, a3);
}

- (BOOL)minifiesOnSelection
{
  return self->_minifiesOnSelection;
}

- (void)setMinifiesOnSelection:(BOOL)a3
{
  self->_minifiesOnSelection = a3;
}

- (BOOL)isMinifyingOnTranscriptScroll
{
  return self->_isMinifyingOnTranscriptScroll;
}

- (void)setIsMinifyingOnTranscriptScroll:(BOOL)a3
{
  self->_isMinifyingOnTranscriptScroll = a3;
}

- (double)snapshotVerticalOffset
{
  return self->_snapshotVerticalOffset;
}

- (void)setSnapshotVerticalOffset:(double)a3
{
  self->_snapshotVerticalOffset = a3;
}

- (UIView)grayLine
{
  return self->_grayLine;
}

- (void)setGrayLine:(id)a3
{
  objc_storeStrong((id *)&self->_grayLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_minificationTimer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_visibleView, 0);
  objc_storeStrong((id *)&self->_predictiveTypeSnapshotView, 0);
  objc_storeStrong((id *)&self->_appStripCollectionView, 0);
  objc_storeStrong((id *)&self->_appStripLayout, 0);
}

@end
