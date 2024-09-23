@implementation MKStackingViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  _MKStackView *v3;
  _MKStackView *stackView;
  _MKStackingContentView *v5;
  _MKStackingContentView *contentView;

  v3 = objc_alloc_init(_MKStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[_MKStackView setStackDelegate:](self->_stackView, "setStackDelegate:", self);
  -[_MKStackView setStackAnimationDelegate:](self->_stackView, "setStackAnimationDelegate:", self);
  -[_MKStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKStackView setPreservesSuperviewLayoutMargins:](self->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
  -[_MKStackView setBottomConstraintShouldBeGreaterThanOrEqual:](self->_stackView, "setBottomConstraintShouldBeGreaterThanOrEqual:", 1);
  v5 = -[_MKStackingContentView initWithViewController:]([_MKStackingContentView alloc], "initWithViewController:", self);
  contentView = self->_contentView;
  self->_contentView = v5;

  -[_MKStackingContentView setPreservesSuperviewLayoutMargins:](self->_contentView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKStackingViewController setView:](self, "setView:", self->_contentView);
}

- (void)viewDidLoad
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  NSHashTable *v5;
  NSHashTable *minimallyVisibleViews;
  void *v7;
  double Width;
  double v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *widthConstraint;
  NSMapTable *v12;
  NSMapTable *viewsToViewControllers;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setPreservesSuperviewLayoutMargins:](self->_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKStackingViewController _setScrollEnabled:forcedUpdate:](self, "_setScrollEnabled:forcedUpdate:", !self->_isScrollDisabled, 1);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  minimallyVisibleViews = self->_minimallyVisibleViews;
  self->_minimallyVisibleViews = v5;

  -[_MKStackView widthAnchor](self->_stackView, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKStackingContentView frame](self->_contentView, "frame");
  Width = CGRectGetWidth(v15);
  v9 = 260.0;
  if (Width >= 260.0)
  {
    -[_MKStackingContentView frame](self->_contentView, "frame");
    v9 = CGRectGetWidth(v16);
  }
  objc_msgSend(v7, "constraintEqualToConstant:", v9);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  viewsToViewControllers = self->_viewsToViewControllers;
  self->_viewsToViewControllers = v12;

}

- (BOOL)_isSafeToPerformLayout
{
  int v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *stackViewWidthConstraint;

  v3 = -[MKStackingViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    -[MKStackingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v3) = v5
              || (stackViewWidthConstraint = self->_stackViewWidthConstraint) != 0
              && -[NSLayoutConstraint isActive](stackViewWidthConstraint, "isActive");
  }
  return v3;
}

- (double)_titleHeight
{
  return 0.0;
}

- (void)setScrollEnabled:(BOOL)a3
{
  -[MKStackingViewController _setScrollEnabled:forcedUpdate:](self, "_setScrollEnabled:forcedUpdate:", a3, 0);
}

- (void)_setScrollEnabled:(BOOL)a3 forcedUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _MKStackingContentView *contentView;
  _MKStackView *stackView;
  UIScrollView *v8;
  void *v9;
  void *v10;
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
  _QWORD v23[5];

  v4 = a3;
  v23[4] = *MEMORY[0x1E0C80C00];
  if (a4 || self->_isScrollDisabled == a3)
  {
    self->_isScrollDisabled = !a3;
    -[MKStackingViewController _updateFixedHeightAwareControllers](self, "_updateFixedHeightAwareControllers");
    if (self->_stackView)
    {
      contentView = self->_contentView;
      if (contentView)
      {
        if (v4)
        {
          -[_MKStackingContentView setBottomView:](contentView, "setBottomView:", self->_scrollView);
          -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_stackView);
          v18 = (void *)MEMORY[0x1E0CB3718];
          stackView = self->_stackView;
          v8 = self->_scrollView;
          -[_MKStackView topAnchor](stackView, "topAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScrollView topAnchor](v8, "topAnchor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:", v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v20;
          -[_MKStackView leftAnchor](self->_stackView, "leftAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIScrollView leftAnchor](v8, "leftAnchor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "constraintEqualToAnchor:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v23[1] = v10;
          -[UIScrollView bottomAnchor](v8, "bottomAnchor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKStackView bottomAnchor](self->_stackView, "bottomAnchor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "constraintEqualToAnchor:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23[2] = v13;
          -[UIScrollView rightAnchor](v8, "rightAnchor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKStackView rightAnchor](self->_stackView, "rightAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "constraintEqualToAnchor:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23[3] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activateConstraints:", v17);

        }
        else
        {
          -[UIScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");
          -[_MKStackingContentView setBottomView:](self->_contentView, "setBottomView:", self->_stackView);
        }
      }
    }
  }
}

- (BOOL)isScrollEnabled
{
  return !self->_isScrollDisabled;
}

- (double)_fittingHeightForView:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = 0.0;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFC39D0))
  {
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v4 = v5;
  }

  return v4;
}

- (double)currentHeight
{
  double v2;

  -[_MKStackView frame](self->_stackView, "frame");
  return v2;
}

- (void)setWidthConstraintConstant:(double)a3
{
  void *v5;
  _MKStackView *v6;
  NSLayoutConstraint *stackViewWidthConstraint;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _MKStackView *v15;

  -[MKStackingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self->_stackView;
    stackViewWidthConstraint = self->_stackViewWidthConstraint;
    v15 = v6;
    if (stackViewWidthConstraint)
    {
      -[NSLayoutConstraint setConstant:](stackViewWidthConstraint, "setConstant:", a3);
    }
    else
    {
      -[_MKStackView widthAnchor](v6, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", a3);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v10 = self->_stackViewWidthConstraint;
      self->_stackViewWidthConstraint = v9;

    }
    -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", a3);
    -[NSLayoutConstraint setActive:](self->_stackViewWidthConstraint, "setActive:", 1);
    -[_MKStackingContentView bottomConstraint](self->_contentView, "bottomConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isActive");

    -[_MKStackingContentView bottomConstraint](self->_contentView, "bottomConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 0);

    -[UIView _mapkit_setNeedsLayout](v15, "_mapkit_setNeedsLayout");
    -[UIView _mapkit_layoutIfNeeded](v15, "_mapkit_layoutIfNeeded");
    -[_MKStackingContentView bottomConstraint](self->_contentView, "bottomConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", v12);

  }
}

- (void)_updateFixedHeightAwareControllers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
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
  v3 = self->_viewControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EDFDF780, (_QWORD)v10))
        {
          v9 = v8;
          objc_msgSend(v9, "setResizableViewsDisabled:", -[MKStackingViewController isScrollEnabled](self, "isScrollEnabled") ^ 1);

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)setViewControllers:(id)a3
{
  id v5;
  id *p_viewControllers;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_viewControllers = (id *)&self->_viewControllers;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_viewControllers) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v8 = v5;
    else
      v8 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*p_viewControllers)
      v10 = *p_viewControllers;
    else
      v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v12, "minusSet:", v11);
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v13, "minusSet:", v9);
    objc_storeStrong((id *)&self->_viewControllers, a3);
    -[MKStackingViewController _updateFixedHeightAwareControllers](self, "_updateFixedHeightAwareControllers");
    if (-[MKStackingViewController _isSafeToPerformLayout](self, "_isSafeToPerformLayout"))
    {
      -[MKStackingViewController _updateStackViewSubviewsAndChildVCsEntering:exiting:](self, "_updateStackViewSubviewsAndChildVCsEntering:exiting:", v12, v13);
    }
    else
    {
      self->_needsToPerformLayout = objc_msgSend(*p_viewControllers, "count") != 0;
      -[_MKStackView setStackedSubviews:](self->_stackView, "setStackedSubviews:", MEMORY[0x1E0C9AA60]);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v19, "willMoveToParentViewController:", 0, (_QWORD)v20);
            objc_msgSend(v19, "removeFromParentViewController");
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }

    }
  }

}

- (void)setStackingDelegate:(id)a3
{
  MKStackingViewControllerDelegate **p_stackingDelegate;
  id v5;
  id v6;

  p_stackingDelegate = &self->_stackingDelegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_stackingDelegate, v6);
  LOBYTE(p_stackingDelegate) = objc_opt_respondsToSelector();

  self->_mayWantSpearators = p_stackingDelegate & 1;
}

- (void)stackViewNeedsLayout:(id)a3
{
  void *v3;
  id v4;

  -[MKStackingViewController view](self, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_layoutIfNeeded");

}

- (void)_updateStackViewSubviewsAndChildVCsEntering:(id)a3 exiting:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  _MKStackView *stackView;
  void *v21;
  NSMapTable *viewsToViewControllers;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  UIView *overlayView;
  double v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t m;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t jj;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_needsToPerformLayout = 0;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_needToCallViewControllerLayoutDelegate = 1;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v57 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v83 != v12)
            objc_enumerationMutation(v9);
          -[MKStackingViewController addChildViewController:](self, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v11);
    }
    v55 = v9;
    v56 = v7;

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    -[MKStackingViewController viewControllers](self, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v79 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          stackView = self->_stackView;
          objc_msgSend(v19, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKStackView addSubview:](stackView, "addSubview:", v21);

          viewsToViewControllers = self->_viewsToViewControllers;
          objc_msgSend(v19, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](viewsToViewControllers, "setObject:forKey:", v19, v23);

          objc_msgSend(v19, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v24);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      }
      while (v16);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v7 = v56;
    v25 = v56;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v75 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "willMoveToParentViewController:", 0);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      }
      while (v27);
    }

    overlayView = self->_overlayView;
    if (overlayView)
    {
      -[UIView alpha](overlayView, "alpha");
      if (v31 != 0.0)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v32 = v8;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
        if (v33)
        {
          v34 = v33;
          v35 = 0;
          v36 = *(_QWORD *)v71;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v71 != v36)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * m), "setHidden:", v35 & 1);
              v35 = 1;
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
          }
          while (v34);
        }

      }
    }
    self->_isSettingStackedViews = 1;
    -[_MKStackView setStackedSubviews:](self->_stackView, "setStackedSubviews:", v8);
    self->_isSettingStackedViews = 0;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v38 = v55;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v67;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v67 != v41)
            objc_enumerationMutation(v38);
          -[MKStackingViewController _setUpEnteringViewController:](self, "_setUpEnteringViewController:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * n));
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
      }
      while (v40);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v43 = v25;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v63;
      do
      {
        for (ii = 0; ii != v45; ++ii)
        {
          if (*(_QWORD *)v63 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * ii);
          -[MKStackingViewController _tearDownExitingViewController:](self, "_tearDownExitingViewController:", v48);
          objc_msgSend(v48, "removeFromParentViewController");
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
      }
      while (v45);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    -[MKStackingViewController viewControllers](self, "viewControllers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v59;
      do
      {
        for (jj = 0; jj != v51; ++jj)
        {
          if (*(_QWORD *)v59 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * jj), "didMoveToParentViewController:", self);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
      }
      while (v51);
    }

    if (objc_msgSend(v38, "count") || objc_msgSend(v43, "count"))
    {
      -[MKStackingViewController view](self, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "_mapkit_setNeedsLayout");

    }
    v6 = v57;
  }

}

- (void)_callViewControllersLayoutDelegateIfNeeded
{
  void *v3;
  char v4;
  id v5;

  if (self->_needToCallViewControllerLayoutDelegate)
  {
    self->_needToCallViewControllerLayoutDelegate = 0;
    -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stackingViewControllerDidLayoutViewControllers:", self);

    }
  }
}

- (double)stackView:(id)a3 distanceBetweenUpperView:(id)a4 andLowerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  double v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0.0;
  if (self->_mayWantSpearators)
  {
    -[NSMapTable objectForKey:](self->_viewsToViewControllers, "objectForKey:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_viewsToViewControllers, "objectForKey:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 | v13)
    {
      v14 = (void *)v13;
      WeakRetained = objc_loadWeakRetained((id *)&self->_stackingDelegate);
      objc_msgSend(WeakRetained, "stackingViewController:heightForSeparatorBetweenUpperViewController:andLowerViewController:", self, v12, v14);
      v11 = v16;

    }
  }

  return v11;
}

- (void)_setUpEnteringViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isViewLoaded"))
  {
    objc_msgSend(v7, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "setScrollEnabled:", 0);
  }
  -[MKStackingViewController _addPreferredHeightConstraintForViewControllerIfNeeded:](self, "_addPreferredHeightConstraintForViewControllerIfNeeded:", v7);

}

- (void)setOverlayView:(id)a3 withOriginY:(double)a4
{
  UIView *v7;
  UIView **p_overlayView;
  UIView *overlayView;
  int v10;
  void *v11;
  UIView *v12;

  v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    v12 = v7;
    -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    self->_overlayViewOriginY = a4;
    v10 = -[MKStackingViewController isViewLoaded](self, "isViewLoaded");
    v7 = v12;
    if (v10)
    {
      if (*p_overlayView)
      {
        -[MKStackingViewController _setOverlayViewFrame](self, "_setOverlayViewFrame");
        -[MKStackingViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_mapkit_setNeedsUpdateConstraints");

        v7 = v12;
      }
    }
  }

}

- (void)removeOverlayViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_MKStackView stackedSubviews](self->_stackView, "stackedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v3)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isHidden"))
            v11 = 0.0;
          else
            v11 = 1.0;
          objc_msgSend(v10, "setAlpha:", v11);
        }
        objc_msgSend(v10, "setHidden:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke;
  v16[3] = &unk_1E20D82F8;
  v16[4] = self;
  v13 = MEMORY[0x18D778DB8](v16);
  v14 = (void *)v13;
  if (v3)
  {
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke_2;
    v15[3] = &unk_1E20D7D98;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_animateWithDuration:animations:completion:", v15, v13, 0.25);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
  }

}

void __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1072);
  *(_QWORD *)(v2 + 1072) = 0;

}

void __54__MKStackingViewController_removeOverlayViewAnimated___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAlpha:", 0.0);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "stackedSubviews", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", 1.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_setOverlayViewFrame
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
  double overlayViewOriginY;
  double Width;
  CGRect v14;
  CGRect v15;

  -[MKStackingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  overlayViewOriginY = self->_overlayViewOriginY;
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  Width = CGRectGetWidth(v14);
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, overlayViewOriginY, Width, CGRectGetHeight(v15) - self->_overlayViewOriginY);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  if (!self->_isSettingStackedViews)
  {
    v5 = v4;
    if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EE0799E0))
    {
LABEL_6:

      goto LABEL_7;
    }
    v6 = objc_msgSend(v5, "requiresPreferredContentSizeInStackingView");

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        objc_msgSend(v7, "preferredContentSize");
        -[MKStackingViewController _setPreferredHeight:forViewController:](self, "_setPreferredHeight:forViewController:", v7, v8);
        goto LABEL_6;
      }
    }
  }
LABEL_7:

}

- (void)_setPreferredHeight:(double)a3 forViewController:(id)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  MKStackingViewController *v12;
  double v13;

  -[NSMapTable objectForKey:](self->_viewControllersToPreferredHeightConstraints, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  if (v7 != a3)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CEABB0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__MKStackingViewController__setPreferredHeight_forViewController___block_invoke;
      v10[3] = &unk_1E20D8F50;
      v13 = a3;
      v11 = v6;
      v12 = self;
      objc_msgSend(v9, "_animateWithAttributes:animations:completion:", v8, v10, 0);

    }
    else
    {
      objc_msgSend(v6, "setConstant:", a3);
    }

  }
}

void __66__MKStackingViewController__setPreferredHeight_forViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setConstant:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)_addPreferredHeightConstraintForViewControllerIfNeeded:(id)a3
{
  void *v4;
  NSMapTable *v5;
  NSMapTable *viewControllersToPreferredHeightConstraints;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE0799E0)
    && objc_msgSend(v9, "requiresPreferredContentSizeInStackingView")
    && objc_msgSend(v9, "isViewLoaded"))
  {
    -[NSMapTable objectForKey:](self->_viewControllersToPreferredHeightConstraints, "objectForKey:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (!self->_viewControllersToPreferredHeightConstraints)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        viewControllersToPreferredHeightConstraints = self->_viewControllersToPreferredHeightConstraints;
        self->_viewControllersToPreferredHeightConstraints = v5;

      }
      objc_msgSend(v9, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", 0.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setActive:", 1);
      -[NSMapTable setObject:forKey:](self->_viewControllersToPreferredHeightConstraints, "setObject:forKey:", v4, v9);
    }

  }
}

- (void)_removePreferredHeightConstraintFromViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_viewControllersToPreferredHeightConstraints, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable removeObjectForKey:](self->_viewControllersToPreferredHeightConstraints, "removeObjectForKey:", v6);
    objc_msgSend(v6, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeConstraint:", v4);

  }
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  UIView *overlayView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  double v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!self->_contentViewConstraintsAdded)
  {
    self->_contentViewConstraintsAdded = 1;
    v3 = (void *)MEMORY[0x1E0CB3718];
    v23[0] = self->_widthConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activateConstraints:", v4);

  }
  overlayView = self->_overlayView;
  if (overlayView)
  {
    -[UIView superview](overlayView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStackingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[MKStackingViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_overlayView);

      -[MKStackingViewController _setOverlayViewFrame](self, "_setOverlayViewFrame");
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MKStackingViewController viewControllers](self, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EE0799E0) & 1) != 0)
        {
          v15 = objc_msgSend(v14, "requiresPreferredContentSizeInStackingView");

          if (v15 && objc_msgSend(v14, "isViewLoaded"))
          {
            objc_msgSend(v14, "preferredContentSize");
            -[MKStackingViewController _setPreferredHeight:forViewController:](self, "_setPreferredHeight:forViewController:", v14, v16);
          }
        }
        else
        {

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v17.receiver = self;
  v17.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController updateViewConstraints](&v17, sel_updateViewConstraints);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (self->_needsToPerformLayout && -[MKStackingViewController _isSafeToPerformLayout](self, "_isSafeToPerformLayout"))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[MKStackingViewController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKStackingViewController _updateStackViewSubviewsAndChildVCsEntering:exiting:](self, "_updateStackViewSubviewsAndChildVCsEntering:exiting:", v6, 0);

  }
  -[MKStackingViewController _updateViewControllerVisibilityAfterPositionChange](self, "_updateViewControllerVisibilityAfterPositionChange");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillLayoutSubviews
{
  double Width;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  ++self->_countOfCurrentLayoutInvocations;
  -[_MKStackingContentView frame](self->_contentView, "frame");
  Width = CGRectGetWidth(v9);
  v4 = 260.0;
  if (Width >= 260.0)
  {
    -[_MKStackingContentView frame](self->_contentView, "frame");
    v4 = CGRectGetWidth(v10);
  }
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v4);
  if (self->_needsToPerformLayout)
  {
    if (-[MKStackingViewController _isSafeToPerformLayout](self, "_isSafeToPerformLayout"))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      -[MKStackingViewController viewControllers](self, "viewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKStackingViewController _updateStackViewSubviewsAndChildVCsEntering:exiting:](self, "_updateStackViewSubviewsAndChildVCsEntering:exiting:", v7, 0);

    }
  }
}

- (void)viewDidLayoutSubviews
{
  unint64_t v3;
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKStackingViewController;
  -[MKStackingViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  v3 = self->_countOfCurrentLayoutInvocations - 1;
  self->_countOfCurrentLayoutInvocations = v3;
  if (self->_overlayView)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
    -[MKStackingViewController _setOverlayViewFrame](self, "_setOverlayViewFrame");
  -[MKStackingViewController _callViewControllersLayoutDelegateIfNeeded](self, "_callViewControllersLayoutDelegateIfNeeded");
  -[MKStackingViewController _sendScrollnotification](self, "_sendScrollnotification");
}

- (void)scrollViewDidScroll:(id)a3
{
  -[MKStackingViewController _didScroll](self, "_didScroll", a3);
  -[MKStackingViewController _sendScrollnotification](self, "_sendScrollnotification");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MKStackingViewController _updateViewControllerVisibilityAfterPositionChange](self, "_updateViewControllerVisibilityAfterPositionChange", a3);
  -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stackingViewControllerWillBeginScroll:", self);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v6 = a3;
  if (!a4)
  {
    v10 = v6;
    -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v10;
    if ((v8 & 1) != 0)
    {
      -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stackingViewControllerDidEndScroll:", self);

      v6 = v10;
    }
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MKStackingViewController stackingDelegate](self, "stackingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stackingViewControllerDidEndScroll:", self);

  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v8 = v5 - v7;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, v8, v6 - v9);
}

- (void)_sendScrollnotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MKStackingScrollNotification"), self->_scrollView);

}

- (void)_updateViewControllerVisibilityAfterPositionChange
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  NSHashTable *minimallyVisibleViews;
  void *v18;
  NSHashTable *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[MKStackingViewController viewControllers](self, "viewControllers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stackingViewController:minimumVisibleSurfacePercentForAnalyticsSelection:", self, v11);
            v14 = v13;

            objc_msgSend(v11, "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[MKStackingViewController isViewVisbile:percentageTreshold:](self, "isViewVisbile:percentageTreshold:", v15, v14);

            minimallyVisibleViews = self->_minimallyVisibleViews;
            objc_msgSend(v11, "view");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(minimallyVisibleViews) = -[NSHashTable containsObject:](minimallyVisibleViews, "containsObject:", v18);

            if (v16 != (_DWORD)minimallyVisibleViews)
            {
              v19 = self->_minimallyVisibleViews;
              objc_msgSend(v11, "view");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                -[NSHashTable addObject:](v19, "addObject:", v20);

                -[MKStackingViewController stackingDelegate](self, "stackingDelegate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "stackingViewController:didShowMinimumVisibleSurfacePercentForAnalyticsSelection:", self, v11);
              }
              else
              {
                -[NSHashTable removeObject:](v19, "removeObject:", v20);
              }

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v8);
      }

    }
  }
}

- (BOOL)isViewVisbile:(id)a3 percentageTreshold:(double)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _MKStackingContentView *contentView;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double height;
  BOOL IsNull;
  double v22;
  double v23;
  BOOL v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v6 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___MKStackingViewController__scrollView[self->_isScrollDisabled]), "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  contentView = self->_contentView;
  objc_msgSend(v6, "bounds");
  -[_MKStackingContentView convertRect:fromView:](contentView, "convertRect:fromView:", v6);
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.height = v19;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  v27 = CGRectIntersection(v26, v28);
  height = v27.size.height;
  IsNull = CGRectIsNull(v27);
  v22 = 0.0;
  if (!IsNull)
  {
    objc_msgSend(v6, "bounds", 0.0);
    v22 = height / v23;
  }
  v24 = v22 >= a4;

  return v24;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (MKStackingViewControllerDelegate)stackingDelegate
{
  return (MKStackingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_stackingDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackingDelegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_minimallyVisibleViews, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
  objc_storeStrong((id *)&self->_viewsToViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllersToPreferredHeightConstraints, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
