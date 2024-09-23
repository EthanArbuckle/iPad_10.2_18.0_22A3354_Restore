@implementation SFUnifiedBar

- (SFUnifiedBar)initWithFrame:(CGRect)a3
{
  SFUnifiedBar *v3;
  SFUnifiedBarItemArrangement *v4;
  SFUnifiedBarItemArrangement *itemArrangement;
  SFUnifiedBarContentArrangement *v6;
  SFUnifiedBarContentArrangement *contentArrangement;
  SFUnifiedBarMetrics *v8;
  void *v9;
  uint64_t v10;
  SFUnifiedBarMetrics *barMetrics;
  SFThemeColorEffectView *v12;
  void *v13;
  uint64_t v14;
  SFThemeColorEffectView *backgroundView;
  UIView *v16;
  UIView *leadingItemContainerView;
  UIView *v18;
  id v19;
  UIView *v20;
  UIView *trailingItemContainerView;
  UIView *v22;
  id v23;
  UIView *v24;
  UIView *squishedContentView;
  _SFCompressedBarButton *v26;
  UIButton *squishedBarButton;
  uint64_t v28;
  NSMutableSet *itemViewsToRemoveOnNextLayout;
  void *v30;
  void *v31;
  id v32;
  SFUnifiedBar *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SFUnifiedBar;
  v3 = -[SFUnifiedBar initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[SFUnifiedBar setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", defaultLayoutMargins());
    -[SFUnifiedBar setEdgesInsettingLayoutMarginsFromSafeArea:](v3, "setEdgesInsettingLayoutMarginsFromSafeArea:", 10);
    -[SFUnifiedBar setMaximumContentSizeCategory:](v3, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    v4 = objc_alloc_init(SFUnifiedBarItemArrangement);
    itemArrangement = v3->_itemArrangement;
    v3->_itemArrangement = v4;

    v6 = objc_alloc_init(SFUnifiedBarContentArrangement);
    contentArrangement = v3->_contentArrangement;
    v3->_contentArrangement = v6;

    v8 = [SFUnifiedBarMetrics alloc];
    -[SFUnifiedBar traitCollection](v3, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFUnifiedBarMetrics initWithTraitCollection:](v8, "initWithTraitCollection:", v9);
    barMetrics = v3->_barMetrics;
    v3->_barMetrics = (SFUnifiedBarMetrics *)v10;

    v12 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SFThemeColorEffectView initWithEffect:](v12, "initWithEffect:", v13);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFThemeColorEffectView *)v14;

    -[SFThemeColorEffectView setThemeColorVisibility:](v3->_backgroundView, "setThemeColorVisibility:", 1.0);
    -[SFUnifiedBar addSubview:](v3, "addSubview:", v3->_backgroundView);
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    leadingItemContainerView = v3->_leadingItemContainerView;
    v3->_leadingItemContainerView = v16;

    v18 = v3->_leadingItemContainerView;
    v19 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIView addInteraction:](v18, "addInteraction:", v19);

    -[SFUnifiedBar addSubview:](v3, "addSubview:", v3->_leadingItemContainerView);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    trailingItemContainerView = v3->_trailingItemContainerView;
    v3->_trailingItemContainerView = v20;

    v22 = v3->_trailingItemContainerView;
    v23 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[UIView addInteraction:](v22, "addInteraction:", v23);

    -[SFUnifiedBar addSubview:](v3, "addSubview:", v3->_trailingItemContainerView);
    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    squishedContentView = v3->_squishedContentView;
    v3->_squishedContentView = v24;

    -[UIView setHidden:](v3->_squishedContentView, "setHidden:", 1);
    -[SFUnifiedBar addSubview:](v3, "addSubview:", v3->_squishedContentView);
    v26 = objc_alloc_init(_SFCompressedBarButton);
    squishedBarButton = v3->_squishedBarButton;
    v3->_squishedBarButton = &v26->super;

    -[UIButton setSpringLoaded:](v3->_squishedBarButton, "setSpringLoaded:", 1);
    -[UIButton addTarget:action:forControlEvents:](v3->_squishedBarButton, "addTarget:action:forControlEvents:", v3, sel_squishedBarTapped, 64);
    -[UIView addSubview:](v3->_squishedContentView, "addSubview:", v3->_squishedBarButton);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    itemViewsToRemoveOnNextLayout = v3->_itemViewsToRemoveOnNextLayout;
    v3->_itemViewsToRemoveOnNextLayout = (NSMutableSet *)v28;

    +[SFUnifiedBarTheme defaultTheme](SFUnifiedBarTheme, "defaultTheme");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBar setBarTheme:](v3, "setBarTheme:", v30);

    +[SFUnifiedBarMetrics traitsAffectingBarMetrics](SFUnifiedBarMetrics, "traitsAffectingBarMetrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)-[SFUnifiedBar registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v31, v3, sel__updateBarMetricsForTraitChange);

    v33 = v3;
  }

  return v3;
}

- (void)_updateBarMetricsForTraitChange
{
  SFUnifiedBarMetrics *barMetrics;
  void *v4;

  barMetrics = self->_barMetrics;
  -[SFUnifiedBar traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(barMetrics) = -[SFUnifiedBarMetrics updateWithTraitCollection:](barMetrics, "updateWithTraitCollection:", v4);

  if ((_DWORD)barMetrics)
  {
    self->_needsNotifyMetricsDidChange = 1;
    -[SFUnifiedBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBar;
  -[SFUnifiedBar didMoveToSuperview](&v5, sel_didMoveToSuperview);
  -[SFUnifiedBar superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_SFBarTheme controlsTintColor](self->_barTheme, "controlsTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBar setTintColor:](self, "setTintColor:", v4);

  }
  else
  {
    -[SFUnifiedBar setTintColor:](self, "setTintColor:", 0);
  }

}

- (void)setItemArrangement:(id)a3
{
  -[SFUnifiedBar setItemArrangement:animated:](self, "setItemArrangement:animated:", a3, 0);
}

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4
{
  id v7;
  SFUnifiedBarItemArrangement **p_itemArrangement;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;

  v7 = a3;
  p_itemArrangement = &self->_itemArrangement;
  if (!-[SFUnifiedBarItemArrangement isEqual:](self->_itemArrangement, "isEqual:", v7))
  {
    -[SFUnifiedBarItemArrangement leadingItems](*p_itemArrangement, "leadingItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "differenceFromArray:withOptions:", v9, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_removalIndexes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBarItemArrangement trailingItems](*p_itemArrangement, "trailingItems");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)v12;
    objc_msgSend(v13, "differenceFromArray:withOptions:", v12, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_removalIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_itemArrangement, a3);
    -[SFUnifiedBar setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(v11, "safari_insertionIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBar _layoutIndexes:ofItems:alongEdge:transitioning:](self, "_layoutIndexes:ofItems:alongEdge:transitioning:", v15, v10, 0, 1);

    objc_msgSend(v14, "safari_insertionIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedBar _layoutIndexes:ofItems:alongEdge:transitioning:](self, "_layoutIndexes:ofItems:alongEdge:transitioning:", v16, v13, 1, 1);

    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0DC3F10];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __44__SFUnifiedBar_setItemArrangement_animated___block_invoke;
      v26[3] = &unk_1E21E3698;
      v26[4] = self;
      v27 = v20;
      v28 = v9;
      v29 = v18;
      v30 = v19;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__SFUnifiedBar_setItemArrangement_animated___block_invoke_2;
      v21[3] = &unk_1E21E5368;
      v21[4] = self;
      v22 = v27;
      v23 = v28;
      v24 = v29;
      v25 = v30;
      objc_msgSend(v17, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 98, v26, v21);

    }
    else
    {
      -[SFUnifiedBar _setNeedsRemovalForViewsAtIndexes:ofItems:](self, "_setNeedsRemovalForViewsAtIndexes:ofItems:", v20, v9);
      -[SFUnifiedBar _setNeedsRemovalForViewsAtIndexes:ofItems:](self, "_setNeedsRemovalForViewsAtIndexes:ofItems:", v18, v19);
    }

  }
}

uint64_t __44__SFUnifiedBar_setItemArrangement_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutIndexes:ofItems:alongEdge:transitioning:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_layoutIndexes:ofItems:alongEdge:transitioning:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, 1);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __44__SFUnifiedBar_setItemArrangement_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeViewsForIndexes:ofItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_removeViewsForIndexes:ofItems:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)setContentArrangement:(id)a3
{
  id v5;
  SFUnifiedBarContentArrangement *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SFUnifiedBarContentArrangement *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_contentArrangement;
  if (!-[SFUnifiedBarContentArrangement isEqual:](v6, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_contentArrangement, a3);
    v32 = v6;
    -[SFUnifiedBarContentArrangement allContentViews](v6, "allContentViews");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allContentViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v7;
    objc_msgSend(v30, "differenceFromArray:withOptions:", v7, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v8, "removals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "object");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFUnifiedBar _uninstallContentView:](self, "_uninstallContentView:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v11);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v8, "insertions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "object");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFUnifiedBar _installContentView:](self, "_installContentView:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v17);
    }
    v29 = v8;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = v5;
    objc_msgSend(v5, "standaloneContentViews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v27, "barMetrics");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setMetricsCategory:", 1);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v24 |= objc_msgSend(v27, "showsSquishedContent");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v23);
    }
    else
    {
      LOBYTE(v24) = 0;
    }

    self->_hasSquishedStandaloneContentView = v24 & 1;
    -[SFUnifiedBar setNeedsLayout](self, "setNeedsLayout");

    v6 = v32;
    v5 = v33;
  }

}

- (void)_installContentView:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SFUnifiedBar _backgroundAlpha](self, "_backgroundAlpha");
      objc_msgSend(v4, "setBarBackgroundAlpha:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setBarTheme:", self->_barTheme);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setSizeClass:", self->_sizeClass);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SFUnifiedBar _themeColorVisibility](self, "_themeColorVisibility");
      objc_msgSend(v4, "setThemeColorVisibility:");
    }
    objc_msgSend(v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[SFUnifiedBar insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v4, self->_backgroundView);
    -[SFUnifiedBar setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_uninstallContentView:(id)a3
{
  if (a3)
    objc_msgSend(a3, "removeFromSuperview");
}

- (BOOL)inlineContentViewPinsScrollPositionToTrailingEdgeDuringResize
{
  void *v2;
  char v3;

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "pinsScrollPositionToTrailingEdgeDuringResize");
  else
    v3 = 0;

  return v3;
}

- (void)setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPinsScrollPositionToTrailingEdgeDuringResize:", v3);

}

- (void)_layoutItems:(id)a3 alongEdge:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  int *v11;
  id v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  CGRect v41;

  v6 = (void *)MEMORY[0x1E0CB36B8];
  v7 = a3;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBar _layoutIndexes:ofItems:alongEdge:transitioning:](self, "_layoutIndexes:ofItems:alongEdge:transitioning:", v8, v7, a4, 0);
  v10 = v9;

  v11 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  if (!a4)
    v11 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  v12 = *(id *)((char *)&self->super.super.super.isa + *v11);
  v13 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[SFUnifiedBar bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[SFUnifiedBar layoutMargins](self, "layoutMargins");
  v25 = v24;
  if (v13 == a4)
  {
    v26 = v23;
    v41.origin.x = v15;
    v41.origin.y = v17;
    v41.size.width = v19;
    v41.size.height = v21;
    v27 = CGRectGetWidth(v41) - v10 - v26;
  }
  else
  {
    v27 = v22;
  }
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v29 = v28;
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v40[0] = *MEMORY[0x1E0C9BAA8];
  v40[1] = v30;
  v40[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v12, "setTransform:", v40);
  objc_msgSend(v12, "setFrame:", v27, v25, v10, v29);
  -[SFUnifiedBar _inlineContentSquishAnchorPoint](self, "_inlineContentSquishAnchorPoint");
  v32 = v31;
  v34 = v33;
  -[SFUnifiedBar squishTransformFactor](self, "squishTransformFactor");
  v36 = v35;
  -[SFUnifiedBar _squishVerticalOffset](self, "_squishVerticalOffset");
  makeSquishTransform((uint64_t)v39, v32, v34, v36, v37);
  v38[0] = v39[0];
  v38[1] = v39[1];
  v38[2] = v39[2];
  objc_msgSend(v12, "setTransform:", v38);

}

- (double)_layoutIndexes:(id)a3 ofItems:(id)a4 alongEdge:(int64_t)a5 transitioning:(BOOL)a6
{
  id v10;
  id v11;
  int *v12;
  id v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  double v25;
  _QWORD v27[4];
  id v28;
  SFUnifiedBar *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;

  v10 = a3;
  v11 = a4;
  v12 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  if (!a5)
    v12 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  v13 = *(id *)((char *)&self->super.super.super.isa + *v12);
  v14 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v16 = v15;
  -[SFUnifiedBar _itemSpacing](self, "_itemSpacing");
  v18 = v17;
  -[SFUnifiedBar squishTransformFactor](self, "squishTransformFactor");
  v20 = v19;
  if (v14)
    v21 = 0;
  else
    v21 = 2;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__SFUnifiedBar__layoutIndexes_ofItems_alongEdge_transitioning___block_invoke;
  v27[3] = &unk_1E21E5390;
  v33 = v18;
  v36 = v14;
  v22 = v11;
  v28 = v22;
  v29 = self;
  v32 = &v38;
  v34 = v16;
  v23 = v10;
  v30 = v23;
  v37 = a6;
  v24 = v13;
  v31 = v24;
  v35 = v20;
  objc_msgSend(v22, "enumerateObjectsWithOptions:usingBlock:", v21, v27);
  v25 = v39[3];

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __63__SFUnifiedBar__layoutIndexes_ofItems_alongEdge_transitioning___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  BOOL v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  _OWORD v32[3];
  CGAffineTransform v33;
  CGAffineTransform v34;

  v5 = a2;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(double *)(a1 + 72);
  objc_msgSend(v6, "preferredWidth");
  if (v8 <= 0.0)
    v9 = 40.0;
  else
    v9 = v8;
  v10 = objc_msgSend(v5, "spacingOptions");

  if ((v10 & 1) == 0)
    goto LABEL_15;
  if (!*(_BYTE *)(a1 + 96))
  {
    if (a3)
    {
      v11 = *(void **)(a1 + 32);
      v12 = a3 - 1;
      goto LABEL_10;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  if (a3 + 1 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
    goto LABEL_11;
  v11 = *(void **)(a1 + 32);
  v12 = a3 + 1;
LABEL_10:
  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  if ((objc_msgSend(v13, "spacingOptions") & 2) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "minimumItemSpacing");
    v7 = v14 * 0.5;
  }

LABEL_15:
  v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (*(_BYTE *)(a1 + 96))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v17 = v9;
    if (a3 + 1 == v16)
      goto LABEL_22;
    v18 = *(_BYTE *)(a1 + 96) == 0;
  }
  else
  {
    v18 = 1;
  }
  v19 = -0.0;
  if (a3 != 0 || !v18)
    v19 = v7;
  v17 = v9 + v19;
LABEL_22:
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v17
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24);
  if (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3))
  {
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v29 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v34.c = v27;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v34.tx = v25;
    if (*(_BYTE *)(a1 + 97))
    {
      +[SFUnifiedBarMetrics transitioningItemScale](SFUnifiedBarMetrics, "transitioningItemScale");
      *(_OWORD *)&v33.a = v29;
      *(_OWORD *)&v33.c = v27;
      *(_OWORD *)&v33.tx = v25;
      CGAffineTransformScale(&v34, &v33, v20, v20);
    }
    v21 = -fmax((44.0 - v9) * 0.5, 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "removeObject:", v6, v25, v27, v29);
    objc_msgSend(*(id *)(a1 + 56), "addSubview:", v6);
    objc_msgSend(v6, "setBarMetrics:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416));
    objc_msgSend(v6, "setBarTheme:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 512));
    objc_msgSend(v6, "setSquishTransformFactor:", *(double *)(a1 + 88));
    v32[0] = v30;
    v32[1] = v28;
    v32[2] = v26;
    objc_msgSend(v6, "setTransform:", v32);
    objc_msgSend(v6, "setFrame:", _SFRoundRectToPixels(v15));
    v22 = 1.0;
    if (*(_BYTE *)(a1 + 97))
      v22 = 0.0;
    objc_msgSend(v6, "setAlpha:", v22);
    v31 = v34;
    objc_msgSend(v6, "setTransform:", &v31);
    v23 = (double)(char)-*(_BYTE *)(a1 + 97);
    objc_msgSend(v6, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setZPosition:", v23);

    objc_msgSend(v6, "_setTouchInsets:", 0.0, v21, 0.0, v21);
    objc_msgSend(v6, "layoutIfNeeded");
  }

}

- (void)layoutSubviews
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double contentUnderStatusBarHeight;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SFUnifiedBar;
  -[SFUnifiedBar layoutSubviews](&v24, sel_layoutSubviews);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_itemViewsToRemoveOnNextLayout;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v20);
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_itemViewsToRemoveOnNextLayout, "removeAllObjects");
  -[SFUnifiedBar _updateSizeClass](self, "_updateSizeClass");
  -[SFUnifiedBarItemArrangement leadingItems](self->_itemArrangement, "leadingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBar _layoutItems:alongEdge:](self, "_layoutItems:alongEdge:", v8, 0);

  -[SFUnifiedBarItemArrangement trailingItems](self->_itemArrangement, "trailingItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBar _layoutItems:alongEdge:](self, "_layoutItems:alongEdge:", v9, 1);

  -[SFUnifiedBar bounds](self, "bounds");
  v11 = v10;
  contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  v14 = v13 + 0.0;
  v16 = v15 - contentUnderStatusBarHeight;
  v18 = v17 - (0.0 - contentUnderStatusBarHeight);
  -[SFThemeColorEffectView setFrame:](self->_backgroundView, "setFrame:", v13 + 0.0, v15 - contentUnderStatusBarHeight, v11, v18);
  -[UIView setFrame:](self->_squishedContentView, "setFrame:", v14, v16, v11, v18);
  -[UIView bounds](self->_squishedContentView, "bounds");
  -[UIButton setFrame:](self->_squishedBarButton, "setFrame:");
  -[SFUnifiedBar squishTransformFactor](self, "squishTransformFactor");
  -[SFUnifiedBar _setShowsSquishedContent:](self, "_setShowsSquishedContent:", _SFEqualWithEpsilon(v19, 0.0, 0.01));
  -[SFUnifiedBar _layOutInlineContentView](self, "_layOutInlineContentView");
  -[SFUnifiedBar _layOutStandaloneContentViews](self, "_layOutStandaloneContentViews");
  if (self->_needsNotifyMetricsDidChange)
  {
    self->_needsNotifyMetricsDidChange = 0;
    -[SFUnifiedBar metricsDidChange](self, "metricsDidChange");
  }
}

- (void)_layOutInlineContentView
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
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int *v20;
  int *v21;
  id v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  CGFloat v50;
  double v51;
  __int128 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double MidX;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat Width;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat rect;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  _OWORD v84[3];
  _OWORD v85[3];
  _OWORD v86[4];
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_36;
  -[SFUnifiedBar bounds](self, "bounds");
  v77 = v5;
  v78 = v4;
  v82 = v7;
  v83 = v6;
  -[SFUnifiedBar directionalLayoutMargins](self, "directionalLayoutMargins");
  v79 = v9;
  v80 = v8;
  -[SFUnifiedBar layoutMargins](self, "layoutMargins");
  v74 = v10;
  v75 = v11;
  -[SFUnifiedBar squishTransformFactor](self, "squishTransformFactor");
  v81 = v12;
  v13 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[SFUnifiedBarItemArrangement leadingItems](self->_itemArrangement, "leadingItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedBarItemArrangement trailingItems](self->_itemArrangement, "trailingItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v18 = v15;
  else
    v18 = v17;
  if (v13)
    v19 = v17;
  else
    v19 = v15;
  if (v13)
    v20 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  else
    v20 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  if (v13)
    v21 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  else
    v21 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  v22 = v18;
  v23 = v19;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "ss_untransformedFrame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v21), "ss_untransformedFrame");
  v33 = v32;
  rect = v34;
  v36 = v35;
  v38 = v37;
  -[SFUnifiedBar _itemSpacing](self, "_itemSpacing");
  v40 = v39;
  if (!v22)
  {
    v42 = v77;
    v41 = v74;
    if (v23)
      goto LABEL_16;
LABEL_18:
    v44 = v78;
    v89.origin.x = v78;
    v89.origin.y = v42;
    v89.size.height = v82;
    v89.size.width = v83;
    v43 = CGRectGetWidth(v89) - v75;
    goto LABEL_19;
  }
  v87.origin.x = v25;
  v87.origin.y = v27;
  v87.size.width = v29;
  v87.size.height = v31;
  v41 = v40 + CGRectGetMaxX(v87);
  v42 = v77;
  if (!v23)
    goto LABEL_18;
LABEL_16:
  v88.origin.x = v33;
  v88.origin.y = rect;
  v88.size.width = v36;
  v88.size.height = v38;
  v43 = CGRectGetMinX(v88) - v40;
  v44 = v78;
LABEL_19:
  if ((objc_msgSend(v22, "spacingOptions") & 4) != 0)
    v41 = v41 + 6.0;
  if ((objc_msgSend(v23, "spacingOptions") & 4) != 0)
    v43 = v43 + -6.0;
  objc_msgSend(v3, "preferredSize");
  if (v45 == 1.79769313e308)
    goto LABEL_27;
  -[SFUnifiedBarItemArrangement leadingItems](self->_itemArrangement, "leadingItems");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");
  -[SFUnifiedBarItemArrangement trailingItems](self->_itemArrangement, "trailingItems");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47 != objc_msgSend(v48, "count"))
  {
    v50 = v44;
    v51 = v42;

    goto LABEL_29;
  }
  v49 = -[SFUnifiedBarItemArrangement allowsCenteringInlineContentView](self->_itemArrangement, "allowsCenteringInlineContentView");

  if (!v49)
  {
LABEL_27:
    v50 = v44;
    v51 = v42;
  }
  else
  {
    v90.origin.x = v44;
    v90.origin.y = v42;
    v90.size.width = v83;
    v90.size.height = v82;
    v41 = fmax(v41, CGRectGetWidth(v90) - v43);
    v50 = v44;
    v91.origin.x = v44;
    v51 = v42;
    v91.origin.y = v42;
    v91.size.width = v83;
    v91.size.height = v82;
    CGRectGetWidth(v91);
  }
LABEL_29:
  v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v86[0] = *MEMORY[0x1E0C9BAA8];
  v86[1] = v52;
  v86[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v86);
  objc_msgSend(v3, "setFrame:", _SFRoundRectToPixels(v41));
  -[SFUnifiedBar _inlineContentSquishAnchorPoint](self, "_inlineContentSquishAnchorPoint");
  v54 = v53;
  v56 = v55;
  -[SFUnifiedBar _squishVerticalOffset](self, "_squishVerticalOffset");
  makeSquishTransform((uint64_t)v85, v54, v56, v81, v57);
  v84[0] = v85[0];
  v84[1] = v85[1];
  v84[2] = v85[2];
  objc_msgSend(v3, "setTransform:", v84);
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 0.0, v80, 0.0, v79);
  v58 = v51;
  v59 = v50;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    UIRectGetCenter();
    objc_msgSend(v3, "convertPoint:fromView:", self);
    objc_msgSend(v3, "setMidpointForCenteredContent:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setSquishTransformFactor:", v81);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFUnifiedBar layoutMargins](self, "layoutMargins");
    v61 = v60;
    v63 = v62;
    +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
    v65 = _SFInterpolate(v64, 1.0, v81);
    v92.origin.x = v50;
    v92.origin.y = v58;
    v92.size.width = v83;
    v92.size.height = v82;
    MidX = CGRectGetMidX(v92);
    -[SFUnifiedBar convertPoint:toView:](self, "convertPoint:toView:", v3, _SFInterpolate(MidX, v61, v65), 0.0);
    v68 = v67;
    v93.origin.x = v50;
    v93.origin.y = v58;
    v93.size.width = v83;
    v93.size.height = v82;
    v69 = CGRectGetMidX(v93);
    v94.size.width = v83;
    v70 = v69;
    v94.origin.x = v59;
    v94.origin.y = v58;
    v94.size.height = v82;
    Width = CGRectGetWidth(v94);
    -[SFUnifiedBar convertPoint:toView:](self, "convertPoint:toView:", v3, _SFInterpolate(v70, Width - v63, v65), 0.0);
    v73 = v72;
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "setSquishedContentInset:", 0.0, v68, 0.0, CGRectGetWidth(v95) - v73);
  }
  objc_msgSend(v3, "layoutIfNeeded");

LABEL_36:
}

- (void)_layOutStandaloneContentViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[3];
  double v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0.0;
  -[SFUnifiedBar directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  -[SFUnifiedBar _inlineContentHeight](self, "_inlineContentHeight");
  v6 = v4 + v5;
  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v7);
  v9 = v6 + v8;

  v13 = v9;
  -[SFUnifiedBarContentArrangement standaloneContentViews](self->_contentArrangement, "standaloneContentViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SFUnifiedBar__layOutStandaloneContentViews__block_invoke;
  v11[3] = &unk_1E21E53B8;
  v11[4] = self;
  v11[5] = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  _Block_object_dispose(v12, 8);
}

double __45__SFUnifiedBar__layOutStandaloneContentViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "_layOutStandaloneContentView:atIndex:minY:", a2, a3, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (double)_layOutStandaloneContentView:(id)a3 atIndex:(unint64_t)a4 minY:(double)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SFUnifiedBarContentArrangement *contentArrangement;
  void *v15;
  void *v16;
  int v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat Width;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v43;
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  CGRect v47;
  CGRect v48;

  v8 = a3;
  -[SFUnifiedBar directionalLayoutMargins](self, "directionalLayoutMargins");
  v10 = v9;
  v43 = v11;
  -[SFUnifiedBar squishTransformFactor](self, "squishTransformFactor");
  v13 = v12;
  contentArrangement = self->_contentArrangement;
  if (a4)
  {
    -[SFUnifiedBarContentArrangement standaloneContentViews](contentArrangement, "standaloneContentViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a4 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SFUnifiedBarContentArrangement inlineContentView](contentArrangement, "inlineContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v8, "isContentHidden");
  else
    v17 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v8, "showsSquishedContent");
  else
    v18 = 0;
  v19 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v16);
    v21 = v20;
    objc_msgSend(v8, "preferredTopSpacing");
    v19 = v22 - v21;
  }
  objc_msgSend(v8, "preferredSize");
  v24 = v23;
  v25 = v19 + a5;
  -[SFUnifiedBar bounds](self, "bounds");
  Width = CGRectGetWidth(v47);
  if (v17)
  {
    v48.origin.x = 0.0;
    v48.origin.y = v25;
    v48.size.width = Width;
    v48.size.height = v24;
    CGRectGetHeight(v48);
  }
  if ((v18 & 1) == 0)
  {
    -[SFUnifiedBar expandedHeight](self, "expandedHeight");
    v28 = v27;
    -[SFUnifiedBar squishedHeight](self, "squishedHeight");
    _SFInterpolate(v28 + v29, 0.0, v13);
    +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  }
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v46[0] = *MEMORY[0x1E0C9BAA8];
  v46[1] = v30;
  v46[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v8, "setTransform:", v46);
  objc_msgSend(v8, "setFrame:", _SFRoundRectToPixels(0.0));
  -[SFUnifiedBar _squishAnchorPointForStandaloneContentViewAtIndex:](self, "_squishAnchorPointForStandaloneContentViewAtIndex:", a4);
  v32 = v31;
  v34 = v33;
  -[SFUnifiedBar _squishVerticalOffset](self, "_squishVerticalOffset");
  makeSquishTransform((uint64_t)v45, v32, v34, v13, v35);
  v44[0] = v45[0];
  v44[1] = v45[1];
  v44[2] = v45[2];
  objc_msgSend(v8, "setTransform:", v44);
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 0.0, v10, 0.0, v43);
  v36 = (double)a4;
  objc_msgSend(v8, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setZPosition:", v36);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "setContentInset:", 0.0, v10, 0.0, v43);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFUnifiedBar bounds](self, "bounds");
    UIRectGetCenter();
    objc_msgSend(v8, "convertPoint:fromView:", self);
    objc_msgSend(v8, "setMidpointForCenteredContent:");
  }
  v38 = objc_opt_respondsToSelector();
  if ((v38 & 1) != 0)
    objc_msgSend(v8, "setSquishTransformFactor:", v13);
  if ((v17 & 1) != 0)
  {
    v39 = 0.0;
    objc_msgSend(v8, "setAlpha:", 0.0);
    objc_msgSend(v8, "layoutIfNeeded");
  }
  else
  {
    v40 = 1.0;
    if (((v38 | v18) & 1) == 0)
      v40 = SFBarContentAlphaForSquishTransformFactor(v13);
    objc_msgSend(v8, "setAlpha:", v40);
    objc_msgSend(v8, "layoutIfNeeded");
    -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v8);
    v39 = v19 + v24 + v41;
  }

  return v39;
}

- (double)_spacingBelowContentView:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v11;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preferredBottomSpacing");
  }
  else
  {
    -[SFUnifiedBarContentArrangement standaloneContentViews](self->_contentArrangement, "standaloneContentViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (v8 == v4)
    {
      -[SFUnifiedBar layoutMargins](self, "layoutMargins");
      v9 = v11;
      goto LABEL_8;
    }
    -[SFUnifiedBar _contentViewSpacing](self, "_contentViewSpacing");
  }
  v9 = v5;
LABEL_8:

  return v9;
}

- (double)_squishedInlineContentTopOverflow
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

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredSize");
  v5 = v4;
  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  v7 = v6;
  -[SFUnifiedBarMetrics squishedInlineBarHeight](self->_barMetrics, "squishedInlineBarHeight");
  v9 = -(v8 - v5 * v7) * 0.5;
  -[SFUnifiedBar _squishVerticalOffset](self, "_squishVerticalOffset");
  v11 = v10 + v9;

  return v11;
}

- (CGPoint)_squishAnchorPointForStandaloneContentViewAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  CGPoint result;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6;
  v21[4] = __Block_byref_object_dispose__6;
  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[SFUnifiedBarContentArrangement standaloneContentViews](self->_contentArrangement, "standaloneContentViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke_53;
  v12[3] = &unk_1E21E5420;
  v13 = &__block_literal_global_32;
  v14 = v21;
  v15 = &v17;
  v16 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  -[SFUnifiedBar _inlineContentSquishAnchorPoint](self, "_inlineContentSquishAnchorPoint");
  v7 = v6;
  v9 = v8 + _SFRoundFloatToPixels(v18[3]);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

double __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a2, "preferredSize");
  v3 = v2;
  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  return v3 - v3 * v4;
}

void __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke_53(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v8 = a2;
  if (a1[7] == a3)
    *a4 = 1;
  v16 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "showsSquishedContent"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "preferredSize");
    v10 = v9;
    objc_msgSend(v16, "preferredSize");
    v12 = v10 * 0.5 + v11 * 0.5;
    v13 = (*(double (**)(void))(a1[4] + 16))() * 0.5;
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24)
                                                 + v12
                                                 - (v13
                                                  + (*(double (**)(void))(a1[4] + 16))() * 0.5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "preferredSquishedBottomSpacing");
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v14 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "topSquishedSpacingAdjustment");
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) - v15;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }

}

- (void)setMarginLevel:(unint64_t)a3
{
  double v4;
  int IsPad;

  if (self->_marginLevel != a3)
  {
    self->_marginLevel = a3;
    if (a3 == 2)
    {
      v4 = 4.0;
    }
    else if (a3 == 1)
    {
      IsPad = _SFDeviceIsPad();
      v4 = 4.0;
      if (!IsPad)
        v4 = 7.0;
    }
    else
    {
      if (a3)
      {
LABEL_10:
        -[SFUnifiedBar setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      v4 = defaultLayoutMargins();
    }
    -[SFUnifiedBar setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v4);
    goto LABEL_10;
  }
}

- (void)_setNeedsRemovalForViewsAtIndexes:(id)a3 ofItems:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SFUnifiedBar__setNeedsRemovalForViewsAtIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E21E4CA8;
  v4[4] = self;
  objc_msgSend(a4, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

void __58__SFUnifiedBar__setNeedsRemovalForViewsAtIndexes_ofItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  objc_msgSend(a2, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_removeViewsForIndexes:(id)a3 ofItems:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SFUnifiedBar__removeViewsForIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E21E4CA8;
  v4[4] = self;
  objc_msgSend(a4, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

void __47__SFUnifiedBar__removeViewsForIndexes_ofItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "leadingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v6) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "trailingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");
LABEL_4:

  }
}

- (double)_itemSpacing
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void (**v10)(void *, void *, _QWORD);
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD aBlock[7];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  CGRect v27;
  CGRect v28;

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "preferredSize");
    v5 = v4;
  }
  else
  {
    v5 = 1.79769313e308;
  }
  -[SFUnifiedBarMetrics minimumItemSpacing](self->_barMetrics, "minimumItemSpacing");
  v7 = v6;
  -[SFUnifiedBarMetrics maximumItemSpacing](self->_barMetrics, "maximumItemSpacing");
  v9 = v8;
  -[SFUnifiedBar bounds](self, "bounds");
  if (v5 <= CGRectGetWidth(v27))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__SFUnifiedBar__itemSpacing__block_invoke;
    aBlock[3] = &unk_1E21E5470;
    *(double *)&aBlock[6] = v7;
    aBlock[4] = &v19;
    aBlock[5] = &v23;
    v10 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    -[SFUnifiedBarItemArrangement leadingItems](self->_itemArrangement, "leadingItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, 0);

    -[SFUnifiedBarItemArrangement trailingItems](self->_itemArrangement, "trailingItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12, 1);

    -[SFUnifiedBar layoutMargins](self, "layoutMargins");
    v14 = v13;
    v16 = v15;
    -[SFUnifiedBar bounds](self, "bounds");
    v7 = fmax(v7, fmin(v9, (CGRectGetWidth(v28) - v14 - v16 - v5 - v20[3]) / (double)v24[3]));

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v7;
}

void __28__SFUnifiedBar__itemSpacing__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL4 v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3 == 1;
  v6 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__SFUnifiedBar__itemSpacing__block_invoke_2;
  v8[3] = &unk_1E21E5448;
  v11 = a3;
  v9 = v6;
  v12 = *(_QWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 32);
  v7 = v6;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2 * v5, v8);

}

void __28__SFUnifiedBar__itemSpacing__block_invoke_2(uint64_t a1, void *a2, char *a3)
{
  void *v5;
  double v6;
  void *v7;
  char *v8;
  unint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredWidth");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

  if (!*(_QWORD *)(a1 + 56))
  {
    v9 = (unint64_t)(a3 + 1);
    if (v9 >= objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      a3 = 0;
      goto LABEL_8;
    }
    v7 = *(void **)(a1 + 32);
    v8 = (char *)v9;
    goto LABEL_6;
  }
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3 - 1;
LABEL_6:
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    a3 = (char *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  if ((objc_msgSend(v10, "spacingOptions") & 1) != 0 && (objc_msgSend(a3, "spacingOptions") & 2) != 0)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 64) * 0.5
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

- (double)_contentViewSpacing
{
  double result;

  result = 12.0;
  if (self->_marginLevel - 1 < 2)
    return 10.0;
  return result;
}

- (double)_inlineContentHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[SFUnifiedBarMetrics itemHeight](self->_barMetrics, "itemHeight");
  v4 = v3;
  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSize");
  v7 = fmax(v4, v6);

  return v7;
}

- (void)_updateSizeClass
{
  double Width;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  NSString *v9;
  NSComparisonResult v10;
  unint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26 = *MEMORY[0x1E0C80C00];
  -[SFUnifiedBar bounds](self, "bounds");
  Width = CGRectGetWidth(v27);
  -[SFUnifiedBar _screen](self, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetWidth(v28);

  -[SFUnifiedBar _screen](self, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v29);

  if (v7 <= 1366.0)
  {
    if (Width != v5)
    {
LABEL_13:
      v11 = 2;
      goto LABEL_14;
    }
LABEL_11:
    if (_SFDeviceIsPad())
    {
      -[SFUnifiedBar window](self, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (unint64_t)(objc_msgSend(v14, "interfaceOrientation") - 1) < 2;

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  -[SFUnifiedBar traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]);

  if (v10 == NSOrderedDescending)
    v11 = 3;
  else
    v11 = 2;
  if (v10 != NSOrderedDescending && Width == v5)
    goto LABEL_11;
LABEL_14:
  if (self->_sizeClass != v11)
  {
    self->_sizeClass = v11;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[SFUnifiedBarContentArrangement allContentViews](self->_contentArrangement, "allContentViews", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "setSizeClass:", v11);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

  }
}

- (double)expandedHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SFUnifiedBar layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[SFUnifiedBar _inlineContentHeight](self, "_inlineContentHeight");
  v6 = v4 + v5;
  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v7);
  v9 = v6 + v8;

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SFUnifiedBarContentArrangement standaloneContentViews](self->_contentArrangement, "standaloneContentViews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v16, "isContentHidden") & 1) == 0)
        {
          objc_msgSend(v16, "preferredSize");
          v18 = v17;
          -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v16);
          v9 = v9 + v18 + v19;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SFUnifiedBar _spacingBelowContentView:](self, "_spacingBelowContentView:", v10);
            v21 = v9 - v20;
            objc_msgSend(v16, "preferredTopSpacing");
            v9 = v21 + v22;
          }
          v23 = v16;

          v10 = v23;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  return v9;
}

- (double)squishedHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double result;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_hasSquishedStandaloneContentView)
  {
    -[SFUnifiedBar _inlineContentHeight](self, "_inlineContentHeight");
    v4 = v3;
    +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
    v6 = v4 * v5;
    -[SFUnifiedBar _squishedInlineContentTopOverflow](self, "_squishedInlineContentTopOverflow");
    v8 = v6 - v7;
    -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "preferredSquishedBottomSpacing");
      v8 = v8 + v10;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[SFUnifiedBarContentArrangement standaloneContentViews](self->_contentArrangement, "standaloneContentViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "showsSquishedContent"))
          {
            objc_msgSend(v16, "preferredSize");
            v18 = v17;
            +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
            v8 = v8 + v18 * v19;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v16, "preferredSquishedBottomSpacing");
              v8 = v8 + v20;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v16, "topSquishedSpacingAdjustment");
              v8 = v8 - v21;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v22 = _SFRoundFloatToPixels(v8);
    return v22;
  }
  else
  {
    -[SFUnifiedBarMetrics squishedInlineBarHeight](self->_barMetrics, "squishedInlineBarHeight");
  }
  return result;
}

- (double)squishTransformFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Height;
  double v10;
  CGRect v12;

  -[SFUnifiedBar squishedHeight](self, "squishedHeight");
  v4 = v3;
  -[SFUnifiedBar expandedHeight](self, "expandedHeight");
  v6 = v5;
  -[SFUnifiedBar extendedBottomHeight](self, "extendedBottomHeight");
  v8 = v6 + v7;
  -[SFUnifiedBar bounds](self, "bounds");
  Height = CGRectGetHeight(v12);
  v10 = _SFUninterpolate(Height, v4, v8);
  return _SFClamp(v10, 0.0, 1.0);
}

- (CGPoint)_inlineContentSquishAnchorPoint
{
  double MidX;
  double v4;
  double v5;
  CGPoint result;
  CGRect v7;

  -[SFUnifiedBar bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[SFUnifiedBarMetrics squishedInlineBarHeight](self->_barMetrics, "squishedInlineBarHeight");
  v4 = _SFRoundPointToPixels(MidX);
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_squishVerticalOffset
{
  double contentUnderStatusBarHeight;
  double v3;
  BOOL v4;
  double result;

  contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  v3 = 0.0;
  if (contentUnderStatusBarHeight > 0.0)
    v3 = 2.5;
  v4 = contentUnderStatusBarHeight <= 20.0;
  result = 5.0;
  if (v4)
    return v3;
  return result;
}

- (void)_setShowsSquishedContent:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  id v6;

  if (self->_showsSquishedContent != a3)
  {
    v3 = a3;
    self->_showsSquishedContent = a3;
    v5 = !a3;
    -[UIView setHidden:](self->_squishedContentView, "setHidden:", !a3);
    if (!v5)
      -[SFUnifiedBar _updateSquishedAccessoryViews](self, "_updateSquishedAccessoryViews");
    -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setShowsSquishedAccessoryViews:", v3);

  }
}

- (void)_updateSquishedAccessoryViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIView subviews](self->_squishedContentView, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  -[SFUnifiedBarContentArrangement inlineContentView](self->_contentArrangement, "inlineContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v8, "squishedAccessoryViews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
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
          -[UIView addSubview:](self->_squishedContentView, "addSubview:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
  -[UIView addSubview:](self->_squishedContentView, "addSubview:", self->_squishedBarButton);

}

- (void)setBarTheme:(id)a3
{
  -[SFUnifiedBar setBarTheme:animated:](self, "setBarTheme:animated:", a3, 0);
}

- (void)setBarTheme:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SFUnifiedBar *v14;
  id v15;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_barTheme) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_barTheme, a3);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __37__SFUnifiedBar_setBarTheme_animated___block_invoke;
    v13 = &unk_1E21E2258;
    v14 = self;
    v15 = v7;
    v8 = _Block_copy(&v10);
    v9 = v8;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331650, v8, 0, v10, v11, v12, v13, v14);
    else
      (*((void (**)(void *))v8 + 2))(v8);

  }
}

void __37__SFUnifiedBar_setBarTheme_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "controlsTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v3);

  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setLocalOverrideTraitCollection:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_updateSeparatorColor");
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __37__SFUnifiedBar_setBarTheme_animated___block_invoke_2;
  v22[3] = &unk_1E21E2258;
  v7 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v7;
  objc_msgSend(v5, "performWithoutAnimation:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "allContentViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "setBarTheme:", *(_QWORD *)(a1 + 40));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 496);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __37__SFUnifiedBar_setBarTheme_animated___block_invoke_3;
  v16[3] = &unk_1E21E5498;
  v17 = v14;
  objc_msgSend(v15, "enumerateAllItemsUsingBlock:", v16);

}

uint64_t __37__SFUnifiedBar_setBarTheme_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setTheme:", *(_QWORD *)(a1 + 40));
}

void __37__SFUnifiedBar_setBarTheme_animated___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBarTheme:", v2);

}

- (BOOL)showsSeparator
{
  return self->_separator != 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  UIView *v5;
  UIView *separator;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (-[SFUnifiedBar showsSeparator](self, "showsSeparator") != a3)
  {
    if (a3)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      separator = self->_separator;
      self->_separator = v5;

      -[SFUnifiedBar _updateSeparatorColor](self, "_updateSeparatorColor");
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SFUnifiedBar addSubview:](self, "addSubview:", self->_separator);
      v18 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leadingAnchor](self->_separator, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBar leadingAnchor](self, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      -[UIView topAnchor](self->_separator, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedBar bottomAnchor](self, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v10;
      -[SFUnifiedBar trailingAnchor](self, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_separator, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v13;
      -[UIView heightAnchor](self->_separator, "heightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToConstant:", _SFOnePixel());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v16);

    }
    else
    {
      -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
      v17 = self->_separator;
      self->_separator = 0;

    }
  }
}

- (void)setUsesFaintSeparator:(BOOL)a3
{
  if (self->_usesFaintSeparator != a3)
  {
    self->_usesFaintSeparator = a3;
    -[SFUnifiedBar _updateSeparatorColor](self, "_updateSeparatorColor");
  }
}

- (void)_updateSeparatorColor
{
  id v3;

  if (self->_usesFaintSeparator)
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_secondaryBarHairlineOutlineColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v3);

}

- (void)setBackgroundVisibility:(unint64_t)a3
{
  if (self->_backgroundVisibility != a3)
  {
    self->_backgroundVisibility = a3;
    -[SFUnifiedBar _updateBackgroundAlpha](self, "_updateBackgroundAlpha");
  }
}

- (void)setChromelessScrollDistance:(double)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_chromelessScrollDistance = a3;
  -[SFUnifiedBar _updateBackgroundAlpha](self, "_updateBackgroundAlpha");
  -[SFUnifiedBar _themeColorVisibility](self, "_themeColorVisibility");
  v5 = v4;
  -[SFThemeColorEffectView themeColorVisibility](self->_backgroundView, "themeColorVisibility");
  if (v6 != v5)
  {
    -[SFThemeColorEffectView setThemeColorVisibility:](self->_backgroundView, "setThemeColorVisibility:", v5);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SFUnifiedBarContentArrangement allContentViews](self->_contentArrangement, "allContentViews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "setThemeColorVisibility:", v5);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)_updateBackgroundAlpha
{
  double v3;
  double v4;
  double v5;
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
  -[SFUnifiedBar _backgroundAlpha](self, "_backgroundAlpha");
  v4 = v3;
  -[SFThemeColorEffectView alpha](self->_backgroundView, "alpha");
  if (v5 != v4)
  {
    -[SFThemeColorEffectView setAlpha:](self->_backgroundView, "setAlpha:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SFUnifiedBarContentArrangement allContentViews](self->_contentArrangement, "allContentViews", 0);
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
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "setBarBackgroundAlpha:", v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (double)_backgroundAlpha
{
  unint64_t backgroundVisibility;
  double result;

  backgroundVisibility = self->_backgroundVisibility;
  if (backgroundVisibility == 2)
    return fmin(SFChromeVisibilityForScrollDistance(self->_chromelessScrollDistance), 0.999);
  result = 1.0;
  if (backgroundVisibility == 1)
    return 0.0;
  return result;
}

- (double)_themeColorVisibility
{
  double v3;

  -[SFUnifiedBar expandedHeight](self, "expandedHeight");
  return 1.0
       - SFChromeVisibilityForScrollDistance(self->_chromelessScrollDistance - (v3
                                                                              + self->_contentUnderStatusBarHeight
                                                                              + self->_extendedBottomHeight));
}

- (BOOL)_showsSquishedContent
{
  return self->_showsSquishedContent;
}

- (SFUnifiedBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (SFUnifiedBarContentArrangement)contentArrangement
{
  return self->_contentArrangement;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)contentUnderStatusBarHeight
{
  return self->_contentUnderStatusBarHeight;
}

- (void)setContentUnderStatusBarHeight:(double)a3
{
  self->_contentUnderStatusBarHeight = a3;
}

- (double)extendedBottomHeight
{
  return self->_extendedBottomHeight;
}

- (void)setExtendedBottomHeight:(double)a3
{
  self->_extendedBottomHeight = a3;
}

- (BOOL)usesFaintSeparator
{
  return self->_usesFaintSeparator;
}

- (unint64_t)marginLevel
{
  return self->_marginLevel;
}

- (UIView)leadingItemContainerView
{
  return self->_leadingItemContainerView;
}

- (UIView)trailingItemContainerView
{
  return self->_trailingItemContainerView;
}

- (unint64_t)backgroundVisibility
{
  return self->_backgroundVisibility;
}

- (double)chromelessScrollDistance
{
  return self->_chromelessScrollDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_contentArrangement, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_trailingItemContainerView, 0);
  objc_storeStrong((id *)&self->_leadingItemContainerView, 0);
  objc_storeStrong((id *)&self->_itemViewsToRemoveOnNextLayout, 0);
  objc_storeStrong((id *)&self->_squishedBarButton, 0);
  objc_storeStrong((id *)&self->_squishedContentView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
}

@end
