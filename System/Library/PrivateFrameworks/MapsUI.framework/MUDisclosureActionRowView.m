@implementation MUDisclosureActionRowView

- (MUDisclosureActionRowView)initWithFrame:(CGRect)a3
{
  MUDisclosureActionRowView *v3;
  MUDisclosureActionRowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUDisclosureActionRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUDisclosureActionRowView _setupSubviews](v3, "_setupSubviews");
    -[MUDisclosureActionRowView _setupConstraints](v4, "_setupConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)_setupSubviews
{
  UILayoutGuide *v3;
  UILayoutGuide *titleValueLayoutGuide;
  UILabel *v5;
  UILabel *titleLabel;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  UIImageView *v11;
  UIImageView *imageView;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *disclosureView;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UITapGestureRecognizer *v24;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  -[MUDisclosureActionRowView addLayoutGuide:](self, "addLayoutGuide:", self->_titleValueLayoutGuide);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

  +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v9);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[MUDisclosureActionRowView addSubview:](self, "addSubview:", self->_titleLabel);
  v10 = objc_alloc(MEMORY[0x1E0DC3890]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v11;

  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v13);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUDisclosureActionRowView addSubview:](self, "addSubview:", self->_imageView);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UIImageView *)objc_msgSend(v15, "initWithImage:", v16);
  disclosureView = self->_disclosureView;
  self->_disclosureView = v17;

  -[UIImageView setAccessibilityIdentifier:](self->_disclosureView, "setAccessibilityIdentifier:", CFSTR("DisclosureView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_disclosureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_disclosureView, "setTintColor:", v19);

  LODWORD(v20) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_disclosureView, "setContentHuggingPriority:forAxis:", 0, v20);
  LODWORD(v21) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_disclosureView, "setContentHuggingPriority:forAxis:", 1, v21);
  LODWORD(v22) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_disclosureView, "setContentCompressionResistancePriority:forAxis:", 0, v22);
  LODWORD(v23) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_disclosureView, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  -[MUDisclosureActionRowView addSubview:](self, "addSubview:", self->_disclosureView);
  -[MKViewWithHairline setLeftHairlineInset:](self, "setLeftHairlineInset:", 56.0);
  v24 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v24;

  -[MUDisclosureActionRowView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__buttonCellTapped);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__buttonCellTapped);
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)-[MUDisclosureActionRowView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v27, sel__updateForPlatterAvailability);

}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *imageWidthConstraint;
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
  _QWORD v47[16];

  v47[14] = *MEMORY[0x1E0C80C00];
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDisclosureActionRowView _imageWidth](self, "_imageWidth");
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v4;

  v31 = (void *)MEMORY[0x1E0CB3718];
  v47[0] = self->_imageWidthConstraint;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v44;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDisclosureActionRowView leadingAnchor](self, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v41;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_titleValueLayoutGuide, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v38;
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v35;
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDisclosureActionRowView topAnchor](self, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v32;
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDisclosureActionRowView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v28;
  -[UIImageView leadingAnchor](self->_disclosureView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 8.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v25;
  -[UIImageView trailingAnchor](self->_disclosureView, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUDisclosureActionRowView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -16.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v22;
  -[UIImageView centerYAnchor](self->_disclosureView, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_titleValueLayoutGuide, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v19;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v16;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v8;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v11;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v15);

}

- (double)_imageWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
}

- (void)setViewModel:(id)a3
{
  MUDisclosureActionViewModelProviding *v5;
  MUDisclosureActionViewModelProviding *v6;

  v5 = (MUDisclosureActionViewModelProviding *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUDisclosureActionRowView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  id v5;

  -[MUDisclosureActionViewModelProviding titleString](self->_viewModel, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel set_mapsui_text:](self->_titleLabel, "set_mapsui_text:", v3);

  -[MUDisclosureActionViewModelProviding image](self->_viewModel, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

  -[MUDisclosureActionViewModelProviding imageTintColor](self->_viewModel, "imageTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v5);

}

- (void)_buttonCellTapped
{
  void *v3;
  void (**v4)(id, MUDisclosureActionRowView *);

  -[MUDisclosureActionViewModelProviding actionBlock](self->_viewModel, "actionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUDisclosureActionViewModelProviding actionBlock](self->_viewModel, "actionBlock");
    v4 = (void (**)(id, MUDisclosureActionRowView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)_contentSizeDidChange
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  -[MUDisclosureActionRowView _imageWidth](self, "_imageWidth");
  -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  -[MUPlaceSectionRowView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  -[MUPlaceSectionRowView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  -[MUPlaceSectionRowView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (MUDisclosureActionViewModelProviding)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end
