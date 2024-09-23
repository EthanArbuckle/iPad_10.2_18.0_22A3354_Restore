@implementation MUPlaceTileContentView

- (MUPlaceTileContentView)initWithCellConfiguration:(id)a3
{
  id v5;
  MUPlaceTileContentView *v6;
  MUPlaceTileContentView *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceTileContentView;
  v6 = -[MUPlaceTileContentView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUPlaceTileContentView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("PlaceTileContent"));
    -[MUPlaceTileContentView _setupSubviews](v7, "_setupSubviews");
    -[MUPlaceTileContentView _setupConstraints](v7, "_setupConstraints");
    -[UIView _mapsui_setCardCorner](v7, "_mapsui_setCardCorner");
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[MUPlaceTileContentView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v9, sel__updateAppearance);

  }
  return v7;
}

- (void)_setupSubviews
{
  MULabelViewProtocol *v3;
  MULabelViewProtocol *titleLabel;
  MULabelViewProtocol *v5;
  MULabelViewProtocol *subtitleLabel;
  MULabelViewProtocol *v7;
  MULabelViewProtocol *footerLabel;
  MUImageView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MUImageView *v14;
  MUImageView *contentImageView;
  void *v16;
  UILayoutGuide *v17;
  UILayoutGuide *titleLayoutGuide;
  UILayoutGuide *v19;
  UILayoutGuide *textLayoutGuide;
  UIImageView *v21;
  UIImageView *badgeImageView;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  _createTitleLabel();
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileTitle"));
  -[MUPlaceTileContentView addSubview:](self, "addSubview:", self->_titleLabel);
  _createSecondaryLabel();
  v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v5;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileSubtitle"));
  -[MUPlaceTileContentView addSubview:](self, "addSubview:", self->_subtitleLabel);
  _createFooterLabel();
  v7 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  footerLabel = self->_footerLabel;
  self->_footerLabel = v7;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_footerLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileFooter"));
  -[MUPlaceTileContentView addSubview:](self, "addSubview:", self->_footerLabel);
  v9 = [MUImageView alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[MUImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  contentImageView = self->_contentImageView;
  self->_contentImageView = v14;

  +[MUInfoCardStyle imageTileBackgroundColor](MUInfoCardStyle, "imageTileBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageView setBackgroundColor:](self->_contentImageView, "setBackgroundColor:", v16);

  -[MUImageView setClipsToBounds:](self->_contentImageView, "setClipsToBounds:", 1);
  -[MUImageView setAccessibilityIdentifier:](self->_contentImageView, "setAccessibilityIdentifier:", CFSTR("PlaceTileImage"));
  -[MUPlaceTileContentView addSubview:](self, "addSubview:", self->_contentImageView);
  v17 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleLayoutGuide = self->_titleLayoutGuide;
  self->_titleLayoutGuide = v17;

  -[MUPlaceTileContentView addLayoutGuide:](self, "addLayoutGuide:", self->_titleLayoutGuide);
  v19 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v19;

  -[MUPlaceTileContentView addLayoutGuide:](self, "addLayoutGuide:", self->_textLayoutGuide);
  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v21 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v10, v11, v12, v13);
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = v21;

    -[UIImageView _setCornerRadius:](self->_badgeImageView, "_setCornerRadius:", 12.0);
    -[UIImageView layer](self->_badgeImageView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v24, "CGColor");
    -[UIImageView layer](self->_badgeImageView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderColor:", v25);

    -[UIImageView setAccessibilityIdentifier:](self->_badgeImageView, "setAccessibilityIdentifier:", CFSTR("PlaceTileBadge"));
    -[MUPlaceTileContentView addSubview:](self, "addSubview:", self->_badgeImageView);
  }
  objc_opt_self();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)-[MUPlaceTileContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v28, sel__updateFonts);

}

- (void)_setupConstraints
{
  void *v3;
  MUStackLayout *v4;
  MUStackLayout *titleStackLayout;
  MULabelViewProtocol *subtitleLabel;
  void *v7;
  MUStackLayout *v8;
  MUStackLayout *textStackLayout;
  MULabelViewProtocol *footerLabel;
  void *v11;
  MUStackLayout *v12;
  UILayoutGuide *textLayoutGuide;
  void *v14;
  double v15;
  MUSizeLayout *v16;
  MUBoxLayout *v17;
  void *v18;
  MUSizeLayout *v19;
  UIImageView *badgeImageView;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_contentImageView, 150.0, 112.0);
  objc_msgSend(v3, "addObject:");
  v4 = -[MUStackLayout initWithContainer:axis:]([MUStackLayout alloc], "initWithContainer:axis:", self->_titleLayoutGuide, 1);
  titleStackLayout = self->_titleStackLayout;
  self->_titleStackLayout = v4;

  subtitleLabel = self->_subtitleLabel;
  v23[0] = self->_titleLabel;
  v23[1] = subtitleLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackLayout setArrangedLayoutItems:](self->_titleStackLayout, "setArrangedLayoutItems:", v7);

  objc_msgSend(v3, "addObject:", self->_titleStackLayout);
  v8 = -[MUStackLayout initWithContainer:axis:]([MUStackLayout alloc], "initWithContainer:axis:", self->_textLayoutGuide, 1);
  textStackLayout = self->_textStackLayout;
  self->_textStackLayout = v8;

  footerLabel = self->_footerLabel;
  v22[0] = self->_titleLayoutGuide;
  v22[1] = footerLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackLayout setArrangedLayoutItems:](self->_textStackLayout, "setArrangedLayoutItems:", v11);

  -[MUStackLayout setDistribution:](self->_textStackLayout, "setDistribution:", 5);
  -[MUStackLayout setInsets:](self->_textStackLayout, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  objc_msgSend(v3, "addObject:", self->_textStackLayout);
  v12 = -[MUStackLayout initWithContainer:axis:]([MUStackLayout alloc], "initWithContainer:axis:", self, 1);
  textLayoutGuide = self->_textLayoutGuide;
  v21[0] = self->_contentImageView;
  v21[1] = textLayoutGuide;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUStackLayout setArrangedLayoutItems:](v12, "setArrangedLayoutItems:", v14);

  -[MUStackLayout setDistribution:](v12, "setDistribution:", 2);
  LODWORD(v15) = 1112276992;
  -[MUStackLayout setDistributionFittingSizePriority:](v12, "setDistributionFittingSizePriority:", v15);
  objc_msgSend(v3, "addObject:", v12);
  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v16 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_badgeImageView, 24.0, 24.0);
    objc_msgSend(v3, "addObject:", v16);
    v17 = -[MUBoxLayout initWithContainer:]([MUBoxLayout alloc], "initWithContainer:", self->_contentImageView);
    badgeImageView = self->_badgeImageView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &badgeImageView, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBoxLayout setArrangedLayoutItems:](v17, "setArrangedLayoutItems:", v18);

    -[MUBoxLayout setHorizontalAlignment:](v17, "setHorizontalAlignment:", 1);
    -[MUBoxLayout setVerticalAlignment:](v17, "setVerticalAlignment:", 3);
    -[MUBoxLayout setOffset:forArrangedLayoutItem:](v17, "setOffset:forArrangedLayoutItem:", self->_badgeImageView, 8.0, 12.0);
    objc_msgSend(v3, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "_mapsui_activateLayouts:", v3);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceTileContentView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  MUPlaceTileViewModel *viewModel;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  MUPlaceTileViewModel *v10;
  void *v11;
  void *v12;
  void *v13;
  MUPlaceTileViewModel *v14;
  MUPlaceTileViewModel *v15;
  uint64_t v16;
  MUPlaceTileViewModel *v17;
  MUPlaceTileViewModel *v18;
  MUPlaceTileViewModel *v19;
  MUPlaceTileViewModel *v20;
  _QWORD v21[4];
  MUPlaceTileViewModel *v22;
  id v23;
  _QWORD v24[4];
  MUPlaceTileViewModel *v25;
  id v26;
  _QWORD v27[4];
  MUPlaceTileViewModel *v28;
  id v29;
  id location;

  -[MUImageView setImage:](self->_contentImageView, "setImage:", 0);
  -[UIImageView setImage:](self->_badgeImageView, "setImage:", 0);
  -[UIImageView setHidden:](self->_badgeImageView, "setHidden:", 1);
  -[MUPlaceTileViewModel tileName](self->_viewModel, "tileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", v3);

  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel subtitleAttributedStringForFont:](viewModel, "subtitleAttributedStringForFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_subtitleLabel, "setAttributedText:", v6);

  -[MULabelViewProtocol attributedText](self->_subtitleLabel, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[MUStackLayout setSpacing:](self->_titleStackLayout, "setSpacing:", 2.0);
  v9 = 8.0;
  if (!v8)
    v9 = 6.0;
  -[MUStackLayout setSpacing:](self->_textStackLayout, "setSpacing:", v9);
  -[MULabelViewProtocol setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", -[MUPlaceTileViewModel expectedNumberOfFooterLines](self->_viewModel, "expectedNumberOfFooterLines"));
  v10 = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](v10, "footerAttributedStringForFont:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_footerLabel, "setAttributedText:", v13);

  v14 = self->_viewModel;
  objc_initWeak(&location, self);
  v15 = self->_viewModel;
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke;
  v27[3] = &unk_1E2E02F90;
  objc_copyWeak(&v29, &location);
  v17 = v14;
  v28 = v17;
  -[MUPlaceTileViewModel fetchFallbackIconWithCompletion:](v15, "fetchFallbackIconWithCompletion:", v27);
  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v18 = self->_viewModel;
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke_2;
    v24[3] = &unk_1E2E02F90;
    objc_copyWeak(&v26, &location);
    v25 = v17;
    -[MUPlaceTileViewModel fetchBadgeIconWithCompletion:](v18, "fetchBadgeIconWithCompletion:", v24);

    objc_destroyWeak(&v26);
  }
  v19 = self->_viewModel;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __43__MUPlaceTileContentView__updateAppearance__block_invoke_3;
  v21[3] = &unk_1E2E02F90;
  objc_copyWeak(&v23, &location);
  v20 = v17;
  v22 = v20;
  -[MUPlaceTileViewModel fetchImageTilewWithSize:completion:](v19, "fetchImageTilewWithSize:completion:", v21, 150.0, 112.0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (WeakRetained[62] == *(id *)(a1 + 32))
      objc_msgSend(WeakRetained[55], "setFallbackImage:", v4);
  }

}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (WeakRetained[62] == *(id *)(a1 + 32))
      objc_msgSend(WeakRetained[56], "setImage:", v4);
  }

}

void __43__MUPlaceTileContentView__updateAppearance__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (*((_QWORD *)WeakRetained + 62) == *(_QWORD *)(a1 + 32))
    {
      v7 = (void *)*((_QWORD *)WeakRetained + 55);
      if (v8)
        objc_msgSend(v7, "setImage:animated:", v8, a4 ^ 1u);
      else
        objc_msgSend(v7, "setImage:", 0);
      objc_msgSend(*((id *)WeakRetained + 56), "setHidden:", v8 == 0);
    }
  }

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  MUPlaceTileViewModel *viewModel;
  void *v7;
  void *v8;
  MUPlaceTileViewModel *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_titleLabel, "setFont:", v5);

  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel subtitleAttributedStringForFont:](viewModel, "subtitleAttributedStringForFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_subtitleLabel, "setAttributedText:", v8);

  v9 = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](v9, "footerAttributedStringForFont:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_footerLabel, "setAttributedText:", v11);

}

- (UIImageView)tileImageView
{
  return -[MUImageView contentImageView](self->_contentImageView, "contentImageView");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  +[MUPlaceTileContentView preferredWidth](MUPlaceTileContentView, "preferredWidth");
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)preferredWidth
{
  return 150.0;
}

+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "_preferredSizeForViewModel:cellConfiguration:maximumMeasurements:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v9, v10);
        if (v18 > v11)
        {
          v11 = v18;
          v12 = v17;
        }
      }
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v19 = v12;
  v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (CGSize)_preferredSizeForViewModel:(id)a3 cellConfiguration:(id)a4 maximumMeasurements:(id)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double Height;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  BOOL v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _QWORD v49[2];
  _QWORD v50[3];
  CGSize result;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(v7, "tileWidth");
  v9 = v8 + -32.0;
  objc_msgSend(v6, "tileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    LODWORD(v13) = 1.0;
    objc_msgSend(v12, "setHyphenationFactor:", v13);
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "tileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_mapkit_fontWithSymbolicTraits:", 0x8000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = *MEMORY[0x1E0DC1178];
    v50[0] = v18;
    v50[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v19);

    v52.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v20, v9);
    Height = CGRectGetHeight(v52);
    objc_msgSend(v7, "maxTitleHeight");
    if (Height < v22)
      v22 = Height;
    v23 = v22 + 128.0;

  }
  else
  {
    v23 = 128.0;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitleAttributedStringForFont:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "length"))
  {
    v53.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v25, v9);
    v26 = CGRectGetHeight(v53);
    objc_msgSend(v7, "maxSubtitleHeight");
    if (v26 < v27)
      v27 = v26;
    v28 = v27 > 0.0;
    v23 = v23 + v27;
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerAttributedStringForFont:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = _calculateBoundingRectForAttributedStringWithHeight(v31, v9);
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v54.origin.x = v32;
  v54.origin.y = v34;
  v54.size.width = v36;
  v54.size.height = v38;
  v39 = CGRectGetHeight(v54) <= 0.0;
  v40 = v23 + 2.0 + 8.0;
  if (v39)
    v40 = v23 + 2.0;
  if (v28)
    v41 = v40;
  else
    v41 = v23 + 8.0;
  v55.origin.x = v32;
  v55.origin.y = v34;
  v55.size.width = v36;
  v55.size.height = v38;
  v42 = CGRectGetHeight(v55);
  objc_msgSend(v7, "maxFooterHeight");
  if (v42 >= v43)
    v44 = v43;
  else
    v44 = v42;
  objc_msgSend(v7, "tileWidth");
  v46 = v45;

  v47 = v41 + v44 + 16.0;
  v48 = v46;
  result.height = v47;
  result.width = v48;
  return result;
}

- (MUPlaceTileViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_textStackLayout, 0);
  objc_storeStrong((id *)&self->_titleStackLayout, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
