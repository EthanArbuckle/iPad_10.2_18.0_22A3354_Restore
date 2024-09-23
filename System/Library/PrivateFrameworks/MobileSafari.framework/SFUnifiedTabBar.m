@implementation SFUnifiedTabBar

- (SFUnifiedTabBar)initWithFrame:(CGRect)a3
{
  SFUnifiedTabBar *v3;
  SFUnifiedTabBar *v4;
  UIView *v5;
  UIView *searchFieldPopoverAlignmentView;
  _UIVisualEffectBackdropView *v7;
  _UIVisualEffectBackdropView *backgroundCaptureView;
  void *v9;
  void *v10;
  UIScrollView *v11;
  UIScrollView *scrollView;
  UIView *v13;
  UIView *dragPreviewContainer;
  SFUnifiedTabBarMetrics *v15;
  void *v16;
  uint64_t v17;
  SFUnifiedTabBarMetrics *barMetrics;
  SFUnifiedTabBarItemArrangement *v19;
  SFUnifiedTabBarItemArrangement *itemArrangement;
  SFUnifiedTabBarLayout *v21;
  SFUnifiedTabBarItemArrangement *v22;
  void *v23;
  uint64_t v24;
  SFUnifiedTabBarLayout *layout;
  SFUnifiedTabBarItemArrangement *v26;
  SFUnifiedTabBarItemArrangement *unresolvedItemArrangement;
  uint64_t v28;
  UITextField *searchField;
  uint64_t v30;
  UIHoverGestureRecognizer *hoverRecognizer;
  SFTabHoverPreviewController *v32;
  SFTabHoverPreviewController *tabHoverPreviewController;
  SFPinnedOverflowItem *v34;
  SFPinnedOverflowItem *pinnedOverflowItem;
  uint64_t v36;
  UIPointerInteraction *pointerInteraction;
  uint64_t v38;
  NSMutableDictionary *itemViewRegistrationsByReuseIdentifier;
  void *v40;
  void *v41;
  id v42;
  SFUnifiedTabBar *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)SFUnifiedTabBar;
  v3 = -[SFUnifiedTabBar initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_themeColorVisibility = 1.0;
    v3->_squishTransformFactor = 1.0;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    searchFieldPopoverAlignmentView = v4->_searchFieldPopoverAlignmentView;
    v4->_searchFieldPopoverAlignmentView = v5;

    -[UIView setHidden:](v4->_searchFieldPopoverAlignmentView, "setHidden:", 1);
    -[SFUnifiedTabBar addSubview:](v4, "addSubview:", v4->_searchFieldPopoverAlignmentView);
    v7 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E0DC4498]);
    backgroundCaptureView = v4->_backgroundCaptureView;
    v4->_backgroundCaptureView = v7;

    -[_UIVisualEffectBackdropView setRenderMode:](v4->_backgroundCaptureView, "setRenderMode:", 1);
    -[SFUnifiedTabBar _backgroundCaptureGroupName](v4, "_backgroundCaptureGroupName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectBackdropView captureGroup](v4->_backgroundCaptureView, "captureGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGroupName:", v9);

    -[SFUnifiedTabBar addSubview:](v4, "addSubview:", v4->_backgroundCaptureView);
    v11 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v4->_scrollView;
    v4->_scrollView = v11;

    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setAlwaysBounceHorizontal:](v4->_scrollView, "setAlwaysBounceHorizontal:", 1);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v4->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView setClipsToBounds:](v4->_scrollView, "setClipsToBounds:", 0);
    -[SFUnifiedTabBar addSubview:](v4, "addSubview:", v4->_scrollView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    dragPreviewContainer = v4->_dragPreviewContainer;
    v4->_dragPreviewContainer = v13;

    -[UIView setHidden:](v4->_dragPreviewContainer, "setHidden:", 1);
    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_dragPreviewContainer);
    v15 = [SFUnifiedTabBarMetrics alloc];
    -[SFUnifiedTabBar traitCollection](v4, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SFUnifiedTabBarMetrics initWithTraitCollection:](v15, "initWithTraitCollection:", v16);
    barMetrics = v4->_barMetrics;
    v4->_barMetrics = (SFUnifiedTabBarMetrics *)v17;

    v19 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
    itemArrangement = v4->_itemArrangement;
    v4->_itemArrangement = v19;

    v21 = [SFUnifiedTabBarLayout alloc];
    v22 = v4->_itemArrangement;
    -[SFUnifiedTabBar _currentLayoutConfiguration](v4, "_currentLayoutConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SFUnifiedTabBarLayout initWithItemArrangement:configuration:](v21, "initWithItemArrangement:configuration:", v22, v23);
    layout = v4->_layout;
    v4->_layout = (SFUnifiedTabBarLayout *)v24;

    v26 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
    unresolvedItemArrangement = v4->_unresolvedItemArrangement;
    v4->_unresolvedItemArrangement = v26;

    v28 = -[SFUnifiedTabBar newSearchField](v4, "newSearchField");
    searchField = v4->_searchField;
    v4->_searchField = (UITextField *)v28;

    -[UITextField setAdjustsFontForContentSizeCategory:](v4->_searchField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setAutocapitalizationType:](v4->_searchField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](v4->_searchField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](v4->_searchField, "setClearButtonMode:", 3);
    -[UITextField setKeyboardType:](v4->_searchField, "setKeyboardType:", 10);
    -[UITextField setSemanticContentAttribute:](v4->_searchField, "setSemanticContentAttribute:", 3);
    -[UITextField setSmartDashesType:](v4->_searchField, "setSmartDashesType:", 1);
    -[UITextField setSmartQuotesType:](v4->_searchField, "setSmartQuotesType:", 1);
    -[UITextField setTintAdjustmentMode:](v4->_searchField, "setTintAdjustmentMode:", 1);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v4, sel__hover_);
    hoverRecognizer = v4->_hoverRecognizer;
    v4->_hoverRecognizer = (UIHoverGestureRecognizer *)v30;

    -[SFUnifiedTabBar addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_hoverRecognizer);
    v32 = objc_alloc_init(SFTabHoverPreviewController);
    tabHoverPreviewController = v4->_tabHoverPreviewController;
    v4->_tabHoverPreviewController = v32;

    -[SFTabHoverPreviewController setHoverRecognizer:](v4->_tabHoverPreviewController, "setHoverRecognizer:", v4->_hoverRecognizer);
    v34 = objc_alloc_init(SFPinnedOverflowItem);
    pinnedOverflowItem = v4->_pinnedOverflowItem;
    v4->_pinnedOverflowItem = v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = (UIPointerInteraction *)v36;

    -[SFUnifiedTabBar addInteraction:](v4, "addInteraction:", v4->_pointerInteraction);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    itemViewRegistrationsByReuseIdentifier = v4->_itemViewRegistrationsByReuseIdentifier;
    v4->_itemViewRegistrationsByReuseIdentifier = (NSMutableDictionary *)v38;

    -[SFUnifiedTabBar _setUpBuiltInItemViewRegistrations](v4, "_setUpBuiltInItemViewRegistrations");
    +[SFUnifiedBarTheme defaultTheme](SFUnifiedBarTheme, "defaultTheme");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar setBarTheme:](v4, "setBarTheme:", v40);

    +[SFUnifiedBarMetrics traitsAffectingBarMetrics](SFUnifiedBarMetrics, "traitsAffectingBarMetrics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)-[SFUnifiedTabBar registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v41, v4, sel__updateBarMetricsForTraitChange);

    v43 = v4;
  }

  return v4;
}

- (BOOL)showsSquishedTitleContainer
{
  return self->_squishedTitleContainer != 0;
}

- (void)setShowsSquishedTitleContainer:(BOOL)a3
{
  SFUnifiedTabBarItemTitleContainerView *v5;
  SFUnifiedTabBarItemTitleContainerView *squishedTitleContainer;
  void *v7;
  SFUnifiedTabBarItemTitleContainerView *v8;
  void *v9;
  void *v10;
  SFUnifiedTabBarItemTitleContainerView *v11;

  if (-[SFUnifiedTabBar showsSquishedTitleContainer](self, "showsSquishedTitleContainer") != a3)
  {
    if (a3)
    {
      v5 = -[SFUnifiedTabBarItemTitleContainerView initWithAlignment:]([SFUnifiedTabBarItemTitleContainerView alloc], "initWithAlignment:", 1);
      squishedTitleContainer = self->_squishedTitleContainer;
      self->_squishedTitleContainer = v5;

      -[SFUnifiedTabBarItemTitleContainerView setCollapsed:](self->_squishedTitleContainer, "setCollapsed:", 0);
      -[SFUnifiedBarTheme titleTheme](self->_barTheme, "titleTheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView setTheme:](self->_squishedTitleContainer, "setTheme:", v7);

      -[SFUnifiedTabBarItemTitleContainerView setShowsPrivateAnnotation:](self->_squishedTitleContainer, "setShowsPrivateAnnotation:", -[SFUnifiedBarTheme isPrivate](self->_barTheme, "isPrivate"));
      -[SFUnifiedTabBarItemTitleContainerView setUserInteractionEnabled:](self->_squishedTitleContainer, "setUserInteractionEnabled:", 0);
      v8 = self->_squishedTitleContainer;
      -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSquishedTitleContainer:", v8);

      -[SFUnifiedTabBar addSubview:](self, "addSubview:", self->_squishedTitleContainer);
    }
    else
    {
      -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSquishedTitleContainer:", 0);

      -[SFUnifiedTabBarItemTitleContainerView removeFromSuperview](self->_squishedTitleContainer, "removeFromSuperview");
      v11 = self->_squishedTitleContainer;
      self->_squishedTitleContainer = 0;

    }
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double Width;
  double x;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  SFUnifiedTabBar *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  SFUnifiedTabBar *v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  self->_isLayingOut = 1;
  v38.receiver = self;
  v38.super_class = (Class)SFUnifiedTabBar;
  -[SFUnifiedTabBar layoutSubviews](&v38, sel_layoutSubviews);
  -[SFUnifiedTabBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v12 = v11;
  -[SFUnifiedTabBar layoutMargins](self, "layoutMargins");
  v14 = v13;
  -[SFUnifiedTabBar _prepareForResizeIfNeeded](self, "_prepareForResizeIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  Width = CGRectGetWidth(v39);
  -[UIScrollView frame](self->_scrollView, "frame");
  v43.origin.x = 0.0;
  v43.origin.y = v14;
  v43.size.width = Width;
  v43.size.height = v12;
  if (!CGRectEqualToRect(v40, v43))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, v14, Width, v12);
  -[_UIVisualEffectBackdropView setFrame:](self->_backgroundCaptureView, "setFrame:", 0.0, v14, Width, v12);
  x = self->_midpointForCenteredContent.x;
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  v18 = x + CGRectGetWidth(v41) * -0.5;
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  -[UIView setFrame:](self->_searchFieldPopoverAlignmentView, "setFrame:", v18, v14, CGRectGetWidth(v42), v12);
  -[_SFFluidProgressView superview](self->_minimizedProgressView, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  -[_SFFluidProgressView setFrame:](self->_minimizedProgressView, "setFrame:");

  titleTextStyleForRole((id)self->_role);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView setTitleTextStyle:](self->_squishedTitleContainer, "setTitleTextStyle:", v20);

  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded") ^ 1);
  -[SFUnifiedTabBarLayout autoScrollTouchInsets](self->_layout, "autoScrollTouchInsets");
  -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:");
  -[SFUnifiedTabBar _updateItemSizesIfNeeded](self, "_updateItemSizesIfNeeded");
  -[SFUnifiedTabBar _updateContentSizeIfNeeded](self, "_updateContentSizeIfNeeded");
  -[SFUnifiedTabBar _layoutSquishedTitleContainer](self, "_layoutSquishedTitleContainer");
  v21 = (void *)MEMORY[0x1E0DC3F10];
  v22 = v15 != 0;
  v23 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __33__SFUnifiedTabBar_layoutSubviews__block_invoke;
  v35[3] = &unk_1E21E2258;
  v36 = v15;
  v37 = self;
  v29 = v23;
  v30 = 3221225472;
  v31 = __33__SFUnifiedTabBar_layoutSubviews__block_invoke_2;
  v32 = &unk_1E21E26F8;
  v33 = self;
  v34 = v36;
  v24 = v36;
  objc_msgSend(v21, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v22, 2, v35, &v29);
  -[UIView ss_untransformedFrame](self, "ss_untransformedFrame", v29, v30, v31, v32, v33);
  self->_lastLayoutFrame.origin.x = v25;
  self->_lastLayoutFrame.origin.y = v26;
  self->_lastLayoutFrame.size.width = v27;
  self->_lastLayoutFrame.size.height = v28;
  self->_isLayingOut = 0;

}

uint64_t __33__SFUnifiedTabBar_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "targetContentOffset");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "setContentOffset:");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_layoutItems");
}

void __33__SFUnifiedTabBar_layoutSubviews__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemsToKeepVisible");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didEndAnimationsForItems:", v2);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[SFUnifiedTabBar pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[SFUnifiedTabBarLayout visibleItems](self->_layout, "visibleItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v9)
    {

LABEL_17:
      v25.receiver = self;
      v25.super_class = (Class)SFUnifiedTabBar;
      -[SFUnifiedTabBar hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    v13 = -1.79769313e308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "reusableView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_outermostLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "zPosition");
        v18 = v17;

        if (v18 >= v13)
        {
          objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
          objc_msgSend(v15, "hitTest:withEvent:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v19;

            objc_msgSend(v15, "_outermostLayer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "zPosition");
            v13 = v23;

            v11 = v21;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)_updateBarMetricsForTraitChange
{
  SFUnifiedTabBarMetrics *barMetrics;
  void *v4;

  barMetrics = self->_barMetrics;
  -[SFUnifiedTabBar traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(barMetrics) = -[SFUnifiedBarMetrics updateWithTraitCollection:](barMetrics, "updateWithTraitCollection:", v4);

  if ((_DWORD)barMetrics)
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)setItemArrangement:(id)a3
{
  -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", a3, 0, 0, 0);
}

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  SFUnifiedTabBarItemArrangement *v10;
  id v11;
  id v12;
  SFUnifiedTabBarItemArrangement *unresolvedItemArrangement;
  id v14;

  v8 = a4;
  v10 = (SFUnifiedTabBarItemArrangement *)a3;
  v11 = a6;
  v12 = a5;
  -[SFUnifiedTabBarItemArrangement resolvedArrangementWithPinnedItemLimit:overflowItem:](v10, "resolvedArrangementWithPinnedItemLimit:overflowItem:", -[SFUnifiedTabBar _pinnedItemLimitForItemArrangement:](self, "_pinnedItemLimitForItemArrangement:", v10), self->_pinnedOverflowItem);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBar _setResolvedItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setResolvedItemArrangement:animated:keepingItemVisible:completionHandler:", v14, v8, v12, v11);

  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  self->_unresolvedItemArrangement = v10;

}

- (void)_setResolvedItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  SFUnifiedTabBarItemArrangement **p_itemArrangement;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SFUnifiedTabBarLayout *v23;
  void *v24;
  SFUnifiedTabBarLayout *v25;
  SFUnifiedTabBarLayout *layout;
  void *v27;
  uint64_t v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  double v36;
  double v37;
  UIScrollView *scrollView;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  SFUnifiedTabBarLayout *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  int v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  SFUnifiedTabBarLayout *v78;
  void *v79;
  void *v80;
  _QWORD v81[4];
  id v82;
  SFUnifiedTabBar *v83;
  id v84;
  void (**v85)(_QWORD);
  _QWORD *v86;
  _QWORD v87[5];
  id v88;
  SFUnifiedTabBarLayout *v89;
  _QWORD *v90;
  double v91;
  double v92;
  double v93;
  _QWORD v94[5];
  id v95;
  _QWORD v96[5];
  id v97;
  SFUnifiedTabBarLayout *v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  p_itemArrangement = &self->_itemArrangement;
  v14 = objc_msgSend(v10, "isEqualToArrangement:", self->_itemArrangement);
  v80 = v11;
  if (v11 || !v14)
  {
    -[SFUnifiedTabBarItemArrangement items](*p_itemArrangement, "items");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "differenceFromArray:withOptions:", v76, 4);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "safari_removalIndexes");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](*p_itemArrangement, "activeItemIsExpanded"))
      v72 = 0;
    else
      v72 = objc_msgSend(v10, "activeItemIsExpanded") ^ 1;
    objc_msgSend(v10, "activeItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemArrangement activeItem](*p_itemArrangement, "activeItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {
      objc_msgSend(v10, "items");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemArrangement items](*p_itemArrangement, "items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "isEqual:", v19);

    }
    else
    {
      v17 = 0;
    }

    objc_msgSend(v10, "determineActiveItemSquishStateIfNeeded:", -[SFUnifiedTabBarItemArrangement revealsSquishedActiveItem](*p_itemArrangement, "revealsSquishedActiveItem") & v17);
    -[SFUnifiedTabBarItemArrangement activeItem](*p_itemArrangement, "activeItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v21)
    {
      -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSquishedTitleContainer:", 0);

    }
    v78 = self->_layout;
    objc_storeStrong((id *)&self->_itemArrangement, a3);
    v23 = [SFUnifiedTabBarLayout alloc];
    -[SFUnifiedTabBar _currentLayoutConfiguration](self, "_currentLayoutConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SFUnifiedTabBarLayout initWithItemArrangement:configuration:](v23, "initWithItemArrangement:configuration:", v10, v24);
    layout = self->_layout;
    self->_layout = v25;

    objc_msgSend(v10, "items");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", (unint64_t)objc_msgSend(v27, "count") > 1);

    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
    if (v80
      && ((v28 = objc_msgSend(v77, "indexOfObject:", v80), v28 != 0x7FFFFFFFFFFFFFFFLL) ? (v29 = v72) : (v29 = 0),
          v29 == 1))
    {
      -[SFUnifiedTabBarLayout contentOffsetForScrollingToItemAtIndex:](self->_layout, "contentOffsetForScrollingToItemAtIndex:", v28);
    }
    else
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    }
    v32 = v30;
    v33 = v31;
    objc_msgSend(v79, "insertions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "safari_containsObjectPassingTest:", &__block_literal_global_28);

    if (v35)
    {
      -[SFUnifiedTabBarLayout contentOffsetForScrollingToDroppingItems](self->_layout, "contentOffsetForScrollingToDroppingItems");
      v32 = v36;
      v33 = v37;
    }
    scrollView = self->_scrollView;
    if (a4)
    {
      -[UIScrollView bounds](scrollView, "bounds");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v48 = v47;
      v49 = (void *)MEMORY[0x1E0C99E20];
      -[SFUnifiedTabBarLayout visibleItems](v78, "visibleItems");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setWithArray:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v32 - v48;

      -[SFUnifiedTabBarLayout itemsVisibleInRect:](self->_layout, "itemsVisibleInRect:", v40 + v52, v42, v44, v46);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "unionSet:", v53);

      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v54 = v51;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
      if (v55)
      {
        v56 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v102 != v56)
              objc_enumerationMutation(v54);
            objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "activeAnimationCount") + 1);
          }
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        }
        while (v55);
      }

      -[SFUnifiedTabBarLayout itemArrangement](v78, "itemArrangement");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "allItemIndexes");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v59, "mutableCopy");

      -[SFUnifiedTabBarLayout visibleItemIndexes](v78, "visibleItemIndexes");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3;
      v99[3] = &unk_1E21E2BB0;
      v62 = v60;
      v100 = v62;
      objc_msgSend(v61, "enumerateIndexesUsingBlock:", v99);

      objc_msgSend(v79, "removals");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_27_1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFUnifiedTabBar _didBeginScrollingAnimation](self, "_didBeginScrollingAnimation");
      v64 = (void *)MEMORY[0x1E0DC3F10];
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_5;
      v96[3] = &unk_1E21E22F8;
      v96[4] = self;
      v65 = v62;
      v97 = v65;
      v66 = v78;
      v98 = v66;
      objc_msgSend(v64, "performWithoutAnimation:", v96);
      objc_msgSend(v79, "safari_insertionIndexes");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBar _layoutAppearingItemsAtIndexes:withDistanceToScroll:usingLayout:](self, "_layoutAppearingItemsAtIndexes:withDistanceToScroll:usingLayout:", v67, self->_layout, v52);

      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x3032000000;
      v94[3] = __Block_byref_object_copy__3;
      v94[4] = __Block_byref_object_dispose__3;
      v95 = 0;
      v68 = (void *)MEMORY[0x1E0DC3F10];
      v69 = MEMORY[0x1E0C809B0];
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_28;
      v87[3] = &unk_1E21E4BC8;
      v87[4] = self;
      v91 = v32;
      v92 = v33;
      v88 = v73;
      v93 = v52;
      v89 = v66;
      v90 = v94;
      v81[0] = v69;
      v81[1] = 3221225472;
      v81[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2_29;
      v81[3] = &unk_1E21E4BF0;
      v70 = v75;
      v82 = v70;
      v83 = self;
      v71 = v54;
      v84 = v71;
      v86 = v94;
      v85 = v12;
      objc_msgSend(v68, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 610, v87, v81);

      _Block_object_dispose(v94, 8);
    }
    else
    {
      -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", v32, v33);
      -[SFUnifiedTabBar _discardViewsForIndexes:ofItems:](self, "_discardViewsForIndexes:ofItems:", v73, v76);
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2;
      v105[3] = &unk_1E21E2050;
      v105[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v105);
      if (v12)
        v12[2](v12);
    }

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDropping");

  return v3;
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePinnedItemsSeparator");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_uninstallSearchFieldIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setShowsSearchField:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layoutIfNeeded");
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a2);
}

id __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reusableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutItemsAtIndexes:usingLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_setUpPinnedItemsSeparatorIfNeeded");
}

void __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_28(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_layoutDisappearingItemsAtIndexes:withDistanceScrolled:usingLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_beginTransitioningSearchField");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 480));
}

uint64_t __93__SFUnifiedTabBar__setResolvedItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2_29(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_discardItemView:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "_didEndAnimationsForItems:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_didEndScrollingAnimation");
  objc_msgSend(*(id *)(a1 + 40), "_endTransitioningSearchFieldInItemView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "_tearDownPinnedItemsSeparatorIfNeeded");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setActiveItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SFUnifiedTabBarItemArrangement *unresolvedItemArrangement;
  id v7;
  id v8;

  v4 = a4;
  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  v7 = a3;
  -[SFUnifiedTabBarItemArrangement arrangementWithActiveItem:](unresolvedItemArrangement, "arrangementWithActiveItem:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v8, v4, v7, 0);

}

- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  SFUnifiedTabBarItemArrangement *unresolvedItemArrangement;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  unresolvedItemArrangement = self->_unresolvedItemArrangement;
  v9 = a5;
  -[SFUnifiedTabBarItemArrangement arrangementWithActiveItemIsExpanded:](unresolvedItemArrangement, "arrangementWithActiveItemIsExpanded:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v10, v5, 0, v9);

}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
  -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", self->_unresolvedItemArrangement, a4, a3, 0);
}

- (void)setItemsNeedEraserBasedCutoutBorder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
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
  if (self->_itemsNeedEraserBasedCutoutBorder != a3)
  {
    v3 = a3;
    self->_itemsNeedEraserBasedCutoutBorder = a3;
    -[UIScrollView layer](self->_scrollView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCreatesCompositingGroup:", v3);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SFUnifiedTabBarLayout visibleItems](self->_layout, "visibleItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "reusableView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setItemsNeedEraserBasedCutoutBorder:", v3);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)updateLayout
{
  -[SFUnifiedTabBarLayout updateItemSizes](self->_layout, "updateItemSizes");
  -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  -[SFUnifiedTabBar layoutIfNeeded](self, "layoutIfNeeded");
}

- (UIView)searchFieldPopoverSourceView
{
  SFUnifiedTabBar *v3;

  if (-[SFUnifiedTabBarLayout contentIsCentered](self->_layout, "contentIsCentered"))
  {
    -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
    v3 = (SFUnifiedTabBar *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[SFUnifiedTabBarLayout centersActiveItemWhenExpanded](self->_layout, "centersActiveItemWhenExpanded"))
  {
    v3 = self->_searchFieldPopoverAlignmentView;
  }
  else
  {
    v3 = self;
  }
  return (UIView *)v3;
}

- (UIEdgeInsets)searchFieldPopoverSourceInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (-[SFUnifiedTabBarLayout contentIsCentered](self->_layout, "contentIsCentered")
    || -[SFUnifiedTabBarLayout centersActiveItemWhenExpanded](self->_layout, "centersActiveItemWhenExpanded"))
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    -[SFUnifiedTabBar layoutMargins](self, "layoutMargins");
    UIEdgeInsetsReplace();
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)usesMoreMenu
{
  int v2;
  void *v3;

  if (self->_role)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    +[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "usesFormatMenuInUnifiedTabBar") ^ 1;

  }
  return v2;
}

- (UIView)menuPopoverSourceView
{
  void *v2;
  void *v3;

  -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuPopoverSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (unint64_t)indexOfCenterItem
{
  return -[SFUnifiedTabBarLayout indexOfCenterItem](self->_layout, "indexOfCenterItem");
}

- (unint64_t)maximumNumberOfVisibleItems
{
  return -[SFUnifiedTabBarLayout maximumNumberOfVisibleItems](self->_layout, "maximumNumberOfVisibleItems");
}

- (id)newSearchField
{
  return objc_alloc_init(MEMORY[0x1E0DC3DB8]);
}

- (UITextField)searchField
{
  -[SFUnifiedTabBar layoutIfNeeded](self, "layoutIfNeeded");
  return self->_searchField;
}

- (BOOL)canCloseItem:(id)a3
{
  return 0;
}

- (void)_didSelectItemView:(id)a3 event:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSDate *v8;
  NSDate *lastTapToRevealActiveItemDate;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6
      && !-[SFUnifiedTabBarItemArrangement revealsSquishedActiveItem](self->_itemArrangement, "revealsSquishedActiveItem"))
    {
      v7 = -[SFUnifiedTabBarLayout activeItemIsSquished](self->_layout, "activeItemIsSquished");

      if (v7)
      {
        -[SFUnifiedTabBar _setRevealsSquishedActiveItem:animated:](self, "_setRevealsSquishedActiveItem:animated:", 1, 1);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastTapToRevealActiveItemDate = self->_lastTapToRevealActiveItemDate;
        self->_lastTapToRevealActiveItemDate = v8;

        goto LABEL_9;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v10, "isOccluded")
      || -[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded")
      || -[SFUnifiedTabBarLayout horizontalSpaceIsExtremelyConstrained](self->_layout, "horizontalSpaceIsExtremelyConstrained"))
    {
      -[SFUnifiedTabBar didSelectItem:](self, "didSelectItem:", v5);
    }
    else
    {
      -[SFUnifiedTabBar scrollToItem:animated:](self, "scrollToItem:animated:", v5, 1);
    }
  }
LABEL_9:

}

- (void)_hover:(id)a3
{
  UIScrollView *scrollView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  id v12;

  scrollView = self->_scrollView;
  v5 = a3;
  objc_msgSend(v5, "locationInView:", scrollView);
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(v5, "state");

  if ((unint64_t)(v10 - 1) > 1)
  {
    -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", 0, v7, v9);
  }
  else
  {
    -[SFUnifiedTabBarLayout itemAtPoint:](self->_layout, "itemAtPoint:", v7, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v12;
      else
        v11 = 0;
      -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", v11, v7, v9);
    }

  }
}

- (void)_updateHoveringItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFUnifiedTabBarLayout hoveringItem](self->_layout, "hoveringItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[SFUnifiedTabBarLayout setHoveringItem:](self->_layout, "setHoveringItem:", v6);
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)_layoutItems
{
  void *v3;

  -[SFUnifiedTabBarItemArrangement allItemIndexes](self->_itemArrangement, "allItemIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBar _layoutItemsAtIndexes:usingLayout:](self, "_layoutItemsAtIndexes:usingLayout:", v3, self->_layout);

  -[SFUnifiedTabBar _installSearchFieldIfNeeded](self, "_installSearchFieldIfNeeded");
  -[SFUnifiedTabBar _layOutPinnedItemsSeparator](self, "_layOutPinnedItemsSeparator");
}

- (void)_layoutItemsAtIndexes:(id)a3 usingLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke;
  v8[3] = &unk_1E21E4C40;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "enumerateLayoutForItemsAtIndexes:usingBlock:", a3, v8);

}

void __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, __int128 *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  id v15;
  void (**v16)(void *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v7 = a2;
  v8 = v7;
  if (*((_BYTE *)a4 + 56) || objc_msgSend(v7, "activeAnimationCount"))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "itemArrangement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_viewForItem:inArrangement:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 3221225472;
    v12 = *a4;
    v29 = a4[1];
    v13 = a4[3];
    v30 = a4[2];
    v31 = v13;
    v21 = MEMORY[0x1E0C809B0];
    v23 = __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke_2;
    v24 = &unk_1E21E4C18;
    v32 = *((_QWORD *)a4 + 8);
    v28 = v12;
    v14 = *(void **)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = v11;
    v27 = v14;
    v15 = v11;
    v16 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(&v21);
    v16[2](v16, v17, v18, v19, v20);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_discardViewForItem:", v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "setItemAtIndex:isVisible:", a3, *((unsigned __int8 *)a4 + 56), v21, v22, v23, v24, v25);
  objc_msgSend(*(id *)(a1 + 40), "setItemAtIndex:isOccluded:", a3, *((unsigned __int8 *)a4 + 57));

}

void __53__SFUnifiedTabBar__layoutItemsAtIndexes_usingLayout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[4];
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 72);
  v5 = *(_OWORD *)(a1 + 104);
  v9[2] = *(_OWORD *)(a1 + 88);
  v9[3] = v5;
  v10 = *(_QWORD *)(a1 + 120);
  v9[0] = *(_OWORD *)(a1 + 56);
  v9[1] = v4;
  objc_msgSend(v2, "_applyLayoutInfo:toItemView:", v9, v3);
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "itemArrangement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemTitles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTitleWhenCollapsedWithItemTitles:", v8);

  }
}

- (void)_applyLayoutInfo:(id *)a3 toItemView:(id)a4
{
  __int128 v5;
  id v6;
  double var3;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  _OWORD v11[3];

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v11[1] = v5;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v6 = a4;
  objc_msgSend(v6, "setTransform:", v11);
  objc_msgSend(v6, "setFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  objc_msgSend(v6, "setAlpha:", a3->var1);
  CGAffineTransformMakeScale(&v10, a3->var2, a3->var2);
  v9 = v10;
  objc_msgSend(v6, "setTransform:", &v9);
  var3 = a3->var3;
  objc_msgSend(v6, "_outermostLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setZPosition:", var3);

  objc_msgSend(v6, "setVisible:", a3->var4);
  objc_msgSend(v6, "setOccluded:", a3->var5);
  objc_msgSend(v6, "setSquishedInset:", a3->var6);

}

- (void)_layoutSquishedTitleContainer
{
  SFUnifiedTabBarItemTitleContainerView *squishedTitleContainer;
  double squishTransformFactor;
  double v5;
  double v6;
  double Width;
  double v8;
  CGRect v9;

  squishedTitleContainer = self->_squishedTitleContainer;
  if (squishedTitleContainer)
  {
    -[SFUnifiedTabBarItemTitleContainerView setHidden:](squishedTitleContainer, "setHidden:", self->_squishTransformFactor == 1.0);
    squishTransformFactor = self->_squishTransformFactor;
    if (squishTransformFactor != 1.0)
    {
      -[SFUnifiedTabBarItemTitleContainerView setAlpha:](self->_squishedTitleContainer, "setAlpha:", _SFClamp(squishTransformFactor * -2.0 + 1.5, 0.0, 1.0));
      -[SFUnifiedTabBar layoutMargins](self, "layoutMargins");
      v6 = v5;
      -[SFUnifiedTabBar bounds](self, "bounds");
      Width = CGRectGetWidth(v9);
      -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
      -[SFUnifiedTabBarItemTitleContainerView setFrame:](self->_squishedTitleContainer, "setFrame:", self->_squishedContentInset.left + 0.0, v6 + self->_squishedContentInset.top, Width - (self->_squishedContentInset.left + self->_squishedContentInset.right), v8 - (self->_squishedContentInset.top + self->_squishedContentInset.bottom));
    }
  }
}

- (CGRect)frameForTabBarItem:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SFUnifiedTabBarLayout frameForItem:](self->_layout, "frameForItem:", a3);
  -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)tabBarItemAtPoint:(CGPoint)a3
{
  SFUnifiedTabBarLayout *layout;
  void *v4;
  id v5;

  layout = self->_layout;
  -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, a3.x, a3.y);
  -[SFUnifiedTabBarLayout itemAtPoint:](layout, "itemAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)tabBarItemClosestToPoint:(CGPoint)a3
{
  SFUnifiedTabBarLayout *layout;

  layout = self->_layout;
  -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, a3.x, a3.y);
  return -[SFUnifiedTabBarLayout itemClosestToPoint:passingTest:](layout, "itemClosestToPoint:passingTest:", &__block_literal_global_37_0);
}

uint64_t __44__SFUnifiedTabBar_tabBarItemClosestToPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (UIEdgeInsets)_itemTouchInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[SFUnifiedTabBar layoutMargins](self, "layoutMargins");
  v3 = -v2;
  v5 = -v4;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v5;
  result.left = v6;
  result.top = v3;
  return result;
}

- (id)_currentLayoutConfiguration
{
  SFUnifiedTabBarLayoutConfiguration *v3;

  v3 = -[SFUnifiedTabBarLayoutConfiguration initWithScrollView:]([SFUnifiedTabBarLayoutConfiguration alloc], "initWithScrollView:", self->_scrollView);
  -[SFUnifiedTabBarLayoutConfiguration setBarMetrics:](v3, "setBarMetrics:", self->_barMetrics);
  -[SFUnifiedTabBarLayoutConfiguration setMidpointForCenteredContent:](v3, "setMidpointForCenteredContent:", self->_midpointForCenteredContent.x, self->_midpointForCenteredContent.y);
  -[SFUnifiedTabBarLayoutConfiguration setStandalone:](v3, "setStandalone:", -[SFUnifiedTabBar isStandalone](self, "isStandalone"));
  -[SFUnifiedTabBarLayoutConfiguration setFlipped:](v3, "setFlipped:", -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout") ^ 1);
  return v3;
}

- (void)setBarMetrics:(id)a3
{
  SFUnifiedTabBarMetrics *v5;

  v5 = (SFUnifiedTabBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    objc_storeStrong((id *)&self->_barMetrics, a3);
    -[SFUnifiedTabBarLayout setBarMetrics:](self->_layout, "setBarMetrics:", v5);
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateItemSizesIfNeeded
{
  if (-[SFUnifiedTabBarMetrics sizeClass](self->_barMetrics, "sizeClass") == self->_sizeClass)
  {
    -[SFUnifiedTabBarLayout updateItemSizesIfNeeded](self->_layout, "updateItemSizesIfNeeded");
  }
  else
  {
    -[SFUnifiedTabBarMetrics setSizeClass:](self->_barMetrics, "setSizeClass:");
    -[SFUnifiedTabBarLayout updateItemSizes](self->_layout, "updateItemSizes");
  }
}

- (void)_updateContentSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SFUnifiedTabBarLayout contentSize](self->_layout, "contentSize");
  v4 = v3;
  v6 = v5;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  if (v8 != v4 || v7 != v6)
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v6);
}

- (void)_didBeginScrollingAnimation
{
  ++self->_scrollingAnimationCount;
  -[SFUnifiedTabBar _updateScrolling](self, "_updateScrolling");
}

- (void)_didEndScrollingAnimation
{
  --self->_scrollingAnimationCount;
  -[SFUnifiedTabBar _updateScrolling](self, "_updateScrolling");
}

- (void)_updateScrolling
{
  _BOOL4 v3;
  _BOOL8 v4;

  v3 = -[UIScrollView isDragging](self->_scrollView, "isDragging") || self->_scrollingAnimationCount != 0;
  v4 = !v3;
  -[UIPointerInteraction setEnabled:](self->_pointerInteraction, "setEnabled:", v4);
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", v4);
  if (v4)
  {
    if (self->_tabHoverPreviewSnapshotsNeedUpdate)
    {
      -[SFTabHoverPreviewController setNeedsSnapshotUpdate](self->_tabHoverPreviewController, "setNeedsSnapshotUpdate");
      self->_tabHoverPreviewSnapshotsNeedUpdate = 0;
    }
  }
  else
  {
    -[SFTabHoverPreviewController cancel](self->_tabHoverPreviewController, "cancel");
  }
}

- (CGPoint)_adjustedContentOffsetForContentOffset:(CGPoint)a3 size:(CGSize)a4 contentSize:(CGSize)a5
{
  double width;
  double v6;
  CGFloat y;
  double x;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  width = a5.width;
  v6 = a4.width;
  y = a3.y;
  x = a3.x;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset", a3.x, a3.y, a4.width, a4.height, a5.width, a5.height);
  v10 = fmax(fmin(x + v9, width - v6), 0.0) - v9;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)registerReuseIdentifier:(id)a3 withItemViewProvider:(id)a4 configurationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFUnifiedTabBarItemViewRegistration *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SFUnifiedTabBarItemViewRegistration initWithViewProvider:configurationHandler:]([SFUnifiedTabBarItemViewRegistration alloc], "initWithViewProvider:configurationHandler:", v9, v8);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemViewRegistrationsByReuseIdentifier, "setObject:forKeyedSubscript:", v11, v10);
}

- (id)_viewForItem:(id)a3 inArrangement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIScrollView *v11;
  char v12;
  UIScrollView *v13;
  UIScrollView *scrollView;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "viewReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemViewRegistrationsByReuseIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueOrCreateViewForItem:isPreview:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReuseIdentifier:", v8);
  objc_msgSend(v9, "configureView:forItem:inArrangement:isPreview:", v10, v6, v7, 0);

  if (self->_tabHoverPreviewSnapshotsNeedUpdate)
  {
    self->_tabHoverPreviewSnapshotsNeedUpdate = 1;
  }
  else
  {
    objc_msgSend(v10, "superview");
    v11 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    if (v11 == self->_scrollView)
      v12 = objc_msgSend(v10, "isHidden");
    else
      v12 = 1;
    self->_tabHoverPreviewSnapshotsNeedUpdate = v12;

  }
  objc_msgSend(v10, "superview");
  v13 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_scrollView;

  if (v13 != scrollView)
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v10);
  objc_msgSend(v10, "setBarMetrics:", self->_barMetrics);
  objc_msgSend(v10, "setBarTheme:", self->_barTheme);
  -[SFUnifiedTabBar _backgroundCaptureGroupName](self, "_backgroundCaptureGroupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCutoutBorderCopyGroupName:", v15);

  objc_msgSend(v10, "setBarBackgroundAlpha:", self->_barBackgroundAlpha);
  objc_msgSend(v10, "setItemsNeedEraserBasedCutoutBorder:", self->_itemsNeedEraserBasedCutoutBorder);
  objc_msgSend(v10, "setThemeColorVisibility:", self->_themeColorVisibility);
  objc_msgSend(v10, "setSquishTransformFactor:", self->_squishTransformFactor);
  -[SFUnifiedTabBar _itemTouchInsets](self, "_itemTouchInsets");
  objc_msgSend(v10, "_setTouchInsets:");
  objc_msgSend(v10, "setHidden:", objc_msgSend(v6, "isHidden"));

  return v10;
}

- (void)_discardViewForItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "reusableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SFUnifiedTabBar _discardItemView:](self, "_discardItemView:", v4);
    objc_msgSend(v4, "setItem:", 0);
    objc_msgSend(v5, "setReusableView:", 0);
  }

}

- (void)_discardItemView:(id)a3
{
  NSMutableDictionary *itemViewRegistrationsByReuseIdentifier;
  void *v5;
  void *v6;
  SFUnifiedTabBarItemView *v7;

  v7 = (SFUnifiedTabBarItemView *)a3;
  -[SFUnifiedTabBarItemView setHidden:](v7, "setHidden:", 1);
  -[SFUnifiedTabBarItemView endEditing:](v7, "endEditing:", 0);
  if (self->_itemViewOwningSearchField == v7)
  {
    self->_itemViewOwningSearchField = 0;

  }
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  -[SFUnifiedBarItemView reuseIdentifier](v7, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](itemViewRegistrationsByReuseIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "enqueueItemView:", v7);
}

- (void)_discardViewsForIndexes:(id)a3 ofItems:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SFUnifiedTabBar__discardViewsForIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E21E4CA8;
  v4[4] = self;
  objc_msgSend(a4, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

uint64_t __51__SFUnifiedTabBar__discardViewsForIndexes_ofItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discardViewForItem:", a2);
}

- (void)_discardViewsForAnimatingItemsIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(v9, "reusableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isVisible") & 1) == 0 && !objc_msgSend(v9, "activeAnimationCount"))
          -[SFUnifiedTabBar _discardViewForItem:](self, "_discardViewForItem:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_didEndAnimationsForItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "activeAnimationCount") - 1);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    -[SFUnifiedTabBar _discardViewsForAnimatingItemsIfNeeded:](self, "_discardViewsForAnimatingItemsIfNeeded:", v5);
  }

}

- (UIView)itemContainerView
{
  return (UIView *)self->_scrollView;
}

- (id)viewForBarItem:(id)a3
{
  return (id)objc_msgSend(a3, "reusableView");
}

- (id)_firstFullyVisibleInactiveItem
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[SFUnifiedTabBarLayout visibleItems](self->_layout, "visibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SFUnifiedTabBar__firstFullyVisibleInactiveItem__block_invoke;
  v6[3] = &unk_1E21E4CD0;
  v6[4] = self;
  objc_msgSend(v3, "safari_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __49__SFUnifiedTabBar__firstFullyVisibleInactiveItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "reusableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isOccluded") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "activeItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v7 != v3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_backgroundCaptureGroupName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SFUnifiedTabBar.%p"), self);
}

- (void)_setUpBuiltInItemViewRegistrations
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_2;
  v6[3] = &unk_1E21E4D38;
  objc_copyWeak(&v7, &location);
  -[SFUnifiedTabBar registerReuseIdentifier:withItemViewProvider:configurationHandler:](self, "registerReuseIdentifier:withItemViewProvider:configurationHandler:", CFSTR("SFUnifiedTabBarItem"), &__block_literal_global_44_0, v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_3;
  v4[3] = &unk_1E21E4D60;
  objc_copyWeak(&v5, &location);
  -[SFUnifiedTabBar registerReuseIdentifier:withItemViewProvider:configurationHandler:](self, "registerReuseIdentifier:withItemViewProvider:configurationHandler:", CFSTR("SFPinnedOverflowItem"), v4, 0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

SFUnifiedTabBarItemView *__53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke()
{
  return objc_alloc_init(SFUnifiedTabBarItemView);
}

void __53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_configureTabBarItemView:forItem:inArrangement:isPreview:", v11, v10, v9, a5);

}

SFPinnedOverflowItemView *__53__SFUnifiedTabBar__setUpBuiltInItemViewRegistrations__block_invoke_3(uint64_t a1)
{
  SFPinnedOverflowItemView *v2;
  id WeakRetained;
  void *v4;

  v2 = objc_alloc_init(SFPinnedOverflowItemView);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[SFPinnedOverflowItemView setDelegate:](v2, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "_pinnedOverflowMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPinnedOverflowItemView setMenu:](v2, "setMenu:", v4);

  }
  return v2;
}

- (void)_configureTabBarItemView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  id v18;
  SFUnifiedTabBarItemTitleContainerView *squishedTitleContainer;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "activeItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setDelegate:", self);
  if (v12 == v10)
  {
    objc_msgSend(v21, "setActive:", -[SFUnifiedTabBar isStandalone](self, "isStandalone") ^ 1);
    objc_msgSend(v21, "setSelected:", 1);
    v13 = -[SFUnifiedTabBar canCloseItem:](self, "canCloseItem:", v10);
  }
  else
  {
    objc_msgSend(v21, "setActive:", 0);
    objc_msgSend(v21, "setSelected:", 0);
    v13 = 0;
  }
  objc_msgSend(v21, "setShowsCloseButton:", v13);
  objc_msgSend(v21, "setAccessoryButtonLayout:", -[SFUnifiedTabBar _itemViewAccessoryButtonLayout](self, "_itemViewAccessoryButtonLayout"));
  objc_msgSend(v11, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 1
     && -[SFUnifiedTabBar _centersContentForSingleItem](self, "_centersContentForSingleItem")
     || self->_role == 2;

  objc_msgSend(v21, "setContentAlignment:", v15);
  titleTextStyleForRole((id)self->_role);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitleTextStyle:", v16);

  objc_msgSend(v21, "setLockIconEdge:", self->_role == 0);
  objc_msgSend(v21, "setPlatterStyle:", -[SFUnifiedTabBar _platterStyleForTabBarItem:](self, "_platterStyleForTabBarItem:", v10));
  if (objc_msgSend(v10, "isPinned"))
    v17 = objc_msgSend(v11, "allowsScrollingPinnedItems");
  else
    v17 = 0;
  objc_msgSend(v21, "setShowsPinnedIndicator:", v17);
  if (!a6)
  {
    objc_msgSend(v21, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__didSelectItemView_event_, 0x2000);
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    squishedTitleContainer = 0;
    if (v18 == v10)
      squishedTitleContainer = self->_squishedTitleContainer;
    objc_msgSend(v21, "setSquishedTitleContainer:", squishedTitleContainer);

    objc_msgSend(v10, "menuButtonConfigurator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFormatMenuButtonConfigurator:", v20);

  }
}

- (id)_activeTabBarItemView
{
  id v2;
  void *v3;
  void *v4;

  if (self->_role == 2)
  {
    v2 = 0;
  }
  else
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reusableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v2 = v4;
    else
      v2 = 0;

  }
  return v2;
}

- (int64_t)_platterStyleForTabBarItem:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  if (self->_role == 1)
  {
    +[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "showRectangularTabsInSeparateBar"))
      v6 = 4;
    else
      v6 = 3;

  }
  else
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 7;
    if (v7 == v4)
      v8 = 8;
    v9 = 1;
    if (v7 == v4)
      v9 = 2;
    if (self->_role == 2)
      v6 = v8;
    else
      v6 = v9;
  }

  return v6;
}

- (int64_t)_itemViewAccessoryButtonLayout
{
  if (self->_role != 1)
    return 0;
  if (self->_searchFieldShowsFormatMenuButtonAccessories)
    return 2;
  return 1;
}

- (id)_prepareForResizeIfNeeded
{
  CGRect *p_lastLayoutFrame;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  SFUnifiedTabBarLayout *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  SFUnifiedTabBarLayout *v32;
  void *v33;
  SFUnifiedTabBarAnimatedResizingInfo *v34;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;

  v45 = *MEMORY[0x1E0C80C00];
  p_lastLayoutFrame = &self->_lastLayoutFrame;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], self->_lastLayoutFrame))
    goto LABEL_18;
  -[UIView ss_untransformedFrame](self, "ss_untransformedFrame");
  if (CGRectEqualToRect(v46, *p_lastLayoutFrame))
    goto LABEL_18;
  v4 = -[SFUnifiedTabBar _pinnedItemLimitForItemArrangement:](self, "_pinnedItemLimitForItemArrangement:", self->_unresolvedItemArrangement);
  if (!-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems")&& -[SFUnifiedTabBarItemArrangement pinnedItemLimit](self->_itemArrangement, "pinnedItemLimit") != v4)
  {
    -[SFUnifiedTabBarItemArrangement resolvedArrangementWithPinnedItemLimit:overflowItem:](self->_unresolvedItemArrangement, "resolvedArrangementWithPinnedItemLimit:overflowItem:", v4, self->_pinnedOverflowItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar _setResolvedItemArrangement:animated:keepingItemVisible:completionHandler:](self, "_setResolvedItemArrangement:animated:keepingItemVisible:completionHandler:", v5, 0, 0, 0);

  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
  if (v6 == 0.0)
  {
LABEL_18:
    v34 = 0;
  }
  else
  {
    -[SFUnifiedTabBar bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    -[SFUnifiedTabBar _currentLayoutConfiguration](self, "_currentLayoutConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    objc_msgSend(v11, "setVisibleRectOverride:");
    v12 = -[SFUnifiedTabBarLayout initWithItemArrangement:configuration:]([SFUnifiedTabBarLayout alloc], "initWithItemArrangement:configuration:", self->_itemArrangement, v11);
    -[SFUnifiedTabBar _targetContentOffsetForAnimatedResizeWithTargetLayout:](self, "_targetContentOffsetForAnimatedResizeWithTargetLayout:", v12);
    v14 = v13;
    v16 = v15;
    -[SFUnifiedTabBarLayout visibleItemIndexes](self->_layout, "visibleItemIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarLayout indexesOfItemsVisibleInRect:](v12, "indexesOfItemsVisibleInRect:", v14, v16, v8, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "removeIndexes:", v17);
    v37 = v17;
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v20, "addIndexes:", v19);
    v21 = (void *)MEMORY[0x1E0C99E60];
    -[SFUnifiedTabBarItemArrangement items](self->_itemArrangement, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    objc_msgSend(v22, "objectsAtIndexes:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "activeAnimationCount") + 1);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v27);
    }

    v30 = (void *)MEMORY[0x1E0DC3F10];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __44__SFUnifiedTabBar__prepareForResizeIfNeeded__block_invoke;
    v38[3] = &unk_1E21E2258;
    v38[4] = self;
    v31 = v19;
    v39 = v31;
    objc_msgSend(v30, "performWithoutAnimation:", v38);
    objc_msgSend(v11, "setVisibleRectOverride:", v14, v16, v8, v10);
    v32 = -[SFUnifiedTabBarLayout initWithItemArrangement:configuration:]([SFUnifiedTabBarLayout alloc], "initWithItemArrangement:configuration:", self->_itemArrangement, v11);

    if (!-[SFUnifiedTabBarLayout activeItemIsSquished](self->_layout, "activeItemIsSquished")
      && -[SFUnifiedTabBarLayout activeItemIsSquished](v32, "activeItemIsSquished"))
    {
      -[SFUnifiedTabBarItemArrangement arrangementWithActiveItemSquishState:](self->_unresolvedItemArrangement, "arrangementWithActiveItemSquishState:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v33, 0, 0, 0);

    }
    v34 = -[SFUnifiedTabBarAnimatedResizingInfo initWithItemsToKeepVisible:targetContentOffset:]([SFUnifiedTabBarAnimatedResizingInfo alloc], "initWithItemsToKeepVisible:targetContentOffset:", v25, v14, v16);

  }
  return v34;
}

uint64_t __44__SFUnifiedTabBar__prepareForResizeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutItemsAtIndexes:usingLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
}

- (CGPoint)_targetContentOffsetForAnimatedResizeWithTargetLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MinX;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double MaxX;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat rect;
  CGPoint result;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v4 = a3;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v6 = v5;
  v8 = v7;
  if (self->_pinsScrollPositionToTrailingEdgeDuringResize)
  {
    if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
    {
      -[UIView ss_untransformedFrame](self, "ss_untransformedFrame");
      MinX = CGRectGetMinX(v46);
      v6 = v6 + MinX - CGRectGetMinX(self->_lastLayoutFrame);
    }
  }
  else
  {
    -[SFUnifiedTabBar _firstFullyVisibleInactiveItem](self, "_firstFullyVisibleInactiveItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SFUnifiedTabBarLayout frameForItem:](self->_layout, "frameForItem:", v10);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      rect = v17;
      objc_msgSend(v4, "frameForItem:", v10);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      {
        v47.origin.x = v12;
        v47.origin.y = v14;
        v47.size.width = v16;
        v47.size.height = rect;
        v26 = CGRectGetMinX(v47);
        -[UIScrollView bounds](self->_scrollView, "bounds");
        v27 = v26 - CGRectGetMinX(v48);
        v49.origin.x = v19;
        v49.origin.y = v21;
        v49.size.width = v23;
        v49.size.height = v25;
        v6 = CGRectGetMinX(v49) - v27;
      }
      else
      {
        -[UIScrollView bounds](self->_scrollView, "bounds");
        v43 = v25;
        MaxX = CGRectGetMaxX(v50);
        v51.origin.x = v12;
        v51.origin.y = v14;
        v51.size.width = v16;
        v51.size.height = rect;
        v29 = MaxX - CGRectGetMaxX(v51);
        v52.origin.x = v19;
        v52.origin.y = v21;
        v52.size.width = v23;
        v52.size.height = v43;
        v30 = CGRectGetMaxX(v52) + v29;
        -[SFUnifiedTabBar bounds](self, "bounds");
        v6 = v30 - CGRectGetWidth(v53);
      }
    }

  }
  -[SFUnifiedTabBar bounds](self, "bounds", *(_QWORD *)&v43);
  v32 = v31;
  v34 = v33;
  objc_msgSend(v4, "contentSize");
  -[SFUnifiedTabBar _adjustedContentOffsetForContentOffset:size:contentSize:](self, "_adjustedContentOffsetForContentOffset:size:contentSize:", v6, v8, v32, v34, v35, v36);
  v38 = v37;
  v40 = v39;

  v41 = v38;
  v42 = v40;
  result.y = v42;
  result.x = v41;
  return result;
}

- (void)_beginTransitioningSearchField
{
  -[SFUnifiedTabBar _installSearchFieldIfNeeded](self, "_installSearchFieldIfNeeded");
  -[SFUnifiedTabBarItemView beginTransitioningSearchField](self->_itemViewOwningSearchField, "beginTransitioningSearchField");
  -[SFUnifiedTabBarItemView setShowsSearchField:](self->_itemViewOwningSearchField, "setShowsSearchField:", -[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded"));
  -[SFUnifiedTabBarItemView layoutIfNeeded](self->_itemViewOwningSearchField, "layoutIfNeeded");
}

- (void)_endTransitioningSearchFieldInItemView:(id)a3
{
  objc_msgSend(a3, "endTransitioningSearchField");
  -[SFUnifiedTabBar _uninstallSearchFieldIfNeeded](self, "_uninstallSearchFieldIfNeeded");
}

- (void)_installSearchFieldIfNeeded
{
  void *v3;
  char v4;
  SFUnifiedTabBarItemView *v5;
  SFUnifiedTabBarItemView *itemViewOwningSearchField;
  SFUnifiedTabBarItemView *v7;
  SFUnifiedTabBarItemView *v8;
  SFUnifiedTabBarItemView *v9;
  SFUnifiedTabBarItemView *v10;

  if (-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded"))
  {
    -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasOverlayConfiguration");

    if ((v4 & 1) == 0)
    {
      -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
      v5 = (SFUnifiedTabBarItemView *)objc_claimAutoreleasedReturnValue();
      itemViewOwningSearchField = self->_itemViewOwningSearchField;
      if (v5 != itemViewOwningSearchField)
      {
        v10 = v5;
        v7 = v5;
        v8 = self->_itemViewOwningSearchField;
        self->_itemViewOwningSearchField = v7;
        v9 = itemViewOwningSearchField;

        -[SFUnifiedTabBarItemView setSearchField:](v7, "setSearchField:", self->_searchField);
        -[SFUnifiedTabBarItemView setSearchField:](v9, "setSearchField:", 0);
        -[SFUnifiedTabBarItemView setShowsSearchField:](v9, "setShowsSearchField:", 0);
        -[SFUnifiedTabBarItemView layoutIfNeeded](v9, "layoutIfNeeded");

        v5 = v10;
      }

    }
  }
}

- (void)_uninstallSearchFieldIfNeeded
{
  SFUnifiedTabBarItemView *itemViewOwningSearchField;

  if (!-[SFUnifiedTabBarItemArrangement activeItemIsExpanded](self->_itemArrangement, "activeItemIsExpanded"))
  {
    -[SFUnifiedTabBarItemView setSearchField:](self->_itemViewOwningSearchField, "setSearchField:", 0);
    itemViewOwningSearchField = self->_itemViewOwningSearchField;
    self->_itemViewOwningSearchField = 0;

  }
}

- (id)dragPreviewForBarItem:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  int v7;
  SFUnifiedTabBarLayout *layout;
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
  double v20;
  NSMutableDictionary *itemViewRegistrationsByReuseIdentifier;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  UIScrollView *scrollView;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  CGAffineTransform v32;
  CGAffineTransform v33;

  v4 = a3;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v33.c = v5;
  *(_OWORD *)&v33.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SFUnifiedTabBarItemArrangement overflowPinnedItems](self->_itemArrangement, "overflowPinnedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  layout = self->_layout;
  if (v7)
  {
    -[SFUnifiedTabBarLayout frameForItem:](layout, "frameForItem:", self->_pinnedOverflowItem);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    CGAffineTransformMakeScale(&v33, 0.0, 0.0);
  }
  else
  {
    -[SFUnifiedTabBarLayout frameForItem:](layout, "frameForItem:", v4);
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  objc_msgSend(v4, "viewReuseIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](itemViewRegistrationsByReuseIdentifier, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "createItemView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "configureView:forItem:inArrangement:isPreview:", v24, v4, self->_itemArrangement, 1);
  objc_msgSend(v24, "setBarMetrics:", self->_barMetrics);
  objc_msgSend(v24, "setBarTheme:", self->_barTheme);
  objc_msgSend(v24, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v24, "layoutIfNeeded");
  v25 = objc_alloc(MEMORY[0x1E0DC3770]);
  scrollView = self->_scrollView;
  UIRectGetCenter();
  v32 = v33;
  v27 = (void *)objc_msgSend(v25, "initWithContainer:center:transform:", scrollView, &v32);
  v28 = objc_alloc(MEMORY[0x1E0DC3D88]);
  objc_msgSend(v24, "previewParameters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithView:parameters:target:", v24, v29, v27);

  return v30;
}

- (id)dragPreviewForBarItem:(id)a3 pinned:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *itemViewRegistrationsByReuseIdentifier;
  void *v8;
  void *v9;
  void *v10;
  SFUnifiedTabBarLayout *layout;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v4 = a4;
  v6 = a3;
  itemViewRegistrationsByReuseIdentifier = self->_itemViewRegistrationsByReuseIdentifier;
  objc_msgSend(v6, "viewReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](itemViewRegistrationsByReuseIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dequeueOrCreateViewForItem:isPreview:", v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureView:forItem:inArrangement:isPreview:", v10, v6, self->_itemArrangement, 1);
  -[UIView addSubview:](self->_dragPreviewContainer, "addSubview:", v10);
  objc_msgSend(v10, "setBarMetrics:", self->_barMetrics);
  objc_msgSend(v10, "setBarTheme:", self->_barTheme);
  layout = self->_layout;
  if (v4)
    v12 = -[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems") ^ 1;
  else
    v12 = 0;
  -[SFUnifiedTabBarLayout frameForPreviewingItem:pinned:](layout, "frameForPreviewingItem:pinned:", v6, v12);
  objc_msgSend(v10, "setFrame:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v4
       && -[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems");
    objc_msgSend(v10, "setShowsPinnedIndicator:", v13);
  }
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__SFUnifiedTabBar_dragPreviewForBarItem_pinned___block_invoke;
  v20[3] = &unk_1E21E2050;
  v21 = v10;
  v15 = v10;
  objc_msgSend(v14, "performWithoutAnimation:", v20);
  v16 = objc_alloc(MEMORY[0x1E0DC3760]);
  objc_msgSend(v15, "previewParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithView:parameters:", v15, v17);

  return v18;
}

uint64_t __48__SFUnifiedTabBar_dragPreviewForBarItem_pinned___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)cleanUpDragPreviewForBarItem:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "reusablePreviewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "setReusablePreviewView:", 0);
}

- (void)_layoutAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingLayout:(id)a5
{
  id v8;
  UIScrollView *scrollView;
  id v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a5;
  scrollView = self->_scrollView;
  v10 = a3;
  -[UIScrollView bounds](scrollView, "bounds");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__SFUnifiedTabBar__layoutAppearingItemsAtIndexes_withDistanceToScroll_usingLayout___block_invoke;
  v16[3] = &unk_1E21E4D88;
  v18 = v11 + a4;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v15, "enumerateInitialLayoutForAppearingItemsAtIndexes:withDistanceToScroll:usingBlock:", v10, v16, a4);

}

void __83__SFUnifiedTabBar__layoutAppearingItemsAtIndexes_withDistanceToScroll_usingLayout___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, uint64_t a7, uint64_t a8)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[4];
  uint64_t v22;
  CGRect v23;

  v14 = a2;
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  if (CGRectIntersectsRect(v23, *(CGRect *)(a1 + 48)))
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "itemArrangement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_viewForItem:inArrangement:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *(void **)(a1 + 32);
    v19 = *(_OWORD *)(a8 + 48);
    v21[2] = *(_OWORD *)(a8 + 32);
    v21[3] = v19;
    v22 = *(_QWORD *)(a8 + 64);
    v20 = *(_OWORD *)(a8 + 16);
    v21[0] = *(_OWORD *)a8;
    v21[1] = v20;
    objc_msgSend(v18, "_applyLayoutInfo:toItemView:", v21, v17);
    objc_msgSend(v17, "layoutIfNeeded");

  }
}

- (void)_layoutDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingLayout:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__SFUnifiedTabBar__layoutDisappearingItemsAtIndexes_withDistanceScrolled_usingLayout___block_invoke;
  v5[3] = &unk_1E21E4DB0;
  v5[4] = self;
  objc_msgSend(a5, "enumerateFinalLayoutForDisappearingItemsAtIndexes:withDistanceScrolled:usingBlock:", a3, v5, a4);
}

void __86__SFUnifiedTabBar__layoutDisappearingItemsAtIndexes_withDistanceScrolled_usingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  uint64_t v12;

  v6 = a2;
  objc_msgSend(v6, "reusableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_OWORD *)(a4 + 48);
    v11[2] = *(_OWORD *)(a4 + 32);
    v11[3] = v9;
    v12 = *(_QWORD *)(a4 + 64);
    v10 = *(_OWORD *)(a4 + 16);
    v11[0] = *(_OWORD *)a4;
    v11[1] = v10;
    objc_msgSend(v8, "_applyLayoutInfo:toItemView:", v11, v7);
    objc_msgSend(v7, "layoutIfNeeded");
    objc_msgSend(v6, "setReusableView:", 0);
    objc_msgSend(v7, "setItem:", 0);
  }

}

- (void)revealActiveItemIfNeeded
{
  -[SFUnifiedTabBar _setRevealsSquishedActiveItem:animated:](self, "_setRevealsSquishedActiveItem:animated:", 1, 1);
}

- (void)_setRevealsSquishedActiveItem:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;
  id v7;

  v4 = a4;
  v6 = a3 && -[SFUnifiedTabBarLayout activeItemIsSquished](self->_layout, "activeItemIsSquished");
  if (v6 != -[SFUnifiedTabBarItemArrangement revealsSquishedActiveItem](self->_itemArrangement, "revealsSquishedActiveItem"))
  {
    -[SFUnifiedTabBarItemArrangement arrangementWithActiveItemSquishState:](self->_unresolvedItemArrangement, "arrangementWithActiveItemSquishState:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBar setItemArrangement:animated:keepingItemVisible:completionHandler:](self, "setItemArrangement:animated:keepingItemVisible:completionHandler:", v7, v4, 0, 0);

  }
}

- (CGRect)pinnedItemDropArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SFUnifiedTabBarLayout pinnedItemDropArea](self->_layout, "pinnedItemDropArea");
  -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_layOutPinnedItemsSeparator
{
  void *v3;
  uint64_t v4;
  UIView **p_pinnedItemsSeparator;
  double v6;
  double v7;

  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SFUnifiedTabBarLayout pinnedItemsSeparatorFrame](self->_layout, "pinnedItemsSeparatorFrame");
    p_pinnedItemsSeparator = &self->_pinnedItemsSeparator;
    -[UIView setFrame:](self->_pinnedItemsSeparator, "setFrame:");
    -[SFUnifiedTabBarLayout pinnedItemsSeparatorOpacity](self->_layout, "pinnedItemsSeparatorOpacity");
    v7 = v6 * SFBarContentAlphaForSquishTransformFactor(self->_squishTransformFactor);
  }
  else
  {
    p_pinnedItemsSeparator = &self->_pinnedItemsSeparator;
    v7 = 0.0;
  }
  -[UIView setAlpha:](*p_pinnedItemsSeparator, "setAlpha:", v7);
}

- (void)_updatePinnedItemsSeparator
{
  -[SFUnifiedTabBar _setUpPinnedItemsSeparatorIfNeeded](self, "_setUpPinnedItemsSeparatorIfNeeded");
  -[SFUnifiedTabBar _tearDownPinnedItemsSeparatorIfNeeded](self, "_tearDownPinnedItemsSeparatorIfNeeded");
}

- (void)_setUpPinnedItemsSeparatorIfNeeded
{
  void *v3;
  uint64_t v4;
  UIView *v5;
  UIView *pinnedItemsSeparator;
  void *v7;
  double v8;
  void *v9;

  if (!self->_pinnedItemsSeparator)
  {
    -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      pinnedItemsSeparator = self->_pinnedItemsSeparator;
      self->_pinnedItemsSeparator = v5;

      -[SFUnifiedBarTheme separatorColor](self->_barTheme, "separatorColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_pinnedItemsSeparator, "setBackgroundColor:", v7);

      +[SFUnifiedBarMetrics separatorWidth](SFUnifiedBarMetrics, "separatorWidth");
      -[UIView _setCornerRadius:](self->_pinnedItemsSeparator, "_setCornerRadius:", v8 * 0.5);
      -[SFUnifiedTabBarLayout pinnedItemsSeparatorFrame](self->_layout, "pinnedItemsSeparatorFrame");
      -[UIView setFrame:](self->_pinnedItemsSeparator, "setFrame:");
      -[UIView setAlpha:](self->_pinnedItemsSeparator, "setAlpha:", 0.0);
      -[UIView layer](self->_pinnedItemsSeparator, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setZPosition:", -1.79769313e308);

      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_pinnedItemsSeparator);
    }
  }
}

- (void)_tearDownPinnedItemsSeparatorIfNeeded
{
  void *v3;
  uint64_t v4;
  UIView *pinnedItemsSeparator;

  -[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[UIView removeFromSuperview](self->_pinnedItemsSeparator, "removeFromSuperview");
    pinnedItemsSeparator = self->_pinnedItemsSeparator;
    self->_pinnedItemsSeparator = 0;

  }
}

- (id)_pinnedOverflowMenu
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC39D0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke;
  v5[3] = &unk_1E21E4E28;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "safari_menuWithUncachedChildrenProvider:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[81], "overflowPinnedItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_2;
    v7[3] = &unk_1E21E4E00;
    objc_copyWeak(&v8, v1);
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v8);

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

id __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_3;
  v6[3] = &unk_1E21E4DD8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v3, "menuElementRepresentationWithSelectionHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  return v4;
}

void __38__SFUnifiedTabBar__pinnedOverflowMenu__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didSelectItem:", v3);

}

- (unint64_t)_pinnedItemLimitForItemArrangement:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  CGRect v8;

  v4 = a3;
  -[SFUnifiedTabBar bounds](self, "bounds");
  v5 = +[SFUnifiedTabBarLayout pinnedItemLimitForItemArrangement:tabBarWidth:barMetrics:standalone:](SFUnifiedTabBarLayout, "pinnedItemLimitForItemArrangement:tabBarWidth:barMetrics:standalone:", v4, self->_barMetrics, -[SFUnifiedTabBar isStandalone](self, "isStandalone"), CGRectGetWidth(v8));
  objc_msgSend(v4, "pinnedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_60);
  return v5 + v4;
}

uint64_t __54__SFUnifiedTabBar__pinnedItemLimitForItemArrangement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPlaceholder");
}

- (void)setRole:(int64_t)a3
{
  if (self->_role != a3)
  {
    self->_role = a3;
    -[UIScrollView setDelaysContentTouches:](self->_scrollView, "setDelaysContentTouches:", -[SFUnifiedTabBar _shouldDelayContentTouches](self, "_shouldDelayContentTouches"));
  }
}

- (BOOL)isStandalone
{
  return self->_role == 2;
}

- (void)setSearchFieldShowsFormatMenuButtonAccessories:(BOOL)a3
{
  if (self->_searchFieldShowsFormatMenuButtonAccessories != a3)
  {
    self->_searchFieldShowsFormatMenuButtonAccessories = a3;
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)searchFieldShowsPersistentStopReloadButton
{
  void *v2;
  char v3;

  -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsPersistentStopReloadButton");

  return v3;
}

- (BOOL)_centersContentForSingleItem
{
  return self->_role != 2;
}

- (BOOL)_shouldDelayContentTouches
{
  return (self->_role & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setBarBackgroundAlpha:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_barBackgroundAlpha != a3)
  {
    self->_barBackgroundAlpha = a3;
    -[_UIVisualEffectBackdropView setRenderMode:](self->_backgroundCaptureView, "setRenderMode:", a3 < 1.0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SFUnifiedTabBarLayout visibleItems](self->_layout, "visibleItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "reusableView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBarBackgroundAlpha:", a3);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setBarTheme:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_barTheme, a3);
  objc_msgSend(v5, "titleTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView setTheme:](self->_squishedTitleContainer, "setTheme:", v6);

  -[SFUnifiedTabBarItemTitleContainerView setShowsPrivateAnnotation:](self->_squishedTitleContainer, "setShowsPrivateAnnotation:", objc_msgSend(v5, "isPrivate"));
  objc_msgSend(v5, "separatorColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_pinnedItemsSeparator, "setBackgroundColor:", v7);

  -[SFUnifiedTabBar _updateMinimizedProgressViewFillColor](self, "_updateMinimizedProgressViewFillColor");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIScrollView subviews](self->_scrollView, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "setBarTheme:", v5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)setContentInset:(NSDirectionalEdgeInsets)a3
{
  if (a3.leading != self->_contentInset.leading
    || a3.top != self->_contentInset.top
    || a3.trailing != self->_contentInset.trailing
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  if (self->_midpointForCenteredContent.x != a3.x || self->_midpointForCenteredContent.y != a3.y)
  {
    self->_midpointForCenteredContent = a3;
    -[SFUnifiedTabBarLayout setMidpointForCenteredContent:](self->_layout, "setMidpointForCenteredContent:");
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)preferredSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SFUnifiedTabBar _preferredWidth](self, "_preferredWidth");
  v4 = v3;
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)_preferredWidth
{
  double result;

  if (self->_role != 1)
    return 1.79769313e308;
  -[SFUnifiedTabBarMetrics maximumActiveItemWidth](self->_barMetrics, "maximumActiveItemWidth");
  return result;
}

- (void)setSizeClass:(unint64_t)a3
{
  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setThemeColorVisibility:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_themeColorVisibility != a3)
  {
    self->_themeColorVisibility = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SFUnifiedTabBarLayout visibleItems](self->_layout, "visibleItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "reusableView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setThemeColorVisibility:", a3);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setSquishTransformFactor:(double)a3
{
  double squishTransformFactor;
  char v5;
  _BOOL4 v6;

  squishTransformFactor = self->_squishTransformFactor;
  if (squishTransformFactor != a3)
  {
    v5 = (a3 == 1.0) ^ (squishTransformFactor != 1.0);
    v6 = squishTransformFactor != 0.0 && a3 == 0.0;
    self->_squishTransformFactor = a3;
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
    if ((v5 & 1) == 0)
      -[SFUnifiedTabBar setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    if (v6)
      -[SFUnifiedTabBar _setRevealsSquishedActiveItem:animated:](self, "_setRevealsSquishedActiveItem:animated:", 1, 0);
  }
}

- (void)setSquishedContentInset:(UIEdgeInsets)a3
{
  if (self->_squishedContentInset.left != a3.left
    || self->_squishedContentInset.top != a3.top
    || self->_squishedContentInset.right != a3.right
    || self->_squishedContentInset.bottom != a3.bottom)
  {
    self->_squishedContentInset = a3;
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)squishedAccessoryViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  -[SFUnifiedTabBarItemTitleContainerView squishedAccessoryViews](self->_squishedTitleContainer, "squishedAccessoryViews");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  if (self->_minimizedProgressView)
  {
    objc_msgSend(v6, "arrayByAddingObject:");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  return (NSArray *)v6;
}

- (void)_updateMinimizedProgressViewFillColor
{
  id v3;

  -[_SFBarTheme controlsTintColor](self->_barTheme, "controlsTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFFluidProgressView setProgressBarFillColor:](self->_minimizedProgressView, "setProgressBarFillColor:", v3);

}

- (void)_updateShowsMinimizedProgressView
{
  -[_SFFluidProgressView setHidden:](self->_minimizedProgressView, "setHidden:", -[_SFFluidProgressView isShowingProgress](self->_minimizedProgressView, "isShowingProgress") ^ 1);
}

- (void)setMinimizedProgressView:(id)a3
{
  _SFFluidProgressView *v5;
  _SFFluidProgressView *v6;

  v5 = (_SFFluidProgressView *)a3;
  if (self->_minimizedProgressView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_minimizedProgressView, a3);
    -[_SFFluidProgressView setDelegate:](self->_minimizedProgressView, "setDelegate:", self);
    -[SFUnifiedTabBar _updateShowsMinimizedProgressView](self, "_updateShowsMinimizedProgressView");
    -[SFUnifiedTabBar _updateMinimizedProgressViewFillColor](self, "_updateMinimizedProgressViewFillColor");
    v5 = v6;
  }

}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_showsSquishedAccessoryViews = a3;
  -[SFUnifiedTabBarItemTitleContainerView setShowsSquishedAccessoryViews:](self->_squishedTitleContainer, "setShowsSquishedAccessoryViews:");
  -[SFUnifiedTabBar _activeTabBarItemView](self, "_activeTabBarItemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsSquishedAccessoryViews:", v3);

}

- (BOOL)isCurrentlyScrollable
{
  return (self->_role | 2) == 2
      && -[SFUnifiedTabBarLayout isCurrentlyScrollable](self->_layout, "isCurrentlyScrollable");
}

- (double)preferredSquishedBottomSpacing
{
  SFUnifiedTabBarItemTitleContainerView *squishedTitleContainer;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  squishedTitleContainer = self->_squishedTitleContainer;
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  -[SFUnifiedTabBarItemTitleContainerView urlBaselineToBottomBoundsDistanceForHeight:](squishedTitleContainer, "urlBaselineToBottomBoundsDistanceForHeight:");
  v4 = v3;
  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  v6 = v5;
  +[SFUnifiedBarMetrics defaultSquishedContentSpacing](SFUnifiedBarMetrics, "defaultSquishedContentSpacing");
  return v7 - v4 * v6;
}

- (void)tabBarItemViewDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4
{
  void (**v5)(_QWORD);
  NSObject *v6;
  id WeakRetained;

  v5 = (void (**)(_QWORD))a4;
  if (-[UITextField isFirstResponder](self->_searchField, "isFirstResponder"))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPencilInput();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SFUnifiedTabBar tabBarItemViewDidRequestFocusForPencilInput:completionHandler:].cold.1(v6);
    v5[2](v5);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "unifiedTabBarURLTapped:completionHandler:", self, v5);

  }
}

- (void)tabBarItemViewCloseButtonTapped:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SFUnifiedTabBar closeItem:](self, "closeItem:", v4);
    v4 = v5;
  }

}

- (void)tabBarItemViewMenuButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarMenuButtonTapped:", self);

}

- (void)tabBarItemViewMenuButtonReceivedTouchDown:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarMenuButtonReceivedTouchDown:", self);

}

- (void)tabBarItemViewMenuButtonClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarMenuButtonClicked:", self);

}

- (void)tabBarItemViewVoiceSearchButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarVoiceSearchButtonTapped:", self);

}

- (void)tabBarItemViewReloadButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarReloadButtonTapped:", self);

}

- (void)tabBarItemViewStopButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarStopButtonTapped:", self);

}

- (void)tabBarItemViewReaderButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarReaderButtonTapped:", self);

}

- (void)tabBarItemViewTranslationButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarTranslationButtonTapped:", self);

}

- (void)tabBarItemViewMediaStateMuteButtonTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "unifiedTabBar:didTapMediaStateMuteButtonForItem:", self, v5);

  }
}

- (void)tabBarItemView:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBar:extensionButtonTapped:extension:", self, v9, v7);

}

- (void)tabBarItemView:(id)a3 multipleExtensionButtonTapped:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBar:multipleExtensionButtonTapped:", self, v6);

}

- (BOOL)tabBarItemViewCanBecomeFocused:(id)a3
{
  return self->_squishTransformFactor == 1.0;
}

- (void)tabBarItemView:(id)a3 didUpdateHovering:(BOOL)a4
{
  _BOOL4 v4;
  SFUnifiedTabBar *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a4;
  objc_msgSend(a3, "item");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = self;
    v7 = v10;
LABEL_5:
    -[SFUnifiedTabBar _updateHoveringItem:](v6, "_updateHoveringItem:", v7);
    v9 = v10;
    goto LABEL_6;
  }
  -[SFUnifiedTabBarLayout hoveringItem](self->_layout, "hoveringItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 == v10)
  {
    v6 = self;
    v7 = 0;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)tabBarItemView:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBar:didFinishShowingAvailabilityLabelOfType:", self, a4);

}

- (void)tabBarItemViewTitleChanged:(id)a3
{
  -[SFUnifiedTabBarItemArrangement setNeedsUpdateCachedItemTitles](self->_itemArrangement, "setNeedsUpdateCachedItemTitles", a3);
  if (!self->_isLayingOut)
    -[SFUnifiedTabBar setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)tabBarItemViewShouldAnnotateWithTabEntity:(id)a3
{
  return self->_role != 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  NSDate *lastTapToRevealActiveItemDate;
  double v5;
  id WeakRetained;

  -[SFUnifiedTabBar _updateScrolling](self, "_updateScrolling", a3);
  lastTapToRevealActiveItemDate = self->_lastTapToRevealActiveItemDate;
  if (!lastTapToRevealActiveItemDate
    || (-[NSDate safari_timeIntervalUntilNow](lastTapToRevealActiveItemDate, "safari_timeIntervalUntilNow"), v5 > 0.1))
  {
    -[SFUnifiedTabBar _setRevealsSquishedActiveItem:animated:](self, "_setRevealsSquishedActiveItem:animated:", 0, 1);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarWillBeginDragging:", self);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;

  -[SFUnifiedTabBar _updateScrolling](self, "_updateScrolling", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unifiedTabBarDidEndDragging:", self);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id WeakRetained;

  if (!a4)
  {
    -[SFUnifiedTabBar _updateScrolling](self, "_updateScrolling", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dragObserver);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "unifiedTabBarDidEndDragging:", self);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  SFUnifiedTabBarLayout *layout;
  void *v11;
  void *v12;
  SFUnifiedTabBarPointerRegionIdentifier *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  CGPoint v38;
  CGRect v39;

  objc_msgSend(a4, "location", a3);
  v7 = v6;
  v9 = v8;
  -[UIScrollView frame](self->_scrollView, "frame");
  v38.x = v7;
  v38.y = v9;
  if (CGRectContainsPoint(v39, v38))
  {
    layout = self->_layout;
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self, v7, v9);
    -[SFUnifiedTabBarLayout itemAtPoint:](layout, "itemAtPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reusableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        -[SFUnifiedTabBar convertPoint:toView:](self, "convertPoint:toView:", v13, v7, v9);
        -[SFUnifiedTabBarPointerRegionIdentifier pointerRegionIdentifierForInteractionLocation:](v13, "pointerRegionIdentifierForInteractionLocation:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "viewForPreview");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frame");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          objc_msgSend(v15, "viewForPreview");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", v26, v18, v20, v22, v24);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;

          objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", v15, v28, v30, v32, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }

      }
      else
      {
        v13 = objc_alloc_init(SFUnifiedTabBarPointerRegionIdentifier);
        -[SFUnifiedTabBarPointerRegionIdentifier setViewForPreview:](v13, "setViewForPreview:", v12);
        -[SFUnifiedTabBarPointerRegionIdentifier setPointerStyle:](v13, "setPointerStyle:", 3);
        v36 = (void *)MEMORY[0x1E0DC3B28];
        objc_msgSend(v12, "bounds");
        -[SFUnifiedTabBar convertRect:fromView:](self, "convertRect:fromView:", v12);
        objc_msgSend(v36, "regionWithRect:identifier:", v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v9);
    switch(objc_msgSend(v8, "pointerStyle"))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUnifiedBarMetrics defaultItemHeight](self->_barMetrics, "defaultItemHeight");
        v13 = v12;
        objc_msgSend(v9, "bounds");
        v15 = fmax(v14, v13);
        v17 = fmin(v16, v13);
        objc_msgSend(v9, "center");
        v57.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
        v57.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
        v58 = CGRectInset(v57, 2.0 - v15 * 0.5, 2.0 - v17 * 0.5);
        x = v58.origin.x;
        y = v58.origin.y;
        width = v58.size.width;
        height = v58.size.height;
        v22 = (void *)MEMORY[0x1E0DC3B30];
        -[SFUnifiedBarMetrics itemCornerRadius](self->_barMetrics, "itemCornerRadius");
        v24 = v23 + -2.0;
        goto LABEL_9;
      case 1:
        objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v9;
        objc_msgSend(v27, "superview");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "frame");
        objc_msgSend(v28, "convertRect:fromView:", v27);
        x = v30;
        y = v31;
        width = v32;
        height = v33;

        v34 = (void *)MEMORY[0x1E0DC3B30];
        v24 = 3.0;
        goto LABEL_10;
      case 2:
        objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v9;
        objc_msgSend(v35, "superview");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "imageView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "frame");
        objc_msgSend(v36, "convertRect:fromView:", v35);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;

        v59.origin.x = v39;
        v59.origin.y = v41;
        v59.size.width = v43;
        v59.size.height = v45;
        v46 = CGRectGetWidth(v59);
        v60.origin.x = v39;
        v60.origin.y = v41;
        v60.size.width = v43;
        v60.size.height = v45;
        v47 = CGRectGetHeight(v60);
        v48 = fmax(v46, v47) + 8.0;
        v49 = (v46 - v48) * 0.5;
        v50 = (v47 - v48) * 0.5;
        v61.origin.x = v39;
        v61.origin.y = v41;
        v61.size.width = v43;
        v61.size.height = v45;
        v62 = CGRectInset(v61, v49, v50);
        v34 = (void *)MEMORY[0x1E0DC3B30];
        v24 = 3.0;
        goto LABEL_11;
      case 3:
        objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0DC3B30];
        objc_msgSend(v9, "frame");
        x = v51;
        y = v52;
        width = v53;
        height = v54;
        -[SFUnifiedBarMetrics itemCornerRadius](self->_barMetrics, "itemCornerRadius");
        v24 = v55;
LABEL_9:
        v34 = v22;
LABEL_10:
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
LABEL_11:
        objc_msgSend(v34, "shapeWithRoundedRect:cornerRadius:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v26 = 0;
        v11 = 0;
        break;
    }
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v11, v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "nextFocusedView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SFUnifiedTabBar scrollToItem:animated:](self, "scrollToItem:animated:", v6, 1);

}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SFUnifiedTabBarItemArrangement activeItem](self->_itemArrangement, "activeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reusableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (double)barBackgroundAlpha
{
  return self->_barBackgroundAlpha;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (NSDirectionalEdgeInsets)contentInset
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInset.top;
  leading = self->_contentInset.leading;
  bottom = self->_contentInset.bottom;
  trailing = self->_contentInset.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CGPoint)midpointForCenteredContent
{
  double x;
  double y;
  CGPoint result;

  x = self->_midpointForCenteredContent.x;
  y = self->_midpointForCenteredContent.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)pinsScrollPositionToTrailingEdgeDuringResize
{
  return self->_pinsScrollPositionToTrailingEdgeDuringResize;
}

- (void)setPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3
{
  self->_pinsScrollPositionToTrailingEdgeDuringResize = a3;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (double)squishTransformFactor
{
  return self->_squishTransformFactor;
}

- (UIEdgeInsets)squishedContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_squishedContentInset.top;
  left = self->_squishedContentInset.left;
  bottom = self->_squishedContentInset.bottom;
  right = self->_squishedContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (BOOL)itemsNeedEraserBasedCutoutBorder
{
  return self->_itemsNeedEraserBasedCutoutBorder;
}

- (SFUnifiedTabBarDragObserving)dragObserver
{
  return (SFUnifiedTabBarDragObserving *)objc_loadWeakRetained((id *)&self->_dragObserver);
}

- (void)setDragObserver:(id)a3
{
  objc_storeWeak((id *)&self->_dragObserver, a3);
}

- (SFUnifiedTabBarNavigationDelegate)navigationDelegate
{
  return (SFUnifiedTabBarNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (int64_t)role
{
  return self->_role;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (void)setContentHidden:(BOOL)a3
{
  self->_contentHidden = a3;
}

- (BOOL)searchFieldShowsFormatMenuButtonAccessories
{
  return self->_searchFieldShowsFormatMenuButtonAccessories;
}

- (SFTabHoverPreviewController)tabHoverPreviewController
{
  return self->_tabHoverPreviewController;
}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabHoverPreviewController, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_destroyWeak((id *)&self->_dragObserver);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_unresolvedItemArrangement, 0);
  objc_storeStrong((id *)&self->_lastTapToRevealActiveItemDate, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_dragPreviewContainer, 0);
  objc_storeStrong((id *)&self->_pinnedOverflowItem, 0);
  objc_storeStrong((id *)&self->_pinnedItemsSeparator, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_searchFieldPopoverAlignmentView, 0);
  objc_storeStrong((id *)&self->_itemViewOwningSearchField, 0);
  objc_storeStrong((id *)&self->_squishedTitleContainer, 0);
  objc_storeStrong((id *)&self->_itemViewRegistrationsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)tabBarItemViewDidRequestFocusForPencilInput:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Search field is already first responder, early returning", v1, 2u);
}

@end
