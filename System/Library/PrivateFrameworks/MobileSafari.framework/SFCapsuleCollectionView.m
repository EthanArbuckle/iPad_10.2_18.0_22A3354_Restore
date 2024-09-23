@implementation SFCapsuleCollectionView

- (int64_t)minimizationStyle
{
  return self->_minimizationStyle;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (id)createOrDequeueContentViewWithIdentifier:(id)a3 atIndex:(int64_t)a4
{
  NSMutableDictionary *contentViewRegistrations;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *reuseableContentView;
  NSString *v14;
  NSString *reusableContentViewIdentifier;

  contentViewRegistrations = self->_contentViewRegistrations;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](contentViewRegistrations, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capsuleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createOrDequeueViewWithExistingView:", v11);
  v12 = (UIView *)objc_claimAutoreleasedReturnValue();
  reuseableContentView = self->_reuseableContentView;
  self->_reuseableContentView = v12;

  v14 = (NSString *)objc_msgSend(v7, "copy");
  reusableContentViewIdentifier = self->_reusableContentViewIdentifier;
  self->_reusableContentViewIdentifier = v14;

  return self->_reuseableContentView;
}

void __63__SFCapsuleCollectionView__dequeueOrCreateViewForItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SFCapsuleView *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  void *v9;
  uint64_t v10;
  SFCapsuleView *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "capsuleView");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "anyObject");
      v11 = (SFCapsuleView *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "removeObject:", v11);
      -[SFCapsuleView setHidden:](v11, "setHidden:", 0);
      -[SFCapsuleView shadowView](v11, "shadowView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHidden:", 0);

    }
    else
    {
      v4 = [SFCapsuleView alloc];
      objc_msgSend(*(id *)(a1 + 40), "capsuleFrame");
      v11 = -[SFCapsuleView initWithFrame:](v4, "initWithFrame:");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 464);
      -[SFCapsuleView backgroundView](v11, "backgroundView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setCaptureView:", v5);

      objc_msgSend(*(id *)(a1 + 40), "_updateSuperviewForCapsule:", v11);
    }
    objc_msgSend(*(id *)(a1 + 40), "capsuleBackgroundCornerRadius");
    -[SFCapsuleView setBackgroundCornerRadius:](v11, "setBackgroundCornerRadius:");
    objc_msgSend(*(id *)(a1 + 40), "_visualEffectGroupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleView setVisualEffectGroupName:](v11, "setVisualEffectGroupName:", v7);

    -[SFCapsuleView setTheme:](v11, "setTheme:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 472));
    -[SFCapsuleView setMinimizedTheme:](v11, "setMinimizedTheme:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 480));
    -[SFCapsuleView setLayoutStyle:](v11, "setLayoutStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 928));
    objc_msgSend(*(id *)(a1 + 32), "setCapsuleView:", v11);
    v2 = (uint64_t)v11;
  }
  v12 = (id)v2;
  v8 = *(_BYTE **)(a1 + 40);
  if (v8[883])
  {
    v9 = *(void **)(a1 + 32);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "_fetchContentViewForItem:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_updateStateFlagsForContentViewAtIndex:", *(_QWORD *)(a1 + 48));
    v9 = *(void **)(a1 + 32);
    v10 = 1;
  }
  objc_msgSend(v9, "setCapsuleContentIsValid:", v10);

}

- (void)_fetchContentViewForItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *contentViewRegistrations;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  UIView *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSString *reusableContentViewIdentifier;
  UIView *reuseableContentView;
  NSString *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "capsuleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "reusableContentViewIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      contentViewRegistrations = self->_contentViewRegistrations;
      objc_msgSend(v7, "reusableContentViewIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](contentViewRegistrations, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enqueueView:", v13);

    }
  }
  if ((int64_t)self->_numberOfItems <= a4)
  {
    -[SFCapsuleCollectionView _trailingActionContentView](self, "_trailingActionContentView");
    v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "capsuleCollectionView:contentViewForItemAtIndex:", self, a4);
    v15 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setSizeUpdater:](v15, "setSizeUpdater:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFCapsuleCollectionView _buttonPointerStyleProviderForContentView:](self, "_buttonPointerStyleProviderForContentView:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setButtonPointerStyleProvider:](v15, "setButtonPointerStyleProvider:", v16);

  }
  v17 = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
  if (v17
    && (objc_msgSend(v7, "contentViewUpdateHandler"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    objc_msgSend(v17, "publicCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke;
    v25[3] = &unk_1E21E26D0;
    objc_copyWeak(&v27, &location);
    v21 = v20;
    v26 = v21;
    objc_msgSend(v7, "setContentViewUpdateHandler:", v25);

    objc_destroyWeak(&v27);
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v7, "setContentView:", v15);
  if (v15 == self->_reuseableContentView)
    reusableContentViewIdentifier = self->_reusableContentViewIdentifier;
  else
    reusableContentViewIdentifier = 0;
  objc_msgSend(v7, "setReusableContentViewIdentifier:", reusableContentViewIdentifier);
  if (v19)
    objc_msgSend(v7, "setContentViewUpdateHandler:", 0);
  reuseableContentView = self->_reuseableContentView;
  self->_reuseableContentView = 0;

  v24 = self->_reusableContentViewIdentifier;
  self->_reusableContentViewIdentifier = 0;

  -[SFCapsuleCollectionView _updateStateFlagsForContentViewAtIndex:](self, "_updateStateFlagsForContentViewAtIndex:", a4);
  objc_destroyWeak(&location);

}

- (id)contentViewForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capsuleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateStateFlagsForContentViewAtIndex:(int64_t)a3
{
  int64_t selectedItemIndex;
  int64_t selectedItemState;
  int64_t v7;
  void *v8;
  BOOL v9;
  int64_t v10;
  NSMutableDictionary *selectedItemAccessoryViews;
  void *v12;
  void *v13;
  uint64_t v14;
  double Height;
  id v16;
  CGRect v17;

  if ((int64_t)-[NSArray count](self->_items, "count") > a3)
  {
    selectedItemIndex = self->_selectedItemIndex;
    selectedItemState = self->_selectedItemState;
    if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized")
      && -[SFCapsuleCollectionView _shouldUseNormalLayoutForMinimizedCapsule](self, "_shouldUseNormalLayoutForMinimizedCapsule"))
    {
      v7 = 0;
    }
    else
    {
      v7 = self->_selectedItemState;
    }
    self->_selectedItemState = v7;
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "capsuleView");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSelected:", selectedItemIndex == a3);
    if (self->_minimizationStyle)
      v9 = 0;
    else
      v9 = selectedItemIndex == a3;
    if (v9)
      v10 = self->_selectedItemState;
    else
      v10 = 0;
    objc_msgSend(v16, "setState:", v10);
    if (selectedItemIndex == a3)
    {
      selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectedItemState);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](selectedItemAccessoryViews, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAccessoryView:", v13);

    }
    else
    {
      objc_msgSend(v16, "setAccessoryView:", 0);
    }
    v14 = objc_msgSend(v16, "state");
    Height = 0.0;
    if (v14 == 1 && self->_layoutStyle == 1)
    {
      -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame", 0.0);
      Height = CGRectGetHeight(v17);
    }
    objc_msgSend(v16, "setBackgroundHeight:", Height);
    self->_selectedItemState = selectedItemState;

  }
}

void __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  void *v6;
  _QWORD *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3);
  objc_msgSend(v8, "capsuleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) == 0 && v6)
  {
    v7 = *(_QWORD **)(a1 + 40);
    if (v7[124] == a3)
    {
      objc_msgSend(v7, "_updateOffsetForPan");
      v7 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v7, "_reclaimViewForItem:", v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_dequeueOrCreateViewForItem:atIndex:", v5, a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)_dequeueOrCreateViewForItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SFCapsuleCollectionView *v11;
  int64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SFCapsuleCollectionView__dequeueOrCreateViewForItem_atIndex___block_invoke;
  v9[3] = &unk_1E21E2540;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  objc_msgSend(v7, "safari_performWithoutRetargetingAnimations:", v9);

}

- (CGRect)_bottomBackdropFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  int64_t layoutStyle;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  -[SFCapsuleCollectionView bounds](self, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v7 = CGRectGetWidth(v30);
  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
    v10 = v14 + 44.0;
    v15 = SFCapsuleBottomBarPaddingForTopLayoutStyle();
LABEL_9:
    v13 = v10 + v15;
    goto LABEL_11;
  }
  if (layoutStyle != 1)
  {
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_11;
  }
  -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
  -[SFCapsuleCollectionView _additionalHeightFromAuxiliaryBarAtMinimizationPercent:](self, "_additionalHeightFromAuxiliaryBarAtMinimizationPercent:");
  v10 = v9;
  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized") && !self->_minimizationStyle)
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v29 = CGRectGetHeight(v33);
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
    v15 = v29 - CGRectGetMinY(v34);
    goto LABEL_9;
  }
  if (v10 <= 0.0)
    v10 = 8.0;
  -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
  v12 = v10 + v11 + 44.0;
  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  v13 = v12 + CGRectGetHeight(v31) + 3.0;
LABEL_11:
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v16 = CGRectGetHeight(v32);
  if (-[SFCapsuleCollectionView _shouldDismissToolbar](self, "_shouldDismissToolbar"))
    v17 = 0.0;
  else
    v17 = v13;
  v18 = v16 - v17;
  -[SFCapsuleCollectionView _verticalOffsetForBottomBackdropIncludingKeyboard:](self, "_verticalOffsetForBottomBackdropIncludingKeyboard:", 1);
  UIEdgeInsetsMakeWithEdges();
  v20 = v18 + v19;
  v23 = v7 - (v21 + v22);
  v25 = v13 - (v19 + v24);
  v26 = v21 + 0.0;
  v27 = v20;
  v28 = v23;
  result.size.height = v25;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (UIEdgeInsets)_insetsByApplyingSelectedItemOffsetToInsetsForState:(int64_t)a3 includeKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  int v17;
  _BOOL4 v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  v4 = a4;
  -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", a3 != 1);
  v16 = a3 == 1 && self->_minimizationStyle == 1;
  v17 = v8 != 0.0 || v16;
  if (v17 == 1 && v8 != v15)
  {
    v19 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
    v20 = -1.0;
    if (v19)
      v20 = 1.0;
    -[SFCapsuleCollectionView _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:](self, "_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:", 0, v20);
    v8 = v8 + v21;
  }
  v22 = v12 != 0.0 || v16;
  if (v22 == 1)
  {
    -[SFCapsuleCollectionView _verticalOffsetForBottomBackdropIncludingKeyboard:](self, "_verticalOffsetForBottomBackdropIncludingKeyboard:", v4);
    v12 = v12 - v23;
  }
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v27 = v14;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SFCapsuleCollectionView obscuredInsetsForState:ignoringKeyboard:](self, "obscuredInsetsForState:ignoringKeyboard:", a3, 0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)_verticalOffsetForBottomBackdropIncludingKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;
  double result;

  v3 = a3;
  if (-[SFCapsuleCollectionView _shouldDismissToolbar](self, "_shouldDismissToolbar")
    && !-[SFCapsuleCollectionView _shouldUseNormalLayoutForMinimizedCapsule](self, "_shouldUseNormalLayoutForMinimizedCapsule")&& !self->_minimizationStyle)
  {
    return 0.0;
  }
  v5 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
  v6 = 1.0;
  if (v5)
  {
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0, 1.0);
    v8 = v7;
    v10 = v9;
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 1);
    v6 = (v10 - v11) / (v12 - v8);
  }
  v13 = self->_selectedItemState != 2 && v3;
  -[SFCapsuleCollectionView _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:](self, "_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:", v13, v6);
  return result;
}

- (BOOL)_shouldDismissToolbar
{
  char itemsAreHidden;
  int64_t layoutStyle;
  _BOOL4 v5;
  unsigned int v6;
  BOOL v7;
  NSNumber *toolbarOffsetForPinchTransition;
  double v9;

  itemsAreHidden = -96;
  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    if (!-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
    {
      itemsAreHidden = self->_itemsAreHidden;
      if (!itemsAreHidden)
        return itemsAreHidden & 1;
      goto LABEL_15;
    }
LABEL_13:
    itemsAreHidden = 1;
    return itemsAreHidden & 1;
  }
  if (layoutStyle == 1)
  {
    if (self->_minimizationStyle != 1
      || !-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
    {
      v5 = self->_offsetForPan.y < -50.0;
      v6 = v5 & ~SFEnhancedTabOverviewEnabled();
      v7 = !self->_itemsAreHidden && v6 == 0;
      if (v7
        || (toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition) != 0
        && (-[NSNumber doubleValue](toolbarOffsetForPinchTransition, "doubleValue"), v9 <= 50.0))
      {
        itemsAreHidden = 0;
        return itemsAreHidden & 1;
      }
LABEL_15:
      itemsAreHidden = self->_alternateToolbarContentView == 0;
      return itemsAreHidden & 1;
    }
    goto LABEL_13;
  }
  return itemsAreHidden & 1;
}

- (double)_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:(double)a3 includeKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;

  v4 = a4;
  v6 = 0.0;
  if ((self->_minimizationFlags & 2) == 0)
  {
    a3 = _SFRoundFloatToPixels(self->_offsetForMinimization * a3);
    v6 = a3 + 0.0;
  }
  if (v4 && -[SFCapsuleCollectionView _shouldDodgeKeyboard](self, "_shouldDodgeKeyboard", a3))
  {
    v7 = 0.0;
    v8 = 0.0;
    if (!self->_selectedItemState)
    {
      -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
      v8 = v9;
      if (self->_layoutStyle == 1)
      {
        -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
        v8 = v8 + v10 + 44.0 + 3.0 - 8.0;
      }
    }
    -[SFCapsuleCollectionView _keyboardHeightBelowCapsule](self, "_keyboardHeightBelowCapsule");
    v12 = v11 - v8;
    -[SFCapsuleInputAccessorySpacerView bounds](self->_inputAccessoryView, "bounds");
    if (v12 - CGRectGetHeight(v16) >= 0.0)
    {
      -[SFCapsuleCollectionView _keyboardHeightBelowCapsule](self, "_keyboardHeightBelowCapsule");
      v14 = v13 - v8;
      -[SFCapsuleInputAccessorySpacerView bounds](self->_inputAccessoryView, "bounds");
      v7 = v14 - CGRectGetHeight(v17);
    }
    return v6 - v7;
  }
  return v6;
}

- (CGRect)_minimizedCapsuleFrameIgnoringKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t minimizationStyle;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  int HasHomeButton;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect result;

  v3 = a3;
  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  v8 = v7;
  v10 = v9;
  minimizationStyle = self->_minimizationStyle;
  if (minimizationStyle)
  {
    v12 = v5;
    v13 = v6;
    if (minimizationStyle == 1)
    {
      if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
      {
        if (!self->_alwaysShowTopBackdrop)
        {
          -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
          v12 = v12 - v14;
        }
      }
      else
      {
        -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
        v12 = v12 + v28;
      }
    }
  }
  else
  {
    -[SFCapsuleCollectionView bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[SFCapsuleCollectionView _selectedCapsuleHeightForWidth:state:ignoringKeyboard:](self, "_selectedCapsuleHeightForWidth:state:ignoringKeyboard:", 1, v3, v10);
    v13 = v23;
    if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
    {
      -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
      v25 = v24 + -13.0;
      HasHomeButton = _SFDeviceHasHomeButton();
      v27 = 5.0;
      if (!HasHomeButton)
        v27 = 0.0;
      v12 = fmax(v25 + v27, 0.0);
    }
    else
    {
      v33.origin.x = v16;
      v33.origin.y = v18;
      v33.size.width = v20;
      v33.size.height = v22;
      v12 = CGRectGetHeight(v33) - v13;
    }
  }
  v29 = v8;
  v30 = v12;
  v31 = v10;
  v32 = v13;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (UIEdgeInsets)obscuredInsetsForState:(int64_t)a3 ignoringKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v17;
  double v18;
  double Height;
  uint64_t v20;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  UIEdgeInsets result;

  v4 = a4;
  if (a3 == 1 && self->_minimizationStyle == 1 && !self->_alwaysShowTopBackdrop)
  {
    v18 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v24 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v7 = MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v10 = 0.0;
    if (a3 == 1)
      v10 = 1.0;
    -[SFCapsuleCollectionView _additionalHeightFromAuxiliaryBarAtMinimizationPercent:](self, "_additionalHeightFromAuxiliaryBarAtMinimizationPercent:", v10);
    v12 = v11;
    if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
    {
      if (a3 == 1)
        -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
      else
        -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
      v18 = v12 + CGRectGetMaxY(*(CGRect *)&v13);
      if (a3 == 1)
      {
        v24 = *(double *)(v7 + 16);
      }
      else
      {
        v25 = 0.0;
        if (v12 <= 0.0)
        {
          -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
          SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar();
        }
        v18 = v18 + v25;
        -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
        v24 = v26 + 44.0 + SFCapsuleBottomBarPaddingForTopLayoutStyle();
      }
    }
    else
    {
      -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
      v18 = v17;
      -[SFCapsuleCollectionView bounds](self, "bounds");
      Height = CGRectGetHeight(v30);
      if (a3 == 1)
        -[SFCapsuleCollectionView _minimizedCapsuleFrameIgnoringKeyboard:](self, "_minimizedCapsuleFrameIgnoringKeyboard:", v4);
      else
        -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
      v24 = v12 + Height - CGRectGetMinY(*(CGRect *)&v20);
      if (a3 != 1 && v12 == 0.0)
        v24 = v24 + 8.0;
    }
  }
  v27 = v18;
  v28 = v8;
  v29 = v9;
  result.right = v29;
  result.bottom = v24;
  result.left = v28;
  result.top = v27;
  return result;
}

- (BOOL)_layoutStyleIsTop
{
  return self->_layoutStyle != 1;
}

- (CGRect)capsuleFrame
{
  double v3;
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
  double v16;
  CGFloat v17;
  double Width;
  double v19;
  double v20;
  double v21;
  int64_t layoutStyle;
  double Height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  -[SFCapsuleCollectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFCapsuleCollectionView _layoutMarginsForState:](self, "_layoutMarginsForState:", self->_selectedItemState);
  v14 = v13;
  v16 = v15;
  if (self->_capsuleWidth == -1.0)
  {
    v32.origin.x = v4 + v11;
    v32.size.width = v8 - (v11 + v12);
    v32.size.height = v10 - (v14 + v16);
    v32.origin.y = v6 + v14;
    Width = CGRectGetWidth(v32);
  }
  else
  {
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    v17 = CGRectGetWidth(v31);
    Width = _SFRoundFloatToPixels(v17 * fmax(fmin(self->_capsuleWidth, 1.0), 0.0));
  }
  v19 = Width;
  -[SFCapsuleCollectionView _selectedCapsuleHeightForWidth:state:ignoringKeyboard:](self, "_selectedCapsuleHeightForWidth:state:ignoringKeyboard:", 0, 0);
  v21 = v20;
  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
    v25 = v14 + v26;
  }
  else if (layoutStyle == 1)
  {
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    Height = CGRectGetHeight(v33);
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
    v25 = Height - v24 - 44.0 - v16 - v21;
  }
  else
  {
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  v27 = (CGRectGetWidth(v34) - v19) * 0.5;
  v28 = v25;
  v29 = v19;
  v30 = v21;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (double)_selectedCapsuleHeightForWidth:(double)a3 state:(int64_t)a4 ignoringKeyboard:(BOOL)a5
{
  double v7;
  double result;
  void *v11;
  double v12;
  double v13;
  double v14;
  double keyboardHeight;
  double v16;

  if (self->_selectedItemIndex >= (int64_t)self->_numberOfItems || self->_suppressingDataSourceCalls)
  {
    if (a4 == 1)
      return 39.0;
    -[SFCapsuleCollectionView defaultCapsuleHeight](self, "defaultCapsuleHeight", a3);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView defaultCapsuleHeight](self, "defaultCapsuleHeight");
    objc_msgSend(v11, "capsuleHeightForWidth:defaultHeight:state:index:", a4, self->_selectedItemIndex, a3, v12);
    v7 = v13;

    if (a4 != 1 || -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
      return v7;
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
    keyboardHeight = 0.0;
    if (self->_showingKeyboard && !a5)
      keyboardHeight = self->_keyboardHeight;
    v16 = fmax(v14 - keyboardHeight, 0.0);
    return fmax(v7 + fmin(v16, 13.0), v16 + 18.0);
  }
  return result;
}

- (double)defaultCapsuleHeight
{
  int64_t layoutStyle;
  uint64_t *v3;
  double result;

  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    v3 = &SFTopCapsuleHeight;
  }
  else
  {
    if (layoutStyle != 1)
      return result;
    v3 = &SFCapsuleWithToolbarHeight;
  }
  return *(double *)v3;
}

- (UIEdgeInsets)_layoutMarginsForState:(int64_t)a3
{
  int64_t layoutStyle;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 1)
  {
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
      {
        v4 = 12.0;
        v5 = 16.0;
        v6 = 3.0;
        v7 = 16.0;
      }
    }
    else
    {
      -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
      UIEdgeInsetsReplace();
    }
  }
  else if (layoutStyle == 2)
  {
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets", a3);
    SFCapsuleTopBarPaddingForTopLayoutStyleWithStatusBar();
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)_additionalHeightFromAuxiliaryBarAtMinimizationPercent:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!self->_showingLockdownStatusBar)
    return 0.0;
  -[SFCapsuleCollectionView _lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:");
  v6 = v5;
  -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", a3);
  v8 = v6 + v7;
  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  v10 = v8 + v9;
  -[SFCapsuleCollectionView _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:](self, "_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:", a3);
  v12 = v10 - v11;
  -[SFCapsuleCollectionView _auxiliaryBarSquishedHeightDecrease](self, "_auxiliaryBarSquishedHeightDecrease");
  return v12 - _SFInterpolate(0.0, v13 * 0.5, a3);
}

- (double)_keyboardHeightBelowCapsule
{
  _BOOL4 v3;
  double keyboardHeight;
  CGRect v6;

  v3 = -[SFCapsuleCollectionView _shouldDodgeKeyboard](self, "_shouldDodgeKeyboard");
  keyboardHeight = self->_keyboardHeight;
  if (!v3)
    return self->_keyboardHeight;
  -[SFCapsuleCollectionView selectedCapsuleFrame](self, "selectedCapsuleFrame");
  return fmax(keyboardHeight - CGRectGetHeight(v6), 0.0);
}

- (BOOL)_shouldDodgeKeyboard
{
  return self->_layoutStyle == 1 && self->_keepsCapsulesAboveKeyboard;
}

- (CGRect)selectedCapsuleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
  else
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)selectedItemIsMinimized
{
  return self->_selectedItemState == 1;
}

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (BOOL)_suppressingDataSourceCalls
{
  return self->_suppressingDataSourceCalls;
}

- (double)_selectedItemBackgroundAlpha
{
  double v2;

  -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
  return _SFClamp(0.5 - v2 + 0.5 - v2, 0.0, 1.0);
}

- (double)_selectedItemMinimizationPercent
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  result = 0.0;
  if (self->_minimizationStyle != 1)
  {
    if ((self->_minimizationFlags & 0x11) != 0)
    {
      -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0, 0.0);
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      v5 = v4;
      -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 1);
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      v7 = v6;
      -[SFCapsuleCollectionView _obscuredInsetsIgnoringAnimation](self, "_obscuredInsetsIgnoringAnimation");
      -[SFCapsuleCollectionView _insetForCapsuleEdgeWithInsets:](self, "_insetForCapsuleEdgeWithInsets:");
      return _SFClamp((v8 - v5) / (v7 - v5), 0.0, 1.0);
    }
    else
    {
      return (double)-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized", 0.0);
    }
  }
  return result;
}

- (SFCapsuleCollectionViewDelegate)delegate
{
  return (SFCapsuleCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setMinimizedTheme:(id)a3
{
  id v5;
  _SFBarTheme **p_minimizedTheme;
  SFCapsuleNavigationBarTheme *v7;
  SFCapsuleNavigationBarTheme *effectiveMinimizedTheme;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SFCapsuleNavigationBarTheme *v14;
  void *v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_minimizedTheme = &self->_minimizedTheme;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minimizedTheme, a3);
    +[_SFBarTheme themeWithTheme:](SFCapsuleNavigationBarTheme, "themeWithTheme:", *p_minimizedTheme);
    v7 = (SFCapsuleNavigationBarTheme *)objc_claimAutoreleasedReturnValue();
    effectiveMinimizedTheme = self->_effectiveMinimizedTheme;
    self->_effectiveMinimizedTheme = v7;

    -[SFCapsuleNavigationBarTheme setBackgroundTheme:](self->_effectiveMinimizedTheme, "setBackgroundTheme:", *p_minimizedTheme);
    -[SFCapsuleNavigationBarTheme setHidesOverlayEffects:](self->_effectiveMinimizedTheme, "setHidesOverlayEffects:", 1);
    -[SFCapsuleCollectionView _applyToolbarTheme](self, "_applyToolbarTheme");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = self->_items;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = self->_effectiveMinimizedTheme;
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "capsuleView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setMinimizedTheme:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v11);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = self->_viewsForReuse;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "setMinimizedTheme:", self->_effectiveMinimizedTheme, (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

    -[SFCapsuleCollectionView _updateMinimizedProgressViewFillColor](self, "_updateMinimizedProgressViewFillColor");
  }

}

- (double)capsuleBackgroundCornerRadius
{
  int64_t layoutStyle;
  uint64_t *v3;
  double result;

  layoutStyle = self->_layoutStyle;
  if (layoutStyle == 2)
  {
    v3 = &SFTopCapsuleBackgroundCornerRadius;
  }
  else
  {
    if (layoutStyle != 1)
      return result;
    v3 = &SFCapsuleWithToolbarBackgroundCornerRadius;
  }
  return *(double *)v3;
}

- (id)_buttonPointerStyleProviderForContentView:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SFCapsuleCollectionView__buttonPointerStyleProviderForContentView___block_invoke;
  v7[3] = &unk_1E21E2C40;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  v5 = _Block_copy(v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __52__SFCapsuleCollectionView__updateRangeOfLoadedViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capsuleIsDetached");
}

BOOL __51__SFCapsuleCollectionView__indexesOfAnimatingItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animationCount") != 0;
}

uint64_t __41__SFCapsuleCollectionView__layOutToolbar__block_invoke(uint64_t a1)
{
  double MidY;
  double v3;
  CGFloat v4;
  __int128 v5;
  void *v6;
  double v7;
  void *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "ss_untransformedFrame");
    MidY = CGRectGetMidY(v17);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v3 = (MidY - CGRectGetMidY(v18)) * 0.05;
    v4 = 1.05;
  }
  else
  {
    v3 = 0.0;
    v4 = 1.0;
  }
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v15.c = v5;
  *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v14.a = *(_OWORD *)&v15.a;
  *(_OWORD *)&v14.c = v5;
  *(_OWORD *)&v14.tx = *(_OWORD *)&v15.tx;
  CGAffineTransformScale(&v15, &v14, v4, v4);
  v13 = v15;
  CGAffineTransformTranslate(&v14, &v13, 0.0, v3);
  *(_OWORD *)&v15.tx = *(_OWORD *)&v14.tx;
  v16 = v14;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  v12 = v14;
  objc_msgSend(v6, "setTransform:", &v12);
  if (*(_BYTE *)(a1 + 40))
    v7 = v3;
  else
    v7 = 0.0;
  CGAffineTransformMakeTranslation(&v11, 0.0, v7);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  v10 = v11;
  return objc_msgSend(v8, "setTransform:", &v10);
}

- (id)_indexesOfVisibleItemsIncludingAction:(BOOL)a3
{
  double x;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double Width;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  NSUInteger v26;
  uint64_t v27;
  double v28;
  NSUInteger v29;
  uint64_t v30;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if (self->_numberOfItems)
  {
    x = self->_offsetForPan.x;
    v6 = -[SFCapsuleCollectionView _indexOfCentermostItemWithTranslation:](self, "_indexOfCentermostItemWithTranslation:", x);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
    v9 = v8;
    v32 = v8;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Width = CGRectGetWidth(v33);
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = x + v17 + (double)(v6 - self->_selectedItemIndex) * v9;
    -[SFCapsuleCollectionView _interCapsuleSpacing](self, "_interCapsuleSpacing");
    v20 = v19;
    v34.origin.x = v18;
    v34.origin.y = v12;
    v34.size.width = v14;
    v34.size.height = v16;
    v21 = fmax(fmin(Width, CGRectGetMinX(v34) - v20), 0.0);
    v35.origin.x = v18;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = v16;
    v22 = fmax(fmin(Width, Width - CGRectGetMaxX(v35) - v20), 0.0);
    v23 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    if (v23)
      v24 = v21;
    else
      v24 = v22;
    if (v23)
      v21 = v22;
    v25 = (double)v6 - ceil(v24 / v32);
    if (v25 <= 0.0)
      v25 = 0.0;
    objc_msgSend(v7, "addIndexesInRange:", (uint64_t)v25, v6 - (uint64_t)v25);
    v26 = -[NSArray count](self->_items, "count");
    if (self->_trailingAction != 0 && a3)
      v27 = -1;
    else
      v27 = -2;
    v28 = ceil(v21 / v32) + (double)v6;
    if (v28 > (double)(v27 + v26))
    {
      v29 = -[NSArray count](self->_items, "count");
      if (self->_trailingAction != 0 && a3)
        v30 = -1;
      else
        v30 = -2;
      v28 = (double)(v30 + v29);
    }
    objc_msgSend(v7, "addIndexesInRange:", v6 + 1, (uint64_t)v28 - v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (double)pageWidth
{
  double Width;
  double v4;
  CGRect v6;

  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  Width = CGRectGetWidth(v6);
  -[SFCapsuleCollectionView _interCapsuleSpacing](self, "_interCapsuleSpacing");
  return Width + v4;
}

- (double)_interCapsuleSpacing
{
  return 8.0;
}

- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4 allowActionIndex:(BOOL)a5 allowOutOfBounds:(BOOL)a6
{
  _BOOL4 v7;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  int64_t v15;
  int64_t selectionGestureLimit;
  int64_t v17;
  int64_t result;
  uint64_t v19;
  int64_t v20;

  v7 = a5;
  -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
  v12 = a3 / v11;
  v13 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v14 = -v12;
  if (!v13)
    v14 = v12;
  if (v14 < 0.0)
  {
    if (v14 <= -a4)
    {
      v15 = vcvtpd_s64_f64(v14 + -1.0);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v14 < a4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_9;
  }
  v15 = vcvtmd_s64_f64(v14 + 1.0);
LABEL_9:
  selectionGestureLimit = self->_selectionGestureLimit;
  if (v15 <= -selectionGestureLimit)
    v17 = -selectionGestureLimit;
  else
    v17 = v15;
  if (selectionGestureLimit < v17)
    v17 = self->_selectionGestureLimit;
  if (selectionGestureLimit)
    v15 = v17;
  result = self->_selectedItemIndex + v15;
  if (!a6)
  {
    LODWORD(v19) = !v7;
    if (self->_trailingAction)
      v19 = v19;
    else
      v19 = 1;
    v20 = self->_numberOfItems - v19;
    if (v20 >= result)
      v20 = result;
    return v20 & ~(v20 >> 63);
  }
  return result;
}

- (int64_t)_indexOfTargetItemWithTranslation:(double)a3 roundingThreshold:(double)a4
{
  return -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:", 0, 0, a3, a4);
}

- (int64_t)_indexOfCentermostItemWithTranslation:(double)a3
{
  return -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:", a3, 0.5);
}

- (void)_layOutToolbar
{
  _BOOL4 contentBorrowed;
  UIVisualEffectView *toolbarBackdropView;
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL8 v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  double toolbarCrossfadeDelay;
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
  double v29;
  double v30;
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
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MinY;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat Width;
  double v58;
  double alternateToolbarContentHeight;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  UIView *alternateToolbarContentView;
  CGFloat v74;
  id WeakRetained;
  double v76;
  int v77;
  int64_t selectionGestureState;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  CGFloat rect;
  CGFloat rect2;
  double v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  _QWORD v97[17];
  _QWORD v98[5];
  BOOL v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  contentBorrowed = self->_contentBorrowed;
  toolbarBackdropView = self->_toolbarBackdropView;
  if (contentBorrowed)
  {
    -[UIVisualEffectView setHidden:](toolbarBackdropView, "setHidden:", 1);
  }
  else
  {
    -[UIVisualEffectView setHidden:](toolbarBackdropView, "setHidden:", 0);
    if (self->_toolbarBackdropView)
    {
      v5 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
      v6 = -[SFCapsuleCollectionView _shouldDismissToolbar](self, "_shouldDismissToolbar");
      v7 = v6;
      v8 = 0;
      if (self->_toolbarDismissed != v6 && !v5)
        v8 = self->_selectionGestureState == 1 || self->_toolbarOffsetForPinchTransition != 0;
      self->_toolbarDismissed = v6;
      v9 = SFEnhancedTabOverviewEnabled();
      v10 = MEMORY[0x1E0C809B0];
      if (v9)
      {
        v11 = -[SFCapsuleCollectionView _contentIsDismissed](self, "_contentIsDismissed");
        toolbarCrossfadeDelay = self->_toolbarCrossfadeDelay;
        v98[0] = v10;
        v98[1] = 3221225472;
        v98[2] = __41__SFCapsuleCollectionView__layOutToolbar__block_invoke;
        v98[3] = &unk_1E21E2B38;
        v99 = v11;
        v98[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 98, v98, 0, toolbarCrossfadeDelay, 0.0);
      }
      -[SFCapsuleCollectionView bounds](self, "bounds");
      v95 = v14;
      v96 = v13;
      v93 = v15;
      v94 = v16;
      -[SFCapsuleCollectionView _bottomBackdropFrame](self, "_bottomBackdropFrame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[SFCapsuleCollectionView _verticalPanOffsetForToolbarBackdrop](self, "_verticalPanOffsetForToolbarBackdrop");
      UIEdgeInsetsMakeWithEdges();
      v26 = v18 + v25;
      v28 = v20 + v27;
      v30 = v22 - (v25 + v29);
      v32 = v24 - (v27 + v31);
      -[SFCapsuleCollectionView _bottomBackdropFrameForAlternateContent](self, "_bottomBackdropFrameForAlternateContent");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v41 = -[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent");
      v79 = v40;
      v80 = v38;
      if (v41)
        v42 = v40;
      else
        v42 = v32;
      if (v41)
        v43 = v38;
      else
        v43 = v30;
      v88 = v42;
      rect = v43;
      v81 = v36;
      v83 = v34;
      if (v41)
        v44 = v36;
      else
        v44 = v28;
      if (v41)
        v45 = v34;
      else
        v45 = v26;
      v85 = v44;
      v87 = v45;
      v91 = *MEMORY[0x1E0C9D648];
      v100.size.width = v95;
      v100.origin.x = v96;
      v100.origin.y = v93;
      v100.size.height = v94;
      CGRectGetWidth(v100);
      v101.origin.x = v26;
      v101.origin.y = v28;
      v101.size.width = v30;
      v101.size.height = v32;
      MinY = CGRectGetMinY(v101);
      if (v5)
      {
        SFCapsuleBottomBarPaddingForTopLayoutStyle();
      }
      else
      {
        -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent", MinY);
        -[SFCapsuleCollectionView _additionalHeightFromAuxiliaryBarAtMinimizationPercent:](self, "_additionalHeightFromAuxiliaryBarAtMinimizationPercent:");
        -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame", *(_QWORD *)&v40, *(_QWORD *)&v38);
        CGRectGetHeight(v102);
        -[SFCapsuleCollectionView _verticalPanOffsetForToolbar](self, "_verticalPanOffsetForToolbar");
      }
      v47 = _SFRoundRectToPixels(v91);
      v49 = v48;
      v51 = v50;
      rect2 = v52;
      if (!-[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent")
        && (objc_opt_respondsToSelector() & 1) != 0
        && -[UIView resizesFromOriginalToolbarFrame](self->_alternateToolbarContentView, "resizesFromOriginalToolbarFrame"))
      {
        -[UIView frame](self->_toolbar, "frame");
        v91 = v53;
        v55 = v54;
        Width = v56;
        alternateToolbarContentHeight = v58;
      }
      else
      {
        v103.size.width = v95;
        v103.origin.x = v96;
        v103.origin.y = v93;
        v103.size.height = v94;
        Width = CGRectGetWidth(v103);
        alternateToolbarContentHeight = self->_alternateToolbarContentHeight;
        v104.origin.y = v81;
        v104.origin.x = v83;
        v104.size.height = v79;
        v104.size.width = v80;
        v55 = CGRectGetMinY(v104);
      }
      if (!-[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent", *(_QWORD *)&v79, *(_QWORD *)&v80))
      {
        v105.origin.x = v91;
        v105.origin.y = v55;
        v105.size.width = Width;
        v105.size.height = alternateToolbarContentHeight;
        CGRectGetMinY(v105);
        v106.origin.x = v87;
        v106.size.height = v88;
        v106.origin.y = v85;
        v106.size.width = rect;
        CGRectGetMinY(v106);
      }
      v92 = _SFRoundRectToPixels(v91);
      v84 = v61;
      v86 = v60;
      v82 = v62;
      if (self->_selectedItemState == 2)
      {
        v63 = v51;
        if (self->_layoutStyle == 1)
        {
          -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "capsuleView");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "ss_untransformedFrame");
          CGRectGetMinY(v107);
          v108.origin.x = v96;
          v108.origin.y = v93;
          v108.size.width = v95;
          v108.size.height = v94;
          CGRectGetWidth(v108);
          v109.origin.x = v96;
          v109.origin.y = v93;
          v109.size.width = v95;
          v109.size.height = v94;
          CGRectGetHeight(v109);

          v87 = 0.0;
        }
      }
      else
      {
        v63 = v51;
      }
      v66 = _SFRoundRectToPixels(v87);
      v68 = v67;
      v70 = v69;
      v72 = v71;
      -[UIView frame](self->_toolbar, "frame");
      v113.origin.x = v47;
      v113.origin.y = v49;
      v113.size.width = v63;
      v113.size.height = rect2;
      if (!CGRectEqualToRect(v110, v113))
        goto LABEL_41;
      -[UIVisualEffectView frame](self->_toolbarBackdropView, "frame");
      v114.origin.x = v66;
      v114.origin.y = v68;
      v114.size.width = v70;
      v114.size.height = v72;
      if (!CGRectEqualToRect(v111, v114)
        || (alternateToolbarContentView = self->_alternateToolbarContentView) != 0
        && (-[UIView frame](alternateToolbarContentView, "frame"),
            v115.origin.x = v92,
            v115.size.width = v84,
            v115.origin.y = v86,
            v115.size.height = v82,
            !CGRectEqualToRect(v112, v115)))
      {
LABEL_41:
        v74 = v49;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v76 = 0.0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v77 = objc_msgSend(WeakRetained, "capsuleCollectionViewShouldDelayToolbarPresentation:", self);
          if (!v7)
          {
            if (v77)
            {
              selectionGestureState = self->_selectionGestureState;
              if (selectionGestureState != 1)
              {
                if (selectionGestureState == 5)
                  v76 = 0.0;
                else
                  v76 = 0.25;
              }
            }
          }
        }

        v97[0] = v10;
        v97[1] = 3221225472;
        v97[2] = __41__SFCapsuleCollectionView__layOutToolbar__block_invoke_2;
        v97[3] = &unk_1E21E2B60;
        v97[4] = self;
        *(double *)&v97[5] = v47;
        *(CGFloat *)&v97[6] = v74;
        *(CGFloat *)&v97[7] = v63;
        *(CGFloat *)&v97[8] = rect2;
        *(double *)&v97[9] = v92;
        *(CGFloat *)&v97[10] = v86;
        *(CGFloat *)&v97[11] = v84;
        *(CGFloat *)&v97[12] = v82;
        *(double *)&v97[13] = v66;
        *(CGFloat *)&v97[14] = v68;
        *(CGFloat *)&v97[15] = v70;
        *(CGFloat *)&v97[16] = v72;
        objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", v8, 98, v97, 0, v76);
      }
    }
  }
}

- (BOOL)_shouldShowAlternateToolbarContent
{
  return (!self->_selectionGestureState
       || (-[SFCapsuleCollectionView _capsuleAlphaOptionsForSelectionGesture](self, "_capsuleAlphaOptionsForSelectionGesture") & 1) != 0)&& self->_alternateToolbarContentView&& self->_showingAlternateToolbarContent;
}

- (double)_verticalPanOffsetForToolbar
{
  double v2;
  double v4;
  double v5;
  double v6;
  NSNumber *toolbarOffsetForPinchTransition;
  double v8;
  CGRect v10;

  v2 = 0.0;
  if (self->_layoutStyle == 1
    && !self->_selectedItemState
    && !self->_alternateToolbarContentView
    && (SFEnhancedTabOverviewEnabled() & 1) == 0)
  {
    if (-[SFCapsuleCollectionView _shouldDismissToolbar](self, "_shouldDismissToolbar"))
    {
      -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
      v5 = v4 + 44.0 + 3.0;
      -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
      v6 = v5 + CGRectGetHeight(v10) + 8.0;
    }
    else
    {
      toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition;
      if (!toolbarOffsetForPinchTransition)
      {
        v6 = fmin(self->_offsetForPan.y, 0.0);
        v8 = 0.3;
        return v6 * v8;
      }
      -[NSNumber doubleValue](toolbarOffsetForPinchTransition, "doubleValue");
    }
    v8 = -0.3;
    return v6 * v8;
  }
  return v2;
}

- (double)_verticalPanOffsetForToolbarBackdrop
{
  double result;
  NSNumber *toolbarOffsetForPinchTransition;

  if (self->_layoutStyle != 1
    || self->_selectedItemState
    || self->_alternateToolbarContentView
    || -[SFCapsuleCollectionView _shouldDismissToolbar](self, "_shouldDismissToolbar")
    || (SFEnhancedTabOverviewEnabled() & 1) != 0)
  {
    return 0.0;
  }
  toolbarOffsetForPinchTransition = self->_toolbarOffsetForPinchTransition;
  if (!toolbarOffsetForPinchTransition)
    return fmax(-self->_offsetForPan.y, 0.0);
  -[NSNumber doubleValue](toolbarOffsetForPinchTransition, "doubleValue");
  return result;
}

- (CGRect)_bottomBackdropFrameForAlternateContent
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
  CGFloat v13;
  double Width;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[SFCapsuleCollectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_alternateToolbarContentHeight == 0.0)
  {
    v12 = 0.0;
  }
  else
  {
    -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
    v12 = v11 + self->_alternateToolbarContentHeight;
  }
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v13 = CGRectGetHeight(v18) - v12;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  Width = CGRectGetWidth(v19);
  v15 = 0.0;
  v16 = v13;
  v17 = v12;
  result.size.height = v17;
  result.size.width = Width;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  -[SFCapsuleCollectionView setSelectedItemIndex:animated:](self, "setSelectedItemIndex:animated:", a3, 0);
}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

uint64_t __41__SFCapsuleCollectionView__updateToolbar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutToolbar");
}

- (void)updateDraggingWithOffset:(double)a3
{
  -[SFCapsuleCollectionView _updateDragWithOffset:velocity:ended:](self, "_updateDragWithOffset:velocity:ended:", 0, a3, 0.0);
}

- (void)_updateVisualEffectGroupName
{
  void *v3;
  void *v4;
  NSArray *items;
  id v6;
  _QWORD v7[5];
  id v8;

  -[SFCapsuleCollectionView _visualEffectGroupName](self, "_visualEffectGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFCapsuleCollectionView _shouldGroupToolbarBackdropWithCapsules](self, "_shouldGroupToolbarBackdropWithCapsules"))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  -[UIVisualEffectView _setGroupName:](self->_toolbarBackdropView, "_setGroupName:", v4);
  items = self->_items;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFCapsuleCollectionView__updateVisualEffectGroupName__block_invoke;
  v7[3] = &unk_1E21E26A8;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  -[NSArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v7);

}

- (id)_visualEffectGroupName
{
  void *v3;

  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized")
    && !self->_visualEffectTransitionCount
    && (objc_opt_respondsToSelector() & 1) != 0
    && !self->_minimizationStyle)
  {
    -[_SFBarTheme backdropGroupName](self->_minimizedTheme, "backdropGroupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SFCapsuleCollectionView.%p"), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_reloadDataWithoutLayout
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  SFCapsuleCollectionViewItem *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSArray *v17;
  NSArray *items;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_DEFAULT, "Reload data", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleCollectionView _setIndexesOfLoadedViews:](self, "_setIndexesOfLoadedViews:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = objc_msgSend(WeakRetained, "numberOfItemsInCapsuleCollectionView:", self);

  self->_selectedItemIndex = 0;
  v6 = (void *)-[NSArray mutableCopy](self->_items, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_numberOfItems);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = self->_numberOfItems + 1;
  while (objc_msgSend(v9, "count") > v10)
    objc_msgSend(v9, "removeLastObject");
  while (objc_msgSend(v9, "count") < v10)
  {
    v11 = -[SFCapsuleCollectionViewItem initWithCollectionView:]([SFCapsuleCollectionViewItem alloc], "initWithCollectionView:", self);
    objc_msgSend(v9, "addObject:", v11);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "invalidateCapsuleHeight", (_QWORD)v20);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

  v17 = (NSArray *)objc_msgSend(v12, "copy");
  items = self->_items;
  self->_items = v17;

  -[SFCapsuleCollectionView _updateActions](self, "_updateActions");
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "capsuleCollectionViewWillReloadData:", self);
  -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews", (_QWORD)v20);
  -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setNeedsLayout
{
  objc_super v2;

  if (!self->_ignoreSetNeedsLayout)
  {
    v2.receiver = self;
    v2.super_class = (Class)SFCapsuleCollectionView;
    -[SFCapsuleCollectionView setNeedsLayout](&v2, sel_setNeedsLayout);
  }
}

- (void)_updateRangeOfLoadedViews
{
  void *v3;
  void *v4;
  void *v5;
  NSIndexSet *v6;
  id WeakRetained;
  void *v8;
  id v9;

  if (self->_numberOfItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", self->_selectedItemIndex);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndexes:", v3);

    -[SFCapsuleCollectionView _indexesOfAnimatingItems](self, "_indexesOfAnimatingItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndexes:", v4);
    -[NSArray indexesOfObjectsPassingTest:](self->_items, "indexesOfObjectsPassingTest:", &__block_literal_global_109);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndexes:", v5);

    v6 = self->_indexesOfLoadedViews;
    -[SFCapsuleCollectionView _setIndexesOfLoadedViews:](self, "_setIndexesOfLoadedViews:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);
    if (objc_msgSend(v4, "count") && WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setFireDate:", v8);

    }
    else if (!-[NSIndexSet isEqualToIndexSet:](self->_indexesOfLoadedViews, "isEqualToIndexSet:", v6))
    {
      -[SFCapsuleCollectionView _scheduleTimerToDiscardViewsForReuseIfNeeded](self, "_scheduleTimerToDiscardViewsForReuseIfNeeded");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView _setIndexesOfLoadedViews:](self, "_setIndexesOfLoadedViews:", v9);
  }

}

- (void)_setIndexesOfLoadedViews:(id)a3
{
  id v5;
  NSArray *items;
  uint64_t v7;
  id v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  SFCapsuleCollectionView *v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  SFCapsuleCollectionView *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v5 = a3;
  objc_storeStrong((id *)&self->_indexesOfLoadedViews, a3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  items = self->_items;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke;
  v18[3] = &unk_1E21E2938;
  v8 = v5;
  v19 = v8;
  v20 = self;
  v21 = &v22;
  -[NSArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v18);
  v9 = self->_items;
  v11 = v7;
  v12 = 3221225472;
  v13 = __52__SFCapsuleCollectionView__setIndexesOfLoadedViews___block_invoke_2;
  v14 = &unk_1E21E2938;
  v10 = v8;
  v15 = v10;
  v16 = self;
  v17 = &v22;
  -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", &v11);
  if (*((_BYTE *)v23 + 24))
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout", v11, v12, v13, v14);

  _Block_object_dispose(&v22, 8);
}

- (void)_updateTopAction
{
  UIAction *v3;
  UIAction *topAction;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop")
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    topAction = self->_topAction;
    self->_topAction = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "topActionForCapsuleCollectionView:", self);
    v3 = (UIAction *)objc_claimAutoreleasedReturnValue();
    topAction = self->_topAction;
    self->_topAction = v3;
  }

}

- (void)_updateActions
{
  -[SFCapsuleCollectionView _updateTrailingAction](self, "_updateTrailingAction");
  -[SFCapsuleCollectionView _updateTopAction](self, "_updateTopAction");
}

- (BOOL)_updateTrailingAction
{
  id WeakRetained;
  UIAction *v4;
  UIAction *v5;
  UIAction *trailingAction;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  void *v11;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = self->_trailingAction;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "trailingActionForCapsuleCollectionView:", self);
    v5 = (UIAction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  trailingAction = self->_trailingAction;
  self->_trailingAction = v5;

  v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_trailingAction)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = v8;
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_18B7B2000, v7, OS_LOG_TYPE_DEFAULT, "Update trailing action = %@", (uint8_t *)&v13, 0xCu);

  }
  v10 = WBSIsEqual();
  if ((v10 & 1) == 0)
  {
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    if (-[NSArray count](self->_items, "count") == self->_numberOfItems + 1)
    {
      if (-[NSIndexSet containsIndex:](self->_indexesOfLoadedViews, "containsIndex:"))
      {
        -[NSArray lastObject](self->_items, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCapsuleCollectionView _fetchContentViewForItem:atIndex:](self, "_fetchContentViewForItem:atIndex:", v11, self->_numberOfItems);

      }
    }
  }

  return v10 ^ 1;
}

- (NSIndexSet)_indexesOfAnimatingItems
{
  return -[NSArray indexesOfObjectsPassingTest:](self->_items, "indexesOfObjectsPassingTest:", &__block_literal_global_114);
}

- (int64_t)selectedItemState
{
  return self->_selectedItemState;
}

- (void)startPageViewControllerDidScroll:(id)a3
{
  if (self->_inputAccessoryView)
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (void)reloadItemsAtIndexes:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  NSArray *items;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18B7B2000, v5, OS_LOG_TYPE_DEFAULT, "Reload indexes = %@", buf, 0xCu);
  }
  if (objc_msgSend(v4, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
    items = self->_items;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke;
    v9[3] = &unk_1E21E26A8;
    v9[4] = self;
    v10 = WeakRetained;
    v8 = WeakRetained;
    -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](items, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, v9);

  }
}

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSNumber *v7;
  NSNumber *nextSelectedItemIndexAfterPan;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  _DWORD v12[2];
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_selectedItemIndex != a3)
  {
    v4 = a4;
    if (-[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection")&& self->_selectionGestureState == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      nextSelectedItemIndexAfterPan = self->_nextSelectedItemIndexAfterPan;
      self->_nextSelectedItemIndexAfterPan = v7;

    }
    else
    {
      -[SFCapsuleCollectionView beginUpdates](self, "beginUpdates");
      v9 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("NO");
        if (v4)
          v10 = CFSTR("YES");
        v11 = v10;
        v12[0] = 67109378;
        v12[1] = a3;
        v13 = 2112;
        v14 = v11;
        _os_log_impl(&dword_18B7B2000, v9, OS_LOG_TYPE_DEFAULT, "Select index = %d; animated = %@",
          (uint8_t *)v12,
          0x12u);

      }
      -[SFCapsuleCollectionViewUpdate setSelectedItemIndex:animated:](self->_update, "setSelectedItemIndex:animated:", a3, v4);
      self->_selectedItemIndex = -[SFCapsuleCollectionViewUpdate selectedItemIndexAfterUpdate](self->_update, "selectedItemIndexAfterUpdate");
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
      -[SFCapsuleCollectionView endUpdates](self, "endUpdates");
    }
  }
}

- (void)endUpdates
{
  int64_t v2;
  NSObject *v4;
  SFCapsuleCollectionViewUpdate *v5;
  SFCapsuleCollectionViewUpdate *update;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  SFCapsuleCollectionViewUpdate *v32;
  void *v33;
  id WeakRetained;
  void *v35;
  SFTransitionCoordinator *v36;
  SFTransitionCoordinator *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  SFCapsuleCollectionView *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  SFCapsuleCollectionView *v67;
  SFCapsuleCollectionViewUpdate *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  BOOL v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  SFCapsuleCollectionViewUpdate *v79;
  SFCapsuleCollectionView *v80;
  BOOL v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[5];
  id v85;
  id v86;
  SFCapsuleCollectionViewUpdate *v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  _QWORD v94[5];
  _QWORD v95[5];
  id v96;
  _QWORD v97[5];
  _QWORD v98[4];
  id v99;
  uint8_t buf[16];

  v2 = self->_numberOfUpdates - 1;
  self->_numberOfUpdates = v2;
  if (!v2)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_DEFAULT, "End updates", buf, 2u);
    }
    v5 = self->_update;
    update = self->_update;
    self->_update = 0;

    if (-[SFCapsuleCollectionViewUpdate isAnimated](v5, "isAnimated"))
      v7 = -[SFCapsuleCollectionView _canAnimateUpdates](self, "_canAnimateUpdates");
    else
      v7 = 0;
    -[SFCapsuleCollectionViewUpdate indexesOfInsertedItems](v5, "indexesOfInsertedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionViewUpdate indexesOfDeletedItems](v5, "indexesOfDeletedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFCapsuleCollectionViewUpdate selectedItemIndexBeforeUpdate](v5, "selectedItemIndexBeforeUpdate");
    v11 = -[SFCapsuleCollectionViewUpdate selectedItemIndexAfterUpdate](v5, "selectedItemIndexAfterUpdate");
    if (!objc_msgSend(v9, "count") && (!objc_msgSend(v8, "count") ? (v12 = v11 == v10) : (v12 = 0), v12))
    {
      -[SFCapsuleCollectionView _updateTrailingCapsule](self, "_updateTrailingCapsule");
      -[SFCapsuleCollectionView _setSuppressingDataSourceCalls:](self, "_setSuppressingDataSourceCalls:", 0);
    }
    else
    {
      -[SFCapsuleCollectionViewUpdate itemsBeforeUpdate](v5, "itemsBeforeUpdate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionViewUpdate itemsAfterUpdate](v5, "itemsAfterUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionViewUpdate indexesOfVisibleItemsBeforeUpdate](v5, "indexesOfVisibleItemsBeforeUpdate");
      v15 = objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke;
      v98[3] = &unk_1E21E2118;
      v51 = v16;
      v99 = v51;
      objc_msgSend(v8, "indexesPassingTest:", v98);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v14;
      objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsIndex:", v10) & 1) != 0 || (unint64_t)objc_msgSend(v13, "count") <= 1)
      {
        v17 = (objc_msgSend(v8, "containsIndex:", v11) & 1) != 0 || (unint64_t)objc_msgSend(v14, "count") < 2;
        v44 = v17;
      }
      else
      {
        v44 = 0;
      }
      v45 = v11;
      v18 = objc_msgSend(v8, "count") != 1
         || objc_msgSend(v8, "firstIndex") != self->_numberOfItems - 1
         || objc_msgSend(v9, "count") != 0;
      v46 = (void *)v15;
      v48 = v13;
      if (v7)
      {
        if (!-[SFCapsuleCollectionView _isSendingTrailingAction](self, "_isSendingTrailingAction") || v18)
        {
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectsAtIndexes:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v20);

          objc_msgSend(v58, "objectsAtIndexes:", v51);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v21);

          objc_msgSend(v19, "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_10;
          v94[3] = &unk_1E21E2748;
          v94[4] = self;
          objc_msgSend(v58, "enumerateObjectsAtIndexes:options:usingBlock:", v57, 0, v94);
          v54 = (void *)MEMORY[0x1E0DC3F10];
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_11;
          v84[3] = &unk_1E21E2770;
          v84[4] = self;
          v52 = v22;
          v85 = v52;
          v86 = v13;
          v91 = v10;
          v93 = v44;
          v92 = v11;
          v87 = v5;
          v88 = v58;
          v89 = v50;
          v90 = v57;
          objc_msgSend(v54, "performWithoutAnimation:", v84);

          v55 = 0;
        }
        else
        {
          objc_msgSend(v58, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", objc_msgSend(v8, "firstIndex"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "capsuleView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCapsuleView:", 0);
          objc_msgSend(v53, "setCapsuleView:", v23);
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_2;
          v97[3] = &unk_1E21E2720;
          v97[4] = self;
          v55 = v23;
          objc_msgSend(v23, "setContentViewUpdateHandler:", v97);
          -[SFCapsuleCollectionView _dequeueOrCreateViewForItem:atIndex:](self, "_dequeueOrCreateViewForItem:atIndex:", v19, objc_msgSend(v58, "count") - 1);
          objc_msgSend(v19, "capsuleView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCapsuleContentIsValid:", 0);
          v25 = (void *)MEMORY[0x1E0DC3F10];
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_9;
          v95[3] = &unk_1E21E2258;
          v95[4] = self;
          v96 = v24;
          v26 = v24;
          objc_msgSend(v25, "safari_performWithoutRetargetingAnimations:", v95);

          v52 = 0;
        }

      }
      else
      {
        v52 = 0;
        v55 = 0;
      }
      v27 = MEMORY[0x1E0C809B0];
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_12;
      v82[3] = &unk_1E21E2118;
      v47 = v46;
      v83 = v47;
      objc_msgSend(v9, "indexesPassingTest:", v82);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0DC3F10];
      v76[0] = v27;
      v76[1] = 3221225472;
      v76[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_13;
      v76[3] = &unk_1E21E27C0;
      v30 = v48;
      v77 = v30;
      v31 = v28;
      v78 = v31;
      v32 = v5;
      v81 = v7;
      v79 = v32;
      v80 = self;
      objc_msgSend(v29, "performWithoutAnimation:", v76);
      -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
      -[SFCapsuleCollectionView _setSuppressingDataSourceCalls:](self, "_setSuppressingDataSourceCalls:", 0);
      if ((objc_msgSend(v9, "containsIndex:", v10) & 1) == 0)
        -[SFCapsuleCollectionView _updateStateFlagsForContentViewAtIndex:](self, "_updateStateFlagsForContentViewAtIndex:", -[SFCapsuleCollectionViewUpdate indexAfterUpdateOfSelectedItemBeforeUpdate](v32, "indexAfterUpdateOfSelectedItemBeforeUpdate"));
      -[SFCapsuleCollectionView _updateStateFlagsForContentViewAtIndex:](self, "_updateStateFlagsForContentViewAtIndex:", self->_selectedItemIndex);
      if (v7)
      {
        if (objc_msgSend(v8, "containsIndex:", v45))
        {
          v33 = (void *)MEMORY[0x1E0DC3F10];
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_15;
          v74[3] = &unk_1E21E2050;
          v75 = v56;
          objc_msgSend(v33, "performWithoutAnimation:", v74);

        }
        -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
        WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
        v35 = WeakRetained;
        if (WeakRetained)
          v36 = (SFTransitionCoordinator *)WeakRetained;
        else
          v36 = objc_alloc_init(SFTransitionCoordinator);
        v37 = v36;
        v49 = v9;

        if (-[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection")&& -[SFCapsuleCollectionViewLinkablePageView isSendingTrailingAction](self->_linkedPageView, "isSendingTrailingAction"))
        {
          -[SFCapsuleCollectionViewLinkablePageView animationSettingsForCapsuleSelectionGesture](self->_linkedPageView, "animationSettingsForCapsuleSelectionGesture");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFTransitionCoordinator setSpringAnimationBehavior:](v37, "setSpringAnimationBehavior:", v38);

        }
        v39 = MEMORY[0x1E0C809B0];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_16;
        v64[3] = &unk_1E21E2828;
        v65 = v58;
        v66 = v57;
        v67 = self;
        v73 = v44;
        v68 = v32;
        v72 = v10;
        v40 = v30;
        v69 = v40;
        v70 = v56;
        v41 = v31;
        v71 = v41;
        -[SFTransitionCoordinator addAnimations:](v37, "addAnimations:", v64);
        v59[0] = v39;
        v59[1] = 3221225472;
        v59[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_18;
        v59[3] = &unk_1E21E2850;
        v60 = v40;
        v61 = v41;
        v62 = self;
        v63 = v52;
        -[SFTransitionCoordinator addCompletion:](v37, "addCompletion:", v59);
        v42 = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SFTransitionCoordinator publicCoordinator](v37, "publicCoordinator");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "capsuleCollectionView:willPerformUpdateWithCoordinator:", self, v43);

        }
        -[SFTransitionCoordinator performTransitionWithAnimation:inContextOfContainerView:](v37, "performTransitionWithAnimation:inContextOfContainerView:", 1, self);
        objc_msgSend(v55, "setContentViewUpdateHandler:", 0);

        v9 = v49;
      }

    }
  }
}

- (void)beginUpdates
{
  int64_t numberOfUpdates;
  NSObject *v4;
  SFCapsuleCollectionViewUpdate *v5;
  SFCapsuleCollectionViewUpdate *update;
  uint8_t v7[16];

  numberOfUpdates = self->_numberOfUpdates;
  self->_numberOfUpdates = numberOfUpdates + 1;
  if (numberOfUpdates <= 0)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_DEFAULT, "Begin updates", v7, 2u);
    }
    -[SFCapsuleCollectionView _setSuppressingDataSourceCalls:](self, "_setSuppressingDataSourceCalls:", 1);
    v5 = -[SFCapsuleCollectionViewUpdate initWithCollectionView:]([SFCapsuleCollectionViewUpdate alloc], "initWithCollectionView:", self);
    update = self->_update;
    self->_update = v5;

  }
}

- (void)_setSuppressingDataSourceCalls:(BOOL)a3
{
  NSArray *items;
  NSIndexSet *indexesOfLoadedViews;
  _QWORD v5[5];

  if (self->_suppressingDataSourceCalls != a3)
  {
    self->_suppressingDataSourceCalls = a3;
    if (!a3)
    {
      items = self->_items;
      indexesOfLoadedViews = self->_indexesOfLoadedViews;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __58__SFCapsuleCollectionView__setSuppressingDataSourceCalls___block_invoke;
      v5[3] = &unk_1E21E2748;
      v5[4] = self;
      -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](items, "enumerateObjectsAtIndexes:options:usingBlock:", indexesOfLoadedViews, 0, v5);
    }
  }
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (NSArray)_items
{
  return self->_items;
}

uint64_t __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capsuleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(v2, "capsuleIsDetached") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (void)_layOutItems:(id)a3 atIndexes:(id)a4 selectedItemIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int64_t selectedItemState;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
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
  double Height;
  double v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double MidX;
  double MidY;
  double v45;
  CGFloat v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  int v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  char v87;
  BOOL v88;
  int v89;
  BOOL itemsAreHidden;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat MaxY;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  void (**v101)(_QWORD *__return_ptr);
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  CGFloat v108;
  CGFloat Width;
  double v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  void (**v114)(_QWORD *__return_ptr);
  double rect;
  _QWORD v116[4];
  id v117;
  SFCapsuleCollectionView *v118;
  id v119;
  id v120;
  int64_t v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  uint64_t v131;
  double v132;
  double v133;
  CGFloat v134;
  BOOL v135;
  BOOL v136;
  char v137;
  _OWORD v138[3];
  _OWORD v139[3];
  _OWORD v140[6];
  _QWORD v141[4];
  id v142;
  _QWORD aBlock[5];
  BOOL v144;
  _QWORD v145[4];
  id v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (self->_contentBorrowed)
  {
    v11 = v9;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke;
    v145[3] = &unk_1E21E2118;
    v13 = v8;
    v146 = v13;
    objc_msgSend(v10, "indexesPassingTest:", v145);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      selectedItemState = self->_selectedItemState;
      LODWORD(v15) = !self->_selectionGestureState
                  && self->_layoutStyle == 1
                  && -[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent");
      -[SFCapsuleCollectionView bounds](self, "bounds");
      v112 = v17;
      v113 = v16;
      v19 = v18;
      v111 = v20;
      -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
      Width = CGRectGetWidth(v147);
      -[SFCapsuleCollectionView defaultCapsuleHeight](self, "defaultCapsuleHeight");
      v110 = v21;
      -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
      v26 = v22;
      v27 = v23;
      rect = v24;
      v28 = v25;
      v29 = 0.0;
      if ((_DWORD)v15)
      {
        Height = CGRectGetHeight(*(CGRect *)&v22);
        -[SFCapsuleCollectionView _bottomBackdropFrame](self, "_bottomBackdropFrame");
        v31 = CGRectGetHeight(v148);
        -[SFCapsuleCollectionView _bottomBackdropFrameForAlternateContent](self, "_bottomBackdropFrameForAlternateContent");
        v29 = fmin(Height, fmax(v31 - CGRectGetHeight(v149), 0.0));
      }
      v32 = -[SFCapsuleCollectionView _contentIsDismissed](self, "_contentIsDismissed");
      aBlock[0] = v12;
      aBlock[1] = 3221225472;
      aBlock[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_2;
      aBlock[3] = &unk_1E21E24C8;
      v144 = v32;
      aBlock[4] = self;
      v114 = (void (**)(_QWORD *__return_ptr))_Block_copy(aBlock);
      if (objc_msgSend(v11, "containsIndex:", a5))
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "capsuleView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setUsesPlatterEffect:", -[SFCapsuleCollectionView _selectedItemShouldUsePlatterEffect](self, "_selectedItemShouldUsePlatterEffect"));
        -[SFCapsuleCollectionView _updateSuperviewForCapsule:](self, "_updateSuperviewForCapsule:", v34);
        v108 = v26;
        if (selectedItemState == 2 && !-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
        {
          -[SFCapsuleCollectionView _layoutMarginsForState:](self, "_layoutMarginsForState:", self->_selectedItemState);
          v104 = v52;
          v54 = v53;
          v56 = v55;
          v58 = v57;
          v156.origin.y = v112;
          v156.origin.x = v113;
          v156.size.width = v19;
          v156.size.height = v111;
          v59 = CGRectGetWidth(v156) - v54 - v58;
          objc_msgSend(v33, "capsuleHeightForWidth:defaultHeight:state:index:", 2, a5, v59, v110);
          v61 = v60;
          v106 = v19;
          if (self->_inputAccessoryView)
          {
            -[SFCapsuleCollectionView _inputAccessoryViewFrame](self, "_inputAccessoryViewFrame");
            v62 = v104 + CGRectGetMinY(v157);
          }
          else
          {
            v158.origin.y = v112;
            v158.origin.x = v113;
            v158.size.width = v19;
            v158.size.height = v111;
            v63 = CGRectGetHeight(v158);
            -[SFCapsuleCollectionView _keyboardHeightBelowCapsule](self, "_keyboardHeightBelowCapsule");
            v62 = v63 - v64 - v61 - v56;
          }
          -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
          v65 = fmin(v62, CGRectGetMinY(v159));
          objc_msgSend(v34, "ss_setUntransformedFrame:", v54, v65, v59, v61);
          v160.origin.x = v54;
          v160.origin.y = v65;
          v160.size.width = v59;
          v160.size.height = v61;
          -[SFCapsuleInputAccessorySpacerView setCapsuleHeight:](self->_inputAccessoryView, "setCapsuleHeight:", CGRectGetHeight(v160));
          v19 = v106;
        }
        else
        {
          if (-[SFCapsuleCollectionView _shouldUseNormalLayoutForMinimizedCapsule](self, "_shouldUseNormalLayoutForMinimizedCapsule"))
          {
            -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
            v36 = v35;
            v38 = v37;
            v40 = v39;
            v105 = v19;
            v42 = v41;
            v150.origin.x = v26;
            v150.origin.y = v27;
            v150.size.width = rect;
            v150.size.height = v28;
            v103 = v28;
            MidX = CGRectGetMidX(v150);
            v151.origin.x = v36;
            v151.origin.y = v38;
            v151.size.width = v40;
            v151.size.height = v42;
            v102 = MidX - CGRectGetWidth(v151) * 0.5;
            v152.origin.x = v26;
            v152.origin.y = v27;
            v152.size.width = rect;
            v152.size.height = v103;
            MidY = CGRectGetMidY(v152);
            v153.origin.x = v36;
            v153.origin.y = v38;
            v153.size.width = v40;
            v153.size.height = v42;
            v45 = MidY - CGRectGetHeight(v153) * 0.5;
            v154.origin.x = v36;
            v154.origin.y = v38;
            v154.size.width = v40;
            v154.size.height = v42;
            v46 = CGRectGetWidth(v154);
            v155.origin.x = v36;
            v155.origin.y = v38;
            v155.size.width = v40;
            v155.size.height = v42;
            v19 = v105;
            v47 = CGRectGetHeight(v155);
            v48 = v34;
            v49 = v102;
            v50 = v45;
            v28 = v103;
            v51 = v46;
          }
          else
          {
            v50 = v27 + v29;
            v47 = v28 - v29;
            v48 = v34;
            v49 = v26;
            v51 = rect;
          }
          objc_msgSend(v48, "ss_setUntransformedFrame:", v49, v50, v51, v47);
        }
        v107 = v33;
        v66 = (int)v15;
        if (self->_selectedItemUsesLiftedPreviewAppearance)
        {
          v67 = (void *)MEMORY[0x1E0DC3F10];
          v141[0] = MEMORY[0x1E0C809B0];
          v141[1] = 3221225472;
          v141[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_3;
          v141[3] = &unk_1E21E2050;
          v142 = v34;
          objc_msgSend(v67, "performWithoutAnimation:", v141);
          v15 = v142;
        }
        else
        {
          objc_msgSend(v34, "frameForShadowView");
          v69 = v68;
          v71 = v70;
          v73 = v72;
          v74 = v28;
          v75 = v27;
          v76 = v29;
          v77 = v19;
          v79 = v78;
          objc_msgSend(v34, "shadowView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v79;
          v19 = v77;
          v29 = v76;
          v27 = v75;
          v28 = v74;
          objc_msgSend(v15, "ss_setUntransformedFrame:", v69, v71, v73, v80);
        }

        -[SFCapsuleCollectionView _selectedItemContentTransform](self, "_selectedItemContentTransform");
        v140[0] = v140[3];
        v140[1] = v140[4];
        v140[2] = v140[5];
        objc_msgSend(v34, "setContentTransform:", v140);
        -[SFCapsuleCollectionView _selectedItemContentMinimizationPercent](self, "_selectedItemContentMinimizationPercent");
        objc_msgSend(v34, "setMinimizationPercent:");
        v81 = 0.0;
        LOBYTE(v15) = v66;
        if (v66)
        {
          v161.origin.x = v108;
          v161.origin.y = v27;
          v161.size.width = rect;
          v161.size.height = v28;
          v81 = CGRectGetHeight(v161);
        }
        objc_msgSend(v34, "setContentHeight:", v81);
        -[SFCapsuleCollectionView _layoutMarginsForState:](self, "_layoutMarginsForState:", self->_selectedItemState);
        v83 = v82;
        v85 = v84;
        if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
          v86 = v85;
        else
          v86 = v83;
        objc_msgSend(v34, "setAccessoryViewInsets:", 0.0, 14.0, 0.0, fmax(14.0 - v86, 0.0));
        objc_msgSend(v34, "ss_untransformedFrame");
        ((void (**)(_OWORD *__return_ptr))v114)[2](v139);
        v138[0] = v139[0];
        v138[1] = v139[1];
        v138[2] = v139[2];
        objc_msgSend(v34, "setTransform:", v138);

        v26 = v108;
      }
      v87 = (char)v15;
      v88 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
      v89 = selectedItemState == 2 || v32;
      if ((v89 & 1) != 0)
      {
        itemsAreHidden = !v32;
      }
      else if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        itemsAreHidden = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v91, "capsuleIsDetached"))
          itemsAreHidden = self->_itemsAreHidden;
        else
          itemsAreHidden = 0;

      }
      v92 = v28;
      v93 = rect;
      v94 = v27;
      v95 = v26;
      if (v89)
        -[SFCapsuleCollectionView selectedCapsuleFrame](self, "selectedCapsuleFrame", v26, v27, rect, v28);
      MaxY = CGRectGetMaxY(*(CGRect *)&v95);
      -[SFCapsuleCollectionView _interCapsuleSpacing](self, "_interCapsuleSpacing");
      v98 = v97;
      -[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_4;
      v116[3] = &unk_1E21E2518;
      v121 = a5;
      v135 = v88;
      v136 = itemsAreHidden;
      v117 = v13;
      v118 = self;
      v122 = v113;
      v123 = v112;
      v124 = v19;
      v125 = v111;
      v126 = v26;
      v127 = v27;
      v128 = rect;
      v129 = v28;
      v130 = Width;
      v131 = v98;
      v132 = v110;
      v133 = v29;
      v134 = MaxY;
      v137 = v87;
      v119 = v99;
      v120 = v114;
      v100 = v99;
      v101 = v114;
      objc_msgSend(v117, "enumerateObjectsAtIndexes:options:usingBlock:", v11, 0, v116);

    }
  }

}

void __55__SFCapsuleCollectionView__updateVisualEffectGroupName__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "capsuleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD **)(a1 + 32);
  v10 = v5;
  if (v6[124] != a3
    || (v7 = objc_msgSend(v6, "_itemsShouldUsePlatterEffect"),
        v8 = objc_msgSend(*(id *)(a1 + 32), "_selectedItemShouldUsePlatterEffect"),
        v5 = v10,
        v7 == v8))
  {
    v9 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "setVisualEffectGroupName:", v9);

}

- (BOOL)_selectedItemShouldUsePlatterEffect
{
  _BOOL4 v3;

  v3 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
  if (v3)
    LOBYTE(v3) = !self->_selectedItemUsesLiftedPreviewAppearance;
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)SFCapsuleCollectionView;
  -[SFCapsuleCollectionView layoutSubviews](&v18, sel_layoutSubviews);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__SFCapsuleCollectionView_layoutSubviews__block_invoke;
  v17[3] = &unk_1E21E2050;
  v17[4] = self;
  -[SFCapsuleCollectionView _performWithoutSettingNeedsLayout:](self, "_performWithoutSettingNeedsLayout:", v17);
  if (-[NSIndexSet count](self->_indexesOfLoadedViews, "count"))
  {
    if (!self->_numberOfUpdates)
    {
      -[SFCapsuleCollectionView _layOutItems:atIndexes:selectedItemIndex:](self, "_layOutItems:atIndexes:selectedItemIndex:", self->_items, self->_indexesOfLoadedViews, self->_selectedItemIndex);
      -[SFCapsuleCollectionView bounds](self, "bounds");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "capsuleView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ss_untransformedFrame");
      CGRectGetMinY(v19);
      UIEdgeInsetsMakeWithEdges();
      -[_UIVisualEffectBackdropView setFrame:](self->_backgroundCaptureView, "setFrame:", v4 + v16, v6 + v13, v8 - (v16 + v14), v10 - (v13 + v15));

      -[SFCapsuleCollectionView _updateCapsuleAlpha](self, "_updateCapsuleAlpha");
      -[SFCapsuleCollectionView _layOutKeyboardBackdrop](self, "_layOutKeyboardBackdrop");
      -[SFCapsuleCollectionView _updateToolbarAlpha](self, "_updateToolbarAlpha");
      -[SFCapsuleCollectionView _layOutToolbar](self, "_layOutToolbar");
      -[SFCapsuleCollectionView _layOutMinimizedProgressView](self, "_layOutMinimizedProgressView");
      -[SFCapsuleCollectionView _layOutLockdownStatusBar](self, "_layOutLockdownStatusBar");
      -[SFCapsuleCollectionView _updateContentBlurRadius](self, "_updateContentBlurRadius");
    }
  }
}

- (void)_updateToolbarAlpha
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *alternateToolbarContentView;
  double v11;
  double v12;
  double toolbarCrossfadeDelay;
  NSObject *v14;
  _QWORD v15[8];
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent");
  -[SFCapsuleCollectionView _toolbarBackdropAlpha](self, "_toolbarBackdropAlpha");
  v5 = v4;
  if (self->_keyboardHeight <= 0.0 || (v6 = 0.0, self->_layoutStyle == 2))
  {
    if (v3)
      v6 = 0.0;
    else
      v6 = v4;
  }
  v7 = (double)v3;
  -[UIView alpha](self->_toolbar, "alpha");
  if (v8 != v6
    || (-[UIVisualEffectView alpha](self->_toolbarBackdropView, "alpha"), v9 != v5)
    || (alternateToolbarContentView = self->_alternateToolbarContentView) != 0
    && (-[UIView alpha](alternateToolbarContentView, "alpha"), v11 != v7))
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      v12 = dbl_18BAD4C40[v6 == 0.0];
      toolbarCrossfadeDelay = self->_toolbarCrossfadeDelay;
    }
    else
    {
      toolbarCrossfadeDelay = 0.0;
      v12 = 0.15;
    }
    v14 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v17 = v6;
      v18 = 2048;
      v19 = v5;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_18B7B2000, v14, OS_LOG_TYPE_DEFAULT, "Set _toolbar.alpha = %f, _toolbarBackdropView.alpha = %f, _alternateToolbarContentView.alpha = %f", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__SFCapsuleCollectionView__updateToolbarAlpha__block_invoke;
    v15[3] = &unk_1E21E2B88;
    v15[4] = self;
    *(double *)&v15[5] = v6;
    *(double *)&v15[6] = v5;
    *(double *)&v15[7] = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331654, v15, 0, v12, toolbarCrossfadeDelay);
  }
}

- (void)_updateCapsuleAlpha
{
  void *v3;
  char v4;
  double v5;
  double v6;
  char v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  BOOL v14;
  NSArray *items;
  NSIndexSet *indexesOfLoadedViews;
  _QWORD v17[9];
  char v18;
  BOOL v19;

  if (-[NSArray count](self->_items, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "capsuleIsDetached");

    -[SFCapsuleCollectionView _selectedItemBackgroundAlpha](self, "_selectedItemBackgroundAlpha");
    v6 = v5;
    v7 = -[SFCapsuleCollectionView _capsuleAlphaOptionsForSelectionGesture](self, "_capsuleAlphaOptionsForSelectionGesture");
    v8 = 0.0;
    if ((v7 & 2) != 0)
      v6 = 0.0;
    if ((v7 & 1) != 0)
      v9 = 0.0;
    else
      v9 = 1.0;
    v10 = 0.0;
    if ((v7 & 4) != 0)
    {
      v11 = -[SFCapsuleCollectionView _nextItemIndexForSelectionGesture](self, "_nextItemIndexForSelectionGesture");
      -[SFCapsuleCollectionView _percentToSelectItemIndex:](self, "_percentToSelectItemIndex:", v11);
      v10 = 1.0;
      if (v12 + v12 < 1.0)
      {
        -[SFCapsuleCollectionView _percentToSelectItemIndex:](self, "_percentToSelectItemIndex:", v11);
        v10 = v13 + v13;
      }
    }
    if (!self->_selectedItemState)
      v8 = v6;
    v14 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
    items = self->_items;
    indexesOfLoadedViews = self->_indexesOfLoadedViews;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__SFCapsuleCollectionView__updateCapsuleAlpha__block_invoke;
    v17[3] = &unk_1E21E2A28;
    v17[4] = self;
    v18 = v4;
    *(double *)&v17[5] = v9;
    *(double *)&v17[6] = v10;
    *(double *)&v17[7] = v8;
    *(double *)&v17[8] = v6;
    v19 = v14;
    -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](items, "enumerateObjectsAtIndexes:options:usingBlock:", indexesOfLoadedViews, 0, v17);
  }
}

void __46__SFCapsuleCollectionView__updateCapsuleAlpha__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  char v7;
  id WeakRetained;
  char v9;
  uint64_t v10;
  void *v12;
  double v13;
  void *v14;
  double *v15;
  uint64_t v16;
  char v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;

  v5 = a2;
  objc_msgSend(v5, "capsuleView");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992);
  v7 = objc_msgSend(v5, "capsuleIsDetached");

  if ((v7 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 904));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(WeakRetained, "capsuleCollectionView:shouldHideShadowForItemAtIndex:", *(_QWORD *)(a1 + 32), a3);
    else
      v9 = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 874))
    {
      if (!*(_BYTE *)(v10 + 875))
      {
        if (!*(_BYTE *)(a1 + 72))
          goto LABEL_15;
        goto LABEL_17;
      }
    }
    else if (!*(_BYTE *)(v10 + 875))
    {
      goto LABEL_17;
    }
    if (v6 != a3 || *(_QWORD *)(v10 + 1000) == 0)
    {
LABEL_15:
      objc_msgSend(v35, "shadowView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 0.0);

      objc_msgSend(v35, "setAlpha:", 0.0);
      if (v6 == a3)
        goto LABEL_43;
LABEL_35:
      v25 = *(_QWORD *)(a1 + 32);
      v26 = fmax(fmin(*(double *)(v25 + 952) * *(double *)(a1 + 64), 1.0), 0.0);
      if (*(_QWORD *)(v25 + 1000))
        v27 = 1.0;
      else
        v27 = v26;
      objc_msgSend(v35, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAlpha:", v27);

      objc_msgSend(v35, "backgroundView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 1.0);

      if (*(_BYTE *)(a1 + 73))
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) == 0;
LABEL_45:
        objc_msgSend(v35, "setForceMinimizedTheme:", v30);

        goto LABEL_46;
      }
LABEL_44:
      v30 = 0;
      goto LABEL_45;
    }
LABEL_17:
    if (v6 != a3)
    {
      v13 = 0.0;
      if (*(_QWORD *)(v10 + 888) == a3)
      {
        if ((v9 & 1) == 0)
          v13 = *(double *)(a1 + 48);
        objc_msgSend(v35, "shadowView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAlpha:", v13);

        v15 = (double *)(a1 + 48);
      }
      else
      {
        if ((v9 & 1) == 0)
          v13 = *(double *)(a1 + 56);
        objc_msgSend(v35, "shadowView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAlpha:", v13);

        v15 = (double *)(a1 + 64);
      }
      objc_msgSend(v35, "setAlpha:", *v15);
      goto LABEL_35;
    }
    v16 = *(_QWORD *)(v10 + 976);
    if (v16 == 2 || v16 == 1)
    {
      objc_msgSend(v35, "shadowView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = 0.0;
    }
    else
    {
      if (v16)
      {
LABEL_42:
        objc_msgSend(v35, "setAlpha:", *(double *)(a1 + 40));
LABEL_43:
        objc_msgSend(v35, "contentView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAlpha:", 1.0);

        objc_msgSend(*(id *)(a1 + 32), "_selectedItemBackgroundAlpha");
        v33 = v32;
        objc_msgSend(v35, "backgroundView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAlpha:", v33);

        goto LABEL_44;
      }
      if (*(_BYTE *)(v10 + 876))
        v17 = 1;
      else
        v17 = v9;
      v18 = 0.0;
      if ((v17 & 1) == 0)
      {
        v19 = *(double *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "_selectedItemBackgroundAlpha");
        v18 = v19 * v20;
      }
      objc_msgSend(v35, "shadowView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = v18;
    }
    objc_msgSend(v21, "setAlpha:", v23);

    goto LABEL_42;
  }
LABEL_46:

}

- (double)_toolbarBackdropAlpha
{
  double result;
  _BOOL4 v3;

  result = 0.0;
  if (self->_selectedItemState != 2)
  {
    v3 = -[SFCapsuleCollectionView _contentIsDismissed](self, "_contentIsDismissed", 0.0);
    result = 1.0;
    if (v3)
      return 0.0;
  }
  return result;
}

- (CGAffineTransform)_selectedItemContentTransform
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  result = (CGAffineTransform *)-[SFCapsuleCollectionView _shouldInteractivelySquish](self, "_shouldInteractivelySquish");
  if ((result & 1) != 0
    && ((result = (CGAffineTransform *)-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"), !(_DWORD)result)|| (result = (CGAffineTransform *)-[SFCapsuleCollectionView _shouldUseNormalLayoutForMinimizedCapsule](self, "_shouldUseNormalLayoutForMinimizedCapsule"), (result & 1) != 0))&& (self->_minimizationFlags & 1) != 0)
  {
    -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
    v16 = v8;
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
    UIRectGetCenter();
    v10 = v9;
    UIRectGetCenter();
    v12 = _SFInterpolate(v10, v11, v16);
    -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
    UIRectGetCenter();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, 0.0, v12 - v13);
    -[SFCapsuleCollectionView _minimizedContentScale](self, "_minimizedContentScale");
    v15 = _SFInterpolate(1.0, v14, v16);
    v17 = v18;
    return CGAffineTransformScale(retstr, &v17, v15, v15);
  }
  else
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (BOOL)_shouldUseNormalLayoutForMinimizedCapsule
{
  _BOOL4 v3;
  double v4;

  v3 = -[SFCapsuleCollectionView _shouldInteractivelySquish](self, "_shouldInteractivelySquish");
  if (v3)
  {
    if ((self->_minimizationFlags & 1) == 0)
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    v3 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
    if (v3)
    {
      if ((self->_minimizationFlags & 4) == 0)
        goto LABEL_5;
      -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
      LOBYTE(v3) = v4 < 1.0;
    }
  }
  return v3;
}

- (BOOL)_shouldInteractivelySquish
{
  _BOOL4 v3;

  v3 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
  if (v3)
    LOBYTE(v3) = self->_minimizationStyle == 0;
  return v3;
}

- (double)_selectedItemContentMinimizationPercent
{
  double v2;

  -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
  return _SFClampPercent(v2, 0.0, 0.3);
}

- (CGRect)_selectedCapsuleFrame
{
  double v3;
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

  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
  else
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  -[SFCapsuleCollectionView _verticalOffsetForSelectedItem](self, "_verticalOffsetForSelectedItem");
  v12 = v11 + v8 + self->_offsetForPan.y;
  v13 = v7 + self->_offsetForPan.x;
  v14 = v9;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (double)_verticalOffsetForSelectedItem
{
  double result;

  -[SFCapsuleCollectionView _verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:](self, "_verticalOffsetForSelectedItemWithMinimizationOffsetMultiplier:includeKeyboard:", 1, 1.0);
  return result;
}

- (void)_performWithoutSettingNeedsLayout:(id)a3
{
  BOOL ignoreSetNeedsLayout;

  ignoreSetNeedsLayout = self->_ignoreSetNeedsLayout;
  self->_ignoreSetNeedsLayout = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoreSetNeedsLayout = ignoreSetNeedsLayout;
}

uint64_t __41__SFCapsuleCollectionView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutMargins");
}

- (void)_updateLayoutMargins
{
  double v3;
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
  BOOL v15;

  -[SFCapsuleCollectionView bounds](self, "bounds");
  v7 = SFCapsuleSideMarginForViewWithBoundsSafeAreaInsets(v3, v4, v5, v6);
  -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
  v9 = v8;
  -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
  v15 = v7 == v13 && v9 == v10 && v7 == v12;
  if (!v15 || v11 != 0.0)
    -[SFCapsuleCollectionView setLayoutMargins:](self, "setLayoutMargins:", v9, v7, 0.0, v7);
}

- (void)_layOutMinimizedProgressView
{
  UIView *v3;
  UIView *contentView;
  _BOOL4 v5;
  double MinY;
  double v7;
  double v8;
  double v9;
  double v10;
  double Width;
  double v12;
  CGRect v13;
  CGRect v14;

  -[_SFFluidProgressView superview](self->_minimizedProgressView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;

  if (v3 == contentView)
  {
    v5 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
    MinY = 0.0;
    if (!v5)
    {
      -[UIVisualEffectView frame](self->_toolbarBackdropView, "frame");
      MinY = CGRectGetMinY(v13);
    }
    -[SFCapsuleCollectionView obscuredInsetsIgnoringKeyboard](self, "obscuredInsetsIgnoringKeyboard");
    v8 = v7;
    v10 = v9;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Width = CGRectGetWidth(v14);
    if (v5)
      v12 = v8;
    else
      v12 = v10;
    -[_SFFluidProgressView setFrame:](self->_minimizedProgressView, "setFrame:", 0.0, MinY, Width, v12);
  }
}

- (UIEdgeInsets)obscuredInsets
{
  double topBackdropHeightPresentationValue;
  double Height;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  UIEdgeInsets result;

  if (self->_backdropHeightAnimationCount)
  {
    topBackdropHeightPresentationValue = self->_topBackdropHeightPresentationValue;
    -[UIVisualEffectView bounds](self->_toolbarBackdropView, "bounds");
    Height = CGRectGetHeight(v7);
    v4 = 0.0;
    v5 = 0.0;
    v6 = topBackdropHeightPresentationValue;
  }
  else
  {
    -[SFCapsuleCollectionView _obscuredInsetsIgnoringAnimation](self, "_obscuredInsetsIgnoringAnimation");
  }
  result.right = v5;
  result.bottom = Height;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)_obscuredInsetsIgnoringAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[SFCapsuleCollectionView _insetsByApplyingSelectedItemOffsetToInsetsForState:includeKeyboard:](self, "_insetsByApplyingSelectedItemOffsetToInsetsForState:includeKeyboard:", self->_selectedItemState, 1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (self->_alwaysShowTopBackdrop)
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
  v10 = v5;
  v11 = v7;
  v12 = v9;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)obscuredInsetsIgnoringKeyboard
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (self->_showingKeyboard)
  {
    self->_showingKeyboard = 0;
    -[SFCapsuleCollectionView _insetsByApplyingSelectedItemOffsetToInsetsForState:includeKeyboard:](self, "_insetsByApplyingSelectedItemOffsetToInsetsForState:includeKeyboard:", self->_selectedItemStateBeforeShowingKeyboard, 0);
    self->_showingKeyboard = 1;
  }
  else
  {
    -[SFCapsuleCollectionView obscuredInsets](self, "obscuredInsets");
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_layOutLockdownStatusBar
{
  _BOOL4 v3;
  int64_t selectedItemState;
  _BOOL4 v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  UIView *v10;
  UIView *contentView;
  double v12;
  double v13;
  double v14;
  double v15;
  double Width;
  double MaxY;
  double v18;
  double v19;
  double v20;
  double MinY;
  double v22;
  double v23;
  SFLockdownStatusBar *lockdownStatusBar;
  _OWORD v25[6];
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
  selectedItemState = self->_selectedItemState;
  v5 = -[SFCapsuleCollectionView _contentIsDismissed](self, "_contentIsDismissed");
  v6 = 0.0;
  if (!self->_itemsAreHidden)
  {
    v7 = v5;
    if (!-[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent"))
    {
      v8 = selectedItemState != 2 || v3;
      if (self->_offsetForPan.y == 0.0 && v8)
        v6 = (double)!v7;
    }
  }
  -[SFLockdownStatusBar setAlpha:](self->_lockdownStatusBar, "setAlpha:", v6);
  -[SFLockdownStatusBar superview](self->_lockdownStatusBar, "superview");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;

  if (v10 == contentView)
  {
    -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
    v13 = v12;
    -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
    v15 = v14;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Width = CGRectGetWidth(v26);
    if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
    {
      -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
      MaxY = CGRectGetMaxY(v27);
      -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", v13);
      v19 = MaxY + v18;
      -[SFCapsuleCollectionView _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:](self, "_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:", v13);
    }
    else
    {
      -[UIVisualEffectView frame](self->_toolbarBackdropView, "frame");
      MinY = CGRectGetMinY(v28);
      -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", v13);
      v19 = MinY + v22;
      -[SFCapsuleCollectionView _auxiliaryBarSquishedHeightDecrease](self, "_auxiliaryBarSquishedHeightDecrease");
      v20 = _SFInterpolate(0.0, v23 * 0.5, v13);
    }
    -[UIView ss_setUntransformedFrame:](self->_lockdownStatusBar, "ss_setUntransformedFrame:", 0.0, v19 - v20, Width, v15);
    -[SFCapsuleCollectionView _lockdownIndicatorTransform](self, "_lockdownIndicatorTransform");
    lockdownStatusBar = self->_lockdownStatusBar;
    v25[0] = v25[3];
    v25[1] = v25[4];
    v25[2] = v25[5];
    -[SFLockdownStatusBar setTransform:](lockdownStatusBar, "setTransform:", v25);
  }
}

- (void)_layOutKeyboardBackdrop
{
  UIKBVisualEffectView *keyboardBackdropView;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int64_t selectedItemState;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  UIKBVisualEffectView *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MinY;
  double MaxY;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  id v37;
  _QWORD v38[10];
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
  {
    -[UIKBVisualEffectView removeFromSuperview](self->_keyboardBackdropView, "removeFromSuperview");
    keyboardBackdropView = self->_keyboardBackdropView;
    self->_keyboardBackdropView = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView bounds](self, "bounds");
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    selectedItemState = self->_selectedItemState;
    v9 = CGRectGetWidth(v39) - 16.0 - 16.0;
    -[SFCapsuleCollectionView defaultCapsuleHeight](self, "defaultCapsuleHeight");
    objc_msgSend(v37, "capsuleHeightForWidth:defaultHeight:state:index:", 2, self->_selectedItemIndex, v9, v10);
    v12 = 12.0;
    v13 = self->_keyboardBackdropView;
    v35 = v11 + 12.0 + 3.0;
    v36 = height;
    if (selectedItemState == 2)
    {
      if (!v13)
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __50__SFCapsuleCollectionView__layOutKeyboardBackdrop__block_invoke;
        v38[3] = &unk_1E21E2590;
        *(CGFloat *)&v38[5] = x;
        *(CGFloat *)&v38[6] = y;
        *(CGFloat *)&v38[7] = width;
        *(CGFloat *)&v38[8] = height;
        *(double *)&v38[9] = v11 + 12.0 + 3.0;
        v38[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v38);
        v13 = self->_keyboardBackdropView;
      }
      v14 = width;
      v15 = y;
      v16 = x;
      v17 = 1.0;
    }
    else
    {
      v14 = width;
      v15 = y;
      v16 = x;
      v17 = 0.0;
    }
    -[UIKBVisualEffectView setAlpha:](v13, "setAlpha:", v17);
    objc_msgSend(v37, "capsuleView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v40.origin.x = v20;
    v40.origin.y = v22;
    v40.size.width = v24;
    v40.size.height = v26;
    MinY = CGRectGetMinY(v40);
    if (selectedItemState != 2)
      v12 = 8.0;
    if (self->_inputAccessoryView)
    {
      -[SFCapsuleCollectionView _inputAccessoryViewFrame](self, "_inputAccessoryViewFrame");
      MaxY = CGRectGetMaxY(v41);
      v29 = v16;
      v30 = v15;
      v31 = v14;
      v32 = v36;
    }
    else
    {
      v29 = v16;
      v42.origin.x = v16;
      v30 = v15;
      v42.origin.y = v15;
      v31 = v14;
      v42.size.width = v14;
      v32 = v36;
      v42.size.height = v36;
      MaxY = v35 + CGRectGetHeight(v42);
    }
    v33 = MinY - v12;
    v34 = v33;
    if (self->_itemsAreHidden)
    {
      v43.origin.x = v29;
      v43.origin.y = v30;
      v43.size.width = v31;
      v43.size.height = v32;
      v34 = CGRectGetHeight(v43);
    }
    v44.origin.x = v29;
    v44.origin.y = v30;
    v44.size.width = v31;
    v44.size.height = v32;
    -[UIKBVisualEffectView setFrame:](self->_keyboardBackdropView, "setFrame:", 0.0, v34, CGRectGetWidth(v44), MaxY - v33);
    keyboardBackdropView = (UIKBVisualEffectView *)v37;
  }

}

- (unint64_t)_capsuleAlphaOptionsForSelectionGesture
{
  double v3;
  unint64_t panAxis;
  unint64_t v6;

  if (!self->_selectionGestureState)
    return 0;
  -[SFCapsuleCollectionView _panGestureTranslationConstrainedToPanAxis](self, "_panGestureTranslationConstrainedToPanAxis");
  panAxis = self->_panAxis;
  if (v3 < 0.0 && panAxis == 2)
    v6 = 2;
  else
    v6 = 0;
  if (panAxis == 2 && v3 < -50.0)
    v6 |= self->_linkedPageView == 0;
  if (-[SFCapsuleCollectionView _nextItemIndexForSelectionGesture](self, "_nextItemIndexForSelectionGesture") == self->_numberOfItems
    && self->_selectionGestureState != 2
    && panAxis != 2)
  {
    v6 |= 4uLL;
  }
  return v6;
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  char v11;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "deletedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_14;
  v8[3] = &unk_1E21E2798;
  v11 = *(_BYTE *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

- (void)reloadData
{
  int64_t numberOfUpdates;
  void *v4;
  uint64_t v5;
  SFCapsuleCollectionViewUpdate *update;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[5];

  numberOfUpdates = self->_numberOfUpdates;
  -[SFCapsuleCollectionViewUpdate deletedItems](self->_update, "deletedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke;
  v11[3] = &unk_1E21E2630;
  v11[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  update = self->_update;
  self->_update = 0;

  self->_numberOfUpdates = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke_2;
  v10[3] = &unk_1E21E2658;
  v10[4] = self;
  v10[5] = numberOfUpdates;
  objc_msgSend(v7, "setHandler:", v10);
  -[SFCapsuleCollectionView _reloadDataWithoutLayout](self, "_reloadDataWithoutLayout");
  -[SFCapsuleCollectionView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __37__SFCapsuleCollectionView_reloadData__block_invoke_3;
    v9[3] = &unk_1E21E2050;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
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
    -[SFCapsuleCollectionView _reloadDataWithoutLayout](self, "_reloadDataWithoutLayout");
    v5 = obj;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SFCapsuleCollectionView _updateToolbar](self, "_updateToolbar");
    -[SFCapsuleCollectionView _reloadDataWithoutLayout](self, "_reloadDataWithoutLayout");
    v5 = obj;
  }

}

- (void)_updateToolbar
{
  UIView **p_toolbar;
  UIView *v4;
  id WeakRetained;
  UIView *v6;
  UIView *v7;
  UIView *contentView;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self->_contentBorrowed)
  {
    p_toolbar = &self->_toolbar;
    v4 = self->_toolbar;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "createToolbarForCapsuleCollectionView:", self);
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (v4 != v6
      || (-[UIView superview](v4, "superview"),
          v7 = (UIView *)objc_claimAutoreleasedReturnValue(),
          contentView = self->_contentView,
          v7,
          v7 != contentView))
    {
      -[UIView removeFromSuperview](v4, "removeFromSuperview");
      objc_storeStrong((id *)p_toolbar, v6);
      if (v6)
      {
        if (SFEnhancedTabOverviewEnabled())
        {
          objc_msgSend(MEMORY[0x1E0CD2780], "safari_gaussianBlurWithRadius:", 0.0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView layer](*p_toolbar, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFilters:", v10);

        }
        -[SFCapsuleCollectionView _createToolbarBackdropIfNeeded](self, "_createToolbarBackdropIfNeeded");
        -[UIView insertSubview:aboveSubview:](self->_contentView, "insertSubview:aboveSubview:", *p_toolbar, self->_toolbarBackdropView);
        -[SFCapsuleCollectionView _updateToolbarTheme](self, "_updateToolbarTheme");
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __41__SFCapsuleCollectionView__updateToolbar__block_invoke;
        v12[3] = &unk_1E21E2050;
        v12[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
      }
    }

  }
}

- (void)setTheme:(id)a3
{
  id v5;
  SFCapsuleNavigationBarTheme *v6;
  SFCapsuleNavigationBarTheme *effectiveTheme;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SFCapsuleNavigationBarTheme *v13;
  void *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[_SFBarTheme isEqual:](self->_theme, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    +[_SFBarTheme themeWithTheme:](SFCapsuleNavigationBarTheme, "themeWithTheme:", v5);
    v6 = (SFCapsuleNavigationBarTheme *)objc_claimAutoreleasedReturnValue();
    effectiveTheme = self->_effectiveTheme;
    self->_effectiveTheme = v6;

    -[SFCapsuleCollectionView _updateToolbarTheme](self, "_updateToolbarTheme");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = self->_items;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = self->_effectiveTheme;
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "capsuleView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTheme:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_viewsForReuse;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "setTheme:", self->_effectiveTheme, (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (void)_updateToolbarTheme
{
  _SFBarTheme *theme;
  _SFBarTheme *v4;
  _SFBarTheme *toolbarTheme;

  theme = self->_theme;
  if (theme)
  {
    if (self->_toolbarBackdropView)
    {
      +[_SFBarTheme themeWithBarTintStyle:](_SFBarTheme, "themeWithBarTintStyle:", -[_SFBarTheme tintStyle](theme, "tintStyle"));
      v4 = (_SFBarTheme *)objc_claimAutoreleasedReturnValue();
      toolbarTheme = self->_toolbarTheme;
      self->_toolbarTheme = v4;
    }
    else
    {
      toolbarTheme = self->_toolbarTheme;
      self->_toolbarTheme = 0;
    }

    -[SFCapsuleNavigationBarTheme setBackgroundTheme:](self->_effectiveTheme, "setBackgroundTheme:", self->_toolbarTheme);
    -[SFCapsuleCollectionView _applyToolbarTheme](self, "_applyToolbarTheme");
  }
}

- (void)_applyToolbarTheme
{
  void *v3;
  _SFBarTheme *toolbarTheme;

  -[_SFBarTheme controlsTintColor](self->_toolbarTheme, "controlsTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_toolbar, "setTintColor:", v3);

  if (self->_toolbarBackdropView)
  {
    if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop")
      || !-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized")
      || (toolbarTheme = self->_minimizedTheme) == 0
      || self->_minimizationStyle)
    {
      toolbarTheme = self->_toolbarTheme;
    }
    -[_SFBarTheme applyBackdropEffectsToView:](toolbarTheme, "applyBackdropEffectsToView:", self->_toolbarBackdropView);
  }
  -[SFCapsuleCollectionView _updateVisualEffectGroupName](self, "_updateVisualEffectGroupName");
}

void __58__SFCapsuleCollectionView__setSuppressingDataSourceCalls___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "capsuleContentIsValid") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchContentViewForItem:atIndex:", v5, a3);
    objc_msgSend(v5, "setCapsuleContentIsValid:", 1);
  }

}

- (double)minimizedCapsuleHeightAboveKeyboard
{
  double keyboardHeight;
  BOOL showingKeyboard;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double result;
  CGRect v20;

  keyboardHeight = self->_keyboardHeight;
  showingKeyboard = self->_showingKeyboard;
  self->_showingKeyboard = 1;
  self->_keyboardHeight = 999.0;
  -[SFCapsuleCollectionView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
  v14 = v8 + v13;
  v17 = v10 - (v15 + v16);
  v20.size.height = v12 - (v13 + v18);
  v20.origin.x = v6 + v15;
  v20.origin.y = v14;
  v20.size.width = v17;
  -[SFCapsuleCollectionView _selectedCapsuleHeightForWidth:state:ignoringKeyboard:](self, "_selectedCapsuleHeightForWidth:state:ignoringKeyboard:", 1, 0, CGRectGetWidth(v20));
  self->_showingKeyboard = showingKeyboard;
  self->_keyboardHeight = keyboardHeight;
  return result;
}

- (unint64_t)selectionGestureAxis
{
  if (self->_selectionGestureState)
    return self->_panAxis;
  else
    return 0;
}

- (void)_createToolbarBackdropIfNeeded
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *toolbarBackdropView;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double Width;
  UIView *v13;
  UIView *bottomSeparator;
  void *v15;
  void *v16;
  _QWORD v17[2];
  CGRect v18;

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_toolbarBackdropView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
    toolbarBackdropView = self->_toolbarBackdropView;
    self->_toolbarBackdropView = v5;

    -[UIVisualEffectView _setCaptureView:](self->_toolbarBackdropView, "_setCaptureView:", self->_backgroundCaptureView);
    if (SFEnhancedTabOverviewEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "safari_gaussianBlurWithRadius:", 0.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView layer](self->_toolbarBackdropView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v8);

    }
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIVisualEffectView contentView](self->_toolbarBackdropView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    Width = CGRectGetWidth(v18);
    v13 = (UIView *)objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, Width, _SFOnePixel());
    bottomSeparator = self->_bottomSeparator;
    self->_bottomSeparator = v13;

    -[UIView setAutoresizingMask:](self->_bottomSeparator, "setAutoresizingMask:", 34);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v15);

    -[UIVisualEffectView contentView](self->_toolbarBackdropView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_bottomSeparator);

    -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_toolbarBackdropView, 0);
  }
}

- (SFCapsuleCollectionView)initWithFrame:(CGRect)a3
{
  SFCapsuleCollectionView *v3;
  uint64_t v4;
  NSIndexSet *indexesOfLoadedViews;
  uint64_t v6;
  NSHashTable *gestureObservers;
  uint64_t v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  _UIVisualEffectBackdropView *v10;
  _UIVisualEffectBackdropView *backgroundCaptureView;
  id v12;
  uint64_t v13;
  UIView *contentView;
  _SFFluidProgressView *v15;
  _SFFluidProgressView *minimizedProgressView;
  NSArray *items;
  uint64_t v18;
  NSMutableSet *viewsForReuse;
  uint64_t v20;
  NSMutableDictionary *contentViewRegistrations;
  UISelectionFeedbackGenerator *v22;
  UISelectionFeedbackGenerator *feedbackGenerator;
  uint64_t v24;
  UIPanGestureRecognizer *panGesture;
  uint64_t v26;
  UIPanGestureRecognizer *dismissPanGestureRecognizer;
  uint64_t v28;
  UIViewSpringAnimationBehaviorDescribing *blurSpringBehavior;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *selectedItemAccessoryViews;
  void *v36;
  id v37;
  void *v38;
  id v39;
  SFCapsuleCollectionView *v40;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)SFCapsuleCollectionView;
  v3 = -[SFCapsuleCollectionView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v4 = objc_claimAutoreleasedReturnValue();
    indexesOfLoadedViews = v3->_indexesOfLoadedViews;
    v3->_indexesOfLoadedViews = (NSIndexSet *)v4;

    v3->_layoutStyle = 1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    gestureObservers = v3->_gestureObservers;
    v3->_gestureObservers = (NSHashTable *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__didReceiveTap_);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v8;

    -[UITapGestureRecognizer setDelegate:](v3->_tapGestureRecognizer, "setDelegate:", v3);
    -[SFCapsuleCollectionView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGestureRecognizer);
    v10 = (_UIVisualEffectBackdropView *)objc_alloc_init(MEMORY[0x1E0DC4498]);
    backgroundCaptureView = v3->_backgroundCaptureView;
    v3->_backgroundCaptureView = v10;

    -[_UIVisualEffectBackdropView setUserInteractionEnabled:](v3->_backgroundCaptureView, "setUserInteractionEnabled:", 0);
    -[SFCapsuleCollectionView addSubview:](v3, "addSubview:", v3->_backgroundCaptureView);
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFCapsuleCollectionView bounds](v3, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v13;

    -[UIView setAutoresizingMask:](v3->_contentView, "setAutoresizingMask:", 18);
    -[SFCapsuleCollectionView addSubview:](v3, "addSubview:", v3->_contentView);
    v15 = objc_alloc_init(_SFFluidProgressView);
    minimizedProgressView = v3->_minimizedProgressView;
    v3->_minimizedProgressView = v15;

    -[_SFFluidProgressView setDelegate:](v3->_minimizedProgressView, "setDelegate:", v3);
    -[_SFFluidProgressView setAlignsToTop:](v3->_minimizedProgressView, "setAlignsToTop:", 1);
    -[SFCapsuleCollectionView _updateShowsMinimizedProgressView](v3, "_updateShowsMinimizedProgressView");
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_minimizedProgressView);
    items = v3->_items;
    v3->_items = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    viewsForReuse = v3->_viewsForReuse;
    v3->_viewsForReuse = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    contentViewRegistrations = v3->_contentViewRegistrations;
    v3->_contentViewRegistrations = (NSMutableDictionary *)v20;

    v3->_capsuleWidth = -1.0;
    v3->_keepsCapsulesAboveKeyboard = 1;
    v3->_selectionGestureLimit = 1;
    -[SFCapsuleCollectionView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    v3->_usesFastDeceleration = 0;
    v22 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel__didReceivePan_);
    panGesture = v3->_panGesture;
    v3->_panGesture = (UIPanGestureRecognizer *)v24;

    -[UIPanGestureRecognizer setDelegate:](v3->_panGesture, "setDelegate:", v3);
    -[SFCapsuleCollectionView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_panGesture);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel__didReceiveDismissPan_);
    dismissPanGestureRecognizer = v3->_dismissPanGestureRecognizer;
    v3->_dismissPanGestureRecognizer = (UIPanGestureRecognizer *)v26;

    -[UIPanGestureRecognizer setDelegate:](v3->_dismissPanGestureRecognizer, "setDelegate:", v3);
    -[SFCapsuleCollectionView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_dismissPanGestureRecognizer);
    -[SFCapsuleCollectionView _updateCanBlurCapsules](v3, "_updateCanBlurCapsules");
    objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", 1.0, 0.45);
    v28 = objc_claimAutoreleasedReturnValue();
    blurSpringBehavior = v3->_blurSpringBehavior;
    v3->_blurSpringBehavior = (UIViewSpringAnimationBehaviorDescribing *)v28;

    if (SFEnhancedTabOverviewEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "safari_gaussianBlurWithRadius:", 0.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](v3->_contentView, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFilters:", v31);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v3, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v33, "addObserver:selector:name:object:", v3, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v33, "addObserver:selector:name:object:", v3, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v33, "addObserver:selector:name:object:", v3, sel__keyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);
    -[SFCapsuleCollectionView registerContentViewIdentifier:block:](v3, "registerContentViewIdentifier:block:", CFSTR("SFCapsuleCollectionViewActionContentView"), &__block_literal_global_1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    selectedItemAccessoryViews = v3->_selectedItemAccessoryViews;
    v3->_selectedItemAccessoryViews = (NSMutableDictionary *)v34;

    v43 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)-[SFCapsuleCollectionView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v36, v3, sel__preferredContentSizeCategoryDidChange);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)-[SFCapsuleCollectionView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v38, v3, sel__updateKeyboardBackdropViewStyle);

    v40 = v3;
  }

  return v3;
}

- (void)registerContentViewIdentifier:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  SFCapsuleContentViewRegistration *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SFCapsuleContentViewRegistration initWithCreateViewBlock:]([SFCapsuleContentViewRegistration alloc], "initWithCreateViewBlock:", v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentViewRegistrations, "setObject:forKeyedSubscript:", v8, v7);
}

- (void)setMinimizationStyle:(int64_t)a3
{
  self->_minimizationStyle = a3;
}

- (void)_updateMinimizedProgressViewFillColor
{
  BOOL v3;
  SFCapsuleNavigationBarTheme *effectiveMinimizedTheme;
  id v5;

  v3 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
  effectiveMinimizedTheme = self->_effectiveMinimizedTheme;
  if (v3)
    -[_SFBarTheme controlsTintColor](effectiveMinimizedTheme, "controlsTintColor");
  else
    -[_SFBarTheme platterProgressBarTintColor](effectiveMinimizedTheme, "platterProgressBarTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFFluidProgressView setProgressBarFillColor:](self->_minimizedProgressView, "setProgressBarFillColor:", v5);

}

- (void)setNavigationBarItem:(id)a3
{
  SFNavigationBarItem *v5;
  SFNavigationBarItem **p_navigationBarItem;
  SFNavigationBarItem *navigationBarItem;
  void *v8;
  void *v9;
  _SFFluidProgressView *minimizedProgressView;
  void *v11;
  void *v12;
  SFNavigationBarItem *v13;

  v5 = (SFNavigationBarItem *)a3;
  p_navigationBarItem = &self->_navigationBarItem;
  navigationBarItem = self->_navigationBarItem;
  v13 = v5;
  if (navigationBarItem != v5)
  {
    -[SFNavigationBarItem fluidProgressController](navigationBarItem, "fluidProgressController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterObserver:", self->_minimizedProgressView);

    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    -[SFNavigationBarItem fluidProgressController](*p_navigationBarItem, "fluidProgressController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", self->_minimizedProgressView);

    minimizedProgressView = self->_minimizedProgressView;
    -[SFNavigationBarItem fluidProgressStateSource](*p_navigationBarItem, "fluidProgressStateSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "progressState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFluidProgressView setProgressToCurrentPositionForState:](minimizedProgressView, "setProgressToCurrentPositionForState:", v12);

    -[SFLockdownStatusBar setNavigationBarItem:](self->_lockdownStatusBar, "setNavigationBarItem:", v13);
    -[SFCapsuleCollectionView _updateShowsMinimizedProgressView](self, "_updateShowsMinimizedProgressView");
  }

}

- (void)_updateShowsMinimizedProgressView
{
  _BOOL4 v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = !-[_SFFluidProgressView isShowingProgress](self->_minimizedProgressView, "isShowingProgress")
    || self->_selectedItemState != 1
    || self->_showingAlternateToolbarContent
    || self->_minimizationStyle == 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__SFCapsuleCollectionView__updateShowsMinimizedProgressView__block_invoke;
    v6[3] = &unk_1E21E2230;
    v6[4] = self;
    v7 = v3;
    objc_msgSend(WeakRetained, "addAnimations:", v6);
  }
  else
  {
    -[_SFFluidProgressView setAlpha:](self->_minimizedProgressView, "setAlpha:", (double)!v3);
  }

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  -[SFCapsuleCollectionView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
}

- (void)_scheduleTimerToDiscardViewsForReuseIfNeeded
{
  NSUInteger v3;
  unint64_t v4;
  id WeakRetained;
  id v6;

  v3 = -[NSIndexSet count](self->_indexesOfLoadedViews, "count");
  v4 = -[NSMutableSet count](self->_viewsForReuse, "count") + v3;
  if (v4 > -[SFCapsuleCollectionView _softMaximumNumberOfViews](self, "_softMaximumNumberOfViews"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);

    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__discardExcessViewsForReuse, 0, 0, 1.0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_timerToDiscardViewsForReuse, v6);

    }
  }
}

- (unint64_t)_softMaximumNumberOfViews
{
  return -[SFCapsuleCollectionView _maximumNumberOfVisibleViews](self, "_maximumNumberOfVisibleViews") + 1;
}

- (unint64_t)_maximumNumberOfVisibleViews
{
  double Width;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  Width = CGRectGetWidth(v11);
  -[SFCapsuleCollectionView bounds](self, "bounds");
  v4 = CGRectGetWidth(v12);
  if (v4 <= Width)
    return 1;
  v5 = v4;
  -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
  v7 = (uint64_t)(floor((v5 - Width) / v6) + 1.0);
  v8 = v5 - (double)v7 * v6;
  -[SFCapsuleCollectionView _interCapsuleSpacing](self, "_interCapsuleSpacing");
  if (v8 <= v9)
  {
    if (v8 > 0.0)
      ++v7;
  }
  else
  {
    v7 += 2;
  }
  return v7;
}

- (void)setUsesFastDeceleration:(BOOL)a3
{
  self->_usesFastDeceleration = a3;
}

- (void)setSelectionThreshold:(double)a3
{
  self->_selectionThreshold = a3;
}

- (void)setSelectionGestureLimit:(int64_t)a3
{
  self->_selectionGestureLimit = a3;
}

- (void)setInactiveCapsuleAlpha:(double)a3
{
  self->_inactiveCapsuleAlpha = a3;
}

- (void)setCapsuleWidth:(double)a3
{
  self->_capsuleWidth = a3;
}

- (int64_t)selectionGestureState
{
  return self->_selectionGestureState;
}

void __37__SFCapsuleCollectionView_reloadData__block_invoke_2(uint64_t a1)
{
  SFCapsuleCollectionViewUpdate *v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 752) = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = -[SFCapsuleCollectionViewUpdate initWithCollectionView:]([SFCapsuleCollectionViewUpdate alloc], "initWithCollectionView:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 744);
    *(_QWORD *)(v3 + 744) = v2;

  }
}

- (void)setShowingLockdownStatusBar:(BOOL)a3
{
  SFLockdownStatusBar *v4;
  SFLockdownStatusBar *lockdownStatusBar;
  SFLockdownStatusBar *v6;

  if (self->_showingLockdownStatusBar != a3)
  {
    self->_showingLockdownStatusBar = a3;
    if (a3)
    {
      v4 = objc_alloc_init(SFLockdownStatusBar);
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = v4;

      -[SFLockdownStatusBar setNavigationBarItem:](self->_lockdownStatusBar, "setNavigationBarItem:", self->_navigationBarItem);
      -[SFLockdownStatusBar setShouldAnimateNavigationBarItemChanges:](self->_lockdownStatusBar, "setShouldAnimateNavigationBarItemChanges:", self->_layoutStyle == 1);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_lockdownStatusBar);
    }
    else
    {
      -[SFLockdownStatusBar removeFromSuperview](self->_lockdownStatusBar, "removeFromSuperview");
      v6 = self->_lockdownStatusBar;
      self->_lockdownStatusBar = 0;

    }
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)addGestureObserver:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  -[NSHashTable addObject:](self->_gestureObservers, "addObject:");
  if (self->_sendProgressMessageToObservers)
    v4 = 1;
  else
    v4 = objc_opt_respondsToSelector();
  self->_sendProgressMessageToObservers = v4 & 1;

}

- (void)updateVerticalSwipeThreshold
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_doubleForKey:defaultValue:", CFSTR("DebugLoweredBarVerticalMinimizingSwipeThreshold"), 40.0);
  v5 = v4;

  self->_verticalSwipeThreshold = tan(v5 / 180.0 * 3.14159265);
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "frameForShadowView");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ss_setUntransformedFrame:", v3, v5, v7, v9);

}

- (void)setKeepsCapsulesAboveKeyboard:(BOOL)a3
{
  if (self->_keepsCapsulesAboveKeyboard != a3)
  {
    self->_keepsCapsulesAboveKeyboard = a3;
    if (!a3)
    {
      self->_selectedItemStateBeforeShowingKeyboard = 0;
      self->_showingKeyboard = 0;
      self->_keyboardHeight = 0.0;
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  -[SFCapsuleCollectionView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleCollectionView;
  -[SFCapsuleCollectionView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (!self->_numberOfItems)
    -[SFCapsuleCollectionView _reloadDataWithoutLayout](self, "_reloadDataWithoutLayout");
}

void __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void (**v7)(void *, _QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(v5, "invalidateCapsuleHeight");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsIndex:", a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke_2;
    aBlock[3] = &unk_1E21E2680;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v6 = v5;
    v13 = v6;
    v14 = a3;
    v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(v8, "addAnimations:", v7);
      objc_msgSend(v6, "capsuleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 736));
      objc_msgSend(WeakRetained, "publicCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "willReloadWithCoordinator:", v11);

    }
    else
    {
      v7[2](v7, 0);
    }

  }
}

uint64_t __48__SFCapsuleCollectionView_reloadItemsAtIndexes___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 883))
    return objc_msgSend(*(id *)(a1 + 40), "setCapsuleContentIsValid:", 0);
  else
    return objc_msgSend(*(id *)(a1 + 32), "_fetchContentViewForItem:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setSelectedItemAccessoryView:(id)a3 forState:(int64_t)a4
{
  NSMutableDictionary *selectedItemAccessoryViews;
  void *v7;
  id v8;
  void *v9;

  selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](selectedItemAccessoryViews, "setObject:forKeyedSubscript:", v8, v9);

  if (self->_numberOfItems)
  {
    if (self->_selectedItemState == a4)
      -[SFCapsuleCollectionView _updateStateFlagsForContentViewAtIndex:](self, "_updateStateFlagsForContentViewAtIndex:", self->_selectedItemIndex);
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  id WeakRetained;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_layoutStyle != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "capsuleCollectionView:willChangeToLayoutStyle:", self, a3);
    self->_layoutStyle = a3;
    -[SFCapsuleCollectionView _reloadDataWithoutLayout](self, "_reloadDataWithoutLayout");
    -[SFCapsuleCollectionView _updateVisualEffectGroupName](self, "_updateVisualEffectGroupName");
    if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
      -[SFCapsuleCollectionView _layOutKeyboardBackdrop](self, "_layOutKeyboardBackdrop");
    -[SFCapsuleCollectionView capsuleBackgroundCornerRadius](self, "capsuleBackgroundCornerRadius");
    v7 = v6;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_items;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "capsuleView", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setBackgroundCornerRadius:", v7);
          objc_msgSend(v13, "setLayoutStyle:", a3);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v14 = a3 == 1;
    -[_SFFluidProgressView setAlignsToTop:](self->_minimizedProgressView, "setAlignsToTop:", v14);
    -[SFLockdownStatusBar setShouldAnimateNavigationBarItemChanges:](self->_lockdownStatusBar, "setShouldAnimateNavigationBarItemChanges:", v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "capsuleCollectionViewLayoutStyleDidChange:", self);

  }
}

- (void)_updateDragWithOffset:(double)a3 velocity:(double)a4 ended:(BOOL)a5
{
  unint64_t minimizationFlags;
  _BOOL8 v7;
  id WeakRetained;
  char v11;
  _BOOL4 v12;
  double minimizationStartingDragOffset;
  double v14;
  double v15;
  double v16;
  int64_t selectedItemState;
  double offsetForMinimization;
  _BOOL4 v19;
  uint64_t (*__ptr32 *v20)();
  SFTransitionCoordinator *v21;
  int v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double MinY;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  int64_t v40;
  BOOL v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableDictionary *selectedItemAccessoryViews;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  SFTransitionCoordinator **location;
  id *locationa;
  void *v58;
  void (**v59)(_QWORD);
  _QWORD v60[5];
  void (**v61)(_QWORD);
  BOOL v62;
  _QWORD v63[5];
  _QWORD aBlock[5];
  _QWORD v65[5];
  _QWORD v66[6];
  CGRect v67;
  CGRect v68;

  minimizationFlags = self->_minimizationFlags;
  if ((minimizationFlags & 1) != 0 && !self->_forceHidden)
  {
    v7 = a5;
    if (a5)
      self->_minimizationFlags = minimizationFlags & 0xFFFFFFFFFFFFFFEELL | 0x10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v58 = WeakRetained;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(WeakRetained, "capsuleCollectionViewBoundaryEdgesForScrollableContent:", self);
    else
      v11 = 0;
    v12 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
    minimizationStartingDragOffset = self->_minimizationStartingDragOffset;
    self->_minimizationLastDragOffset = a3;
    v14 = minimizationStartingDragOffset - a3;
    if (v12)
      v15 = v14;
    else
      v15 = -v14;
    if (v14 < 0.0)
      v14 = -v14;
    if ((self->_minimizationFlags & 2) == 0)
      v14 = v15;
    v16 = fmax(v14, 0.0);
    selectedItemState = self->_selectedItemState;
    offsetForMinimization = self->_offsetForMinimization;
    v19 = -[SFCapsuleCollectionView _shouldToggleMinimizedWithTranslation:velocity:gestureEnded:](self, "_shouldToggleMinimizedWithTranslation:velocity:gestureEnded:", v7, v16, a4);
    v20 = &off_18BAD4000;
    if (v19)
    {
      selectedItemState = !v12;
      self->_previousMinimizationVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
      -[SFCapsuleCollectionView _setCapsuleSafeAreaInsetsFrozen:](self, "_setCapsuleSafeAreaInsetsFrozen:", 0);
      -[SFCapsuleCollectionView _coordinatorForUpdatingSelectedItemFromState:toState:](self, "_coordinatorForUpdatingSelectedItemFromState:toState:", self->_selectedItemState, selectedItemState);
      v21 = (SFTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
      -[SFCapsuleCollectionView _setOffsetForMinimization:](self, "_setOffsetForMinimization:", 0.0);
      self->_minimizationStartingDragOffset = a3;
      if ((self->_minimizationFlags & 2) != 0)
        self->_minimizationFlags = 0;
      v22 = 1;
    }
    else
    {
      if (v7)
      {
        self->_previousMinimizationVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
        -[SFCapsuleCollectionView _setCapsuleSafeAreaInsetsFrozen:](self, "_setCapsuleSafeAreaInsetsFrozen:", 0);
        v23 = _SFEqualWithEpsilon(0.0, self->_offsetForMinimization, 0.1);
        v22 = !v23;
        if (v23)
        {
          v21 = 0;
        }
        else
        {
          v21 = objc_alloc_init(SFTransitionCoordinator);
          -[SFCapsuleCollectionView _willBeginBackdropHeightAnimation](self, "_willBeginBackdropHeightAnimation");
          -[SFTransitionCoordinator publicCoordinator](v21, "publicCoordinator");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = MEMORY[0x1E0C809B0];
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke;
          v66[3] = &unk_1E21E29B0;
          v66[4] = self;
          objc_msgSend(v32, "addRetargetableAnimations:", v66);

          v65[0] = v33;
          v65[1] = 3221225472;
          v65[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_2;
          v65[3] = &unk_1E21E2050;
          v65[4] = self;
          -[SFTransitionCoordinator addCompletion:](v21, "addCompletion:", v65);
        }
        -[SFCapsuleCollectionView _setOffsetForMinimization:](self, "_setOffsetForMinimization:", 0.0);
        v20 = &off_18BAD4000;
LABEL_39:
        aBlock[0] = MEMORY[0x1E0C809B0];
        v39 = *((_QWORD *)v20 + 322);
        aBlock[1] = v39;
        aBlock[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_3;
        aBlock[3] = &unk_1E21E2050;
        aBlock[4] = self;
        v59 = (void (**)(_QWORD))_Block_copy(aBlock);
        v40 = self->_selectedItemState;
        v41 = selectedItemState != v40 && v7;
        if (selectedItemState == v40)
        {
          if (v22)
          {
            location = &self->_currentTransitionCoordinator;
            objc_storeWeak((id *)&self->_currentTransitionCoordinator, v21);
LABEL_49:
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = v39;
            v60[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_5;
            v60[3] = &unk_1E21E2A70;
            v60[4] = self;
            v61 = v59;
            v62 = !v41;
            -[SFTransitionCoordinator addAnimations:](v21, "addAnimations:", v60);
            -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "capsuleView");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (!self->_minimizationStyle && (selectedItemState == 1) == (self->_selectedItemState != 1))
            {
              -[SFTransitionCoordinator publicCoordinator](v21, "publicCoordinator", location);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "willChangeToMinimized:coordinator:", selectedItemState == 1, v46);

            }
            selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", selectedItemState, location);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](selectedItemAccessoryViews, "objectForKeyedSubscript:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTransitionCoordinator publicCoordinator](v21, "publicCoordinator");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setAccessoryView:coordinator:", v49, v50);

            objc_storeWeak(locationa, 0);
            self->_selectedItemState = selectedItemState;
            if (v7)
              self->_minimizationFlags = 0;
            -[SFCapsuleCollectionView _updateShowsMinimizedProgressView](self, "_updateShowsMinimizedProgressView");
            v51 = -[SFCapsuleCollectionView _shouldInteractivelySquish](self, "_shouldInteractivelySquish");
            v52 = 1;
            if (selectedItemState == v40 || !v51)
            {
              v53 = v58;
              v54 = v59;
            }
            else
            {
              v53 = v58;
              v54 = v59;
              if (!v7 && offsetForMinimization != 0.0)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v52 = objc_msgSend(v58, "capsuleCollectionViewContentScaleCompletesMinimization:", self) ^ 1;
                else
                  v52 = 0;
              }
            }
            -[SFCapsuleCollectionView window](self, "window");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTransitionCoordinator performTransitionWithAnimation:inContextOfContainerView:](v21, "performTransitionWithAnimation:inContextOfContainerView:", v52, v55);

            if (v7)
              -[SFCapsuleCollectionView _sendMinimizationDidEndToObservers](self, "_sendMinimizationDidEndToObservers");

LABEL_73:
            return;
          }
        }
        else
        {
          self->_minimizationFlags = self->_minimizationFlags & 0xFFFFFFFFFFFFFFFBLL | (4 * (selectedItemState == 1));
          if ((v22 & 1) != 0)
          {
            location = &self->_currentTransitionCoordinator;
            objc_storeWeak((id *)&self->_currentTransitionCoordinator, v21);
            -[SFCapsuleCollectionView _performVisualEffectTransitionWithCoordinator:](self, "_performVisualEffectTransitionWithCoordinator:", v21);
            v42 = objc_loadWeakRetained((id *)&self->_delegate);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[SFTransitionCoordinator publicCoordinator](v21, "publicCoordinator", location);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "capsuleCollectionView:selectedItemWillChangeToState:options:coordinator:", self, selectedItemState, 0, v43);

            }
            goto LABEL_49;
          }
        }
        if (v7)
          self->_minimizationFlags = 0;
        v53 = WeakRetained;
        v54 = v59;
        if (self->_backdropHeightAnimationCount)
        {
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = v39;
          v63[2] = __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_4;
          v63[3] = &unk_1E21E2050;
          v63[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v63);
        }
        v59[2](v59);
        if (!v41)
          -[SFCapsuleCollectionView _sendMinimizationDidUpdateToObservers](self, "_sendMinimizationDidUpdateToObservers");
        if (v7)
          -[SFCapsuleCollectionView _sendMinimizationDidEndToObservers](self, "_sendMinimizationDidEndToObservers");
        goto LABEL_73;
      }
      if ((v11 & 4) != 0)
      {
        v22 = 0;
        v21 = 0;
        goto LABEL_39;
      }
      -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
      v25 = v24;
      -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 1);
      v27 = v26;
      if (v12 != -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
        v28 = -1.0;
      else
        v28 = 1.0;
      if (v25 == v27)
      {
        -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
        MinY = CGRectGetMinY(v67);
        -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
        v35 = MinY - CGRectGetMinY(v68);
        v36 = 62.0;
        if (!v12)
          v36 = 31.0;
        v37 = v35 / 3.0;
        v38 = _SFClampPercent(v16, 0.0, v36);
        v31 = _SFRoundFloatToPixels(v28 * (v38 * v37));
      }
      else
      {
        v29 = v25 - v27;
        if (v12 && !self->_minimizationStyle)
        {
          -[SFCapsuleCollectionView _overscrollDistanceForTopEdge](self, "_overscrollDistanceForTopEdge");
          v29 = fmin(v29, v30);
        }
        v31 = v28 * fmax(fmin(v29, v16), 0.0);
      }
      -[SFCapsuleCollectionView _setOffsetForMinimization:](self, "_setOffsetForMinimization:", v31);
      -[SFCapsuleCollectionView _setCapsuleSafeAreaInsetsFrozen:](self, "_setCapsuleSafeAreaInsetsFrozen:", 1);
      v22 = 0;
      v21 = 0;
    }
    v20 = &off_18BAD4000;
    goto LABEL_39;
  }
}

- (void)updateTrailingActionAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = v6;
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_18B7B2000, v5, OS_LOG_TYPE_DEFAULT, "Update trailing action animated = %@", buf, 0xCu);

  }
  if (-[SFCapsuleCollectionView _updateTrailingAction](self, "_updateTrailingAction") && v3)
  {
    if (-[SFCapsuleCollectionView _canAnimateUpdates](self, "_canAnimateUpdates"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__SFCapsuleCollectionView_updateTrailingActionAnimated___block_invoke;
      v8[3] = &unk_1E21E2050;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v8, 0);
    }
  }
}

SFCapsuleCollectionActionView *__41__SFCapsuleCollectionView_initWithFrame___block_invoke()
{
  return objc_alloc_init(SFCapsuleCollectionActionView);
}

- (void)_preferredContentSizeCategoryDidChange
{
  NSArray *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_items;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateCapsuleHeight", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setOffsetForMinimization:(double)a3
{
  if (self->_offsetForMinimization != a3)
  {
    self->_offsetForMinimization = a3;
    if (self->_numberOfItems)
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGAffineTransform)_lockdownIndicatorTransform
{
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  CGAffineTransform *result;
  __int128 v13;
  double MaxY;
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
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[SFCapsuleCollectionView _selectedItemMinimizationPercent](self, "_selectedItemMinimizationPercent");
  v6 = v5;
  -[SFCapsuleCollectionView _minimizedContentScale](self, "_minimizedContentScale");
  v8 = _SFInterpolate(1.0, v7, v6);
  v9 = -[SFCapsuleCollectionView _contentIsDismissed](self, "_contentIsDismissed");
  v10 = 1.05;
  if (!v9)
    v10 = 1.0;
  v11 = v8 * v10;
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, v11, v11);
  result = (CGAffineTransform *)-[SFCapsuleCollectionView _shouldInteractivelySquish](self, "_shouldInteractivelySquish");
  if ((result & 1) != 0
    && ((result = (CGAffineTransform *)-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"), !(_DWORD)result)|| (result = (CGAffineTransform *)-[SFCapsuleCollectionView _shouldUseNormalLayoutForMinimizedCapsule](self, "_shouldUseNormalLayoutForMinimizedCapsule"), (result & 1) != 0))&& (self->_minimizationFlags & 1) != 0)
  {
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
    MaxY = CGRectGetMaxY(v29);
    -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", 0.0);
    v16 = MaxY + v15;
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
    v17 = CGRectGetMaxY(v30);
    -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", 1.0);
    v19 = v17 + v18;
    -[SFCapsuleCollectionView _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:](self, "_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:", 1.0);
    v21 = _SFInterpolate(v16, v19 - v20, v6);
    -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
    v22 = CGRectGetMaxY(v31);
    -[SFCapsuleCollectionView _lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:](self, "_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:", v6);
    v24 = v22 + v23;
    -[SFCapsuleCollectionView _verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:](self, "_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:", v6);
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v27, 0.0, v21 - (v24 - v25));
    v26 = v27;
    return CGAffineTransformScale(retstr, &v26, v11, v11);
  }
  else
  {
    v13 = *(_OWORD *)&v28.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v28.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v28.tx;
  }
  return result;
}

- (double)_lockdownIndicatorTopVerticalSpacingAtMinimizationPercent:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SFCapsuleCollectionView _minimizedContentScale](self, "_minimizedContentScale");
  v6 = _SFInterpolate(1.0, v5, a3);
  -[SFLockdownStatusBar titleCapHeightInsetFromTop](self->_lockdownStatusBar, "titleCapHeightInsetFromTop");
  v8 = _SFRoundFloatToPixels(v6 * v7);
  v9 = _SFInterpolate(10.0, 8.0, a3) - v8;
  return _SFRoundFloatToPixels(v9);
}

- (double)_lockdownIndicatorBottomVerticalSpacingAtMinimizationPercent:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SFCapsuleCollectionView _minimizedContentScale](self, "_minimizedContentScale");
  v6 = _SFInterpolate(1.0, v5, a3);
  -[SFLockdownStatusBar titleBaselineInsetFromBottom](self->_lockdownStatusBar, "titleBaselineInsetFromBottom");
  v8 = _SFRoundFloatToPixels(v6 * v7);
  v9 = _SFInterpolate(10.0, 8.0, a3) - v8;
  return _SFRoundFloatToPixels(v9);
}

- (double)_verticalOverlapForLockdownStatusIndicatorAtMinimizationPercent:(double)a3
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat rect;
  CGRect v38;
  CGRect v39;

  if (!self->_lockdownStatusBar)
    return 0.0;
  if (a3 == 0.0 || self->_selectedItemIndex >= (int64_t)self->_numberOfItems)
    return 0.0;
  -[SFCapsuleCollectionView contentViewForItemAtIndex:](self, "contentViewForItemAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "keyContentRect");
  else
    objc_msgSend(v7, "bounds");
  rect = v8;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  -[SFCapsuleCollectionView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
  v24 = v18 + v23;
  v27 = v20 - (v25 + v26);
  v38.size.height = v22 - (v23 + v28);
  v38.origin.x = v16 + v25;
  v38.origin.y = v24;
  v38.size.width = v27;
  -[SFCapsuleCollectionView _selectedCapsuleHeightForWidth:state:ignoringKeyboard:](self, "_selectedCapsuleHeightForWidth:state:ignoringKeyboard:", 1, 0, CGRectGetWidth(v38));
  v30 = v29;
  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
  {
    v31 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "keyContentBaselineBottomInset");
      v31 = v32;
    }
  }
  else
  {
    v31 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "keyContentCapHeightTopInset");
      v31 = v33;
    }
    v30 = v30 - 13.0;
  }
  v39.origin.x = rect;
  v39.origin.y = v12;
  v39.size.width = v13;
  v39.size.height = v14;
  v34 = v31 + (v30 - CGRectGetHeight(v39)) * 0.5;
  -[SFCapsuleCollectionView _auxiliaryBarSquishedHeightDecrease](self, "_auxiliaryBarSquishedHeightDecrease");
  v36 = _SFRoundFloatToPixels((v35 * 0.5 + v34) * a3);

  return v36;
}

- (double)_auxiliaryBarSquishedHeightDecrease
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  v4 = v3;
  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  v6 = v5;
  -[SFCapsuleCollectionView _minimizedContentScale](self, "_minimizedContentScale");
  return _SFRoundFloatToPixels(v4 - v6 * v7);
}

- (void)_updateCanBlurCapsules
{
  _BOOL4 v2;

  v2 = self->_selectionGestureState == 0;
  if (self->_canBlurCapsules != v2)
  {
    self->_canBlurCapsules = v2;
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateContentBlurRadius
{
  UIViewSpringAnimationBehaviorDescribing *blurSpringBehavior;
  _QWORD v4[5];

  if (SFEnhancedTabOverviewEnabled())
  {
    blurSpringBehavior = self->_blurSpringBehavior;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__SFCapsuleCollectionView__updateContentBlurRadius__block_invoke;
    v4[3] = &unk_1E21E2050;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringBehavior:tracking:animations:completion:", blurSpringBehavior, 0, v4, 0);
  }
}

void __51__SFCapsuleCollectionView__updateContentBlurRadius__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_contentIsDismissed"))
    v2 = 6.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("filters.gaussianBlur.inputRadius"));

}

uint64_t __60__SFCapsuleCollectionView__updateShowsMinimizedProgressView__block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setAlpha:", v1);
}

CGAffineTransform *__68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_2@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  CGFloat tx;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  if (!LOBYTE(result->ty))
  {
    v17 = MEMORY[0x1E0C9BAA8];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(a3 + 16) = v18;
    v15 = *(_OWORD *)(v17 + 32);
    goto LABEL_8;
  }
  tx = result->tx;
  if (!a2 || !*(_QWORD *)(*(_QWORD *)&tx + 1000))
  {
    objc_msgSend(*(id *)&tx, "bounds");
    UIRectGetCenter();
    v7 = v6;
    v9 = v8;
    UIRectGetCenter();
    v11 = (v10 - v7) * 0.05;
    v13 = (v12 - v9) * 0.05;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v21.c = v14;
    *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v20.a = *(_OWORD *)&v21.a;
    *(_OWORD *)&v20.c = v14;
    *(_OWORD *)&v20.tx = *(_OWORD *)&v21.tx;
    CGAffineTransformScale(&v21, &v20, 1.05, 1.05);
    v19 = v21;
    result = CGAffineTransformTranslate(&v20, &v19, v11, v13);
    v16 = *(_OWORD *)&v20.c;
    v15 = *(_OWORD *)&v20.tx;
    v21 = v20;
    *(_OWORD *)a3 = *(_OWORD *)&v20.a;
    *(_OWORD *)(a3 + 16) = v16;
LABEL_8:
    *(_OWORD *)(a3 + 32) = v15;
    return result;
  }
  if (*(_QWORD *)(*(_QWORD *)&tx + 1056))
    objc_msgSend(*(id *)&tx, "_scaleFromLinkedPageView");
  else
    v5 = 1.0;
  return CGAffineTransformMakeScale((CGAffineTransform *)a3, v5, v5);
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  int v7;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  _QWORD *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(_QWORD);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  BOOL v56;
  char v57;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 == a3)
    goto LABEL_34;
  v7 = *(unsigned __int8 *)(a1 + 176);
  v10 = v6 > a3 && v7 != 0 || v6 < a3 && v7 == 0;
  v11 = a3 + 1;
  v12 = objc_msgSend(*(id *)(a1 + 32), "count");
  v13 = v12;
  if (*(_BYTE *)(a1 + 177) || v11 == v12 && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 504))
  {
    v14 = (uint64_t *)(a1 + 72);
    v15 = (uint64_t *)(a1 + 80);
    v16 = (uint64_t *)(a1 + 88);
    v17 = (uint64_t *)(a1 + 96);
  }
  else
  {
    v14 = (uint64_t *)(a1 + 104);
    v15 = (uint64_t *)(a1 + 112);
    v16 = (uint64_t *)(a1 + 120);
    v17 = (uint64_t *)(a1 + 128);
  }
  v18 = *v14;
  v19 = *v15;
  v20 = *v16;
  v21 = *v17;
  v22 = *(double *)(a1 + 144)
      + (fabs((double)(a3 - *(_QWORD *)(a1 + 64))) + -1.0) * (*(double *)(a1 + 136) + *(double *)(a1 + 144));
  if (v10)
  {
    v23 = CGRectGetMinX(*(CGRect *)&v18) - v22;
    if (v11 == v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "layoutMargins");
      v25 = v24;
LABEL_23:
      v27 = objc_msgSend(*(id *)(a1 + 40), "_nextItemIndexForSelectionGesture");
      v28 = *(_QWORD **)(a1 + 40);
      v29 = 0.0;
      if (v27 >= v28[111])
      {
        objc_msgSend(v28, "_percentToSelectItemIndex:");
        v29 = v30;
      }
      v31 = _SFInterpolate(-v25, v25, v29);
      v32 = v23;
      if (!v10)
        v32 = CGRectGetWidth(*(CGRect *)(a1 + 72)) - v23;
      v33 = fmax(*(double *)(a1 + 152), fmin(*(double *)(a1 + 136), v32 - v31));
      goto LABEL_29;
    }
  }
  else
  {
    v23 = v22 + CGRectGetMaxX(*(CGRect *)&v18);
    if (v11 == v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "layoutMargins");
      v25 = v26;
      goto LABEL_23;
    }
  }
  v33 = *(double *)(a1 + 136);
LABEL_29:
  v34 = *(void **)(a1 + 40);
  objc_msgSend(v5, "capsuleView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_updateSuperviewForCapsule:", v35);

  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_5;
  v44 = &unk_1E21E24F0;
  v36 = v5;
  v37 = *(_QWORD *)(a1 + 152);
  v38 = *(_QWORD *)(a1 + 160);
  v48 = v33;
  v49 = v37;
  v39 = *(_QWORD *)(a1 + 40);
  v45 = v36;
  v46 = v39;
  v50 = a3;
  v51 = v38;
  v52 = v23;
  v56 = v10;
  v53 = *(_QWORD *)(a1 + 168);
  v57 = *(_BYTE *)(a1 + 178);
  v54 = *(_OWORD *)(a1 + 104);
  v55 = *(_OWORD *)(a1 + 120);
  v47 = *(id *)(a1 + 56);
  v40 = (void (**)(_QWORD))_Block_copy(&v41);
  if (objc_msgSend(v36, "animationCount", v41, v42, v43, v44)
    || objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3))
  {
    v40[2](v40);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "safari_performWithoutRetargetingAnimations:", v40);
  }

LABEL_34:
}

void __68__SFCapsuleCollectionView__layOutItems_atIndexes_selectedItemIndex___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double Height;
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
  void *v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[3];
  _OWORD v19[3];
  _OWORD v20[3];

  objc_msgSend(*(id *)(a1 + 32), "capsuleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsesPlatterEffect:", objc_msgSend(*(id *)(a1 + 40), "_itemsShouldUsePlatterEffect"));
  objc_msgSend(*(id *)(a1 + 32), "capsuleHeightForWidth:defaultHeight:state:index:", objc_msgSend(v2, "state"), *(_QWORD *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
  Height = 0.0;
  v5 = fmax(v3 - *(double *)(a1 + 80), 0.0);
  if (*(_BYTE *)(a1 + 136))
    v6 = *(double *)(a1 + 56);
  else
    v6 = 0.0;
  objc_msgSend(v2, "ss_setUntransformedFrame:", *(double *)(a1 + 88) - v6, *(double *)(a1 + 96) - v5);
  objc_msgSend(v2, "frameForShadowView");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v2, "shadowView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ss_setUntransformedFrame:", v8, v10, v12, v14);

  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v20[0] = *MEMORY[0x1E0C9BAA8];
  v20[1] = v16;
  v20[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setContentTransform:", v20);
  objc_msgSend(v2, "setMinimizationPercent:", 0.0);
  if (*(_BYTE *)(a1 + 137))
    Height = CGRectGetHeight(*(CGRect *)(a1 + 104));
  objc_msgSend(v2, "setContentHeight:", Height);
  v17 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "ss_untransformedFrame");
  (*(void (**)(_OWORD *__return_ptr, uint64_t, _QWORD))(v17 + 16))(v19, v17, 0);
  v18[0] = v19[0];
  v18[1] = v19[1];
  v18[2] = v19[2];
  objc_msgSend(v2, "setTransform:", v18);

}

- (void)setFocusedCapsuleTopOffset:(double)a3
{
  if (self->_focusedCapsuleTopOffset != a3)
  {
    self->_focusedCapsuleTopOffset = a3;
    if (self->_selectedItemState == 2)
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)minimizedCapsuleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SFCapsuleCollectionView _minimizedCapsuleFrameIgnoringKeyboard:](self, "_minimizedCapsuleFrameIgnoringKeyboard:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)viewForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capsuleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)detachViewForItemAtIndex:(int64_t)a3
{
  return -[SFCapsuleCollectionView detachViewForItemAtIndex:forInternalBorrow:](self, "detachViewForItemAtIndex:forInternalBorrow:", a3, 0);
}

- (id)detachViewForItemAtIndex:(int64_t)a3 forInternalBorrow:(BOOL)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  SFCapsuleCollectionView *v19;
  int64_t v20;

  if (a3 < 0 || (int64_t)self->_numberOfItems <= a3)
  {
    v9 = 0;
  }
  else
  {
    v6 = a4;
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCapsuleIsDetached:", 1);
    -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
    objc_msgSend(v7, "capsuleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      v10 = v8;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v12 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke;
      v17[3] = &unk_1E21E2540;
      v13 = v8;
      v18 = v13;
      v19 = self;
      v20 = a3;
      objc_msgSend(v11, "safari_performWithoutRetargetingAnimations:", v17);
      if (self->_itemsAreHidden)
      {
        v16[0] = v12;
        v16[1] = 3221225472;
        v16[2] = __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke_2;
        v16[3] = &unk_1E21E2050;
        v16[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "safari_performWithoutRetargetingAnimations:", v16);
      }
      v14 = v13;

    }
  }
  return v9;
}

void __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  id WeakRetained;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", v2, 0);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v10);
  objc_msgSend(*(id *)(a1 + 32), "frameForShadowView");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "_setSafeAreaInsetsFrozen:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 904));
  v6 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (double)(objc_msgSend(WeakRetained, "capsuleCollectionView:shouldHideShadowForItemAtIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) ^ 1);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

}

void __70__SFCapsuleCollectionView_detachViewForItemAtIndex_forInternalBorrow___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[134];
  objc_msgSend(v2, "_indexesOfVisibleItemsIncludingAction:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layOutItems:atIndexes:selectedItemIndex:", v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));

}

- (void)reattachView:(id)a3
{
  id v4;
  NSArray *items;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SFCapsuleCollectionView *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  items = self->_items;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__SFCapsuleCollectionView_reattachView___block_invoke;
  v17[3] = &unk_1E21E2568;
  v12 = v4;
  v18 = v12;
  v7 = -[NSArray indexOfObjectPassingTest:](items, "indexOfObjectPassingTest:", v17);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "removeFromSuperview");
  }
  else
  {
    v8 = v7;
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __40__SFCapsuleCollectionView_reattachView___block_invoke_2;
    v13[3] = &unk_1E21E2540;
    v11 = v9;
    v14 = v11;
    v15 = self;
    v16 = v8;
    objc_msgSend(v10, "performWithoutAnimation:", v13);
    -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
    if (-[NSIndexSet containsIndex:](self->_indexesOfLoadedViews, "containsIndex:", v8))
    {
      -[SFCapsuleCollectionView _updateCapsuleAlpha](self, "_updateCapsuleAlpha");
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

BOOL __40__SFCapsuleCollectionView_reattachView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "capsuleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __40__SFCapsuleCollectionView_reattachView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "capsuleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSafeAreaInsetsFrozen:", 0);
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v2, "setHidden:", 0);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v4;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 40), "_updateSuperviewForCapsule:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setCapsuleIsDetached:", 0);
  v5 = *(_QWORD **)(a1 + 40);
  v6 = v5[134];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layOutItems:atIndexes:selectedItemIndex:", v6, v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 992));

}

- (void)reattachControls
{
  SFLockdownStatusBar *lockdownStatusBar;
  UIView *v4;
  UIView *contentView;
  UIView *v6;
  UIView *v7;

  lockdownStatusBar = self->_lockdownStatusBar;
  if (lockdownStatusBar)
  {
    -[SFLockdownStatusBar superview](lockdownStatusBar, "superview");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    contentView = self->_contentView;

    if (v4 != contentView)
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_lockdownStatusBar);
  }
  -[_SFFluidProgressView superview](self->_minimizedProgressView, "superview");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  v7 = self->_contentView;

  if (v6 != v7)
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_minimizedProgressView);
}

- (void)takeOwnershipOfDetachedViewForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capsuleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHidden:", 0);
  -[SFCapsuleCollectionView _superviewForCapsules](self, "_superviewForCapsules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)removeGestureObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable removeObject:](self->_gestureObservers, "removeObject:", v4);
  if (self->_sendProgressMessageToObservers)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_gestureObservers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        v10 = v4;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v4 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = 1;
            goto LABEL_12;
          }
          ++v9;
          v10 = v4;
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v4 = 0;
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }
  self->_sendProgressMessageToObservers = v11;

}

- (void)setIgnoresKeyboardHideEvents:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_ignoresKeyboardHideEvents != a3)
  {
    self->_ignoresKeyboardHideEvents = a3;
    if (a3)
    {
      v4 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_18B7B2000, v4, OS_LOG_TYPE_INFO, "Begin ignoring keyboard hide events.", (uint8_t *)&v8, 2u);
      }
    }
    else
    {
      v5 = !self->_showingKeyboard && self->_keyboardHeight != 0.0;
      v6 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = &stru_1E21FE780;
        if (v5)
          v7 = CFSTR(" and clear keyboard height");
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_18B7B2000, v6, OS_LOG_TYPE_INFO, "End ignoring keyboard hide events%@.", (uint8_t *)&v8, 0xCu);
      }
      if (v5)
      {
        self->_keyboardHeight = 0.0;
        -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }
}

- (void)_setKeyboardHeight:(double)a3
{
  BOOL v3;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3 != 0.0 || !self->_ignoresKeyboardHideEvents;
  if (v3 && self->_keepsCapsulesAboveKeyboard && self->_keyboardHeight != a3)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = a3;
      _os_log_impl(&dword_18B7B2000, v6, OS_LOG_TYPE_DEFAULT, "Set _keyboardHeight = %f", buf, 0xCu);
    }
    self->_keyboardHeight = a3;
    if (self->_numberOfItems && -[SFCapsuleCollectionView _shouldDodgeKeyboard](self, "_shouldDodgeKeyboard"))
    {
      if (self->_backdropHeightAnimationCount)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __46__SFCapsuleCollectionView__setKeyboardHeight___block_invoke;
        v7[3] = &unk_1E21E2050;
        v7[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateByRetargetingAnimations:completion:", v7, 0);
      }
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __46__SFCapsuleCollectionView__setKeyboardHeight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropHeight");
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double keyboardHeight;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_keepsCapsulesAboveKeyboard)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_showingKeyboard)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v40 = v7;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_18B7B2000, v6, OS_LOG_TYPE_DEFAULT, "Recieved %{public}@, with _showingKeyboard = %{public}@", buf, 0x16u);

    }
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGRectValue");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[SFCapsuleCollectionView convertRect:fromView:](self, "convertRect:fromView:", 0, v13, v15, v17, v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    keyboardHeight = self->_keyboardHeight;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    v46.origin.x = v29;
    v46.origin.y = v30;
    v46.size.width = v31;
    v46.size.height = v32;
    v44.origin.x = v21;
    v44.origin.y = v23;
    v44.size.width = v25;
    v44.size.height = v27;
    v45 = CGRectIntersection(v44, v46);
    -[SFCapsuleCollectionView _setKeyboardHeight:](self, "_setKeyboardHeight:", CGRectGetHeight(v45));
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC4E48]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    if (self->_showingKeyboard
      && keyboardHeight != self->_keyboardHeight
      && -[SFCapsuleCollectionView _shouldAnimateKeyboardHeightChanges](self, "_shouldAnimateKeyboardHeightChanges")
      && v35 != 0.0)
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC4E40]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "integerValue") << 16;

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __52__SFCapsuleCollectionView__keyboardWillChangeFrame___block_invoke;
      v38[3] = &unk_1E21E2050;
      v38[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:withDuration:delay:options:animations:completion:", 1, v37, v38, 0, v35, 0.0);
    }

  }
}

uint64_t __52__SFCapsuleCollectionView__keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_keepsCapsulesAboveKeyboard)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_showingKeyboard)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = v8;
      *(_DWORD *)buf = 138543618;
      v18 = v7;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_18B7B2000, v6, OS_LOG_TYPE_DEFAULT, "Recieved %{public}@, with _showingKeyboard = %{public}@", buf, 0x16u);

    }
    if (!self->_showingKeyboard)
    {
      self->_selectedItemStateBeforeShowingKeyboard = self->_selectedItemState;
      self->_showingKeyboard = 1;
      -[SFCapsuleCollectionView _updateToolbarAlpha](self, "_updateToolbarAlpha");
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC4E48]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (self->_keyboardHeight != 0.0
        && -[SFCapsuleCollectionView _shouldAnimateKeyboardHeightChanges](self, "_shouldAnimateKeyboardHeightChanges")
        && v13 != 0.0)
      {
        objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC4E40]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue") << 16;

        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __45__SFCapsuleCollectionView__keyboardWillShow___block_invoke;
        v16[3] = &unk_1E21E2050;
        v16[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:withDuration:delay:options:animations:completion:", 1, v15, v16, 0, v13, 0.0);
      }

    }
  }

}

uint64_t __45__SFCapsuleCollectionView__keyboardWillShow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_shouldAnimateKeyboardHeightChanges
{
  _BOOL4 v3;

  v3 = -[SFCapsuleCollectionView _shouldDodgeKeyboard](self, "_shouldDodgeKeyboard");
  if (v3)
    LOBYTE(v3) = !UIAccessibilityIsReduceMotionEnabled()
              || -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
  return v3;
}

- (void)_keyboardWillHide:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  -[SFCapsuleCollectionView _setKeyboardHeight:](self, "_setKeyboardHeight:", a3, 0.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (!self->_suppressesSelectedItemUnfocus && self->_selectedItemState == 2)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "capsuleCollectionViewWillHideKeyboard:", self);
      v5 = v7;
    }
  }
  self->_suppressesSelectedItemUnfocus = 0;

}

- (void)_keyboardDidHide:(id)a3
{
  self->_showingKeyboard = 0;
  -[SFCapsuleCollectionView _updateToolbarAlpha](self, "_updateToolbarAlpha", a3);
}

uint64_t __50__SFCapsuleCollectionView__layOutKeyboardBackdrop__block_invoke(uint64_t a1)
{
  double Height;
  double Width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;

  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 536);
  if (v4)
  {
    objc_msgSend(v4, "frame", Width);
    v6 = v5;
    Height = v7;
    v9 = v8;
    v11 = *(double *)(a1 + 72) + v10;
  }
  else
  {
    v9 = Width;
    v11 = *(double *)(a1 + 72);
    v6 = 0.0;
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3928]), "initWithFrame:style:", objc_msgSend(*(id *)(a1 + 32), "_keyboardBackdropStyle"), v6, Height, v9, v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 520);
  *(_QWORD *)(v13 + 520) = v12;

  v15 = *(_QWORD **)(a1 + 32);
  v16 = (void *)v15[52];
  v17 = v15[65];
  if (v15[67])
    objc_msgSend(v16, "insertSubview:aboveSubview:", v17);
  else
    objc_msgSend(v16, "insertSubview:atIndex:", v17);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setAlpha:", 0.0);
}

- (int64_t)_keyboardBackdropStyle
{
  void *v2;
  int64_t v3;

  if (-[_SFBarTheme overrideUserInterfaceStyle](self->_effectiveTheme, "overrideUserInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC38F8], "darkConfig");
  else
    objc_msgSend(MEMORY[0x1E0DC38F8], "defaultConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backdropStyle");

  return v3;
}

- (void)_updateKeyboardBackdropViewStyle
{
  -[UIKBVisualEffectView transitionToStyle:](self->_keyboardBackdropView, "transitionToStyle:", -[SFCapsuleCollectionView _keyboardBackdropStyle](self, "_keyboardBackdropStyle"));
}

- (id)inputAccessoryView
{
  SFCapsuleInputAccessorySpacerView *inputAccessoryView;
  void *v4;
  void *v5;
  SFCapsuleInputAccessorySpacerView *v6;
  SFCapsuleInputAccessorySpacerView *v7;
  SFCapsuleInputAccessorySpacerView *v8;
  SFCapsuleInputAccessorySpacerView *v9;
  CGRect v11;

  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop") || self->_selectedItemState != 2)
  {
    v9 = 0;
  }
  else
  {
    inputAccessoryView = self->_inputAccessoryView;
    if (!inputAccessoryView)
    {
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "capsuleView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = [SFCapsuleInputAccessorySpacerView alloc];
      -[SFCapsuleCollectionView bounds](self, "bounds");
      v7 = -[SFCapsuleInputAccessorySpacerView initWithCapsuleView:initialWidth:](v6, "initWithCapsuleView:initialWidth:", v5, CGRectGetWidth(v11));
      v8 = self->_inputAccessoryView;
      self->_inputAccessoryView = v7;

      -[SFCapsuleInputAccessorySpacerView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAccessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      inputAccessoryView = self->_inputAccessoryView;
    }
    v9 = inputAccessoryView;
  }
  return v9;
}

- (CGRect)_inputAccessoryViewFrame
{
  void *v3;
  SFCapsuleInputAccessorySpacerView *inputAccessoryView;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat v12;
  CGFloat Height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[SFCapsuleInputAccessorySpacerView window](self->_inputAccessoryView, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  inputAccessoryView = self->_inputAccessoryView;
  if (v3)
  {
    -[SFCapsuleInputAccessorySpacerView bounds](inputAccessoryView, "bounds");
    -[SFCapsuleCollectionView convertRect:fromView:](self, "convertRect:fromView:", self->_inputAccessoryView);
  }
  else
  {
    -[SFCapsuleInputAccessorySpacerView frame](inputAccessoryView, "frame");
  }
  x = v5;
  y = v6;
  width = v7;
  v12 = v8;

  if (y == 0.0)
  {
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Height = CGRectGetHeight(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = v12;
    v20 = CGRectOffset(v19, 0.0, Height);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    v12 = v20.size.height;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  char v6;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v21;
  CGRect v22;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  if (self->_itemsAreHidden)
    goto LABEL_2;
  if (self->_tapGestureRecognizer == v4)
  {
    -[UITapGestureRecognizer locationInView:](v4, "locationInView:", self);
    -[SFCapsuleCollectionView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() ^ 1;

    goto LABEL_3;
  }
  if ((UITapGestureRecognizer *)self->_panGesture != v4)
  {
    if ((UITapGestureRecognizer *)self->_dismissPanGestureRecognizer == v4)
    {
      if (!-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop") && self->_selectedItemState == 2)
      {
        -[SFCapsuleCollectionView _inputAccessoryViewFrame](self, "_inputAccessoryViewFrame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[SFCapsuleCollectionView bounds](self, "bounds");
        v22.origin.x = v17;
        v22.origin.y = v18;
        v22.size.width = v19;
        v22.size.height = v20;
        v21.origin.x = v10;
        v21.origin.y = v12;
        v21.size.width = v14;
        v21.size.height = v16;
        v6 = CGRectIntersectsRect(v21, v22);
        goto LABEL_3;
      }
      goto LABEL_2;
    }
LABEL_7:
    v6 = 1;
    goto LABEL_3;
  }
  if (!self->_selectedItemState)
  {
    if (!self->_topAction && !self->_trailingAction)
    {
      v6 = self->_numberOfItems > 1;
      goto LABEL_3;
    }
    goto LABEL_7;
  }
LABEL_2:
  v6 = 0;
LABEL_3:

  return v6 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if (self->_tapGestureRecognizer == v6)
  {
    if (!-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
    {
      objc_msgSend(v7, "locationInView:", self);
      v20 = v19;
      v22 = v21;
      -[SFCapsuleCollectionView _detachedCapsuleSelectionRect](self, "_detachedCapsuleSelectionRect");
      v24.x = v20;
      v24.y = v22;
      if (!CGRectContainsPoint(v28, v24))
      {
        -[SFCapsuleCollectionView _passthroughRect](self, "_passthroughRect");
        v25.x = v20;
        v25.y = v22;
        LODWORD(self) = !CGRectContainsPoint(v29, v25);
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  if ((UITapGestureRecognizer *)self->_panGesture != v6)
  {
LABEL_6:
    LOBYTE(self) = 1;
    goto LABEL_7;
  }
  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "locationInView:", self);
  v17 = v16;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  v18 = vabdd_f64(v17, CGRectGetMidY(v26));
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  LOBYTE(self) = v18 <= fmax(CGRectGetHeight(v27), 84.0) * 0.5;
LABEL_7:

  return (char)self;
}

- (void)invalidateHeightForCapsuleContentView:(id)a3
{
  -[SFCapsuleCollectionView invalidateHeightForCapsuleContentView:animated:animations:completion:](self, "invalidateHeightForCapsuleContentView:animated:animations:completion:", a3, 0, 0, 0);
}

- (void)invalidateHeightForCapsuleContentView:(id)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSArray *items;
  NSIndexSet *indexesOfLoadedViews;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  items = self->_items;
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke;
  v28[3] = &unk_1E21E2568;
  v16 = v10;
  v29 = v16;
  -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](items, "indexesOfObjectsAtIndexes:options:passingTest:", indexesOfLoadedViews, 0, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "firstIndex");

  if (v18 == 0x7FFFFFFFFFFFFFFFLL
    || (-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "invalidateCapsuleHeight"),
        v19,
        -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout"),
        !a4))
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionCoordinator);
    if (WeakRetained)
    {
      if (v11)
      {
        v26[0] = v15;
        v26[1] = 3221225472;
        v26[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_2;
        v26[3] = &unk_1E21E25B8;
        v27 = v11;
        objc_msgSend(WeakRetained, "addAnimations:", v26);

      }
      if (v12)
        objc_msgSend(WeakRetained, "addCompletion:", v12);
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_3;
      v24[3] = &unk_1E21E25E0;
      v24[4] = self;
      v25 = v11;
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_4;
      v22[3] = &unk_1E21E2608;
      v23 = v12;
      objc_msgSend(v21, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v24, v22, 0.0, 0.0);

    }
  }

}

BOOL __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "capsuleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
    *a4 = 1;
  return v7 == v8;
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __96__SFCapsuleCollectionView_invalidateHeightForCapsuleContentView_animated_animations_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __37__SFCapsuleCollectionView_reloadData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reclaimViewForItem:", a2);
}

uint64_t __37__SFCapsuleCollectionView_reloadData__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_canAnimateUpdates
{
  return !self->_selectedItemState && !self->_shouldDismissContent && !self->_itemsAreHidden;
}

uint64_t __56__SFCapsuleCollectionView_updateTrailingActionAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)hasTrailingAction
{
  return self->_trailingAction != 0;
}

void __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "layoutIfNeeded");

  objc_msgSend(v7, "contentContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v9);

  v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke_2;
  v15[3] = &unk_1E21E2258;
  v16 = v8;
  v17 = v7;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v12, "addCompletion:", v15);

}

void __60__SFCapsuleCollectionView__fetchContentViewForItem_atIndex___block_invoke_2(uint64_t a1)
{
  id v2;
  char v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v2)
  {

  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", *(_QWORD *)(a1 + 40));

    if ((v3 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
}

- (id)_trailingActionContentView
{
  void *v3;
  void *v4;

  -[SFCapsuleCollectionView createOrDequeueContentViewWithIdentifier:atIndex:](self, "createOrDequeueContentViewWithIdentifier:atIndex:", CFSTR("SFCapsuleCollectionViewActionContentView"), self->_numberOfItems);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_trailingAction)
    objc_msgSend(v3, "setAction:");
  return v4;
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_3;
  v30[3] = &unk_1E21E22F8;
  v30[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v31 = v12;
  v13 = v7;
  v32 = v13;
  objc_msgSend(v10, "safari_performWithoutRetargetingAnimations:", v30);
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_4;
  v27[3] = &unk_1E21E2258;
  v28 = v8;
  v15 = v12;
  v29 = v15;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_7;
  v24[3] = &unk_1E21E26F8;
  v16 = v13;
  v25 = v16;
  v26 = v28;
  v17 = v28;
  objc_msgSend(v14, "animateKeyframesWithDuration:delay:options:animations:completion:", 3072, v27, v24, 0.3, 0.0);
  v18 = (void *)MEMORY[0x1E0DC3F10];
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_8;
  v21[3] = &unk_1E21E2258;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  objc_msgSend(v18, "safari_performWithoutRetargetingAnimations:", v21);

}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_3(id *a1)
{
  double v2;
  double v3;
  id v4;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(a1[4], "capsuleFrame");
  objc_msgSend(a1[5], "setFrame:", v2, v3);
  objc_msgSend(a1[5], "layoutIfNeeded");
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "contentContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", a1[5]);

}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_5;
  v7[3] = &unk_1E21E2050;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 0.67);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_6;
  v5[3] = &unk_1E21E2050;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.33, 0.67);

}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "contentContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_9(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double Width;
  double MinY;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(*(id *)(a1 + 32), "_selectedCapsuleFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Width = CGRectGetWidth(v13);
  v14.origin.x = v3;
  v14.origin.y = v5;
  v14.size.width = v7;
  v14.size.height = v9;
  MinY = CGRectGetMinY(v14);
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", Width, MinY, 106.0, CGRectGetHeight(v15));
}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueOrCreateViewForItem:atIndex:", a2, a3);
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_incrementAnimationCountForItems:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layOutItems:atIndexes:selectedItemIndex:", v3, v4, *(_QWORD *)(a1 + 88));

  if (*(_BYTE *)(a1 + 104))
    v5 = *(_QWORD *)(a1 + 96);
  else
    v5 = objc_msgSend(*(id *)(a1 + 56), "indexAfterUpdateOfSelectedItemBeforeUpdate");
  v6 = *(id *)(a1 + 64);
  v13 = v6;
  if (*(_BYTE *)(a1 + 104))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "insertObject:atIndex:", *(_QWORD *)(a1 + 72), v5);
    v8 = objc_msgSend(v7, "copy");

    v13 = (id)v8;
  }
  v9 = *(id *)(a1 + 80);
  v10 = v9;
  if (*(_BYTE *)(a1 + 104))
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v11, "shiftIndexesStartingAtIndex:by:", v5, 1);
    v12 = objc_msgSend(v11, "copy");

    v10 = (void *)v12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_layOutItems:atIndexes:selectedItemIndex:", v13, v10, v5);
  objc_msgSend(*(id *)(a1 + 32), "_applyEffectsForChangeType:update:", 0, *(_QWORD *)(a1 + 56));

}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 48) || (v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3), v5 = v6, (v4 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "_reclaimViewForItem:", v6);
    v5 = v6;
  }

}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_15(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "capsuleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsAtIndexes:options:usingBlock:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_102);
  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  v2 = objc_msgSend(*(id *)(a1 + 56), "indexBeforeUpdateOfSelectedItemAfterUpdate");
  if (*(_BYTE *)(a1 + 96))
  {
    v3 = *(_QWORD *)(a1 + 88) + 1;
  }
  else
  {
    v3 = v2;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = objc_msgSend(*(id *)(a1 + 56), "selectedItemIndexBeforeUpdate");
  }
  v4 = *(id *)(a1 + 64);
  v11 = v4;
  if (*(_BYTE *)(a1 + 96))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "insertObject:atIndex:", *(_QWORD *)(a1 + 72), v3);
    v6 = objc_msgSend(v5, "copy");

    v11 = (id)v6;
  }
  v7 = *(id *)(a1 + 80);
  v8 = v7;
  if (*(_BYTE *)(a1 + 96))
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "shiftIndexesStartingAtIndex:by:", v3, 1);
    v10 = objc_msgSend(v9, "copy");

    v8 = (void *)v10;
  }
  objc_msgSend(*(id *)(a1 + 48), "_layOutItems:atIndexes:selectedItemIndex:", v11, v8, v3);
  objc_msgSend(*(id *)(a1 + 48), "_applyEffectsForChangeType:update:", 1, *(_QWORD *)(a1 + 56));

}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "capsuleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDirectionalCollapsedContentEdge:", 0);
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __37__SFCapsuleCollectionView_endUpdates__block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SFCapsuleCollectionView_endUpdates__block_invoke_19;
  v5[3] = &unk_1E21E2748;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsAtIndexes:options:usingBlock:", v3, 0, v5);
  return objc_msgSend(*(id *)(a1 + 48), "_decrementAnimationCountForItems:", *(_QWORD *)(a1 + 56));
}

void __37__SFCapsuleCollectionView_endUpdates__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "capsuleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);
  objc_msgSend(v4, "setDirectionalCollapsedContentEdge:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_reclaimViewForItem:", v3);

}

- (void)_applyEffectsForChangeType:(int64_t)a3 update:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  _QWORD v15[6];
  char v16;

  v5 = a4;
  v13 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "itemsBeforeUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexesOfDeletedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "selectedItemIndexBeforeUpdate");
    v9 = objc_msgSend(v13, "indexBeforeUpdateOfSelectedItemAfterUpdate");
    objc_msgSend(v13, "indexesOfDeletedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsIndex:", objc_msgSend(v13, "selectedItemIndexBeforeUpdate")))
    {
      objc_msgSend(v13, "indexesOfInsertedItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v13, "selectedItemIndexAfterUpdate")) ^ 1;

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    if (a3)
    {
      v9 = 0;
      v8 = 0;
      v7 = 0;
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "itemsAfterUpdate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexesOfInsertedItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "selectedItemIndexAfterUpdate");
      v9 = objc_msgSend(v13, "indexAfterUpdateOfSelectedItemBeforeUpdate");
    }
    v12 = 1;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SFCapsuleCollectionView__applyEffectsForChangeType_update___block_invoke;
  v15[3] = &__block_descriptor_49_e44_v32__0__SFCapsuleCollectionViewItem_8Q16_B24l;
  v16 = v12;
  v15[4] = v8;
  v15[5] = v9;
  objc_msgSend(v6, "enumerateObjectsAtIndexes:options:usingBlock:", v7, 0, v15, v13);

}

void __61__SFCapsuleCollectionView__applyEffectsForChangeType_update___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a2, "capsuleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  if (*(_BYTE *)(a1 + 48))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 == a3)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 8;
      if (v7 <= a3)
        v8 = 2;
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        v9 = 2;
      else
        v9 = v8;
    }
    else if (v6 <= a3)
    {
      v9 = 2;
    }
    else
    {
      v9 = 8;
    }
    objc_msgSend(v5, "setDirectionalCollapsedContentEdge:", v9);
    v5 = v20;
  }
  objc_msgSend(v5, "layoutIfNeeded");
  objc_msgSend(v20, "frameForShadowView");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v20, "shadowView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v20, "setAlpha:", 0.0);
  objc_msgSend(v20, "shadowView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", 0.0);

}

- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  NSArray *v11;
  NSArray *items;
  NSIndexSet *v13;
  NSIndexSet *indexesOfLoadedViews;
  id WeakRetained;
  int v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SFCapsuleCollectionView beginUpdates](self, "beginUpdates");
  v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v9 = v8;
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_18B7B2000, v7, OS_LOG_TYPE_DEFAULT, "Delete indexes = %@; animated = %@",
      (uint8_t *)&v16,
      0x16u);

  }
  -[SFCapsuleCollectionViewUpdate deleteItemsAtIndexes:animated:](self->_update, "deleteItemsAtIndexes:animated:", v6, v4);
  -[SFCapsuleCollectionViewUpdate itemsAfterUpdate](self->_update, "itemsAfterUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  items = self->_items;
  self->_items = v11;

  self->_selectedItemIndex = -[SFCapsuleCollectionViewUpdate selectedItemIndexAfterUpdate](self->_update, "selectedItemIndexAfterUpdate");
  -[NSArray indexesOfObjectsPassingTest:](self->_items, "indexesOfObjectsPassingTest:", &__block_literal_global_105);
  v13 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  self->_indexesOfLoadedViews = v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = objc_msgSend(WeakRetained, "numberOfItemsInCapsuleCollectionView:", self);

  -[SFCapsuleCollectionView _updateActions](self, "_updateActions");
  -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  -[SFCapsuleCollectionView endUpdates](self, "endUpdates");

}

BOOL __57__SFCapsuleCollectionView_deleteItemsAtIndexes_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "capsuleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  NSArray *v11;
  NSArray *items;
  NSIndexSet *v13;
  NSIndexSet *indexesOfLoadedViews;
  id WeakRetained;
  int v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SFCapsuleCollectionView beginUpdates](self, "beginUpdates");
  v7 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v9 = v8;
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_18B7B2000, v7, OS_LOG_TYPE_DEFAULT, "Insert indexes = %@; animated = %@",
      (uint8_t *)&v16,
      0x16u);

  }
  -[SFCapsuleCollectionViewUpdate insertItemsAtIndexes:animated:](self->_update, "insertItemsAtIndexes:animated:", v6, v4);
  -[SFCapsuleCollectionViewUpdate itemsAfterUpdate](self->_update, "itemsAfterUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  items = self->_items;
  self->_items = v11;

  self->_selectedItemIndex = -[SFCapsuleCollectionViewUpdate selectedItemIndexAfterUpdate](self->_update, "selectedItemIndexAfterUpdate");
  -[NSArray indexesOfObjectsPassingTest:](self->_items, "indexesOfObjectsPassingTest:", &__block_literal_global_106);
  v13 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  self->_indexesOfLoadedViews = v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfItems = objc_msgSend(WeakRetained, "numberOfItemsInCapsuleCollectionView:", self);

  -[SFCapsuleCollectionView _updateActions](self, "_updateActions");
  -[SFCapsuleCollectionView endUpdates](self, "endUpdates");

}

BOOL __57__SFCapsuleCollectionView_insertItemsAtIndexes_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "capsuleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updateTrailingCapsule
{
  NSUInteger v3;
  void *v4;
  int v5;
  NSIndexSet *v6;
  NSIndexSet *v7;
  void *v8;
  NSIndexSet *indexesOfLoadedViews;
  id v10;

  if (self->_numberOfItems)
  {
    -[NSArray lastObject](self->_items, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[NSArray count](self->_items, "count") - 1;
    -[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsIndex:", v3);

    v6 = (NSIndexSet *)-[NSIndexSet mutableCopy](self->_indexesOfLoadedViews, "mutableCopy");
    v7 = v6;
    if (v5)
    {
      -[NSIndexSet addIndex:](v6, "addIndex:", v3);
      -[SFCapsuleCollectionView _dequeueOrCreateViewForItem:atIndex:](self, "_dequeueOrCreateViewForItem:atIndex:", v10, v3);
    }
    else
    {
      -[NSIndexSet removeIndex:](v6, "removeIndex:", v3);
      objc_msgSend(v10, "capsuleView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_8:
        indexesOfLoadedViews = self->_indexesOfLoadedViews;
        self->_indexesOfLoadedViews = v7;

        return;
      }
      -[SFCapsuleCollectionView _reclaimViewForItem:](self, "_reclaimViewForItem:", v10);
      -[SFCapsuleCollectionView _scheduleTimerToDiscardViewsForReuseIfNeeded](self, "_scheduleTimerToDiscardViewsForReuseIfNeeded");
    }
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_8;
  }
}

- (void)_discardExcessViewsForReuse
{
  NSTimer **p_timerToDiscardViewsForReuse;
  id WeakRetained;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *contentViewRegistrations;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  id v18;

  p_timerToDiscardViewsForReuse = &self->_timerToDiscardViewsForReuse;
  WeakRetained = objc_loadWeakRetained((id *)&self->_timerToDiscardViewsForReuse);
  objc_msgSend(WeakRetained, "invalidate");

  objc_storeWeak((id *)p_timerToDiscardViewsForReuse, 0);
  -[SFCapsuleCollectionView _indexesOfAnimatingItems](self, "_indexesOfAnimatingItems");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {

  }
  else
  {
    v5 = -[NSIndexSet count](self->_indexesOfLoadedViews, "count");
    v6 = -[SFCapsuleCollectionView _maximumNumberOfVisibleViews](self, "_maximumNumberOfVisibleViews");

    if (v5 <= v6)
    {
      v7 = -[SFCapsuleCollectionView _softMaximumNumberOfViews](self, "_softMaximumNumberOfViews");
      v8 = -[NSIndexSet count](self->_indexesOfLoadedViews, "count");
      if (-[NSMutableSet count](self->_viewsForReuse, "count") + v8 > v7)
      {
        do
        {
          -[NSMutableSet anyObject](self->_viewsForReuse, "anyObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet removeObject:](self->_viewsForReuse, "removeObject:", v9);
          objc_msgSend(v9, "removeFromSuperview");
          objc_msgSend(v9, "contentView");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v9, "reusableContentViewIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              contentViewRegistrations = self->_contentViewRegistrations;
              objc_msgSend(v9, "reusableContentViewIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](contentViewRegistrations, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "contentView");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "discardView:", v16);

            }
          }

          v17 = -[NSIndexSet count](self->_indexesOfLoadedViews, "count");
        }
        while (-[NSMutableSet count](self->_viewsForReuse, "count") + v17 > v7);
      }
    }
  }
}

- (NSIndexSet)indexesOfVisibleItems
{
  return (NSIndexSet *)-[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 0);
}

- (id)_indexesOfVisibleItemsWithSelectedItemIndex:(int64_t)a3
{
  NSArray **p_items;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  p_items = &self->_items;
  if ((int64_t)-[NSArray count](self->_items, "count") <= a3)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFCapsuleCollectionView _indexesOfVisibleItemsWithSelectedItemIndex:].cold.1((uint64_t)p_items, v11);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a3 - 1;
    if (a3 >= 1)
      objc_msgSend(v6, "addIndex:", v8);
    v9 = -[NSArray count](*p_items, "count", v8);
    v10 = -2;
    if (self->_trailingAction)
      v10 = -1;
    if (v10 + v9 > a3)
      objc_msgSend(v7, "addIndex:", a3 + 1);
  }
  return v7;
}

- (void)_incrementAnimationCountForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 |= objc_msgSend(v10, "animationCount") == 0;
        objc_msgSend(v10, "setAnimationCount:", objc_msgSend(v10, "animationCount") + 1);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
  }

}

- (void)_decrementAnimationCountForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setAnimationCount:", objc_msgSend(v10, "animationCount") - 1);
        v7 |= objc_msgSend(v10, "animationCount") == 0;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
  }

}

- (void)_reclaimViewForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *contentViewRegistrations;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[3];

  v4 = a3;
  objc_msgSend(v4, "capsuleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v4, "capsuleIsDetached") & 1) == 0)
    {
      objc_msgSend(v4, "setCapsuleView:", 0);
      objc_msgSend(v4, "setCapsuleContentIsValid:", 0);
      objc_msgSend(v5, "setHidden:", 1);
      objc_msgSend(v5, "shadowView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v15[0] = *MEMORY[0x1E0C9BAA8];
      v15[1] = v7;
      v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v5, "setTransform:", v15);
      -[NSMutableSet addObject:](self->_viewsForReuse, "addObject:", v5);
      objc_msgSend(v5, "contentView");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "reusableContentViewIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          contentViewRegistrations = self->_contentViewRegistrations;
          objc_msgSend(v5, "reusableContentViewIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](contentViewRegistrations, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "contentView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "enqueueView:", v14);

        }
      }
    }
  }

}

- (int64_t)_insertionIndexForShadowInView:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SFCapsuleCollectionView__insertionIndexForShadowInView___block_invoke;
  v7[3] = &unk_1E21E2960;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __58__SFCapsuleCollectionView__insertionIndexForShadowInView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_superviewForCapsules
{
  if (self->_canBlurCapsules && self->_layoutStyle != 2)
    self = (SFCapsuleCollectionView *)self->_contentView;
  return self;
}

- (void)_updateSuperviewForCapsule:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SFCapsuleCollectionView _superviewForCapsules](self, "_superviewForCapsules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    objc_msgSend(v4, "addSubview:", v8);
  objc_msgSend(v8, "shadowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v4)
    objc_msgSend(v4, "insertSubview:atIndex:", v6, -[SFCapsuleCollectionView _insertionIndexForShadowInView:](self, "_insertionIndexForShadowInView:", v4));

}

- (void)_didReceiveTap:(id)a3
{
  id v4;
  void *v5;
  int64_t selectedItemState;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  CGPoint v29;
  CGPoint v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v5 = v4;
  selectedItemState = self->_selectedItemState;
  if (selectedItemState == 1)
  {
    objc_msgSend(v4, "locationInView:", self);
    if (self->_layoutStyle == 2
      && (v22 = v20,
          v23 = v21,
          -[SFCapsuleCollectionView _tapToShowBarBottomRegion](self, "_tapToShowBarBottomRegion"),
          v30.x = v22,
          v30.y = v23,
          CGRectContainsPoint(v33, v30)))
    {
      self->_minimizationFlags |= 8uLL;
      -[SFCapsuleCollectionView _setSelectedItemStateWithoutPerformingTransition:options:](self, "_setSelectedItemStateWithoutPerformingTransition:options:", 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __42__SFCapsuleCollectionView__didReceiveTap___block_invoke;
      v28[3] = &unk_1E21E2050;
      v28[4] = self;
      objc_msgSend(v24, "addCompletion:", v28);
    }
    else
    {
      -[SFCapsuleCollectionView _setSelectedItemStateWithoutPerformingTransition:options:](self, "_setSelectedItemStateWithoutPerformingTransition:options:", 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SFCapsuleCollectionView window](self, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "performTransitionWithAnimation:inContextOfContainerView:", 1, v25);

  }
  else if (!selectedItemState)
  {
    objc_msgSend(v4, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    -[SFCapsuleCollectionView _detachedCapsuleSelectionRect](self, "_detachedCapsuleSelectionRect");
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    if (CGRectIsNull(v31))
    {
      -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
      x = v15;
      y = v16;
      width = v17;
      height = v18;
    }
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v29.x = v8;
    v29.y = v10;
    if (CGRectContainsPoint(v32, v29))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0
        || objc_msgSend(WeakRetained, "capsuleCollectionViewShouldFocusSelectedItem:", self))
      {
        -[SFCapsuleCollectionView setSelectedItemState:animated:](self, "setSelectedItemState:animated:", 2, 1);
      }

    }
    else
    {
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      if (v10 <= CGRectGetMaxY(v34))
        -[SFCapsuleCollectionView _didReceiveTapOnPeekCapsule:](self, "_didReceiveTapOnPeekCapsule:", v5);
    }
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "capsuleView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsHighlight:", 1);

  }
}

uint64_t __42__SFCapsuleCollectionView__didReceiveTap___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 688) &= ~8uLL;
  return result;
}

- (void)_didReceiveTapOnPeekCapsule:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  int64_t selectedItemIndex;
  _BOOL4 v15;
  double MinX;
  int64_t v17;
  BOOL v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  double MaxX;
  int64_t v23;
  CGFloat v24;
  int64_t v25;
  int64_t v26;
  id WeakRetained;
  SFTransitionCoordinator *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  SFCapsuleCollectionView *v34;
  int64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  if (self->_selectedItemState)
    return;
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  selectedItemIndex = self->_selectedItemIndex;
  v15 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  MinX = CGRectGetMinX(v36);
  if (!v15)
  {
    if (v5 < MinX)
    {
      v20 = self->_selectedItemIndex + 1;
      if (v20 < (int64_t)-[NSArray count](self->_items, "count"))
      {
        v21 = self->_selectedItemIndex;
        goto LABEL_17;
      }
    }
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    MaxX = CGRectGetMaxX(v37);
    v21 = self->_selectedItemIndex;
    v23 = v21 - 1;
    if (v21 <= 0)
      v23 = selectedItemIndex;
    if (MaxX < v5)
      selectedItemIndex = v23;
LABEL_18:
    if (selectedItemIndex == v21)
      return;
    goto LABEL_19;
  }
  if (v5 < MinX)
  {
    v17 = self->_selectedItemIndex;
    v18 = v17 < 1;
    v19 = v17 - 1;
    if (!v18)
    {
      selectedItemIndex = v19;
      goto LABEL_19;
    }
  }
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  v24 = CGRectGetMaxX(v38);
  v21 = self->_selectedItemIndex;
  if (v24 >= v5)
    goto LABEL_18;
  v25 = v21 + 1;
  v26 = -[NSArray count](self->_items, "count");
  v21 = self->_selectedItemIndex;
  if (v25 >= v26)
    goto LABEL_18;
LABEL_17:
  selectedItemIndex = v21 + 1;
LABEL_19:
  if (selectedItemIndex != self->_numberOfItems)
  {
    if (-[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection"))
    {
      -[SFCapsuleCollectionView _animateSwitchingLinkedPageViewToItemAtIndex:](self, "_animateSwitchingLinkedPageViewToItemAtIndex:", selectedItemIndex);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v28 = objc_alloc_init(SFTransitionCoordinator);
        objc_storeWeak((id *)&self->_currentTransitionCoordinator, v28);
        -[SFTransitionCoordinator publicCoordinator](v28, "publicCoordinator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "capsuleCollectionView:willSelectItemAtIndex:coordinator:", self, selectedItemIndex, v29);

        -[SFCapsuleCollectionView setSelectedItemIndex:animated:](self, "setSelectedItemIndex:animated:", selectedItemIndex, 1);
        if (v28)
        {
          objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);

        }
      }
      else
      {
        -[SFCapsuleCollectionView setSelectedItemIndex:animated:](self, "setSelectedItemIndex:animated:", selectedItemIndex, 1);
      }
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __55__SFCapsuleCollectionView__didReceiveTapOnPeekCapsule___block_invoke;
      v32[3] = &unk_1E21E2540;
      v33 = WeakRetained;
      v34 = self;
      v35 = selectedItemIndex;
      v31 = WeakRetained;
      objc_msgSend(v30, "_performBlockAfterCATransactionCommits:", v32);

    }
  }
}

uint64_t __55__SFCapsuleCollectionView__didReceiveTapOnPeekCapsule___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "capsuleCollectionView:didSelectItemAtIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (BOOL)isTransitioningToNormalStateForTapInBottomRegion
{
  return (LOBYTE(self->_minimizationFlags) >> 3) & 1;
}

- (CGRect)_tapToShowBarBottomRegion
{
  double v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  if (self->_selectedItemState == 1 && (self->_layoutStyle != 1 || self->_minimizationStyle))
  {
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
    v4 = v3;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    v9 = CGRectGetHeight(v14) - v4;
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v10 = CGRectGetWidth(v15);
    v11 = 0.0;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v12 = v9;
  v13 = v4;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_updateOffsetForPan
{
  double v3;
  double v4;

  if (self->_numberOfItems)
  {
    if ((unint64_t)(-[UIPanGestureRecognizer state](self->_panGesture, "state") - 1) > 1)
    {
      v3 = *MEMORY[0x1E0C9D538];
      v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else if (self->_linkedPageView)
    {
      -[SFCapsuleCollectionView _offsetForPanFromLinkedPageView](self, "_offsetForPanFromLinkedPageView");
    }
    else
    {
      -[SFCapsuleCollectionView _panGestureTranslationConstrainedToPanAxis](self, "_panGestureTranslationConstrainedToPanAxis");
    }
    if (v3 != self->_offsetForPan.x || v4 != self->_offsetForPan.y)
    {
      self->_offsetForPan.x = v3;
      self->_offsetForPan.y = v4;
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (CGPoint)_panGestureTranslationConstrainedToPanAxis
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Height;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  unint64_t numberOfItems;
  int64_t selectedItemIndex;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  double v17;
  double v18;
  double Width;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[UIPanGestureRecognizer translationInView:](self->_panGesture, "translationInView:", self);
  v4 = v3;
  v6 = v5;
  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  Height = CGRectGetHeight(v29);
  v8 = Height;
  if (self->_panAxis == 1)
  {
    -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
    v10 = v9;
    v11 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    numberOfItems = self->_numberOfItems;
    selectedItemIndex = self->_selectedItemIndex;
    v14 = numberOfItems + ~selectedItemIndex;
    v15 = numberOfItems - selectedItemIndex;
    if (!self->_trailingAction)
      v15 = v14;
    if (v11)
      v16 = v15;
    else
      v16 = self->_selectedItemIndex;
    v17 = -(v10 * (double)v16);
    if (v11)
      v15 = self->_selectedItemIndex;
    v18 = v10 * (double)v15;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Width = CGRectGetWidth(v30);
    v20 = v4;
    v21 = v17;
    v22 = v18;
  }
  else
  {
    Width = Height * 0.5;
    v21 = 0.0;
    v22 = 0.0;
    v20 = v4;
  }
  v23 = SFRubberBandOffsetForOffset(v20, v21, v22, Width);
  if (self->_panAxis == 2)
  {
    -[SFCapsuleCollectionView bounds](self, "bounds");
    v24 = CGRectGetHeight(v31) / -3.0;
    -[SFCapsuleCollectionView layoutMargins](self, "layoutMargins");
    v26 = fmin(SFRubberBandOffsetForOffset(v6, v24, v25, v8), 0.0);
  }
  else
  {
    v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v27 = v23;
  result.y = v26;
  result.x = v27;
  return result;
}

- (int64_t)_nextItemIndexForSelectionGesture
{
  -[SFCapsuleCollectionView _panGestureTranslationConstrainedToPanAxis](self, "_panGestureTranslationConstrainedToPanAxis");
  return -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:", 1, 0);
}

- (double)_percentToSelectItemIndex:(int64_t)a3
{
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  CGRect v11;

  -[SFCapsuleCollectionView _panGestureTranslationConstrainedToPanAxis](self, "_panGestureTranslationConstrainedToPanAxis");
  v6 = v5;
  -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
  Width = CGRectGetWidth(v11);
  -[SFCapsuleCollectionView _interCapsuleSpacing](self, "_interCapsuleSpacing");
  v9 = 0.0;
  if (self->_selectedItemIndex != a3)
    return fabs(v6) / (Width + v8);
  return v9;
}

- (BOOL)_hasReachedTrailingActionPullThreshold
{
  _BOOL4 v3;
  double x;

  v3 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  x = self->_offsetForPan.x;
  if (v3)
    return x < -106.0;
  else
    return x > 106.0;
}

- (void)_didReceivePan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t selectedItemIndex;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double x;
  double y;
  NSNumber *nextSelectedItemIndexAfterPan;
  uint64_t v24;
  long double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int64_t v30;
  _BOOL4 v31;
  _BOOL4 v32;
  double v33;
  double selectionThreshold;
  NSObject *v35;
  NSNumber *v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  int64_t v40;
  void *v41;
  SFTransitionCoordinator *v42;
  NSHashTable *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  SFTransitionCoordinator *v52;
  void *v53;
  SFTransitionCoordinator *v54;
  void *v55;
  SFCapsuleCollectionViewLinkablePageView *v56;
  void *v57;
  _QWORD *v58;
  void *v59;
  float minimum;
  float maximum;
  float preferred;
  double v63;
  double v64;
  double v65;
  UIAction *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  UIAction *v71;
  NSHashTable *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t n;
  void *v76;
  NSHashTable *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  unint64_t panAxis;
  CFTimeInterval v87;
  double v88;
  double v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t (*__ptr32 *v93)();
  NSHashTable *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t j;
  void *v98;
  void *v99;
  uint64_t v100;
  int64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  NSHashTable *v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  uint64_t k;
  void *v113;
  SFCapsuleCollectionViewLinkablePageView *linkedPageView;
  void *v115;
  NSArray **p_items;
  int v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  _BOOL4 v121;
  int64_t v122;
  void *v123;
  id WeakRetained;
  void *v125;
  id v126;
  _QWORD v127[5];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[5];
  _QWORD v133[5];
  _QWORD v134[4];
  SFTransitionCoordinator *v135;
  _QWORD aBlock[4];
  SFTransitionCoordinator *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[6];
  _QWORD v143[5];
  _QWORD v144[5];
  id v145;
  uint8_t *v146;
  int64_t v147;
  uint8_t buf[8];
  uint8_t *v149;
  uint64_t v150;
  uint64_t (*v151)(uint64_t, uint64_t);
  void (*v152)(uint64_t);
  id v153;
  _QWORD v154[5];
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[5];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[5];
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  uint64_t v174;
  CAFrameRateRange v175;

  v174 = *MEMORY[0x1E0C80C00];
  v126 = a3;
  -[SFCapsuleCollectionView _indexesOfVisibleItemsIncludingAction:](self, "_indexesOfVisibleItemsIncludingAction:", 1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "velocityInView:", v4);
  v6 = v5;
  v8 = v7;

  v9 = self->_previousVelocity.x + (v6 - self->_previousVelocity.x) * 0.5;
  v10 = self->_previousVelocity.y + (v8 - self->_previousVelocity.y) * 0.5;
  self->_previousVelocity.x = v9;
  self->_previousVelocity.y = v10;
  selectedItemIndex = self->_selectedItemIndex;
  v12 = objc_msgSend(v126, "state");
  if ((unint64_t)(v12 - 3) >= 2)
  {
    if ((unint64_t)(v12 - 1) > 1)
      goto LABEL_126;
    v13 = v126;
    v14 = fabs(v9);
    v15 = fabs(v10);
    if (objc_msgSend(v126, "state") == 1)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B7B2000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PanGesture", " isAnimation=YES ", buf, 2u);
      }
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "capsuleView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFCapsuleCollectionView _setUpdateRequestActive:](self, "_setUpdateRequestActive:", 1);
      objc_msgSend(v18, "_setSafeAreaInsetsFrozen:", 1);
      self->_selectionGestureState = 1;
      if (self->_topAction && v14 <= v15)
        v19 = 2;
      else
        v19 = 1;
      self->_panAxis = v19;
      -[SFCapsuleCollectionView _updateCanBlurCapsules](self, "_updateCanBlurCapsules");
      if (self->_panAxis == 1)
        objc_msgSend(v18, "setAllowsHighlight:", 0);
      self->_axisSwitchTime = CACurrentMediaTime();
      -[UISelectionFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v77 = self->_gestureObservers;
      v78 = -[NSHashTable countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v165, v173, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v166;
        do
        {
          for (i = 0; i != v78; ++i)
          {
            if (*(_QWORD *)v166 != v79)
              objc_enumerationMutation(v77);
            v81 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v81, "capsuleCollectionView:didBeginSelectionGestureOnAxis:", self, self->_panAxis);
          }
          v78 = -[NSHashTable countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v165, v173, 16);
        }
        while (v78);
      }

      v13 = v126;
    }
    -[SFCapsuleCollectionViewLinkablePageView didReceiveLinkedPanGesture:](self->_linkedPageView, "didReceiveLinkedPanGesture:", v13);
    objc_msgSend(v126, "translationInView:", self);
    v83 = v82;
    v85 = v84;
    panAxis = self->_panAxis;
    v87 = CACurrentMediaTime();
    v88 = _SFClampPercent(v87 - self->_axisSwitchTime, 0.0, 0.5);
    v89 = _SFInterpolate(1.49253731, 0.67, v88);
    if (v14 <= 50.0 || v14 <= v15 + v15 || fabs(v83) <= fabs(v85) * v89)
    {
      if (v15 <= 50.0 || v15 <= v14 + v14 || fabs(v85) <= fabs(v83) * v89 || v85 > 0.0 || !self->_topAction)
        goto LABEL_97;
      v90 = 2;
    }
    else
    {
      v90 = 1;
    }
    self->_panAxis = v90;
LABEL_97:
    v121 = -[SFCapsuleCollectionView _hasReachedTrailingActionPullThreshold](self, "_hasReachedTrailingActionPullThreshold");
    -[SFCapsuleCollectionView _updateOffsetForPan](self, "_updateOffsetForPan");
    -[SFCapsuleCollectionView _updateRangeOfLoadedViews](self, "_updateRangeOfLoadedViews");
    v91 = 0x1E0DC3000;
    v92 = MEMORY[0x1E0C809B0];
    v93 = &off_18BAD4000;
    if (panAxis != self->_panAxis)
    {
      self->_axisSwitchTime = CACurrentMediaTime();
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
      v164[0] = MEMORY[0x1E0C809B0];
      v164[1] = 3221225472;
      v164[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke;
      v164[3] = &unk_1E21E2050;
      v164[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v164, 0);
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v94 = self->_gestureObservers;
      v95 = -[NSHashTable countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
      if (v95)
      {
        v96 = *(_QWORD *)v161;
        do
        {
          for (j = 0; j != v95; ++j)
          {
            if (*(_QWORD *)v161 != v96)
              objc_enumerationMutation(v94);
            v98 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v98, "capsuleCollectionView:selectionGestureDidChangeFromAxis:", self, panAxis);
          }
          v95 = -[NSHashTable countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v160, v172, 16);
        }
        while (v95);
      }

      v92 = MEMORY[0x1E0C809B0];
      v91 = 0x1E0DC3000uLL;
      v93 = &off_18BAD4000;
    }
    v99 = *(void **)(v91 + 3856);
    v159[0] = v92;
    v100 = *((_QWORD *)v93 + 322);
    v159[1] = v100;
    v159[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2;
    v159[3] = &unk_1E21E2050;
    v159[4] = self;
    objc_msgSend(v99, "animateWithDuration:animations:", v159, 0.15);
    if (self->_trailingAction
      && self->_panAxis == 1
      && self->_selectedItemIndex + 1 == self->_numberOfItems
      && v121 != -[SFCapsuleCollectionView _hasReachedTrailingActionPullThreshold](self, "_hasReachedTrailingActionPullThreshold"))
    {
      -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
    }
    if (self->_sendProgressMessageToObservers)
    {
      -[SFCapsuleCollectionView _panGestureTranslationConstrainedToPanAxis](self, "_panGestureTranslationConstrainedToPanAxis");
      v101 = -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:allowActionIndex:allowOutOfBounds:", 1, 1);
      -[SFCapsuleCollectionView _percentToActivatingTopActionWithTranslation:](self, "_percentToActivatingTopActionWithTranslation:", self->_offsetForPan.x, self->_offsetForPan.y);
      v103 = v102;
      -[SFCapsuleCollectionView _percentToSelectItemIndex:](self, "_percentToSelectItemIndex:", v101);
      v105 = v104;
      -[SFCapsuleCollectionView _swipeTranslationFactorWithPercentToTopAction:](self, "_swipeTranslationFactorWithPercentToTopAction:", v103);
      v107 = v106;
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      v108 = self->_gestureObservers;
      v109 = -[NSHashTable countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
      if (v109)
      {
        v110 = v105 * v107;
        v111 = *(_QWORD *)v156;
        do
        {
          for (k = 0; k != v109; ++k)
          {
            if (*(_QWORD *)v156 != v111)
              objc_enumerationMutation(v108);
            v113 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v113, "capsuleCollectionView:didUpdateProgress:toSelectItemAtIndex:progressToTopAction:snapToAxis:", self, v101, self->_panAxis, v110, v103);
          }
          v109 = -[NSHashTable countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
        }
        while (v109);
      }

    }
    linkedPageView = self->_linkedPageView;
    if (linkedPageView)
    {
      -[SFCapsuleCollectionViewLinkablePageView animationSettingsForCapsuleSelectionGesture](linkedPageView, "animationSettingsForCapsuleSelectionGesture");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v154[0] = MEMORY[0x1E0C809B0];
      v154[1] = v100;
      v154[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3;
      v154[3] = &unk_1E21E2050;
      v154[4] = self;
      objc_msgSend(v115, "performInteractive:animations:completion:", 1, v154, 0);

    }
    goto LABEL_126;
  }
  v119 = selectedItemIndex;
  -[SFCapsuleCollectionViewLinkablePageView didReceiveLinkedPanGesture:](self->_linkedPageView, "didReceiveLinkedPanGesture:", v126);
  p_items = &self->_items;
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "capsuleView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v120, "_setSafeAreaInsetsFrozen:", 0);
  objc_msgSend(v120, "setAllowsHighlight:", 1);
  x = self->_offsetForPan.x;
  y = self->_offsetForPan.y;
  v122 = self->_selectedItemIndex;
  if (-[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection"))
  {
    nextSelectedItemIndexAfterPan = self->_nextSelectedItemIndexAfterPan;
    if (nextSelectedItemIndexAfterPan)
    {
      v24 = -[NSNumber integerValue](nextSelectedItemIndexAfterPan, "integerValue");
      if (v24 >= (int64_t)-[NSArray count](*p_items, "count"))
      {
        v35 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[SFCapsuleCollectionView _didReceivePan:].cold.1((uint64_t)p_items, v35);
      }
      else
      {
        v122 = v24;
      }
    }
    v36 = self->_nextSelectedItemIndexAfterPan;
    self->_nextSelectedItemIndexAfterPan = 0;

  }
  else if (objc_msgSend(v126, "state") == 3)
  {
    if (self->_usesFastDeceleration)
      v25 = *MEMORY[0x1E0DC5360];
    else
      v25 = *MEMORY[0x1E0DC5368];
    v26 = SFProjectedOffsetForOffsetWithVelocity(x, y, v9, v10, v25, *MEMORY[0x1E0DC5368]);
    -[SFCapsuleCollectionView _percentToActivatingTopActionWithTranslation:](self, "_percentToActivatingTopActionWithTranslation:");
    v28 = v27;
    -[SFCapsuleCollectionView _swipeTranslationFactorWithPercentToTopAction:](self, "_swipeTranslationFactorWithPercentToTopAction:");
    if (fabs(x) <= fabs(y) && self->_topAction)
    {
      if (v28 >= 0.5)
      {
        v30 = self->_selectedItemIndex;
        v31 = -[SFCapsuleCollectionView _hasReachedTrailingActionPullThreshold](self, "_hasReachedTrailingActionPullThreshold");
        if (v30 == v122)
        {
          if (self->_trailingAction)
          {
            v32 = self->_selectedItemIndex + 1 == self->_numberOfItems && v31;
            v117 = v32;
          }
          else
          {
            v117 = 0;
          }
          v40 = 4;
          v118 = 0x100000001;
        }
        else
        {
          v117 = 0;
          v118 = 1;
          v40 = 4;
        }
        goto LABEL_41;
      }
    }
    else
    {
      v33 = v26 * v29;
      selectionThreshold = self->_selectionThreshold;
      if (selectionThreshold == 0.0)
        selectionThreshold = 0.5;
      v122 = -[SFCapsuleCollectionView _indexOfTargetItemWithTranslation:roundingThreshold:](self, "_indexOfTargetItemWithTranslation:roundingThreshold:", v33, selectionThreshold);
    }
  }
  v37 = self->_selectedItemIndex == v122;
  v38 = -[SFCapsuleCollectionView _hasReachedTrailingActionPullThreshold](self, "_hasReachedTrailingActionPullThreshold");
  if (v37)
  {
    if (self->_trailingAction && (self->_selectedItemIndex + 1 == self->_numberOfItems ? (v39 = v38) : (v39 = 0), v39))
    {
      v118 = 0x100000000;
      v40 = 3;
      v117 = 1;
    }
    else
    {
      v117 = 0;
      v118 = 0x100000000;
      v40 = 5;
    }
  }
  else
  {
    v118 = 0;
    v117 = 0;
    v40 = 2;
  }
LABEL_41:
  self->_selectionGestureState = v40;
  -[SFCapsuleCollectionView _layOutToolbar](self, "_layOutToolbar");
  *(_QWORD *)buf = 0;
  v149 = buf;
  v150 = 0x3032000000;
  v151 = __Block_byref_object_copy_;
  v152 = __Block_byref_object_dispose_;
  v153 = 0;
  v41 = (void *)MEMORY[0x1E0DC3F10];
  v144[0] = MEMORY[0x1E0C809B0];
  v144[1] = 3221225472;
  v144[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_128;
  v144[3] = &unk_1E21E2988;
  v144[4] = self;
  v147 = v122;
  v145 = v125;
  v146 = buf;
  objc_msgSend(v41, "safari_performWithoutRetargetingAnimations:", v144);
  v42 = objc_alloc_init(SFTransitionCoordinator);
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, v42);
  v143[0] = MEMORY[0x1E0C809B0];
  v143[1] = 3221225472;
  v143[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_129;
  v143[3] = &unk_1E21E29B0;
  v143[4] = self;
  -[SFTransitionCoordinator addAnimations:](v42, "addAnimations:", v143);
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_130;
  v142[3] = &unk_1E21E29D8;
  v142[4] = self;
  v142[5] = buf;
  -[SFTransitionCoordinator addCompletion:](v42, "addCompletion:", v142);
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v43 = self->_gestureObservers;
  v44 = -[NSHashTable countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v138, v170, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v139;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v139 != v45)
          objc_enumerationMutation(v43);
        v47 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * m);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SFTransitionCoordinator publicCoordinator](v42, "publicCoordinator");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "capsuleCollectionView:willEndSelectionGestureWithCoordinator:", self, v48);

        }
      }
      v44 = -[NSHashTable countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v138, v170, 16);
    }
    while (v44);
  }

  -[SFCapsuleCollectionView setSelectedItemIndex:](self, "setSelectedItemIndex:", v122);
  self->_previousVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
  -[SFCapsuleCollectionView _updateOffsetForPan](self, "_updateOffsetForPan");
  -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
  v50 = (double)v119 * v49 - v49 * (double)self->_selectedItemIndex;
  v51 = 0.0;
  if (!_SFEqualWithEpsilon(v50, x, 0.1))
    v51 = v9 / (v50 - x);
  -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_133;
  aBlock[3] = &unk_1E21E2050;
  v52 = v42;
  v137 = v52;
  v53 = _Block_copy(aBlock);
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_134;
  v134[3] = &unk_1E21E2050;
  v54 = v52;
  v135 = v54;
  v55 = _Block_copy(v134);
  v56 = self->_linkedPageView;
  if (v56)
  {
    -[SFCapsuleCollectionViewLinkablePageView animationSettingsForCapsuleSelectionGesture](v56, "animationSettingsForCapsuleSelectionGesture");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_135;
    v133[3] = &unk_1E21E2A00;
    v58 = v133;
    v133[4] = v55;
    objc_msgSend(v57, "performInteractive:animations:completion:", 0, v53, v133);

  }
  else
  {
    v59 = (void *)MEMORY[0x1E0DC3F10];
    v175 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    minimum = v175.minimum;
    maximum = v175.maximum;
    preferred = v175.preferred;
    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_4;
    v132[3] = &unk_1E21E2608;
    v58 = v132;
    v132[4] = v55;
    *(float *)&v63 = minimum;
    *(float *)&v64 = maximum;
    *(float *)&v65 = preferred;
    objc_msgSend(v59, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 2, v53, v132, 0.0, v51, v63, v64, v65);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v118 & 0x100000000) == 0
    && (-[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection") & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "capsuleCollectionView:didSelectItemAtIndex:", self, v122);
  }
  if ((_DWORD)v118)
  {
    v66 = self->_topAction;
    v67 = objc_alloc_init(MEMORY[0x1E0DC36D0]);
    objc_msgSend(v67, "sendAction:", v66);

  }
  if (v117)
  {
    -[NSArray lastObject](*p_items, "lastObject");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "capsuleView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = self->_trailingAction;
    objc_msgSend(v70, "sendAction:", v71);

  }
  v123 = v55;
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v72 = self->_gestureObservers;
  v73 = -[NSHashTable countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v128, v169, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v129;
    do
    {
      for (n = 0; n != v73; ++n)
      {
        if (*(_QWORD *)v129 != v74)
          objc_enumerationMutation(v72);
        v76 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * n);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v76, "capsuleCollectionViewDidEndSelectionGesture:", self);
      }
      v73 = -[NSHashTable countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v128, v169, 16);
    }
    while (v73);
  }

  self->_selectionGestureState = 0;
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __42__SFCapsuleCollectionView__didReceivePan___block_invoke_5;
  v127[3] = &unk_1E21E2050;
  v127[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v127, 0.15);
  -[SFCapsuleCollectionView _setUpdateRequestActive:](self, "_setUpdateRequestActive:", 0);

  _Block_object_dispose(buf, 8);
LABEL_126:

}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutItems:atIndexes:selectedItemIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateCapsuleAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_layOutToolbar");
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __42__SFCapsuleCollectionView__didReceivePan___block_invoke_128(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 1064);
  v9 = (id)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "_indexesOfVisibleItemsWithSelectedItemIndex:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIndexes:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "objectsAtIndexes:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_incrementAnimationCountForItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "mutableCopy");
  objc_msgSend(v8, "removeIndexes:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_layOutItems:atIndexes:selectedItemIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072), v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));

}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_129(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_130(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "_decrementAnimationCountForItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateCanBlurCapsules");
  v2 = WBS_LOG_CHANNEL_PREFIXLoweredTabBar();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_18B7B2000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PanGesture", ", v3, 2u);
  }
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_133(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "disableKeyframeAnimations");
  return objc_msgSend(*(id *)(a1 + 32), "invokeAnimations");
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_2_134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeCompletion");
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_3_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__SFCapsuleCollectionView__didReceivePan___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCapsuleAlpha");
}

- (void)_setUpdateRequestActive:(BOOL)a3
{
  if (a3)
    _UIUpdateRequestActivate();
  else
    _UIUpdateRequestDeactivate();
}

- (BOOL)isInteractivelySelectingItem
{
  return self->_selectionGestureState == 1;
}

- (BOOL)_isSendingTrailingAction
{
  return -[SFCapsuleCollectionViewLinkablePageView drivesCapsuleSelection](self->_linkedPageView, "drivesCapsuleSelection")&& (-[SFCapsuleCollectionViewLinkablePageView isSendingTrailingAction](self->_linkedPageView, "isSendingTrailingAction") & 1) != 0|| self->_selectionGestureState == 3;
}

- (double)_percentToActivatingTopActionWithTranslation:(CGPoint)a3
{
  double y;
  CGFloat Height;
  CGRect v6;

  if (!self->_topAction)
    return 0.0;
  y = a3.y;
  -[SFCapsuleCollectionView bounds](self, "bounds", a3.x);
  Height = CGRectGetHeight(v6);
  return fmax(SFRubberBandOffsetForOffset(y / (Height / -3.0), 0.0, 1.0, 1.0), 0.0);
}

- (double)_swipeTranslationFactorWithPercentToTopAction:(double)a3
{
  double v3;

  if (!self->_topAction)
    return 1.0;
  v3 = _SFClamp(a3, 0.0, 1.0);
  return 1.0 - v3 * v3;
}

- (CGPoint)selectedCapsuleOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offsetForPan.x;
  y = self->_offsetForPan.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setItemsAreHidden:(BOOL)a3
{
  if (self->_itemsAreHidden != a3)
  {
    self->_itemsAreHidden = a3;
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowingAlternateToolbarContent:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  _QWORD v8[5];

  v4 = a4;
  v7 = -[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent");
  self->_showingAlternateToolbarContent = a3;
  if (v7 != -[SFCapsuleCollectionView _shouldShowAlternateToolbarContent](self, "_shouldShowAlternateToolbarContent"))
  {
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    -[SFCapsuleCollectionView _updateShowsMinimizedProgressView](self, "_updateShowsMinimizedProgressView");
    if (v4)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __70__SFCapsuleCollectionView_setShowingAlternateToolbarContent_animated___block_invoke;
      v8[3] = &unk_1E21E2050;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v8, 0);
    }
  }
}

uint64_t __70__SFCapsuleCollectionView_setShowingAlternateToolbarContent_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSelectedItemUsesLiftedPreviewAppearance:(BOOL)a3 animator:(id)a4
{
  NSArray *items;
  int64_t selectedItemIndex;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SFCapsuleCollectionView *v14;
  BOOL v15;

  if (self->_selectedItemUsesLiftedPreviewAppearance != a3)
  {
    self->_selectedItemUsesLiftedPreviewAppearance = a3;
    items = self->_items;
    selectedItemIndex = self->_selectedItemIndex;
    v8 = a4;
    -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", selectedItemIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "capsuleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__SFCapsuleCollectionView_setSelectedItemUsesLiftedPreviewAppearance_animator___block_invoke;
    v12[3] = &unk_1E21E22A8;
    v13 = v10;
    v14 = self;
    v15 = a3;
    v11 = v10;
    objc_msgSend(v8, "addAnimations:", v12);

  }
}

uint64_t __79__SFCapsuleCollectionView_setSelectedItemUsesLiftedPreviewAppearance_animator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 40), "selectedItemIsMinimized") && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setUsesPlatterEffect:", objc_msgSend(*(id *)(a1 + 40), "_selectedItemShouldUsePlatterEffect"));
  objc_msgSend(*(id *)(a1 + 40), "_updateVisualEffectGroupName");
  return objc_msgSend(*(id *)(a1 + 40), "_updateCapsuleAlpha");
}

- (double)_overscrollDistanceForTopEdge
{
  return fmax(self->_minimizationStartingDragOffset- self->_minimizationLastDragOffset- self->_distanceToTopEdgeAtMinimizationBegan, 0.0);
}

- (double)_distanceToTopEdgeIncludingDeceleration:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  double v6;
  double v7;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "capsuleCollectionView:distanceToTopEdgeIncludingDeceleration:", self, v3);
    v7 = v6;
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_minimizedContentScale
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Height;
  CGRect v16;
  CGRect v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "capsuleCollectionViewMinimizedContentScale:", self);
    v5 = v4;
  }
  else
  {
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SFCapsuleCollectionView minimizedCapsuleFrame](self, "minimizedCapsuleFrame");
    Height = CGRectGetHeight(v16);
    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    v5 = Height / CGRectGetHeight(v17);
  }

  return v5;
}

- (double)_insetForCapsuleEdgeWithInsets:(UIEdgeInsets)a3
{
  double bottom;
  double top;

  bottom = a3.bottom;
  top = a3.top;
  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop", a3.top, a3.left, a3.bottom, a3.right))
    return top;
  else
    return bottom;
}

- (void)_sendMinimizationDidUpdateToObservers
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_gestureObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "capsuleCollectionViewDidUpdateMinimizationGesture:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendMinimizationDidEndToObservers
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_gestureObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "capsuleCollectionViewDidEndMinimizationGesture:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5
{
  _BOOL4 v5;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;

  v5 = a5;
  if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
  {
    v9 = fabs(a4);
    if ((self->_minimizationFlags & 2) == 0)
      v9 = a4;
    if (v5 && v9 >= 250.0)
      return 1;
    if (v5
      && -[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop", v9)
      && (-[SFCapsuleCollectionView _overscrollDistanceForTopEdge](self, "_overscrollDistanceForTopEdge"), v9 != 0.0))
    {
      return 1;
    }
    else
    {
      v15 = !-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop", v9);
      return a3 >= 62.0 && v15;
    }
  }
  else
  {
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 0);
    v12 = v11;
    -[SFCapsuleCollectionView obscuredInsetsForState:](self, "obscuredInsetsForState:", 1);
    v14 = v12 - v13;
    if (!-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop") || v5)
    {
      -[SFCapsuleCollectionView _distanceToTopEdgeIncludingDeceleration:](self, "_distanceToTopEdgeIncludingDeceleration:", 1);
      return v16 >= v14 && a3 >= 31.0;
    }
    else
    {
      return v14 <= a3;
    }
  }
}

- (BOOL)_translationIsAlmostHorizontal:(CGPoint)a3
{
  if (a3.y < 0.0)
    a3.y = -a3.y;
  if (a3.x < 0.0)
    a3.x = -a3.x;
  return a3.y <= a3.x * self->_verticalSwipeThreshold;
}

- (void)_setCapsuleSafeAreaInsetsFrozen:(BOOL)a3
{
  NSArray *items;
  NSIndexSet *indexesOfLoadedViews;
  _QWORD v5[4];
  BOOL v6;

  items = self->_items;
  indexesOfLoadedViews = self->_indexesOfLoadedViews;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SFCapsuleCollectionView__setCapsuleSafeAreaInsetsFrozen___block_invoke;
  v5[3] = &__block_descriptor_33_e44_v32__0__SFCapsuleCollectionViewItem_8Q16_B24l;
  v6 = a3;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](items, "enumerateObjectsAtIndexes:options:usingBlock:", indexesOfLoadedViews, 0, v5);
}

void __59__SFCapsuleCollectionView__setCapsuleSafeAreaInsetsFrozen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 32);
  objc_msgSend(a2, "capsuleView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSafeAreaInsetsFrozen:", v2);

}

- (void)beginDraggingWithOffset:(double)a3
{
  void *v5;
  char v6;
  id WeakRetained;
  char v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_items, "count"))
  {
    if (self->_selectedItemState != 2 && !self->_forceHidden)
    {
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "capsuleIsDetached");

      if ((v6 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(WeakRetained, "capsuleCollectionViewAllowsMinimizationGesture:", self))
        {
LABEL_29:

          return;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = objc_msgSend(WeakRetained, "capsuleCollectionViewBoundaryEdgesForScrollableContent:", self);
        else
          v8 = 0;
        v9 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
        self->_minimizationFlags = 1;
        if (v9 && (v8 & 4) != 0 && (v8 & 1) == 0)
        {
          v10 = 7;
          v11 = 3;
        }
        else
        {
          v10 = 5;
          if ((v8 & 5) != 4)
          {
LABEL_17:
            if (v9)
              self->_minimizationFlags = v10;
            self->_minimizationStartingDragOffset = a3;
            -[SFCapsuleCollectionView _distanceToTopEdgeIncludingDeceleration:](self, "_distanceToTopEdgeIncludingDeceleration:", 0);
            self->_distanceToTopEdgeAtMinimizationBegan = v12;
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v13 = self->_gestureObservers;
            v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v20;
              do
              {
                v17 = 0;
                do
                {
                  if (*(_QWORD *)v20 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v18, "capsuleCollectionViewDidBeginMinimizationGesture:", self, (_QWORD)v19);
                  ++v17;
                }
                while (v15 != v17);
                v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
              }
              while (v15);
            }

            goto LABEL_29;
          }
          v11 = 0;
          v10 = 4;
        }
        self->_minimizationFlags = v11;
        goto LABEL_17;
      }
    }
  }
}

- (void)endDraggingWithTargetOffset:(double)a3 velocity:(double)a4
{
  -[SFCapsuleCollectionView _updateDragWithOffset:velocity:ended:](self, "_updateDragWithOffset:velocity:ended:", 1, a3, -a4);
}

- (void)endScrolling
{
  -[SFCapsuleCollectionView _updateDragWithOffset:velocity:ended:](self, "_updateDragWithOffset:velocity:ended:", 1, self->_minimizationLastDragOffset, 0.0);
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropHeight");
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEndBackdropHeightAnimation");
}

void __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_3(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldUseNormalLayoutForMinimizedCapsule");
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0)
    v4 = 0;
  else
    v4 = *(_QWORD *)(v3 + 976);
  objc_msgSend(*(id *)(v3 + 1072), "objectAtIndexedSubscript:", *(_QWORD *)(v3 + 992));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capsuleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 != v4)
    objc_msgSend(*(id *)(a1 + 32), "_updateStateFlagsForContentViewAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropHeight");
}

uint64_t __64__SFCapsuleCollectionView__updateDragWithOffset_velocity_ended___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_sendMinimizationDidUpdateToObservers");
  return result;
}

- (void)_didReceiveDismissPan:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double Height;
  id WeakRetained;
  id v10;
  CGRect v11;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 2)
  {
    objc_msgSend(v10, "translationInView:", self);
    v5 = v4;
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capsuleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    Height = CGRectGetHeight(v11);

    if (v5 >= Height * 0.5)
    {
      objc_msgSend(v10, "setEnabled:", 0);
      objc_msgSend(v10, "setEnabled:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "capsuleCollectionViewWillHideKeyboard:", self);

    }
  }

}

- (void)setSelectedItemState:(int64_t)a3 animated:(BOOL)a4
{
  -[SFCapsuleCollectionView setSelectedItemState:options:animated:](self, "setSelectedItemState:options:animated:", a3, 0, a4);
}

- (void)setSelectedItemState:(int64_t)a3 options:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SFTransitionCoordinator **p_currentTransitionCoordinator;
  void *v8;
  id v9;

  if (self->_selectedItemState != a3)
  {
    v5 = a5;
    -[SFCapsuleCollectionView _setSelectedItemStateWithoutPerformingTransition:options:](self, "_setSelectedItemStateWithoutPerformingTransition:options:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    p_currentTransitionCoordinator = &self->_currentTransitionCoordinator;
    objc_storeWeak((id *)&self->_currentTransitionCoordinator, v9);
    -[SFCapsuleCollectionView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performTransitionWithAnimation:inContextOfContainerView:", v5, v8);

    objc_storeWeak((id *)p_currentTransitionCoordinator, 0);
  }
}

- (id)_setSelectedItemStateWithoutPerformingTransition:(int64_t)a3 options:(int64_t)a4
{
  void *v7;
  char v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSMutableDictionary *selectedItemAccessoryViews;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];

  -[SFCapsuleCollectionView _coordinatorForUpdatingSelectedItemFromState:toState:](self, "_coordinatorForUpdatingSelectedItemFromState:toState:", self->_selectedItemState, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (a3 == 1) ^ (self->_selectedItemState != 1);
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "publicCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "capsuleCollectionView:selectedItemWillChangeToState:options:coordinator:", self, a3, a4, v10);

  }
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "capsuleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_minimizationStyle)
    v13 = 1;
  else
    v13 = v8;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(v7, "publicCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willChangeToMinimized:coordinator:", a3 == 1, v14);

  }
  selectedItemAccessoryViews = self->_selectedItemAccessoryViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](selectedItemAccessoryViews, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "publicCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessoryView:coordinator:", v17, v18);

  self->_selectedItemState = a3;
  -[SFCapsuleCollectionView _updateShowsMinimizedProgressView](self, "_updateShowsMinimizedProgressView");
  if (self->_keyboardHeight != 0.0 && self->_backdropHeightAnimationCount)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__SFCapsuleCollectionView__setSelectedItemStateWithoutPerformingTransition_options___block_invoke;
    v20[3] = &unk_1E21E2050;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateByRetargetingAnimations:completion:", v20, 0);
  }
  if ((v8 & 1) == 0 && self->_numberOfItems)
    -[SFCapsuleCollectionView _performVisualEffectTransitionWithCoordinator:](self, "_performVisualEffectTransitionWithCoordinator:", v7);

  return v7;
}

uint64_t __84__SFCapsuleCollectionView__setSelectedItemStateWithoutPerformingTransition_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropHeight");
}

- (void)_performVisualEffectTransitionWithCoordinator:(id)a3
{
  id v4;
  _QWORD v5[5];

  if (self->_minimizationStyle != 1)
  {
    v4 = a3;
    -[SFCapsuleCollectionView beginVisualEffectTransition](self, "beginVisualEffectTransition");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__SFCapsuleCollectionView__performVisualEffectTransitionWithCoordinator___block_invoke;
    v5[3] = &unk_1E21E2050;
    v5[4] = self;
    objc_msgSend(v4, "addCompletion:", v5);

  }
}

uint64_t __73__SFCapsuleCollectionView__performVisualEffectTransitionWithCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endVisualEffectTransition");
}

- (id)_coordinatorForUpdatingSelectedItemFromState:(int64_t)a3 toState:(int64_t)a4
{
  int v6;
  int v7;
  char v8;
  SFTransitionCoordinator *v9;
  uint64_t v10;
  SFTransitionCoordinator *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];
  char v16;
  _QWORD v17[5];

  v6 = a4 == 1;
  v7 = a3 == 1;
  v8 = v7 ^ v6;
  if (v7 != v6)
    -[SFCapsuleCollectionView _willBeginBackdropHeightAnimation](self, "_willBeginBackdropHeightAnimation");
  v9 = [SFTransitionCoordinator alloc];
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke;
  v17[3] = &unk_1E21E29B0;
  v17[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_2;
  v15[3] = &unk_1E21E2A98;
  v16 = v8;
  v15[4] = self;
  v15[5] = a3;
  v11 = -[SFTransitionCoordinator initWithAnimations:completion:](v9, "initWithAnimations:completion:", v17, v15);
  -[SFTransitionCoordinator publicCoordinator](v11, "publicCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_3;
  v14[3] = &unk_1E21E29B0;
  v14[4] = self;
  objc_msgSend(v12, "addRetargetableAnimations:", v14);

  return v11;
}

_QWORD *__80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "_updateStateFlagsForContentViewAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
  objc_msgSend(*(id *)(a1 + 32), "_applyToolbarTheme");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  result = *(_QWORD **)(a1 + 32);
  if (result[122] == 2)
    return (_QWORD *)objc_msgSend(result, "reloadInputViews");
  return result;
}

void __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_didEndBackdropHeightAnimation");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 976) != 2)
  {
    v3 = *(void **)(v2 + 528);
    if (v3)
    {
      *(_QWORD *)(v2 + 528) = 0;

      objc_msgSend(*(id *)(a1 + 32), "reloadInputViews");
    }
  }
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 976) != 2)
    {
      objc_msgSend(*(id *)(v4 + 520), "removeFromSuperview");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 520);
      *(_QWORD *)(v5 + 520) = 0;

    }
  }
}

uint64_t __80__SFCapsuleCollectionView__coordinatorForUpdatingSelectedItemFromState_toState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackdropHeight");
}

- (void)_updateBackdropHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SFCapsuleCollectionView _obscuredInsetsIgnoringAnimation](self, "_obscuredInsetsIgnoringAnimation");
  v4 = v3;
  v6 = v5;
  -[UIViewFloatAnimatableProperty value](self->_bottomBackdropHeight, "value");
  if (!_SFEqualWithEpsilon(v6, v7, 0.1))
    -[UIViewFloatAnimatableProperty setValue:](self->_bottomBackdropHeight, "setValue:", v6);
  -[UIViewFloatAnimatableProperty value](self->_topBackdropHeight, "value");
  if (!_SFEqualWithEpsilon(v4, v8, 0.1))
    -[UIViewFloatAnimatableProperty setValue:](self->_topBackdropHeight, "setValue:", v4);
}

- (void)_willBeginBackdropHeightAnimation
{
  int64_t backdropHeightAnimationCount;
  UIViewFloatAnimatableProperty *v4;
  UIViewFloatAnimatableProperty **p_bottomBackdropHeight;
  UIViewFloatAnimatableProperty *bottomBackdropHeight;
  UIViewFloatAnimatableProperty *v7;
  UIViewFloatAnimatableProperty **p_topBackdropHeight;
  UIViewFloatAnimatableProperty *topBackdropHeight;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  UIViewFloatAnimatableProperty *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[9];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  backdropHeightAnimationCount = self->_backdropHeightAnimationCount;
  self->_backdropHeightAnimationCount = backdropHeightAnimationCount + 1;
  if (backdropHeightAnimationCount <= 0)
  {
    v4 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    p_bottomBackdropHeight = &self->_bottomBackdropHeight;
    bottomBackdropHeight = self->_bottomBackdropHeight;
    self->_bottomBackdropHeight = v4;

    v7 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    p_topBackdropHeight = &self->_topBackdropHeight;
    topBackdropHeight = self->_topBackdropHeight;
    self->_topBackdropHeight = v7;

    -[SFCapsuleCollectionView _obscuredInsetsIgnoringAnimation](self, "_obscuredInsetsIgnoringAnimation");
    v11 = v10;
    v13 = v12;
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke;
    v23[3] = &unk_1E21E2AC0;
    v23[4] = self;
    *(double *)&v23[5] = v10;
    v23[6] = v15;
    *(double *)&v23[7] = v12;
    v23[8] = v16;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v23);
    self->_topBackdropHeightPresentationValue = v11;
    -[UIViewFloatAnimatableProperty setValue:](self->_bottomBackdropHeight, "setValue:", v13);
    -[UIViewFloatAnimatableProperty setValue:](self->_topBackdropHeight, "setValue:", self->_topBackdropHeightPresentationValue);
    objc_initWeak(&location, self);
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v18 = *p_topBackdropHeight;
    v24[0] = *p_bottomBackdropHeight;
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke_2;
    v20[3] = &unk_1E21E2AE8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v17, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "frame");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setFrame:", v3, CGRectGetHeight(v7) - *(double *)(a1 + 56), v5);
}

void __60__SFCapsuleCollectionView__willBeginBackdropHeightAnimation__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  double v11;
  id *v12;
  CGRect v13;
  CGRect v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[101];
    if (v3)
    {
      v12 = v2;
      objc_msgSend(v3, "presentationValue");
      v5 = _SFRoundFloatToPixels(v4);
      objc_msgSend(v12, "bounds");
      x = v13.origin.x;
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
      v10 = CGRectGetHeight(v13) - v5;
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      objc_msgSend(v12[67], "setFrame:", 0.0, v10, CGRectGetWidth(v14), v5);
      objc_msgSend(v12[102], "presentationValue");
      *((double *)v12 + 103) = _SFRoundFloatToPixels(v11);
      objc_msgSend(v12, "setNeedsLayout");
      objc_msgSend(v12, "_sendMinimizationDidUpdateToObservers");
      v2 = v12;
    }
  }

}

- (void)_didEndBackdropHeightAnimation
{
  int64_t v2;
  UIViewFloatAnimatableProperty *bottomBackdropHeight;
  UIViewFloatAnimatableProperty *topBackdropHeight;

  v2 = self->_backdropHeightAnimationCount - 1;
  self->_backdropHeightAnimationCount = v2;
  if (!v2)
  {
    -[UIViewFloatAnimatableProperty invalidate](self->_bottomBackdropHeight, "invalidate");
    bottomBackdropHeight = self->_bottomBackdropHeight;
    self->_bottomBackdropHeight = 0;

    -[UIViewFloatAnimatableProperty invalidate](self->_topBackdropHeight, "invalidate");
    topBackdropHeight = self->_topBackdropHeight;
    self->_topBackdropHeight = 0;

    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldDismissContent:(BOOL)a3
{
  -[SFCapsuleCollectionView setShouldDismissContent:withDelay:](self, "setShouldDismissContent:withDelay:", a3, 0.0);
}

- (void)setShouldDismissContent:(BOOL)a3 withDelay:(double)a4
{
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[6];

  if (self->_shouldDismissContent != a3)
  {
    -[SFCapsuleCollectionView layoutIfNeeded](self, "layoutIfNeeded");
    self->_shouldDismissContent = a3;
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke;
    v9[3] = &unk_1E21E2658;
    v9[4] = self;
    *(double *)&v9[5] = a4;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke_2;
    v7[3] = &unk_1E21E2B10;
    v8 = a3;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v9, v7, a4, 0.0);
  }
}

uint64_t __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 864) = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 864) = 0;
  return result;
}

uint64_t __61__SFCapsuleCollectionView_setShouldDismissContent_withDelay___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
  {
    result = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(result + 875))
    {
      if (*(_QWORD *)(result + 976) == 1)
        return objc_msgSend((id)result, "setSelectedItemState:animated:", 0, 0);
    }
  }
  return result;
}

- (BOOL)_contentIsDismissed
{
  int v3;

  v3 = SFEnhancedTabOverviewEnabled();
  if (v3)
    LOBYTE(v3) = self->_shouldDismissContent || self->_offsetForPan.y < -10.0;
  return v3;
}

void __41__SFCapsuleCollectionView__layOutToolbar__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "ss_setUntransformedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "layoutIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 808))
  {
    objc_msgSend(*(id *)(v2 + 536), "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 416);

    if (v3 == v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "ss_setUntransformedFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  }
}

_QWORD *__46__SFCapsuleCollectionView__updateToolbarAlpha__block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setAlpha:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "setAlpha:", *(double *)(a1 + 56));
  result = *(_QWORD **)(a1 + 32);
  if (result[96])
    return (_QWORD *)objc_msgSend(result, "_applyToolbarTheme");
  return result;
}

- (void)setToolbarOffsetForPinchTransition:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_toolbarOffsetForPinchTransition, a3);
    -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAlternateToolbarContentProvider:(id)a3
{
  objc_storeWeak((id *)&self->_alternateToolbarContentProvider, a3);
}

- (void)installAlternateToolbarContentIfNeeded
{
  id WeakRetained;
  UIView *v4;
  UIView *alternateToolbarContentView;
  double v6;
  id v7;
  _QWORD v8[5];

  if (!self->_alternateToolbarContentView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      objc_msgSend(WeakRetained, "toolbarContentViewForCapsuleCollectionView:", self);
      v4 = (UIView *)objc_claimAutoreleasedReturnValue();
      alternateToolbarContentView = self->_alternateToolbarContentView;
      self->_alternateToolbarContentView = v4;

      objc_msgSend(v7, "capsuleCollectionView:heightForToolbarContentView:", self, self->_alternateToolbarContentView);
      self->_alternateToolbarContentHeight = v6;
      -[UIView insertSubview:above:](self->_contentView, "insertSubview:above:", self->_alternateToolbarContentView, self->_toolbarBackdropView);
      -[SFCapsuleCollectionView setNeedsLayout](self, "setNeedsLayout");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__SFCapsuleCollectionView_installAlternateToolbarContentIfNeeded__block_invoke;
      v8[3] = &unk_1E21E2050;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
      WeakRetained = v7;
    }

  }
}

uint64_t __65__SFCapsuleCollectionView_installAlternateToolbarContentIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)relinquishAlternateToolbarContentIfNeeded
{
  UIView *alternateToolbarContentView;
  id WeakRetained;
  _QWORD v5[5];

  if (self->_alternateToolbarContentView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);
    -[UIView setAlpha:](self->_alternateToolbarContentView, "setAlpha:", 1.0);
    -[UIView removeFromSuperview](self->_alternateToolbarContentView, "removeFromSuperview");
    objc_msgSend(WeakRetained, "capsuleCollectionView:relinquishToolbarContentView:", self, self->_alternateToolbarContentView);
    alternateToolbarContentView = self->_alternateToolbarContentView;
    self->_alternateToolbarContentView = 0;

    self->_alternateToolbarContentHeight = 0.0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__SFCapsuleCollectionView_relinquishAlternateToolbarContentIfNeeded__block_invoke;
    v5[3] = &unk_1E21E2050;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);

  }
}

uint64_t __68__SFCapsuleCollectionView_relinquishAlternateToolbarContentIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layOutToolbar");
  return objc_msgSend(*(id *)(a1 + 32), "_updateToolbarAlpha");
}

- (id)toolbarContentViewForCapsuleCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SFCapsuleCollectionViewBorrowedContentView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFCapsuleCollectionView _bottomBackdropFrame](self, "_bottomBackdropFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFCapsuleCollectionView safeAreaInsets](self, "safeAreaInsets");
  v14 = -[SFCapsuleCollectionViewBorrowedContentView initWithFrame:]([SFCapsuleCollectionViewBorrowedContentView alloc], "initWithFrame:", v6, v8, v10, v12 - v13);
  -[SFCapsuleCollectionViewBorrowedContentView setResizesFromOriginalToolbarFrame:](v14, "setResizesFromOriginalToolbarFrame:", objc_msgSend(v4, "layoutStyle") != self->_layoutStyle);
  objc_msgSend(v4, "addSubview:", v14);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_toolbar);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCapsuleCollectionView indexesOfVisibleItems](self, "indexesOfVisibleItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke;
  v35[3] = &unk_1E21E2BB0;
  v35[4] = self;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v35);
  -[SFCapsuleCollectionView layoutIfNeeded](self, "layoutIfNeeded");
  -[SFCapsuleCollectionView _layOutItems:atIndexes:selectedItemIndex:](self, "_layOutItems:atIndexes:selectedItemIndex:", self->_items, v16, self->_selectedItemIndex);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_2;
  v33[3] = &unk_1E21E2BD8;
  v33[4] = self;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v18;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v33);
  objc_msgSend(v18, "safari_mapObjectsUsingBlock:", &__block_literal_global_175);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v19);

  objc_msgSend(v15, "addObjectsFromArray:", v18);
  self->_contentBorrowed = 1;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v15;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v25, "superview", (_QWORD)v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "frame");
        objc_msgSend(v26, "convertRect:toView:", v14);
        objc_msgSend(v25, "setFrame:");

        -[SFCapsuleCollectionViewBorrowedContentView contentView](v14, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubview:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v22);
  }

  return v14;
}

void __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id v4;

  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[134], "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dequeueOrCreateViewForItem:atIndex:", v4, a2);

}

void __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "detachViewForItemAtIndex:forInternalBorrow:", a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __70__SFCapsuleCollectionView_toolbarContentViewForCapsuleCollectionView___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shadowView");
}

- (double)capsuleCollectionView:(id)a3 heightForToolbarContentView:(id)a4
{
  double Height;
  CGRect v7;
  CGRect v8;

  -[UIVisualEffectView frame](self->_toolbarBackdropView, "frame", a3, a4);
  Height = CGRectGetHeight(v7);
  -[UIView _sf_bottomUnsafeAreaFrameForToolbar](self, "_sf_bottomUnsafeAreaFrameForToolbar");
  return Height - CGRectGetHeight(v8);
}

- (void)capsuleCollectionView:(id)a3 relinquishToolbarContentView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  self->_contentBorrowed = 0;
  -[SFCapsuleCollectionView _updateToolbar](self, "_updateToolbar");
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "removeFromSuperview", (_QWORD)v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SFCapsuleCollectionView reattachView:](self, "reattachView:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SFCapsuleCollectionView _layOutItems:atIndexes:selectedItemIndex:](self, "_layOutItems:atIndexes:selectedItemIndex:", self->_items, self->_indexesOfLoadedViews, self->_selectedItemIndex);
}

- (BOOL)_shouldGroupToolbarBackdropWithCapsules
{
  return !-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop");
}

- (void)beginVisualEffectTransition
{
  ++self->_visualEffectTransitionCount;
  -[SFCapsuleCollectionView _updateVisualEffectGroupName](self, "_updateVisualEffectGroupName");
}

- (void)endVisualEffectTransition
{
  --self->_visualEffectTransitionCount;
  -[SFCapsuleCollectionView _updateVisualEffectGroupName](self, "_updateVisualEffectGroupName");
}

- (CGRect)_detachedCapsuleSelectionRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "capsuleIsDetached") & 1) != 0)
  {
    objc_msgSend(v3, "capsuleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_presentationOrSelf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v5, "convertRect:toView:", self);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
    v27.origin.x = v9;
    v27.origin.y = v11;
    v27.size.width = v13;
    v27.size.height = v15;
    v25 = CGRectUnion(v24, v27);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;

  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_passthroughRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[SFCapsuleCollectionView _obscuredInsetsIgnoringAnimation](self, "_obscuredInsetsIgnoringAnimation");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SFCapsuleCollectionView _layoutStyleIsTop](self, "_layoutStyleIsTop"))
  {
    -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
    v4 = fmax(v4, CGRectGetMaxY(v20));
    if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
      v4 = v4 + 5.0;
  }
  else
  {
    -[SFCapsuleCollectionView bounds](self, "bounds");
    Height = CGRectGetHeight(v21);
    -[SFCapsuleCollectionView _selectedCapsuleFrame](self, "_selectedCapsuleFrame");
    v8 = fmax(v8, Height - CGRectGetMinY(v22));
    if (-[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized"))
      v8 = v8 + 5.0;
  }
  -[SFCapsuleCollectionView bounds](self, "bounds");
  v13 = v6 + v12;
  v15 = v4 + v14;
  v17 = v16 - (v6 + v10);
  v19 = v18 - (v8 + v4);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  double y;
  double x;
  id v8;
  int64_t selectedItemState;
  uint64_t v10;
  UIView *toolbar;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  if (self->_itemsAreHidden
    || (-[SFCapsuleCollectionView isHidden](self, "isHidden") & 1) != 0
    || !-[SFCapsuleCollectionView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    goto LABEL_13;
  }
  selectedItemState = self->_selectedItemState;
  switch(selectedItemState)
  {
    case 0:
      toolbar = self->_toolbar;
      -[UIView convertPoint:fromView:](toolbar, "convertPoint:fromView:", self, x, y);
      -[UIView hitTest:withEvent:](toolbar, "hitTest:withEvent:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        -[SFCapsuleCollectionView hitTest:forCapsuleFrameWithEvent:](self, "hitTest:forCapsuleFrameWithEvent:", v8, x, y);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v4 = v14;

      break;
    case 2:
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "capsuleView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v20.x = x;
      v20.y = y;
      v17 = CGRectContainsPoint(v21, v20);

      if (v17)
      {
        v19.receiver = self;
        v19.super_class = (Class)SFCapsuleCollectionView;
        -[SFCapsuleCollectionView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v8, x, y);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
LABEL_13:
      v4 = 0;
      break;
    case 1:
      -[SFCapsuleCollectionView hitTest:forCapsuleFrameWithEvent:](self, "hitTest:forCapsuleFrameWithEvent:", v8, x, y);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v4 = (void *)v10;
      break;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 forCapsuleFrameWithEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SFCapsuleCollectionView *v8;
  SFCapsuleCollectionView *v9;
  SFCapsuleCollectionView *v10;
  SFCapsuleCollectionView *v11;
  SFCapsuleCollectionView *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;
  CGPoint v19;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SFCapsuleCollectionView _detachedCapsuleSelectionRect](self, "_detachedCapsuleSelectionRect");
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v21, v19))
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v8 = (SFCapsuleCollectionView *)objc_claimAutoreleasedReturnValue();
    -[SFCapsuleCollectionView capsuleView](v8, "capsuleView");
    v9 = (SFCapsuleCollectionView *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v10 = v9;

    goto LABEL_15;
  }
  -[SFCapsuleCollectionView _passthroughRect](self, "_passthroughRect");
  v20.x = x;
  v20.y = y;
  if (!CGRectContainsPoint(v22, v20))
  {
    v18.receiver = self;
    v18.super_class = (Class)SFCapsuleCollectionView;
    -[SFCapsuleCollectionView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v11 = (SFCapsuleCollectionView *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v11)
    {
      v12 = v11;
      if (v11 == self)
      {
LABEL_13:
        v9 = v12;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = -[SFCapsuleCollectionView selectedItemIsMinimized](self, "selectedItemIsMinimized");
      v12 = 0;
      if (!self)
        goto LABEL_13;
      v12 = 0;
      if (!v13)
        goto LABEL_13;
    }
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", self->_selectedItemIndex);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "capsuleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SFCapsuleCollectionView isDescendantOfView:](v8, "isDescendantOfView:", v15);

    if (v16)
      v12 = v8;
    else
      v12 = self;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

id __69__SFCapsuleCollectionView__buttonPointerStyleProviderForContentView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  double Height;
  CGFloat v22;
  double x;
  double y;
  double width;
  double v26;
  void *v27;
  double v28;
  void *v29;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v5, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v9, "convertRect:fromView:", v5);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "horizontalPointerPaddingForButton:", v5);
      v19 = v18;
    }
    else
    {
      v19 = *MEMORY[0x1E0C9D538];
    }
    objc_msgSend(v8, "bounds");
    Height = CGRectGetHeight(v31);
    v32.origin.x = v11;
    v32.origin.y = v13;
    v32.size.width = v15;
    v32.size.height = v17;
    v22 = 2.0 - fmax((Height - CGRectGetHeight(v32)) * 0.5, 0.0);
    v33.origin.x = v11;
    v33.origin.y = v13;
    v33.size.width = v15;
    v33.size.height = v17;
    v34 = CGRectInset(v33, 2.0 - v19, v22);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    v26 = v34.size.height;
    v27 = (void *)MEMORY[0x1E0DC3B30];
    objc_msgSend(WeakRetained, "capsuleBackgroundCornerRadius");
    objc_msgSend(v27, "shapeWithRoundedRect:cornerRadius:", x, y, width, v26, v28 + -2.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_animateSwitchingLinkedPageViewToItemAtIndex:(int64_t)a3
{
  void *v5;
  SFTransitionCoordinator *obj;

  obj = objc_alloc_init(SFTransitionCoordinator);
  -[SFCapsuleCollectionViewLinkablePageView animationSettingsForCapsuleSelectionUpdate](self->_linkedPageView, "animationSettingsForCapsuleSelectionUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTransitionCoordinator setSpringAnimationBehavior:](obj, "setSpringAnimationBehavior:", v5);

  objc_storeWeak((id *)&self->_currentTransitionCoordinator, obj);
  -[SFCapsuleCollectionViewLinkablePageView animateSwitchingToItemAtIndex:](self->_linkedPageView, "animateSwitchingToItemAtIndex:", a3);
  objc_storeWeak((id *)&self->_currentTransitionCoordinator, 0);

}

- (double)_scaleFromLinkedPageView
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsNull;
  double result;
  double v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[SFCapsuleCollectionViewLinkablePageView frameForItemLinkedToCapsuleAtIndex:](self->_linkedPageView, "frameForItemLinkedToCapsuleAtIndex:", self->_selectedItemIndex);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  IsNull = CGRectIsNull(v10);
  result = 1.0;
  if (!IsNull)
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v9 = CGRectGetWidth(v11);
    -[SFCapsuleCollectionView bounds](self, "bounds");
    return v9 / CGRectGetWidth(v12);
  }
  return result;
}

- (CGPoint)_offsetForPanFromLinkedPageView
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double MinX;
  double v17;
  double MinY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[SFCapsuleCollectionViewLinkablePageView frameForItemLinkedToCapsuleAtIndex:](self->_linkedPageView, "frameForItemLinkedToCapsuleAtIndex:", self->_selectedItemIndex);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsNull(v30))
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[SFCapsuleCollectionView capsuleFrame](self, "capsuleFrame");
    UIRectGetCenter();
    v28 = v9;
    v26 = v10;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    v11 = v31.origin.x;
    v12 = v31.origin.y;
    v13 = v31.size.width;
    v14 = v31.size.height;
    v27 = v28 / CGRectGetWidth(v31);
    v32.origin.x = v11;
    v32.origin.y = v12;
    v32.size.width = v13;
    v32.size.height = v14;
    v15 = v26 / CGRectGetHeight(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v17 = MinX + CGRectGetWidth(v34) * v27;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MinY = CGRectGetMinY(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v19 = MinY + CGRectGetHeight(v36) * v15;
    -[SFCapsuleCollectionView pageWidth](self, "pageWidth");
    v21 = v20;
    -[SFCapsuleCollectionViewLinkablePageView pageWidth](self->_linkedPageView, "pageWidth");
    v8 = v19 - v26;
    v23 = v21 / v22;
    -[SFCapsuleCollectionView bounds](self, "bounds");
    v24 = CGRectGetHeight(v37);
    v7 = (v17 - v28) * _SFInterpolate(v23, 1.0, fmax(fmin(fabs(v8 / (v24 * 0.25)), 1.0), 0.0));
  }
  v25 = v8;
  result.y = v25;
  result.x = v7;
  return result;
}

- (SFCapsuleCollectionViewDataSource)dataSource
{
  return (SFCapsuleCollectionViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFBarTheme)minimizedTheme
{
  return self->_minimizedTheme;
}

- (double)focusedCapsuleTopOffset
{
  return self->_focusedCapsuleTopOffset;
}

- (BOOL)keepsCapsulesAboveKeyboard
{
  return self->_keepsCapsulesAboveKeyboard;
}

- (BOOL)ignoresKeyboardHideEvents
{
  return self->_ignoresKeyboardHideEvents;
}

- (double)capsuleWidth
{
  return self->_capsuleWidth;
}

- (double)inactiveCapsuleAlpha
{
  return self->_inactiveCapsuleAlpha;
}

- (int64_t)selectionGestureLimit
{
  return self->_selectionGestureLimit;
}

- (BOOL)itemsAreHidden
{
  return self->_itemsAreHidden;
}

- (BOOL)shouldDismissContent
{
  return self->_shouldDismissContent;
}

- (BOOL)selectedItemUsesLiftedPreviewAppearance
{
  return self->_selectedItemUsesLiftedPreviewAppearance;
}

- (BOOL)isForceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (BOOL)alwaysShowTopBackdrop
{
  return self->_alwaysShowTopBackdrop;
}

- (void)setAlwaysShowTopBackdrop:(BOOL)a3
{
  self->_alwaysShowTopBackdrop = a3;
}

- (double)selectionThreshold
{
  return self->_selectionThreshold;
}

- (BOOL)usesFastDeceleration
{
  return self->_usesFastDeceleration;
}

- (BOOL)suppressesSelectedItemUnfocus
{
  return self->_suppressesSelectedItemUnfocus;
}

- (void)setSuppressesSelectedItemUnfocus:(BOOL)a3
{
  self->_suppressesSelectedItemUnfocus = a3;
}

- (UIView)toolbar
{
  return self->_toolbar;
}

- (NSNumber)toolbarOffsetForPinchTransition
{
  return self->_toolbarOffsetForPinchTransition;
}

- (SFCapsuleCollectionViewToolbarContentProviding)alternateToolbarContentProvider
{
  return (SFCapsuleCollectionViewToolbarContentProviding *)objc_loadWeakRetained((id *)&self->_alternateToolbarContentProvider);
}

- (BOOL)isShowingAlternateToolbarContent
{
  return self->_showingAlternateToolbarContent;
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (BOOL)showingLockdownStatusBar
{
  return self->_showingLockdownStatusBar;
}

- (SFCapsuleCollectionViewLinkablePageView)linkedPageView
{
  return self->_linkedPageView;
}

- (void)setLinkedPageView:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPageView, a3);
}

- (NSIndexSet)_indexesOfLoadedViews
{
  return self->_indexesOfLoadedViews;
}

- (double)_keyboardHeight
{
  return self->_keyboardHeight;
}

- (double)_offsetForMinimization
{
  return self->_offsetForMinimization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_indexesOfLoadedViews, 0);
  objc_storeStrong((id *)&self->_linkedPageView, 0);
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_destroyWeak((id *)&self->_alternateToolbarContentProvider);
  objc_storeStrong((id *)&self->_toolbarOffsetForPinchTransition, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_minimizedTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_nextSelectedItemIndexAfterPan, 0);
  objc_storeStrong((id *)&self->_blurSpringBehavior, 0);
  objc_storeStrong((id *)&self->_topBackdropHeight, 0);
  objc_storeStrong((id *)&self->_bottomBackdropHeight, 0);
  objc_storeStrong((id *)&self->_alternateToolbarContentView, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_destroyWeak((id *)&self->_currentTransitionCoordinator);
  objc_storeStrong((id *)&self->_gestureObservers, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_selectedItemAccessoryViews, 0);
  objc_storeStrong((id *)&self->_toolbarBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_keyboardBackdropView, 0);
  objc_storeStrong((id *)&self->_topAction, 0);
  objc_storeStrong((id *)&self->_trailingAction, 0);
  objc_storeStrong((id *)&self->_toolbarTheme, 0);
  objc_storeStrong((id *)&self->_effectiveMinimizedTheme, 0);
  objc_storeStrong((id *)&self->_effectiveTheme, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_reusableContentViewIdentifier, 0);
  objc_storeStrong((id *)&self->_reuseableContentView, 0);
  objc_storeStrong((id *)&self->_contentViewRegistrations, 0);
  objc_storeStrong((id *)&self->_viewsForReuse, 0);
  objc_destroyWeak((id *)&self->_timerToDiscardViewsForReuse);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_indexesOfVisibleItemsWithSelectedItemIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18B7B2000, v3, v4, "Selecting item at index %zd in array of %lu items", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_didReceivePan:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18B7B2000, v3, v4, "Next selected item index after pan %zd is beyond bounds of array of %lu items", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
