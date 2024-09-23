@implementation MUPlaceCompactTileContentView

- (MUPlaceCompactTileContentView)initWithCellConfiguration:(id)a3
{
  id v5;
  MUPlaceCompactTileContentView *v6;
  MUPlaceCompactTileContentView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCompactTileContentView;
  v6 = -[MUPlaceCompactTileContentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUPlaceCompactTileContentView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("PlaceCompactTileContent"));
    -[MUPlaceCompactTileContentView _setupSubviews](v7, "_setupSubviews");
    -[MUPlaceCompactTileContentView _setupConstraints](v7, "_setupConstraints");
  }

  return v7;
}

- (UIImageView)tileImageView
{
  return 0;
}

- (void)_setupSubviews
{
  id v3;
  UIImageView *v4;
  UIImageView *iconView;
  MULabelViewProtocol *v6;
  MULabelViewProtocol *primaryLabel;
  MULabelViewProtocol *v8;
  MULabelViewProtocol *secondaryLabel;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    iconView = self->_iconView;
    self->_iconView = v4;

    -[UIImageView setAccessibilityIdentifier:](self->_iconView, "setAccessibilityIdentifier:", CFSTR("PlaceCompactTileIcon"));
    -[MUPlaceCompactTileContentView addSubview:](self, "addSubview:", self->_iconView);
  }
  _createTitleLabel();
  v6 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v6;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PlaceCompactTilePrimaryLabel"));
  -[MUPlaceCompactTileContentView addSubview:](self, "addSubview:", self->_primaryLabel);
  _createFooterLabel();
  v8 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v8;

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("PlaceCompactTileSecondaryLabel"));
  -[MUPlaceCompactTileContentView addSubview:](self, "addSubview:", self->_secondaryLabel);
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)-[MUPlaceCompactTileContentView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v11, sel__updateFonts);

}

- (void)_setupConstraints
{
  void *v3;
  MUSizeLayout *v4;
  MUCompositionalStackLayoutGroup *v5;
  MULabelViewProtocol *primaryLabel;
  void *v7;
  MULabelViewProtocol *secondaryLabel;
  void *v9;
  MULabelViewProtocol *v10;
  MUCompositionalStackLayoutGroup *v11;
  double v12;
  MUCompositionalStackLayoutGroup *v13;
  void *v14;
  double v15;
  MUCompositionalStackLayout *v16;
  MUCompositionalStackLayoutGroup *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v4 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_iconView, 24.0, 24.0);
    objc_msgSend(v3, "addObject:", v4);
    v5 = -[MUCompositionalStackLayoutGroup initWithAxis:]([MUCompositionalStackLayoutGroup alloc], "initWithAxis:", 1);
    primaryLabel = self->_primaryLabel;
    v20[0] = self->_iconView;
    v20[1] = primaryLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v5, "setArrangedLayoutItems:", v7);

    -[MUCompositionalStackLayoutGroup setSpacing:](v5, "setSpacing:", 4.0);
    -[MUCompositionalStackLayoutGroup setAlignment:forArrangedLayoutItem:](v5, "setAlignment:forArrangedLayoutItem:", 1, self->_iconView);
    secondaryLabel = self->_secondaryLabel;
    v19[0] = v5;
    v19[1] = secondaryLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = self->_secondaryLabel;
    v18[0] = self->_primaryLabel;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[MUCompositionalStackLayoutGroup initWithAxis:]([MUCompositionalStackLayoutGroup alloc], "initWithAxis:", 1);
  -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v11, "setArrangedLayoutItems:", v9);
  -[MUCompositionalStackLayoutGroup setDistribution:](v11, "setDistribution:", 5);
  LODWORD(v12) = 1112276992;
  -[MUCompositionalStackLayoutGroup setDistributionFittingSizePriority:](v11, "setDistributionFittingSizePriority:", v12);
  -[MUCompositionalStackLayoutGroup setInsets:](v11, "setInsets:", 16.0, 16.0, 16.0, 16.0);
  -[MUCompositionalStackLayoutGroup setSpacing:](v11, "setSpacing:", 8.0);
  v13 = -[MUCompositionalStackLayoutGroup initWithAxis:]([MUCompositionalStackLayoutGroup alloc], "initWithAxis:", 1);
  v17 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroup setArrangedLayoutItems:](v13, "setArrangedLayoutItems:", v14);

  -[MUCompositionalStackLayoutGroup setDistribution:](v13, "setDistribution:", 2);
  LODWORD(v15) = 1112539136;
  -[MUCompositionalStackLayoutGroup setDistributionFittingSizePriority:](v13, "setDistributionFittingSizePriority:", v15);
  v16 = -[MUCompositionalStackLayout initWithContainer:group:]([MUCompositionalStackLayout alloc], "initWithContainer:group:", self, v13);
  objc_msgSend(v3, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0CB3718], "_mapsui_activateLayouts:", v3);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceCompactTileContentView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  MUPlaceTileViewModel *v3;
  MUPlaceTileViewModel *viewModel;
  MUPlaceTileViewModel *v5;
  void *v6;
  MUPlaceTileViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  MUPlaceTileViewModel *v12;
  id v13;
  id location;

  if (-[MUPlaceTileCellConfiguration showIcon](self->_configuration, "showIcon"))
  {
    v3 = self->_viewModel;
    objc_initWeak(&location, self);
    viewModel = self->_viewModel;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__MUPlaceCompactTileContentView__updateAppearance__block_invoke;
    v11[3] = &unk_1E2E02F90;
    objc_copyWeak(&v13, &location);
    v5 = v3;
    v12 = v5;
    -[MUPlaceTileViewModel fetchBadgeIconWithCompletion:](viewModel, "fetchBadgeIconWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  -[MUPlaceTileViewModel tileName](self->_viewModel, "tileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_primaryLabel, "setText:", v6);

  -[MULabelViewProtocol setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", -[MUPlaceTileViewModel expectedNumberOfFooterLines](self->_viewModel, "expectedNumberOfFooterLines"));
  v7 = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](v7, "footerAttributedStringForFont:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_secondaryLabel, "setAttributedText:", v10);

}

void __50__MUPlaceCompactTileContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (WeakRetained[56] == *(id *)(a1 + 32))
      objc_msgSend(WeakRetained[52], "setImage:", v4);
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
  id v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_primaryLabel, "setFont:", v5);

  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileViewModel footerAttributedStringForFont:](viewModel, "footerAttributedStringForFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_secondaryLabel, "setAttributedText:", v8);

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
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  int v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double Height;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  _QWORD v33[2];
  CGSize result;
  CGRect v35;
  CGRect v36;

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "tileWidth");
  v11 = v10;
  v12 = objc_msgSend(v9, "showIcon");

  if (v12)
    v13 = 44.0;
  else
    v13 = 16.0;
  objc_msgSend(v7, "tileName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v7, "tileName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_mapkit_fontWithSymbolicTraits:", 0x8000);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v21);

    v35.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v22, v11 + -16.0 + -16.0);
    Height = CGRectGetHeight(v35);
    objc_msgSend(v8, "maxTitleHeight");
    if (Height < v24)
      v24 = Height;
    v13 = v13 + v24;

  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_mapkit_fontWithSymbolicTraits:", 0x8000);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerAttributedStringForFont:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "length"))
  {
    v36.origin.x = _calculateBoundingRectForAttributedStringWithHeight(v27, 1000.0);
    v13 = v13 + 8.0 + CGRectGetHeight(v36);
  }
  objc_msgSend(v8, "tileWidth");
  v29 = v28;

  v30 = v13 + 16.0;
  v31 = v29;
  result.height = v30;
  result.width = v31;
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
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
