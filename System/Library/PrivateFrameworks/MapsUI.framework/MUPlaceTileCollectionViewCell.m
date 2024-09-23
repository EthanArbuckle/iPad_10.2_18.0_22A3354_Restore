@implementation MUPlaceTileCollectionViewCell

- (UIImageView)tileImageView
{
  return (UIImageView *)-[MUPlaceTileTemplateView tileImageView](self->_tileContentView, "tileImageView");
}

- (void)setViewModel:(id)a3
{
  -[MUPlaceTileTemplateView setViewModel:](self->_tileContentView, "setViewModel:", a3);
}

- (MUPlaceTileViewModel)viewModel
{
  return (MUPlaceTileViewModel *)-[MUPlaceTileTemplateView viewModel](self->_tileContentView, "viewModel");
}

- (void)setCellConfiguration:(id)a3
{
  MUPlaceTileCellConfiguration *cellConfiguration;
  MUPlaceTileCellConfiguration *v5;
  MUPlaceTileCellConfiguration *v6;
  MUPlaceTileCellConfiguration *v7;
  id v8;

  v8 = a3;
  if ((-[MUPlaceTileCellConfiguration isEqual:](self->_cellConfiguration, "isEqual:") & 1) == 0)
  {
    cellConfiguration = self->_cellConfiguration;
    v5 = (MUPlaceTileCellConfiguration *)v8;
    v6 = self->_cellConfiguration;
    self->_cellConfiguration = v5;
    v7 = cellConfiguration;

    -[MUPlaceTileCollectionViewCell _updateTemplateViewWithOldCellConfiguration:](self, "_updateTemplateViewWithOldCellConfiguration:", v7);
  }

}

- (void)_updateTemplateViewWithOldCellConfiguration:(id)a3
{
  unint64_t v4;
  MUPlaceTileTemplateView *v5;
  MUPlaceTileTemplateView *tileContentView;
  MUPlaceTileTemplateView *v7;
  void *v8;
  void *v9;
  MUEdgeLayout *v10;
  void *v11;
  MUEdgeLayout *v12;

  -[MUPlaceTileTemplateView removeFromSuperview](self->_tileContentView, "removeFromSuperview", a3);
  v4 = -[MUPlaceTileCellConfiguration variant](self->_cellConfiguration, "variant");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = (MUPlaceTileTemplateView *)objc_msgSend(objc_alloc(*off_1E2E02FB0[v4]), "initWithCellConfiguration:", self->_cellConfiguration);
  tileContentView = self->_tileContentView;
  self->_tileContentView = v5;
  v7 = v5;

  -[MUPlaceTileCollectionViewCell viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTileTemplateView setViewModel:](v7, "setViewModel:", v8);

  -[MUPlaceTileCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  v10 = [MUEdgeLayout alloc];
  -[MUPlaceTileCollectionViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MUEdgeLayout initWithItem:container:](v10, "initWithItem:container:", v7, v11);

  -[MUConstraintLayout activate](v12, "activate");
  -[MUPlaceTileCollectionViewCell _updateAccessoryViewsForCurrentCellConfiguration](self, "_updateAccessoryViewsForCurrentCellConfiguration");
}

- (void)_updateAccessoryViewsForCurrentCellConfiguration
{
  -[UIImageView setHidden:](self->_selectionBadgeView, "setHidden:", 1);
  if (!-[MUPlaceTileCellConfiguration variant](self->_cellConfiguration, "variant"))
    -[MUPlaceTileCollectionViewCell _addSelectionBadgeIfNeeded](self, "_addSelectionBadgeIfNeeded");
}

- (void)_addSelectionBadgeIfNeeded
{
  UIImageView *selectionBadgeView;
  id v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  MUSizeLayout *v12;
  MUBoxLayout *v13;
  void *v14;
  MUBoxLayout *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (-[MUPlaceTileCellConfiguration showSelectionControlWhileEditing](self->_cellConfiguration, "showSelectionControlWhileEditing"))
  {
    selectionBadgeView = self->_selectionBadgeView;
    if (!selectionBadgeView)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3890]);
      v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v6 = self->_selectionBadgeView;
      self->_selectionBadgeView = v5;

      -[UIImageView setAccessibilityIdentifier:](self->_selectionBadgeView, "setAccessibilityIdentifier:", CFSTR("PlaceTileSelectionBadge"));
      -[UIImageView setHidden:](self->_selectionBadgeView, "setHidden:", 1);
      selectionBadgeView = self->_selectionBadgeView;
    }
    -[UIImageView superview](selectionBadgeView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceTileCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceTileCollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = self->_selectionBadgeView;
    if (v7 == v8)
    {
      objc_msgSend(v9, "bringSubviewToFront:", v11);
    }
    else
    {
      objc_msgSend(v9, "addSubview:", v11);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_selectionBadgeView, 24.0, 24.0);
      objc_msgSend(v10, "addObject:", v12);
      v13 = [MUBoxLayout alloc];
      -[MUPlaceTileCollectionViewCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MUBoxLayout initWithContainer:](v13, "initWithContainer:", v14);

      v17[0] = self->_selectionBadgeView;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUBoxLayout setArrangedLayoutItems:](v15, "setArrangedLayoutItems:", v16);

      -[MUBoxLayout setHorizontalAlignment:](v15, "setHorizontalAlignment:", 3);
      -[MUBoxLayout setVerticalAlignment:](v15, "setVerticalAlignment:", 1);
      -[MUBoxLayout setOffset:forArrangedLayoutItem:](v15, "setOffset:forArrangedLayoutItem:", self->_selectionBadgeView, -16.0, 16.0);
      objc_msgSend(v10, "addObject:", v15);
      objc_msgSend(MEMORY[0x1E0CB3718], "_mapsui_activateLayouts:", v10);

    }
    -[MUPlaceTileCollectionViewCell _updateSelectionBadgeState](self, "_updateSelectionBadgeState");
  }
}

- (void)_updateSelectionBadgeState
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[MUPlaceTileCellConfiguration showSelectionControlWhileEditing](self->_cellConfiguration, "showSelectionControlWhileEditing"))
  {
    -[MUPlaceTileCollectionViewCell configurationState](self, "configurationState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEditing");

    if (v4)
    {
      -[MUPlaceTileCollectionViewCell configurationState](self, "configurationState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isSelected");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageWithRenderingMode:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_accentColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageWithRenderingMode:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithTintColor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_selectionBadgeView, "setImage:", v10);

    }
    -[UIImageView setHidden:](self->_selectionBadgeView, "setHidden:", v4 ^ 1u);
  }
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __objc2_class *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "variant");
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      v11 = MUPlaceCompactTileContentView;
      goto LABEL_6;
    }
    if (v10)
    {
      v13 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_8;
    }
  }
  v11 = MUPlaceTileContentView;
LABEL_6:
  -[__objc2_class preferredSizeForViewModels:cellConfiguration:usingMeasurements:](v11, "preferredSizeForViewModels:cellConfiguration:usingMeasurements:", v7, v8, v9);
  v13 = v12;
  v15 = v14;
LABEL_8:

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (MUPlaceTileCellConfiguration)cellConfiguration
{
  return self->_cellConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConfiguration, 0);
  objc_storeStrong((id *)&self->_selectionBadgeView, 0);
  objc_storeStrong((id *)&self->_tileContentView, 0);
}

@end
