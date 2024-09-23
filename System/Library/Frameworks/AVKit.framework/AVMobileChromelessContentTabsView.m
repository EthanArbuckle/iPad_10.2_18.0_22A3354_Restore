@implementation AVMobileChromelessContentTabsView

- (AVMobileChromelessContentTabsView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileChromelessContentTabsView *v6;
  AVMobileChromelessContentTabsView *v7;
  NSArray *v8;
  NSArray *contentTabs;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessContentTabsView;
  v6 = -[AVView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    contentTabs = v7->_contentTabs;
    v7->_contentTabs = v8;

    -[AVMobileChromelessContentTabsView setInsetsLayoutMarginsFromSafeArea:](v7, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }

  return v7;
}

- (void)setContentTabs:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_contentTabs != v5)
  {
    objc_storeStrong((id *)&self->_contentTabs, a3);
    -[AVMobileChromelessContentTabsView _setupContentTabSelectionViewIfNeeded]((uint64_t)self);
    -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
    -[AVMobileContentTabSelectionView setContentTabs:](self->_contentTabSelectionView, "setContentTabs:", v5);
    -[AVMobileChromelessContentTabsContentView setContentTabs:](self->_contentView, "setContentTabs:", v5);
  }

}

- (void)setContentViewDelegate:(id)a3
{
  UIScrollViewDelegate **p_contentViewDelegate;
  id WeakRetained;
  void *v6;
  AVMobileChromelessContentTabsContentView *contentView;
  void *v8;
  id v9;
  id obj;

  obj = a3;
  p_contentViewDelegate = &self->_contentViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_contentViewDelegate, obj);
    -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
    v6 = obj;
    contentView = self->_contentView;
    if (contentView)
    {
      -[AVMobileChromelessContentTabsContentView scrollView](contentView, "scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)p_contentViewDelegate);
      objc_msgSend(v8, "setDelegate:", v9);

      v6 = obj;
    }
  }

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessContentTabsView;
  if (-[AVMobileChromelessContentTabsView isUserInteractionEnabled](&v6, sel_isUserInteractionEnabled) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessContentTabsView;
    -[AVMobileChromelessContentTabsView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_, v3);
    -[AVMobileChromelessContentTabsView _updateContentTabsUserInteractionEnabledStateIfNeeded]((id *)&self->super.super.super.super.isa);
  }
}

- (void)setFadeDistance:(double)a3
{
  if (self->_fadeDistance != a3)
  {
    self->_fadeDistance = a3;
    -[AVMobileChromelessContentTabsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransitionState:(AVMobileChromelessContentTabsTransitionState *)a3
{
  AVMobileChromelessContentTabsTransitionState *p_transitionState;
  AVMobileContentTab *v6;
  AVMobileContentTab *v7;
  unint64_t transitionReason;
  AVMobileContentTab *v9;
  AVMobileContentTab *v10;
  AVMobileContentTab *v11;
  BOOL v12;
  AVMobileContentTab *v13;

  p_transitionState = &self->_transitionState;
  objc_storeStrong((id *)&self->_transitionState.activeContentTab, a3->activeContentTab);
  objc_storeStrong((id *)&p_transitionState->upcomingContentTab, a3->upcomingContentTab);
  *(_OWORD *)&p_transitionState->transitionState = *(_OWORD *)&a3->transitionState;
  v6 = p_transitionState->activeContentTab;
  v7 = p_transitionState->upcomingContentTab;
  transitionReason = p_transitionState->transitionReason;
  v9 = v6;
  v10 = v7;
  v11 = v10;
  if (v9)
    v12 = 1;
  else
    v12 = v10 == 0;
  v13 = v9;
  if (!v12)
    v13 = v10;
  -[AVMobileChromelessContentTabsContentView setUpcomingContentTab:](self->_contentView, "setUpcomingContentTab:", v11);
  -[AVMobileChromelessContentTabsContentView setActiveTabContentTab:withChangingReason:](self->_contentView, "setActiveTabContentTab:withChangingReason:", v13, transitionReason);
  if (v13)
    -[AVMobileContentTabSelectionView selectTab:withReason:](self->_contentTabSelectionView, "selectTab:withReason:", v13, 2);

}

- (AVMobileContentTab)selectedContentTab
{
  return -[AVMobileContentTabSelectionView selectedTab](self->_contentTabSelectionView, "selectedTab");
}

- (void)resetSelection
{
  -[AVMobileContentTabSelectionView resetSelection](self->_contentTabSelectionView, "resetSelection");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVMobileContentTabSelectionView *v5;
  AVMobileContentTabSelectionView *v6;
  int v7;
  void *v8;
  AVMobileContentTabSelectionView *v9;
  AVMobileContentTabSelectionView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVMobileChromelessContentTabsView;
  -[AVView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVMobileContentTabSelectionView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self->_contentTabSelectionView)
    v7 = 1;
  else
    v7 = -[AVMobileContentTabSelectionView isDescendantOfView:](v5, "isDescendantOfView:");
  -[AVMobileChromelessContentTabsContentView scrollView](self->_contentView, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isTracking") & 1) == 0 && (objc_msgSend(v8, "isDragging") & 1) == 0)
    v7 &= objc_msgSend(v8, "isDecelerating");
  if (v7)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMobileContentTabSelectionView intrinsicContentSize](self->_contentTabSelectionView, "intrinsicContentSize");
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)layoutMarginsDidChange
{
  AVMobileContentTabSelectionView *contentTabSelectionView;
  AVMobileChromelessContentTabsContentView *contentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsView;
  -[AVMobileChromelessContentTabsView layoutMarginsDidChange](&v5, sel_layoutMarginsDidChange);
  contentTabSelectionView = self->_contentTabSelectionView;
  -[AVMobileChromelessContentTabsView layoutMargins](self, "layoutMargins");
  -[AVMobileContentTabSelectionView setLayoutMargins:](contentTabSelectionView, "setLayoutMargins:");
  contentView = self->_contentView;
  -[AVMobileChromelessContentTabsView layoutMargins](self, "layoutMargins");
  -[AVMobileChromelessContentTabsContentView setLayoutMargins:](contentView, "setLayoutMargins:");
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
  uint64_t v10;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AVMobileChromelessContentTabsView;
  -[AVView layoutSubviews](&v22, sel_layoutSubviews);
  -[AVMobileChromelessContentTabsContentView setNeedsLayout](self->_contentView, "setNeedsLayout");
  -[AVMobileChromelessContentTabsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[AVMobileContentTabSelectionView intrinsicContentSize](self->_contentTabSelectionView, "intrinsicContentSize");
  v8 = v7;
  if (v6 >= v7
    && (v9 = v6 - v7,
        -[AVMobileContentTabSelectionView setFrame:](self->_contentTabSelectionView, "setFrame:", 0.0, 0.0, v4, v7),
        v9 > 0.0))
  {
    -[AVMobileContentTabSelectionView frame](self->_contentTabSelectionView, "frame");
    v12 = v11;
    -[AVMobileChromelessContentTabsView fadeDistance](self, "fadeDistance");
    v14 = v13 + v12;
    -[AVMobileChromelessContentTabsView bounds](self, "bounds");
    if (v15 <= v16)
      v17 = 16.0;
    else
      v17 = 14.0;
    v18 = v14 + v17;
    -[AVMobileChromelessContentTabsView bounds](self, "bounds");
    if (v19 <= v20)
      v21 = 16.0;
    else
      v21 = 14.0;
    -[AVMobileChromelessContentTabsContentView setFrame:](self->_contentView, "setFrame:", 0.0, v18, v4, v9 - v21);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  -[AVMobileContentTabSelectionView setHidden:](self->_contentTabSelectionView, "setHidden:", v6 < v8);
  -[AVView setHidden:](self->_contentView, "setHidden:", v10);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessContentTabsView;
  -[AVMobileChromelessContentTabsView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
  -[AVMobileChromelessContentTabsView _setupContentTabSelectionViewIfNeeded]((uint64_t)self);
  -[AVMobileChromelessContentTabsView _updateContentTabsUserInteractionEnabledStateIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  void *v4;

  if (self->_contentTabSelectionView == a3)
  {
    -[AVMobileChromelessContentTabsView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    -[AVMobileChromelessContentTabsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)contentTabSelectionView:(id)a3 didChangeSelectedTabTo:(id)a4 withReason:(unint64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[AVMobileChromelessContentTabsView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AVMobileChromelessContentTabsView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentTabsView:didChangeContentTab:withReason:", self, v10, a5);

  }
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (UIScrollViewDelegate)contentViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_contentViewDelegate);
}

- (double)fadeDistance
{
  return self->_fadeDistance;
}

- (AVMobileChromelessContentTabsViewDelegate)delegate
{
  return (AVMobileChromelessContentTabsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVMobileChromelessContentTabsTransitionState)transitionState
{
  AVMobileChromelessContentTabsTransitionState *p_transitionState;
  AVMobileChromelessContentTabsTransitionState *result;

  p_transitionState = &self->_transitionState;
  retstr->activeContentTab = self->_transitionState.activeContentTab;
  result = p_transitionState->upcomingContentTab;
  retstr->upcomingContentTab = (AVMobileContentTab *)result;
  *(_OWORD *)&retstr->transitionState = *(_OWORD *)&p_transitionState->transitionState;
  return result;
}

- (void).cxx_destruct
{
  AVMobileChromelessContentTabsTransitionState *p_transitionState;

  p_transitionState = &self->_transitionState;

  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentViewDelegate);
  objc_storeStrong((id *)&self->_contentTabs, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentTabSelectionView, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
}

- (void)_setupContentTabsContentViewIfNeeded
{
  void *v2;
  AVMobileChromelessContentTabsContentView *v3;
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (a1)
  {
    if (!a1[60])
    {
      objc_msgSend(a1, "window");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        v3 = objc_alloc_init(AVMobileChromelessContentTabsContentView);
        v4 = a1[60];
        a1[60] = v3;

        objc_msgSend(a1[60], "scrollView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained(a1 + 62);
        objc_msgSend(v5, "setDelegate:", WeakRetained);

        objc_msgSend(a1, "addSubview:", a1[60]);
      }
    }
    v7 = a1[60];
    if (v7)
    {
      objc_msgSend(v7, "scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(a1[60], "scrollView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_loadWeakRetained(a1 + 62);
        objc_msgSend(v10, "setDelegate:", v9);

      }
    }
  }
}

- (void)_setupContentTabSelectionViewIfNeeded
{
  void *v2;
  AVMobileContentTabSelectionView *v3;
  void *v4;

  if (a1 && !*(_QWORD *)(a1 + 472))
  {
    objc_msgSend((id)a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = -[AVMobileContentTabSelectionView initWithStyleSheet:]([AVMobileContentTabSelectionView alloc], "initWithStyleSheet:", *(_QWORD *)(a1 + 464));
      v4 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v3;

      objc_msgSend(*(id *)(a1 + 472), "setDelegate:", a1);
      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 472));
    }
  }
}

- (id)_updateContentTabsUserInteractionEnabledStateIfNeeded
{
  id *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[60], "setUserInteractionEnabled:", objc_msgSend(result, "isUserInteractionEnabled"));
    return (id *)objc_msgSend(v1[59], "setUserInteractionEnabled:", objc_msgSend(v1, "isUserInteractionEnabled"));
  }
  return result;
}

@end
