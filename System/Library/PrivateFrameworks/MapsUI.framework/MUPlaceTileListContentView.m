@implementation MUPlaceTileListContentView

- (MUPlaceTileListContentView)initWithFrame:(CGRect)a3
{
  MUPlaceTileListContentView *v3;
  MUPlaceTileListContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTileListContentView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPlaceTileListContentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PlaceTileListContent"));
    -[MUPlaceTileListContentView _setupViews](v4, "_setupViews");
    -[MUPlaceTileListContentView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  MULabelViewProtocol *v3;
  MULabelViewProtocol *titleLabel;
  MULabelViewProtocol *v5;
  MULabelViewProtocol *secondaryLabel;
  MULabelViewProtocol *v7;
  MULabelViewProtocol *tertiaryLabel;
  MUImageView *v9;
  MUImageView *v10;
  MUImageView *stopImageView;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  _createTitleLabel();
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileListTitle"));
  -[MUPlaceTileListContentView addSubview:](self, "addSubview:", self->_titleLabel);
  _createSecondaryLabel();
  v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v5;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileListSecondaryLabel"));
  -[MUPlaceTileListContentView addSubview:](self, "addSubview:", self->_secondaryLabel);
  _createSecondaryLabel();
  v7 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v7;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", CFSTR("PlaceTileListTertiaryLabel"));
  -[MUPlaceTileListContentView addSubview:](self, "addSubview:", self->_tertiaryLabel);
  v9 = [MUImageView alloc];
  v10 = -[MUImageView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stopImageView = self->_stopImageView;
  self->_stopImageView = v10;

  +[MUInfoCardStyle imageTileBackgroundColor](MUInfoCardStyle, "imageTileBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageView setBackgroundColor:](self->_stopImageView, "setBackgroundColor:", v12);

  -[UIView _mapsui_setCardCorner](self->_stopImageView, "_mapsui_setCardCorner");
  -[MUImageView setAccessibilityIdentifier:](self->_stopImageView, "setAccessibilityIdentifier:", CFSTR("PlaceTileListImage"));
  -[MUPlaceTileListContentView addSubview:](self, "addSubview:", self->_stopImageView);
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)-[MUPlaceTileListContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v14, sel__updateFonts);

}

- (void)_setupConstraints
{
  MUSizeLayout *v3;
  MUCompositionalStackLayoutGroup *v4;
  MULabelViewProtocol *secondaryLabel;
  void *v6;
  MUCompositionalStackLayoutGroup *v7;
  MUImageView *stopImageView;
  void *v9;
  double v10;
  MUCompositionalStackLayout *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_stopImageView, 48.0, 48.0);
  v4 = -[MUCompositionalStackLayoutGroup initWithAxis:]([MUCompositionalStackLayoutGroup alloc], "initWithAxis:", 1);
  secondaryLabel = self->_secondaryLabel;
  v16[0] = self->_titleLabel;
  v16[1] = secondaryLabel;
  v16[2] = self->_tertiaryLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v4, "setArrangedLayoutItems:", v6);

  v7 = -[MUCompositionalStackLayoutGroup initWithAxis:]([MUCompositionalStackLayoutGroup alloc], "initWithAxis:", 0);
  stopImageView = self->_stopImageView;
  v15[0] = v4;
  v15[1] = stopImageView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v7, "setArrangedLayoutItems:", v9);

  -[MUCompositionalStackLayoutGroup setDistribution:](v7, "setDistribution:", 5);
  -[MUCompositionalStackLayoutGroup setAlignment:](v7, "setAlignment:", 2);
  -[MUCompositionalStackLayoutGroup setAlignmentBoundsContent:](v7, "setAlignmentBoundsContent:", 1);
  LODWORD(v10) = 1112276992;
  -[MUCompositionalStackLayoutGroup setAlignmentFittingSizePriority:](v7, "setAlignmentFittingSizePriority:", v10);
  -[MUCompositionalStackLayoutGroup setInsets:](v7, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  -[MUCompositionalStackLayoutGroup setSpacing:](v7, "setSpacing:", 8.0);
  v11 = -[MUCompositionalStackLayout initWithContainer:group:]([MUCompositionalStackLayout alloc], "initWithContainer:group:", self, v7);
  v12 = (void *)MEMORY[0x1E0CB3718];
  v14[0] = v3;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_mapsui_activateLayouts:", v13);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceTileListContentView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  MUPlaceTileViewModel *viewModel;
  uint64_t v5;
  void *v6;
  void *v7;
  MUPlaceTileViewModel *v8;
  void *v9;
  void *v10;
  MUPlaceTileViewModel *v11;
  MUPlaceTileViewModel *v12;
  uint64_t v13;
  MUPlaceTileViewModel *v14;
  MUPlaceTileViewModel *v15;
  MUPlaceTileViewModel *v16;
  _QWORD v17[4];
  MUPlaceTileViewModel *v18;
  id v19;
  _QWORD v20[4];
  MUPlaceTileViewModel *v21;
  id v22;
  id location;

  -[MUImageView setImage:](self->_stopImageView, "setImage:", 0);
  -[MUPlaceTileViewModel tileName](self->_viewModel, "tileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", v3);

  viewModel = self->_viewModel;
  v5 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel subtitleAttributedStringForFont:](viewModel, "subtitleAttributedStringForFont:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_secondaryLabel, "setAttributedText:", v7);

  -[MULabelViewProtocol setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", -[MUPlaceTileViewModel expectedNumberOfFooterLines](self->_viewModel, "expectedNumberOfFooterLines"));
  v8 = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](v8, "footerAttributedStringForFont:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_tertiaryLabel, "setAttributedText:", v10);

  objc_initWeak(&location, self);
  v11 = self->_viewModel;
  v12 = self->_viewModel;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__MUPlaceTileListContentView__updateAppearance__block_invoke;
  v20[3] = &unk_1E2E02F90;
  objc_copyWeak(&v22, &location);
  v14 = v11;
  v21 = v14;
  -[MUPlaceTileViewModel fetchFallbackIconWithCompletion:](v12, "fetchFallbackIconWithCompletion:", v20);
  v15 = self->_viewModel;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __47__MUPlaceTileListContentView__updateAppearance__block_invoke_2;
  v17[3] = &unk_1E2E02F90;
  objc_copyWeak(&v19, &location);
  v16 = v14;
  v18 = v16;
  -[MUPlaceTileViewModel fetchImageTilewWithSize:completion:](v15, "fetchImageTilewWithSize:completion:", v17, 150.0, 112.0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __47__MUPlaceTileListContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (WeakRetained[64] == *(id *)(a1 + 32))
      objc_msgSend(WeakRetained[62], "setFallbackImage:", v4);
  }

}

void __47__MUPlaceTileListContentView__updateAppearance__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  _QWORD *WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (WeakRetained[64] == *(_QWORD *)(a1 + 32))
    {
      v7 = (void *)WeakRetained[62];
      if (v8)
        objc_msgSend(v7, "setImage:animated:", v8, a4 ^ 1u);
      else
        objc_msgSend(v7, "setImage:");
    }
  }

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  MUPlaceTileViewModel *viewModel;
  uint64_t v7;
  void *v8;
  void *v9;
  MUPlaceTileViewModel *v10;
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
  v7 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel subtitleAttributedStringForFont:](viewModel, "subtitleAttributedStringForFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_secondaryLabel, "setAttributedText:", v9);

  v10 = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](v10, "footerAttributedStringForFont:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_tertiaryLabel, "setAttributedText:", v11);

}

- (UIImageView)tileImageView
{
  return self->_tileImageView;
}

- (MUPlaceTileViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tileImageView, 0);
  objc_storeStrong((id *)&self->_stopImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
