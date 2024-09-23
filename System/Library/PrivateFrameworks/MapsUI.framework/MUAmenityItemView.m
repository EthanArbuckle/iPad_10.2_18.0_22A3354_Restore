@implementation MUAmenityItemView

- (MUAmenityItemView)initWithFrame:(CGRect)a3
{
  MUAmenityItemView *v3;
  MUAmenityItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUAmenityItemView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUAmenityItemView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("AmenityItem"));
    -[MUAmenityItemView _setupSubviews](v4, "_setupSubviews");
    -[MUAmenityItemView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  UIImageView *v3;
  UIImageView *imageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MULabelViewProtocol *v10;
  MULabelViewProtocol *titleLabel;
  void *v12;
  void *v13;
  id v14;

  _createAmenityImageView();
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  self->_imageView = v3;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  v5 = self->_imageView;
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:scale:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v5, "setPreferredSymbolConfiguration:", v9);

  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("AmenityItemImage"));
  -[MUAmenityItemView addSubview:](self, "addSubview:", self->_imageView);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v10 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bodyFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_titleLabel, "setFont:", v13);

  -[MULabelViewProtocol setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("AmenityItemTitle"));
  -[MUAmenityItemView addSubview:](self, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *imageWidthConstraint;
  NSLayoutConstraint *v8;
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
  _QWORD v32[10];

  v32[8] = *MEMORY[0x1E0C80C00];
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 24.0);
  objc_msgSend(v3, "constraintEqualToConstant:");
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v6;

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView leadingAnchor](self, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView topAnchor](self, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView bottomAnchor](self, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_imageWidthConstraint;
  v32[2] = v23;
  v32[3] = v8;
  -[MULabelViewProtocol leadingAnchor](self->_titleLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v19;
  -[MULabelViewProtocol trailingAnchor](self->_titleLabel, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v11;
  -[MULabelViewProtocol topAnchor](self->_titleLabel, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView topAnchor](self, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v14;
  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v18);

}

- (void)setViewModel:(id)a3
{
  MUAmenityItemViewModel *v5;
  MUAmenityItemViewModel *v6;

  v5 = (MUAmenityItemViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUAmenityItemView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  UIImageView *imageView;
  MUAmenityItemViewModel *viewModel;
  void *v6;
  void *v7;
  id v8;

  -[MUAmenityItemViewModel displayTitle](self->_viewModel, "displayTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", v3);

  imageView = self->_imageView;
  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUAmenityItemViewModel symbolImageForFont:](viewModel, "symbolImageForFont:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v7);

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_titleLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 24.0);
  -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");

}

- (MUAmenityItemViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
