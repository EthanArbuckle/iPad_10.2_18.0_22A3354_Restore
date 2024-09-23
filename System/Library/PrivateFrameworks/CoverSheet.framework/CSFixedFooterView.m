@implementation CSFixedFooterView

- (CSFixedFooterView)initWithFrame:(CGRect)a3
{
  CSFixedFooterView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSFixedFooterView;
  v3 = -[CSFixedFooterView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SBFEffectiveHomeButtonType() != 2)
    {
      -[CSFixedFooterView _addShakeView](v3, "_addShakeView");
      -[CSFixedFooterView _addPageControl](v3, "_addPageControl");
    }
    v3->_statusTextViewScale = 1.0;
  }
  return v3;
}

- (id)presentationRegions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:", self->_callToActionShakeView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v5);
  if (self->_statusTextView)
  {
    +[CSRegion regionForCoordinateSpace:](CSRegion, "regionForCoordinateSpace:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "role:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (void)setStatusTextView:(id)a3
{
  SBUILegibility *v5;
  SBUILegibility **p_statusTextView;
  SBUILegibility *statusTextView;
  SBUILegibility *v8;

  v5 = (SBUILegibility *)a3;
  p_statusTextView = &self->_statusTextView;
  statusTextView = self->_statusTextView;
  if (statusTextView != v5)
  {
    v8 = v5;
    -[SBUILegibility removeFromSuperview](statusTextView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusTextView, a3);
    if (*p_statusTextView)
    {
      -[SBUILegibility bs_setHitTestingDisabled:](*p_statusTextView, "bs_setHitTestingDisabled:", 1);
      -[CSFixedFooterView addSubview:](self, "addSubview:", *p_statusTextView);
      -[CSFixedFooterView _updateViewsForLegibilitySettings](self, "_updateViewsForLegibilitySettings");
    }
    -[CSFixedFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setStatusTextViewOffset:(CGPoint)a3
{
  if (self->_statusTextViewOffset.x != a3.x || self->_statusTextViewOffset.y != a3.y)
  {
    self->_statusTextViewOffset = a3;
    -[CSFixedFooterView _layoutStatusTextView](self, "_layoutStatusTextView");
  }
}

- (void)setStatusTextViewScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_statusTextViewScale = a3;
    -[CSFixedFooterView _layoutStatusTextView](self, "_layoutStatusTextView");
  }
}

- (void)setStatusTextViewOffset:(CGPoint)a3 scale:(double)a4
{
  double *p_statusTextViewScale;

  if (self->_statusTextViewOffset.x == a3.x && self->_statusTextViewOffset.y == a3.y)
  {
    p_statusTextViewScale = &self->_statusTextViewScale;
    if ((BSFloatEqualToFloat() & 1) != 0)
      return;
  }
  else
  {
    self->_statusTextViewOffset = a3;
    p_statusTextViewScale = &self->_statusTextViewScale;
    if ((BSFloatEqualToFloat() & 1) != 0)
      goto LABEL_9;
  }
  *p_statusTextViewScale = a4;
LABEL_9:
  -[CSFixedFooterView _layoutStatusTextView](self, "_layoutStatusTextView");
}

- (void)setCallToActionLabel:(id)a3
{
  SBUICallToActionLabel *v5;
  SBUICallToActionLabel **p_callToActionLabel;
  SBUICallToActionLabel *callToActionLabel;
  void *v8;
  SBUICallToActionLabel *v9;

  v5 = (SBUICallToActionLabel *)a3;
  p_callToActionLabel = &self->_callToActionLabel;
  callToActionLabel = self->_callToActionLabel;
  if (callToActionLabel != v5)
  {
    v9 = v5;
    -[SBUICallToActionLabel removeFromSuperview](callToActionLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_callToActionLabel, a3);
    if (*p_callToActionLabel)
    {
      -[SBUICallToActionLabel bs_setHitTestingDisabled:](*p_callToActionLabel, "bs_setHitTestingDisabled:", 1);
      -[CSShakableView containerView](self->_callToActionShakeView, "containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_callToActionLabel);

      -[CSFixedFooterView _updateViewsForLegibilitySettings](self, "_updateViewsForLegibilitySettings");
    }
    -[CSFixedFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setTrackingScrollViewForPageControl:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_trackingScrollViewForPageControl);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_trackingScrollViewForPageControl, obj);
    -[CSFixedFooterView updatePageControl](self, "updatePageControl");
    v5 = obj;
  }

}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSFixedFooterView _updateViewsForLegibilitySettings](self, "_updateViewsForLegibilitySettings");
  }

}

- (void)_addShakeView
{
  CSShakableView *v3;
  CSShakableView *callToActionShakeView;

  v3 = objc_alloc_init(CSShakableView);
  callToActionShakeView = self->_callToActionShakeView;
  self->_callToActionShakeView = v3;

  -[CSShakableView setAutoresizingMask:](self->_callToActionShakeView, "setAutoresizingMask:", 2);
  -[CSFixedFooterView addSubview:](self, "addSubview:", self->_callToActionShakeView);
}

- (void)_addPageControl
{
  CSPageControl *v3;
  CSPageControl *v4;
  CSPageControl *pageControl;

  v3 = [CSPageControl alloc];
  v4 = -[CSPageControl initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  pageControl = self->_pageControl;
  self->_pageControl = v4;

  -[CSPageControl setHidesForSinglePage:](self->_pageControl, "setHidesForSinglePage:", 1);
  -[CSFixedFooterView addSubview:](self, "addSubview:", self->_pageControl);
}

- (void)_layoutCallToActionView
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  SBUICallToActionLabel *callToActionLabel;
  double MaxY;
  double v10;
  double v11;
  double v12;
  SBUICallToActionLabel *v13;
  CGRect v14;

  -[CSFixedFooterView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = (void *)MEMORY[0x1E0DA9DE0];
  callToActionLabel = self->_callToActionLabel;
  MaxY = CGRectGetMaxY(v14);
  -[SBUILegibility frame](self->_statusTextView, "frame");
  v11 = MaxY - v10;
  -[SBUICallToActionLabel baselineOffset](self->_callToActionLabel, "baselineOffset");
  objc_msgSend(v7, "suggestedFrameForCallToActionLabel:yOffset:inBounds:", callToActionLabel, v12 + v11, x, y, width, height);
  -[CSShakableView setFrame:](self->_callToActionShakeView, "setFrame:");
  v13 = self->_callToActionLabel;
  -[CSShakableView bounds](self->_callToActionShakeView, "bounds");
  -[SBUICallToActionLabel setFrame:](v13, "setFrame:");
}

- (void)_layoutStatusTextView
{
  double v3;
  double v4;
  double v5;
  SBUILegibility *statusTextView;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  SBUILegibility *v14;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  -[CSFixedFooterView bounds](self, "bounds");
  v4 = v3;
  +[CSPageControl suggestedFrameForPageBounds:](CSPageControl, "suggestedFrameForPageBounds:");
  objc_msgSend(MEMORY[0x1E0DA9DE0], "suggestedFrameForStatusView:inView:withInsets:", self->_statusTextView, self, 0.0, 0.0, v4 - v5, 0.0);
  statusTextView = self->_statusTextView;
  BSRectWithSize();
  -[SBUILegibility setBounds:](statusTextView, "setBounds:");
  BSRectGetCenter();
  -[SBUILegibility setCenter:](self->_statusTextView, "setCenter:");
  -[CSFixedFooterView statusTextViewOffset](self, "statusTextViewOffset");
  v8 = v7;
  v10 = v9;
  -[CSFixedFooterView statusTextViewScale](self, "statusTextViewScale");
  memset(&v19, 0, sizeof(v19));
  if (BSFloatIsOne()
    && (v8 == *MEMORY[0x1E0C9D538] ? (v11 = v10 == *(double *)(MEMORY[0x1E0C9D538] + 8)) : (v11 = 0), v11))
  {
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v19.c = v13;
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    BSRectGetCenter();
    SBFTransformForScalingAboutPointInSuperview();
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, v8, v10);
    t1 = v19;
    t2 = v18;
    CGAffineTransformConcat(&v17, &t1, &t2);
    *(_OWORD *)&v19.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v19.c = *(_OWORD *)&v17.c;
    v12 = *(_OWORD *)&v17.tx;
  }
  *(_OWORD *)&v19.tx = v12;
  v14 = self->_statusTextView;
  *(_OWORD *)&v18.a = *(_OWORD *)&v19.a;
  *(_OWORD *)&v18.c = *(_OWORD *)&v19.c;
  *(_OWORD *)&v18.tx = v12;
  -[SBUILegibility setTransform:](v14, "setTransform:", &v18);
}

- (void)_layoutPageControl
{
  -[CSPageControl sizeForNumberOfPages:](self->_pageControl, "sizeForNumberOfPages:", -[CSPageControl numberOfPages](self->_pageControl, "numberOfPages"));
  -[CSFixedFooterView bounds](self, "bounds");
  +[CSPageControl suggestedFrameForPageBounds:desiredSize:](CSPageControl, "suggestedFrameForPageBounds:desiredSize:");
  -[CSPageControl setFrame:](self->_pageControl, "setFrame:");
}

- (void)updatePageControl
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CSPageControl *pageControl;
  void *v7;
  id v8;

  -[CSFixedFooterView trackingScrollViewForPageControl](self, "trackingScrollViewForPageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    v4 = objc_msgSend(v3, "visiblePageRange");
    v3 = v8;
    if (v5 == 1)
    {
      pageControl = self->_pageControl;
      objc_msgSend(v8, "pageViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPageControl setNumberOfPages:](pageControl, "setNumberOfPages:", objc_msgSend(v7, "count"));

      -[CSPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v4);
      v3 = v8;
    }
  }

}

- (void)_updateViewsForLegibilitySettings
{
  -[SBUILegibility setLegibilitySettings:](self->_statusTextView, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUICallToActionLabel setLegibilitySettings:](self->_callToActionLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[CSPageControl setLegibilitySettings:](self->_pageControl, "setLegibilitySettings:", self->_legibilitySettings);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterView;
  -[CSFixedFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSFixedFooterView _layoutStatusTextView](self, "_layoutStatusTextView");
  -[CSFixedFooterView _layoutCallToActionView](self, "_layoutCallToActionView");
  -[CSFixedFooterView _layoutPageControl](self, "_layoutPageControl");
}

- (CSShakableView)callToActionShakeView
{
  return self->_callToActionShakeView;
}

- (SBUICallToActionLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (SBUILegibilityLabel)alternateCallToActionLabel
{
  return self->_alternateCallToActionLabel;
}

- (void)setAlternateCallToActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_alternateCallToActionLabel, a3);
}

- (SBUILegibility)statusTextView
{
  return self->_statusTextView;
}

- (CGPoint)statusTextViewOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_statusTextViewOffset.x;
  y = self->_statusTextViewOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)statusTextViewScale
{
  return self->_statusTextViewScale;
}

- (CSPageControl)pageControl
{
  return self->_pageControl;
}

- (SBFPagedScrollView)trackingScrollViewForPageControl
{
  return (SBFPagedScrollView *)objc_loadWeakRetained((id *)&self->_trackingScrollViewForPageControl);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingScrollViewForPageControl);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_statusTextView, 0);
  objc_storeStrong((id *)&self->_alternateCallToActionLabel, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_callToActionShakeView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
