@implementation AVMobileChromelessContentTabsContentView

- (AVMobileChromelessContentTabsContentView)init
{
  AVMobileChromelessContentTabsContentView *v2;
  AVMobileChromelessContentTabsContentView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsContentView;
  v2 = -[AVView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[AVMobileChromelessContentTabsContentView setInsetsLayoutMarginsFromSafeArea:](v2, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[AVMobileChromelessContentTabsContentView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v3;
}

- (void)setActiveTabContentTab:(id)a3 withChangingReason:(unint64_t)a4
{
  AVMobileContentTab *v7;
  AVMobileContentTab *activeContentTab;
  AVMobileContentTab *v9;
  AVMobileChromelessContentTabsContentView *v10;
  AVMobileContentTab *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v7 = (AVMobileContentTab *)a3;
  if (v7 && !-[NSArray containsObject:](self->_contentTabs, "containsObject:", v7))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error: Internal inconsistency. The provided AVMobileContentTab does not exist."));
  activeContentTab = self->_activeContentTab;
  if (activeContentTab != v7)
  {
    v9 = activeContentTab;
    objc_storeStrong((id *)&self->_activeContentTab, a3);
    if (v9)
    {
      v10 = self;
      v11 = v9;
    }
    else
    {
      objc_initWeak(&location, self);
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __86__AVMobileChromelessContentTabsContentView_setActiveTabContentTab_withChangingReason___block_invoke;
      v13[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v14, &location);
      v13[4] = self;
      objc_msgSend(v12, "performWithoutAnimation:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      v10 = self;
      v11 = 0;
    }
    -[AVMobileChromelessContentTabsContentView _updateActiveContentTabFrom:to:withChangingReason:]((id *)&v10->super.super.super.super.isa, v11, v7, a4);

  }
}

- (void)setUpcomingContentTab:(id)a3
{
  AVMobileContentTab *v5;
  _BOOL4 v6;
  AVMobileContentTab *v7;

  v5 = (AVMobileContentTab *)a3;
  if (self->_upcomingContentTab != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_upcomingContentTab, a3);
    v6 = -[UIScrollView isTracking](self->_scrollView, "isTracking");
    v5 = v7;
    if (v6)
    {
      -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
      -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:]((id *)&self->super.super.super.super.isa, self->_activeContentTab);
      -[AVMobileChromelessContentTabsContentView _attachViewForContentTab:]((id *)&self->super.super.super.super.isa, self->_upcomingContentTab);
      v5 = v7;
    }
  }

}

- (void)setContentTabs:(id)a3
{
  NSArray *v4;
  NSArray *contentTabs;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contentTabs, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    contentTabs = self->_contentTabs;
    self->_contentTabs = v4;

    -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
  }

}

- (void)layoutSubviews
{
  UIScrollView *scrollView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessContentTabsContentView;
  -[AVView layoutSubviews](&v4, sel_layoutSubviews);
  if (-[UIScrollView isTracking](self->_scrollView, "isTracking")
    || -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating"))
  {
    -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:]((id *)&self->super.super.super.super.isa, self->_activeContentTab);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:]((id *)&self->super.super.super.super.isa, self->_activeContentTab));
  }
  scrollView = self->_scrollView;
  -[AVMobileChromelessContentTabsContentView bounds](self, "bounds");
  -[UIScrollView setFrame:](scrollView, "setFrame:");
}

- (void)didMoveToSuperview
{
  void *v3;
  id v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessContentTabsContentView;
  -[AVMobileChromelessContentTabsContentView didMoveToSuperview](&v7, sel_didMoveToSuperview);
  if (self)
  {
    if (!self->_scrollView)
    {
      -[AVMobileChromelessContentTabsContentView window](self, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = objc_alloc(MEMORY[0x1E0DC3C28]);
        v5 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        scrollView = self->_scrollView;
        self->_scrollView = v5;

        -[UIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
        -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
        -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
        -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
        -[AVMobileChromelessContentTabsContentView addSubview:](self, "addSubview:", self->_scrollView);
      }
    }
  }
  -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
}

- (AVMobileContentTab)upcomingContentTab
{
  return self->_upcomingContentTab;
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (AVMobileContentTab)activeContentTab
{
  return self->_activeContentTab;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activeContentTab, 0);
  objc_storeStrong((id *)&self->_contentTabs, 0);
  objc_storeStrong((id *)&self->_upcomingContentTab, 0);
}

- (id)_updateContentSize
{
  id *v1;
  double v2;
  double v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "bounds");
    objc_msgSend(v1[61], "setContentSize:", v2 * (double)(unint64_t)objc_msgSend(v1[59], "count"), v3);
    return (id *)objc_msgSend(v1[61], "setNeedsLayout");
  }
  return result;
}

- (void)_updateContentTabViewFrame:(id *)a1
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  if (a1)
  {
    if (a2)
    {
      v3 = a2;
      v4 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](a1, v3);
      objc_msgSend(a1, "bounds");
      v6 = v5;
      v8 = v7;
      objc_msgSend(a1, "layoutMargins");
      v10 = v9 + v6 * (double)(unint64_t)v4;
      v12 = v6 - (v9 + v11);
      objc_msgSend(v3, "viewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "view");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setFrame:", v10, 0.0, v12, v8);
    }
  }
}

- (double)_contentOffsetForTab:(id *)a1
{
  id v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  double v7;

  v3 = a2;
  v4 = *MEMORY[0x1E0C9D538];
  if (v3)
  {
    v5 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](a1, v3);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(a1[61], "bounds");
      v4 = v7 * (double)v6;
    }
  }

  return v4;
}

- (uint64_t)_indexForContentTab:(id *)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(a1[59], "indexOfObject:", v3);
  if (objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1)
    v4 = objc_msgSend(a1[59], "count") + ~v4;

  return v4;
}

- (void)_attachViewForContentTab:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    objc_msgSend(v3, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[61], "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
      objc_msgSend(a1[61], "addSubview:", v5);
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](a1, v8);
    if ((objc_msgSend(a1[61], "isTracking") & 1) == 0)
      objc_msgSend(a1[61], "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:](a1, a1[60]));

    v3 = v8;
  }

}

void __86__AVMobileChromelessContentTabsContentView_setActiveTabContentTab_withChangingReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[AVMobileChromelessContentTabsContentView _updateContentSize](WeakRetained);
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](v3, *(void **)(*(_QWORD *)(a1 + 32) + 480));
    WeakRetained = v3;
  }

}

- (void)_updateActiveContentTabFrom:(void *)a3 to:(uint64_t)a4 withChangingReason:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id from;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    if (a4)
    {
      -[AVMobileChromelessContentTabsContentView _updateContentSize](a1);
      -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](a1, a1[60]);
      -[AVMobileChromelessContentTabsContentView _attachViewForContentTab:](a1, a1[60]);
    }
    else
    {
      objc_msgSend(v8, "viewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[61], "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

      if ((v13 & 1) == 0)
        objc_msgSend(a1[61], "addSubview:", v11);
      objc_initWeak(&location, a1);
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __94__AVMobileChromelessContentTabsContentView__updateActiveContentTabFrom_to_withChangingReason___block_invoke;
      v28[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v30, &location);
      v16 = v9;
      v29 = v16;
      objc_msgSend(v14, "performWithoutAnimation:", v28);
      v17 = v16;
      v18 = v7;
      v19 = v18;
      if (v17 && v18)
      {
        objc_initWeak(&from, a1);
        v20 = (void *)MEMORY[0x1E0DC3F10];
        v32[0] = v15;
        v32[1] = 3221225472;
        v32[2] = __79__AVMobileChromelessContentTabsContentView__scrollToContentTab_fromContentTab___block_invoke;
        v32[3] = &unk_1E5BB4770;
        objc_copyWeak(&v35, &from);
        v21 = v17;
        v33 = v21;
        v34 = v19;
        objc_msgSend(v20, "performWithoutAnimation:", v32);
        objc_msgSend(v21, "viewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "frame");
        v25 = v24;
        objc_msgSend(a1, "layoutMargins");
        v27 = v25 - v26;

        objc_msgSend(a1[61], "setContentOffset:", v27, 0.0);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&from);
      }

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
  }

}

void __94__AVMobileChromelessContentTabsContentView__updateActiveContentTabFrom_to_withChangingReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[61], "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:](WeakRetained, *(void **)(a1 + 32)));
    WeakRetained = v3;
  }

}

void __79__AVMobileChromelessContentTabsContentView__scrollToContentTab_fromContentTab___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id *v31;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained[61];
    v31 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v5);

    objc_msgSend(v31[61], "bounds");
    v7 = v6 + v6;
    v8 = v31[61];
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setContentSize:", v7, v9);
    v10 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = v10;
    v13 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](v31, v11);
    v14 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](v31, v12);
    objc_msgSend(v12, "viewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31[61], "bounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v31, "layoutMargins");
    v24 = v23;
    objc_msgSend(v31, "layoutMargins");
    v26 = v20 - (v24 + v25);
    objc_msgSend(v31, "layoutMargins");
    v28 = v27;
    v29 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v31[61], "setContentOffset:", *MEMORY[0x1E0C9D538], v30);
    if (v14 >= v13)
    {
      objc_msgSend(v16, "setFrame:", v20 + v28, 0.0, v26, v22);
      objc_msgSend(v31[61], "setContentOffset:", v20, 0.0);
    }
    else
    {
      objc_msgSend(v16, "setFrame:", v28, 0.0, v26, v22);
      objc_msgSend(v31[61], "setContentOffset:", v29, v30);
      v28 = v20 + v28;
    }
    objc_msgSend(v18, "setFrame:", v28, 0.0, v26, v22);

    WeakRetained = v31;
  }

}

@end
