@implementation MUPhotoTileView

- (MUPhotoTileView)initWithFrame:(CGRect)a3
{
  MUPhotoTileView *v3;
  MUPhotoTileView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPhotoTileView;
  v3 = -[MUPhotoTileView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPhotoTileView _setupSubviews](v3, "_setupSubviews");
    -[MUPhotoTileView _setupConstraints](v4, "_setupConstraints");
    -[MUPhotoTileView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("PhotoTile"));
  }
  return v4;
}

- (void)_setupSubviews
{
  MUImageView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  MUImageView *v8;
  MUImageView *imageView;
  void *v10;
  void *v11;
  MUGradientView *v12;
  MUGradientView *titleGradientView;
  void *v14;
  uint64_t v15;
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
  UILabel *v26;
  UILabel *titleLabel;
  void *v28;
  void *v29;
  void *v30;
  MUBadgeView *v31;
  MUBadgeView *vendorBadge;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v3 = [MUImageView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[MUImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  imageView = self->_imageView;
  self->_imageView = v8;

  -[MUImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  +[MUInfoCardStyle punchoutButtonPlatterColor](MUInfoCardStyle, "punchoutButtonPlatterColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.fill.on.rectangle.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageView setFallbackImage:](self->_imageView, "setFallbackImage:", v11);

  -[UIView _mapsui_setCardCorner](self->_imageView, "_mapsui_setCardCorner");
  -[MUPhotoTileView addSubview:](self, "addSubview:", self->_imageView);
  v12 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
  titleGradientView = self->_titleGradientView;
  self->_titleGradientView = v12;

  -[MUGradientView setClipsToBounds:](self->_titleGradientView, "setClipsToBounds:", 1);
  -[MUGradientView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleGradientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUGradientView layer](self->_titleGradientView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaskedCorners:", 3);

  v15 = *MEMORY[0x1E0CD2A68];
  -[MUGradientView layer](self->_titleGradientView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerCurve:", v15);

  -[MUGradientView layer](self->_titleGradientView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 10.0);

  -[MUGradientView setUserInteractionEnabled:](self->_titleGradientView, "setUserInteractionEnabled:", 0);
  -[_MKGradientView setStartPoint:](self->_titleGradientView, "setStartPoint:", 0.5, 0.0);
  -[_MKGradientView setEndPoint:](self->_titleGradientView, "setEndPoint:", 0.5, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v19;
  v34[1] = v21;
  v34[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKGradientView setColors:](self->_titleGradientView, "setColors:", v24);

  v33[0] = &unk_1E2E55E20;
  v33[1] = &unk_1E2E55E30;
  v33[2] = &unk_1E2E55E40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKGradientView setLocations:](self->_titleGradientView, "setLocations:", v25);

  -[MUPhotoTileView addSubview:](self, "addSubview:", self->_titleGradientView);
  v26 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v26;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v28);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v30);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PhotoTileTitle"));
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[MUGradientView addSubview:](self->_titleGradientView, "addSubview:", self->_titleLabel);
  v31 = -[MUBadgeView initWithFrame:]([MUBadgeView alloc], "initWithFrame:", v4, v5, v6, v7);
  vendorBadge = self->_vendorBadge;
  self->_vendorBadge = v31;

  -[MUBadgeView setTranslatesAutoresizingMaskIntoConstraints:](self->_vendorBadge, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUBadgeView setAccessibilityIdentifier:](self->_vendorBadge, "setAccessibilityIdentifier:", CFSTR("PhotoTileVendorBadge"));
  -[MUPhotoTileView addSubview:](self, "addSubview:", self->_vendorBadge);
  -[UIView _mapsui_setCardCorner](self, "_mapsui_setCardCorner");

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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[18];

  v52[16] = *MEMORY[0x1E0C80C00];
  v33 = (void *)MEMORY[0x1E0CB3718];
  -[MUImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView leadingAnchor](self, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v49;
  -[MUImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView trailingAnchor](self, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v46;
  -[MUImageView topAnchor](self->_imageView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView topAnchor](self, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v43;
  -[MUImageView bottomAnchor](self->_imageView, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView bottomAnchor](self, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v40;
  -[MUGradientView leadingAnchor](self->_titleGradientView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView leadingAnchor](self, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v37;
  -[MUGradientView topAnchor](self->_titleGradientView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView topAnchor](self, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v34;
  -[MUGradientView trailingAnchor](self->_titleGradientView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v30;
  -[MUGradientView heightAnchor](self->_titleGradientView, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 90.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v28;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView leadingAnchor](self->_titleGradientView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v25;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView topAnchor](self->_titleGradientView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 14.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v22;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView trailingAnchor](self->_titleGradientView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", v20, -16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v19;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView bottomAnchor](self->_titleGradientView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", v17, -16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v16;
  -[MUBadgeView topAnchor](self->_vendorBadge, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView bottomAnchor](self->_titleGradientView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v14, 8.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v13;
  -[MUBadgeView leadingAnchor](self->_vendorBadge, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v4, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v5;
  -[MUBadgeView bottomAnchor](self->_vendorBadge, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView bottomAnchor](self, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v8;
  -[MUBadgeView trailingAnchor](self->_vendorBadge, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v12);

}

- (UIImageView)contentImageView
{
  return -[MUImageView contentImageView](self->_imageView, "contentImageView");
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPhotoTileViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPhotoTileView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)setPhotoOverlay:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPhotoTileOverlay isEqual:](self->_photoOverlay, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoOverlay, a3);
    -[MUPhotoTileView _updateOverlay](self, "_updateOverlay");
  }

}

- (void)_updateOverlay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MUPhotoTileOverlay tileTitle](self->_photoOverlay, "tileTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  -[MUPhotoTileOverlay attributionTitle](self->_photoOverlay, "attributionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUBadgeView setBadgeString:](self->_vendorBadge, "setBadgeString:", v4);

  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUGradientView setHidden:](self->_titleGradientView, "setHidden:", objc_msgSend(v5, "length") == 0);

  -[MUBadgeView badgeString](self->_vendorBadge, "badgeString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUBadgeView setHidden:](self->_vendorBadge, "setHidden:", objc_msgSend(v6, "length") == 0);

}

- (void)_updateAppearance
{
  MUPhotoTileViewModel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  MUPhotoTileViewModel *viewModel;
  _QWORD v15[4];
  MUPhotoTileViewModel *v16;
  id v17;
  id location;

  -[MUImageView setImage:](self->_imageView, "setImage:", 0);
  v3 = self->_viewModel;
  -[MUPhotoTileView targetFrameSize](self, "targetFrameSize");
  v6 = v5;
  v7 = v4;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v5 == *MEMORY[0x1E0C9D820] && v4 == v9)
  {
    -[MUPhotoTileView frame](self, "frame");
    v6 = v11;
    v7 = v12;
  }
  if (v6 != v8 || v7 != v9)
  {
    objc_initWeak(&location, self);
    viewModel = self->_viewModel;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __36__MUPhotoTileView__updateAppearance__block_invoke;
    v15[3] = &unk_1E2E02F90;
    objc_copyWeak(&v17, &location);
    v16 = v3;
    -[MUPhotoTileViewModel configureWithSize:imageProvider:](viewModel, "configureWithSize:imageProvider:", v15, v6, v7);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __36__MUPhotoTileView__updateAppearance__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 60) == *(_QWORD *)(a1 + 32))
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 52);
    if (v9)
      objc_msgSend(v8, "setImage:animated:", v9, a4 ^ 1u);
    else
      objc_msgSend(v8, "setImage:");
  }

}

- (CGSize)targetFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetFrameSize.width;
  height = self->_targetFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetFrameSize:(CGSize)a3
{
  self->_targetFrameSize = a3;
}

- (MUPhotoTileOverlay)photoOverlay
{
  return self->_photoOverlay;
}

- (MUPhotoTileViewModel)viewModel
{
  return self->_viewModel;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_photoOverlay, 0);
  objc_storeStrong((id *)&self->_yourPhotosViewLabel, 0);
  objc_storeStrong((id *)&self->_yourPhotosImageView, 0);
  objc_storeStrong((id *)&self->_yourPhotosView, 0);
  objc_storeStrong((id *)&self->_titleGradientView, 0);
  objc_storeStrong((id *)&self->_vendorBadge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
