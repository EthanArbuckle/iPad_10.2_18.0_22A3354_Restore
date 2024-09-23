@implementation AVTCollapsibleHeaderController

- (AVTCollapsibleHeaderController)initWithScrollView:(id)a3 headerView:(id)a4 minHeight:(double)a5 maxHeight:(double)a6
{
  id v11;
  id v12;
  AVTCollapsibleHeaderController *v13;
  AVTCollapsibleHeaderController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AVTCollapsibleHeaderController;
  v13 = -[AVTCollapsibleHeaderController init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_shouldResizeHeaderForScrolling = 1;
    v13->_minHeight = a5;
    v13->_maxHeight = a6;
    v13->_scrollToCompressionMultiplier = 1.0;
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "setFrame:");
    objc_storeStrong((id *)&v14->_headerView, a4);
    objc_storeStrong((id *)&v14->_scrollView, a3);
    objc_msgSend(v11, "contentInset");
    -[AVTCollapsibleHeaderController updatedScrollViewInsetsFromExistingInsets:](v14, "updatedScrollViewInsetsFromExistingInsets:");
    v16 = v15;
    -[UIScrollView setContentInset:](v14->_scrollView, "setContentInset:");
    objc_msgSend(v11, "verticalScrollIndicatorInsets");
    -[UIScrollView setScrollIndicatorInsets:](v14->_scrollView, "setScrollIndicatorInsets:", v16);
    objc_msgSend(v11, "contentOffset");
    v18 = v17;
    objc_msgSend(v11, "_effectiveContentInset");
    -[UIScrollView setContentOffset:](v14->_scrollView, "setContentOffset:", v18, -v19);
    objc_msgSend(v11, "contentOffset");
    v14->_previousOffset = v20;
    objc_msgSend(v11, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_scrollViewDelegate, v21);

    objc_msgSend(v11, "setDelegate:", v14);
  }

  return v14;
}

- (void)setAdditionalTopContentInset:(double)a3
{
  if (self->_additionalTopContentInset != a3)
  {
    self->_additionalTopContentInset = a3;
    -[AVTCollapsibleHeaderController updateInsetsIfNeeded](self, "updateInsetsIfNeeded");
  }
}

- (void)updateMinHeight:(double)a3 maxHeight:(double)a4 animated:(BOOL)a5
{
  double v8;
  double v9;

  -[AVTCollapsibleHeaderController minHeight](self, "minHeight", a5);
  if (v8 != a3 || (-[AVTCollapsibleHeaderController maxHeight](self, "maxHeight"), v9 != a4))
  {
    -[AVTCollapsibleHeaderController setMinHeight:](self, "setMinHeight:", a3);
    -[AVTCollapsibleHeaderController setMaxHeight:](self, "setMaxHeight:", a4);
  }
}

- (void)expandAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");

  if (-[AVTCollapsibleHeaderController shouldPushContentOffsetOnExpandOrCollapse](self, "shouldPushContentOffsetOnExpandOrCollapse"))
  {
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
    -[AVTCollapsibleHeaderController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");

  }
  -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v3);
}

- (void)expandAnimated:(BOOL)a3 withFocusRect:(CGRect)a4 standardItemHeight:(double)a5
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v9;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double MinY;
  void *v33;
  void *v34;
  double MaxY;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double height;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");

  if (-[AVTCollapsibleHeaderController shouldPushContentOffsetOnExpandOrCollapse](self, "shouldPushContentOffsetOnExpandOrCollapse"))
  {
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
    -[AVTCollapsibleHeaderController headerView](self, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");

  }
  else
  {
    v38 = a5;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v14 = x;
    v15 = y;
    v16 = width;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_effectiveContentInset");
    v27 = v20 + v26;

    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_effectiveContentInset");
    v30 = v24 - v29;

    v39 = v27;
    v41.origin.x = v18;
    v41.origin.y = v27;
    v31 = v30;
    v41.size.width = v22;
    v41.size.height = v30;
    v49.origin.x = v14;
    v49.origin.y = v15;
    v49.size.width = v16;
    v49.size.height = height;
    if (!CGRectContainsRect(v41, v49))
    {
      v42.origin.x = v14;
      v42.origin.y = v15;
      v42.size.width = v16;
      v42.size.height = height + v38;
      MinY = CGRectGetMinY(v42);
      v43.origin.y = v39;
      v43.origin.x = v18;
      v43.size.width = v22;
      v43.size.height = v31;
      if (MinY >= CGRectGetMinY(v43))
      {
        v45.origin.y = v39;
        v45.origin.x = v18;
        v45.size.width = v22;
        v45.size.height = v31;
        MaxY = CGRectGetMaxY(v45);
        v46.origin.x = v14;
        v46.origin.y = v15;
        v46.size.width = v16;
        v46.size.height = height + v38;
        if (MaxY < CGRectGetMaxY(v46))
        {
          v47.origin.x = v14;
          v47.origin.y = v15;
          v47.size.width = v16;
          v47.size.height = height + v38;
          CGRectGetMaxY(v47);
          v48.origin.y = v39;
          v48.origin.x = v18;
          v48.size.width = v22;
          v48.size.height = v31;
          CGRectGetMaxY(v48);
          -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "contentSize");
          -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "bounds");

        }
      }
      else
      {
        -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_effectiveContentInset");
        v44.origin.x = v14;
        v44.origin.y = v15;
        v44.size.width = v16;
        v44.size.height = height + v38;
        CGRectGetMinY(v44);

        -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_effectiveContentInset");

      }
    }
  }
  -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v9);
}

- (void)collapseAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");

  if (-[AVTCollapsibleHeaderController shouldPushContentOffsetOnExpandOrCollapse](self, "shouldPushContentOffsetOnExpandOrCollapse"))
  {
    -[AVTCollapsibleHeaderController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[AVTCollapsibleHeaderController minHeight](self, "minHeight");

  }
  -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
  -[AVTCollapsibleHeaderController updateHeaderForHeight:withOffset:animated:](self, "updateHeaderForHeight:withOffset:animated:", v3);
}

- (void)snapToMinMaxIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  void *v7;
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

  v3 = a3;
  if (-[AVTCollapsibleHeaderController shouldSnapToMinOrMax](self, "shouldSnapToMinOrMax"))
  {
    -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
    v6 = v5;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentOffset");
    v9 = v8;

    -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
    if (v6 != v10)
    {
      -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
      if (v6 != v11)
      {
        -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
        if (v9 >= -v12
          && (-[AVTCollapsibleHeaderController minHeight](self, "minHeight"),
              v14 = v6 - v13,
              -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight"),
              v16 = v15,
              -[AVTCollapsibleHeaderController minHeight](self, "minHeight"),
              v14 <= (v16 - v17) * 0.5))
        {
          -[AVTCollapsibleHeaderController collapseAnimated:](self, "collapseAnimated:", v3);
        }
        else
        {
          -[AVTCollapsibleHeaderController expandAnimated:](self, "expandAnimated:", v3);
        }
      }
    }
  }
}

- (void)updateHeaderForHeight:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AVTCollapsibleHeaderController *v17;
  double v18;
  _QWORD v19[8];

  v5 = a5;
  y = a4.y;
  x = a4.x;
  -[AVTCollapsibleHeaderController setShouldResizeHeaderForScrolling:](self, "setShouldResizeHeaderForScrolling:", 0);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_animationDidUpdateWithDisplayLink_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99748]);

  v12 = (void *)MEMORY[0x1E0CEABB0];
  if (v5)
    v13 = 0.3;
  else
    v13 = 0.0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke;
  v19[3] = &unk_1EA51D278;
  v19[4] = self;
  *(double *)&v19[5] = a3;
  *(CGFloat *)&v19[6] = x;
  *(CGFloat *)&v19[7] = y;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke_2;
  v15[3] = &unk_1EA51D2A0;
  v16 = v10;
  v17 = self;
  v18 = a3;
  v14 = v10;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 1, v19, v15, v13, 0.0);

}

void __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collapsibleHeaderController:willUpdateHeaderToHeight:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "updateHeaderSizeForGlobalHeaderHeight:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));

}

uint64_t __76__AVTCollapsibleHeaderController_updateHeaderForHeight_withOffset_animated___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collapsibleHeaderController:didUpdateHeaderToHeight:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

    }
    objc_msgSend(*(id *)(a1 + 40), "setSingleTouchOffset:", 0.0);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentScrollDirection:", 0);
    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentOffset");
    objc_msgSend(*(id *)(a1 + 40), "setPreviousOffset:", v9);

    return objc_msgSend(*(id *)(a1 + 40), "setShouldResizeHeaderForScrolling:", 1);
  }
  return result;
}

- (void)animationDidUpdateWithDisplayLink:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[AVTCollapsibleHeaderController headerView](self, "headerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "presentationLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bounds");
  v7 = v6;
  -[AVTCollapsibleHeaderController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collapsibleHeaderController:isUpdatingHeaderWithIncrementalHeight:", self, v7);

  }
}

- (void)scrollToTopPreservingHeaderHeight:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a4;
  if (a3)
  {
    -[AVTCollapsibleHeaderController setShouldResizeHeaderForScrolling:](self, "setShouldResizeHeaderForScrolling:", 0);
    -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
    -[AVTCollapsibleHeaderController topContentOffsetWithHeaderHeight:](self, "topContentOffsetWithHeaderHeight:");
    v7 = v6;
    v9 = v8;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentOffset:animated:", v4, v7, v9);

    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentOffset");
    -[AVTCollapsibleHeaderController setPreviousOffset:](self, "setPreviousOffset:", v12);

    -[AVTCollapsibleHeaderController setShouldResizeHeaderForScrolling:](self, "setShouldResizeHeaderForScrolling:", 1);
  }
  else
  {
    -[AVTCollapsibleHeaderController scrollToTopAnimated:](self, "scrollToTopAnimated:", a4);
  }
}

- (CGPoint)topContentOffsetWithHeaderHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_effectiveContentInset");
  v10 = v9;
  -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
  v12 = v11 - a3 - v10;

  v13 = v7;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v3 = a3;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_effectiveContentInset");
  objc_msgSend(v10, "setContentOffset:animated:", v3, v7, -v9);

}

- (BOOL)shouldResizeGivenMarginalScrollDistancesForScrollDirection:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;

  if (a3 != 2)
    return a3 == 1
        && ((-[AVTCollapsibleHeaderController singleTouchOffset](self, "singleTouchOffset"), v4 >= 0.0)
          ? (v5 = v4)
          : (v5 = -v4),
            -[AVTCollapsibleHeaderController expandMarginalScrollDistance](self, "expandMarginalScrollDistance"),
            v5 > v6);
  -[AVTCollapsibleHeaderController singleTouchOffset](self, "singleTouchOffset");
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = -v8;
  -[AVTCollapsibleHeaderController collapseMarginalScrollDistance](self, "collapseMarginalScrollDistance");
  return v9 > v10;
}

- (BOOL)shouldResizeGivenScrollDirection:(unint64_t)a3 currentHeaderHeight:(double)a4 targetHeaderHeight:(double)a5
{
  if (a3 == 2 && a5 < a4)
    return 1;
  return a5 > a4 && a3 == 1;
}

- (void)updateHeaderHeightToMatchScrollViewStateForScrollDirection:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  -[AVTCollapsibleHeaderController scrollView](self, "scrollView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  -[AVTCollapsibleHeaderController headerHeightForContentOffset:contentInset:](self, "headerHeightForContentOffset:contentInset:", v8, v10, v11, v12, v13);
  v15 = v14;

  -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
  v17 = v16;
  if (-[AVTCollapsibleHeaderController shouldResizeGivenMarginalScrollDistancesForScrollDirection:](self, "shouldResizeGivenMarginalScrollDistancesForScrollDirection:", a3)&& -[AVTCollapsibleHeaderController shouldResizeGivenScrollDirection:currentHeaderHeight:targetHeaderHeight:](self, "shouldResizeGivenScrollDirection:currentHeaderHeight:targetHeaderHeight:", a3, v17, v15))
  {
    -[AVTCollapsibleHeaderController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[AVTCollapsibleHeaderController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "collapsibleHeaderController:willUpdateHeaderToHeight:", self, v15);

    }
    -[AVTCollapsibleHeaderController updateHeaderSizeForGlobalHeaderHeight:](self, "updateHeaderSizeForGlobalHeaderHeight:", v15);
    -[AVTCollapsibleHeaderController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      -[AVTCollapsibleHeaderController delegate](self, "delegate");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "collapsibleHeaderController:didUpdateHeaderToHeight:", self, v15);

    }
  }
}

- (double)headerHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
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
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double result;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  BOOL v56;
  double v57;
  double v58;
  double v59;
  double v60;

  -[AVTCollapsibleHeaderController scrollView](self, "scrollView", a3, a4.top, a4.left, a4.bottom, a4.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v8 == v11 && v10 == v12)
  {
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
    return result;
  }
  if (-[AVTCollapsibleHeaderController shouldOnlyExpandWhenScrollingAtEdge](self, "shouldOnlyExpandWhenScrollingAtEdge"))
  {
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_effectiveContentInset");
    v16 = v15;
    v17 = -v15;

    -[AVTCollapsibleHeaderController headerView](self, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v20 - v22;

    v24 = -a3;
    if (v17 > a3)
      v24 = v16;
    v60 = v24;
    -[AVTCollapsibleHeaderController additionalTopContentInset](self, "additionalTopContentInset");
    v26 = v25;
    -[AVTCollapsibleHeaderController previousOffset](self, "previousOffset");
    v28 = v27 - a3;
    -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
    v30 = v29;
    -[AVTCollapsibleHeaderController scrollToCompressionMultiplier](self, "scrollToCompressionMultiplier");
    v32 = v31;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "contentSize");
    v35 = v34;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    if (v35 - (v37 - v23) > a3)
    {

      goto LABEL_18;
    }
    if (v28 <= 0.0)
    {
      v56 = -[AVTCollapsibleHeaderController shouldCollapseOnBottomBounceScroll](self, "shouldCollapseOnBottomBounceScroll");

      if (v56)
      {
LABEL_18:
        if (v17 <= a3)
        {
          -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
          if (v30 + v28 / v32 >= v58)
            v59 = v30 + v28 / v32;
          else
            v59 = v58;
          if (v60 - v23 - v26 >= v58)
            v58 = v60 - v23 - v26;
          if (v28 > 0.0)
            v55 = v58;
          else
            v55 = v59;
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {

    }
    -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
    goto LABEL_21;
  }
  -[AVTCollapsibleHeaderController previousOffset](self, "previousOffset");
  v41 = v40;
  -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
  v43 = v42;
  -[AVTCollapsibleHeaderController scrollToCompressionMultiplier](self, "scrollToCompressionMultiplier");
  v45 = v44;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_effectiveContentInset");
  v48 = v47;

  -[AVTCollapsibleHeaderController currentHeightForHeader](self, "currentHeightForHeader");
  v50 = v49;
  -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
  v52 = v50 - v51;
  -[AVTCollapsibleHeaderController scrollToCompressionMultiplier](self, "scrollToCompressionMultiplier");
  if (v52 * v53 + a3 < a3)
  {
    -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
LABEL_21:
    v55 = v54;
    goto LABEL_22;
  }
  v38 = -v48;
  if (-v48 > a3)
  {
LABEL_19:
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight", v38);
    goto LABEL_21;
  }
  v55 = v43 + (v41 - a3) / v45;
LABEL_22:
  -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
  if (v57 >= v55)
    v55 = v57;
  -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
  if (result >= v55)
    return v55;
  return result;
}

- (void)updateHeaderSizeForGlobalHeaderHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[AVTCollapsibleHeaderController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AVTCollapsibleHeaderController headerView](self, "headerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v7, v9, v11, a3);

}

- (double)currentHeightForHeader
{
  void *v2;
  double v3;
  double v4;

  -[AVTCollapsibleHeaderController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)updatedScrollViewInsetsFromExistingInsets:(UIEdgeInsets)a3
{
  CGFloat bottom;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
  UIEdgeInsets result;

  bottom = a3.bottom;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView", a3.top, a3.left, a3.bottom, a3.right);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_systemContentInset");
  v7 = v6;

  v8 = 0.0;
  if (v7 > 0.0)
  {
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_systemContentInset");
    v11 = v10;
    -[AVTCollapsibleHeaderController headerView](self, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v8 = v11 - (v14 - v16);

  }
  -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
  v18 = v17;
  -[AVTCollapsibleHeaderController additionalTopContentInset](self, "additionalTopContentInset");
  v20 = v18 + v19 - v8;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentInset");
  v23 = v22;
  v25 = v24;

  v26 = v20;
  v27 = v23;
  v28 = bottom;
  v29 = v25;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)updateInsetsIfNeeded
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;

  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AVTCollapsibleHeaderController updatedScrollViewInsetsFromExistingInsets:](self, "updatedScrollViewInsetsFromExistingInsets:", v5, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "verticalScrollIndicatorInsets");
  v31 = v22;
  v32 = v21;
  v30 = v23;

  if (v15 != v7 || v13 != v5 || v19 != v11 || v17 != v9)
  {
    -[AVTCollapsibleHeaderController previousOffset](self, "previousOffset");
    -[AVTCollapsibleHeaderController setPreviousOffset:](self, "setPreviousOffset:", v5 - v13 + v27);
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentInset:", v13, v15, v17, v19);

    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setScrollIndicatorInsets:", v13, v32, v31, v30);

  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTCollapsibleHeaderController;
  if (-[AVTCollapsibleHeaderController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTCollapsibleHeaderController;
  -[AVTCollapsibleHeaderController methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  objc_super v9;

  -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTCollapsibleHeaderController;
    -[AVTCollapsibleHeaderController forwardingTargetForSelector:](&v9, sel_forwardingTargetForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  char v23;
  void *v24;
  id v25;

  v25 = a3;
  if (-[AVTCollapsibleHeaderController shouldResizeHeaderForScrolling](self, "shouldResizeHeaderForScrolling"))
  {
    -[AVTCollapsibleHeaderController updateInsetsIfNeeded](self, "updateInsetsIfNeeded");
    -[AVTCollapsibleHeaderController previousOffset](self, "previousOffset");
    v5 = v4;
    v6 = v25;
    objc_msgSend(v6, "_verticalVelocity");
    if (v7 == 0.0)
    {
      objc_msgSend(v6, "contentOffset");
      v9 = v8;

      v10 = v5 - v9;
      v11 = 2;
      if (v5 - v9 >= 0.0)
        v11 = 1;
      if (v5 - v9 == 0.0)
        v12 = 0;
      else
        v12 = v11;
    }
    else
    {
      objc_msgSend(v6, "_verticalVelocity");
      v14 = v13;

      if (v14 <= 0.0)
        v12 = 1;
      else
        v12 = 2;
    }
    if (-[AVTCollapsibleHeaderController currentScrollDirection](self, "currentScrollDirection", v10) != v12)
    {
      -[AVTCollapsibleHeaderController setSingleTouchOffset:](self, "setSingleTouchOffset:", 0.0);
      -[AVTCollapsibleHeaderController setCurrentScrollDirection:](self, "setCurrentScrollDirection:", v12);
    }
    -[AVTCollapsibleHeaderController singleTouchOffset](self, "singleTouchOffset");
    v16 = v15;
    -[AVTCollapsibleHeaderController previousOffset](self, "previousOffset");
    v18 = v17;
    -[AVTCollapsibleHeaderController scrollView](self, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentOffset");
    -[AVTCollapsibleHeaderController setSingleTouchOffset:](self, "setSingleTouchOffset:", v16 + v18 - v20);

    -[AVTCollapsibleHeaderController updateHeaderHeightToMatchScrollViewStateForScrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewStateForScrollDirection:animated:", v12, 1);
    objc_msgSend(v6, "contentOffset");
    -[AVTCollapsibleHeaderController setPreviousOffset:](self, "setPreviousOffset:", v21);
  }
  -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scrollViewDidScroll:", v25);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  char v27;
  void *v28;
  id v29;

  y = a4.y;
  x = a4.x;
  v29 = a3;
  if (-[AVTCollapsibleHeaderController shouldResizeHeaderForScrolling](self, "shouldResizeHeaderForScrolling")
    && -[AVTCollapsibleHeaderController shouldSnapToMinOrMax](self, "shouldSnapToMinOrMax")
    && a5->y < 0.0)
  {
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
    v10 = v9 - a5->y;
    objc_msgSend(v29, "_effectiveContentInset");
    v12 = v10 - v11;
    if (y > 0.0)
    {
      -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
      if (v12 <= v13)
      {
LABEL_15:
        -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
        v24 = v23 - v12;
        objc_msgSend(v29, "_effectiveContentInset");
        a5->y = v24 - v25;
        goto LABEL_16;
      }
      goto LABEL_6;
    }
    if (y >= 0.0)
    {
      -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
      if (v12 <= v16)
        goto LABEL_15;
      -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
      if (v12 >= v17)
        goto LABEL_15;
      -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
      v19 = v12 - v18;
      -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
      v21 = v20;
      -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
      if (v19 < (v21 - v22) * 0.5)
      {
LABEL_6:
        -[AVTCollapsibleHeaderController minHeight](self, "minHeight");
LABEL_14:
        v12 = v14;
        goto LABEL_15;
      }
    }
    else
    {
      -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
      if (v12 >= v15)
        goto LABEL_15;
    }
    -[AVTCollapsibleHeaderController maxHeight](self, "maxHeight");
    goto LABEL_14;
  }
LABEL_16:
  -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v29, a5, x, y);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (!v4)
  {
    -[AVTCollapsibleHeaderController snapToMinMaxIfNeededAnimated:](self, "snapToMinMaxIfNeededAnimated:", 1);
    -[AVTCollapsibleHeaderController setSingleTouchOffset:](self, "setSingleTouchOffset:", 0.0);
    -[AVTCollapsibleHeaderController setCurrentScrollDirection:](self, "setCurrentScrollDirection:", 0);
  }
  -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollViewDidEndDragging:willDecelerate:", v9, v4);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isDragging") & 1) == 0)
  {
    -[AVTCollapsibleHeaderController setSingleTouchOffset:](self, "setSingleTouchOffset:", 0.0);
    -[AVTCollapsibleHeaderController setCurrentScrollDirection:](self, "setCurrentScrollDirection:", 0);
  }
  -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTCollapsibleHeaderController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidEndDecelerating:", v7);

  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (AVTCollapsibleHeaderControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVTCollapsibleHeaderControllerDelegate *)a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (double)additionalTopContentInset
{
  return self->_additionalTopContentInset;
}

- (BOOL)shouldResizeHeaderForScrolling
{
  return self->_shouldResizeHeaderForScrolling;
}

- (void)setShouldResizeHeaderForScrolling:(BOOL)a3
{
  self->_shouldResizeHeaderForScrolling = a3;
}

- (BOOL)shouldSnapToMinOrMax
{
  return self->_shouldSnapToMinOrMax;
}

- (void)setShouldSnapToMinOrMax:(BOOL)a3
{
  self->_shouldSnapToMinOrMax = a3;
}

- (BOOL)shouldOnlyExpandWhenScrollingAtEdge
{
  return self->_shouldOnlyExpandWhenScrollingAtEdge;
}

- (void)setShouldOnlyExpandWhenScrollingAtEdge:(BOOL)a3
{
  self->_shouldOnlyExpandWhenScrollingAtEdge = a3;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (double)scrollToCompressionMultiplier
{
  return self->_scrollToCompressionMultiplier;
}

- (void)setScrollToCompressionMultiplier:(double)a3
{
  self->_scrollToCompressionMultiplier = a3;
}

- (double)expandMarginalScrollDistance
{
  return self->_expandMarginalScrollDistance;
}

- (void)setExpandMarginalScrollDistance:(double)a3
{
  self->_expandMarginalScrollDistance = a3;
}

- (double)collapseMarginalScrollDistance
{
  return self->_collapseMarginalScrollDistance;
}

- (void)setCollapseMarginalScrollDistance:(double)a3
{
  self->_collapseMarginalScrollDistance = a3;
}

- (BOOL)shouldPushContentOffsetOnExpandOrCollapse
{
  return self->_shouldPushContentOffsetOnExpandOrCollapse;
}

- (void)setShouldPushContentOffsetOnExpandOrCollapse:(BOOL)a3
{
  self->_shouldPushContentOffsetOnExpandOrCollapse = a3;
}

- (BOOL)shouldCollapseOnBottomBounceScroll
{
  return self->_shouldCollapseOnBottomBounceScroll;
}

- (void)setShouldCollapseOnBottomBounceScroll:(BOOL)a3
{
  self->_shouldCollapseOnBottomBounceScroll = a3;
}

- (double)previousOffset
{
  return self->_previousOffset;
}

- (void)setPreviousOffset:(double)a3
{
  self->_previousOffset = a3;
}

- (double)singleTouchOffset
{
  return self->_singleTouchOffset;
}

- (void)setSingleTouchOffset:(double)a3
{
  self->_singleTouchOffset = a3;
}

- (unint64_t)currentScrollDirection
{
  return self->_currentScrollDirection;
}

- (void)setCurrentScrollDirection:(unint64_t)a3
{
  self->_currentScrollDirection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
