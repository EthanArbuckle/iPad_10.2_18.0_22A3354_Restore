@implementation AVMobileContentTabSelectionView

- (AVMobileContentTabSelectionView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileContentTabSelectionView *v6;
  AVMobileContentTabSelectionView *v7;
  uint64_t v8;
  NSMutableArray *tabButtons;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileContentTabSelectionView;
  v6 = -[AVMobileContentTabSelectionView init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    tabButtons = v7->_tabButtons;
    v7->_tabButtons = (NSMutableArray *)v8;

    -[AVMobileContentTabSelectionView setInsetsLayoutMarginsFromSafeArea:](v7, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }

  return v7;
}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  void *v6;
  AVMobileChromelessControlsStyleSheet *v7;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    -[AVMobileContentTabSelectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileContentTabSelectionView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    v5 = v7;
  }

}

- (void)setContentTabs:(id)a3
{
  NSArray *v4;
  NSArray *contentTabs;
  id v6;

  if (self->_contentTabs != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contentTabs = self->_contentTabs;
    self->_contentTabs = v4;

    if (!-[NSArray containsObject:](self->_contentTabs, "containsObject:", self->_selectedTab))
      -[AVMobileContentTabSelectionView selectTab:withReason:](self, "selectTab:withReason:", 0, 1);
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    -[AVMobileContentTabSelectionView _scrollToFirstButtonIfPossibleAnimated:]((uint64_t)self);
    -[AVMobileContentTabSelectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVMobileContentTabSelectionView superview](self, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

  }
}

- (void)selectTab:(id)a3 withReason:(unint64_t)a4
{
  AVMobileContentTab *v7;
  AVMobileContentTab *v8;
  AVMobileContentTab **p_selectedTab;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  AVMobileContentTab *v21;

  v7 = (AVMobileContentTab *)a3;
  v8 = v7;
  p_selectedTab = &self->_selectedTab;
  if (self->_selectedTab != v7)
  {
    v21 = v7;
    objc_storeStrong((id *)&self->_selectedTab, a3);
    -[AVMobileContentTabSelectionView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "contentTabSelectionView:didChangeSelectedTabTo:withReason:", self, *p_selectedTab, a4);

    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    v11 = -[NSMutableArray count](self->_tabButtons, "count");
    v8 = v21;
    if (v11 && *p_selectedTab)
    {
      -[NSMutableArray objectAtIndex:](self->_tabButtons, "objectAtIndex:", -[NSArray indexOfObject:](self->_contentTabs, "indexOfObject:"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      -[AVMobileContentTabSelectionView _scrollToRect:animated:]((uint64_t)self, v14, v16, v18, v20);
      v8 = v21;
    }
  }

}

- (void)resetSelection
{
  NSMutableArray *v3;
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
  -[AVMobileContentTabSelectionView selectTab:withReason:](self, "selectTab:withReason:", 0, 1);
  if (self)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_tabButtons;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setHighlighted:", 0, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[AVMobileContentTabSelectionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didMoveToSuperview
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  CAGradientLayer *v7;
  CAGradientLayer *gradientFadeoutLayer;
  CAGradientLayer *v9;
  void *v10;
  id v11;
  UIScrollView *v12;
  UIScrollView *scrollingContentView;
  void *v14;
  objc_super v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVMobileContentTabSelectionView;
  -[AVMobileContentTabSelectionView didMoveToSuperview](&v15, sel_didMoveToSuperview);
  if (self)
  {
    if (!self->_gradientFadeoutLayer)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v3, "CGColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "CGColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
      gradientFadeoutLayer = self->_gradientFadeoutLayer;
      self->_gradientFadeoutLayer = v7;

      v9 = self->_gradientFadeoutLayer;
      v16[0] = v6;
      v16[1] = v4;
      v16[2] = v4;
      v16[3] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setColors:](v9, "setColors:", v10);

      -[CAGradientLayer setStartPoint:](self->_gradientFadeoutLayer, "setStartPoint:", 0.0, 0.5);
      -[CAGradientLayer setEndPoint:](self->_gradientFadeoutLayer, "setEndPoint:", 1.0, 0.5);
      -[AVMobileContentTabSelectionView _updateGradientFadeoutLocations]((id *)&self->super.super.super.isa);

    }
    if (!self->_scrollingContentView)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC3C28]);
      v12 = (UIScrollView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      scrollingContentView = self->_scrollingContentView;
      self->_scrollingContentView = v12;

      -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollingContentView, "setShowsVerticalScrollIndicator:", 0);
      -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollingContentView, "setShowsHorizontalScrollIndicator:", 0);
      -[UIScrollView setContentOffset:](self->_scrollingContentView, "setContentOffset:", -30.0, 0.0);
      -[AVMobileContentTabSelectionView layer](self, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMask:", self->_gradientFadeoutLayer);

      -[AVMobileContentTabSelectionView addSubview:](self, "addSubview:", self->_scrollingContentView);
    }
  }
  -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
  -[AVMobileContentTabSelectionView _scrollToFirstButtonIfPossibleAnimated:]((uint64_t)self);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;
  CGSize result;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AVMobileContentTabSelectionView;
  -[AVMobileContentTabSelectionView intrinsicContentSize](&v18, sel_intrinsicContentSize);
  v4 = v3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_tabButtons;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "intrinsicContentSize", (_QWORD)v14);
        if (v4 >= v10)
          v11 = v4;
        else
          v11 = v10;
        v4 = v11 + 5.0;
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  v12 = *MEMORY[0x1E0DC55F0];
  v13 = v4;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileContentTabSelectionView;
  -[AVMobileContentTabSelectionView layoutMarginsDidChange](&v7, sel_layoutMarginsDidChange);
  if (self)
  {
    if (self->_scrollingContentView)
    {
      v3 = *MEMORY[0x1E0DC49E8];
      v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      -[AVMobileContentTabSelectionView layoutMargins](self, "layoutMargins");
      v6 = v5;
      -[AVMobileContentTabSelectionView layoutMargins](self, "layoutMargins");
      -[UIScrollView setContentInset:](self->_scrollingContentView, "setContentInset:", v3, v6, v4);
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v3;
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
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)AVMobileContentTabSelectionView;
  -[AVMobileContentTabSelectionView layoutSubviews](&v25, sel_layoutSubviews);
  v3 = -[AVMobileContentTabSelectionView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[AVMobileContentTabSelectionView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[NSMutableArray count](self->_tabButtons, "count"))
  {
    v14 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tabButtons, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "intrinsicContentSize");
      if (v12 < v17)
        v12 = v17;
      v13 = v13 + v16;
      if (v14 != -[NSMutableArray count](self->_tabButtons, "count") - 1)
        v13 = v13 + 10.0;

      ++v14;
    }
    while (v14 < -[NSMutableArray count](self->_tabButtons, "count"));
  }
  -[UIScrollView setFrame:](self->_scrollingContentView, "setFrame:", v5, v7, v9, v11);
  -[UIScrollView setContentSize:](self->_scrollingContentView, "setContentSize:", v13, v12);
  -[CAGradientLayer setFrame:](self->_gradientFadeoutLayer, "setFrame:", v5, v7, v9, v11);
  if (-[NSMutableArray count](self->_tabButtons, "count"))
  {
    v18 = 0;
    v19 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_tabButtons, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "intrinsicContentSize");
      v23 = v21;
      if (v18)
        v19 = v19 + 10.0;
      if (v11 >= v22)
        v24 = v22;
      else
        v24 = v11;
      objc_msgSend(v20, "avkit_setFrame:inLayoutDirection:", v3, v19, (v11 - v24) * 0.5, v21);
      v19 = v19 + v23;

      ++v18;
    }
    while (v18 < -[NSMutableArray count](self->_tabButtons, "count"));
  }
  -[AVMobileContentTabSelectionView _updateGradientFadeoutLocations]((id *)&self->super.super.super.isa);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileContentTabSelectionView;
  if (-[AVMobileContentTabSelectionView isUserInteractionEnabled](&v6, sel_isUserInteractionEnabled) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileContentTabSelectionView;
    -[AVMobileContentTabSelectionView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, v3);
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
  }
}

- (void)_contentTabPressed:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_tabButtons, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
LABEL_12:
      _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Error: Could not find button %@ in tap button list.", (uint8_t *)&v10, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v7 = v5;
  if (v5 >= -[NSArray count](self->_contentTabs, "count"))
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  -[NSArray objectAtIndex:](self->_contentTabs, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileContentTabSelectionView selectedTab](self, "selectedTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {

    v8 = 0;
  }
  -[AVMobileContentTabSelectionView selectTab:withReason:](self, "selectTab:withReason:", v8, 0);

LABEL_10:
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (AVMobileContentTab)selectedTab
{
  return self->_selectedTab;
}

- (AVMobileContentTabSelectionViewDelegate)delegate
{
  return (AVMobileContentTabSelectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedTab, 0);
  objc_storeStrong((id *)&self->_contentTabs, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_gradientFadeoutLayer, 0);
  objc_storeStrong((id *)&self->_scrollingContentView, 0);
  objc_storeStrong((id *)&self->_tabButtons, 0);
}

- (void)_updateTabButtons
{
  id *v1;
  void *v2;
  int *v3;
  unint64_t v4;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _BOOL8 v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  id *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = &OBJC_IVAR___AVPlayerViewController__pictureInPictureActivitySessionIdentifier;
      v4 = objc_msgSend(v1[52], "count");
      v5 = &OBJC_IVAR___AVPlayerViewController__pictureInPictureActivitySessionIdentifier;
      v6 = objc_msgSend(v1[56], "count");
      if (v4 <= v6)
        v7 = v6;
      else
        v7 = v4;
      if (v7 >= 1)
      {
        v8 = 0;
        v46 = *MEMORY[0x1E0CD2A68];
        v9 = *MEMORY[0x1E0DC1138];
        v47 = *MEMORY[0x1E0DC4918];
        v48 = v7;
        v57 = *MEMORY[0x1E0DC1140];
        v58 = *MEMORY[0x1E0DC1138];
        v56 = v1;
        do
        {
          if (objc_msgSend(*(id *)((char *)v1 + v5[352]), "count") <= v8)
          {
            objc_msgSend(*(id *)((char *)v1 + v3[351]), "lastObject");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeFromSuperview");
            objc_msgSend(*(id *)((char *)v1 + v3[351]), "removeLastObject");

          }
          if (objc_msgSend(*(id *)((char *)v1 + v5[352]), "count") > v8)
          {
            if (objc_msgSend(*(id *)((char *)v1 + v3[351]), "count") <= v8)
            {
              +[AVButton buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", &stru_1E5BB5F88, 0, 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setPointerStyleProvider:", &__block_literal_global_12476);
              objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setContentInsets:", 5.0, 11.0, 5.0, 11.0);
              objc_msgSend(v11, "layer");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setBorderWidth:", 1.0);

              objc_msgSend(v11, "layer");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setCornerRadius:", 7.0);

              objc_msgSend(v11, "layer");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setCornerCurve:", v46);

              objc_msgSend(v11, "setConfiguration:", v12);
              objc_msgSend(v11, "addTarget:action:forControlEvents:", v1, sel__contentTabPressed_, 64);
              objc_msgSend(v1[53], "addSubview:", v11);
              objc_msgSend(*(id *)((char *)v1 + v3[351]), "addObject:", v11);

            }
            objc_msgSend(*(id *)((char *)v1 + v5[352]), "objectAtIndex:", v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)((char *)v1 + v3[351]), "objectAtIndex:", v8);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            v18 = v1;
            v19 = v16;
            objc_msgSend(v18, "styleSheet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc(MEMORY[0x1E0CB3778]);
            objc_msgSend(v19, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v63[0] = v9;
            v54 = v20;
            objc_msgSend(v20, "contentTabLabelFont");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v63[1] = v57;
            v64[0] = v24;
            v51 = (void *)v21;
            v64[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v25);

            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v49 = objc_msgSend(v27, "CGColor");

            objc_msgSend(v19, "displayName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "length");

            v50 = v29;
            if (v18[57] == v19)
            {
              v31 = v52;
              v32 = v54;
              v35 = v51;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
              v30 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v61[0] = v58;
              v32 = v54;
              objc_msgSend(v54, "contentTabLabelFont");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v61[1] = v57;
              v62[0] = v33;
              v62[1] = v30;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setAttributes:range:", v34, 0, v29);

              v35 = (void *)v30;
            }
            objc_msgSend(v17, "setAttributedTitle:forState:", v26, 0);
            v55 = objc_msgSend(v56, "isUserInteractionEnabled");
            if ((v55 & 1) != 0)
            {
              v3 = &OBJC_IVAR___AVPlayerViewController__pictureInPictureActivitySessionIdentifier;
              v36 = v49;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
              v37 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
              v53 = objc_claimAutoreleasedReturnValue();

              v59[0] = v58;
              objc_msgSend(v32, "contentTabLabelFont");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v59[1] = v57;
              v60[0] = v38;
              v60[1] = v37;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setAttributes:range:", v39, 0, v50);

              objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
              v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v36 = objc_msgSend(v40, "CGColor");

              objc_msgSend(v17, "setAttributedTitle:forState:", v26, 2);
              v31 = (void *)v53;
              v35 = (void *)v37;
              v3 = &OBJC_IVAR___AVPlayerViewController__pictureInPictureActivitySessionIdentifier;
            }
            objc_msgSend(v17, "layer");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setBorderColor:", v36);

            v42 = v56[57] == v19;
            objc_msgSend(v17, "setMaximumContentSizeCategory:", v47);
            objc_msgSend(v17, "setSelected:", v42);
            objc_msgSend(v17, "setBackgroundColor:", v31);
            objc_msgSend(v17, "setTintColor:", v31);
            objc_msgSend(v17, "setEnabled:", v55);
            objc_msgSend(v19, "displayName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAccessibilityLabel:", v43);

            objc_msgSend(v19, "accessibilityIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAccessibilityIdentifier:", v44);

            objc_msgSend(v17, "setHighlighted:", 0);
            v1 = v56;
            v5 = &OBJC_IVAR___AVPlayerViewController__pictureInPictureActivitySessionIdentifier;
            v7 = v48;
            v9 = v58;
          }
          ++v8;
        }
        while (v7 != v8);
      }
      objc_msgSend(v1, "invalidateIntrinsicContentSize");
      objc_msgSend(v1, "superview");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v1);

      objc_msgSend(v1, "setNeedsLayout");
    }
  }
}

id __69__AVMobileContentTabSelectionView__setupPointerInteractionForButton___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0DC3D90];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithView:", v3);

  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateGradientFadeoutLocations
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "bounds");
    v7[0] = &unk_1E5BF42E8;
    v3 = (v2 + -30.0) / v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 30.0 / v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = v5;
    v7[3] = &unk_1E5BF42F8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[54], "setLocations:", v6);
  }
}

- (void)_scrollToFirstButtonIfPossibleAnimated:(uint64_t)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 416), "count"))
    {
      objc_msgSend(*(id *)(a1 + 416), "objectAtIndex:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      -[AVMobileContentTabSelectionView _scrollToRect:animated:](a1, v2, v3, v4, v5);

    }
  }
}

- (uint64_t)_scrollToRect:(double)a3 animated:(double)a4
{
  uint64_t v9;

  if (*(_QWORD *)(result + 424))
  {
    v9 = result;
    result = CGRectEqualToRect(*(CGRect *)&a2, *MEMORY[0x1E0C9D648]);
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v9 + 424), "scrollRectToVisible:animated:", 0, a2, a3, a4, a5);
  }
  return result;
}

@end
