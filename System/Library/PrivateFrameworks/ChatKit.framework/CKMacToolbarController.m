@implementation CKMacToolbarController

+ (id)primaryItemIdentifiersFullWindow
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)primaryItemIdentifiersStandaloneWindow
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)defaultSecondaryItemIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CKMacToolbarController)initWithScene:(id)a3 connectingToSession:(id)a4 inStandaloneWindow:(BOOL)a5
{
  id v8;
  id v9;
  CKMacToolbarController *v10;
  CKMacToolbarController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKMacToolbarController;
  v10 = -[CKMacToolbarController init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_windowScene, v8);
    objc_msgSend(v9, "persistentIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_sceneSessionIdentifier, v12);

    v11->_shouldDrawPrimaryBlur = 1;
    v11->_shouldDrawSecondaryBlur = 1;
    v11->_isInStandaloneWindow = a5;
  }

  return v11;
}

- (void)loadView
{
  UIVisualEffectView *v3;
  UIVisualEffectView *primaryVirtualBackgroundView;
  UIVisualEffectView *v5;
  UIVisualEffectView *secondaryVirtualBackgroundView;
  CKMacToolbarView *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKMacToolbarController;
  -[CKMacToolbarController loadView](&v11, sel_loadView);
  if (!self->_primaryVirtualBackgroundView || !self->_secondaryVirtualBackgroundView)
  {
    v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    primaryVirtualBackgroundView = self->_primaryVirtualBackgroundView;
    self->_primaryVirtualBackgroundView = v3;

    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    secondaryVirtualBackgroundView = self->_secondaryVirtualBackgroundView;
    self->_secondaryVirtualBackgroundView = v5;

    v7 = objc_alloc_init(CKMacToolbarView);
    -[CKMacToolbarView setDelegate:](v7, "setDelegate:", self);
    -[CKMacToolbarController setView:](self, "setView:", v7);
    -[CKMacToolbarController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_primaryVirtualBackgroundView);

    -[CKMacToolbarController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_secondaryVirtualBackgroundView);

    -[CKMacToolbarController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", 0);

  }
}

- (void)viewWillLayoutSubviews
{
  -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 0);
  -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 1);
  -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 2);
}

- (double)_getPreferredHeightForProviderType:(int64_t)a3 withDefaultHeight:(double)a4
{
  void *v5;
  double v6;

  -[CKMacToolbarController _providerForType:](self, "_providerForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "virtualToolbarPreferredHeight");
    a4 = v6;
  }

  return a4;
}

- (void)_updateBackgroundViewsRefreshingViewHeights:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (a3)
  {
    -[CKMacToolbarController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    -[CKMacToolbarController _updateFrameWithPreferredHeightsForFrame:](self, "_updateFrameWithPreferredHeightsForFrame:");

  }
  -[CKMacToolbarController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");

  -[CKMacToolbarController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "macAppKitToolbarHeight");
  v12 = v11;

  -[CKMacToolbarController preferredPrimaryHeight](self, "preferredPrimaryHeight");
  v13 = v12;
  if (v14 != 0.0)
  {
    -[CKMacToolbarController preferredPrimaryHeight](self, "preferredPrimaryHeight");
    v13 = v15;
  }
  -[CKMacToolbarController preferredSecondaryHeight](self, "preferredSecondaryHeight");
  if (v16 != 0.0)
  {
    -[CKMacToolbarController preferredSecondaryHeight](self, "preferredSecondaryHeight");
    v12 = v17;
  }
  v18 = 0.0;
  if (-[CKMacToolbarController isInStandaloneWindow](self, "isInStandaloneWindow"))
    v19 = 0.0;
  else
    v19 = 1.0;
  -[CKMacToolbarController splitViewDividerXPosition](self, "splitViewDividerXPosition");
  v21 = v20 <= 0.0;
  if (v6)
  {
    v22 = v9;
    if (!v21)
      -[CKMacToolbarController splitViewDividerXPosition](self, "splitViewDividerXPosition", v9);
    v23 = v22 - v19;
    v24 = 0.0;
    v25 = v22 + 0.0;
    v18 = v9 - v22;
  }
  else
  {
    if (v20 > 0.0)
    {
      -[CKMacToolbarController splitViewDividerXPosition](self, "splitViewDividerXPosition");
      v18 = v26;
    }
    v24 = v19 + v18;
    v23 = v9 - v18;
    v25 = 0.0;
  }
  -[UIVisualEffectView frame](self->_primaryVirtualBackgroundView, "frame");
  v29.origin.x = v25;
  v29.origin.y = 0.0;
  v29.size.width = v18;
  v29.size.height = v13;
  if (!CGRectEqualToRect(v27, v29))
  {
    -[UIVisualEffectView setFrame:](self->_primaryVirtualBackgroundView, "setFrame:", v25, 0.0, v18, v13);
    -[UIVisualEffectView setNeedsLayout](self->_primaryVirtualBackgroundView, "setNeedsLayout");
    -[UIVisualEffectView layoutIfNeeded](self->_primaryVirtualBackgroundView, "layoutIfNeeded");
  }
  -[UIVisualEffectView frame](self->_secondaryVirtualBackgroundView, "frame");
  v30.origin.x = v24;
  v30.origin.y = 0.0;
  v30.size.width = v23;
  v30.size.height = v12;
  if (!CGRectEqualToRect(v28, v30))
  {
    -[UIVisualEffectView setFrame:](self->_secondaryVirtualBackgroundView, "setFrame:", v24, 0.0, v23, v12);
    -[UIVisualEffectView setNeedsLayout](self->_secondaryVirtualBackgroundView, "setNeedsLayout");
    -[UIVisualEffectView layoutIfNeeded](self->_secondaryVirtualBackgroundView, "layoutIfNeeded");
  }
  -[UIVisualEffectView setHidden:](self->_primaryVirtualBackgroundView, "setHidden:", -[CKMacToolbarController shouldDrawPrimaryBlur](self, "shouldDrawPrimaryBlur") ^ 1);
  -[UIVisualEffectView setHidden:](self->_secondaryVirtualBackgroundView, "setHidden:", -[CKMacToolbarController shouldDrawSecondaryBlur](self, "shouldDrawSecondaryBlur") ^ 1);
}

- (BOOL)_updateFrameWithPreferredHeightsForFrame:(CGRect)a3
{
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  BOOL v19;
  void *v20;
  CGRect v22;
  CGRect v23;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "macAppKitToolbarHeight");
  v9 = v8;

  v10 = 1;
  -[CKMacToolbarController _getPreferredHeightForProviderType:withDefaultHeight:](self, "_getPreferredHeightForProviderType:withDefaultHeight:", 1, v9);
  v12 = v11;
  -[CKMacToolbarController _getPreferredHeightForProviderType:withDefaultHeight:](self, "_getPreferredHeightForProviderType:withDefaultHeight:", 2, v9);
  v14 = v13;
  if (v12 >= v13)
    v15 = v12;
  else
    v15 = v13;
  -[CKMacToolbarController preferredPrimaryHeight](self, "preferredPrimaryHeight");
  if (v12 == v16)
  {
    -[CKMacToolbarController preferredSecondaryHeight](self, "preferredSecondaryHeight");
    v10 = v14 != v17;
  }
  -[CKMacToolbarController setPreferredPrimaryHeight:](self, "setPreferredPrimaryHeight:", v12);
  -[CKMacToolbarController setPreferredSecondaryHeight:](self, "setPreferredSecondaryHeight:", v14);
  -[CKMacToolbarController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = v15;
  v19 = CGRectEqualToRect(v22, v23);

  if (!v19)
  {
    -[CKMacToolbarController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", x, y, width, v15);

    return 1;
  }
  return v10;
}

- (BOOL)reparentToolbarItemsForProvider:(id)a3
{
  return 0;
}

- (void)setShouldDrawPrimaryBlur:(BOOL)a3
{
  if (self->_shouldDrawPrimaryBlur != a3)
  {
    self->_shouldDrawPrimaryBlur = a3;
    if (-[CKMacToolbarController isViewLoaded](self, "isViewLoaded"))
      -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 0);
  }
}

- (void)setShouldDrawSecondaryBlur:(BOOL)a3
{
  if (self->_shouldDrawSecondaryBlur != a3)
  {
    self->_shouldDrawSecondaryBlur = a3;
    if (-[CKMacToolbarController isViewLoaded](self, "isViewLoaded"))
      -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 0);
  }
}

- (void)updateWithFrame:(CGRect)a3
{
  if (-[CKMacToolbarController _updateFrameWithPreferredHeightsForFrame:](self, "_updateFrameWithPreferredHeightsForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 0);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 1);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 2);
    -[CKMacToolbarController _sizeMetricsDidChange](self, "_sizeMetricsDidChange");
  }
}

- (void)_sizeMetricsDidChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toolbarSizeMetricsDidChange");

  }
  -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toolbarSizeMetricsDidChange");

  }
}

- (void)removeItemProviders
{
  -[CKMacToolbarController setPrimaryItemProvider:](self, "setPrimaryItemProvider:", 0);
  -[CKMacToolbarController setSecondaryItemProvider:](self, "setSecondaryItemProvider:", 0);
  -[CKMacToolbarController reloadToolbarItems](self, "reloadToolbarItems");
}

- (void)setSplitViewDividerXPosition:(double)a3
{
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(a3, self->_splitViewDividerXPosition, 0.00000999999975))
  {
    self->_splitViewDividerXPosition = a3;
    -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 0);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 1);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 2);
    -[CKMacToolbarController _sizeMetricsDidChange](self, "_sizeMetricsDidChange");
  }
}

- (void)setPrimaryItemProvider:(id)a3
{
  CKMacToolbarItemProvider *v5;
  CKMacToolbarItemProvider *primaryItemProvider;
  CKMacToolbarItemProvider *v7;

  v5 = (CKMacToolbarItemProvider *)a3;
  primaryItemProvider = self->_primaryItemProvider;
  v7 = v5;
  if (primaryItemProvider != v5)
  {
    if (primaryItemProvider)
      -[CKMacToolbarItemProvider providerWillBeRemovedFromToolbarController:](primaryItemProvider, "providerWillBeRemovedFromToolbarController:", self);
    objc_storeStrong((id *)&self->_primaryItemProvider, a3);
    -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 1);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 1);
    if (self->_primaryItemProvider)
      -[CKMacToolbarController reparentToolbarItemsForProvider:](self, "reparentToolbarItemsForProvider:");
  }

}

- (void)setSecondaryItemProvider:(id)a3
{
  CKMacToolbarItemProvider *v5;
  CKMacToolbarItemProvider *secondaryItemProvider;
  CKMacToolbarItemProvider *v7;

  v5 = (CKMacToolbarItemProvider *)a3;
  secondaryItemProvider = self->_secondaryItemProvider;
  v7 = v5;
  if (secondaryItemProvider != v5)
  {
    if (secondaryItemProvider)
      -[CKMacToolbarItemProvider providerWillBeRemovedFromToolbarController:](secondaryItemProvider, "providerWillBeRemovedFromToolbarController:", self);
    objc_storeStrong((id *)&self->_secondaryItemProvider, a3);
    -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 1);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", 2);
    if (self->_secondaryItemProvider)
      -[CKMacToolbarController reparentToolbarItemsForProvider:](self, "reparentToolbarItemsForProvider:");
  }

}

- (void)removeVirtualViewForProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v11)
  {
    -[CKMacToolbarController primaryProvidedVirtualView](self, "primaryProvidedVirtualView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v5 != v11)
      goto LABEL_9;
    -[CKMacToolbarController secondaryProvidedVirtualView](self, "secondaryProvidedVirtualView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v6 = v11;
  if (v8)
  {
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacToolbarController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
      objc_msgSend(v8, "removeFromSuperview");

    v6 = v11;
  }
LABEL_9:

}

- (void)removeItemProvider:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[CKMacToolbarController setPrimaryItemProvider:](self, "setPrimaryItemProvider:", 0);
      goto LABEL_6;
    }
    -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v6 == v7)
    {
      -[CKMacToolbarController setSecondaryItemProvider:](self, "setSecondaryItemProvider:", 0);
LABEL_6:
      v4 = v7;
    }
  }

}

- (void)updateVirtualViewForProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    v7 = 1;
    goto LABEL_5;
  }
  -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 == v8)
  {
    v7 = 2;
LABEL_5:
    -[CKMacToolbarController _updateBackgroundViewsRefreshingViewHeights:](self, "_updateBackgroundViewsRefreshingViewHeights:", 1);
    -[CKMacToolbarController _updateVirtualViewForProviderType:](self, "_updateVirtualViewForProviderType:", v7);
    v6 = v8;
  }

}

- (CGRect)alignmentRectForItemWithIdentifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateVirtualViewForProviderType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;

  -[CKMacToolbarController _providerForType:](self, "_providerForType:");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMacToolbarController _cachedVirtualViewForProviderType:](self, "_cachedVirtualViewForProviderType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v34, "virtualView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6 != v5)
  {
    objc_msgSend(v5, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacToolbarController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      objc_msgSend(v5, "removeFromSuperview");
    -[CKMacToolbarController _setVirtualView:forProviderType:](self, "_setVirtualView:forProviderType:", v6, a3);
  }
  if (v34 && v6)
  {
    objc_msgSend(v6, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CKMacToolbarController _virtualBackgroundViewForProviderType:](self, "_virtualBackgroundViewForProviderType:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v34, "virtualToolbarContentInsets");
      v19 = v19 + v26;
      v21 = v21 + v27;
      v23 = v23 - (v26 + v28);
      v25 = v25 - (v27 + v29);
    }
    objc_msgSend(v6, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacToolbarController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 != v31)
    {
      -[CKMacToolbarController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v6);

    }
    v35.origin.x = v10;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = v16;
    v36.origin.x = v19;
    v36.origin.y = v21;
    v36.size.width = v23;
    v36.size.height = v25;
    if (!CGRectEqualToRect(v35, v36))
    {
      objc_msgSend(v6, "setFrame:", v19, v21, v23, v25);
      objc_msgSend(v6, "setNeedsLayout");
      objc_msgSend(v6, "layoutIfNeeded");
    }
    -[CKMacToolbarController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bringSubviewToFront:", v6);

  }
}

- (int64_t)_providerTypeForItemIdentifier:(id)a3
{
  return 0;
}

- (id)_providerForType:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[CKMacToolbarController secondaryItemProvider](self, "secondaryItemProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[CKMacToolbarController primaryItemProvider](self, "primaryItemProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_cachedVirtualViewForProviderType:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[CKMacToolbarController secondaryProvidedVirtualView](self, "secondaryProvidedVirtualView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[CKMacToolbarController primaryProvidedVirtualView](self, "primaryProvidedVirtualView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_virtualBackgroundViewForProviderType:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[CKMacToolbarController secondaryVirtualBackgroundView](self, "secondaryVirtualBackgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[CKMacToolbarController primaryVirtualBackgroundView](self, "primaryVirtualBackgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setVirtualView:(id)a3 forProviderType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = v6;
    -[CKMacToolbarController setSecondaryProvidedVirtualView:](self, "setSecondaryProvidedVirtualView:", v6);
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = v6;
    -[CKMacToolbarController setPrimaryProvidedVirtualView:](self, "setPrimaryProvidedVirtualView:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (BOOL)_shouldDisAllowTouchesToPassForProviderType:(int64_t)a3
{
  void *v3;
  char v4;

  -[CKMacToolbarController _providerForType:](self, "_providerForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "itemProviderDisablesTouches");
  else
    v4 = 1;

  return v4;
}

- (int64_t)_providerTypeForPointInsideVirtualView:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKMacToolbarController primaryProvidedVirtualView](self, "primaryProvidedVirtualView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacToolbarController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMacToolbarController primaryProvidedVirtualView](self, "primaryProvidedVirtualView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", v10, x, y);
  v11 = objc_msgSend(v8, "pointInside:withEvent:", v7);

  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    -[CKMacToolbarController secondaryProvidedVirtualView](self, "secondaryProvidedVirtualView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacToolbarController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMacToolbarController secondaryProvidedVirtualView](self, "secondaryProvidedVirtualView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:toView:", v15, x, y);
    v16 = objc_msgSend(v13, "pointInside:withEvent:", v7);

    if (v16)
      v12 = 2;
    else
      v12 = 0;
  }

  return v12;
}

- (BOOL)macToolbarView:(id)a3 shouldAllowTouchesForPoint:(CGPoint)a4 andEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  -[CKMacToolbarController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
    v12 = !-[CKMacToolbarController _shouldDisAllowTouchesToPassForProviderType:](self, "_shouldDisAllowTouchesToPassForProviderType:", -[CKMacToolbarController _providerTypeForPointInsideVirtualView:withEvent:](self, "_providerTypeForPointInsideVirtualView:withEvent:", v9, x, y));
  else
    LOBYTE(v12) = 0;

  return v12;
}

- (CKMacToolbarDelegate)delegate
{
  return (CKMacToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sceneSessionIdentifier
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_sceneSessionIdentifier);
}

- (CKMacToolbarItemProvider)primaryItemProvider
{
  return self->_primaryItemProvider;
}

- (CKMacToolbarItemProvider)secondaryItemProvider
{
  return self->_secondaryItemProvider;
}

- (double)splitViewDividerXPosition
{
  return self->_splitViewDividerXPosition;
}

- (BOOL)shouldDrawPrimaryBlur
{
  return self->_shouldDrawPrimaryBlur;
}

- (BOOL)shouldDrawSecondaryBlur
{
  return self->_shouldDrawSecondaryBlur;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)isInStandaloneWindow
{
  return self->_isInStandaloneWindow;
}

- (void)setIsInStandaloneWindow:(BOOL)a3
{
  self->_isInStandaloneWindow = a3;
}

- (NSMutableDictionary)toolbarItemCache
{
  return self->_toolbarItemCache;
}

- (void)setToolbarItemCache:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarItemCache, a3);
}

- (UIVisualEffectView)primaryVirtualBackgroundView
{
  return self->_primaryVirtualBackgroundView;
}

- (UIVisualEffectView)secondaryVirtualBackgroundView
{
  return self->_secondaryVirtualBackgroundView;
}

- (double)preferredPrimaryHeight
{
  return self->_preferredPrimaryHeight;
}

- (void)setPreferredPrimaryHeight:(double)a3
{
  self->_preferredPrimaryHeight = a3;
}

- (double)preferredSecondaryHeight
{
  return self->_preferredSecondaryHeight;
}

- (void)setPreferredSecondaryHeight:(double)a3
{
  self->_preferredSecondaryHeight = a3;
}

- (UIView)primaryProvidedVirtualView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_primaryProvidedVirtualView);
}

- (void)setPrimaryProvidedVirtualView:(id)a3
{
  objc_storeWeak((id *)&self->_primaryProvidedVirtualView, a3);
}

- (UIView)secondaryProvidedVirtualView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_secondaryProvidedVirtualView);
}

- (void)setSecondaryProvidedVirtualView:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryProvidedVirtualView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secondaryProvidedVirtualView);
  objc_destroyWeak((id *)&self->_primaryProvidedVirtualView);
  objc_storeStrong((id *)&self->_secondaryVirtualBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryVirtualBackgroundView, 0);
  objc_storeStrong((id *)&self->_toolbarItemCache, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_secondaryItemProvider, 0);
  objc_storeStrong((id *)&self->_primaryItemProvider, 0);
  objc_destroyWeak((id *)&self->_sceneSessionIdentifier);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
