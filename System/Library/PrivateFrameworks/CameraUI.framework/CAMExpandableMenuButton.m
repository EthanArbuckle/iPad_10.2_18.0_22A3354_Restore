@implementation CAMExpandableMenuButton

- (CAMExpandableMenuButton)initWithLayoutStyle:(int64_t)a3
{
  CAMExpandableMenuButton *v4;
  NSMutableArray *v5;
  NSMutableArray *menuItems;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *highlightedIndexesWhileCollapsed;
  void *v9;
  CAMTouchingGestureRecognizer *v10;
  CAMTouchingGestureRecognizer *touchingGestureRecognizer;
  CAMExpandableMenuButton *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMExpandableMenuButton;
  v4 = -[CAMExpandableMenuButton initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    menuItems = v4->__menuItems;
    v4->__menuItems = v5;

    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4->_orientation = 1;
    v4->_layoutStyle = a3;
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    highlightedIndexesWhileCollapsed = v4->__highlightedIndexesWhileCollapsed;
    v4->__highlightedIndexesWhileCollapsed = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandableMenuButton setTintColor:](v4, "setTintColor:", v9);

    -[CAMExpandableMenuButton _updateFromExpansionChangeAnimated:](v4, "_updateFromExpansionChangeAnimated:", 0);
    -[CAMExpandableMenuButton _updateFromOrientationChangeAnimated:](v4, "_updateFromOrientationChangeAnimated:", 0);
    v10 = -[CAMTouchingGestureRecognizer initWithTarget:action:]([CAMTouchingGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleTouchGesture_);
    touchingGestureRecognizer = v4->_touchingGestureRecognizer;
    v4->_touchingGestureRecognizer = v10;

    -[CAMExpandableMenuButton addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_touchingGestureRecognizer);
    v12 = v4;
  }

  return v4;
}

- (void)_updateFromExpansionChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];

  v3 = a3;
  -[CAMExpandableMenuButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke;
  aBlock[3] = &unk_1EA328868;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "expansionDuration");
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke_2;
    v11[3] = &unk_1EA328F80;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0, v9, 0.0);

  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

}

uint64_t __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyHeaderViewForCurrentExpansionState");
  objc_msgSend(*(id *)(a1 + 32), "_applyMenuItemColorsForCurrentState");
  return objc_msgSend(*(id *)(a1 + 32), "_applyMenuItemAlphaForCurrentExpansionState");
}

- (void)_applyHeaderViewForCurrentExpansionState
{
  void *v3;

  -[CAMExpandableMenuButton _headerView](self, "_headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CAMExpandableMenuButton prepareHeaderViewForExpanding:](self, "prepareHeaderViewForExpanding:", -[CAMExpandableMenuButton isExpanded](self, "isExpanded"));
}

- (UIView)_headerView
{
  return self->__headerView;
}

- (void)_applyMenuItemColorsForCurrentState
{
  _BOOL4 v3;
  NSMutableArray *menuItems;
  char isKindOfClass;
  UIView *headerView;
  void *v7;
  UIView *v8;
  void *v9;
  uint64_t v10;
  char v11;
  UIView *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  if (-[NSMutableArray count](self->__menuItems, "count"))
  {
    v3 = -[CAMExpandableMenuButton isExpanded](self, "isExpanded");
    menuItems = self->__menuItems;
    if (v3)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke;
      v14[3] = &unk_1EA32DE58;
      v14[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](menuItems, "enumerateObjectsUsingBlock:", v14);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      headerView = self->__headerView;
      v7 = (void *)MEMORY[0x1E0DC3658];
      if ((isKindOfClass & 1) != 0)
      {
        v8 = headerView;
        objc_msgSend(v7, "whiteColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setTextColor:](v8, "setTextColor:", v9);

LABEL_11:
        return;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = headerView;
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke_2;
      v13[3] = &unk_1EA32DE58;
      v13[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](menuItems, "enumerateObjectsUsingBlock:", v13);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableIndexSet containsIndex:](self->__highlightedIndexesWhileCollapsed, "containsIndex:", self->_selectedIndex))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();
      v12 = self->__headerView;
      if ((v11 & 1) != 0)
      {
        -[UIView setTextColor:](v12, "setTextColor:", v9);
        goto LABEL_11;
      }
    }
    -[UIView setTintColor:](v12, "setTintColor:", v9);
    goto LABEL_11;
  }
}

- (void)_applyMenuItemAlphaForCurrentExpansionState
{
  double v3;
  NSMutableArray *menuItems;
  double v5;
  _QWORD v6[7];

  if (-[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
    v3 = 1.0;
  else
    v3 = 0.0;
  menuItems = self->__menuItems;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CAMExpandableMenuButton__applyMenuItemAlphaForCurrentExpansionState__block_invoke;
  v6[3] = &unk_1EA32DE80;
  v6[4] = self;
  v6[5] = 0x3FF0000000000000;
  *(double *)&v6[6] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](menuItems, "enumerateObjectsUsingBlock:", v6);
  if (-[CAMExpandableMenuButton _wantsHeaderViewToBeVisible](self, "_wantsHeaderViewToBeVisible"))
    v5 = 1.0;
  else
    v5 = 0.0;
  -[UIView setAlpha:](self->__headerView, "setAlpha:", v5);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)_wantsHeaderViewToBeVisible
{
  BOOL v3;
  BOOL v4;

  v3 = -[CAMExpandableMenuButton isExpanded](self, "isExpanded");
  v4 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
  return -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle") != 1 || v3 || !v4;
}

- (BOOL)wantsSelectedItemToBeVisible
{
  int64_t v3;
  void *v4;

  v3 = -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex");
  -[CAMExpandableMenuButton _shownIndexesWhileCollapsed](self, "_shownIndexesWhileCollapsed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsIndex:", v3);

  return v3;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSIndexSet)_shownIndexesWhileCollapsed
{
  return self->__shownIndexesWhileCollapsed;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_updateFromOrientationChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  CAMExpandableMenuButton *v24;

  v3 = a3;
  if ((-[CAMExpandableMenuButton isHidden](self, "isHidden") & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    -[CAMExpandableMenuButton alpha](self, "alpha");
    v6 = 0;
    v5 = 0;
    if (v3 && v7 != 0.0)
    {
      -[CAMExpandableMenuButton snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke;
      v22[3] = &unk_1EA328A40;
      v6 = v8;
      v23 = v6;
      v24 = self;
      objc_msgSend(v9, "performWithoutAnimation:", v22);

      v5 = 1;
    }
  }
  -[CAMExpandableMenuButton shownIndexesWhileCollapsed](self, "shownIndexesWhileCollapsed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", self, self->_orientation, v5);
  -[CAMExpandableMenuButton _applyMenuItemTextAlignmentAndShadowForCurrentOrientation](self, "_applyMenuItemTextAlignmentAndShadowForCurrentOrientation");
  if (-[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
    objc_msgSend(WeakRetained, "collapseMenuButton:animated:", self, 0);

  }
  if (v11)
    -[CAMExpandableMenuButton _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
  -[CAMExpandableMenuButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if ((v5 & v11) == 1)
  {
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_2;
    v21[3] = &unk_1EA328868;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v21);
    -[CAMExpandableMenuButton superview](self, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v6);

    v15 = (void *)MEMORY[0x1E0DC3F10];
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_3;
    v19[3] = &unk_1EA328868;
    v20 = v6;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_4;
    v17[3] = &unk_1EA328A68;
    v18 = v20;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 2, v19, v17, 0.2, 0.0);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_5;
    v16[3] = &unk_1EA328868;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v16, 0, 0.5, 0.0);

  }
}

- (id)shownIndexesWhileCollapsed
{
  return 0;
}

- (void)_applyMenuItemTextAlignmentAndShadowForCurrentOrientation
{
  unint64_t v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self->_orientation - 3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->__menuItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setTextAlignment:", v2 < 2, (_QWORD)v9);
        objc_msgSend(v8, "setWantsLegibilityShadow:", v2 < 2);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)reloadData
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CAMButtonLabel *v11;
  void *v12;
  UIView *v13;
  UIView *headerView;
  UIImageView *padBackgroundView;
  NSIndexSet *v16;
  NSIndexSet *shownIndexesWhileCollapsed;
  uint64_t v18;
  unint64_t selectedIndex;
  int64_t v20;

  v3 = -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle");
  -[NSMutableArray makeObjectsPerformSelector:](self->__menuItems, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->__menuItems, "removeAllObjects");
  v4 = -[CAMExpandableMenuButton numberOfMenuItems](self, "numberOfMenuItems");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v11 = -[CAMButtonLabel initWithFrame:]([CAMButtonLabel alloc], "initWithFrame:", v7, v8, v9, v10);
      -[CAMExpandableMenuButton titleForMenuItemAtIndex:](self, "titleForMenuItemAtIndex:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMButtonLabel setText:](v11, "setText:", v12);
      -[NSMutableArray addObject:](self->__menuItems, "addObject:", v11);
      -[CAMExpandableMenuButton addSubview:](self, "addSubview:", v11);

      ++v6;
    }
    while (v5 != v6);
  }
  -[UIView removeFromSuperview](self->__headerView, "removeFromSuperview");
  -[CAMExpandableMenuButton headerView](self, "headerView");
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  headerView = self->__headerView;
  self->__headerView = v13;

  -[CAMExpandableMenuButton addSubview:](self, "addSubview:", self->__headerView);
  -[UIImageView removeFromSuperview](self->__padBackgroundView, "removeFromSuperview");
  padBackgroundView = self->__padBackgroundView;
  self->__padBackgroundView = 0;

  if (v3 == 1)
    -[CAMExpandableMenuButton _createPadBackgroundView](self, "_createPadBackgroundView");
  -[CAMExpandableMenuButton shownIndexesWhileCollapsed](self, "shownIndexesWhileCollapsed");
  v16 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  shownIndexesWhileCollapsed = self->__shownIndexesWhileCollapsed;
  self->__shownIndexesWhileCollapsed = v16;

  v18 = -[NSMutableArray count](self->__menuItems, "count");
  selectedIndex = self->_selectedIndex;
  if (selectedIndex > -[NSMutableArray count](self->__menuItems, "count") - 1)
  {
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18 > 0)
      v20 = 0;
    self->_selectedIndex = v20;
  }
  -[CAMExpandableMenuButton _applyMenuItemColorsForCurrentState](self, "_applyMenuItemColorsForCurrentState");
  -[CAMExpandableMenuButton _applyMenuItemAlphaForCurrentExpansionState](self, "_applyMenuItemAlphaForCurrentExpansionState");
  -[CAMExpandableMenuButton _applyMenuItemTextAlignmentAndShadowForCurrentOrientation](self, "_applyMenuItemTextAlignmentAndShadowForCurrentOrientation");
  -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
}

void __70__CAMExpandableMenuButton__applyMenuItemAlphaForCurrentExpansionState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;
  int v7;
  double *v8;
  id v9;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  v9 = v5;
  if (v6[60] == a3 && (v7 = objc_msgSend(v6, "wantsSelectedItemToBeVisible"), v5 = v9, v7))
    v8 = (double *)(a1 + 40);
  else
    v8 = (double *)(a1 + 48);
  objc_msgSend(v5, "setAlpha:", *v8);

}

- (void)setHighlighted:(BOOL)a3 forIndex:(int64_t)a4
{
  NSMutableIndexSet *highlightedIndexesWhileCollapsed;

  highlightedIndexesWhileCollapsed = self->__highlightedIndexesWhileCollapsed;
  if (a3)
    -[NSMutableIndexSet addIndex:](highlightedIndexesWhileCollapsed, "addIndex:", a4);
  else
    -[NSMutableIndexSet removeIndex:](highlightedIndexesWhileCollapsed, "removeIndex:", a4);
  -[CAMExpandableMenuButton _applyMenuItemColorsForCurrentState](self, "_applyMenuItemColorsForCurrentState");
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[CAMExpandableMenuButton _updateFromSelectedIndexChange](self, "_updateFromSelectedIndexChange");
  }
}

- (void)_updateFromSelectedIndexChange
{
  -[CAMExpandableMenuButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
  -[CAMExpandableMenuButton _applyMenuItemColorsForCurrentState](self, "_applyMenuItemColorsForCurrentState");
  -[CAMExpandableMenuButton _applyMenuItemAlphaForCurrentExpansionState](self, "_applyMenuItemAlphaForCurrentExpansionState");
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpandableMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_expandableMenuDelegate, a3);
}

- (void)collapseMenuAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  objc_msgSend(WeakRetained, "collapseMenuButton:animated:", self, v3);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMExpandableMenuButton _updateFromOrientationChangeAnimated:](self, "_updateFromOrientationChangeAnimated:", a4);
  }
}

- (CGSize)intrinsicContentSizeForExpansion:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CAMExpandableMenuButton _layoutMenuButton:expanded:](self, "_layoutMenuButton:expanded:", 0, a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutMenuButton:(BOOL)a3 expanded:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a4;
  v5 = a3;
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  switch(-[CAMExpandableMenuButton layoutStyle](self, "layoutStyle"))
  {
    case 0:
    case 2:
    case 4:
      -[CAMExpandableMenuButton _layoutForPhoneStyle:expanded:](self, "_layoutForPhoneStyle:expanded:", v5, v4);
      goto LABEL_4;
    case 1:
      -[CAMExpandableMenuButton _layoutForPadStyle:expanded:](self, "_layoutForPadStyle:expanded:", v5, v4);
LABEL_4:
      v7 = v9;
      v8 = v10;
      break;
    default:
      break;
  }
  v11 = v7;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_layoutForPhoneStyle:(BOOL)a3 expanded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  unint64_t v7;
  char v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a4;
  v5 = a3;
  v7 = -[CAMExpandableMenuButton orientation](self, "orientation") - 3;
  v8 = !v4;
  if (!v4 || v7 > 1)
  {
    if (v7 < 2)
      v8 = 1;
    if ((v8 & 1) != 0)
    {
      if (v4 || v7 > 1)
      {
        v9 = *MEMORY[0x1E0C9D820];
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (!v4 && v7 >= 2)
          -[CAMExpandableMenuButton _layoutForPhoneCollapsedPortraitButton:](self, "_layoutForPhoneCollapsedPortraitButton:", v5, v9, v10);
      }
      else
      {
        -[CAMExpandableMenuButton _layoutForPhoneCollapsedLandscapeButton:](self, "_layoutForPhoneCollapsedLandscapeButton:", v5);
      }
    }
    else
    {
      -[CAMExpandableMenuButton _layoutForPhoneExpandedPortraitButton:](self, "_layoutForPhoneExpandedPortraitButton:", v5);
    }
  }
  else
  {
    -[CAMExpandableMenuButton _layoutForPhoneExpandedLandscapeButton:](self, "_layoutForPhoneExpandedLandscapeButton:", v5);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGSize)_layoutForPhoneCollapsedPortraitButton:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSMutableArray *menuItems;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MaxX;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double MinX;
  double Height;
  double v43;
  double Width;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  CGRect rect;
  void *v56;
  _QWORD *v57;
  _QWORD v58[4];
  CGSize result;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v3 = a3;
  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
  -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
  v53 = 0;
  UIRectCenteredIntegralRectScale();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (v13)
  {
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    rect.origin.x = CGRectGetMinX(v60) + 0.0;
    if (v3)
    {
      -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frameForAlignmentRect:", rect.origin.x, v16, v18, v20);
      CAMViewSetBoundsAndCenterForFrame(v21, v22, v23, v24, v25);

    }
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    menuItems = self->__menuItems;
    v58[3] = 0;
    *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __66__CAMExpandableMenuButton__layoutForPhoneCollapsedPortraitButton___block_invoke;
    v56 = &unk_1EA32DE30;
    v57 = v58;
    -[NSMutableArray enumerateObjectsUsingBlock:](menuItems, "enumerateObjectsUsingBlock:", &rect.origin.y, v53);
    -[CAMExpandableMenuButton _selectedLabel](self, "_selectedLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    v54 = v28;
    v30 = v29;
    v32 = v31;
    v61.origin.x = rect.origin.x;
    v61.origin.y = v16;
    v61.size.width = v18;
    v61.size.height = v20;
    MaxX = CGRectGetMaxX(v61);
    -[CAMExpandableMenuButton collapsedSelectedLabelHorizontalMargin](self, "collapsedSelectedLabelHorizontalMargin", 0);
    v35 = MaxX + v34;
    if (v3)
    {
      objc_msgSend(v27, "frameForAlignmentRect:", MaxX + v34, v54, v30, v32);
      CAMViewSetBoundsAndCenterForFrame(v27, v36, v37, v38, v39);
    }
    v62.origin.x = v35;
    v62.origin.y = v54;
    v62.size.width = v30;
    v62.size.height = v32;
    v40 = CGRectGetMaxX(v62);
    v63.origin.x = rect.origin.x;
    v63.origin.y = v16;
    v63.size.width = v18;
    v63.size.height = v20;
    MinX = CGRectGetMinX(v63);
    v64.origin.x = rect.origin.x;
    v64.origin.y = v16;
    v64.size.width = v18;
    v64.size.height = v20;
    Height = CGRectGetHeight(v64);
    v65.origin.x = v35;
    v65.origin.y = v54;
    v65.size.width = v30;
    v65.size.height = v32;
    v43 = CGRectGetHeight(v65);
    Width = v40 - MinX;
    if (Height < v43)
      Height = v43;

    _Block_object_dispose(v58, 8);
  }
  else
  {
    v45 = v14;
    if (v3)
    {
      -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "frameForAlignmentRect:", v45, v16, v18, v20);
      CAMViewSetBoundsAndCenterForFrame(v46, v47, v48, v49, v50);

    }
    v66.origin.x = v45;
    v66.origin.y = v16;
    v66.size.width = v18;
    v66.size.height = v20;
    Width = CGRectGetWidth(v66);
    v67.origin.x = v45;
    v67.origin.y = v16;
    v67.size.width = v18;
    v67.size.height = v20;
    Height = CGRectGetHeight(v67);
  }
  v51 = Width;
  v52 = Height;
  result.height = v52;
  result.width = v51;
  return result;
}

- (CGRect)alignmentRectForFrame:(CGRect)a3 expanded:(BOOL)a4
{
  UIEdgeInsets *p_tappableEdgeInsets;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a4)
    p_tappableEdgeInsets = (UIEdgeInsets *)MEMORY[0x1E0DC49E8];
  else
    p_tappableEdgeInsets = &self->_tappableEdgeInsets;
  left = p_tappableEdgeInsets->left;
  v6 = a3.origin.x + left;
  v7 = a3.origin.y + p_tappableEdgeInsets->top;
  v8 = a3.size.width - (p_tappableEdgeInsets->right + left);
  v9 = a3.size.height - (p_tappableEdgeInsets->bottom + p_tappableEdgeInsets->top);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)frameForAlignmentRect:(CGRect)a3 expanded:(BOOL)a4
{
  UIEdgeInsets *p_tappableEdgeInsets;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a4)
    p_tappableEdgeInsets = (UIEdgeInsets *)MEMORY[0x1E0DC49E8];
  else
    p_tappableEdgeInsets = &self->_tappableEdgeInsets;
  left = p_tappableEdgeInsets->left;
  v6 = a3.origin.x - left;
  v7 = a3.origin.y - p_tappableEdgeInsets->top;
  v8 = a3.size.width - (-p_tappableEdgeInsets->right - left);
  v9 = a3.size.height - (-p_tappableEdgeInsets->bottom - p_tappableEdgeInsets->top);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMExpandableMenuButton;
  -[CAMExpandableMenuButton layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMExpandableMenuButton _layoutMenuButton:expanded:](self, "_layoutMenuButton:expanded:", 1, -[CAMExpandableMenuButton isExpanded](self, "isExpanded"));
}

- (CAMExpandableMenuButton)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMExpandableMenuButton initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMExpandableMenuButton)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMExpandableMenuButton initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CAMExpandableMenuButton intrinsicContentSizeForExpansion:](self, "intrinsicContentSizeForExpansion:", self->_expanded);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)collapsedSelectedLabelHorizontalMargin
{
  return 6.0;
}

uint64_t __66__CAMExpandableMenuButton__layoutForPhoneCollapsedPortraitButton___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "intrinsicContentSize");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (CGSize)_layoutForPhoneCollapsedLandscapeButton:(BOOL)a3
{
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
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
  CGFloat Height;
  double y;
  double v30;
  void *v31;
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
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat Width;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if (-[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible"))
  {
    -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    v75 = v5;
    v7 = v6;
    v9 = v8;
    v78 = v10;
    -[CAMExpandableMenuButton _selectedLabel](self, "_selectedLabel", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v84.origin.x = v7;
    v84.origin.y = v75;
    v84.size.width = v9;
    v84.size.height = v78;
    v92.origin.y = CGRectGetMaxY(v84) + 2.0;
    v85.origin.x = v7;
    v85.origin.y = v75;
    v85.size.width = v9;
    v85.size.height = v78;
    v69 = v13;
    v70 = v15;
    v92.origin.x = v13;
    v92.size.width = v15;
    v92.size.height = v17;
    v18 = v7;
    v19 = v9;
    CGRectUnion(v85, v92);
    UIRectCenteredIntegralRectScale();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v86.origin.x = v18;
    v86.origin.y = v75;
    v86.size.height = v78;
    v86.size.width = v9;
    Height = CGRectGetHeight(v86);
    v87.origin.x = v21;
    v87.origin.y = v23;
    v87.size.width = v25;
    v87.size.height = v27;
    CGRectDivide(v87, &slice, &remainder, Height, CGRectMinYEdge);
    y = slice.origin.y;
    v30 = slice.size.height;
    if (a3)
    {
      v76 = remainder.origin.y;
      v79 = remainder.size.height;
      -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frameForAlignmentRect:", v18, y, v19, v30);
      v71 = v33;
      v72 = v32;
      v67 = v35;
      v68 = v34;
      objc_msgSend(v11, "frameForAlignmentRect:", v69, v76, v70, v79);
      v73 = v27;
      v74 = v25;
      v36 = v19;
      v38 = v37;
      v39 = v18;
      v41 = v40;
      v77 = v23;
      v80 = v21;
      v43 = v42;
      v45 = v44;
      CAMViewSetBoundsAndCenterForFrame(v31, v72, v71, v68, v67);
      v46 = v38;
      v19 = v36;
      v47 = v41;
      v18 = v39;
      v27 = v73;
      v25 = v74;
      v48 = v43;
      v49 = v45;
      v23 = v77;
      v21 = v80;
      CAMViewSetBoundsAndCenterForFrame(v11, v46, v47, v48, v49);

    }
    v88.origin.x = v21;
    v88.origin.y = v23;
    v88.size.width = v25;
    v88.size.height = v27;
    v50 = CGRectGetHeight(v88);
    v89.origin.x = v18;
    v89.origin.y = y;
    v89.size.width = v19;
    v89.size.height = v30;
    Width = CGRectGetWidth(v89);

  }
  else
  {
    -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    if (a3)
    {
      -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frameForAlignmentRect:", v53, v55, v57, v59);
      CAMViewSetBoundsAndCenterForFrame(v60, v61, v62, v63, v64);

    }
    v90.origin.x = v53;
    v90.origin.y = v55;
    v90.size.width = v57;
    v90.size.height = v59;
    v50 = CGRectGetHeight(v90);
    v91.origin.x = v53;
    v91.origin.y = v55;
    v91.size.width = v57;
    v91.size.height = v59;
    Width = CGRectGetWidth(v91);
  }
  v65 = v50;
  v66 = Width;
  result.height = v66;
  result.width = v65;
  return result;
}

- (CGSize)_layoutForPhoneExpandedPortraitButton:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  uint64_t i;
  UIView *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  BOOL v26;
  _BOOL4 v27;
  BOOL v28;
  BOOL v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  id obj;
  CGFloat v37;
  CGFloat v38;
  _QWORD aBlock[9];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  _QWORD v45[4];
  _BYTE v46[128];
  uint64_t v47;
  CGSize result;
  CGRect v49;
  CGRect v50;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "addObject:", self->__headerView);
  objc_msgSend(v13, "addObjectsFromArray:", self->__menuItems);
  v37 = v12;
  v49.origin.x = v6;
  v49.origin.y = v8;
  v38 = v10;
  v49.size.width = v10;
  v49.size.height = v12;
  CGRectGetWidth(v49);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke;
  v44[3] = &unk_1EA32DE30;
  v44[4] = v45;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v44);
  objc_msgSend(v13, "count");
  UIRoundToViewScale();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v14)
  {
    v15 = 0;
    v16 = *(_QWORD *)v41;
    v17 = 11.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(obj);
        v19 = *(UIView **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[UIView intrinsicContentSize](v19, "intrinsicContentSize", v35);
        v35 = 0;
        UIRectCenteredIntegralRectScale();
        v21 = v20;
        v23 = v22;
        v25 = v24;
        if (v3)
        {
          v26 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible", 0);
          v27 = self->_selectedIndex != v15;
          v28 = self->__headerView == v19;
          if (self->__headerView == v19)
            v27 = 1;
          aBlock[0] = MEMORY[0x1E0C809B0];
          if (v27)
            v29 = v28;
          else
            v29 = v26;
          aBlock[1] = 3221225472;
          aBlock[2] = __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke_2;
          aBlock[3] = &unk_1EA328D90;
          aBlock[4] = v19;
          *(CGFloat *)&aBlock[5] = v17;
          *(CGFloat *)&aBlock[6] = v21;
          *(CGFloat *)&aBlock[7] = v23;
          *(CGFloat *)&aBlock[8] = v25;
          v30 = _Block_copy(aBlock);
          v31 = v30;
          if (v29)
            (*((void (**)(void *))v30 + 2))(v30);
          else
            objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v30);

        }
        v50.origin.x = v17;
        v50.origin.y = v21;
        v50.size.width = v23;
        v50.size.height = v25;
        CGRectGetWidth(v50);
        UIRoundToViewScale();
        v17 = v32;
        v15 += -[NSMutableArray containsObject:](self->__menuItems, "containsObject:", v19);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v14);
  }

  _Block_object_dispose(v45, 8);
  v34 = v37;
  v33 = v38;
  result.height = v34;
  result.width = v33;
  return result;
}

double __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "intrinsicContentSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "frameForAlignmentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CAMViewSetBoundsAndCenterForFrame(*(void **)(a1 + 32), v2, v3, v4, v5);
}

- (CGSize)_layoutForPhoneExpandedLandscapeButton:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  int64_t v10;
  id v11;
  id WeakRetained;
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
  _BOOL4 v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  UIView *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  BOOL v49;
  _BOOL4 v50;
  BOOL v51;
  BOOL v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  double MaxX;
  double v60;
  CGFloat v61;
  uint64_t v62;
  CGFloat v63;
  double obja;
  id obj;
  CGFloat v66;
  CGFloat v67;
  CGFloat rect;
  _QWORD aBlock[9];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;
  CGSize result;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v3 = a3;
  v80 = *MEMORY[0x1E0C80C00];
  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 1);
  v66 = v6;
  v67 = v5;
  v8 = v7;
  rect = v9;
  v10 = -[CAMExpandableMenuButton orientation](self, "orientation");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "addObjectsFromArray:", self->__menuItems);
  WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  objc_msgSend(WeakRetained, "collapsedFrameForMenuButton:", self);
  v14 = v13;
  v16 = v15;

  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
  -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
  v57 = 0;
  UIRectCenteredIntegralRectScale();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = v3;
  if (v3)
  {
    -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frameForAlignmentRect:", v20, v18, v24, v22);
    v31 = v30;
    if (v10 == 4)
    {
      obja = v27;
      v82.origin.y = v66;
      v82.origin.x = v67;
      v61 = v29;
      v63 = v28;
      v82.size.width = v8;
      v82.size.height = rect;
      MaxX = CGRectGetMaxX(v82);
      v83.origin.x = v31;
      v83.origin.y = obja;
      v83.size.height = v61;
      v83.size.width = v63;
      v32 = CGRectGetMaxX(v83);
      v29 = v61;
      v28 = v63;
      v27 = obja;
      v31 = MaxX - v32;
    }
    CAMViewSetBoundsAndCenterForFrame(v26, v31, v27, v28, v29);

  }
  v84.origin.x = v20;
  v84.origin.y = v18;
  v84.size.width = v24;
  v84.size.height = v22;
  v33 = CGRectGetMaxX(v84);
  v85.origin.y = v66;
  v85.origin.x = v67;
  v85.size.width = v8;
  v85.size.height = rect;
  CGRectGetWidth(v85);
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke;
  v74[3] = &unk_1EA32DE30;
  v74[4] = &v75;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v74);
  v62 = objc_msgSend(v11, "count");
  UIRoundToViewScale();
  v35 = v34;
  v60 = v76[3];
  if (v10 == 4)
  {
    v86.origin.y = v66;
    v86.origin.x = v67;
    v86.size.width = v8;
    v86.size.height = rect;
    v36 = CGRectGetMaxX(v86) - v33 - v35;
  }
  else
  {
    v36 = v33 + v34;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v11;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v37)
  {
    v38 = 0;
    v39 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v71 != v39)
          objc_enumerationMutation(obj);
        v41 = *(UIView **)(*((_QWORD *)&v70 + 1) + 8 * i);
        -[UIView intrinsicContentSize](v41, "intrinsicContentSize", v57);
        v58 = 0;
        UIRectCenteredIntegralRectScale();
        v46 = v43;
        v47 = v44;
        v48 = v45;
        if (v10 == 4)
          v36 = v36 - CGRectGetWidth(*(CGRect *)&v42);
        if (v25)
        {
          v49 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible", 0);
          v50 = self->_selectedIndex != v38;
          v51 = self->__headerView == v41;
          if (self->__headerView == v41)
            v50 = 1;
          aBlock[0] = MEMORY[0x1E0C809B0];
          if (v50)
            v52 = v51;
          else
            v52 = v49;
          aBlock[1] = 3221225472;
          aBlock[2] = __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke_2;
          aBlock[3] = &unk_1EA328D90;
          aBlock[4] = v41;
          *(double *)&aBlock[5] = v36;
          *(CGFloat *)&aBlock[6] = v46;
          *(CGFloat *)&aBlock[7] = v47;
          *(CGFloat *)&aBlock[8] = v48;
          v53 = _Block_copy(aBlock);
          v54 = v53;
          if (v52)
            (*((void (**)(void *))v53 + 2))(v53);
          else
            objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v53);

        }
        if (v10 == 4)
        {
          v36 = v36 - v35;
        }
        else
        {
          v87.origin.x = v36;
          v87.origin.y = v46;
          v87.size.width = v47;
          v87.size.height = v48;
          v36 = v36 + v35 + CGRectGetWidth(v87);
        }
        v38 += -[NSMutableArray containsObject:](self->__menuItems, "containsObject:", v41, v58);
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    }
    while (v37);
  }

  _Block_object_dispose(&v75, 8);
  v55 = v60 + v35 * (double)(v62 - 1);
  v56 = rect;
  result.height = v55;
  result.width = v56;
  return result;
}

double __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "intrinsicContentSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "frameForAlignmentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CAMViewSetBoundsAndCenterForFrame(*(void **)(a1 + 32), v2, v3, v4, v5);
}

- (CGSize)_layoutForPadCollapsedPortraitButton:(BOOL)a3
{
  _BOOL4 v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGSize result;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if (v3)
    -[UIImageView setFrame:](self->__padBackgroundView, "setFrame:", v5, v6, v7, v8);
  -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
  v37 = 0;
  UIRectCenteredIntegralRectScale();
  if (v3)
  {
    v13 = v9;
    v14 = v10;
    v38 = v11;
    v39 = v12;
    -[CAMExpandableMenuButton _headerView](self, "_headerView", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frameForAlignmentRect:", v13, v14, v38, v39);
    CAMViewSetBoundsAndCenterForFrame(v15, v16, v17, v18, v19);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = self->__menuItems;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v25, "intrinsicContentSize", v37);
        v37 = 0;
        UIRectCenteredIntegralRectScale();
        if (v3)
        {
          objc_msgSend(v25, "frameForAlignmentRect:", 0);
          CAMViewSetBoundsAndCenterForFrame(v25, v26, v27, v28, v29);
        }
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v22);
  }

  -[UIImageView image](self->__padBackgroundView, "image");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v31;
  v34 = v33;

  v35 = v32;
  v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

- (CGSize)_layoutForPadExpandedPortraitButton:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
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
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MidX;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  CGSize result;
  CGRect v58;
  CGRect v59;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  -[CAMExpandableMenuButton tappableEdgeInsets](self, "tappableEdgeInsets");
  v6 = v5;
  -[CAMExpandableMenuButton bounds](self, "bounds");
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if (v3)
    -[UIImageView setFrame:](self->__padBackgroundView, "setFrame:", v7, v8, v9, v10);
  v50 = v6;
  v11 = v6 + 13.0;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = self->__menuItems;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v17, "intrinsicContentSize", v49);
        v49 = 0;
        UIRectCenteredIntegralRectScale();
        v21 = v18;
        v22 = v19;
        v23 = v20;
        if (v3)
        {
          objc_msgSend(v17, "frameForAlignmentRect:", v11, v18, v19, v20, 0);
          CAMViewSetBoundsAndCenterForFrame(v17, v24, v25, v26, v27);
        }
        v58.origin.x = v11;
        v58.origin.y = v21;
        v58.size.width = v22;
        v58.size.height = v23;
        v11 = CGRectGetMaxX(v58) + 29.0;
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v14);
  }

  -[UIView intrinsicContentSize](self->__headerView, "intrinsicContentSize");
  UIRectCenteredIntegralRectScale();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CAMExpandableMenuButton padHeaderViewContentInsetLeft](self, "padHeaderViewContentInsetLeft", 0);
  v35 = v11 - v34;
  if (v3)
  {
    -[CAMExpandableMenuButton _headerView](self, "_headerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frameForAlignmentRect:", v35, v29, v31, v33);
    CAMViewSetBoundsAndCenterForFrame(v36, v37, v38, v39, v40);

  }
  -[UIImageView image](self->__padBackgroundView, "image");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "size");
  v43 = v42;
  v45 = v44;
  v59.origin.x = v35;
  v59.origin.y = v29;
  v59.size.width = v31;
  v59.size.height = v33;
  MidX = CGRectGetMidX(v59);

  v47 = MidX + v43 * 0.5 - v50;
  v48 = v45;
  result.height = v48;
  result.width = v47;
  return result;
}

- (CGSize)_layoutForPadStyle:(BOOL)a3 expanded:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  unint64_t v7;
  double v8;
  double v9;
  BOOL v10;
  CGSize result;

  v4 = a4;
  v5 = a3;
  v7 = -[CAMExpandableMenuButton orientation](self, "orientation") - 3;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v4 || v7 >= 2)
  {
    v10 = !v4;
    if (!v4 || v7 < 2)
    {
      if (v7 >= 2)
        v10 = 0;
      if (!v10 && !v4 && v7 >= 2)
        -[CAMExpandableMenuButton _layoutForPadCollapsedPortraitButton:](self, "_layoutForPadCollapsedPortraitButton:", v5, v8, v9);
    }
    else
    {
      -[CAMExpandableMenuButton _layoutForPadExpandedPortraitButton:](self, "_layoutForPadExpandedPortraitButton:", v5, v8, v9);
    }
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_selectedLabel
{
  void *v3;

  if (-[CAMExpandableMenuButton selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)-[NSMutableArray count](self->__menuItems, "count");
    if (v3)
    {
      -[NSMutableArray objectAtIndex:](self->__menuItems, "objectAtIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMExpandableMenuButton reloadData](self, "reloadData");
  }
}

- (void)_createPadBackgroundView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  UIImageView *v8;
  UIImageView *padBackgroundView;
  id v10;

  v3 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("CAMButtonBackgroundPad"), v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "size");
  objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 1, v5 * 0.5, v6 * 0.5, v5 * 0.5, v6 * 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
  -[CAMExpandableMenuButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
  padBackgroundView = self->__padBackgroundView;
  self->__padBackgroundView = v8;

}

+ (double)expansionDuration
{
  return 0.2;
}

- (void)expandMenuAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  objc_msgSend(WeakRetained, "expandMenuButton:animated:", self, v3);

}

void __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480);
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a2;
  if (v4 == a3)
    objc_msgSend(v5, "systemYellowColor");
  else
    objc_msgSend(v5, "whiteColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

void __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "containsIndex:", a3))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "containsIndex:", a3)
      && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) == a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    objc_msgSend(v7, "setTextColor:", v5);

  }
}

uint64_t __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_convertAllSubviewsToProposedFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int64_t v16;
  double MaxX;
  double MaxY;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  CGFloat rect;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36 = *MEMORY[0x1E0C80C00];
  -[CAMExpandableMenuButton frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[CAMExpandableMenuButton orientation](self, "orientation");
  if (-[CAMExpandableMenuButton orientation](self, "orientation") == 4
    || -[CAMExpandableMenuButton orientation](self, "orientation") == 2)
  {
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    rect = height;
    MaxX = CGRectGetMaxX(v37);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    v30 = MaxX - CGRectGetMaxX(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = rect;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v9;
    v40.origin.y = v11;
    v40.size.width = v13;
    v40.size.height = v15;
    v19 = MaxY - CGRectGetMaxY(v40);
  }
  else
  {
    v30 = v9 - x;
    v19 = v11 - y;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CAMExpandableMenuButton subviews](self, "subviews", *(_QWORD *)&rect);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    if ((unint64_t)(v16 - 3) >= 2)
      v24 = v30;
    else
      v24 = v19;
    if ((unint64_t)(v16 - 3) < 2)
      v19 = v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v26, "frame");
        objc_msgSend(v26, "setFrame:", v24 + v27, v19 + v28);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v22);
  }

}

- (void)finishCollapsingAnimated:(BOOL)a3
{
  if (self->_expanded)
  {
    self->_expanded = 0;
    -[CAMExpandableMenuButton _updateFromExpansionChangeAnimated:](self, "_updateFromExpansionChangeAnimated:", a3);
  }
}

- (void)finishExpansionAnimated:(BOOL)a3
{
  if (!self->_expanded)
  {
    self->_expanded = 1;
    -[CAMExpandableMenuButton _updateFromExpansionChangeAnimated:](self, "_updateFromExpansionChangeAnimated:", a3);
  }
}

- (void)completeExpansionToProposedFrame:(CGRect)a3
{
  -[CAMExpandableMenuButton _updateFromExpansionChangeAnimated:](self, "_updateFromExpansionChangeAnimated:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMExpandableMenuButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _OWORD v6[3];

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v6, 0, sizeof(v6));
  objc_msgSend(v3, "setTransform:", v6);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  return objc_msgSend(v4, "setFrame:");
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_handleTouchGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  if (!-[CAMExpandableMenuButton shouldIgnoreMenuInteraction](self, "shouldIgnoreMenuInteraction"))
  {
    -[CAMExpandableMenuButton _trackingView](self, "_trackingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    v9 = objc_msgSend(v23, "state");
    if (v9 == 1)
    {
      -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:", v6, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CAMExpandableMenuButton _setTrackingView:](self, "_setTrackingView:", v10);
        -[CAMExpandableMenuButton _setTrackingViewHighlighted:](self, "_setTrackingViewHighlighted:", 1);
        objc_msgSend(v10, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v11, 1, -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle"));

      }
    }
    else if (v4)
    {
      v12 = v9;
      objc_msgSend(v4, "frame");
      UIDistanceBetweenPointAndRect();
      v14 = v13;
      if (v12 == 2)
      {
        if (v13 < 50.0 != -[CAMExpandableMenuButton _isTrackingViewHighlighted](self, "_isTrackingViewHighlighted"))
        {
          -[CAMExpandableMenuButton _setTrackingViewHighlighted:](self, "_setTrackingViewHighlighted:", v14 < 50.0, 50.0);
          objc_msgSend(v4, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v15, v14 < 50.0, -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle"));

        }
      }
      else
      {
        if (v12 != 4 && v13 < 50.0)
        {
          v16 = -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex");
          -[CAMExpandableMenuButton _menuItems](self, "_menuItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[CAMExpandableMenuButton shouldAllowExpansion](self, "shouldAllowExpansion");
          if (v18)
          {
            -[CAMExpandableMenuButton headerView](self, "headerView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4 != v19)
              v16 = objc_msgSend(v17, "indexOfObject:", v4);
          }
          else
          {
            v16 = (v16 + 1) % objc_msgSend(v17, "count");
          }
          v20 = -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex");
          -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v16);
          -[CAMExpandableMenuButton expandableMenuDelegate](self, "expandableMenuDelegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
          {
            objc_msgSend(v21, "collapseMenuButton:animated:", self, 1);
          }
          else if (v18)
          {
            objc_msgSend(v21, "expandMenuButton:animated:", self, 1);
          }
          if (v16 != v20)
            -[CAMExpandableMenuButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

        }
        if (-[CAMExpandableMenuButton _isTrackingViewHighlighted](self, "_isTrackingViewHighlighted"))
        {
          objc_msgSend(v4, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v22, 0, -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle"));
          -[CAMExpandableMenuButton _setTrackingViewHighlighted:](self, "_setTrackingViewHighlighted:", 0);

        }
        -[CAMExpandableMenuButton _setTrackingView:](self, "_setTrackingView:", 0);
      }
    }

  }
}

- (id)_viewToTrackForTouchAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  BOOL v11;
  id v12;
  _QWORD v14[8];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  y = a3.y;
  x = a3.x;
  -[CAMExpandableMenuButton _menuItems](self, "_menuItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandableMenuButton _headerView](self, "_headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__18;
    v23 = __Block_byref_object_dispose__18;
    v24 = 0;
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "arrayByAddingObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__CAMExpandableMenuButton__viewToTrackForTouchAtLocation___block_invoke;
    v14[3] = &unk_1EA32DEA8;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[4] = &v15;
    v14[5] = &v19;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    if (v16[3] >= 20.0)
      v9 = 0;
    else
      v9 = (id)v20[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v10 = -[CAMExpandableMenuButton wantsSelectedItemToBeVisible](self, "wantsSelectedItemToBeVisible");
    v11 = -[CAMExpandableMenuButton _wantsHeaderViewToBeVisible](self, "_wantsHeaderViewToBeVisible");
    if (!v10 || v11)
    {
      v12 = v7;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;
  }

  return v9;
}

void __58__CAMExpandableMenuButton__viewToTrackForTouchAtLocation___block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v13 = a2;
  objc_msgSend(v13, "frame");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MinX = CGRectGetMinX(v14);
  v9 = *(double *)(a1 + 48);
  v10 = MinX - v9;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = fmax(v10, v9 - CGRectGetMaxX(v15));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v11 < *(double *)(v12 + 24))
  {
    *(double *)(v12 + 24) = v11;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (UIEdgeInsets)tappableEdgeInsets
{
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  v7 = -[CAMExpandableMenuButton layoutStyle](self, "layoutStyle");
  if (v7 <= 4 && ((1 << v7) & 0x15) != 0 && -[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
  {
    top = *MEMORY[0x1E0DC49E8];
    left = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    bottom = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    right = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v8 = top;
  v9 = left;
  v10 = bottom;
  v11 = right;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMExpandableMenuButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMExpandableMenuButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[CAMExpandableMenuButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (int64_t)numberOfMenuItems
{
  return 0;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  return &stru_1EA3325A0;
}

- (id)headerView
{
  return 0;
}

- (double)padHeaderViewContentInsetLeft
{
  return 0.0;
}

- (BOOL)shouldAllowExpansion
{
  return (unint64_t)-[NSMutableArray count](self->__menuItems, "count") > 2;
}

- (BOOL)shouldIgnoreMenuInteraction
{
  return 0;
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;

  objc_msgSend(a3, "locationOfAccessibilityGestureInView:", self);
  -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)MEMORY[0x1E0DC3418];
    v6 = v4;
    v7 = [v5 alloc];
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v7, "initWithTitle:image:imageInsets:", v8, 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
LABEL_14:

    goto LABEL_15;
  }
  -[CAMExpandableMenuButton headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqual:", v10);

  if (v11)
  {
    -[CAMExpandableMenuButton shownIndexesWhileCollapsed](self, "shownIndexesWhileCollapsed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex")))
    {
      -[CAMExpandableMenuButton _menuItems](self, "_menuItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if (-[CAMExpandableMenuButton conformsToProtocol:](self, "conformsToProtocol:", &unk_1F0336900))
    {
      -[CAMExpandableMenuButton imageForAccessibilityHUD](self, "imageForAccessibilityHUD");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CAMExpandableMenuButton headerView](self, "headerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[CAMExpandableMenuButton headerView](self, "headerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
    }
    v19 = objc_alloc(MEMORY[0x1E0DC3418]);
    v9 = (void *)objc_msgSend(v19, "initWithTitle:image:imageInsets:scaleImage:", v14, v15, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[CAMExpandableMenuButton isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v10, "locationOfAccessibilityGestureInView:", self);
    -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CAMExpandableMenuButton _menuItems](self, "_menuItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexOfObject:", v5);

      -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v7);
      -[CAMExpandableMenuButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
    -[CAMExpandableMenuButton collapseMenuAnimated:](self, "collapseMenuAnimated:", 1);

  }
  else if (-[CAMExpandableMenuButton shouldAllowExpansion](self, "shouldAllowExpansion"))
  {
    -[CAMExpandableMenuButton expandMenuAnimated:](self, "expandMenuAnimated:", 1);
  }
  else
  {
    v8 = -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex") + 1;
    -[CAMExpandableMenuButton _menuItems](self, "_menuItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v8 % objc_msgSend(v9, "count"));

    -[CAMExpandableMenuButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (NSMutableArray)_menuItems
{
  return self->__menuItems;
}

- (NSMutableIndexSet)_highlightedIndexesWhileCollapsed
{
  return self->__highlightedIndexesWhileCollapsed;
}

- (UIImageView)_padBackgroundView
{
  return self->__padBackgroundView;
}

- (UIView)_trackingView
{
  return self->__trackingView;
}

- (void)_setTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->__trackingView, a3);
}

- (BOOL)_isTrackingViewHighlighted
{
  return self->__trackingViewHighlighted;
}

- (void)_setTrackingViewHighlighted:(BOOL)a3
{
  self->__trackingViewHighlighted = a3;
}

- (CAMExpandableMenuButtonDelegate)expandableMenuDelegate
{
  return (CAMExpandableMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
}

- (CAMTouchingGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_expandableMenuDelegate);
  objc_storeStrong((id *)&self->__trackingView, 0);
  objc_storeStrong((id *)&self->__padBackgroundView, 0);
  objc_storeStrong((id *)&self->__highlightedIndexesWhileCollapsed, 0);
  objc_storeStrong((id *)&self->__shownIndexesWhileCollapsed, 0);
  objc_storeStrong((id *)&self->__headerView, 0);
  objc_storeStrong((id *)&self->__menuItems, 0);
}

@end
