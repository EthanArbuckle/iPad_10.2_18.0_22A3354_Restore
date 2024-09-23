@implementation MUPlaceRibbonView

- (MUPlaceRibbonView)initWithFrame:(CGRect)a3
{
  MUPlaceRibbonView *v3;
  MUPlaceRibbonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceRibbonView;
  v3 = -[MUPlaceRibbonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUPlaceRibbonView _setupStackView](v3, "_setupStackView");
  return v4;
}

- (void)_setupStackView
{
  NSArray *v3;
  NSArray *viewModels;
  MUScrollableStackView *v5;
  MUScrollableStackView *v6;
  MUScrollableStackView *contentStackView;
  _BOOL4 v8;
  double v9;
  double v10;
  MUPagingScrollContainerView *v11;
  MUHairlineView *v12;
  MUHairlineView *topHairline;
  MUHairlineView *v14;
  MUHairlineView *bottomHairline;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  viewModels = self->_viewModels;
  self->_viewModels = v3;

  v5 = [MUScrollableStackView alloc];
  v6 = -[MUScrollableStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v6;

  -[MUScrollableStackView setAxis:](self->_contentStackView, "setAxis:", 0);
  -[MUScrollableStackView setSpacing:](self->_contentStackView, "setSpacing:", 16.0);
  -[MUScrollableStackView setDelegate:](self->_contentStackView, "setDelegate:", self);
  v8 = -[MUPlaceRibbonView showTopAndBottomSeparators](self, "showTopAndBottomSeparators");
  if (v8)
    v9 = 19.0;
  else
    v9 = 16.0;
  v10 = 0.0;
  if (v8)
    v10 = 10.0;
  -[MUScrollableStackView setContentEdgeInsets:](self->_contentStackView, "setContentEdgeInsets:", v10, v9, v10, 16.0);
  if (MapKitIdiomIsMacCatalyst())
  {
    v11 = -[MUPagingScrollContainerView initWithHorizontalScrollView:]([MUPagingScrollContainerView alloc], "initWithHorizontalScrollView:", self->_contentStackView);
    -[MUPagingScrollContainerView setCornerStyle:](v11, "setCornerStyle:", 0);
  }
  else
  {
    v11 = self->_contentStackView;
  }
  -[MUPagingScrollContainerView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceRibbonView addSubview:](self, "addSubview:", v11);
  if (v8)
  {
    v12 = objc_alloc_init(MUHairlineView);
    topHairline = self->_topHairline;
    self->_topHairline = v12;

    v14 = objc_alloc_init(MUHairlineView);
    bottomHairline = self->_bottomHairline;
    self->_bottomHairline = v14;

    -[MUScrollableStackView addSubview:](self->_contentStackView, "addSubview:", self->_topHairline);
    -[MUScrollableStackView addSubview:](self->_contentStackView, "addSubview:", self->_bottomHairline);
  }
  -[MUPagingScrollContainerView leadingAnchor](v11, "leadingAnchor", MEMORY[0x1E0CB3718]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonView leadingAnchor](self, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  -[MUPagingScrollContainerView trailingAnchor](v11, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonView trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  -[MUPagingScrollContainerView topAnchor](v11, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonView topAnchor](self, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v20;
  -[MUPagingScrollContainerView bottomAnchor](v11, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonView bottomAnchor](self, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v24);

}

- (void)layoutSubviews
{
  double Width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v12.receiver = self;
  v12.super_class = (Class)MUPlaceRibbonView;
  -[MUPlaceRibbonView layoutSubviews](&v12, sel_layoutSubviews);
  -[MUPlaceRibbonView layoutIfNeeded](self, "layoutIfNeeded");
  -[MUScrollableStackView frame](self->_contentStackView, "frame");
  Width = CGRectGetWidth(v13);
  -[MUScrollableStackView contentLayoutGuide](self->_contentStackView, "contentLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v5 = CGRectGetWidth(v14);

  if (Width >= v5)
    v6 = Width;
  else
    v6 = v5;
  v7 = v6 + -16.0 + -16.0;
  -[MUHairlineView intrinsicContentSize](self->_topHairline, "intrinsicContentSize");
  v9 = v8;
  -[MUScrollableStackView frame](self->_contentStackView, "frame");
  v11 = v10 + 16.0;
  -[MUHairlineView setFrame:](self->_topHairline, "setFrame:", v10 + 16.0, 0.0, v7, v9);
  -[MUScrollableStackView frame](self->_contentStackView, "frame");
  -[MUHairlineView setFrame:](self->_bottomHairline, "setFrame:", v11, CGRectGetMaxY(v15) - v9, v7, v9);
}

- (BOOL)showTopAndBottomSeparators
{
  return 1;
}

- (void)setViewModels:(id)a3
{
  NSArray *v4;
  NSArray *viewModels;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_viewModels, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    -[MUPlaceRibbonView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  MUPlaceRibbonItemView *v12;
  void *v13;
  _BOOL8 v14;
  NSArray *obj;
  _QWORD v16[5];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_viewModels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = -[MUPlaceRibbonItemView initWithFrame:]([MUPlaceRibbonItemView alloc], "initWithFrame:", v6, v7, v8, v9);
        -[MUPlaceRibbonItemView setViewModel:](v12, "setViewModel:", v11);
        objc_initWeak(&location, self);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __38__MUPlaceRibbonView__updateAppearance__block_invoke;
        v16[3] = &unk_1E2E034B8;
        objc_copyWeak(&v17, &location);
        v16[4] = v11;
        -[MUPlaceRibbonItemView setActionHandler:](v12, "setActionHandler:", v16);
        -[NSArray lastObject](self->_viewModels, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11 != v13;

        -[MUPlaceRibbonItemView setShowTrailingHairline:](v12, "setShowTrailingHairline:", v14);
        objc_msgSend(v3, "addObject:", v12);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        ++v10;
      }
      while (v4 != v10);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  -[MUScrollableStackView setArrangedSubviews:](self->_contentStackView, "setArrangedSubviews:", v3);
}

void __38__MUPlaceRibbonView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  MUPresentationOptions *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MUPresentationOptions);
    -[MUPresentationOptions setSourceView:](v4, "setSourceView:", v6);
    objc_msgSend(v6, "frame");
    -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
    -[MUPresentationOptions setProgressObserver:](v4, "setProgressObserver:", v6);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ribbonView:didTapItemWithViewModel:withPresentationOptions:", WeakRetained, *(_QWORD *)(a1 + 32), v4);

  }
}

- (BOOL)hasContent
{
  void *v2;
  unint64_t v3;

  -[MUPlaceRibbonView _visibleRibbonItemViews](self, "_visibleRibbonItemViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  LOBYTE(v3) = v3 >= GEOConfigGetUInteger();

  return v3;
}

- (id)_visibleRibbonItemViews
{
  void *v2;
  void *v3;
  void *v4;

  -[MUScrollableStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __44__MUPlaceRibbonView__visibleRibbonItemViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (void)reloadVisibility
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  id obj;
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
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MUScrollableStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        -[MUPlaceRibbonView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", v5 + v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "ribbonView:shouldShowRibbonItem:", self, v10);

        objc_msgSend(v8, "setHidden:", v11 ^ 1u);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v5 += v7;
    }
    while (v4);
  }

  -[MUPlaceRibbonView _visibleRibbonItemViews](self, "_visibleRibbonItemViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        objc_msgSend(v12, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17 != v18;

        objc_msgSend(v17, "setShowTrailingHairline:", v19);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGPoint *p_beginAnalyticsScrollingPoint;
  CGFloat v4;
  CGFloat v5;

  p_beginAnalyticsScrollingPoint = &self->_beginAnalyticsScrollingPoint;
  objc_msgSend(a3, "contentOffset");
  p_beginAnalyticsScrollingPoint->x = v4;
  p_beginAnalyticsScrollingPoint->y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v5;
  void *v6;
  id v7;

  v5 = self->_beginAnalyticsScrollingPoint.x - a5->x;
  -[MUPlaceRibbonView analyticsDelegate](self, "analyticsDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 <= 0.0)
    objc_msgSend(v6, "performInstrumentationForScrollRight");
  else
    objc_msgSend(v6, "performInstrumentationForScrollLeft");

}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  return (MUScrollAnalyticActionObserving *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MUPlaceRibbonViewDelegate)delegate
{
  return (MUPlaceRibbonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_callToActionViewModel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
