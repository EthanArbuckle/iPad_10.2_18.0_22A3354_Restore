@implementation CCUIContentModuleContainerViewController

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (void)viewWillLayoutSubviews
{
  UIView *highlightWrapperView;
  CCUIContentModuleBackgroundView *backgroundView;
  CCUIContentModuleContentContainerView *contentContainerView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
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
  double v29;
  double v30;
  UIView *v31;
  UIView *editingBorderMaskView;
  CGAffineTransform *v33;
  UIView *v34;
  void *v35;
  UIView *editingBorderView;
  UIView *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewWillLayoutSubviews](&v47, sel_viewWillLayoutSubviews);
  if (-[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded"))
  {
    highlightWrapperView = self->_highlightWrapperView;
    -[CCUIContentModuleContainerViewController _backgroundFrameForExpandedState](self, "_backgroundFrameForExpandedState");
    -[UIView setFrame:](highlightWrapperView, "setFrame:");
    backgroundView = self->_backgroundView;
    -[CCUIContentModuleContainerViewController _backgroundFrameForExpandedState](self, "_backgroundFrameForExpandedState");
    -[CCUIContentModuleBackgroundView setFrame:](backgroundView, "setFrame:");
    contentContainerView = self->_contentContainerView;
    -[CCUIContentModuleContainerViewController _contentFrameForExpandedState](self, "_contentFrameForExpandedState");
    -[CCUIContentModuleContentContainerView setFrame:](contentContainerView, "setFrame:");
  }
  else
  {
    -[CCUIContentModuleContainerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v42 = v8;
    v43 = v7;
    v10 = v9;
    v12 = v11;
    v41 = v11;
    v44 = v9;
    if (self->_resizing)
    {
      v13 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v15 = 1.0;
      v16 = self->_minResizeDimensions.width == *MEMORY[0x1E0C9D820] && self->_minResizeDimensions.height == v14;
      v17 = 1.0;
      if (!v16)
      {
        if (BSFloatLessThanFloat())
          v17 = v10 / self->_minResizeDimensions.width;
        if (BSFloatLessThanFloat())
          v15 = v12 / self->_minResizeDimensions.height;
      }
      if (self->_maxResizeDimensions.width != v13 || self->_maxResizeDimensions.height != v14)
      {
        if (BSFloatGreaterThanFloat())
          v17 = v10 / self->_maxResizeDimensions.width;
        if (BSFloatGreaterThanFloat())
          v15 = v12 / self->_maxResizeDimensions.height;
      }
    }
    else
    {
      v15 = 1.0;
      v17 = 1.0;
    }
    BSRectWithSize();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v6, "center");
    v28 = v27;
    v30 = v29;
    -[UIView setBounds:](self->_highlightWrapperView, "setBounds:", v20, v22, v24, v26);
    -[UIView setCenter:](self->_highlightWrapperView, "setCenter:", v28, v30);
    -[UIView setBounds:](self->_editingBorderMaskView, "setBounds:", v20, v22, v24, v26);
    if (BSFloatEqualToFloat() && (BSFloatEqualToFloat() & 1) != 0)
    {
      v31 = self->_highlightWrapperView;
      v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v46.a = *MEMORY[0x1E0C9BAA8];
      v39 = *(_OWORD *)&v46.a;
      *(_OWORD *)&v46.c = v40;
      *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v38 = *(_OWORD *)&v46.tx;
      -[UIView setTransform:](v31, "setTransform:", &v46);
      editingBorderMaskView = self->_editingBorderMaskView;
      *(_OWORD *)&v46.a = v39;
      *(_OWORD *)&v46.c = v40;
      *(_OWORD *)&v46.tx = v38;
      v33 = &v46;
    }
    else
    {
      memset(&v46, 0, sizeof(v46));
      CGAffineTransformMakeScale(&v46, v17, v15);
      v34 = self->_highlightWrapperView;
      v45 = v46;
      -[UIView setTransform:](v34, "setTransform:", &v45);
      editingBorderMaskView = self->_editingBorderMaskView;
      v45 = v46;
      v33 = &v45;
    }
    -[UIView setTransform:](editingBorderMaskView, "setTransform:", v33);
    -[UIView setFrame:](self->_highlightWrapperView, "setFrame:", v20, v22, v24, v26);
    -[CCUIContentModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v20, v22, v24, v26);
    -[CCUIContentModuleContentContainerView setFrame:](self->_contentContainerView, "setFrame:", v20, v22, v24, v26);
    -[UIControl setFrame:](self->_touchBlockingView, "setFrame:", v20, v22, v24, v26);
    -[UIView setFrame:](self->_maskView, "setFrame:", v43, v42, v44, v41);
    objc_msgSend((id)objc_opt_class(), "editingSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pulsingBorderWidth");

    objc_msgSend(v6, "_shouldReverseLayoutDirection");
    UIRectInset();
    -[UIView setFrame:](self->_editingBorderContainerView, "setFrame:");
    editingBorderView = self->_editingBorderView;
    -[UIView bounds](self->_editingBorderContainerView, "bounds");
    -[UIView setFrame:](editingBorderView, "setFrame:");
    v37 = self->_editingBorderMaskView;
    -[UIView convertPoint:fromView:](self->_editingBorderView, "convertPoint:fromView:", v6, v28, v30);
    -[UIView setCenter:](v37, "setCenter:");

  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)_addTopLevelGestureRecognizersFromViewAndSubviews:(id)a3 toBlockingGestureRecognizers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "topLevelBlockingGestureRecognizers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "subviews", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CCUIContentModuleContainerViewController _addTopLevelGestureRecognizersFromViewAndSubviews:toBlockingGestureRecognizers:](self, "_addTopLevelGestureRecognizersFromViewAndSubviews:toBlockingGestureRecognizers:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (void)_loadContentViewController:(id)a3
{
  CCUIContentModuleContentViewController *v5;
  CCUIContentModuleContentViewController *contentViewController;
  CCUIContentModuleContentViewController *v7;
  CCUIContentModuleContentViewController *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModule contentViewController](self->_contentModule, "contentViewController");
    v5 = (CCUIContentModuleContentViewController *)objc_claimAutoreleasedReturnValue();
    contentViewController = self->_contentViewController;
    self->_contentViewController = v5;

  }
  if (!self->_contentViewController)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CCUIContentModule contentViewControllerForContext:](self->_contentModule, "contentViewControllerForContext:", v10);
      v7 = (CCUIContentModuleContentViewController *)objc_claimAutoreleasedReturnValue();
      v8 = self->_contentViewController;
      self->_contentViewController = v7;

    }
    if (!self->_contentViewController)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIContentModuleContainerViewController.m"), 173, CFSTR("No valid CCUIContentModuleContentViewController was found: %@"), self->_moduleIdentifier);

    }
  }

}

- (void)_loadBackgroundViewController:(id)a3
{
  CCUIContentModuleBackgroundViewController *v4;
  CCUIContentModuleBackgroundViewController *backgroundViewController;
  CCUIContentModuleBackgroundViewController *v6;
  CCUIContentModuleBackgroundViewController *v7;
  id v8;

  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModule backgroundViewController](self->_contentModule, "backgroundViewController");
    v4 = (CCUIContentModuleBackgroundViewController *)objc_claimAutoreleasedReturnValue();
    backgroundViewController = self->_backgroundViewController;
    self->_backgroundViewController = v4;

  }
  if (!self->_backgroundViewController && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModule backgroundViewControllerForContext:](self->_contentModule, "backgroundViewControllerForContext:", v8);
    v6 = (CCUIContentModuleBackgroundViewController *)objc_claimAutoreleasedReturnValue();
    v7 = self->_backgroundViewController;
    self->_backgroundViewController = v6;

  }
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  UIView *v7;
  UIView *highlightWrapperView;
  UIView *v9;
  void *v10;
  CCUIContentModuleBackgroundView *v11;
  CCUIContentModuleBackgroundView *backgroundView;
  CCUIContentModuleBackgroundView *v13;
  CCUIContentModuleContentContainerView *v14;
  CCUIContentModuleContentContainerView *contentContainerView;
  CCUIContentModuleContentContainerView *v16;
  CCUIContentModuleContentContainerView *v17;
  CCUIContentModuleContentContainerView *v18;
  UIView *v19;
  UIView *contentView;
  UIView *v21;
  _UIClickPresentationInteraction *v22;
  _UIClickPresentationInteraction *clickPresentationInteraction;
  void *v24;
  void *v25;
  void *v26;
  UITapGestureRecognizer *v27;
  UITapGestureRecognizer *expandModuleOnTouchTapRecognizer;
  void *v29;
  id v30;

  v30 = objc_alloc_init(MEMORY[0x1E0D147D8]);
  -[CCUIContentModuleContainerViewController setView:](self, "setView:");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
    objc_msgSend(v30, "addInteraction:", v5);

  }
  v6 = objc_alloc(MEMORY[0x1E0D147D8]);
  objc_msgSend(v30, "bounds");
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  highlightWrapperView = self->_highlightWrapperView;
  self->_highlightWrapperView = v7;

  -[UIView _setLayoutDebuggingIdentifier:](self->_highlightWrapperView, "_setLayoutDebuggingIdentifier:", CFSTR("HighlightWrapperView"));
  -[UIView setAutoresizingMask:](self->_highlightWrapperView, "setAutoresizingMask:", 18);
  v9 = self->_highlightWrapperView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  objc_msgSend(v30, "addSubview:", self->_highlightWrapperView);
  v11 = objc_alloc_init(CCUIContentModuleBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;

  -[CCUIContentModuleBackgroundView setAutoresizesSubviews:](self->_backgroundView, "setAutoresizesSubviews:", 0);
  v13 = self->_backgroundView;
  objc_msgSend(v30, "bounds");
  -[CCUIContentModuleBackgroundView setFrame:](v13, "setFrame:");
  -[UIView addSubview:](self->_highlightWrapperView, "addSubview:", self->_backgroundView);
  v14 = objc_alloc_init(CCUIContentModuleContentContainerView);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v14;

  v16 = self->_contentContainerView;
  -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
  -[CCUIContentModuleContentContainerView setCompactContinuousCornerRadius:](v16, "setCompactContinuousCornerRadius:");
  v17 = self->_contentContainerView;
  -[CCUIContentModuleContainerViewController _continuousCornerRadiusForExpandedState](self, "_continuousCornerRadiusForExpandedState");
  -[CCUIContentModuleContentContainerView setExpandedContinuousCornerRadius:](v17, "setExpandedContinuousCornerRadius:");
  -[CCUIContentModuleContentContainerView setModuleProvidesOwnPlatter:](self->_contentContainerView, "setModuleProvidesOwnPlatter:", self->_contentModuleProvidesOwnPlatter);
  v18 = self->_contentContainerView;
  objc_msgSend(v30, "bounds");
  -[CCUIContentModuleContentContainerView setFrame:](v18, "setFrame:");
  -[UIView addSubview:](self->_highlightWrapperView, "addSubview:", self->_contentContainerView);
  -[CCUIContentModuleContentViewController view](self->_contentViewController, "view");
  v19 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v19;

  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  v21 = self->_contentView;
  -[CCUIContentModuleContentContainerView bounds](self->_contentContainerView, "bounds");
  -[UIView setFrame:](v21, "setFrame:");
  -[CCUIContentModuleContentContainerView addSubview:](self->_contentContainerView, "addSubview:", self->_contentView);
  -[CCUIContentModuleContainerViewController _findTopLevelGestureRecognizersForView:installOnView:](self, "_findTopLevelGestureRecognizersForView:installOnView:", self->_contentView, self->_contentView);
  v22 = (_UIClickPresentationInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4088]), "initWithDelegate:", self);
  clickPresentationInteraction = self->_clickPresentationInteraction;
  self->_clickPresentationInteraction = v22;

  -[_UIClickPresentationInteraction setAllowSimultaneousRecognition:](self->_clickPresentationInteraction, "setAllowSimultaneousRecognition:", 1);
  -[CCUIContentModuleContainerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addInteraction:", self->_clickPresentationInteraction);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
  -[CCUIContentModuleBackgroundView addGestureRecognizer:](self->_backgroundView, "addGestureRecognizer:", v25);
  -[CCUIContentModuleContainerViewController setTapRecognizer:](self, "setTapRecognizer:", v25);
  -[CCUIContentModuleContainerViewController contentViewController](self, "contentViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleExpandModuleForTapGestureRecognizer_);
    expandModuleOnTouchTapRecognizer = self->_expandModuleOnTouchTapRecognizer;
    self->_expandModuleOnTouchTapRecognizer = v27;

    -[CCUIContentModuleContainerViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addGestureRecognizer:", self->_expandModuleOnTouchTapRecognizer);

    -[UITapGestureRecognizer setDelegate:](self->_expandModuleOnTouchTapRecognizer, "setDelegate:", self);
  }
  -[CCUIContentModuleContainerViewController _configureTouchPassThrough](self, "_configureTouchPassThrough");

}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (void)_findTopLevelGestureRecognizersForView:(id)a3 installOnView:(id)a4
{
  objc_class *v5;
  id v6;
  NSArray *v7;
  NSArray *topLevelBlockingGestureRecognizers;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v9 = objc_alloc_init(v5);
  -[CCUIContentModuleContainerViewController _addTopLevelGestureRecognizersFromViewAndSubviews:toBlockingGestureRecognizers:](self, "_addTopLevelGestureRecognizersFromViewAndSubviews:toBlockingGestureRecognizers:", v6, v9);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  topLevelBlockingGestureRecognizers = self->_topLevelBlockingGestureRecognizers;
  self->_topLevelBlockingGestureRecognizers = v7;

}

- (double)_continuousCornerRadiusForExpandedState
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CCUIContentModuleContentViewController preferredExpandedContinuousCornerRadius](self->_contentViewController, "preferredExpandedContinuousCornerRadius");
  else
    CCUIExpandedModuleContinuousCornerRadius();
  return result;
}

- (NSArray)topLevelBlockingGestureRecognizers
{
  return self->_topLevelBlockingGestureRecognizers;
}

- (CCUIContentModuleContainerViewController)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4 contentModule:(id)a5 presentationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CCUIContentModuleContainerViewController *v14;
  uint64_t v15;
  NSString *moduleIdentifier;
  uint64_t v17;
  NSUUID *uniqueIdentifier;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  CCUIContentModuleContentViewController *contentViewController;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CCUIContentModuleContainerViewController;
  v14 = -[CCUIContentModuleContainerViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    moduleIdentifier = v14->_moduleIdentifier;
    v14->_moduleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    uniqueIdentifier = v14->_uniqueIdentifier;
    v14->_uniqueIdentifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v14->_contentModule, a5);
    CCUICompactModuleContinuousCornerRadius();
    SBIconImageInfoMake();
    v14->_iconImageInfo.size.width = v19;
    v14->_iconImageInfo.size.height = v20;
    v14->_iconImageInfo.scale = v21;
    v14->_iconImageInfo.continuousCornerRadius = v22;
    -[CCUIContentModuleContainerViewController _loadContentViewController:](v14, "_loadContentViewController:", v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      contentViewController = v14->_contentViewController;
      -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](v14, "_continuousCornerRadiusForCompactState");
      -[CCUIContentModuleContentViewController setCompactContinuousCornerRadius:](contentViewController, "setCompactContinuousCornerRadius:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[CCUIContentModule expandsGridSizeClassesForAccessibility](v14->_contentModule, "expandsGridSizeClassesForAccessibility")&& (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CCUIContentModuleContentViewController setSupportsAccessibilityContentSizeCategories:](v14->_contentViewController, "setSupportsAccessibilityContentSizeCategories:", 1);
    }
    -[CCUIContentModuleContainerViewController addChildViewController:](v14, "addChildViewController:", v14->_contentViewController);
    -[CCUIContentModuleContentViewController didMoveToParentViewController:](v14->_contentViewController, "didMoveToParentViewController:", v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14->_contentModuleProvidesOwnPlatter = -[CCUIContentModuleContentViewController providesOwnPlatter](v14->_contentViewController, "providesOwnPlatter");
    -[CCUIContentModuleContainerViewController _configureContentViewControllerEditingAnimated:](v14, "_configureContentViewControllerEditingAnimated:", 0);
    -[CCUIContentModuleContainerViewController _loadBackgroundViewController:](v14, "_loadBackgroundViewController:", v13);
  }

  return v14;
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController dismissViewControllerWithTransition:completion:](&v6, sel_dismissViewControllerWithTransition_completion_, *(_QWORD *)&a3, a4);
  if (!a3)
    -[CCUIContentModuleContentContainerView setAlpha:](self->_contentContainerView, "setAlpha:", 1.0);
}

- (void)transitionToExpandedMode:(BOOL)a3
{
  CCUIContentModuleContentContainerView *contentContainerView;
  CCUIContentModuleContentContainerView *v5;
  _QWORD v6[5];

  if (a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__CCUIContentModuleContainerViewController_transitionToExpandedMode___block_invoke;
    v6[3] = &unk_1E8CFC3D0;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
    -[CCUIContentModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
    -[CCUIContentModuleBackgroundView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 1);
    -[CCUIContentModuleContainerViewController _contentFrameForExpandedState](self, "_contentFrameForExpandedState");
    -[CCUIContentModuleContentContainerView setFrame:](self->_contentContainerView, "setFrame:");
    contentContainerView = self->_contentContainerView;
    -[CCUIContentModuleContainerViewController _continuousCornerRadiusForExpandedState](self, "_continuousCornerRadiusForExpandedState");
    -[CCUIContentModuleContentContainerView setExpandedContinuousCornerRadius:](contentContainerView, "setExpandedContinuousCornerRadius:");
    -[CCUIContentModuleContentContainerView transitionToExpandedMode:](self->_contentContainerView, "transitionToExpandedMode:", 1);
  }
  else
  {
    -[CCUIContentModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
    -[CCUIContentModuleBackgroundView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
    v5 = self->_contentContainerView;
    -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
    -[CCUIContentModuleContentContainerView setCompactContinuousCornerRadius:](v5, "setCompactContinuousCornerRadius:");
    -[CCUIContentModuleContentContainerView transitionToExpandedMode:](self->_contentContainerView, "transitionToExpandedMode:", 0);
    -[CCUIContentModuleBackgroundViewController beginAppearanceTransition:animated:](self->_backgroundViewController, "beginAppearanceTransition:animated:", 0, 1);
  }
  -[CCUIContentModuleContainerViewController _configureTouchPassThrough](self, "_configureTouchPassThrough");
}

void __69__CCUIContentModuleContainerViewController_transitionToExpandedMode___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundFrameForExpandedState");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setFrame:", v3, v5, v7, v9);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  if (v11)
  {
    objc_msgSend(v11, "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "didMoveToParentViewController:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_presentationFrameForExpandedState");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "addSubview:", v12);

  }
}

- (void)redirectTapsWithAction:(id)a3
{
  UIAction *v5;
  UIAction *v6;

  v5 = (UIAction *)a3;
  if (self->_redirectedTapAction != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_redirectedTapAction, a3);
    -[CCUIContentModuleContainerViewController _configureTouchBlockingIfNecessary](self, "_configureTouchBlockingIfNecessary");
    v5 = v6;
  }

}

- (CCUIContentModuleContainerViewController)init
{
  -[CCUIContentModuleContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CCUIContentModuleContainerViewController)initWithCoder:(id)a3
{
  -[CCUIContentModuleContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CCUIContentModuleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[CCUIContentModuleContainerViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CCUIContentModuleContentViewController setContentRenderingMode:](self->_contentViewController, "setContentRenderingMode:", a3);
}

- (void)setContentMetrics:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CCUIContentModuleContentViewController setContentMetrics:](self->_contentViewController, "setContentMetrics:", v4);

}

- (void)setGridSizeClass:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController setGridSizeClass:](self->_contentViewController, "setGridSizeClass:", a3);
    -[CCUIContentModuleContainerViewController _configureTouchPassThrough](self, "_configureTouchPassThrough");
  }
}

- (void)setResizing:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (self->_resizing != a3)
  {
    self->_resizing = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CCUIContentModuleContentViewController setResizing:](self->_contentViewController, "setResizing:", v3);
    -[CCUIContentModuleContainerViewController _ensureAndConfigureEditingBorderView](self, "_ensureAndConfigureEditingBorderView");
  }
  -[CCUIContentModuleContentContainerView setClipsToBounds:](self->_contentContainerView, "setClipsToBounds:", v3);
}

- (void)expandModule
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_transitioning)
  {
    -[CCUIContentModuleContainerViewController moduleIdentifier](self, "moduleIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Home.ControlCenter")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Home.ControlCenterSingleTile")))
    {
      -[CCUIContentModuleContainerViewController clickPresentationInteraction](self, "clickPresentationInteraction");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cancelInteraction");

    }
    -[CCUIContentModuleContainerViewController clickPresentationInteraction](self, "clickPresentationInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "present");

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__CCUIContentModuleContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v4[3] = &unk_1E8CFC3D0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 0.3);
}

uint64_t __98__CCUIContentModuleContainerViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[134];
  objc_msgSend(v2, "_contentFrameForExpandedState");
  objc_msgSend(v3, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "layoutIfNeeded");
}

- (void)dismissExpandedModuleAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__CCUIContentModuleContainerViewController_dismissExpandedModuleAnimated___block_invoke;
  v3[3] = &unk_1E8CFD180;
  v3[4] = self;
  v4 = a3;
  -[CCUIContentModuleContainerViewController dismissModulePresentedContentAnimated:completion:](self, "dismissModulePresentedContentAnimated:completion:", a3, v3);
}

uint64_t __74__CCUIContentModuleContainerViewController_dismissExpandedModuleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeExpandedModule:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dismissPresentedContentAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__CCUIContentModuleContainerViewController_dismissPresentedContentAnimated___block_invoke;
  v3[3] = &unk_1E8CFD180;
  v3[4] = self;
  v4 = a3;
  -[CCUIContentModuleContainerViewController dismissModulePresentedContentAnimated:completion:](self, "dismissModulePresentedContentAnimated:completion:", a3, v3);
}

uint64_t __76__CCUIContentModuleContainerViewController_dismissPresentedContentAnimated___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_closeExpandedModule:", *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)dismissModulePresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  CCUIContentModuleContentViewController *contentViewController;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CCUIContentModuleContentViewController canDismissPresentedContent](self->_contentViewController, "canDismissPresentedContent")&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    contentViewController = self->_contentViewController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__CCUIContentModuleContainerViewController_dismissModulePresentedContentAnimated_completion___block_invoke;
    v8[3] = &unk_1E8CFC738;
    v9 = v6;
    -[CCUIContentModuleContentViewController dismissPresentedContentAnimated:completion:](contentViewController, "dismissPresentedContentAnimated:completion:", v4, v8);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __93__CCUIContentModuleContainerViewController_dismissModulePresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_closeExpandedModule:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (-[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__CCUIContentModuleContainerViewController__closeExpandedModule___block_invoke;
    v5[3] = &unk_1E8CFD180;
    v5[4] = self;
    v6 = v3;
    -[CCUIContentModuleContainerViewController dismissModulePresentedContentAnimated:completion:](self, "dismissModulePresentedContentAnimated:completion:", v3, v5);
  }
}

uint64_t __65__CCUIContentModuleContainerViewController__closeExpandedModule___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);
}

- (CCUIContentModuleContentContainerView)moduleContentView
{
  return self->_contentContainerView;
}

- (void)displayWillTurnOff
{
  if (-[CCUIContentModuleContainerViewController _appearState](self, "_appearState") == 2
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController displayWillTurnOff](self->_contentViewController, "displayWillTurnOff");
  }
}

- (void)willBecomeActive
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController willBecomeActive](self->_contentViewController, "willBecomeActive");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController controlCenterWillPresent](self->_contentViewController, "controlCenterWillPresent");
  }
}

- (void)willResignActive
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController willResignActive](self->_contentViewController, "willResignActive");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController controlCenterDidDismiss](self->_contentViewController, "controlCenterDidDismiss");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIContentModuleContainerViewController _configureForContentModuleGroupRenderingIfNecessary](self, "_configureForContentModuleGroupRenderingIfNecessary");
  -[CCUIContentModuleContainerViewController _configureContentViewControllerEditingAnimated:](self, "_configureContentViewControllerEditingAnimated:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  if (-[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded"))
  {
    -[CCUIContentModuleContainerViewController _closeExpandedModule:](self, "_closeExpandedModule:", v3);
  }
  else
  {
    -[CCUIContentModuleContainerViewController clickPresentationInteraction](self, "clickPresentationInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelInteraction");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentModuleContainerViewController:didFinishInteractionWithModule:", self, self->_contentModule);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIContentModuleContainerViewController _configureTouchBlockingIfNecessary](self, "_configureTouchBlockingIfNecessary");
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return !self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  int v4;
  id v5;
  int v6;
  id WeakRetained;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v4 = -[CCUIContentModuleContentViewController shouldPerformClickInteraction](self->_contentViewController, "shouldPerformClickInteraction")) != 0)
  {
    if (-[CCUIContentModuleContainerViewController _isEffectivelyExpanded](self, "_isEffectivelyExpanded")
      || (v5 = objc_loadWeakRetained((id *)&self->_delegate),
          v6 = objc_msgSend(v5, "contentModuleContainerViewController:canBeginInteractionWithModule:", self, self->_contentModule), v5, !v6))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "contentModuleContainerViewController:didBeginInteractionWithModule:", self, self->_contentModule);

      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  BOOL v5;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD block[5];
  id v12;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[CCUIContentModuleContentViewController shouldBeginTransitionToExpandedContentModule](self->_contentViewController, "shouldBeginTransitionToExpandedContentModule"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentModuleContainerViewController:didFinishInteractionWithModule:", self, self->_contentModule);

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CCUIContentModuleContentViewController shouldRequestAuthenticationForTransitionToExpandedContent](self->_contentViewController, "shouldRequestAuthenticationForTransitionToExpandedContent")&& !self->_authenticatedForExpandedModulePresentation&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke;
    block[3] = &unk_1E8CFC540;
    block[4] = self;
    v12 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_10:
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_3;
    v8[3] = &unk_1E8CFCB48;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    v5 = 0;
    goto LABEL_11;
  }
  v5 = 1;
  self->_transitioning = 1;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
LABEL_11:

  return v5;
}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 1016);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_2;
  v4[3] = &unk_1E8CFD1A8;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "requestAuthenticationForTransitionToExpandedContentModuleWithCompletionHandler:", v4);

}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 975) = a2;
  v3 = *(void **)(a1 + 40);
  if (a2)
  {
    objc_msgSend(v3, "present");
  }
  else
  {
    objc_msgSend(v3, "cancelInteraction");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1024));
    objc_msgSend(WeakRetained, "contentModuleContainerViewController:didFinishInteractionWithModule:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));

  }
}

void __86__CCUIContentModuleContainerViewController_clickPresentationInteractionShouldPresent___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clickPresentationInteraction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelInteraction");

}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id WeakRetained;
  CCUIContentModuleContainerPresentationController *presentationController;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contentModuleContainerViewController:didFinishInteractionWithModule:", self, self->_contentModule);

  presentationController = self->_presentationController;
  self->_presentationController = 0;

  self->_authenticatedForExpandedModulePresentation = 0;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x1E0DC3D90]);
  -[CCUIContentModuleContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithView:", v6);

  return v7;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  CCUIContentModuleContainerPresentationController *v5;
  CCUIContentModuleContainerPresentationController *presentationController;
  void *v7;
  void *v8;
  CCUIContentModuleContainerReducedMotionTransition *v9;
  CCUIContentModuleContainerReducedMotionTransition *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __objc2_class *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[CCUIContentModuleContentViewController shouldFinishTransitionToExpandedContentModule](self->_contentViewController, "shouldFinishTransitionToExpandedContentModule"))
  {
    return 0;
  }
  v5 = -[CCUIContentModuleContainerPresentationController initWithPresentedViewController:presentingViewController:]([CCUIContentModuleContainerPresentationController alloc], "initWithPresentedViewController:presentingViewController:", self, self);
  presentationController = self->_presentationController;
  self->_presentationController = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4080]), "initWithPresentedViewController:presentationController:", self, self->_presentationController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController viewForTouchContinuation](self->_contentViewController, "viewForTouchContinuation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, "setCustomViewForTouchContinuation:", v8);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v9 = objc_alloc_init(CCUIContentModuleContainerReducedMotionTransition);
    v10 = objc_alloc_init(CCUIContentModuleContainerReducedMotionTransition);
    -[CCUIContentModuleContainerViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CCUIContentModuleContainerReducedMotionTransition setSnapshotHostWindow:](v9, "setSnapshotHostWindow:", v12);
    -[CCUIContentModuleContainerReducedMotionTransition setSnapshotHostWindow:](v10, "setSnapshotHostWindow:", v12);
    -[CCUIContentModuleContainerViewController bs_presentationContextDefiningViewController](self, "bs_presentationContextDefiningViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interfaceOrientation");

    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
    CCUIAffineTransformBetweenInterfaceOrientations();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CCUIContentModuleContainerReducedMotionTransition setSnapshotCorrectiveTransform:](v9, "setSnapshotCorrectiveTransform:", &v20);
    v20 = v23;
    v21 = v24;
    v22 = v25;
    -[CCUIContentModuleContainerReducedMotionTransition setSnapshotCorrectiveTransform:](v10, "setSnapshotCorrectiveTransform:", &v20);

  }
  else
  {
    -[CCUIContentModuleContainerViewController contentViewController](self, "contentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v9 = objc_alloc_init(CCUIContentModuleContainerClientDrivenTransition);
      v18 = CCUIContentModuleContainerClientDrivenTransition;
    }
    else
    {
      v9 = objc_alloc_init(CCUIContentModuleContainerTransition);
      v18 = CCUIContentModuleContainerTransition;
    }
    v10 = (CCUIContentModuleContainerReducedMotionTransition *)objc_alloc_init(v18);
  }
  -[CCUIContentModuleContainerTransition setViewController:](v9, "setViewController:", self);
  -[CCUIContentModuleContainerTransition setAppearanceTransition:](v9, "setAppearanceTransition:", 1);
  -[CCUIContentModuleContainerViewController _contentFrameForRestState](self, "_contentFrameForRestState");
  -[CCUIContentModuleContainerTransition setContentRestOverrideFrame:](v9, "setContentRestOverrideFrame:");
  objc_msgSend(v7, "setAppearanceTransition:", v9);
  -[CCUIContentModuleContainerTransition setViewController:](v10, "setViewController:", self);
  -[CCUIContentModuleContainerTransition setAppearanceTransition:](v10, "setAppearanceTransition:", 0);
  objc_msgSend(v7, "setDisappearanceTransition:", v10);

  return v7;
}

- (BOOL)definesContentModuleContainer
{
  return 1;
}

- (void)willPresentViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIContentModuleContainerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContainerViewController:willPresentViewController:", self, v4);

}

- (void)willDismissViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIContentModuleContainerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContainerViewController:willDismissViewController:", self, v4);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  CGRect v29;
  CGRect v30;

  v6 = a5;
  -[CCUIContentModuleContainerViewController contentViewController](self, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") != 1)
  {
    v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "shouldPerformHoverInteraction");

    if ((v9 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

  }
  if (!-[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v6, "rect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    CCUILayoutGutter();
    v20 = -v19;
    CCUILayoutGutter();
    v22 = -v21;
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v16;
    v29.size.height = v18;
    v30 = CGRectInset(v29, v20, v22);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    v27 = (void *)MEMORY[0x1E0DC3B28];
    -[CCUIContentModuleContainerViewController moduleIdentifier](self, "moduleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "regionWithRect:identifier:", v8, x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_8:
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  int v6;
  id v7;
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
  void *v22;
  void *v23;
  NSObject *v24;

  -[CCUIContentModuleContainerViewController view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isInAWindow");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3D90]);
    -[CCUIContentModuleContainerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithView:", v8);

    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3B30];
    -[CCUIContentModuleContainerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
    objc_msgSend(v11, "shapeWithRoundedRect:cornerRadius:", v14, v16, v18, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v10, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = *MEMORY[0x1E0D146A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_ERROR))
      -[CCUIContentModuleContainerViewController pointerInteraction:styleForRegion:].cold.1(v24);
    v23 = 0;
  }
  return v23;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[CCUIContentModuleContainerViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCUIContentModuleContainerViewController _isEffectivelyExpanded](self, "_isEffectivelyExpanded")
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "shouldExpandModuleOnTouch:", v5);
  }

  return v7;
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CCUIContentModuleContainerViewController iconImageInfo](self, "iconImageInfo");
  BSRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)continuousCornerRadius
{
  double v2;

  -[CCUIContentModuleContainerViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if ((SBIconImageInfoEqualToIconImageInfo() & 1) == 0)
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[CCUIContentModuleContainerViewController _updateDisplayedCompactContinuousCornerRadius](self, "_updateDisplayedCompactContinuousCornerRadius");
  }
}

- (void)setEditing:(BOOL)a3
{
  -[CCUIContentModuleContainerViewController setEditing:animated:](self, "setEditing:animated:", a3, 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleContainerViewController;
  -[CCUIContentModuleContainerViewController setEditing:animated:](&v7, sel_setEditing_animated_);
  if (self->_editing != v5)
  {
    self->_editing = v5;
    -[CCUIContentModuleContainerViewController _configureTouchBlockingIfNecessary](self, "_configureTouchBlockingIfNecessary");
    -[CCUIContentModuleContainerViewController _configureEditingAnimated:](self, "_configureEditingAnimated:", v4);
  }
}

- (void)setJittering:(BOOL)a3
{
  if (self->_jittering != a3)
  {
    self->_jittering = a3;
    -[CCUIContentModuleContainerViewController _configureJittering](self, "_configureJittering");
  }
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  uint64_t v5;

  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (a3 == 2)
        v5 = 1;
      else
        v5 = 2 * (a3 == 3);
      -[CCUIContentModuleContentViewController setUserVisibilityStatus:](self->_contentViewController, "setUserVisibilityStatus:", v5);
    }
  }
}

+ (void)resetEditingBorderPulseAnimationStartTime
{
  __editingBorderPulseAnimationStartTime = CACurrentMediaTime();
}

+ (double)editingBorderPulseAnimationStartTime
{
  return *(double *)&__editingBorderPulseAnimationStartTime;
}

+ (id)editingSettings
{
  if (editingSettings_onceToken != -1)
    dispatch_once(&editingSettings_onceToken, &__block_literal_global_11);
  return (id)editingSettings___editingSettings;
}

void __59__CCUIContentModuleContainerViewController_editingSettings__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[CCUIControlCenterDomain rootSettings](CCUIControlCenterDomain, "rootSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editingSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)editingSettings___editingSettings;
  editingSettings___editingSettings = v0;

}

- (BOOL)_isForceTouchAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability") == 2;

  return v4;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  if (-[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded")
    && (!v7 || objc_msgSend(v7, "state") == 3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "contentModuleContainerViewControllerDismissPresentedContent:", self);

    }
  }

}

- (void)_handleExpandModuleForTapGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CCUIContentModuleContainerViewController _isEffectivelyExpanded](self, "_isEffectivelyExpanded")
    && objc_msgSend(v4, "state") == 3)
  {
    -[CCUIContentModuleContainerViewController expandModule](self, "expandModule");
  }

}

- (void)_configureTouchBlockingIfNecessary
{
  id v3;
  void *v4;
  UIControl *v5;
  UIControl *touchBlockingView;
  UIControl *v7;
  void *v8;
  uint64_t v9;
  UIControl *v10;
  UIControl *v11;

  if (-[CCUIContentModuleContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_redirectedTapAction || -[CCUIContentModuleContainerViewController isEditing](self, "isEditing"))
    {
      if (!self->_touchBlockingView)
      {
        v3 = objc_alloc(MEMORY[0x1E0D14760]);
        -[CCUIContentModuleContainerViewController view](self, "view");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bounds");
        v5 = (UIControl *)objc_msgSend(v3, "initWithFrame:");
        touchBlockingView = self->_touchBlockingView;
        self->_touchBlockingView = v5;

        -[UIControl addTarget:action:forControlEvents:](self->_touchBlockingView, "addTarget:action:forControlEvents:", self, sel__handleBlockedTap_, 64);
        v7 = self->_touchBlockingView;
        -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
        -[UIControl _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:");
        -[UIControl layer](self->_touchBlockingView, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

        -[UIView addSubview:](self->_highlightWrapperView, "addSubview:", self->_touchBlockingView);
      }
      v9 = 0;
    }
    else
    {
      v10 = self->_touchBlockingView;
      if (v10)
      {
        -[UIControl removeFromSuperview](v10, "removeFromSuperview");
        v11 = self->_touchBlockingView;
        self->_touchBlockingView = 0;

      }
      v9 = 1;
    }
    -[UITapGestureRecognizer setEnabled:](self->_expandModuleOnTouchTapRecognizer, "setEnabled:", v9);
  }
}

- (void)_handleBlockedTap:(id)a3
{
  -[UIAction performWithSender:target:](self->_redirectedTapAction, "performWithSender:target:", 0, 0);
}

- (void)_ensureAndConfigureEditingBorderView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  UIView *editingBorderView;
  uint64_t v9;
  id v10;
  UIView *v11;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  _QWORD v20[8];
  _QWORD v21[9];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t v25;

  if (self->_editingBorderContainerView)
  {
    -[CCUIContentModuleContainerViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "editingSettings");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pulsingBorderWidth");
    v5 = v4;
    -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
    v7 = v6;
    editingBorderView = self->_editingBorderView;
    v9 = MEMORY[0x1E0C809B0];
    if (!editingBorderView)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[UIView bounds](self->_editingBorderContainerView, "bounds");
      v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
      v12 = self->_editingBorderView;
      self->_editingBorderView = v11;

      v13 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke;
      v22[3] = &unk_1E8CFD1F0;
      v24 = v7;
      v25 = v5;
      v22[4] = self;
      v23 = v19;
      objc_msgSend(v13, "performWithoutAnimation:", v22);
      -[CCUIContentModuleContainerViewController _configureJittering](self, "_configureJittering");

      editingBorderView = self->_editingBorderView;
    }
    -[UIView layer](editingBorderView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0DC3F10];
    if (self->_resizing)
    {
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_2;
      v21[3] = &unk_1E8CFD218;
      v21[4] = v14;
      v21[5] = self;
      v21[6] = v3;
      v17 = v21;
      v21[7] = v5;
      v21[8] = v7;
    }
    else
    {
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_3;
      v20[3] = &unk_1E8CFD240;
      v20[4] = v14;
      v20[5] = self;
      v20[7] = v5;
      v20[6] = v3;
      v17 = v20;
    }
    v18 = v3;
    objc_msgSend(v16, "performWithoutAnimation:", v17);

  }
}

void __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "_setContinuousCornerRadius:", *(double *)(a1 + 48) + *(double *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  objc_msgSend(*(id *)(a1 + 40), "pulsingBorderMinAlpha");
  objc_msgSend(v2, "setAlpha:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", v3);

}

uint64_t __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "setBorderWidth:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setBorderColor:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v2 + 1112))
  {
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", *(double *)(a1 + 56), *(double *)(a1 + 56), v3, v4);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1112);
    *(_QWORD *)(v6 + 1112) = v5;

    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1112);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "_setContinuousCornerRadius:", *(double *)(a1 + 64));
    v2 = *(_QWORD *)(a1 + 40);
  }
  v10 = *(void **)(v2 + 1104);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", v13);

  return objc_msgSend(*(id *)(a1 + 32), "setInvertsMask:", 1);
}

void __80__CCUIContentModuleContainerViewController__ensureAndConfigureEditingBorderView__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setMask:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInvertsMask:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1112);
  *(_QWORD *)(v2 + 1112) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "setBackgroundColor:", 0);
  v4 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v4, "setBorderWidth:", v5 + 1.0 / v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

}

- (void)_configureEditingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 editing;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *editingBorderContainerView;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  BOOL v31;

  v3 = a3;
  editing = self->_editing;
  objc_msgSend((id)objc_opt_class(), "editingSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pulsingBorderFadeDuration");
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (editing)
  {
    if (!self->_editingBorderContainerView)
    {
      -[CCUIContentModuleContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v6, "pulsingBorderWidth");
      UIRectInset();
      v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v12, v13, v14);
      editingBorderContainerView = self->_editingBorderContainerView;
      self->_editingBorderContainerView = v15;

      -[UIView layer](self->_editingBorderContainerView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupBlending:", 0);

      -[CCUIContentModuleContainerViewController _ensureAndConfigureEditingBorderView](self, "_ensureAndConfigureEditingBorderView");
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v29[0] = v9;
      v29[1] = 3221225472;
      v29[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke;
      v29[3] = &unk_1E8CFC7D0;
      v29[4] = self;
      v30 = v10;
      v31 = v3;
      v19 = v10;
      objc_msgSend(v18, "performWithoutAnimation:", v29);

    }
    if (v3)
    {
      v28[0] = v9;
      v28[1] = 3221225472;
      v28[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_2;
      v28[3] = &unk_1E8CFC3D0;
      v28[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v28, v8);
    }
    else
    {
      v27[0] = v9;
      v27[1] = 3221225472;
      v27[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_3;
      v27[3] = &unk_1E8CFC3D0;
      v27[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v27);
    }
  }
  else if (v3)
  {
    v20 = self->_editingBorderViewRemovalAnimationGeneration + 1;
    self->_editingBorderViewRemovalAnimationGeneration = v20;
    v25[5] = v20;
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_4;
    v26[3] = &unk_1E8CFC3D0;
    v26[4] = self;
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_5;
    v25[3] = &unk_1E8CFD268;
    v25[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v26, v25, v7);
  }
  else
  {
    -[CCUIContentModuleContainerViewController _removeEditingBorderView](self, "_removeEditingBorderView");
  }
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_6;
  v23[3] = &unk_1E8CFC3F8;
  v23[4] = self;
  v24 = v3;
  v21 = _Block_copy(v23);
  v22 = v21;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v21, v8);
  else
    (*((void (**)(void *))v21 + 2))(v21);

}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
  result = objc_msgSend(*(id *)(a1 + 40), "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAlpha:", 0.0);
  return result;
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAlpha:", 1.0);
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAlpha:", 1.0);
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setAlpha:", 0.0);
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 1120) == *(_QWORD *)(a1 + 40) && !*(_BYTE *)(result + 969))
  {
    if (*(_QWORD *)(result + 1104))
      return objc_msgSend((id)result, "_removeEditingBorderView");
  }
  return result;
}

uint64_t __70__CCUIContentModuleContainerViewController__configureEditingAnimated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureContentViewControllerEditingAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_configureJittering
{
  UIView *editingBorderView;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  editingBorderView = self->_editingBorderView;
  if (editingBorderView)
  {
    if (self->_jittering)
    {
      objc_msgSend((id)objc_opt_class(), "editingSettings");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "editingBorderPulseAnimationStartTime");
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBeginTime:", v5);
      objc_msgSend(v18, "pulsingBorderPulseDuration");
      objc_msgSend(v6, "setDuration:");
      objc_msgSend(v6, "setAutoreverses:", 1);
      LODWORD(v7) = 2139095039;
      objc_msgSend(v6, "setRepeatCount:", v7);
      LODWORD(v8) = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFromValue:", v9);

      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v18, "pulsingBorderMaxAlpha");
      v12 = v11;
      objc_msgSend(v18, "pulsingBorderMinAlpha");
      v14 = v12 - v13;
      *(float *)&v14 = v14;
      objc_msgSend(v10, "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setToValue:", v15);

      objc_msgSend(v6, "setAdditive:", 1);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTimingFunction:", v16);

      -[UIView layer](self->_editingBorderView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAnimation:forKey:", v6, CFSTR("CCUIContentModuleContainerEditingBorderPulseAnimationKey"));

    }
    else
    {
      -[UIView layer](editingBorderView, "layer");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeAnimationForKey:", CFSTR("CCUIContentModuleContainerEditingBorderPulseAnimationKey"));
    }

  }
}

- (void)_configureContentViewControllerEditingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 editing;
  CCUIContentModuleContentViewController *v5;

  v3 = a3;
  editing = self->_editing;
  v5 = self->_contentViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController setEditing:animated:](v5, "setEditing:animated:", editing, v3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIContentModuleContentViewController setEditing:](v5, "setEditing:", editing);
  }

}

- (void)_removeEditingBorderView
{
  UIView *editingBorderContainerView;
  UIView *editingBorderView;

  -[UIView removeFromSuperview](self->_editingBorderContainerView, "removeFromSuperview");
  editingBorderContainerView = self->_editingBorderContainerView;
  self->_editingBorderContainerView = 0;

  editingBorderView = self->_editingBorderView;
  self->_editingBorderView = 0;

}

- (void)_setDidExpandModulePreference
{
  _BOOL4 v2;
  void *v3;
  id v4;

  v2 = -[CCUIContentModuleContainerViewController _isForceTouchAvailable](self, "_isForceTouchAvailable");
  +[CCUIControlCenterDefaults standardDefaults](CCUIControlCenterDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "setHasForceTouchedToExpandModule:", 1);
  else
    objc_msgSend(v3, "setHasLongPressedToExpandModule:", 1);

}

- (id)_contentSourceView
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "compactModeSourceViewForContentModuleContainerViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootPassThroughView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[CCUIContentModuleContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (CGRect)_contentFrameForRestState
{
  id WeakRetained;
  double v4;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "compactModeFrameForContentModuleContainerViewController:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_contentBoundsForExpandedState
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double Width;
  double v14;
  void *v15;
  double Height;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CCUIContentModuleContentViewController prefersExpandedContentSizeMatchesGridSize](self->_contentViewController, "prefersExpandedContentSizeMatchesGridSize"))
  {
    -[CCUIContentModuleContainerViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "controlCenterGridSizeForContentModuleContainerViewController:", self);
    v5 = v4;
    v7 = v6;

    v8 = 0.0;
    v9 = 0.0;
  }
  else
  {
    CCUIDefaultExpandedContentModuleWidth();
    v5 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CCUIContentModuleContentViewController preferredExpandedContentWidth](self->_contentViewController, "preferredExpandedContentWidth");
      v5 = v11;
      -[CCUIContentModuleContainerViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      Width = CGRectGetWidth(v19);

      if (v5 >= Width)
        v5 = Width;
    }
    -[CCUIContentModuleContentViewController preferredExpandedContentHeight](self->_contentViewController, "preferredExpandedContentHeight");
    v7 = v14;
    -[CCUIContentModuleContainerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    Height = CGRectGetHeight(v20);

    if (v7 >= Height)
      v7 = Height;
    v9 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v17 = v5;
  v18 = v7;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (void)_updateDisplayedCompactContinuousCornerRadius
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  if (!self->_suppressesCompactContinuousCornerRadiusUpdates)
  {
    -[CCUIContentModuleContainerViewController _continuousCornerRadiusForCompactState](self, "_continuousCornerRadiusForCompactState");
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CCUIContentModuleContentViewController setCompactContinuousCornerRadius:](self->_contentViewController, "setCompactContinuousCornerRadius:", v4);
    -[CCUIContentModuleContentContainerView setCompactContinuousCornerRadius:](self->_contentContainerView, "setCompactContinuousCornerRadius:", v4);
    -[CCUIContentModuleContentContainerView updateContinuousCornerRadius](self->_contentContainerView, "updateContinuousCornerRadius");
    -[UIControl _setContinuousCornerRadius:](self->_touchBlockingView, "_setContinuousCornerRadius:", v4);
    objc_msgSend((id)objc_opt_class(), "editingSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pulsingBorderWidth");
    v7 = v6;

    -[UIView _setContinuousCornerRadius:](self->_editingBorderView, "_setContinuousCornerRadius:", v4 + v7);
    -[UIView _setContinuousCornerRadius:](self->_editingBorderMaskView, "_setContinuousCornerRadius:", v4);
  }
}

- (void)setSuppressesCompactContinuousCornerRadiusUpdates:(BOOL)a3
{
  if (self->_suppressesCompactContinuousCornerRadiusUpdates != a3)
  {
    self->_suppressesCompactContinuousCornerRadiusUpdates = a3;
    if (!a3)
      -[CCUIContentModuleContainerViewController _updateDisplayedCompactContinuousCornerRadius](self, "_updateDisplayedCompactContinuousCornerRadius");
  }
}

- (BOOL)_isEffectivelyExpanded
{
  return -[CCUIContentModuleContainerViewController isExpanded](self, "isExpanded")
      || -[CCUIContentModuleContainerViewController _isContentViewControllerImplicitlyExpanded](self, "_isContentViewControllerImplicitlyExpanded");
}

- (void)_configureTouchPassThrough
{
  _BOOL4 v3;
  id v4;

  v3 = -[CCUIContentModuleContainerViewController _isEffectivelyExpanded](self, "_isEffectivelyExpanded");
  -[CCUIContentModuleContainerViewController rootPassThroughView](self, "rootPassThroughView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTouchPassThroughDisabled:", !v3);

}

- (BOOL)_isContentViewControllerImplicitlyExpanded
{
  char v3;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v3 = -[CCUIContentModuleContentViewController gridSizeClass](self->_contentViewController, "gridSizeClass");
  return (-[CCUIContentModuleContentViewController implicitlyExpandedGridSizeClasses](self->_contentViewController, "implicitlyExpandedGridSizeClasses") & (1 << v3)) != 0;
}

- (CGRect)_contentFrameForExpandedState
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CCUIContentModuleContentViewController shouldUseCompactContentFrameForExpandedContent](self->_contentViewController, "shouldUseCompactContentFrameForExpandedContent"))
  {
    -[CCUIContentModuleContainerViewController _contentFrameForRestState](self, "_contentFrameForRestState");
  }
  else
  {
    -[CCUIContentModuleContainerViewController _contentBoundsForExpandedState](self, "_contentBoundsForExpandedState");
    -[CCUIContentModuleContainerViewController _presentationFrameForExpandedState](self, "_presentationFrameForExpandedState");
    UIRectCenteredIntegralRect();
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_backgroundFrameForExpandedState
{
  void *v2;
  void *v3;
  double v4;
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
  CGRect result;

  -[CCUIContentModuleContainerViewController bs_presentationContextDefiningViewController](self, "bs_presentationContextDefiningViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_containerFrameForExpandedState
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect result;
  CGRect v21;

  if (self->_backgroundViewController)
    -[CCUIContentModuleContainerViewController _contentBoundsForExpandedState](self, "_contentBoundsForExpandedState", 0, 0x4085400000000000, 0x4077700000000000, 0);
  else
    -[CCUIContentModuleContainerViewController _contentBoundsForExpandedState](self, "_contentBoundsForExpandedState", *MEMORY[0x1E0C9D648], *(_QWORD *)(MEMORY[0x1E0C9D648] + 24), *(_QWORD *)(MEMORY[0x1E0C9D648] + 16), *(_QWORD *)(MEMORY[0x1E0C9D648] + 8));
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  -[CCUIContentModuleContainerViewController _contentFrameForRestState](self, "_contentFrameForRestState");
  v19.origin.x = v15;
  v19.size.height = v16;
  v19.size.width = v17;
  v19.origin.y = v18;
  v21.origin.x = v7;
  v21.origin.y = v8;
  v21.size.width = v9;
  v21.size.height = v10;
  CGRectUnion(v19, v21);
  UIRectCenteredIntegralRect();
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_presentationFrameForExpandedState
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double y;
  double v9;
  double v10;
  double v11;
  double height;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat width;
  double v23;
  double v24;
  double MinY;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double MaxX;
  double v38;
  BOOL v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MaxY;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double MinX;
  CGFloat v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect result;
  CGRect v82;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
  {
    -[CCUIContentModuleContainerViewController _containerFrameForExpandedState](self, "_containerFrameForExpandedState");
    v6 = v5;
    y = v7;
    v10 = v9;
    height = v11;
    v55 = v9;
    v52 = v7;
    v53 = v11;
    v60 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CCUIContentModuleContainerViewController _contentBoundsForExpandedState](self, "_contentBoundsForExpandedState");
      UIRectCenteredIntegralRect();
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[CCUIContentModuleBackgroundViewController effectiveContentFrameForContainerFrame:](self->_backgroundViewController, "effectiveContentFrameForContainerFrame:", v6, y, v10, height);
      UIRectCenteredIntegralRect();
      v82.origin.x = v14;
      v82.origin.y = v16;
      v82.size.width = v18;
      v82.size.height = v20;
      v63 = CGRectUnion(v62, v82);
      x = v63.origin.x;
      y = v63.origin.y;
      width = v63.size.width;
      height = v63.size.height;
    }
    else
    {
      width = v10;
      x = v6;
    }
    v56 = x;
    -[CCUIContentModuleContainerViewController _backgroundFrameForExpandedState](self, "_backgroundFrameForExpandedState");
    v65 = CGRectInset(v64, 20.0, 20.0);
    v30 = v65.origin.x;
    v31 = v65.origin.y;
    v32 = v65.size.width;
    v33 = v65.size.height;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v34 = height;
    MinX = CGRectGetMinX(v65);
    v66.origin.x = v30;
    v66.origin.y = v31;
    v66.size.width = v32;
    v66.size.height = v33;
    v35 = y;
    v36 = CGRectGetMinX(v66);
    v54 = v31;
    v67.origin.x = v30;
    v67.origin.y = v31;
    v58 = v32;
    v59 = v33;
    v67.size.width = v32;
    v67.size.height = v33;
    MaxX = CGRectGetMaxX(v67);
    if (v36 >= v60)
      v38 = v36;
    else
      v38 = v60;
    v39 = MinX < v36;
    v40 = v35;
    if (v39)
      v41 = v38;
    else
      v41 = v60;
    v68.origin.x = v56;
    v68.origin.y = v40;
    v68.size.width = width;
    v68.size.height = v34;
    if (CGRectGetMaxX(v68) > MaxX)
    {
      v69.origin.x = v56;
      v69.origin.y = v40;
      v69.size.width = width;
      v69.size.height = v34;
      v41 = v41 - (CGRectGetMaxX(v69) - MaxX);
    }
    v61 = v41;
    v70.size.width = width;
    v70.origin.x = v56;
    v70.origin.y = v40;
    v70.size.height = v34;
    v42 = CGRectGetHeight(v70);
    v71.origin.x = v30;
    v71.origin.y = v54;
    v71.size.width = v58;
    v71.size.height = v33;
    if (v42 >= CGRectGetHeight(v71))
    {
      v79.origin.x = v30;
      v79.origin.y = v54;
      v79.size.width = v58;
      v79.size.height = v33;
      MinY = CGRectGetMinY(v79);
      v80.origin.x = v30;
      v80.origin.y = v54;
      v80.size.width = v58;
      v80.size.height = v33;
      v29 = CGRectGetHeight(v80);
      v27 = v55;
      v23 = v41;
    }
    else
    {
      v72.origin.x = v56;
      v72.origin.y = v40;
      v72.size.width = width;
      v72.size.height = v34;
      v43 = CGRectGetMinY(v72);
      v73.origin.x = v30;
      v73.origin.y = v54;
      v73.size.width = v58;
      v73.size.height = v33;
      v44 = CGRectGetMinY(v73);
      v74.origin.x = v30;
      v74.origin.y = v54;
      v74.size.width = v58;
      v74.size.height = v59;
      MaxY = CGRectGetMaxY(v74);
      v29 = v53;
      if (v44 >= v52)
        v46 = v44;
      else
        v46 = v52;
      if (v43 >= v44)
        MinY = v52;
      else
        MinY = v46;
      v75.origin.x = v61;
      v75.origin.y = MinY;
      v27 = v55;
      v75.size.width = v55;
      v75.size.height = v53;
      v47 = CGRectGetMaxY(v75) - MaxY;
      if (v47 <= 0.0)
      {
        v23 = v61;
      }
      else
      {
        v76.origin.x = v61;
        v76.origin.y = MinY;
        v76.size.width = v55;
        v76.size.height = v53;
        if (CGRectGetMinY(v76) > v44)
        {
          v77.origin.x = v61;
          v77.origin.y = MinY;
          v77.size.width = v55;
          v77.size.height = v53;
          v48 = CGRectGetMinY(v77) - v44;
          if (v47 < v48)
            v48 = v47;
          MinY = MinY - v48;
          v78.origin.x = v61;
          v78.origin.y = MinY;
          v78.size.width = v55;
          v78.size.height = v53;
          v47 = CGRectGetMaxY(v78) - MaxY;
        }
        v23 = v61;
        v29 = v53 - v47;
      }
    }
  }
  else
  {
    -[CCUIContentModuleContainerViewController _backgroundFrameForExpandedState](self, "_backgroundFrameForExpandedState");
    MinY = v24;
    v27 = v26;
    v29 = v28;
  }
  v49 = MinY;
  v50 = v27;
  v51 = v29;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v23;
  return result;
}

- (CGRect)_contentBoundsForTransitionProgress:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[CCUIContentModuleContainerViewController _contentFrameForRestState](self, "_contentFrameForRestState");
  UIRoundToScale();
  v4 = v3;
  UIRoundToScale();
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_configureMaskViewIfNecessary
{
  UIView *v3;
  UIView *maskView;
  void *v5;
  id v6;

  if (!self->_maskView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    maskView = self->_maskView;
    self->_maskView = v3;

    -[UIView setUserInteractionEnabled:](self->_maskView, "setUserInteractionEnabled:", 0);
    -[CCUIContentModuleContainerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_maskView);

    -[UIView layer](self->_maskView, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

  }
}

- (void)_configureForContentModuleGroupRenderingIfNecessary
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[CCUIContentModuleContentViewController isGroupRenderingRequired](self->_contentViewController, "isGroupRenderingRequired"))-[CCUIContentModuleContainerViewController _configureMaskViewIfNecessary](self, "_configureMaskViewIfNecessary");
  }
}

- (void)_didEndTransitionWithContentModuleContainerTransition:(id)a3 completed:(BOOL)a4
{
  self->_transitioning = 0;
  if (a4)
    -[CCUIContentModuleContentContainerView didEndTransitionToExpandedMode:](self->_contentContainerView, "didEndTransitionToExpandedMode:", objc_msgSend(a3, "isAppearanceTransition"));
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->showsSquareCorners = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isJittering
{
  return self->_jittering;
}

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (void)setModuleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (CCUIContentModuleContainerViewControllerDelegate)delegate
{
  return (CCUIContentModuleContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (CGSize)maxResizeDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_maxResizeDimensions.width;
  height = self->_maxResizeDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxResizeDimensions:(CGSize)a3
{
  self->_maxResizeDimensions = a3;
}

- (CGSize)minResizeDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_minResizeDimensions.width;
  height = self->_minResizeDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinResizeDimensions:(CGSize)a3
{
  self->_minResizeDimensions = a3;
}

- (CCUIContentModule)contentModule
{
  return self->_contentModule;
}

- (void)setContentModule:(id)a3
{
  objc_storeStrong((id *)&self->_contentModule, a3);
}

- (CCUIContentModuleBackgroundViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewController, a3);
}

- (CCUIContentModuleContainerPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationController, a3);
}

- (BOOL)contentModuleProvidesOwnPlatter
{
  return self->_contentModuleProvidesOwnPlatter;
}

- (void)setContentModuleProvidesOwnPlatter:(BOOL)a3
{
  self->_contentModuleProvidesOwnPlatter = a3;
}

- (UIView)highlightWrapperView
{
  return self->_highlightWrapperView;
}

- (void)setHighlightWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightWrapperView, a3);
}

- (CCUIContentModuleBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (CCUIContentModuleContentContainerView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_maskView, a3);
}

- (UIView)editingBorderContainerView
{
  return self->_editingBorderContainerView;
}

- (void)setEditingBorderContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBorderContainerView, a3);
}

- (UIView)editingBorderView
{
  return self->_editingBorderView;
}

- (void)setEditingBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBorderView, a3);
}

- (UIView)editingBorderMaskView
{
  return self->_editingBorderMaskView;
}

- (void)setEditingBorderMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_editingBorderMaskView, a3);
}

- (unint64_t)editingBorderViewRemovalAnimationGeneration
{
  return self->_editingBorderViewRemovalAnimationGeneration;
}

- (void)setEditingBorderViewRemovalAnimationGeneration:(unint64_t)a3
{
  self->_editingBorderViewRemovalAnimationGeneration = a3;
}

- (CCUITouchPassThroughView)rootTouchPassThroughView
{
  return self->_rootTouchPassThroughView;
}

- (void)setRootTouchPassThroughView:(id)a3
{
  objc_storeStrong((id *)&self->_rootTouchPassThroughView, a3);
}

- (UIControl)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchBlockingView, a3);
}

- (UIAction)redirectedTapAction
{
  return self->_redirectedTapAction;
}

- (void)setRedirectedTapAction:(id)a3
{
  objc_storeStrong((id *)&self->_redirectedTapAction, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (_UIClickPresentationInteraction)clickPresentationInteraction
{
  return self->_clickPresentationInteraction;
}

- (void)setClickPresentationInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_clickPresentationInteraction, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UITapGestureRecognizer)expandModuleOnTouchTapRecognizer
{
  return self->_expandModuleOnTouchTapRecognizer;
}

- (void)setExpandModuleOnTouchTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_expandModuleOnTouchTapRecognizer, a3);
}

- (BOOL)isAuthenticatedForExpandedModulePresentation
{
  return self->_authenticatedForExpandedModulePresentation;
}

- (void)setAuthenticatedForExpandedModulePresentation:(BOOL)a3
{
  self->_authenticatedForExpandedModulePresentation = a3;
}

- (BOOL)allowsAutomaticForwardingOfAppearanceMethods
{
  return self->_allowsAutomaticForwardingOfAppearanceMethods;
}

- (void)setAllowsAutomaticForwardingOfAppearanceMethods:(BOOL)a3
{
  self->_allowsAutomaticForwardingOfAppearanceMethods = a3;
}

- (BOOL)suppressesCompactContinuousCornerRadiusUpdates
{
  return self->_suppressesCompactContinuousCornerRadiusUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandModuleOnTouchTapRecognizer, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_redirectedTapAction, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_rootTouchPassThroughView, 0);
  objc_storeStrong((id *)&self->_editingBorderMaskView, 0);
  objc_storeStrong((id *)&self->_editingBorderView, 0);
  objc_storeStrong((id *)&self->_editingBorderContainerView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightWrapperView, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_contentModule, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_topLevelBlockingGestureRecognizers, 0);
}

- (void)pointerInteraction:(os_log_t)log styleForRegion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFB7D000, log, OS_LOG_TYPE_ERROR, "Pointer interaction view not in a window", v1, 2u);
}

@end
