@implementation MUNearestStationRowView

- (MUNearestStationRowView)initWithFrame:(CGRect)a3
{
  MUNearestStationRowView *v3;
  MUNearestStationRowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUNearestStationRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUNearestStationRowView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("MUNearestStationRowView"));
    -[MUNearestStationRowView _setupSubviews](v4, "_setupSubviews");
    -[MUNearestStationRowView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)configureWithNearestStation:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_nearestStation != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_nearestStation, a3);
    -[MUNearestStationRowView _updateAppearance](self, "_updateAppearance");
    -[MULoadingOverlayController removeLoadingOverlayAnimated:completion:](self->_loadingOverlayController, "removeLoadingOverlayAnimated:completion:", 1, 0);
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  UIStackView *labelStackView;
  void *v7;
  id v8;

  -[MKMapItem artworkImage](self->_nearestStation, "artworkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_stopImageView, "setImage:", v3);

  -[MKMapItem stationTitle](self->_nearestStation, "stationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

  -[MKMapItem stationCategory](self->_nearestStation, "stationCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_secondaryLabel, "setText:", v5);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "addObject:", self->_titleLabel);
  objc_msgSend(v8, "addObject:", self->_secondaryLabel);
  objc_msgSend(v8, "addObject:", self->_tertiaryLabel);
  labelStackView = self->_labelStackView;
  v7 = (void *)objc_msgSend(v8, "copy");
  -[UIStackView _mapsui_setArrangedSubviews:](labelStackView, "_mapsui_setArrangedSubviews:", v7);

}

- (void)_setupSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *v8;
  UIImageView *stopImageView;
  UIStackView *v10;
  UIStackView *labelStackView;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  UILabel *secondaryLabel;
  void *v16;
  UILabel *v17;
  UILabel *tertiaryLabel;
  void *v19;
  MULoadingOverlayController *v20;
  MULoadingOverlayController *loadingOverlayController;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  stopImageView = self->_stopImageView;
  self->_stopImageView = v8;

  -[UIImageView setAccessibilityIdentifier:](self->_stopImageView, "setAccessibilityIdentifier:", CFSTR("StopImageView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_stopImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView _mapsui_setCardCorner](self->_stopImageView, "_mapsui_setCardCorner");
  -[MUNearestStationRowView addSubview:](self, "addSubview:", self->_stopImageView);
  v10 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v4, v5, v6, v7);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v10;

  -[UIStackView setAccessibilityIdentifier:](self->_labelStackView, "setAccessibilityIdentifier:", CFSTR("LabelStackView"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_labelStackView, "setSpacing:", 2.0);
  -[UIStackView setAxis:](self->_labelStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_labelStackView, "setDistribution:", 4);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v12 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v14;

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v17;

  -[UILabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tertiaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_tertiaryLabel, "setTextColor:", v19);

  -[MUNearestStationRowView _updateFonts](self, "_updateFonts");
  -[MUNearestStationRowView addSubview:](self, "addSubview:", self->_labelStackView);
  v20 = -[MULoadingOverlayController initWithParentView:contentView:]([MULoadingOverlayController alloc], "initWithParentView:contentView:", self, self);
  loadingOverlayController = self->_loadingOverlayController;
  self->_loadingOverlayController = v20;

  -[MULoadingOverlayController attachLoadingOverlay](self->_loadingOverlayController, "attachLoadingOverlay");
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)-[MUNearestStationRowView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v23, sel__updateFonts);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[12];

  v34[10] = *MEMORY[0x1E0C80C00];
  v22 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView leadingAnchor](self->_labelStackView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView leadingAnchor](self, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v31;
  -[UIStackView topAnchor](self->_labelStackView, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v28;
  -[UIStackView bottomAnchor](self->_labelStackView, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView bottomAnchor](self, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v25;
  -[UIStackView trailingAnchor](self->_labelStackView, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_stopImageView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -8.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  -[UIImageView topAnchor](self->_stopImageView, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView topAnchor](self, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v19, 16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v18;
  -[UIImageView bottomAnchor](self->_stopImageView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:constant:", v16, -16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v15;
  -[UIImageView centerYAnchor](self->_stopImageView, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v3;
  -[UIImageView trailingAnchor](self->_stopImageView, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUNearestStationRowView trailingAnchor](self, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v6;
  -[UIImageView widthAnchor](self->_stopImageView, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 48.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v8;
  -[UIImageView heightAnchor](self->_stopImageView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_stopImageView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v12);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUNearestStationRowView;
  -[MKViewWithHairline layoutSubviews](&v3, sel_layoutSubviews);
  -[MULoadingOverlayController updateLayoutForBoundsChange](self->_loadingOverlayController, "updateLayoutForBoundsChange");
}

- (void)setDistanceString:(id)a3
{
  -[UILabel setText:](self->_tertiaryLabel, "setText:", a3);
}

- (NSString)distanceString
{
  return -[UILabel text](self->_tertiaryLabel, "text");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  v5 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_tertiaryLabel, "setFont:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_stopImageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
