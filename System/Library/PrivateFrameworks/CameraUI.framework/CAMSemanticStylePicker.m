@implementation CAMSemanticStylePicker

- (CAMSemanticStylePicker)initWithFrame:(CGRect)a3
{
  CAMSemanticStylePicker *v3;
  UIPageControl *v4;
  UIPageControl *pageControl;
  UIScrollView *v6;
  UIScrollView *scrollView;
  UIScrollView *v8;
  NSMutableArray *v9;
  NSMutableArray *tileViews;
  NSMutableArray *v11;
  NSMutableArray *spacerViews;
  id v13;
  void *v14;
  int v15;
  CAMFeedbackController *v16;
  CAMFeedbackController *feedbackController;
  CGAffineTransform v19;
  CGAffineTransform v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CAMSemanticStylePicker;
  v3 = -[CAMSemanticStylePicker initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
    pageControl = v3->_pageControl;
    v3->_pageControl = v4;

    -[UIPageControl addTarget:action:forControlEvents:](v3->_pageControl, "addTarget:action:forControlEvents:", v3, sel__handlePageControlValueChanged_, 4096);
    -[UIPageControl addTarget:action:forControlEvents:](v3->_pageControl, "addTarget:action:forControlEvents:", v3, sel__handlePageControlTouchDown_, 1);
    -[UIPageControl setAlpha:](v3->_pageControl, "setAlpha:", 0.0);
    -[CAMSemanticStylePicker addSubview:](v3, "addSubview:", v3->_pageControl);
    v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v3->__scrollView;
    v3->__scrollView = v6;

    -[UIScrollView setShowsVerticalScrollIndicator:](v3->__scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v3->__scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setPagingEnabled:](v3->__scrollView, "setPagingEnabled:", 1);
    -[UIScrollView setClipsToBounds:](v3->__scrollView, "setClipsToBounds:", 0);
    -[UIScrollView setDelegate:](v3->__scrollView, "setDelegate:", v3);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v3->__scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](v3->__scrollView, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    if (-[CAMSemanticStylePicker effectiveUserInterfaceLayoutDirection](v3, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      CGAffineTransformMakeRotation(&v20, 3.14159265);
      v8 = v3->__scrollView;
      v19 = v20;
      -[UIScrollView setTransform:](v8, "setTransform:", &v19);
    }
    -[CAMSemanticStylePicker addSubview:](v3, "addSubview:", v3->__scrollView);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tileViews = v3->__tileViews;
    v3->__tileViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    spacerViews = v3->__spacerViews;
    v3->__spacerViews = v11;

    v3->_spacerWidth = 7.0;
    v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[NSMutableArray addObject:](v3->__spacerViews, "addObject:", v13);
    -[UIScrollView addSubview:](v3->__scrollView, "addSubview:", v13);
    v3->__selectedTileExpanded = 1;
    v3->_hidesSelfWhenNotExpanded = 1;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "allowHaptics");

    if (v15)
    {
      v16 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v3->__feedbackController;
      v3->__feedbackController = v16;

    }
  }
  return v3;
}

- (BOOL)scrollEnabled
{
  void *v2;
  char v3;

  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollEnabled");

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)scrollViewUserInteractionEnabled
{
  void *v2;
  char v3;

  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (void)setScrollViewUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMSemanticStylePicker bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
    -[CAMSemanticStylePicker _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMSemanticStylePicker frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
    -[CAMSemanticStylePicker _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
}

- (void)setSpacerWidth:(double)a3
{
  if (self->_spacerWidth != a3)
  {
    self->_spacerWidth = a3;
    -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfStyles:(unint64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CAMSemanticStylePickerTileOverlayView *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  if (self->_numberOfStyles != a3)
  {
    self->_numberOfStyles = a3;
    -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") - a3;

    if (v6 < 1)
    {
      if (v6 < 0)
      {
        if (-v6 > 1)
          v13 = -v6;
        else
          v13 = 1;
        do
        {
          v14 = objc_alloc_init(CAMSemanticStylePickerTileOverlayView);
          -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v14);

          -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addSubview:", v14);

          v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
          -[CAMSemanticStylePicker _spacerViews](self, "_spacerViews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

          -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addSubview:", v17);

          --v13;
        }
        while (v13);
      }
    }
    else
    {
      do
      {
        -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "removeFromSuperview");
        -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeLastObject");

        -[CAMSemanticStylePicker _spacerViews](self, "_spacerViews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "removeFromSuperview");
        -[CAMSemanticStylePicker _spacerViews](self, "_spacerViews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeLastObject");

        --v6;
      }
      while (v6);
    }
    -[CAMSemanticStylePicker pageControl](self, "pageControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfPages:", a3);

    if (-[CAMSemanticStylePicker selectedStyleIndex](self, "selectedStyleIndex") >= a3)
    {
      -[CAMSemanticStylePicker setSelectedStyleIndex:](self, "setSelectedStyleIndex:", a3 - 1);
      -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", -[CAMSemanticStylePicker selectedStyleIndex](self, "selectedStyleIndex"), 1, 1, 0);
    }
    -[CAMSemanticStylePicker _updateMaterialOpacityWithDuration:](self, "_updateMaterialOpacityWithDuration:", 0.0);
    -[CAMSemanticStylePicker _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 1);
    -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedStyleIndex:(unint64_t)a3
{
  -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", a3, 0, 1, 0);
}

- (void)setSelectedStyleIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", a3, 0, 1, a4);
}

- (void)_setSelectedStyleIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 shouldUpdateLayout:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  double v12;
  void *v13;
  _QWORD v14[5];

  if (self->_selectedStyleIndex != a3)
  {
    v6 = a6;
    v7 = a5;
    v8 = a4;
    if (a5 && a6)
      -[CAMSemanticStylePicker layoutIfNeeded](self, "layoutIfNeeded");
    self->_selectedStyleIndex = a3;
    -[CAMSemanticStylePicker pageControl](self, "pageControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCurrentPage:", a3);

    if (v7)
    {
      -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
      v12 = 0.3;
      if (!v6)
        v12 = 0.0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __92__CAMSemanticStylePicker__setSelectedStyleIndex_shouldDelegate_shouldUpdateLayout_animated___block_invoke;
      v14[3] = &unk_1EA328868;
      v14[4] = self;
      +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v14, v12);
    }
    if (v8)
    {
      -[CAMSemanticStylePicker delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "semanticStylePickerDidChangeSelectedStyle:", self);

    }
  }
}

uint64_t __92__CAMSemanticStylePicker__setSelectedStyleIndex_shouldDelegate_shouldUpdateLayout_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentOffset");
}

- (void)_setSelectedTileExpanded:(BOOL)a3
{
  if (self->__selectedTileExpanded != a3)
  {
    self->__selectedTileExpanded = a3;
    -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)expanded
{
  if (-[CAMSemanticStylePicker hidesSelfWhenNotExpanded](self, "hidesSelfWhenNotExpanded")
    && (-[CAMSemanticStylePicker isHidden](self, "isHidden") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return !-[CAMSemanticStylePicker _selectedTileExpanded](self, "_selectedTileExpanded");
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[CAMSemanticStylePicker setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  double v7;
  _BOOL4 v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[6];

  v5 = a3;
  if (-[CAMSemanticStylePicker expanded](self, "expanded") != a3)
  {
    -[CAMSemanticStylePicker setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v5);
    if (v5)
      v7 = 1.0;
    else
      v7 = 0.0;
    v8 = -[CAMSemanticStylePicker hidesSelfWhenNotExpanded](self, "hidesSelfWhenNotExpanded");
    if (a4)
    {
      if (v8)
        -[CAMSemanticStylePicker setHidden:](self, "setHidden:", 0);
      -[CAMSemanticStylePicker layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMSemanticStylePicker _setSelectedTileExpanded:](self, "_setSelectedTileExpanded:", v5 ^ 1);
      -[CAMSemanticStylePicker _setExpandedAnimationCounter:](self, "_setExpandedAnimationCounter:", -[CAMSemanticStylePicker _expansionAnimationCounter](self, "_expansionAnimationCounter") + 1);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke;
      v12[3] = &unk_1EA328B18;
      v12[4] = self;
      *(double *)&v12[5] = v7;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke_2;
      v10[3] = &unk_1EA329A78;
      v10[4] = self;
      v11 = !v5;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v12, v10, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      if (v8)
        -[CAMSemanticStylePicker setHidden:](self, "setHidden:", v5 ^ 1);
      -[CAMSemanticStylePicker _setSelectedTileExpanded:](self, "_setSelectedTileExpanded:", v5 ^ 1);
      -[CAMSemanticStylePicker pageControl](self, "pageControl");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlpha:", v7);

    }
  }
}

uint64_t __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __47__CAMSemanticStylePicker_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setExpandedAnimationCounter:", objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter");
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "hidesSelfWhenNotExpanded");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (CGRect)presentatationStyleRectAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v21 = *MEMORY[0x1E0C9D628];
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentationLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentationLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

    }
    else
    {
      objc_msgSend(v8, "frame");
      v14 = v25;
      v16 = v26;
      v18 = v27;
      v20 = v28;
    }

    objc_msgSend(v8, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v29, v14, v16, v18, v20);
    v21 = v30;
    v22 = v31;
    v23 = v32;
    v24 = v33;

  }
  v34 = v21;
  v35 = v22;
  v36 = v23;
  v37 = v24;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)modelStyleRectAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
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
  CGRect result;

  -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v21 = *MEMORY[0x1E0C9D628];
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMSemanticStylePicker _tileFrames](self, "_tileFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    objc_msgSend(v8, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v19, v12, v14, v16, v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

  }
  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)setMinimumScrollablePageIndex:(unint64_t)a3
{
  if (self->_minimumScrollablePageIndex != a3)
  {
    self->_minimumScrollablePageIndex = a3;
    -[CAMSemanticStylePicker _updateContentScrollInset](self, "_updateContentScrollInset");
  }
}

- (void)_updateContentScrollInset
{
  double v3;
  double v4;
  id v5;

  -[CAMSemanticStylePicker _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CAMSemanticStylePicker minimumScrollablePageIndex](self, "minimumScrollablePageIndex"));
  v4 = -v3;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContentScrollInset:", 0.0, v4, 0.0, 0.0);

}

- (BOOL)_isScrollActive
{
  void *v2;
  char v3;

  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTracking") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isDecelerating");

  return v3;
}

- (CGPoint)_contentOffsetForIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  if (-[CAMSemanticStylePicker numberOfStyles](self, "numberOfStyles"))
  {
    -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    v8 = v7 * (double)a3;
    v9 = 0.0;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_fractionalIndexForContentOffset
{
  void *v3;
  double v4;
  double v5;

  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  -[CAMSemanticStylePicker _fractionalIndexForContentOffset:](self, "_fractionalIndexForContentOffset:");
  v5 = v4;

  return v5;
}

- (double)_fractionalIndexForContentOffset:(CGPoint)a3
{
  double x;
  void *v4;
  double v5;
  double v6;

  x = a3.x;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  return x / v6;
}

- (void)_updateScrollViewContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[CAMSemanticStylePicker _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CAMSemanticStylePicker selectedStyleIndex](self, "selectedStyleIndex"));
  v4 = v3;
  v6 = v5;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:", v4, v6);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMSemanticStylePicker *v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMSemanticStylePicker;
  -[CAMSemanticStylePicker hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMSemanticStylePicker *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isScrollEnabled");

    if (v7)
    {
      -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
      v5 = (CAMSemanticStylePicker *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)setMaterial:(int64_t)a3
{
  -[CAMSemanticStylePicker setMaterial:withDuration:](self, "setMaterial:withDuration:", a3, 0.0);
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  if (self->_material != a3)
  {
    self->_material = a3;
    -[CAMSemanticStylePicker _updateMaterialOpacityWithDuration:](self, "_updateMaterialOpacityWithDuration:", a4);
  }
}

- (void)setMaterialColor:(id)a3
{
  UIColor *v4;
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
  v4 = (UIColor *)a3;
  if ((-[UIColor isEqual:](self->_materialColor, "isEqual:", v4) & 1) == 0)
  {
    self->_materialColor = v4;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CAMSemanticStylePicker _tileViews](self, "_tileViews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setMaterialColor:", v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[CAMSemanticStylePicker _updateMaterialOpacityWithDuration:](self, "_updateMaterialOpacityWithDuration:", 0.0);
  }

}

- (void)_updateMaterialOpacityWithDuration:(double)a3
{
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v5 = -[CAMSemanticStylePicker material](self, "material");
  v6 = 0;
  if (v5 <= 4)
    v6 = qword_1DB9A6EE0[v5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CAMSemanticStylePicker__updateMaterialOpacityWithDuration___block_invoke;
  v7[3] = &unk_1EA328B18;
  v7[4] = self;
  v7[5] = v6;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 4, v7, 0, a3);
}

void __61__CAMSemanticStylePicker__updateMaterialOpacityWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_spacerViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "materialColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "colorWithAlphaComponent:", *(double *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBackgroundColor:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_tileViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setCornerTargetAlpha:", *(double *)(a1 + 40));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)setPageControlMaxNumberOfDots:(int64_t)a3
{
  if (self->_pageControlMaxNumberOfDots != a3)
  {
    self->_pageControlMaxNumberOfDots = a3;
    -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_tileFrames
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  -[CAMSemanticStylePicker bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CAMSemanticStylePicker spacerWidth](self, "spacerWidth");
  v15 = v14;
  v16 = v11 + -20.0 + v14 * -2.0;
  UIRectCenteredIntegralRectScale();
  v18 = v17;
  -[CAMSemanticStylePicker _fractionalIndexForContentOffset](self, "_fractionalIndexForContentOffset", 0);
  CEKProgressClamped();
  UICeilToViewScale();
  v20 = v19;
  -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __37__CAMSemanticStylePicker__tileFrames__block_invoke;
  v26[3] = &unk_1EA32C610;
  v28 = v15 + 10.0 - v18;
  v29 = v16;
  v30 = v15;
  v31 = v7;
  v32 = v9;
  v33 = v11;
  v26[4] = self;
  v34 = v13;
  v35 = v20;
  v22 = v5;
  v27 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v26);

  v23 = v27;
  v24 = v22;

  return v24;
}

void __37__CAMSemanticStylePicker__tileFrames__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 48) + (double)a3 * (v5 + *(double *)(a1 + 64));
  v7 = *(double *)(a1 + 96);
  if (objc_msgSend(*(id *)(a1 + 32), "_selectedTileExpanded"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "selectedStyleIndex") - 1 == a3)
    {
      v8 = *(double *)(a1 + 104);
LABEL_8:
      v5 = v5 - v8;
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "selectedStyleIndex") == a3)
    {
      v9 = *(double *)(a1 + 104);
      v6 = v6 - v9;
      v5 = v5 + v9 * 2.0;
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "selectedStyleIndex") + 1 == a3)
    {
      v8 = *(double *)(a1 + 104);
      v6 = v6 + v8;
      goto LABEL_8;
    }
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v6, 0.0, v5, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

- (void)layoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  id v44;
  _QWORD v45[5];
  id v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  _QWORD v53[4];
  id v54;

  -[CAMSemanticStylePicker bounds](self, "bounds");
  v41 = v4;
  v42 = v3;
  v6 = v5;
  v8 = v7;
  -[CAMSemanticStylePicker spacerWidth](self, "spacerWidth");
  v10 = v9;
  v43 = v9 + v6 + 10.0;
  v11 = v9 + v6 + -20.0 + v9 * -2.0;
  UIRectCenteredIntegralRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = v11 * (double)-[CAMSemanticStylePicker numberOfStyles](self, "numberOfStyles");
  -[CAMSemanticStylePicker _scrollView](self, "_scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentSize:", v21, v8);

  -[CAMSemanticStylePicker _tileFrames](self, "_tileFrames");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker _tileViews](self, "_tileViews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __40__CAMSemanticStylePicker_layoutSubviews__block_invoke;
  v53[3] = &unk_1EA32C638;
  v26 = v23;
  v54 = v26;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v53);

  -[CAMSemanticStylePicker _spacerViews](self, "_spacerViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v25;
  v45[1] = 3221225472;
  v45[2] = __40__CAMSemanticStylePicker_layoutSubviews__block_invoke_2;
  v45[3] = &unk_1EA32C660;
  v47 = v43;
  v48 = v10;
  v45[4] = self;
  v46 = v26;
  v49 = v42;
  v50 = v41;
  v51 = v6;
  v52 = v8;
  v44 = v26;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v45);

  -[CAMSemanticStylePicker pageControl](self, "pageControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "numberOfPages");

  if (-[CAMSemanticStylePicker pageControlMaxNumberOfDots](self, "pageControlMaxNumberOfDots") >= 1)
  {
    v30 = -[CAMSemanticStylePicker pageControlMaxNumberOfDots](self, "pageControlMaxNumberOfDots");
    if (v29 >= v30)
      v29 = v30;
  }
  -[CAMSemanticStylePicker pageControl](self, "pageControl");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeForNumberOfPages:", v29);
  v33 = v32;
  v35 = v34;

  -[CAMSemanticStylePicker contentBottomMargin](self, "contentBottomMargin");
  UIPointRoundToViewScale();
  v37 = v36;
  v39 = v38;
  -[CAMSemanticStylePicker pageControl](self, "pageControl");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v37, v39, v33, v35 + 20.0);

  if (-[CAMSemanticStylePicker _needsUpdateContentOffset](self, "_needsUpdateContentOffset"))
  {
    -[CAMSemanticStylePicker _setNeedsUpdateContentOffset:](self, "_setNeedsUpdateContentOffset:", 0);
    -[CAMSemanticStylePicker _updateScrollViewContentOffset](self, "_updateScrollViewContentOffset");
  }
  -[CAMSemanticStylePicker _updateTileAlphas](self, "_updateTileAlphas");
  -[CAMSemanticStylePicker _updateContentScrollInset](self, "_updateContentScrollInset");

}

void __40__CAMSemanticStylePicker_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  objc_msgSend(v5, "setFrame:");

}

void __40__CAMSemanticStylePicker_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxX;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v5 = *(void **)(a1 + 32);
  v31 = a2;
  objc_msgSend(v5, "_spacerViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;

  v8 = v7 == a3 || a3 == 0;
  v9 = 56;
  if (v8)
    v9 = 48;
  v10 = *(double *)(a1 + v9);
  v11 = *(void **)(a1 + 40);
  if (v7 == a3)
  {
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGRectValue");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v32.origin.x = v14;
    v32.origin.y = v16;
    v32.size.width = v18;
    v32.size.height = v20;
    MaxX = CGRectGetMaxX(v32);
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGRectValue");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v33.origin.x = v24;
    v33.origin.y = v26;
    v33.size.width = v28;
    v33.size.height = v30;
    MaxX = CGRectGetMinX(v33) - v10;
  }
  objc_msgSend(v31, "setFrame:", MaxX, 0.0, v10, *(double *)(a1 + 88));

}

- (void)_updateTileAlphas
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[CAMSemanticStylePicker _tileViews](self, "_tileViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v8, "frame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        objc_msgSend(v8, "superview");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMSemanticStylePicker convertRect:fromView:](self, "convertRect:fromView:", v17, v10, v12, v14, v16);
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;

        -[CAMSemanticStylePicker bounds](self, "bounds");
        v37.origin.x = v26;
        v37.origin.y = v27;
        v37.size.width = v28;
        v37.size.height = v29;
        v36.origin.x = v19;
        v36.origin.y = v21;
        v36.size.width = v23;
        v36.size.height = v25;
        CGRectIntersection(v36, v37);
        CEKProgressClamped();
        CEKInterpolate();
        objc_msgSend(v8, "setTileAlpha:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  unint64_t v5;
  id v6;

  if (-[CAMSemanticStylePicker _isScrollActive](self, "_isScrollActive", a3))
  {
    -[CAMSemanticStylePicker _fractionalIndexForContentOffset](self, "_fractionalIndexForContentOffset");
    v5 = llround(v4);
    if (v5 != -[CAMSemanticStylePicker selectedStyleIndex](self, "selectedStyleIndex")
      && v5 < -[CAMSemanticStylePicker numberOfStyles](self, "numberOfStyles"))
    {
      -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", v5, 1, 0, 0);
    }
  }
  if (-[CAMSemanticStylePicker _selectedTileExpanded](self, "_selectedTileExpanded"))
    -[CAMSemanticStylePicker setNeedsLayout](self, "setNeedsLayout");
  -[CAMSemanticStylePicker _updateTileAlphas](self, "_updateTileAlphas");
  -[CAMSemanticStylePicker delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "semanticStylePickerDidScroll:", self);

}

- (void)_prepareHaptics
{
  id v2;

  -[CAMSemanticStylePicker _feedbackController](self, "_feedbackController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareDiscreteFeedback:", 0);

}

- (void)_performHaptics
{
  id v2;

  -[CAMSemanticStylePicker _feedbackController](self, "_feedbackController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDiscreteFeedback:", 0);

}

- (void)_handlePageControlValueChanged:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CAMSemanticStylePicker _performHaptics](self, "_performHaptics");
  -[CAMSemanticStylePicker _prepareHaptics](self, "_prepareHaptics");
  v5 = objc_msgSend(v4, "interactionState");

  -[CAMSemanticStylePicker pageControl](self, "pageControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePicker _setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:](self, "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", objc_msgSend(v6, "currentPage"), 1, 1, v5 == 1);

}

- (unint64_t)selectedStyleIndex
{
  return self->_selectedStyleIndex;
}

- (unint64_t)numberOfStyles
{
  return self->_numberOfStyles;
}

- (BOOL)hidesSelfWhenNotExpanded
{
  return self->_hidesSelfWhenNotExpanded;
}

- (void)setHidesSelfWhenNotExpanded:(BOOL)a3
{
  self->_hidesSelfWhenNotExpanded = a3;
}

- (int64_t)material
{
  return self->_material;
}

- (double)spacerWidth
{
  return self->_spacerWidth;
}

- (UIColor)materialColor
{
  return self->_materialColor;
}

- (CAMSemanticStylePickerDelegate)delegate
{
  return (CAMSemanticStylePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (int64_t)pageControlMaxNumberOfDots
{
  return self->_pageControlMaxNumberOfDots;
}

- (unint64_t)minimumScrollablePageIndex
{
  return self->_minimumScrollablePageIndex;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (NSMutableArray)_tileViews
{
  return self->__tileViews;
}

- (NSMutableArray)_spacerViews
{
  return self->__spacerViews;
}

- (BOOL)_selectedTileExpanded
{
  return self->__selectedTileExpanded;
}

- (unint64_t)_expansionAnimationCounter
{
  return self->__expansionAnimationCounter;
}

- (void)_setExpandedAnimationCounter:(unint64_t)a3
{
  self->__expansionAnimationCounter = a3;
}

- (BOOL)_needsUpdateContentOffset
{
  return self->__needsUpdateContentOffset;
}

- (void)_setNeedsUpdateContentOffset:(BOOL)a3
{
  self->__needsUpdateContentOffset = a3;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__spacerViews, 0);
  objc_storeStrong((id *)&self->__tileViews, 0);
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
