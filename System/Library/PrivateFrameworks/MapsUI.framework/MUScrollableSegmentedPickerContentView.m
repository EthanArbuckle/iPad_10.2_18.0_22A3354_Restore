@implementation MUScrollableSegmentedPickerContentView

- (MUScrollableSegmentedPickerContentView)initWithFrame:(CGRect)a3
{
  MUScrollableSegmentedPickerContentView *v3;
  MUScrollableSegmentedPickerContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerContentView;
  v3 = -[MUScrollableSegmentedPickerContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUScrollableSegmentedPickerContentView _setupSubviews](v3, "_setupSubviews");
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backgroundBlurView;
  MUScrollableStackView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MUScrollableStackView *v12;
  MUScrollableStackView *contentStackView;
  void *v14;
  MUEdgeLayout *v15;
  MUScrollableStackView *v16;
  void *v17;
  id v18;
  void *v19;
  UIVisualEffectView *v20;
  UIVisualEffectView *selectedPillView;
  void *v22;
  void *v23;
  MUGradientView *v24;
  MUGradientView *leadingGradientOverlayView;
  MUSizeLayout *v26;
  MUGradientView *v27;
  double v28;
  MUSizeLayout *v29;
  MUEdgeLayout *v30;
  void *v31;
  void *v32;
  MUGradientView *v33;
  MUGradientView *trailingGradientOverlayView;
  MUSizeLayout *v35;
  MUGradientView *v36;
  double v37;
  MUSizeLayout *v38;
  MUEdgeLayout *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  MUEdgeLayout *v49;
  MUEdgeLayout *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  backgroundBlurView = self->_backgroundBlurView;
  self->_backgroundBlurView = v5;

  -[UIVisualEffectView setClipsToBounds:](self->_backgroundBlurView, "setClipsToBounds:", 1);
  -[MUScrollableSegmentedPickerContentView addSubview:](self, "addSubview:", self->_backgroundBlurView);
  v7 = [MUScrollableStackView alloc];
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[MUScrollableStackView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  contentStackView = self->_contentStackView;
  self->_contentStackView = v12;

  -[MUScrollableStackView setAxis:](self->_contentStackView, "setAxis:", 0);
  -[MUScrollableStackView setDelegate:](self->_contentStackView, "setDelegate:", self);
  -[UIVisualEffectView contentView](self->_backgroundBlurView, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_contentStackView);

  v15 = [MUEdgeLayout alloc];
  v16 = self->_contentStackView;
  -[UIVisualEffectView contentView](self->_backgroundBlurView, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[MUEdgeLayout initWithItem:container:](v15, "initWithItem:container:", v16, v17);

  -[MUConstraintLayout activate](v50, "activate");
  v49 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_backgroundBlurView, self);
  -[MUConstraintLayout activate](v49, "activate");
  v18 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (UIVisualEffectView *)objc_msgSend(v18, "initWithEffect:", v19);
  selectedPillView = self->_selectedPillView;
  self->_selectedPillView = v20;

  -[UIVisualEffectView setClipsToBounds:](self->_selectedPillView, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.45);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_selectedPillView, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v22);

  -[MUScrollableStackView addSubview:](self->_contentStackView, "addSubview:", self->_selectedPillView);
  -[MUScrollableStackView sendSubviewToBack:](self->_contentStackView, "sendSubviewToBack:", self->_selectedPillView);
  v24 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v8, v9, v10, v11);
  leadingGradientOverlayView = self->_leadingGradientOverlayView;
  self->_leadingGradientOverlayView = v24;

  -[MUGradientView setUserInteractionEnabled:](self->_leadingGradientOverlayView, "setUserInteractionEnabled:", 0);
  -[_MKGradientView setLocations:](self->_leadingGradientOverlayView, "setLocations:", &unk_1E2E55C30);
  -[_MKGradientView setStartPoint:](self->_leadingGradientOverlayView, "setStartPoint:", 0.0, 0.5);
  -[_MKGradientView setEndPoint:](self->_leadingGradientOverlayView, "setEndPoint:", 1.0, 0.5);
  -[MUScrollableSegmentedPickerContentView addSubview:](self, "addSubview:", self->_leadingGradientOverlayView);
  v26 = [MUSizeLayout alloc];
  v27 = self->_leadingGradientOverlayView;
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v29 = -[MUSizeLayout initWithItem:size:](v26, "initWithItem:size:", v27, 32.0, v28);
  v30 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_leadingGradientOverlayView, self);
  -[MUEdgeLayout setEdges:](v30, "setEdges:", 7);
  v31 = (void *)MEMORY[0x1E0CB3718];
  v54[0] = v29;
  v54[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_mapsui_activateLayouts:", v32);

  v33 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v8, v9, v10, v11);
  trailingGradientOverlayView = self->_trailingGradientOverlayView;
  self->_trailingGradientOverlayView = v33;

  -[MUGradientView setUserInteractionEnabled:](self->_trailingGradientOverlayView, "setUserInteractionEnabled:", 0);
  -[_MKGradientView setLocations:](self->_trailingGradientOverlayView, "setLocations:", &unk_1E2E55C30);
  -[_MKGradientView setStartPoint:](self->_trailingGradientOverlayView, "setStartPoint:", 1.0, 0.5);
  -[_MKGradientView setEndPoint:](self->_trailingGradientOverlayView, "setEndPoint:", 0.0, 0.5);
  -[MUScrollableSegmentedPickerContentView addSubview:](self, "addSubview:", self->_trailingGradientOverlayView);
  v35 = [MUSizeLayout alloc];
  v36 = self->_trailingGradientOverlayView;
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v38 = -[MUSizeLayout initWithItem:size:](v35, "initWithItem:size:", v36, 32.0, v37);
  v39 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_trailingGradientOverlayView, self);
  -[MUEdgeLayout setEdges:](v39, "setEdges:", 13);
  v40 = (void *)MEMORY[0x1E0CB3718];
  v53[0] = v38;
  v53[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_mapsui_activateLayouts:", v41);

  -[MUScrollableSegmentedPickerContentView _updateGradientColors](self, "_updateGradientColors");
  -[MUScrollableSegmentedPickerContentView layer](self, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAllowsGroupOpacity:", 0);

  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)-[MUScrollableSegmentedPickerContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v44, sel__updateForContentSizeCategoryChange);

  objc_opt_self();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)-[MUScrollableSegmentedPickerContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v47, sel__updateGradientColors);

}

- (void)layoutSubviews
{
  double Height;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  UIVisualEffectView *selectedPillView;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)MUScrollableSegmentedPickerContentView;
  -[MUScrollableSegmentedPickerContentView layoutSubviews](&v13, sel_layoutSubviews);
  -[MUScrollableSegmentedPickerContentView bounds](self, "bounds");
  Height = CGRectGetHeight(v14);
  -[MUScrollableSegmentedPickerContentView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutDirection");

  v6 = v5 + 1;
  if ((unint64_t)(v5 + 1) > 2)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = qword_191F06680[v6];
    v8 = qword_191F06698[v6];
  }
  v9 = Height * 0.5;
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self->_backgroundBlurView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, v9);
  -[MUGradientView _setContinuousCornerRadius:](self->_leadingGradientOverlayView, "_setContinuousCornerRadius:", v9);
  -[MUGradientView layer](self->_leadingGradientOverlayView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", v8);

  -[MUGradientView _setContinuousCornerRadius:](self->_trailingGradientOverlayView, "_setContinuousCornerRadius:", v9);
  -[MUGradientView layer](self->_trailingGradientOverlayView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", v7);

  -[MUScrollableSegmentedPickerContentView _updateSelectedIndexAnimated:invokeDelegate:](self, "_updateSelectedIndexAnimated:invokeDelegate:", 0, 0);
  selectedPillView = self->_selectedPillView;
  -[UIVisualEffectView bounds](selectedPillView, "bounds");
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](selectedPillView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, CGRectGetHeight(v15) * 0.5);
}

- (double)idealWidthForProposedSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  -[MUScrollableStackView systemLayoutSizeFittingSize:](self->_contentStackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  if (width < result)
    return width;
  return result;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  -[MUScrollableSegmentedPickerContentView setSelectedIndex:animated:](self, "setSelectedIndex:animated:", a3, 0);
}

- (void)setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[MUScrollableSegmentedPickerContentView _setSelectedIndex:animated:invokeDelegate:](self, "_setSelectedIndex:animated:invokeDelegate:", a3, a4, 0);
}

- (void)_setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4 invokeDelegate:(BOOL)a5
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[MUScrollableSegmentedPickerContentView _updateSelectedIndexAnimated:invokeDelegate:](self, "_updateSelectedIndexAnimated:invokeDelegate:", a4, a5);
  }
}

- (void)_updateSelectedIndexAnimated:(BOOL)a3 invokeDelegate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unint64_t selectedIndex;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id location;

  v4 = a4;
  v5 = a3;
  selectedIndex = self->_selectedIndex;
  if (selectedIndex >= -[NSArray count](self->_viewModels, "count"))
    self->_selectedIndex = 0;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "segmentedPickerContentViewDidUpdateSelection:", self);

  }
  -[MUScrollableStackView arrangedSubviews](self->_contentStackView, "arrangedSubviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", self->_selectedIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke;
  aBlock[3] = &unk_1E2E01AB0;
  objc_copyWeak(&v22, &location);
  v12 = v10;
  v21 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = v11;
  v16 = 3221225472;
  v17 = __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke_2;
  v18 = &unk_1E2E01DA8;
  objc_copyWeak(&v19, &location);
  v14 = (void (**)(_QWORD))_Block_copy(&v15);
  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v13, 0, 0.300000012, 0.0, v15, v16, v17, v18);
  else
    v13[2](v13);
  v14[2](v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
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
  CGRect v14;
  CGRect v15;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v15 = CGRectInset(v14, 4.0, 4.0);
    objc_msgSend(WeakRetained[54], "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    objc_msgSend(*(id *)(a1 + 32), "center");
    objc_msgSend(WeakRetained[54], "setCenter:");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(WeakRetained[52], "arrangedSubviews", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "setSelected:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) == *(_QWORD *)(a1 + 32));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

void __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateGradientVisibility");
    WeakRetained = v2;
  }

}

- (void)setViewModels:(id)a3
{
  NSArray *v4;
  NSArray *viewModels;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    -[MUScrollableSegmentedPickerContentView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  NSArray *viewModels;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  MUScrollableSegmentedPickerSegmentView *(*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  viewModels = self->_viewModels;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke;
  v8 = &unk_1E2E02DD0;
  objc_copyWeak(&v9, &location);
  MUMap(viewModels, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableStackView setArrangedSubviews:](self->_contentStackView, "setArrangedSubviews:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

MUScrollableSegmentedPickerSegmentView *__59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MUScrollableSegmentedPickerSegmentView *v4;
  MUScrollableSegmentedPickerSegmentView *v5;
  void *v6;
  MUScrollableSegmentedPickerSegmentView *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  MUScrollableSegmentedPickerSegmentView *v14;
  id v15;

  v3 = a2;
  v4 = [MUScrollableSegmentedPickerSegmentView alloc];
  v5 = -[MUScrollableSegmentedPickerSegmentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MUScrollableSegmentedPickerSegmentView setViewModel:](v5, "setViewModel:", v3);
  -[MUScrollableSegmentedPickerSegmentView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)MEMORY[0x1E0DC3428];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke_2;
  v13 = &unk_1E2E014E8;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "actionWithHandler:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUScrollableSegmentedPickerSegmentView addAction:forControlEvents:](v7, "addAction:forControlEvents:", v8, 64, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  return v7;
}

void __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleTapWithSegmentView:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_updateGradientVisibility
{
  void *v3;
  uint64_t v4;
  double v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;

  -[MUScrollableSegmentedPickerContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  if ((unint64_t)(v4 + 1) >= 2)
  {
    if (v4 == 1)
    {
      -[MUScrollableStackView contentOffset](self->_contentStackView, "contentOffset");
      v13 = v12;
      -[MUScrollableStackView frame](self->_contentStackView, "frame");
      v14 = v13 + CGRectGetWidth(v18);
      -[MUScrollableStackView contentSize](self->_contentStackView, "contentSize");
      v6 = v14 >= v15;
      -[MUScrollableStackView contentOffset](self->_contentStackView, "contentOffset");
      v11 = v16 <= 0.0;
    }
    else
    {
      v11 = 0;
      v6 = 0;
    }
  }
  else
  {
    -[MUScrollableStackView contentOffset](self->_contentStackView, "contentOffset");
    v6 = v5 <= 0.0;
    -[MUScrollableStackView contentOffset](self->_contentStackView, "contentOffset");
    v8 = v7;
    -[MUScrollableStackView frame](self->_contentStackView, "frame");
    v9 = v8 + CGRectGetWidth(v17);
    -[MUScrollableStackView contentSize](self->_contentStackView, "contentSize");
    v11 = v9 >= v10;
  }
  -[MUGradientView setHidden:](self->_leadingGradientOverlayView, "setHidden:", v6);
  -[MUGradientView setHidden:](self->_trailingGradientOverlayView, "setHidden:", v11);
}

- (void)_handleTapWithSegmentView:(id)a3
{
  MUScrollableStackView *contentStackView;
  id v5;
  void *v6;
  uint64_t v7;

  contentStackView = self->_contentStackView;
  v5 = a3;
  -[MUScrollableStackView arrangedSubviews](contentStackView, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  -[MUScrollableSegmentedPickerContentView _setSelectedIndex:animated:invokeDelegate:](self, "_setSelectedIndex:animated:invokeDelegate:", v7, 1, 1);
}

- (void)_updateForContentSizeCategoryChange
{
  -[MUScrollableSegmentedPickerContentView _updateSelectedIndexAnimated:invokeDelegate:](self, "_updateSelectedIndexAnimated:invokeDelegate:", 0, 0);
}

- (void)_updateGradientColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[MUScrollableSegmentedPickerContentView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "colorWithAlphaComponent:", 0.300000012);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.200000003, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUScrollableSegmentedPickerContentView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "layoutDirection");

  if (v10 == 1)
  {
    objc_msgSend(v8, "reverseObjectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  -[_MKGradientView setColors:](self->_leadingGradientOverlayView, "setColors:", v8);
  -[_MKGradientView setColors:](self->_trailingGradientOverlayView, "setColors:", v8);

}

- (void)scrollViewDidScroll:(id)a3
{
  -[MUScrollableSegmentedPickerContentView _updateSelectedIndexAnimated:invokeDelegate:](self, "_updateSelectedIndexAnimated:invokeDelegate:", 0, 0);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (MUScrollableSegmentedPickerContentViewDelegate)delegate
{
  return (MUScrollableSegmentedPickerContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_trailingGradientOverlayView, 0);
  objc_storeStrong((id *)&self->_leadingGradientOverlayView, 0);
  objc_storeStrong((id *)&self->_selectedPillView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
