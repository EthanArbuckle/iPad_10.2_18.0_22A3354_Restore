@implementation MUPunchoutView

- (MUPunchoutView)initWithFrame:(CGRect)a3
{
  MUPunchoutView *v3;
  MUPunchoutView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPunchoutView;
  v3 = -[MUPunchoutView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPunchoutView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PunchoutView"));
    -[MUPunchoutView _setupSubviews](v4, "_setupSubviews");
    -[MUPunchoutView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  MULabelViewProtocol *v3;
  MULabelViewProtocol *moreOnLabel;
  void *v5;
  UILabel *v6;
  UILabel *vendorNameLabel;
  void *v8;
  void *v9;
  void *v10;
  UILayoutGuide *v11;
  UILayoutGuide *layoutGuide;
  void *v13;
  id v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *spinner;
  UIButton *v17;
  UIButton *menuButton;

  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  moreOnLabel = self->_moreOnLabel;
  self->_moreOnLabel = v3;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_moreOnLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setTextColor:](self->_moreOnLabel, "setTextColor:", v5);

  -[MULabelViewProtocol setTextAlignment:](self->_moreOnLabel, "setTextAlignment:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_moreOnLabel, "setAccessibilityIdentifier:", CFSTR("ActionLabel"));
  -[MUPunchoutView addSubview:](self, "addSubview:", self->_moreOnLabel);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  vendorNameLabel = self->_vendorNameLabel;
  self->_vendorNameLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_vendorNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_vendorNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_vendorNameLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1420]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_vendorNameLabel, "setFont:", v9);

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_vendorNameLabel, "setTextColor:", v10);

  -[UILabel setTextAlignment:](self->_vendorNameLabel, "setTextAlignment:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_vendorNameLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[MUPunchoutView addSubview:](self, "addSubview:", self->_vendorNameLabel);
  v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v11;

  -[MUPunchoutView addLayoutGuide:](self, "addLayoutGuide:", self->_layoutGuide);
  +[MUInfoCardStyle punchoutButtonPlatterColor](MUInfoCardStyle, "punchoutButtonPlatterColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14 = objc_alloc(MEMORY[0x1E0DC3438]);
  v15 = (UIActivityIndicatorView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  spinner = self->_spinner;
  self->_spinner = v15;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  menuButton = self->_menuButton;
  self->_menuButton = v17;

  -[UIButton setShowsMenuAsPrimaryAction:](self->_menuButton, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setPreferredMenuElementOrder:](self->_menuButton, "setPreferredMenuElementOrder:", 2);
  -[UIButton setHidden:](self->_menuButton, "setHidden:", 1);
  -[UIButton setAccessibilityIdentifier:](self->_menuButton, "setAccessibilityIdentifier:", CFSTR("MenuButton"));
  -[MUPunchoutView addSubview:](self, "addSubview:", self->_menuButton);
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
  MUEdgeLayout *v41;
  void *v42;
  _QWORD v43[12];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v29 = (void *)MEMORY[0x1E0CB3718];
  v41 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_menuButton, self);
  v44[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_layoutGuide, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView centerYAnchor](self, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView leadingAnchor](self, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 16.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v35;
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView trailingAnchor](self, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v32;
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView topAnchor](self, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v28;
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView bottomAnchor](self, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v25;
  -[MULabelViewProtocol leadingAnchor](self->_moreOnLabel, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v22;
  -[MULabelViewProtocol topAnchor](self->_moreOnLabel, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v19;
  -[MULabelViewProtocol trailingAnchor](self->_moreOnLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v16;
  -[MULabelViewProtocol bottomAnchor](self->_moreOnLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_vendorNameLabel, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, -5.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v13;
  -[UILabel leadingAnchor](self->_vendorNameLabel, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol leadingAnchor](self->_moreOnLabel, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v5;
  -[UILabel trailingAnchor](self->_vendorNameLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol trailingAnchor](self->_moreOnLabel, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v8;
  -[UILabel bottomAnchor](self->_vendorNameLabel, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_mapsui_activateLayouts:constraints:", v42, v12);

}

- (id)_attributedStringFromSymbol
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[MUPunchoutViewModel symbolName](self->_viewModel, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[MUPunchoutViewModel symbolName](self->_viewModel, "symbolName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("arrow.up.forward.fill");
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v8, "setImage:", v7);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v16 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1438]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));

  v14 = (void *)objc_msgSend(v10, "copy");
  return v14;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_intrinsicWidth");
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)_intrinsicWidth
{
  return 106.0;
}

- (void)beginAnimatingActivityIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[MUPunchoutView _updateLabelsWithAlpha:](self, "_updateLabelsWithAlpha:", 0.0);
  -[MUPunchoutView addSubview:](self, "addSubview:", self->_spinner);
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPunchoutView centerYAnchor](self, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v10);

}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating", a3);
  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  -[MUPunchoutView _updateLabelsWithAlpha:](self, "_updateLabelsWithAlpha:", 1.0);
}

- (void)_updateLabelsWithAlpha:(double)a3
{
  -[MULabelViewProtocol setAlpha:](self->_moreOnLabel, "setAlpha:");
  -[UILabel setAlpha:](self->_vendorNameLabel, "setAlpha:", a3);
}

- (void)setViewModel:(id)a3
{
  MUPunchoutViewModel *v5;
  MUPunchoutViewModel *v6;

  v5 = (MUPunchoutViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPunchoutView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MUPunchoutView _attributedStringFromSymbol](self, "_attributedStringFromSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_moreOnLabel, "setAttributedText:", v3);

  -[MUPunchoutViewModel punchoutText](self->_viewModel, "punchoutText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_vendorNameLabel, "setText:", v4);

  -[MUPunchoutViewModel menu](self->_viewModel, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](self->_menuButton, "setMenu:", v5);

  -[MUPunchoutViewModel menu](self->_viewModel, "menu");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setHidden:](self->_menuButton, "setHidden:", v6 == 0);

}

- (MUPunchoutViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_vendorNameLabel, 0);
  objc_storeStrong((id *)&self->_moreOnLabel, 0);
}

@end
